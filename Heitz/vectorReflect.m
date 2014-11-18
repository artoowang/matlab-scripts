% wo: 3xN normalized vectors
% wh, wi: one of them is 3x1 normalized vector, another 3xN normalzied
%         vectors
function wo = vectorReflect(wi, wh)
    Ni = size(wi, 2);
    Nh = size(wh, 2);
    if (Ni == 1)
        N = Nh;
        wi_dot_wh = wi' * wh;  % 1xN
        wo = 2 * wh .* repmat(wi_dot_wh, [3 1]) - repmat(wi, [1 N]);
        % For dot(wi, wh) < 0, there is no correct way to reflect it, so we 
        % set output to zero-vector. It's up to the caller to identify them
        % and properly handle it
        %if (sum(wi_dot_wh < 0) > 0)
        %    fprintf('wi is below some wh''s hemisphere\n');
        %end
        wo(:, wi_dot_wh < 0) = 0;
        
    elseif (Nh == 1)
        N = Ni;
        wi_dot_wh = wh' * wi;  % 1xN
        wo = 2 * repmat(wh, [1 N]) .* repmat(wi_dot_wh, [3 1]) - wi;
        wo(:, wi_dot_wh < 0) = 0;
        
    else
        error('At least wi or wh need to be 3x1 vector\n');
    end
end
