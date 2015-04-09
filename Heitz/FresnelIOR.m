% eta_t_over_i: transmitted IOR over incident IOR
% wi_dot_n: cosine of incident angle (assumed >= 0)
function val = FresnelIOR(wi_dot_n, eta_t_over_i)

    % We compute this using Schlick approximation
    % Note this depends on whether eta_t_over_i is above or below one
    % See [de Greve et al., Reflections and Refractions in Ray Tracing]
    f0 = ((1 - eta_t_over_i) ./ (1 + eta_t_over_i)).^2;
    if eta_t_over_i >= 1
        val = f0 + (1-f0).*(1-wi_dot_n).^5;
        val(wi_dot_n < 0) = NaN;    % We don't handle wi_dot_n < 0
    else
        % First, compute transmitted angle
        sin_theta_i_sq = 1 - wi_dot_n.^2;
        sin_theta_t_sq = sin_theta_i_sq ./ (eta_t_over_i).^2;
        % Total internal reflection
        TIR = sin_theta_t_sq > 1;
        cos_theta_t = sqrt(1 - sin_theta_t_sq);
        val = f0 + (1-f0).*(1-cos_theta_t).^5;
        val(TIR) = 1;
        val(wi_dot_n < 0) = NaN;    % We don't handle wi_dot_n < 0
    end
end
