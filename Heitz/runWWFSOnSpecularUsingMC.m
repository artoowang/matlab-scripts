% Render specular component weak white furnace test on sphere
% using Monte Carlo
function runWWFSOnSpecularUsingMC(fileName)
    alpha = 0.1;
    f0 = 1;
    numSamples = 1e7;
    thetaRes = 50;
    result = renderWeakWhiteFurnaceSphere(...
        @(wis, wo) f_G1_GGX(wis, wo, alpha, @(ct) Fresnel(ct, f0)), ...
        @(wo, N) Sample_GGX(wo, N, alpha), ...
        thetaRes, numSamples);
    save(fileName);
end
