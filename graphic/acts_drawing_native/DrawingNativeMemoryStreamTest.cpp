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

#include "gtest/gtest.h"

#include "drawing_bitmap.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_error_code.h"
#include "drawing_image.h"
#include "drawing_image_filter.h"
#include "drawing_mask_filter.h"
#include "drawing_memory_stream.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeMemoryStreamTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeMemoryStreamTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeMemoryStreamTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeMemoryStreamTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeMemoryStreamTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MEMORY_STREAM_0100
 * @tc.name: testMemoryStreamCreateNormal
 * @tc.desc: Test for creating memory stream with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMemoryStreamTest, testMemoryStreamCreateNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_MemoryStreamCreate with copyData set to true
    char data[10] = {0};
    OH_Drawing_MemoryStream *stream = OH_Drawing_MemoryStreamCreate(data, 10, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(stream, nullptr);
    OH_Drawing_MemoryStreamDestroy(stream);
    // 2. Call OH_Drawing_MemoryStreamCreate with copyData set to false
    stream = OH_Drawing_MemoryStreamCreate(data, 10, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(stream, nullptr);
    OH_Drawing_MemoryStreamDestroy(stream);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MEMORY_STREAM_0101
 * @tc.name: testMemoryStreamCreateNull
 * @tc.desc: Test for creating memory stream with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMemoryStreamTest, testMemoryStreamCreateNull, TestSize.Level3) {
    char data[10] = {0};
    // 1. OH_Drawing_MemoryStreamCreate with the first parameter set to nullptr, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MemoryStream *stream = OH_Drawing_MemoryStreamCreate(nullptr, 10, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_MemoryStreamCreate with the second parameter set to 0, check the error code using
    // OH_Drawing_ErrorCodeGet
    stream = OH_Drawing_MemoryStreamCreate(data, 0, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_MemoryStreamDestroy(stream);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MEMORY_STREAM_0102
 * @tc.name: testMemoryStreamCreateAbnormal
 * @tc.desc: Test for creating memory stream with abnormal parameters (negative values).
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMemoryStreamTest, testMemoryStreamCreateAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MemoryStreamCreate with a negative value as the second parameter
    OH_Drawing_MemoryStream *stream = OH_Drawing_MemoryStreamCreate(nullptr, -10, true);
    // add assert  ---待验证
    EXPECT_EQ(stream, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Free memory
    OH_Drawing_MemoryStreamDestroy(stream);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MEMORY_STREAM_0103
 * @tc.name: testMemoryStreamCreateMultipleCalls
 * @tc.desc: Test for creating memory stream with multiple calls using different data segments.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMemoryStreamTest, testMemoryStreamCreateMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_MemoryStreamCreate 10 times, passing different data segments
    for (int i = 0; i < 10; i++) {
        char data[10] = {i};
        OH_Drawing_MemoryStream *stream = OH_Drawing_MemoryStreamCreate(data, 10, true);
        // add assert
        EXPECT_NE(stream, nullptr);
        OH_Drawing_MemoryStreamDestroy(stream);
    }
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS