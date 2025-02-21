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
class DrawingNativeColorTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_0100
 * @tc.name: testColorSetArgbNormal
 * @tc.desc: test for testColorSetArgbNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeColorTest, testColorSetArgbNormal, TestSize.Level0) {
    // 1
    OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF);
    // 2
    OH_Drawing_ColorSetArgb(0, 0, 0, 0);
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
HWTEST_F(DrawingNativeColorTest, testColorSetArgbNULL, TestSize.Level3) {
    // 1、Passing empty for the first argument of OH_Drawing_ColorSetArgb
    OH_Drawing_ColorSetArgb(0, 0xFF, 0xFF, 0xFF);
    // 2、Passing empty for the second argument of OH_Drawing_ColorSetArgb
    OH_Drawing_ColorSetArgb(0xFF, 0, 0xFF, 0xFF);
    // 3、Passing empty for the third argument of OH_Drawing_ColorSetArgb
    OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0, 0xFF);
    // 4、Passing empty for the fourth argument of OH_Drawing_ColorSetArgb
    OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_0102
 * @tc.name: testColorSetArgbMultipleCalls
 * @tc.desc: test for testColorSetArgbMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorTest, testColorSetArgbMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_ColorSetArgb with random numbers between 0 and 255, 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ColorSetArgb(rand() % 256, rand() % 256, rand() % 256, rand() % 256);
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
HWTEST_F(DrawingNativeColorTest, testColorSetArgbAbnormal, TestSize.Level3) {
    // 1. The first argument of OH_Drawing_ColorSetArgb is a negative number
    OH_Drawing_ColorSetArgb(-0x01, 0xFF, 0xFF, 0xFF);
    // 2. The second argument of OH_Drawing_ColorSetArgb is a negative number
    OH_Drawing_ColorSetArgb(0xFF, -0x01, 0xFF, 0xFF);
    // 3. The third argument of OH_Drawing_ColorSetArgb is a negative number
    OH_Drawing_ColorSetArgb(0xFF, 0xFF, -0x01, 0xFF);
    // 4. The fourth argument of OH_Drawing_ColorSetArgb is a negative number
    OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, -0x01);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_0104
 * @tc.name: testColorSetArgbMaximum
 * @tc.desc: test for testColorSetArgbMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorTest, testColorSetArgbMaximum, TestSize.Level3) {
    // 1
    OH_Drawing_ColorSetArgb(0xFF + 1, 0x00, 0x00, 0xFF);
    // 2
    OH_Drawing_ColorSetArgb(0xFF, 0xFF + 1, 0x00, 0xFF);
    // 3
    OH_Drawing_ColorSetArgb(0xFF, 0x00, 0xFF + 1, 0xFF);
    // 4
    OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0xFF + 1);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS