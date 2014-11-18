% f: @(wi, wo)
% Sample: @(wo, N)
function vals = renderWeakWhiteFurnaceSphere(f, Sample, resolution, numSamples)
    thetas = linspace(0, pi/2, resolution+1);
    thetas = (thetas(1:end-1) + thetas(2:end)) / 2;
    wos = sph2vector(thetas, 0);
    
    vals = zeros(1, resolution);
    for i = 1:resolution
        fprintf('%d/%d ...\n', i, resolution);
        
        wo = wos(:, i);
        vals(i) = monteCarloIntegrate(...
            @(wis) integrandOverWi(wis, wo, f), ...
            @(N) Sample(wo, N), ...
            numSamples);
    end
    
    drawCircle(0.5 * vals);
end

function vals = integrandOverWi(wis, wo, f)
    f_vals = f(wis, wo);  % 1xN
    costhetai = abs(wis(3, :));  % 1xN
    vals = f_vals .* costhetai;  % 1xN
end
