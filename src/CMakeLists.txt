find_package(LAPACK)

add_library(gauss_seidel SHARED gauss_seidel.f)
target_link_libraries(gauss_seidel PUBLIC LAPACK::LAPACK)
