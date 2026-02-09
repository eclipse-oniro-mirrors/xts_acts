# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsNNCoreOpsTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(nncoreops SHARED
    NapiInitTest.cpp
    NapiInitPart1Test.cpp
    NapiInitPart2Test.cpp
    NapiInitPart3Test.cpp
    NapiInitPart4Test.cpp
    NapiInitPart5Test.cpp
    NapiInitPart6Test.cpp
    OhosCommonTest.cpp
    NNCoreUtilsTest.cpp
    AbsTest.cpp
    AllTest.cpp
    AssertTest.cpp
    BroadcastToTest.cpp
    CeilTest.cpp
    ClipTest.cpp
    ConstantOfShapeTest.cpp
    CosTest.cpp
    CropTest.cpp
    DepthToSpaceTest.cpp
    DetectionPostProcessTest.cpp
    EqualTest.cpp
    ErfTest.cpp
    ExpTest.cpp
    FlattenTest.cpp
    FloorTest.cpp
    GatherNdTest.cpp
    GreaterEqualTest.cpp
    GreaterTest.cpp
    HardSigmoidTest.cpp
    InstanceNormTest.cpp
    L2NormalizeTest.cpp
    LeakyReluTest.cpp
    LessTest.cpp
    LogicalAndTest.cpp
    LogicalNotTest.cpp
    LogSoftmaxTest.cpp
    LogTest.cpp
    LogicalOrTest.cpp
    LrnTest.cpp
    LstmTest.cpp
    MinimumTest.cpp
    ModTest.cpp
    NegTest.cpp
    NotEqualTest.cpp
    PowTest.cpp
    QuantDtypeCastTest.cpp
    RangeTest.cpp
    RankTest.cpp
    ReciprocalTest.cpp
    Reducel2Test.cpp
    ReducemaxTest.cpp
    ReduceminTest.cpp
    ReducesumTest.cpp
    RoundTest.cpp
    ScatterNdTest.cpp
    SelectTest.cpp
    SinTest.cpp
    SpaceToDepthTest.cpp
    SparseToDenseTest.cpp
    SquareTest.cpp
    SwishTest.cpp
    UnstackTest.cpp
    WhereTest.cpp
    )
target_link_libraries(nncoreops PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    libneural_network_runtime.so
    libneural_network_core.so
    )