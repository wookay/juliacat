# test_fft.jl
#                           wookay.noh at gmail.com

load("../juliacat/UnitTest.jl")

# http://www.matlabinuse.com/index.php?document_srl=2494&mid=Mastering_MATLAB&sort_index=readed_count&order_type=desc
# Time Domain
#   1일  2일  3일  4일  5일  6일  7일  8일  9일  ...
#   물리 물리 물리 물리 물리 물리 물리 물리 물리 ...
#        수학      수학      수학      수학      ...
#             영어           영어           영어 ...
# Frequency Domain
#   매일 2일에한번 3일에한번
#   물리 수학      영어

# 4Hz (Hz = /초, 즉 1초에 4번 진동)
# 주파수(frequency)   4
# 크기(Amplitude) 2

function test_fft()
end

if is_main()
  UnitTest.run()
end
