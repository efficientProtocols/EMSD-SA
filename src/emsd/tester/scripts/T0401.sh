#/bin/sh
# RCS Id: $Id: T0401.sh,v 1.1.1.1 2002/10/24 19:50:03 mohsen Exp $

TMP_FILE="/tmp/IT$$.tmp"

UA_SPOOL=${UA_SPOOL:-'../spool/emsd-ua/submitNew'}
TEST_SESSION=${TEST_SESSION:-`date "+Test Session on %D"`}

MIN=`date '+%M'`
MSGID=`date '+T0401_%a.%T'`
DATE=`date '+%c'`

rm -f ${TMP_FILE}

echo "From emsduser@neda.com ${DATE}"		         > ${TMP_FILE}
echo "Date: ${DATE}"					>> ${TMP_FILE}
echo "From: EMSD=1234"					>> ${TMP_FILE}
echo "To: EMSD=3456"					>> ${TMP_FILE}
echo "Subject: Test 4.1  ${DATE}"			>> ${TMP_FILE}
echo "MIME-Version: 1.0"				>> ${TMP_FILE}
echo "Content-Type: TEXT/PLAIN; charset=US-ASCII"	>> ${TMP_FILE}
echo ""							>> ${TMP_FILE}
date							>> ${TMP_FILE}

cat > /tmp/NedaTestData.tmp <<EndOfData
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
EndOfData

cat /tmp/NedaTestData.tmp >> ${TMP_FILE}
cp ${TMP_FILE} ${UA_SPOOL}/S_0401${MIN}
sleep 5

cat /tmp/NedaTestData.tmp >> ${TMP_FILE}
cp ${TMP_FILE} ${UA_SPOOL}/S_1401${MIN}
sleep 5

cat /tmp/NedaTestData.tmp >> ${TMP_FILE}
cp ${TMP_FILE} ${UA_SPOOL}/S_2401${MIN}
sleep 5

cat /tmp/NedaTestData.tmp >> ${TMP_FILE}
cp ${TMP_FILE} ${UA_SPOOL}/S_3401${MIN}
sleep 5

cat /tmp/NedaTestData.tmp >> ${TMP_FILE}
cp ${TMP_FILE} ${UA_SPOOL}/S_4401${MIN}