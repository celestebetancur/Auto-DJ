//
//  Loop.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Modified 24/06/15.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//

CHmUsiCK extractor;

Sync sync;
sync.sync(CHmUsiCK.MEASURE, Sync.NUMMEASURES);

Machine.add(me.dir()+"/LiveCode.ck") => int fileID;

<<<"Eight (8) seconds wait...">>>;

8::second => now;

spork~loopTrigger();
spork~beatCounter();

while(true){1::second => now;}

public int loopTrigger()
{
    while(true)
    { 
        if(Machine.replace(fileID,me.dir()+"/LiveCode.ck") == true)
        {
            Machine.remove(fileID);
            Machine.add(me.dir()+"/LiveCode.ck") => int fileID;
        }
        (extractor.convert(CHmUsiCK.TEMPO) * Sync.tSync) => now;
    }
    return fileID;
}

public static int beatCounter()
{
    while(true)
    {
        STATIC.BEATS++;
        //<<<STATIC.BEATS, "Beats">>>; //uncomment to see # of beats
        
        measureCounter();
        phraseCounter();
        
        extractor.convert(extractor.tempo(extractor.TEMPO)) => now;
    }
    return STATIC.BEATS;
}

public static int measureCounter()
{
    if(STATIC.BEATS % CHmUsiCK.MEASURE == 0)
    {
        STATIC.MEASURES++;
        //<<<STATIC.MEASURES, "Measures">>>; //uncomment to see # of measures
    }
    return STATIC.MEASURES;
}

public static int phraseCounter()
{
    if(STATIC.BEATS % (Sync.NUMMEASURES * CHmUsiCK.MEASURE) == 0)
    {
        STATIC.PHRASES++;
        //<<<STATIC.PHRASES, "Phrases">>>; //uncomment to see # of phrases
    }
    return STATIC.PHRASES;
}
