% function [theta,scalingFactor] = LinearRegressionVectorFit(TrainingInput, TrainingOutput, Alpha)
function theta = LinearRegressionVectorFit(TrainingInput, TrainingOutput, Alpha)
    if (~isvector(TrainingInput) | ~isvector(TrainingInput))
        error('Training data must be vectors')
    end

    if (length(TrainingInput) != length(TrainingOutput))
        error('Training input and output must have same size')
    end

    % reformat input data to column vectors
    if(size(TrainingInput)(1)==1)
        TrainingInput = TrainingInput';
    end
    if(size(TrainingOutput)(1)==1)
        TrainingOutput = TrainingOutput';
    end
    maxInput = max(TrainingInput);
    maxOutput = max(TrainingOutput);

    % data scaling
    TrainingInput = TrainingInput/maxInput;
    TrainingOutput = TrainingOutput/maxOutput;

    theta  = [0; 0];
    Err = [0.0001; 0.0001];
    iter = 1;

    l = length(TrainingInput);
    % TrainInp = ones(2, l);
    % TrainInp(2,:) = TrainingInput';
    for i=1:l
        % X = TrainInp(:, i);
        X = [1; TrainingInput(i)];
        y = TrainingOutput(i);
        newtheta = theta - Alpha * ( (theta' * X) * X - y * X);
    end
    while all(abs(newtheta - theta) >= Err)
      theta = newtheta;
      for i=1:l
          X = [1; TrainingInput(i)];
          % X = TrainInp(:, i);
          y = TrainingOutput(i);
          newtheta = theta - Alpha * ( (theta' * X) * X - y * X);
      end
      iter = iter +  1;
    end
    theta = [maxOutput;maxOutput/maxInput].*theta;
    % scaling is done using relation for scaled data expectedOutput/maxOutput = theta0 + theta1*inputData/maxInput
    % Therefore, expectedOutput = (maxOutput*theta0) + (maxOutput/maxInput*theta1) * inputData
    %                                 ^                      ^
    %                                Scaled theta0        Scaled theta1

    % scalingFactor = [maxInput; maxOutput];
end
