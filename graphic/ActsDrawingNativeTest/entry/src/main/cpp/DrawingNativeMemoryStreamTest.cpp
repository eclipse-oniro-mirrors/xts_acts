/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/DrawingNativeMemoryStreamTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int TEST_LOOP_COUNT_10 = 10;

constexpr time_t TEST_TIME_T_0 = 0;
constexpr int TEST_NUMBER_0 = 0;
constexpr int TEST_NUMBER_1 = 1;
constexpr int TEST_NUMBER_2 = 2;
constexpr int TEST_NUMBER_3 = 3;
constexpr int TEST_NUMBER_4 = 4;
constexpr int TEST_NUMBER_5 = 5;
constexpr int TEST_NUMBER_6 = 6;
constexpr int TEST_NUMBER_7 = 7;
constexpr int TEST_NUMBER_8 = 8;
constexpr int TEST_NUMBER_10 = 10;

// --- MemoryStream 测试常量 ---
constexpr size_t TEST_MEMORY_STREAM_DATA_SIZE_10 = 10;
constexpr bool TEST_MEMORY_STREAM_COPY_DATA_TRUE = true;
constexpr bool TEST_MEMORY_STREAM_COPY_DATA_FALSE = false;
constexpr int TEST_MEMORY_STREAM_NEGATIVE_SIZE_10 = -10;

} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativeMemoryStreamTestSetUp()
{
    std::cout << "DrawingNativeMemoryStreamTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMemoryStreamTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeMemoryStreamTestTearDown()
{
    std::cout << "DrawingNativeMemoryStreamTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMemoryStreamTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testMemoryStreamCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0100
 * @tc.desc   Test for creating memory stream with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMemoryStreamCreateNormal()
{
    DrawingNativeMemoryStreamTestSetUp();

    // 1. Call OH_Drawing_MemoryStreamCreate with copyData set to true
    char data[TEST_MEMORY_STREAM_DATA_SIZE_10] = { TEST_NUMBER_0 };
    OH_Drawing_MemoryStream* stream =
        OH_Drawing_MemoryStreamCreate(data, TEST_MEMORY_STREAM_DATA_SIZE_10, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(stream, nullptr);
    OH_Drawing_MemoryStreamDestroy(stream);
    // 2. Call OH_Drawing_MemoryStreamCreate with copyData set to false
    stream = OH_Drawing_MemoryStreamCreate(data, TEST_MEMORY_STREAM_DATA_SIZE_10, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(stream, nullptr);
    OH_Drawing_MemoryStreamDestroy(stream);

    DrawingNativeMemoryStreamTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMemoryStreamCreateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0200
 * @tc.desc   Test for creating memory stream with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMemoryStreamCreateNull()
{
    DrawingNativeMemoryStreamTestSetUp();

    char data[TEST_MEMORY_STREAM_DATA_SIZE_10] = { TEST_NUMBER_0 };
    // 1. OH_Drawing_MemoryStreamCreate with the first parameter set to nullptr, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MemoryStream* stream = OH_Drawing_MemoryStreamCreate(
        nullptr, TEST_MEMORY_STREAM_DATA_SIZE_10, TEST_MEMORY_STREAM_COPY_DATA_TRUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_MemoryStreamCreate with the second parameter set to 0, check the error code using
    // OH_Drawing_ErrorCodeGet
    stream = OH_Drawing_MemoryStreamCreate(data, TEST_NUMBER_0, TEST_MEMORY_STREAM_COPY_DATA_TRUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_MemoryStreamDestroy(stream);

    DrawingNativeMemoryStreamTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMemoryStreamCreateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0300
 * @tc.desc   Test for creating memory stream with abnormal parameters (negative values).
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMemoryStreamCreateAbnormal()
{
    DrawingNativeMemoryStreamTestSetUp();

    // 1. OH_Drawing_MemoryStreamCreate with a negative value as the second parameter
    OH_Drawing_MemoryStream* stream = OH_Drawing_MemoryStreamCreate(
        nullptr, TEST_MEMORY_STREAM_NEGATIVE_SIZE_10, TEST_MEMORY_STREAM_COPY_DATA_TRUE);
    // add assert  ---待验证
    EXPECT_EQ(stream, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Free memory
    OH_Drawing_MemoryStreamDestroy(stream);

    DrawingNativeMemoryStreamTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMemoryStreamCreateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0400
 * @tc.desc   Test for creating memory stream with multiple calls using different data segments.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMemoryStreamCreateMultipleCalls()
{
    DrawingNativeMemoryStreamTestSetUp();

    // 1. Call OH_Drawing_MemoryStreamCreate 10 times, passing different data segments
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        char data[TEST_MEMORY_STREAM_DATA_SIZE_10] = { static_cast<char>(i) };
        OH_Drawing_MemoryStream* stream = OH_Drawing_MemoryStreamCreate(
            data, TEST_MEMORY_STREAM_DATA_SIZE_10, TEST_MEMORY_STREAM_COPY_DATA_TRUE);
        // add assert
        EXPECT_NE(stream, nullptr);
        OH_Drawing_MemoryStreamDestroy(stream);
    }

    DrawingNativeMemoryStreamTestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS