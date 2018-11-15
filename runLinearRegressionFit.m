inputData = [300,600,900,1200,1500, 1800, 2100];

expectedOutput = [100,120,130,160, 180,200,220];

% [theta,scalingFactor] = LinearRegressionVectorFit(inputData, expectedOutput, 0.1);
theta = LinearRegressionVectorFit(inputData, expectedOutput, 0.1);
