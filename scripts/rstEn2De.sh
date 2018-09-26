#!/bin/bash
SRC="${HOME}/sci.comp/redpitaya/ActiveLearning/activelearning/source" 
DEST="${HOME}/sci.comp/redpitaya/ActiveLearning/activelearning-de/source"
cd ${SRC}
for FILE in Activity_*.rst 
do
    trans -sl en -tl de -o ${DEST}/${FILE} file://${FILE}
#    echo ${FILE}
#    cp -f ${FILE} ${DEST}/${FILE}
done
