function [fitresult, gof] = createFit(fcin, Fanofactor)
global coeff;
%CREATEFIT(FCIN,FANOFACTOR)
%  Create a fit.
%  
%  Data for 'untitled fit 1' fit:
%      X Input : fcin
%      Y Output: Fanofactor
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.
 
%  Auto-generated by MATLAB on 02-Feb-2017 14:59:41
 

%% Fit: 'untitled fit 1'.
[xData,yData] = prepareCurveData( fcin, Fanofactor );

% Set up fittype and options.
ft = fittype( '1+x*30*((1-x)/(a+x))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'OFF';
opts.StartPoint = 0.808271133785348;
opts.Weights = weights;
% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
 
% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
set(gca,'xscale','log');
legend( h, 'Fanofactor vs. fcin', 'untitled fit 1', 'Location', 'NorthEast' );


coeff =  coeffvalues(fitresult);


% Label axes
xlabel fcin
ylabel Fanofactor
grid on

