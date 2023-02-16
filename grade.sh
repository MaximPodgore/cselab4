rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cd student-submission
if [[ -e ListExamples.java ]]
    then echo "Found the listExamples, Wahoo"
    else 
        echo "We didn't find your file, next time don't screw up"
fi
cp -r ../lib ./
cp ../TestListExamples.java ./
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
echo 'We compiled!!'
#if [[ $? -neq 0 ]]
    #then 
    #echo "Your code didn't compile, Paul Cao and Joe Politz would be disappointed"
#fi   
java -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples >test.txt 
cat test.txt
head -2 test.txt | tail +2 > testCleaned.txt
$Pass = grep -o -i . testCleaned.txt | wc -l 
$Fail = grep -o -i E testCleaned.txt | wc -l 
echo "You passed" 
echo $Pass
echo "tests out of" 
echo $Pass + $Fail


