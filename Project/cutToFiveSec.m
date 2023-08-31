function CUT = cutToFiveSec(audioSignal)
%creating 5 seconds snippets of audio (assuming 5Khz sampling rate)    
    CUT = (1:40000);
    for index = 8000:48000
        CUT(index-7999) = audioSignal(index);
    end
end
