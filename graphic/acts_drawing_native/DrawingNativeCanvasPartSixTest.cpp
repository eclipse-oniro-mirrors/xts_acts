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

#include "DrawingNativeCanvasCommon.h"
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
#include "drawing_text_blob.h"
#include "drawing_typeface.h"
#include "drawing_pixel_map.h"
#include "image/pixelmap_native.h"

#define DRAW_COLORBLUE 0xFF0000FF

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeCanvasPart6Test : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeCanvasPart6Test Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasPart6Test errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeCanvasPart6Test Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasPart6Test errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testCanvasDrawSingleChaWithFeaturesNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_5501
 * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart6Test, testCanvasDrawSingleChaWithFeaturesNormal, Function | SmallTest | Level0) {
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    const char *str1 = "1";
    const char *str2 = "H";
    const char *str3 = "a";
    const char *str4 = "你";
    const char *str5 = "（";
    const char *str6 = "(";
    const char *str7 = "{";
    const char *str8 = "龘";
    const char *str9 = "無";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    float curX = 100;
    float curY = 100;
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    EXPECT_NE(features, nullptr);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str1, font, curX, curY, features),
    OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str2, font, curX, curY, features),
    OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str3, font, curX, curY, features),
    OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str4, font, curX, curY, features),
    OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str5, font, curX, curY, features),
    OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str6, font, curX, curY, features),
    OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str7, font, curX, curY, features),
    OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str8, font, curX, curY, features),
    OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str9, font, curX, curY, features),
    OH_DRAWING_SUCCESS);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);
}
/**
 * @tc.name   testCanvasDrawSingleChaWithFeaturesAbNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_5502
 * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesAbNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart6Test, testCanvasDrawSingleChaWithFeaturesAbNormal, Function | SmallTest | Level3) {
    float curX = 100.0f;
    float curY = 100.0f;
    float textSize = 50.0f;
    const char *str = "(";
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush, 0xFF0000FF);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_FontSetTextSize(font, textSize);
    OH_Drawing_FontFeatures* feat = OH_Drawing_FontFeaturesCreate();
    EXPECT_NE(feat, nullptr);
    OH_Drawing_ErrorCode code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(nullptr, str, font, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, nullptr, font, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, nullptr, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, font, -100.0f, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, font, curX, -100.0f, feat);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, font, curX, curY, nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, "", font, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_FontFeaturesDestroy(feat);
    OH_Drawing_CanvasDestroy(canvas);
}
/**
 * @tc.name   testCanvasDrawSingleChaWithFeaturesCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_5503
 * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeCanvasPart6Test, testCanvasDrawSingleChaWithFeaturesCalls, Function | SmallTest | Level2) {
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    const char *str1 = "1";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    float curX = 100;
    float curY = 100;
    int count = 10;
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    EXPECT_NE(features, nullptr);
    for (int i = 0; i < count; i++) {
        EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str1, font, curX, curY, features),
            OH_DRAWING_SUCCESS);
    }
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS