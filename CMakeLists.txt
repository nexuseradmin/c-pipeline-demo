cmake_minimum_required(VERSION 3.10)

project(CPipeline)

set(CMAKE_C_STANDARD 11)

add_executable(c_pipeline src/main.c)

enable_testing()

add_test(NAME RunApplication COMMAND c_pipeline)
enable_testing()
