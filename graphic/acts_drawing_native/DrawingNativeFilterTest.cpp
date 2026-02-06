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

#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_error_code.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_image_filter.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_memory_stream.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_shadow_layer.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"
#include "gtest/gtest.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeFilterTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeFilterTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeFilterTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeFilterTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeFilterTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0100
 * @tc.name: testFilterCreateDestroyNormal
 * @tc.desc: Test for creating and destroying a filter with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFilterTest, testFilterCreateDestroyNormal, Function | SmallTest | Level0) {
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    EXPECT_NE(filter, nullptr);

    OH_Drawing_FilterDestroy(filter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0101
 * @tc.name: testFilterCreateDestroyNULL
 * @tc.desc: Test for destroying a filter with NULL parameter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFilterTest, testFilterCreateDestroyNULL, Function | SmallTest | Level3) {
    OH_Drawing_FilterDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0102
 * @tc.name: testFilterCreateDestroyMultipleCalls
 * @tc.desc: Test for creating and destroying a filter multiple times and in loops.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFilterTest, testFilterCreateDestroyMultipleCalls, Function | SmallTest | Level3) {

    for (int i = 0; i < 10; i++) {
        OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
        EXPECT_NE(filter, nullptr);
        OH_Drawing_FilterDestroy(filter);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0200
 * @tc.name: testFilterSetImageFilterNormal
 * @tc.desc: Test for setting an image filter with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFilterTest, testFilterSetImageFilterNormal, Function | SmallTest | Level0) {
    OH_Drawing_Filter *cFilter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(cFilter, nullptr);
    OH_Drawing_ImageFilter *cImageFilter =
        OH_Drawing_ImageFilterCreateBlur(10, 10, OH_Drawing_TileMode::CLAMP, nullptr);
    // add assert
    EXPECT_NE(cImageFilter, nullptr);

    OH_Drawing_FilterSetImageFilter(cFilter, cImageFilter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    OH_Drawing_FilterDestroy(cFilter);
    OH_Drawing_ImageFilterDestroy(cImageFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0201
 * @tc.name: testFilterSetImageFilterNULL
 * @tc.desc: Test for setting an image filter with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFilterTest, testFilterSetImageFilterNULL, Function | SmallTest | Level3) {
    OH_Drawing_Filter *cFilter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(cFilter, nullptr);
    OH_Drawing_ImageFilter *cImageFilter =
        OH_Drawing_ImageFilterCreateBlur(10, 10, OH_Drawing_TileMode::CLAMP, nullptr);
    // add assert
    EXPECT_NE(cImageFilter, nullptr);
    OH_Drawing_FilterSetImageFilter(nullptr, cImageFilter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_FilterSetImageFilter(cFilter, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    OH_Drawing_FilterDestroy(cFilter);
    OH_Drawing_ImageFilterDestroy(cImageFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0202
 * @tc.name: testFilterSetImageFilterMultipleCalls
 * @tc.desc: Test for setting an image filter multiple times with different objects.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFilterTest, testFilterSetImageFilterMultipleCalls, Function | SmallTest | Level3) {
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Filter *cFilter = OH_Drawing_FilterCreate();
        // add assert
        EXPECT_NE(cFilter, nullptr);
        OH_Drawing_ImageFilter *cImageFilter =
            OH_Drawing_ImageFilterCreateBlur(10 + i, 10 + i, OH_Drawing_TileMode::CLAMP, nullptr);
        // add assert
        EXPECT_NE(cImageFilter, nullptr);
        OH_Drawing_FilterSetImageFilter(cFilter, cImageFilter);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        OH_Drawing_FilterDestroy(cFilter);
        OH_Drawing_ImageFilterDestroy(cImageFilter);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0300
 * @tc.name: testFilterSetMaskFilterNormal
 * @tc.desc: Test for setting a mask filter with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFilterTest, testFilterSetMaskFilterNormal, Function | SmallTest | Level0) {
    // 1. Create OH_Drawing_Filter using OH_Drawing_FilterCreate and OH_Drawing_MaskFilter using
    // OH_Drawing_MaskFilterCreateBlur
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(OH_Drawing_BlurType::NORMAL, 10, true);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 2. Set mask filter using OH_Drawing_FilterSetMaskFilter, should return OH_DRAWING_SUCCESS
    OH_Drawing_FilterSetMaskFilter(filter, maskFilter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Destroy objects, should be successful
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_MaskFilterDestroy(maskFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0301
 * @tc.name: testFilterSetMaskFilterNULL
 * @tc.desc: Test for setting a mask filter with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFilterTest, testFilterSetMaskFilterNULL, Function | SmallTest | Level3) {
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(OH_Drawing_BlurType::NORMAL, 10, true);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 1. Pass nullptr as the first parameter to OH_Drawing_FilterSetMaskFilter and check the error code using
    // OH_Drawing_ErrorCodeGet,
    // 1. No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterSetMaskFilter(nullptr, maskFilter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();

    // 2. Pass nullptr as the second parameter to OH_Drawing_FilterSetMaskFilter and check the error code using
    // OH_Drawing_ErrorCodeGet,
    // 2. No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterSetMaskFilter(filter, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // 3. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_MaskFilterDestroy(maskFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0302
 * @tc.name: testFilterSetMaskFilterMultipleCalls
 * @tc.desc: Test for setting a mask filter multiple times with different objects.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFilterTest, testFilterSetMaskFilterMultipleCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_FilterSetMaskFilter 10 times with different OH_Drawing_Filter and OH_Drawing_MaskFilter
    // objects.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
        // add assert
        EXPECT_NE(filter, nullptr);
        OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(OH_Drawing_BlurType::NORMAL, 10 + i, true);
        // add assert
        EXPECT_NE(maskFilter, nullptr);
        OH_Drawing_FilterSetMaskFilter(filter, maskFilter);
        OH_Drawing_FilterDestroy(filter);
        OH_Drawing_MaskFilterDestroy(maskFilter);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0400
 * @tc.name: testFilterSetColorFilterNormal
 * @tc.desc: Test for setting a color filter with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFilterTest, testFilterSetColorFilterNormal, Function | SmallTest | Level0) {
    // 1. Create OH_Drawing_Filter using OH_Drawing_FilterCreate
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    OH_Drawing_ColorFilter *outerFilter = OH_Drawing_ColorFilterCreateLuma();
    // add assert
    EXPECT_NE(outerFilter, nullptr);
    OH_Drawing_ColorFilter *innerFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
    // add assert
    EXPECT_NE(innerFilter, nullptr);
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateCompose(outerFilter, innerFilter);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 2. Set color filter using OH_Drawing_FilterSetColorFilter
    OH_Drawing_FilterSetColorFilter(filter, colorFilter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_FilterGetColorFilter(filter, colorFilter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Destroy objects, should be successful
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_ColorFilterDestroy(outerFilter);
    OH_Drawing_ColorFilterDestroy(innerFilter);
    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0401
 * @tc.name: testFilterSetColorFilterNULL
 * @tc.desc: Test for setting a color filter with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFilterTest, testFilterSetColorFilterNULL, Function | SmallTest | Level3) {
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    OH_Drawing_ColorFilter *outerFilter = OH_Drawing_ColorFilterCreateLuma();
    // add assert
    EXPECT_NE(outerFilter, nullptr);
    OH_Drawing_ColorFilter *innerFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
    // add assert
    EXPECT_NE(innerFilter, nullptr);
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateCompose(outerFilter, innerFilter);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 1. Pass nullptr as the first parameter to OH_Drawing_FilterSetColorFilter and check the error code using
    // OH_Drawing_ErrorCodeGet, No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterSetColorFilter(nullptr, colorFilter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();

    // 2. Pass nullptr as the second parameter to OH_Drawing_FilterSetColorFilter and check the error code using
    // OH_Drawing_ErrorCodeGet, No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterSetColorFilter(filter, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_ErrorCodeReset();

    // 3. Pass nullptr as the first parameter to OH_Drawing_FilterGetColorFilter and check the error code using
    // OH_Drawing_ErrorCodeGet, No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterGetColorFilter(nullptr, colorFilter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();

    // 4. Pass nullptr as the second parameter to OH_Drawing_FilterGetColorFilter and check the error code using
    // OH_Drawing_ErrorCodeGet, No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterGetColorFilter(filter, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 5. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_ColorFilterDestroy(outerFilter);
    OH_Drawing_ColorFilterDestroy(innerFilter);
    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FILTER_0402
 * @tc.name: testFilterSetColorFilterMultipleCalls
 * @tc.desc: Test for setting a color filter multiple times with different objects.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFilterTest, testFilterSetColorFilterMultipleCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_FilterSetColorFilter 10 times with different OH_Drawing_Filter and OH_Drawing_ColorFilter
    // objects. Call successful, errorcode returns OH_DRAWING_SUCCESS
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
        // add assert
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ColorFilter *outerFilter = OH_Drawing_ColorFilterCreateLuma();
        // add assert
        EXPECT_NE(outerFilter, nullptr);
        OH_Drawing_ColorFilter *innerFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
        // add assert
        EXPECT_NE(innerFilter, nullptr);
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateCompose(outerFilter, innerFilter);
        // add assert
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_FilterSetColorFilter(filter, colorFilter);
        OH_Drawing_FilterDestroy(filter);
        OH_Drawing_ColorFilterDestroy(outerFilter);
        OH_Drawing_ColorFilterDestroy(innerFilter);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS