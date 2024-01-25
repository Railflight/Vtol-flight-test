function m=makehgtformoctave(varargin)
%MAKEHGTFORMOCTAVE Make a 4x4 transform matrix.
%   M = MAKEHGTFORMOCTAVE  Creates an identity transform.
%
%   M = MAKEHGTFORMOCTAVE('translate',tx,ty,tz)  Translate along X 
%   axis by tx, along Y axis by ty, and along Z axis by tz.
%
%   M = MAKEHGTFORMOCTAVE('scale',s)  Scale uniformly by s.
%
%   M = MAKEHGTFORMOCTAVE('scale',[sx sy sz])  Scale along X axis by 
%   sx, along Y axis by sy, and along Z axis by sz.
%
%   M = MAKEHGTFORMOCTAVE('xrotate',t)  Rotate around X axis by t radians.
%
%   M = MAKEHGTFORMOCTAVE('yrotate',t)  Rotate around Y axis by t radians.
%
%   M = MAKEHGTFORMOCTAVE('zrotate',t)  Rotate around Z axis by t radians.
%
%   M = MAKEHGTFORMOCTAVE('axisrotate',[ax ay az],t)  Rotate around axis 
%   [ax ay az] by t radians.
%
%   Multiple transforms can be concatenated.
%
%   Example:
%
%   m = makehgtform('xrotate',pi/2,'yrotate',pi/2);
%
%   is the same as:
%
%   m = makehgtform('xrotate',pi/2)*makehgtform('yrotate',pi/2);
%


% import octave.graphics.internal.*;
    m = eye(4);
    ai = 1;
    numArgs = length(varargin);
    while ai <= numArgs
        name = varargin{ai};
        ai = ai+1;

        if strcmpi(name,'translate')
            narginchk(ai,inf);
            
            if ~isnumeric(varargin{ai})
                %error(message('OCTAVE:makehgtform:InvalidParamTranslateNumeric'));
            end
            x = double(varargin{ai});
            ai = ai+1;

            if isscalar(x)
                narginchk(ai+1,inf);
            
                if ~isnumeric(varargin{ai})
                    %error(message('OCTAVE:makehgtform:InvalidParamTranslateNumeric'));
                end
                y = double(varargin{ai});
                ai = ai+1;

                if ~isnumeric(varargin{ai})
                    %error(message('OCTAVE:makehgtform:InvalidParamTranslateNumeric'));
                end        
                z = double(varargin{ai});
                ai = ai+1;    
                if (~isscalar(y) || ~isscalar(z))
                  %todo
                end
                
            elseif (~isvector(x) || length(x) ~= 3)
                %error(message('OCTAVE:makehgtform:InvalidParamTranslate3D'));
            else
                y = x(2);
                z = x(3);
                x = x(1);
            end

            if (~isfinite(x) || ~isfinite(y) || ~isfinite(z))
                %error(message('OCTAVE:makehgtform:InvalidParamTranslateFinite'));
            end
            m = matrixMultiply(m,...
                     [1 0 0 x; ...
                     0 1 0 y; ...
                     0 0 1 z; ...
                     0 0 0 1]);
%             m = m * [1 0 0 x; ...
%                      0 1 0 y; ...
%                      0 0 1 z; ...
%                      0 0 0 1];
        
        elseif strcmpi(name,'scale')
            narginchk(ai,inf);

            if ~isnumeric(varargin{ai})
                %error(message('OCTAVE:makehgtform:InvalidParamScaleNumeric'));
            end            
            s = double(varargin{ai});
            ai = ai+1;
            
            if isscalar(s)
                s = repmat(s,1,3);
            elseif (~isvector(s) || length(s) ~= 3)
                %error(message('OCTAVE:makehgtform:InvalidParamScaleFactor1D3D'));                
            end
            
            if (~isfinite(s(1)) || ~isfinite(s(2)) || ~isfinite(s(3)))
                %error(message('OCTAVE:makehgtform:InvalidParamScaleFactorFinite'));
            end
            
            if (s(1) <= 0 || s(2) <= 0 || s(3) <= 0)
                %error(message('OCTAVE:makehgtform:InvalidParamScaleFactorPositive'));
            end
            
            m = matrixMultiply(m,...
                [s(1) 0    0    0; ...
                     0    s(2) 0    0; ...
                     0    0    s(3) 0; ...
                     0    0    0    1]);
%             m = m * [s(1) 0    0    0; ...
%                      0    s(2) 0    0; ...
%                      0    0    s(3) 0; ...
%                      0    0    0    1];
        
        elseif strcmpi(name,'xrotate')
            narginchk(ai,inf);

            if ~isnumeric(varargin{ai})
                %error(message('OCTAVE:makehgtform:InvalidParamXrotateNumeric'));
            end
            t = double(varargin{ai});
            ai = ai+1;
            
            if (~isscalar(t))
                %error(message('OCTAVE:makehgtform:InvalidParamRotationScalar'));
            end

            if (~isfinite(t))
                %error(message('OCTAVE:makehgtform:InvalidParamRotationFinite'));
            end
            [ct,st] = computeCosAndSin(t);
            m = matrixMultiply(m,...
                [1  0   0 0; ...
                     0 ct -st 0; ...
                     0 st  ct 0; ...
                     0  0   0 1]);
