ENV := gdb-debug
ENV := valgrind-debug
ENV := no-debug

STATIC_FLAGS := # disable static
STATIC_FLAGS := -static # enable static

VALGRIND_TOOL=helgrind
VALGRIND_TOOL=memcheck --leak-check=full --show-leak-kinds=all
VALGRIND_TOOL=memcheck --track-origins=yes --leak-check=full --show-leak-kinds=all --track-fds=yes -s
VALGRIND_TOOL=memcheck --track-origins=yes --leak-check=full --track-fds=yes -s

libimu_path=./lib/include
# libigen3_path=/usr/include/eigen3
# libtorch_path=../libtorch

libMHD_path=/usr/local/lib

GPP := g++
GCC := gcc

# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

LINKS := -lmicrohttpd 

ifeq ($(ENV),gdb-debug)
GPP += -Wall -g -O0 $(STATIC_FLAGS) 
GCC += -Wall -g -O0 $(STATIC_FLAGS) 
else
ifeq ($(ENV),valgrind-debug)
GPP += -Wall -g -O0 $(STATIC_FLAGS) 
GCC += -Wall -g -O0 $(STATIC_FLAGS) 
else
GPP += -Wall $(STATIC_FLAGS) 
GCC += -Wall $(STATIC_FLAGS) 
endif
endif
# $(libMHD_path)/libmicrohttpd.a 

# GPP += -Wno-pointer-arith

# sdl_cflags := $(shell pkg-config --cflags sdl2 SDL2_mixer SDL2_image SDL2_ttf)
# # # # # sdl_libs := $(shell pkg-config --libs sdl2 SDL2_mixer SDL2_image SDL2_ttf)
# GPP += $(sdl_cflags)
# GPP += $(sdl_libs)

# torch_cflags := -D_GLIBCXX_USE_CXX11_ABI=0 -std=gnu++17
# torch_libs := -std=c++17 -L${libtorch_path}/lib -Wl,-R${libtorch_path}/lib -ltorch -ltorch_cpu -lc10
# GPP += $(torch_cflags)
# GPP += $(torch_libs)

HEADERS := \
	-I $(libimu_path)/ \
	# -I $(libMHD_path)/ \
	# -I ${libtorch_path}/lib \
	# -I ${libtorch_path}/include/ \
	# -I ${libtorch_path}/include/torch/csrc/api/include

# -I $(libigen3_path)/ \
# -I $(libimu_path)/ \

m_clean:
	rm -f ./build/*.o
	rm -f ./build/*.imux


m_main:
	$(GPP) $(HEADERS) \
	$(libimu_path)/../main.cpp $(LINKS) -o ./build/imu.imux

m_test:
	$(GPP) $(HEADERS) \
	$(libimu_path)/../test.cpp $(LINKS) -o ./build/test.imux

main:
	make m_clean
	make m_main
	echo "running[main]..."
ifeq ($(ENV),gdb-debug)
	gdb ./build/imu.imux
else
ifeq ($(ENV),valgrind-debug)
	valgrind --tool=$(VALGRIND_TOOL) ./build/imu.imux
else
	./build/imu.imux
endif
endif

test:
	make m_clean
	make m_test
	echo "running[test]..."
ifeq ($(ENV),gdb-debug)
	gdb ./build/test.imux
else
ifeq ($(ENV),valgrind-debug)
	valgrind --tool=$(VALGRIND_TOOL) ./build/test.imux
else
	./build/test.imux
endif
endif