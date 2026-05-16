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

#define DRAWING_NUMBER_10 10

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestMemoryStreamCreateNormal()
{
    DrawingNativeMemoryStreamTestSetUp();
    // 1. Call OH_Drawing_MemoryStreamCreate with copyData set to true
    char data[DRAWING_NUMBER_10] = {0};
    OH_Drawing_MemoryStream *stream = OH_Drawing_MemoryStreamCreate(data, DRAWING_NUMBER_10, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(stream, nullptr);
    OH_Drawing_MemoryStreamDestroy(stream);
    // 2. Call OH_Drawing_MemoryStreamCreate with copyData set to false
    stream = OH_Drawing_MemoryStreamCreate(data, DRAWING_NUMBER_10, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(stream, nullptr);
    OH_Drawing_MemoryStreamDestroy(stream);
    DrawingNativeMemoryStreamTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMemoryStreamCreateNull()
{
    DrawingNativeMemoryStreamTestSetUp();
    char data[DRAWING_NUMBER_10] = {0};
    // 1. OH_Drawing_MemoryStreamCreate with the first parameter set to nullptr, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MemoryStream *stream = OH_Drawing_MemoryStreamCreate(nullptr, DRAWING_NUMBER_10, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_MemoryStreamCreate with the second parameter set to 0, check the error code using
    // OH_Drawing_ErrorCodeGet
    stream = OH_Drawing_MemoryStreamCreate(data, 0, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_MemoryStreamDestroy(stream);
    DrawingNativeMemoryStreamTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMemoryStreamCreateAbnormal()
{
    DrawingNativeMemoryStreamTestSetUp();
    // 1. OH_Drawing_MemoryStreamCreate with a negative value as the second parameter
    OH_Drawing_MemoryStream *stream = OH_Drawing_MemoryStreamCreate(nullptr, -DRAWING_NUMBER_10, true);
    // add assert  ---待验证
    EXPECT_EQ(stream, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Free memory
    OH_Drawing_MemoryStreamDestroy(stream);
    DrawingNativeMemoryStreamTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMemoryStreamCreateMultipleCalls()
{
    DrawingNativeMemoryStreamTestSetUp();
    // 1. Call OH_Drawing_MemoryStreamCreate 10 times, passing different data segments
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        char data[DRAWING_NUMBER_10] = { static_cast<char>(i) };
        OH_Drawing_MemoryStream *stream = OH_Drawing_MemoryStreamCreate(data, DRAWING_NUMBER_10, true);
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