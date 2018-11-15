function [theta0, theta1] = LinearRegressionFit(TrainingInput, TrainingOutput, alpha)
    if(~isvector(TrainingInput) | ~isvector(TrainingInput))
        error('Training data must be vectors')
    end
    if(length(TrainingInput)!=length(TrainingOutput))
        error('Training input and output must have same size')
    end

    iter = 0;
    theta0 = 1;
    theta1 = 1;

    %theta = [1; 1]
    %Err = 0.0001;


    % convergence method
    gradtheta0 = 0
    gradtheta1 = 0

    sizeInp = length(TrainingInput)
    for i = 1:sizeInp
        gradtheta0 = gradtheta0 + ((theta0*TrainingInput(i)) + theta1 - TrainingOutput(i));
        gradtheta1 = gradtheta1 + (((theta0*TrainingInput(i)) + theta1 - TrainingOutput(i))*TrainingInput(i));
    end

    newtheta0 = theta0 - (alpha*gradtheta0/sizeInp)
    newtheta1 = theta1 - (alpha*gradtheta1/sizeInp)

    while (abs(newtheta0-theta0)>Err | abs(newtheta1-theta1)>Err)
        abs(newtheta0-theta0)
        abs(newtheta1-theta1)
        %Err
        theta0 = newtheta0;
        theta1 = newtheta1;

        gradtheta0 = 0;
        gradtheta1 = 0;

        sizeInp = length(TrainingInput);
        for i = 1:sizeInp
            gradtheta0 = gradtheta0 + ((theta0*TrainingInput(i)) + theta1 - TrainingOutput(i));
            gradtheta1 = gradtheta1 + (((theta0*TrainingInput(i)) + theta1 - TrainingOutput(i))*TrainingInput(i));
        end
        %gradtheta0
        %gradtheta1

        newtheta0 = theta0 - (alpha*gradtheta0/sizeInp);
        newtheta1 = theta1 - (alpha*gradtheta1/sizeInp);

        %if (iter>=1000)
        %    error('Too long. check alpha')
        %end
    end
end
