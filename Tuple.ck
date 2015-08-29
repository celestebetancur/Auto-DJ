public class Tuple
{
    int k[0];
    int s[0];
    int h[0];
    
    [1.0,0.32,0.35,0.34,0.75,0.2,0.47,0.17] @=> float kCorpus[];
    [0.32,0.36,0.37,0.16,0.93,0.2,0.18,0.32] @=> float sCorpus[];
    [0.9,0.58,0.9,0.75,0.81,0.66,1.0,0.72] @=> float hCorpus[];
    
    public void tuple(int k[], int s[], int h[])
    {
        k @=> this.k;
        s @=> this.s;
        h @=> this.h;
    }
    
    public Tuple comparative(float percent, Tuple a, Tuple b)
    {
        int k[0]; int s[0]; int h[0];
        
        int corpusK[0];int corpusS[0]; int corpusH[0];
        
        if(percent > 1)
        {
            <<<"Number between 0 and 1">>>;
        }
        else
        {   
            for(0 => int i; i < kCorpus.cap(); i++)
            {
                if(kCorpus[i] >= percent) corpusK << 1;
                else corpusK << 0; 
                if(sCorpus[i] >= percent) corpusS << 1;
                else corpusS << 0;
                if(hCorpus[i] >= percent) corpusH << 1;
                else corpusH << 0;
            }
            for(0 => int i; i < kCorpus.cap(); i++)
            {
                if ((a.k[i] == 1 || b.k[i] == 1) && corpusK[i] == 1) k << 1;
                else k << 0;
                if ((a.s[i] == 1 || b.s[i] == 1) && corpusS[i] == 1) s << 1;
                else s << 0;
                if ((a.h[i] == 1 || b.h[i] == 1) && corpusH[i] == 1) h << 1;
                else h << 0;
            }
            k @=> this.k;
            s @=> this.s;
            h @=> this.h;
        }
    }
}