//
//  BeatsDB.ck
//  Auto DJ
//
//  Created by Esteban Betancur on 28/08/15.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//

public class BeatsDB extends Tuple
{
    public Tuple beat(string name)
    {
        Tuple toReturn;
        
        if (name == "house")
        {
            toReturn.tuple([1,0,1,0,1,0,1,0],[0,0,1,0,0,0,1,0],[1,1,1,1,1,1,1,1]);
        }
        
        return toReturn;
    }
}
