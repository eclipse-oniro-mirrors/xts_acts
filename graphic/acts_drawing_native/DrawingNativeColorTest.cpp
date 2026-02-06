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
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
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

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeColorTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeColorTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeColorTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeColorTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeColorTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_0100
 * @tc.name: testColorSetArgbNormal
 * @tc.desc: test for testColorSetArgbNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeColorTest, testColorSetArgbNormal, Function | SmallTest | Level0) {
    // 1
    uint32_t color = OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF);
    // add assert
    EXPECT_NE(color, 0);
    // 2
    uint32_t color2 = OH_Drawing_ColorSetArgb(0, 0, 0, 0);
    // add assert
    EXPECT_EQ(color2, 0);
    // 3 Compilation error, unable to test
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_0101
 * @tc.name: testColorSetArgbNULL
 * @tc.desc: test for testColorSetArgbNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorTest, testColorSetArgbNULL, Function | SmallTest | Level3) {
    // 1、Passing empty for the first argument of OH_Drawing_ColorSetArgb
    uint32_t color1 = OH_Drawing_ColorSetArgb(0, 0xFF, 0xFF, 0xFF);
    // add assert
    EXPECT_NE(color1, 0);
    // 2、Passing empty for the second argument of OH_Drawing_ColorSetArgb
    uint32_t color2 = OH_Drawing_ColorSetArgb(0xFF, 0, 0xFF, 0xFF);
    // add assert
    EXPECT_NE(color2, 0);
    // 3、Passing empty for the third argument of OH_Drawing_ColorSetArgb
    uint32_t color3 = OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0, 0xFF);
    // add assert
    EXPECT_NE(color3, 0);
    // 4、Passing empty for the fourth argument of OH_Drawing_ColorSetArgb
    uint32_t color4 = OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0);
    // add assert
    EXPECT_NE(color4, 0);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_0102
 * @tc.name: testColorSetArgbMultipleCalls
 * @tc.desc: test for testColorSetArgbMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorTest, testColorSetArgbMultipleCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_ColorSetArgb with random numbers between 0 and 255, 10 times
    for (int i = 0; i < 10; i++) {
        uint32_t color = OH_Drawing_ColorSetArgb(rand() % 256, rand() % 256, rand() % 256, rand() % 256);
        // add assert
        EXPECT_NE(color, 0);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_0103
 * @tc.name: testColorSetArgbAbnormal
 * @tc.desc: test for testColorSetArgbAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorTest, testColorSetArgbAbnormal, Function | SmallTest | Level3) {
    // 1. The first argument of OH_Drawing_ColorSetArgb is a negative number
    uint32_t color1 = OH_Drawing_ColorSetArgb(-0x01, 0xFF, 0xFF, 0xFF);
    // add assert
    EXPECT_NE(color1, 0);
    // 2. The second argument of OH_Drawing_ColorSetArgb is a negative number
    uint32_t color2 = OH_Drawing_ColorSetArgb(0xFF, -0x01, 0xFF, 0xFF);
    // add assert
    EXPECT_NE(color2, 0);
    // 3. The third argument of OH_Drawing_ColorSetArgb is a negative number
    uint32_t color3 = OH_Drawing_ColorSetArgb(0xFF, 0xFF, -0x01, 0xFF);
    // add assert
    EXPECT_NE(color3, 0);
    // 4. The fourth argument of OH_Drawing_ColorSetArgb is a negative number
    uint32_t color4 = OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, -0x01);
    // add assert
    EXPECT_NE(color4, 0);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_0104
 * @tc.name: testColorSetArgbMaximum
 * @tc.desc: test for testColorSetArgbMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorTest, testColorSetArgbMaximum, Function | SmallTest | Level3) {
    // 1
    uint32_t color1 = OH_Drawing_ColorSetArgb(0xFF + 1, 0x00, 0x00, 0xFF);
    // add assert
    EXPECT_NE(color1, 0);
    // 2
    uint32_t color2 = OH_Drawing_ColorSetArgb(0xFF, 0xFF + 1, 0x00, 0xFF);
    // add assert
    EXPECT_NE(color2, 0);
    // 3
    uint32_t color3 = OH_Drawing_ColorSetArgb(0xFF, 0x00, 0xFF + 1, 0xFF);
    // add assert
    EXPECT_NE(color3, 0);
    // 4
    uint32_t color4 = OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0xFF + 1);
    // add assert
    EXPECT_NE(color4, 0);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS