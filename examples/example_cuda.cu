import pycuda.gpuarray as gpuarray
a = numpy.asarray((2,)).astype(numpy.float32)
b = numpy.asarray((7,)).astype(numpy.float32)
d_a = gpuarray.to_gpu(a)
d_b = gpuarray.to_gpu(b)
d_c = d_a + d_b
print(d_c.get())