%             m = m * [1  0   0 0; ...
%                      0 ct -st 0; ...
%                      0 st  ct 0; ...
%                      0  0   0 1];

        elseif strcmpi(name,'yrotate')
            narginchk(ai,inf);

            if ~isnumeric(varargin{ai})
                %error(message('OCTAVE:makehgtform:InvalidParamYrotateNumeric'));
            end
            t = double(varargin{ai});
            ai = ai+1;
            
            if (~isscalar(t))
                %error(message('OCTAVE:makehgtform:InvalidParamRotationScalar'));
            end

            if (~isfinite(t))
                %error(message('OCTAVE:makehgtform:InvalidParamRotationFinite'));
            end
            
            [ct,st] = computeCosAndSin(t);
            m = matrixMultiply(m,...
                [ct 0 st 0; ...
                      0 1  0 0; ...
                    -st 0 ct 0; ...
                      0 0  0 1]);
%             m = m * [ct 0 st 0; ...
%                       0 1  0 0; ...
%                     -st 0 ct 0; ...
%                       0 0  0 1];

        elseif strcmpi(name,'zrotate')
            narginchk(ai,inf);

            if ~isnumeric(varargin{ai})
                %error(message('OCTAVE:makehgtform:InvalidParamZrotate'));
            end
            t = double(varargin{ai});
            ai = ai+1;
            
            if (~isscalar(t))
                %error(message('OCTAVE:makehgtform:InvalidParamRotationScalar'));
            end

            if (~isfinite(t))
                %error(message('OCTAVE:makehgtform:InvalidParamRotationFinite'));
            end
            
            [ct,st] = computeCosAndSin(t);
            m = matrixMultiply(m,...
                [ct -st 0 0; ...
                     st  ct 0 0; ...
                      0   0 1 0; ...
                      0   0 0 1]);
%             m = m * [ct -st 0 0; ...
%                      st  ct 0 0; ...
%                       0   0 1 0; ...
%                       0   0 0 1];

        elseif strcmpi(name,'axisrotate')
            narginchk(ai+1,inf);

            if ~isnumeric(varargin{ai})
                %error(message('OCTAVE:makehgtform:InvalidParamAxisRotateNumeric'));
            end
            u = double(varargin{ai});
            ai = ai+1;

            if ~isnumeric(varargin{ai})
                %error(message('OCTAVE:makehgtform:InvalidParamAxisRotateNumeric'));
            end
            t = double(varargin{ai});
            ai = ai+1;

            if ( ~isvector(u) || length(u) ~= 3)
              %error(message('OCTAVE:makehgtform:BadAxis3D'));
            end
            
            if (~isfinite(u(1)) || ~isfinite(u(2)) || ~isfinite(u(3)))
              %error(message('OCTAVE:makehgtform:BadAxisFinite'));
            end
            
            if (~isscalar(t))
                %error(message('OCTAVE:makehgtform:InvalidParamRotationScalar'));
            end

            if (~isfinite(t))
                %error(message('OCTAVE:makehgtform:InvalidParamRotationFinite'));
            end
            
            u = u./norm(u);
            [c,s] = computeCosAndSin(t);

            tmp = eye(4);     
            tmp(1:3,1:3) = c*eye(3) + (1-c)*kron(u,u') + s*SkewSymm(u);
            m = m * tmp;
        
        else
          if isCharOrString(name)
            %error(message('OCTAVE:makehgtform:BadTransformType', name));
          elseif isnumeric(name)
            %error(message('OCTAVE:makehgtform:UnrecognizedArg', num2str( name )));
          else
            %error(message('OCTAVE:makehgtform:InvalidArg'));
          end
        end
    
    end

endfunction


function s=SkewSymm(v)
    s = [  0  -v(3)  v(2); ...
         v(3)    0  -v(1); ...
        -v(2)  v(1)    0];
endfunction

function [ct,st] = computeCosAndSin(t)
    ct = fixup(cos(t));
    st = fixup(sin(t));
endfunction

function x = fixup(x)
    vals = [0 1 -1];
    i=find(abs(x-vals)<2*eps);
    if ~isempty(i)
        x = vals(i);
    end
endfunction

function C = matrixMultiply(A, B)

C = zeros(size(A,1),size(B,2));
for row = 1:size(A,1)
    for col = 1:size(B,2)
        Arow = A(row,:);
        Bcol = B(:,col);
        for k=1:length(Arow)
           C(row,col) = C(row,col)+Arow(k)*Bcol(k);
        end
    end
end
endfunction