CPATH = ".;..lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"
rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cd student-submission
if [[ -e ListExamples.java ]]
    then echo "Found the listExamples, Wahoo"
    else 
        echo "We didn't find your file, next time don't screw up"
fi
cp ../TestListExamples.java ./
javac -cp $CPATH *.java
echo 'We compiled!!'
#if [[ $? -neq 0 ]]
    #then 
    #echo "Your code didn't compile, Paul Cao and Joe Politz would be disappointed"
#fi   
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples

