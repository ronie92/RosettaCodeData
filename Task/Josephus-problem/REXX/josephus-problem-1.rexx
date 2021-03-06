/* REXX **************************************************************
* 15.11.2012 Walter Pachl - my own solution
* 16.11.2012 Walter Pachl generalized n prisoners + w killing distance
*                         and s=number of survivors
**********************************************************************/
dead.=0                                /* nobody's dead yet          */
n=41                                   /* number of alive prisoners  */
nn=n                                   /* wrap around boundary       */
w=3                                    /* killing count              */
s=1                                    /* nuber of survivors         */
p=-1                                   /* start here                 */
killed=''                              /* output of killings         */
Do until n=s                           /* until one alive prisoner   */
  found=0                              /* start looking              */
  Do Until found=w                     /* until we have the third    */
    p=p+1                              /* next position              */
    If p=nn Then p=0                   /* wrap around                */
    If dead.p=0 Then                   /* a prisoner who is alive    */
      found=found+1                    /* increment found count      */
    End
  dead.p=1
  n=n-1                                /* shoot the one on this pos. */
  killed=killed p                      /* add to output              */
  End                                  /* End of main loop           */
Say 'killed:'subword(killed,1,20)      /* output killing sequence    */
Say '       'subword(killed,21)        /* output killing sequence    */
Say 'Survivor(s):'                     /* show                       */
Do i=0 To 40                           /* look for the surviving p's */
  If dead.i=0 Then Say i               /* found one                  */
  End
