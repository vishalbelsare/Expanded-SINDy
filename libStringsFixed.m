function stringLib = libStrings(nVars,polyorder,usesine)
% Copyright 2015, All Rights Reserved
% Code by Steven L. Brunton
% For Paper, "Discovering Governing Equations from Data: 
%        Sparse Identification of Nonlinear Dynamical Systems"
% by S. L. Brunton, J. L. Proctor, and J. N. Kutz



%Converted output to cell array format (01/2017, Daniel Dylewsky)
% 
% n = size(yin,1);
% yout = zeros(n,1+nVars+(nVars*(nVars+1)/2)+(nVars*(nVars+1)*(nVars+2)/(2*3))+11);

nstrings = 1;
if polyorder >= 1
    nstrings = nstrings + nVars;
    if polyorder >= 2
        nstrings = nstrings + (nVars*(nVars+1)/2);
        if polyorder >= 3
            nstrings = nstrings + (nVars*(nVars+1)*(nVars+2)/factorial(3));
            if polyorder >= 4
                nstrings = nstrings + (nVars*(nVars+1)*(nVars+2)*(nVars+3)/factorial(4));
                if polyorder >= 5
                    nstrings = nstrings + (nVars*(nVars+1)*(nVars+2)*(nVars+3)*(nVars+4)/factorial(5));
                end
            end
        end
    end
end
if usesine == 1
    nstrings = nstrings + 20;
end

stringLib = cell(1,nstrings);

ind = 1;
% poly order 0
stringLib{ind} = '1';
ind = ind+1;

% poly order 1
for i=1:nVars
    stringLib{ind} = sprintf('x%d',i);
    ind = ind+1;
end

if(polyorder>=2)
    % poly order 2
    for i=1:nVars
        for j=i:nVars
            stringLib{ind} = sprintf('x%d * x%d',i,j);
            ind = ind+1;
        end
    end
end

if(polyorder>=3)
    % poly order 3
    for i=1:nVars
        for j=i:nVars
            for k=j:nVars
                stringLib{ind} = sprintf('x%d * x%d * x%d',i,j,k);
                ind = ind+1;
            end
        end
    end
end

if(polyorder>=4)
    % poly order 4
    for i=1:nVars
        for j=i:nVars
            for k=j:nVars
                for l=k:nVars
                    stringLib{ind} = sprintf('x%d * x%d * x%d * x%d',i,j,k,l);
                    ind = ind+1;
                end
            end
        end
    end
end

if(polyorder>=5)
    % poly order 5
    for i=1:nVars
        for j=i:nVars
            for k=j:nVars
                for l=k:nVars
                    for m=l:nVars
                        stringLib{ind} = sprintf('x%d * x%d * x%d * x%d * x%d',i,j,k,l,m);
                        ind = ind+1;
                    end
                end
            end
        end
    end
end

if(usesine)
    for k=1:10
        for j = 1:nVars
            stringLib{ind} = sprintf('sin(%d*x%d)',k,j);
            ind = ind+1;
        end
        for j = 1:nVars
            stringLib{ind} = sprintf('cos(%d*x%d)',k,j);
            ind = ind+1;
        end
    end
end