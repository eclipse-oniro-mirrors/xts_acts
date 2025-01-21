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

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeMaskFilterTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MASK_FILTER_0100
 * @tc.name: testMaskFilterCreateBlurDestroyNormal
 * @tc.desc: Test for creating and destroying a blur mask filter with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMaskFilterTest, testMaskFilterCreateBlurDestroyNormal, TestSize.Level0) {
    OH_Drawing_BlurType types[] = {
        NORMAL,
        SOLID,
        OUTER,
        INNER,
    };
    // 1. Enumerate through the blurType values in OH_Drawing_MaskFilterCreateBlur
    for (OH_Drawing_BlurType type : types) {
        OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(type, 10, true);
        EXPECT_NE(maskFilter, nullptr);
        OH_Drawing_MaskFilterDestroy(maskFilter);
    }
    // 2. Call OH_Drawing_MaskFilterCreateBlur with a floating-point value for sigma
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, 10.0f, true);
    // 3. Call OH_Drawing_MaskFilterCreateBlur with an integer value for sigma
    maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, 10, true);
    // 4. Call OH_Drawing_MaskFilterCreateBlur with respectCTM set to false
    maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, 10, false);
    // 5. Call OH_Drawing_MaskFilterCreateBlur with respectCTM set to true
    maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, 10, true);
    // 6. Call OH_Drawing_MaskFilterDestroy
    OH_Drawing_MaskFilterDestroy(maskFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MASK_FILTER_0101
 * @tc.name: testMaskFilterCreateBlurDestroyNULL
 * @tc.desc: Test for creating and destroying a blur mask filter with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMaskFilterTest, testMaskFilterCreateBlurDestroyNULL, TestSize.Level3) {
    // 1. Call OH_Drawing_MaskFilterCreateBlur with the second parameter as zero and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, 0, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Call OH_Drawing_MaskFilterDestroy with a null parameter
    OH_Drawing_MaskFilterDestroy(nullptr);
    // 3. Free memory
    OH_Drawing_MaskFilterDestroy(maskFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MASK_FILTER_0102
 * @tc.name: testMaskFilterCreateBlurDestroyMultipleCalls
 * @tc.desc: Test for multiple calls of creating and destroying a blur mask filter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMaskFilterTest, testMaskFilterCreateBlurDestroyMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_MaskFilterCreateBlur and OH_Drawing_MaskFilterDestroy 10 times in a loop
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, 10, true);
        EXPECT_NE(maskFilter, nullptr);
        OH_Drawing_MaskFilterDestroy(maskFilter);
    }
    // 2. Call OH_Drawing_MaskFilterCreateBlur 10 times consecutively
    OH_Drawing_MaskFilter *maskFilters[10];
    for (int i = 0; i < 10; i++) {
        maskFilters[i] = OH_Drawing_MaskFilterCreateBlur(NORMAL, 10, true);
    }
    // 3. Call OH_Drawing_MaskFilterDestroy 10 times consecutively
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MaskFilterDestroy(maskFilters[i]);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MASK_FILTER_0103
 * @tc.name: testMaskFilterCreateBlurDestroyAbnormal
 * @tc.desc: Test for creating and destroying a blur mask filter with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMaskFilterTest, testMaskFilterCreateBlurDestroyAbnormal, TestSize.Level3) {
    // 1. Call OH_Drawing_MaskFilterCreateBlur with a negative value for sigma and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, -10, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Call OH_Drawing_MaskFilterDestroy to free memory
    OH_Drawing_MaskFilterDestroy(maskFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MASK_FILTER_0104
 * @tc.name: testMaskFilterCreateBlurDestroyMaximum
 * @tc.desc: Test for creating and destroying a blur mask filter with maximum values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMaskFilterTest, testMaskFilterCreateBlurDestroyMaximum, TestSize.Level3) {
    // 1. Call OH_Drawing_MaskFilterCreateBlur with a maximum value for sigma
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, FLT_MAX, true);
    // 2. Call OH_Drawing_MaskFilterDestroy to free memory
    OH_Drawing_MaskFilterDestroy(maskFilter);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS