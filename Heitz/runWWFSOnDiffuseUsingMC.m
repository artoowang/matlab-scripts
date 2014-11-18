% Render diffuse component weak white furnace test on sphere 
% using Monte Carlo
function runWWFSOnDiffuseUsingMC(fileName)
    alpha = 0.1;
    f0 = 0.04;
    numSamples = 1e4;
    thetaRes = 50;
    result = renderWeakWhiteFurnaceSphere(...
        @(wis, wo) f_G1_GGX_diffuse(wis, wo, alpha, @(ct) 1-Fresnel(ct, f0)), ...
        @(wo, N) Sample_UniformSphere(N), ...
        thetaRes, numSamples);
    save(fileName);
end
