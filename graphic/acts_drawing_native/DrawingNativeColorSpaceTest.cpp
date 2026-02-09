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
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_color_space.h"
#include "drawing_error_code.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeColorSpaceTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeColorSpaceTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeColorSpaceTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeColorSpaceTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeColorSpaceTest errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testColorSpaceCreateSrgbNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0100
 * @tc.desc   Test for creating an sRGB color space with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeColorSpaceTest, testColorSpaceCreateSrgbNormal, Function | SmallTest | Level0) {
    OH_Drawing_ColorSpace *colorSpace = OH_Drawing_ColorSpaceCreateSrgb();
    EXPECT_NE(colorSpace, nullptr);
    OH_Drawing_ColorSpaceDestroy(colorSpace);
}

/**
 * @tc.name   testColorSpaceDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0101
 * @tc.desc   Test for destroying a color space with a NULL parameter.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeColorSpaceTest, testColorSpaceDestroyNull, Function | SmallTest | Level3) {
    OH_Drawing_ColorSpaceDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/**
 * @tc.name   testColorSpaceCreateSrgbMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0102
 * @tc.desc   Test for creating an sRGB color space with multiple calls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeColorSpaceTest, testColorSpaceCreateSrgbMultipleCalls, Function | SmallTest | Level3) {
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ColorSpace *colorSpace = OH_Drawing_ColorSpaceCreateSrgb();
        EXPECT_NE(colorSpace, nullptr);
        OH_Drawing_ColorSpaceDestroy(colorSpace);
    }
}

/**
 * @tc.name   testColorSpaceCreateSrgbLinearNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0200
 * @tc.desc   Test for creating an sRGB linear color space with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeColorSpaceTest, testColorSpaceCreateSrgbLinearNormal, Function | SmallTest | Level0) {
    OH_Drawing_ColorSpace *colorSpace = OH_Drawing_ColorSpaceCreateSrgbLinear();
    EXPECT_NE(colorSpace, nullptr);
    OH_Drawing_ColorSpaceDestroy(colorSpace);
}

/**
 * @tc.name   testColorSpaceCreateSrgbLinearMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0201
 * @tc.desc   Test for creating an sRGB linear color space with multiple calls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeColorSpaceTest, testColorSpaceCreateSrgbLinearMultipleCalls, Function | SmallTest | Level3) {
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ColorSpace *colorSpace = OH_Drawing_ColorSpaceCreateSrgbLinear();
        EXPECT_NE(colorSpace, nullptr);
        OH_Drawing_ColorSpaceDestroy(colorSpace);
    }
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS