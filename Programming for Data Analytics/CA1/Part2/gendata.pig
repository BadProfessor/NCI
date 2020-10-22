generateData = load '/home/hduser/Part2/x19131321.txt'
        using PigStorage(',')
        AS( 
                id:int,
                date:chararray,
                word:chararray,
                randomCharacter:chararray,
                bigRandom:int,
                randomString:chararray,
                smallRandom:int,
                user:chararray,
                group:chararray
        );

filterData = FILTER generateData by user != 'tom';

orderData = order filterData by bigRandom;

groupBig = foreach orderData Generate bigRandom;

getData = GROUP groupBig all;

generateData = foreach getData {
        sumData = SUM(groupBig.bigRandom);
        countData = COUNT(groupBig);
        generate flatten(groupBig), sumData/countData as average, countData as countData;
};

varA = foreach generateData {
        varB = (bigRandom - average) * (bigRandom - average);
        generate *, varB as varB;
};

getData = group varA all;

standardDeviationInput = foreach getData generate flatten(varA), SUM(varA.varB) as squareRoot;

standardDeviationOutput = foreach standardDeviationInput generate SQRT(squareRoot / countData) as standardData;

STORE standardDeviationOutput INTO 'file:////home/hduser/Part2/output' using PigStorage(';');