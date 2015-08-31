//
//  DrumClass.ck
//  Auto DJ
//
//  Created by Esteban Betancur on 18/10/14 
//  Modified on 19/11/14.
//  Modified for Auto DJ 28/08/15
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//
public class Drum extends CHmUsiCK
{   
    FileIO rythyms;
    BeatsDB BDB;
    
    rythyms.open(me.dir() + "/favoriteRythyms.txt", FileIO.READ);
    
    Gain Normalize => Gain vol => Master;
    
    0.55 => Normalize.gain; //don't change this
    
    SndBuf Kick[8]; SndBuf Snare[12]; SndBuf HH[9];
    
    //——————samples for bass drum——————//
    me.dir() + "/Drum Kits/Electronica/Kick_Electronica (1).wav" => Kick[0].read; 
    me.dir() + "/Drum Kits/Electronica/Kick_Electronica (2).wav" => Kick[1].read; 
    me.dir() + "/Drum Kits/Electronica/Kick_Electronica (3).wav" => Kick[2].read; 
    me.dir() + "/Drum Kits/Hip Hop/Kick (1).wav" => Kick[3].read;
    me.dir() + "/Drum Kits/Hip Hop/Kick (2).wav" => Kick[4].read;
    me.dir() + "/Drum Kits/Hip Hop/Kick (3).wav" => Kick[5].read;
    me.dir() + "/Drum Kits/Vintage Drum/kick a.wav" => Kick[6].read;
    me.dir() + "/Drum Kits/Vintage Drum/kick b.wav" => Kick[7].read;
    //——————samples for snare drum—————//
    me.dir() + "/Drum Kits/Electronica/Claps and Snare_Electronica (1).wav" => Snare[0].read;
    me.dir() + "/Drum Kits/Electronica/Claps and Snare_Electronica (2).wav" => Snare[1].read;
    me.dir() + "/Drum Kits/Electronica/Claps and Snare_Electronica (3).wav" => Snare[2].read;
    me.dir() + "/Drum Kits/Electronica/Claps_Electronica (1).wav"=> Snare[3].read;
    me.dir() + "/Drum Kits/Electronica/Claps_Electronica (2).wav"=> Snare[4].read;
    me.dir() + "/Drum Kits/Electronica/Claps_Electronica (3).wav"=> Snare[5].read;
    me.dir() + "/Drum Kits/Hip Hop/Snare - Clap (1).wav" => Snare[6].read;
    me.dir() + "/Drum Kits/Hip Hop/Snare - Clap (2).wav" => Snare[7].read;
    me.dir() + "/Drum Kits/Hip Hop/Snare - Clap (3).wav" => Snare[8].read;
    me.dir() + "/Drum Kits/Hip Hop/Snare - Clap (4).wav" => Snare[9].read;
    me.dir() + "/Drum Kits/Vintage Drum/snare a.wav" => Snare[10].read;
    me.dir() + "/Drum Kits/Vintage Drum/snare b.wav" => Snare[11].read;
    //——————sample for hhSounds—————————//
    me.dir() + "/Drum Kits/Electronica/Hit_Hat_Electronica (1).wav" => HH[0].read;
    me.dir() + "/Drum Kits/Electronica/Hit_Hat_Electronica (2).wav" => HH[1].read;
    me.dir() + "/Drum Kits/Electronica/Hit_Hat_Electronica (3).wav" => HH[2].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat - Shaker (1).wav" => HH[3].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat - Shaker (2).wav" => HH[4].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat - Shaker (3).wav" => HH[5].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat (1).wav" => HH[6].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat (2).wav" => HH[7].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat (3).wav" => HH[8].read;
    
    for(0 => int i; i < Kick.cap(); i++)
    {
        Kick[i] => Normalize;
        Kick[i].samples() => Kick[i].pos;
    }
    for(0 => int i; i < Snare.cap(); i++)
    { 
        Snare[i] => Normalize;
        Snare[i].samples() => Snare[i].pos;
    }
    for(0 => int i; i < HH.cap(); i++)
    {   
        HH[i] => Normalize;
        HH[i].samples() => HH[i].pos;
    }
    
    7 => int Refill;

    4 => int bdSound;
    9 => int snSound;
    8 => int hhSound;

    8 => int Division;
    
    [1] @=> int hhGlobal[];
    [1] @=> int snGlobal[];
    [1] @=> int bdGlobal[];
    
    int rythym[0][0];
    
    public float gain(float volum)
    {
        volum => vol.gain;
        return vol.gain();
    }
    public float gain()
    {
        return vol.gain();
    }
    public int subdivision(int div)
    {
        div => Division;
        return Division;
    }
    public int subdivision()
    {
        return subdivision(Division);
    }
    public int BDSound(int num)
    {
        num => bdSound;
        return bdSound;
    }
    public int BDSound()
    {
        return BDSound(bdSound);
    }
    public int SNSound(int num)
    {
        num => snSound;
        return snSound;
    }
    public int SNSound()
    {
        return SNSound(snSound);
    }
    public int HHSound(int num)
    {
        num => hhSound;
        return hhSound;
    }
    public int HHSound()
    {
        return HHSound(hhSound);
    }
    public int fillEach(int refillC)
    {
        refillC => Refill;
        return Refill;
    }
    public int fillEach()
    {
        return fillEach(Refill);
    }
    public Tuple favorite(string name)
    {
        return BDB.beat(name);
    }
    /* 
    private void saveFavorite(int k[], int sn[], int hh[])
    {
        rythyms.open(me.dir() + "/favoriteRythyms.txt", FileIO.WRITE);
        rythyms.size() => rythyms.seek;
        
        for(0 => int i; i < Array.Drum.cap(); i++)
        {
            for(0 => int ii; ii < Array.Drum[i].cap(); ii++)
            {
                for(0 => int iii; iii < Array.Drum[i][ii].cap(); iii++)
                {
                    rythyms <= Array.Drum[i][ii][iii];
                    rythyms <= " ";
                }
            }
            rythyms <= "\n";
            //Std.system("cat favoriteRythyms.txt >> CorpusBuild/KSHHDataBase.txt");
        }
        rythyms.close();
    }*/
    private void event(int k[],int sn[] ,int hh[])
    {   
        //saveFavorite(k,sn,hh);
        [k,sn,hh] @=> rythym;
        
        Hid hi;
        HidMsg msg;
        
        0 => int device;
        
        if( me.args() ) me.arg(0) => Std.atoi => device;
        
        if( !hi.openKeyboard( device ) ) me.exit();
        <<<"Press -?- key to save random to favorites">>>;
        
        while (true)
        {
            hi => now;
            
            while( hi.recv( msg ) )
            {
                if( msg.isButtonDown())
                {
                    if( msg.which == 45)
                    {
                        //saveFavorite(k,sn,hh);
                        //Array.Drum << rythym;
                        <<<"Stored">>>;
                    }
                }
            }
        }
    }
    private void bdFill (int k[])
    {
        for(0 => int i; i < k.cap(); i++)
        {
            if (k[i] == 1)
            {
                0 => Kick[bdSound].pos;
            }
            Dur(convert(TEMPO),Division) => now;
        } 
    }
    private void hhFill (int hh[])
    {        
        for(0 => int i; i < hh.cap(); i++)
        {
            if (hh[i] == 1)
            {
                0 => HH[hhSound].pos;
            }
            Dur(convert(TEMPO),Division) => now;
        } 
    }
    private void snFill (int sn[])
    {        
        for(0 => int i; i < sn.cap(); i++)
        {
            if (sn[i] == 1)
            {
                0 => Snare[snSound].pos;
            }
            Dur(convert(TEMPO),Division) => now;
        } 
    }
    private void fill (int k[], int hh[])
    {        
        for(0 => int i; i < k.cap() && i < hh.cap(); i++)
        {
            if (k[i] == 1)
            {
                0 => Kick[bdSound].pos;
            }
            if (hh[i] == 1)
            {
                0 => HH[hhSound].pos;
            }
            Dur(convert(TEMPO),Division) => now;
        } 
    }
    private void fill (int k[],int s[],int hh[])
    {        
        for(0 => int i; i < k.cap() && i < s.cap() && i < hh.cap(); i++)
        {
            if (k[i] == 1)
            {
                0 => Kick[bdSound].pos;
            }
            if (s[i] == 1)
            {
                0 => Snare[snSound].pos;
            }
            if (hh[i] == 1)
            {
                0 => HH[hhSound].pos;
            }
            Dur(convert(TEMPO),Division) => now;
        } 
    }
    
    // ———————————————Drum ———————————————//
    
    public void drum (Tuple t)
    {        
        while(true)
        {
            for(0 => int i; i < t.k.cap(); i++)
            {
                if (t.k[i] == 1)
                {
                    t.kgp[i] => Kick[bdSound].gain;
                    0 => Kick[bdSound].pos;
                }
                if (t.s[i] == 1)
                {
                    t.sgp[i] => Snare[snSound].gain;
                    0 => Snare[snSound].pos;
                }
                if (t.h[i] == 1)
                {
                    t.hgp[i] => HH[hhSound].gain;
                    0 => HH[hhSound].pos;
                }
                Dur(convert(TEMPO),Division) => now;
            }
        }
    }

    //——————————————————Basic Functions————————————————————//
    private int[] bassDrum (int k[])
    {        
        k @=> bdGlobal;
        
        while(true)
        {
            for(0 => int i; i < k.cap(); i++)
            {
                if (k[i] == 1)
                {
                    0 => Kick[bdSound].pos;
                }
                Dur(convert(TEMPO),Division) => now;
            }
        }
        return k;
    }
    private int[] hihat (int hh[])
    {       
        hh @=> hhGlobal;
        
        while(true)
        {
            for(0 => int i; i < hh.cap(); i++)
            {
                if (hh[i] == 1)
                {
                    0 => HH[hhSound].pos;
                }
                Dur(convert(TEMPO),Division) => now;
            }
        }
        return hh;
    }
    private int[] snare (int sn[])
    {        
        sn @=> snGlobal;
        
        while(true)
        {
            for(0 => int i; i < sn.cap(); i++)
            {
                if (sn[i] == 1)
                {
                    0 => Snare[snSound].pos;
                }
                Dur(convert(TEMPO),Division) => now;
            } 
        }
        return sn;
    }

}