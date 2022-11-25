# Docker Test Case - Linux 2.2.0 header fragility issue

This plugin won't compile in the RACK SDK 2.2.0 docker image because of a header fragility
ordering issue in the SDK even though it only contains 4 lines of C++ across 2 files.

The reason is the compiler flags used in teh docker image don't allow you to include
`<immintrin.h>` after `rack.hpp`, only before

This is shown by the two src files "RackFirst.cpp" which includes rack first, and doesn't
compile, and "IntrinFirst.cpp" which includes intrin first, and does

