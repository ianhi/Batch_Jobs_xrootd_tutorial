#!/bin/bash
/afs/cern.ch/work/r/rkunnawa/BatchJobsTutorial/CMSSW_5_3_20/src/
#cmsenv
eval `scramv1 runtime -sh`

/afs/cern.ch/work/r/rkunnawa/BatchJobsTutorial/CMSSW_5_3_20/src/

nJobs=2 
i=0
while [ $i -le $nJobs ];
do 
   let "start=i*2"
   let "end=(i+1)*2"
  export FIRST=$start  
  export LAST=$end 
  echo "First = $FIRST and last file = $LAST"   
  bsub -R "pool>5000" -M 3000000 -q 1nd -J merge_job_${i} < /afs/cern.ch/work/r/rkunnawa/BatchJobsTutorial/CMSSW_5_3_20/src/submit.sh
  let "i++"
done

echo "submit all jobs!"

#echo "Copying output files to " $destination