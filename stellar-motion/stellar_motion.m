%%
% To calculate the velocity how far the star (HD 94028 in the constellation of Leo) is away from earth

% This code loads the data and defines measurement parameters.

load('spectrum_data.mat', '-mat');
nObs = size(spectra,1);
lambdaStart = 630.02;
lambdaDelta = 0.14;

%% 
% Calculate the value of the last wavelength in the recorded spectrum
lambdaEnd = lambdaStart + (nObs - 1)*lambdaDelta;

% create a vector that contains the wavelengths in the spectrum
lambda = lambdaStart:lambdaDelta:lambdaEnd;

%% 
% sixth column is the wavelength spectrum of star HD 94028
s = spectra(:, 6);

%% 
% Plot wavelength spectrum to visualize the spike in spectrum
plot(lambda, s, ".-")
xlabel("Wavelength")
ylabel("Intensity")

%% 
% To get the value where spike occured, get the minimum variance from mean value
% of spectrum data which also return index
[sHa, idx] = min(s);
lambdaHa = lambda(idx);

%% 
% Plot the minimum value/spike in spectrum with red square
hold on
plot(lambdaHa, sHa, "rs", MarkerSize=8)

%%
% Cclculate the redshift factor  using the hydrogen-alpha wavelength of the star
z = (lambdaHa/656.28)-1;
% Calculate the speed
speed = z * 299792.458;




