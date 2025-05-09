function X = fft_16pt(x)
    % 16-point FFT using Radix-2 DIT
    N = 16;
    if length(x) ~= N
        error('Input vector must be of length 16.');
    end

    n = 1:N; % Corrected to use 1:N for indexing
    subplot(311);
    stem(n, x);
    title('Input Signal');
    xlabel('Discrete Time');
    ylabel('Amplitude');

    % Bit-reversal permutation
    br_indices = bitrevorder(0:N-1) + 1; % MATLAB uses 1-based indexing
    x = x(br_indices);

    % FFT computation
    stages = log2(N);
    for s = 1:stages
        m = 2^s;
        wm = exp(-1j * 2 * pi / m);
        for k = 1:m:N
            for j = 0:(m/2)-1
                t = wm^j * x(k + j + m/2);
                u = x(k + j);
                x(k + j) = u + t;
                x(k + j + m/2) = u - t;
            end
        end
    end

    X = x; % Output the FFT result

    % Plot the resultant complex in terms of magnitude and phase
    xm = abs(X); % Magnitude
    xp = angle(X); % Phase

    subplot(312);
    stem(n, xm); % Corrected to use xm
    title('Magnitude of X(k) Signal');
    xlabel('Discrete Frequency');
    ylabel('Magnitude');

    subplot(313);
    stem(n, xp);
    title('Phase of X(k) Signal');
    xlabel('Discrete Frequency');
    ylabel('Phase (radians)');
end
