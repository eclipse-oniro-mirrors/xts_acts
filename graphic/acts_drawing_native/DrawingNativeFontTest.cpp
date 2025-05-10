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
#include "gtest/gtest.h"
#include <random>
#include "DrawingNativeScalarCommon.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeFontTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeFontTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeFontTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeFontTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeFontTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0100
 * @tc.name: testFontCreateDestroyNormal
 * @tc.desc: Test for creating and destroying a font object with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontCreateDestroyNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0101
 * @tc.name: testFontCreateDestroyNULL
 * @tc.desc: test for testFontCreateDestroyNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontCreateDestroyNULL, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontDestroy with nullptr as parameter
    OH_Drawing_FontDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0102
 * @tc.name: testFontCreateDestroyMultipleCalls
 * @tc.desc: test for testFontCreateDestroyMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontCreateDestroyMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Font *fonts[10];
    // 1. Call OH_Drawing_FontCreate 10 times
    for (int i = 0; i < 10; i++) {
        fonts[i] = OH_Drawing_FontCreate();
        EXPECT_NE(fonts[i], nullptr);
    }
    // 2. Call OH_Drawing_FontDestroy 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_FontDestroy(fonts[i]);
    }
    // 3. Call OH_Drawing_FontCreate and OH_Drawing_FontDestroy alternately 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Font *font = OH_Drawing_FontCreate();
        // add assert
        EXPECT_NE(font, nullptr);
        OH_Drawing_FontDestroy(font);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0200
 * @tc.name: testFontSetBaselineSnapNormal
 * @tc.desc: test for testFontSetBaselineSnapNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetBaselineSnapNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetBaselineSnap with isForce parameter set to false,
    // verify by calling OH_Drawing_FontIsBaselineSnap to check if the font baseline is aligned with pixels
    OH_Drawing_FontSetBaselineSnap(font, false);
    bool isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
    EXPECT_FALSE(isBaselineSnap);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_FontSetBaselineSnap with isForce parameter set to true,
    // verify by calling OH_Drawing_FontIsBaselineSnap to check if the font baseline is aligned with pixels
    OH_Drawing_FontSetBaselineSnap(font, true);
    isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
    EXPECT_TRUE(isBaselineSnap);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0201
 * @tc.name: testFontSetBaselineSnapNULL
 * @tc.desc: test for testFontSetBaselineSnapNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetBaselineSnapNULL, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_FontSetBaselineSnap with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetBaselineSnap(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontIsBaselineSnap with nullptr as the parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsBaselineSnap(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0202
 * @tc.name: testFontSetBaselineSnapMultipleCalls
 * @tc.desc: test for testFontSetBaselineSnapMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetBaselineSnapMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetBaselineSnap 10 times, and call OH_Drawing_FontIsBaselineSnap each time to check if the
    // font baseline is aligned with pixels
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetBaselineSnap(font, i % 2 == 0);
        bool isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
        EXPECT_EQ(isBaselineSnap, i % 2 == 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0203
 * @tc.name: testFontIsBaselineSnapWhenNoSet
 * @tc.desc: test for testFontIsBaselineSnapWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(DrawingNativeFontTest, testFontIsBaselineSnapWhenNoSet, Function | SmallTest | Level2) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontIsBaselineSnap
    bool isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
    EXPECT_TRUE(isBaselineSnap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0300
 * @tc.name: testFontSetSubpixelNormal
 * @tc.desc: test for testFontSetSubpixelNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetSubpixelNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetSubpixel with isSubpixel parameter set to false,
    // verify by calling OH_Drawing_FontIsSubpixel to check if the glyph is rendered using subpixels
    OH_Drawing_FontSetSubpixel(font, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool isSubpixel = OH_Drawing_FontIsSubpixel(font);
    EXPECT_FALSE(isSubpixel);
    // 3. Call OH_Drawing_FontSetSubpixel with isSubpixel parameter set to true,
    // verify by calling OH_Drawing_FontIsSubpixel to check if the glyph is rendered using subpixels
    OH_Drawing_FontSetSubpixel(font, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    isSubpixel = OH_Drawing_FontIsSubpixel(font);
    EXPECT_TRUE(isSubpixel);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0301
 * @tc.name: testFontSetSubpixelNULL
 * @tc.desc: test for testFontSetSubpixelNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetSubpixelNULL, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_FontSetSubpixel with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetSubpixel(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontIsSubpixel with nullptr as the parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsSubpixel(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0302
 * @tc.name: testFontSetSubpixelMultipleCalls
 * @tc.desc: test for testFontSetSubpixelMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetSubpixelMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsSubpixel 10 times, and call OH_Drawing_FontIsSubpixel each time to check if the glyph is
    // rendered using subpixels
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetSubpixel(font, i % 2 == 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        bool isSubpixel = OH_Drawing_FontIsSubpixel(font);
        EXPECT_EQ(isSubpixel, i % 2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0303
 * @tc.name: testFontIsSubpixelWhenNoSet
 * @tc.desc: test for testFontIsSubpixelWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(DrawingNativeFontTest, testFontIsSubpixelWhenNoSet, Function | SmallTest | Level2) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsSubpixel
    bool isSubpixel = OH_Drawing_FontIsSubpixel(font);
    EXPECT_FALSE(isSubpixel);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0400
 * @tc.name: testFontSetForceAutoHintingNormal
 * @tc.desc: test for testFontSetForceAutoHintingNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetForceAutoHintingNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetForceAutoHinting with isForceAutoHinting parameter set to false,
    // verify by calling OH_Drawing_FontIsForceAutoHinting to check if the glyph outlines are automatically adjusted
    OH_Drawing_FontSetForceAutoHinting(font, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
    EXPECT_FALSE(isForceAutoHinting);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_FontSetForceAutoHinting with isForceAutoHinting parameter set to true,
    // verify by calling OH_Drawing_FontIsForceAutoHinting to check if the glyph outlines are automatically adjusted
    OH_Drawing_FontSetForceAutoHinting(font, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
    EXPECT_TRUE(isForceAutoHinting);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0401
 * @tc.name: testFontSetForceAutoHintingNULL
 * @tc.desc: test for testFontSetForceAutoHintingNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetForceAutoHintingNULL, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_FontSetForceAutoHinting with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetForceAutoHinting(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontIsForceAutoHinting with nullptr as the parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsForceAutoHinting(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0402
 * @tc.name: testFontSetForceAutoHintingMultipleCalls
 * @tc.desc: test for testFontSetForceAutoHintingMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetForceAutoHintingMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetForceAutoHinting 10 times, and call OH_Drawing_FontIsForceAutoHinting each time to
    // check if the glyph outlines are automatically adjusted
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetForceAutoHinting(font, i % 2 == 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        bool isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
        EXPECT_EQ(isForceAutoHinting, i % 2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0403
 * @tc.name: testFontIsForceAutoHintingWhenNoSet
 * @tc.desc: test for testFontIsForceAutoHintingWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontIsForceAutoHintingWhenNoSet, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontIsForceAutoHinting
    bool isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
    EXPECT_FALSE(isForceAutoHinting);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0500
 * @tc.name: testFontSetTypefaceNormal
 * @tc.desc: test for testFontSetTypefaceNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTypefaceNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_TypefaceCreateDefault
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface1, nullptr);
    // 3. Call OH_Drawing_FontSetTypeface, and call OH_Drawing_FontGetTypeface to get the glyph object
    OH_Drawing_FontSetTypeface(font, typeface1);
    OH_Drawing_Typeface *typeface2 = OH_Drawing_FontGetTypeface(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(typeface2, nullptr);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0501
 * @tc.name: testFontSetTypefaceNULL
 * @tc.desc: test for testFontSetTypefaceNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTypefaceNULL, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTypeface with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface, nullptr);
    OH_Drawing_FontSetTypeface(nullptr, typeface);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_FontSetTypeface with nullptr as the second parameter, call OH_Drawing_FontGetTypeface to get
    // the default value
    OH_Drawing_FontSetTypeface(font, nullptr);
    OH_Drawing_Typeface *typeface2 = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typeface2, nullptr);
    // 4. Call OH_Drawing_FontGetTypeface with nullptr as the parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetTypeface(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0502
 * @tc.name: testFontSetTypefaceMultipleCalls
 * @tc.desc: test for testFontSetTypefaceMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTypefaceMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTypeface 10 times (with different typefaces), and call OH_Drawing_FontGetTypeface each
    // time to get the glyph object
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
        // add assert
        EXPECT_NE(typeface, nullptr);
        OH_Drawing_FontSetTypeface(font, typeface);
        OH_Drawing_Typeface *typeface2 = OH_Drawing_FontGetTypeface(font);
        // add assert
        EXPECT_NE(typeface2, nullptr);
        EXPECT_EQ(typeface, typeface2);
        OH_Drawing_TypefaceDestroy(typeface);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0503
 * @tc.name: testFontGetTypefaceWhenNoSet
 * @tc.desc: test for testFontGetTypefaceWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetTypefaceWhenNoSet, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetTypeface to get the glyph object
    OH_Drawing_Typeface *typeface = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typeface, nullptr);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0600
 * @tc.name: testFontSetTextSizeNormal
 * @tc.desc: test for testFontSetTextSizeNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTextSizeNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with textSize parameter set to 100, and call OH_Drawing_FontGetTextSize to get
    // the text size
    OH_Drawing_FontSetTextSize(font, 100);
    float textSize = OH_Drawing_FontGetTextSize(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(textSize, 100);
    // 3. Call OH_Drawing_FontSetTextSize with textSize parameter set to 50.255, and call OH_Drawing_FontGetTextSize to
    // get the text size
    OH_Drawing_FontSetTextSize(font, 50.255);
    textSize = OH_Drawing_FontGetTextSize(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(IsScalarAlmostEqual(textSize, 50.255), true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0601
 * @tc.name: testFontSetTextSizeNULL
 * @tc.desc: test for testFontSetTextSizeNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTextSizeNULL, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetTextSize(nullptr, 100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_FontSetTextSize with 0 as the second parameter
    OH_Drawing_FontSetTextSize(font, 0);
    float textSize = OH_Drawing_FontGetTextSize(font);
    EXPECT_EQ(textSize, 0);
    // 4. Call OH_Drawing_FontGetTextSize with nullptr as the parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetTextSize(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0602
 * @tc.name: testFontSetTextSizeMultipleCalls
 * @tc.desc: test for testFontSetTextSizeMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTextSizeMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize 10 times (with random textSize parameter), and call OH_Drawing_FontGetTextSize
    // each time to get the text size
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        float size = dis(gen);
        OH_Drawing_FontSetTextSize(font, size);
        float textSize = OH_Drawing_FontGetTextSize(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(textSize, size);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0603
 * @tc.name: testFontGetTextSizeWhenNoSet
 * @tc.desc: test for testFontGetTextSizeWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetTextSizeWhenNoSet, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontGetTextSize to get the text size
    float textSize = OH_Drawing_FontGetTextSize(font);
    EXPECT_EQ(textSize, 12);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0604
 * @tc.name: testFontSetTextSizeAbnormal
 * @tc.desc: test for testFontSetTextSizeAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTextSizeAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with textSize parameter set to -100, and call OH_Drawing_FontGetTextSize to
    // get the text size
    OH_Drawing_FontSetTextSize(font, -100);
    float textSize = OH_Drawing_FontGetTextSize(font);
    EXPECT_EQ(textSize, 0);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0700
 * @tc.name: testFontCountTextNormal
 * @tc.desc: test for testFontCountTextNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontCountTextNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // 2. Enumerate through the encoding values in OH_Drawing_FontCountText
    const char *str = "Hello World";
    OH_Drawing_TextEncoding encodes[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF16,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    for (OH_Drawing_TextEncoding encode : encodes) {
        int count = OH_Drawing_FontCountText(font, str, strlen(str), encode);
        switch (encode) {
            case TEXT_ENCODING_UTF8:
                EXPECT_EQ(count, 11);
                break;
            case TEXT_ENCODING_UTF16:
                EXPECT_EQ(count, -1);
                break;
            case TEXT_ENCODING_UTF32:
                EXPECT_EQ(count, 2);
                break;
            case TEXT_ENCODING_GLYPH_ID:
                EXPECT_EQ(count, 5);
                break;
            default:
                break;
        }
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0701
 * @tc.name: testFontCountTextNULL
 * @tc.desc: test for testFontCountTextNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontCountTextNULL, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    // 2. Pass nullptr as the first parameter to OH_Drawing_FontCountText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontCountText(nullptr, str, strlen(str), TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass nullptr as the second parameter to OH_Drawing_FontCountText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontCountText(font, nullptr, strlen(str), TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Pass an empty string as the second parameter and NULL as the third parameter to OH_Drawing_FontCountText
    int count = OH_Drawing_FontCountText(font, "", 0, TEXT_ENCODING_UTF8);
    EXPECT_EQ(count, 0);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0702
 * @tc.name: testFontCountTextMultipleCalls
 * @tc.desc: test for testFontCountTextMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontCountTextMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontCountText 10 times (with different lengths and types of strings, such as Chinese, English,
    // traditional characters, special characters, numbers, etc.)
    const char *strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    for (const char *str : strs) {
        int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
        if (strcmp(str, "Hello World") == 0) { // Use strcmp for string comparison
            EXPECT_EQ(count, 11);
        } else if (strcmp(str, "你好世界") == 0) {
            EXPECT_EQ(count, 4);
        } else if (strcmp(str, "Hello 世界") == 0) {
            EXPECT_EQ(count, 8);
        } else if (strcmp(str, "Hello 世界123") == 0) {
            EXPECT_EQ(count, 11);
        } else if (strcmp(str, "Hello $#@!") == 0) {
            EXPECT_EQ(count, 10);
        } else if (strcmp(str, "繁體中文") == 0) {
            EXPECT_EQ(count, 4);
        }
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0703
 * @tc.name: testFontCountTextAbnormal
 * @tc.desc: test for testFontCountTextAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontCountTextAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with textSize parameter set to -1
    const char *str = "Hello World";
    int count = OH_Drawing_FontCountText(font, str, -1, TEXT_ENCODING_UTF8);
    EXPECT_EQ(count, 0);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0800
 * @tc.name: testFontTextToGlyphsNormal
 * @tc.desc: test for testFontTextToGlyphsNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontTextToGlyphsNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Enumerate through the encoding values in OH_Drawing_FontTextToGlyphs
    const char *str = "Hello World";
    OH_Drawing_TextEncoding encodes[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF16,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    for (OH_Drawing_TextEncoding encode : encodes) {
        int count = OH_Drawing_FontCountText(font, str, strlen(str), encode);
        OH_Drawing_FontTextToGlyphs(font, str, strlen(str), encode, glyphs, count);
    }
    // 3. Pass floating-point values for maxGlyphCount and byteLength parameters in OH_Drawing_FontTextToGlyphs
    OH_Drawing_FontTextToGlyphs(font, str, 11.0f, TEXT_ENCODING_UTF8, glyphs, 11.0f);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0801
 * @tc.name: testFontTextToGlyphsNULL
 * @tc.desc: test for testFontTextToGlyphsNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontTextToGlyphsNULL, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    // 2. Pass nullptr as the first parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(nullptr, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass nullptr as the second parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, nullptr, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Pass an empty string as the third parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, 0, TEXT_ENCODING_UTF8, glyphs, count);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Pass nullptr as the fifth parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, nullptr, count);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 6. Pass 0 as the sixth parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. Pass an empty string as the second parameter to OH_Drawing_FontTextToGlyphs
    OH_Drawing_FontTextToGlyphs(font, "", 0, TEXT_ENCODING_UTF8, glyphs, count);
    // 8. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0802
 * @tc.name: testFontTextToGlyphsMultipleCalls
 * @tc.desc: test for testFontTextToGlyphsMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontTextToGlyphsMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontTextToGlyphs 10 times (with different lengths and types of strings, such as Chinese,
    // English, traditional characters, special characters, numbers, etc.)
    const char *strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    for (const char *str : strs) {
        OH_Drawing_ErrorCodeReset();
        int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
        OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0803
 * @tc.name: testFontTextToGlyphsAbnormal
 * @tc.desc: test for testFontTextToGlyphsAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontTextToGlyphsAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    // 2. Set byteLength parameter to -1 for OH_Drawing_FontTextToGlyphs interface
    // Ignore, no need to test the case with byteLength parameter set to -1
    // 3. Set maxGlyphCount parameter to -1 for OH_Drawing_FontTextToGlyphs interface and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, -1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0804
 * @tc.name: testFontTextToGlyphsMaximum
 * @tc.desc: test for testFontTextToGlyphsMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontTextToGlyphsMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    // 2. Set byteLength parameter to maximum value for OH_Drawing_FontTextToGlyphs interface
    // Ignore, no need to test the case with maximum byteLength parameter
    // 3. Set maxGlyphCount parameter to maximum value for OH_Drawing_FontTextToGlyphs interface
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, INT32_MAX);
    // 4. Set glyphs parameter to maximum value for OH_Drawing_FontTextToGlyphs interface
    uint16_t glyphs2[50] = {UINT16_MAX};
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs2, count);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0900
 * @tc.name: testFontGetWidthsNormal
 * @tc.desc: test for testFontGetWidthsNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontGetWidthsNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontGetWidths
    const char *str = "Hello World";
    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    float widths[50] = {0.f};
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_GT(widths[0], 0.f);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0901
 * @tc.name: testFontGetWidthsNULL
 * @tc.desc: test for testFontGetWidthsNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetWidthsNULL, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    float widths[50] = {0.f};
    // 2. Pass nullptr as the first parameter to OH_Drawing_FontGetWidths and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetWidths(nullptr, glyphs, glyphsCount, widths);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass nullptr as the second parameter to OH_Drawing_FontGetWidths and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetWidths(font, nullptr, glyphsCount, widths);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Pass 0 as the third parameter to OH_Drawing_FontGetWidths and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetWidths(font, glyphs, 0, widths);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Pass nullptr as the fourth parameter to OH_Drawing_FontGetWidths and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0902
 * @tc.name: testFontGetWidthsMultipleCalls
 * @tc.desc: test for testFontGetWidthsMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetWidthsMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetWidths 10 times (with different lengths and types of strings, such as Chinese, English,
    // traditional characters, special characters, numbers, etc.)
    const char *strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    float widths[50] = {0.f};
    for (const char *str : strs) {
        OH_Drawing_ErrorCodeReset();
        int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
        int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
        OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_GT(widths[0], 0.f);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0903
 * @tc.name: testFontGetWidthsAbnormal
 * @tc.desc: test for testFontGetWidthsAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetWidthsAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    float widths[50] = {0.f};
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    // 2. Set byteLength parameter to -1 for OH_Drawing_FontGetWidths interface
    // There is no byteLength parameter
    // 3. Set count parameter to -1 for OH_Drawing_FontGetWidths interface and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetWidths(font, glyphs, -1, widths);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Set widths parameter to -1 for OH_Drawing_FontGetWidths interface
    float widths2[50] = {-1};
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths2);
    // 5. Set count parameter to a floating-point value greater than 0 for OH_Drawing_FontGetWidths interface
    OH_Drawing_FontGetWidths(font, glyphs, 2.0f, widths);
    // 6. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_0904
 * @tc.name: testFontGetWidthsMaximum
 * @tc.desc: test for testFontGetWidthsMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetWidthsMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    float widths[50] = {0.f};
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    // 2. Call OH_Drawing_FontGetWidths interface with maximum value for glyphs parameter
    uint16_t glyphs2[50] = {UINT16_MAX};
    OH_Drawing_FontGetWidths(font, glyphs2, glyphsCount, widths);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_FontGetWidths interface with maximum value for count parameter
    // Ignore, no need to test the case with maximum count parameter
    // 4. Call OH_Drawing_FontGetWidths interface with maximum value for widths parameter
    float widths2[50] = {FLT_MAX};
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1000
 * @tc.name: testFontSetLinearTextNormal
 * @tc.desc: test for testFontSetLinearTextNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetLinearTextNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetLinearText with isLinearText parameter set to false, and then call
    // OH_Drawing_FontIsLinearText to check if the glyphs are scaled linearly
    OH_Drawing_FontSetLinearText(font, false);
    bool isLinearText = OH_Drawing_FontIsLinearText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isLinearText, false);
    // 3. Call OH_Drawing_FontSetLinearText with isLinearText parameter set to true, and then call
    // OH_Drawing_FontIsLinearText to check if the glyphs are scaled linearly
    OH_Drawing_FontSetLinearText(font, true);
    isLinearText = OH_Drawing_FontIsLinearText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isLinearText, true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1001
 * @tc.name: testFontSetLinearTextNULL
 * @tc.desc: test for testFontSetLinearTextNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetLinearTextNULL, Function | SmallTest | Level3) {
    // 1. Pass nullptr as the first parameter to OH_Drawing_FontSetLinearText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetLinearText(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Pass nullptr as the parameter to OH_Drawing_FontIsLinearText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsLinearText(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1002
 * @tc.name: testFontSetLinearTextMultipleCalls
 * @tc.desc: test for testFontSetLinearTextMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetLinearTextMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetLinearText 10 times, and call OH_Drawing_FontIsLinearText to check if the glyphs are
    // scaled linearly
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetLinearText(font, i % 2 == 0);
        bool isLinearText = OH_Drawing_FontIsLinearText(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(isLinearText, i % 2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1003
 * @tc.name: testFontIsLinearTextWhenNoSet
 * @tc.desc: test for testFontIsLinearTextWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontIsLinearTextWhenNoSet, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsLinearText
    bool isLinearText = OH_Drawing_FontIsLinearText(font);
    EXPECT_EQ(isLinearText, false);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1100
 * @tc.name: testFontSetTextSkewXNormal
 * @tc.desc: test for testFontSetTextSkewXNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTextSkewXNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to 10, and then call
    // OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    OH_Drawing_FontSetTextSkewX(font, 10);
    float skewX = OH_Drawing_FontGetTextSkewX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(skewX, 10);
    // 3. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to 0.55, and then call
    // OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    OH_Drawing_FontSetTextSkewX(font, 0.55);
    skewX = OH_Drawing_FontGetTextSkewX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(IsScalarAlmostEqual(skewX, 0.55), true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1101
 * @tc.name: testFontSetTextSkewXNULL
 * @tc.desc: test for testFontSetTextSkewXNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTextSkewXNULL, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Pass nullptr as the first parameter to OH_Drawing_FontSetTextSkewX and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetTextSkewX(nullptr, 10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass 0 as the second parameter to OH_Drawing_FontSetTextSkewX
    OH_Drawing_FontSetTextSkewX(font, 0);
    // 4. Pass nullptr as the parameter to OH_Drawing_FontGetTextSkewX and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetTextSkewX(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1102
 * @tc.name: testFontSetTextSkewXMultipleCalls
 * @tc.desc: test for testFontSetTextSkewXMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTextSkewXMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX 10 times (with random skewX values), and call OH_Drawing_FontGetTextSkewX to
    // get the text skew on the x-axis each time
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 30);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        float val = dis(gen);
        OH_Drawing_FontSetTextSkewX(font, val);
        float skewX = OH_Drawing_FontGetTextSkewX(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(skewX, val);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1103
 * @tc.name: testFontGetTextSkewXWhenNoSet
 * @tc.desc: test for testFontGetTextSkewXWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetTextSkewXWhenNoSet, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    float skewX = OH_Drawing_FontGetTextSkewX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(skewX, 0);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1104
 * @tc.name: testFontSetTextSkewXAbnormal
 * @tc.desc: test for testFontSetTextSkewXAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTextSkewXAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to -1, and then call
    // OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    OH_Drawing_FontSetTextSkewX(font, -1);
    float skewX = OH_Drawing_FontGetTextSkewX(font);
    EXPECT_EQ(skewX, -1);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1105
 * @tc.name: testFontSetTextSkewXMaximum
 * @tc.desc: test for testFontSetTextSkewXMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetTextSkewXMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to FLT_MAX
    OH_Drawing_FontSetTextSkewX(font, FLT_MAX);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1200
 * @tc.name: testFontSetFakeBoldTextNormal
 * @tc.desc: test for testFontSetFakeBoldTextNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetFakeBoldTextNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetFakeBoldText interface with isFakeBoldText parameter set to false, and then call
    // OH_Drawing_FontIsFakeBoldText to check if the stroke width is increased to approximate bold text
    OH_Drawing_FontSetFakeBoldText(font, false);
    bool isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isFakeBoldText, false);
    // 3. Call OH_Drawing_FontSetFakeBoldText interface with isFakeBoldText parameter set to true, and then call
    // OH_Drawing_FontIsFakeBoldText to check if the stroke width is increased to approximate bold text
    OH_Drawing_FontSetFakeBoldText(font, true);
    isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isFakeBoldText, true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1201
 * @tc.name: testFontSetFakeBoldTextNULL
 * @tc.desc: test for testFontSetFakeBoldTextNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetFakeBoldTextNULL, Function | SmallTest | Level3) {
    // 1. Pass nullptr as the first parameter to OH_Drawing_FontSetFakeBoldText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetFakeBoldText(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Pass nullptr as the parameter to OH_Drawing_FontIsFakeBoldText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsFakeBoldText(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1202
 * @tc.name: testFontSetFakeBoldTextMultipleCalls
 * @tc.desc: test for testFontSetFakeBoldTextMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetFakeBoldTextMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetFakeBoldText 10 times, and call OH_Drawing_FontIsFakeBoldText each time to check if the
    // stroke width is increased to approximate bold text
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetFakeBoldText(font, i % 2 == 0);
        bool isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(isFakeBoldText, i % 2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1203
 * @tc.name: testFontIsFakeBoldTextWhenNoSet
 * @tc.desc: test for testFontIsFakeBoldTextWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontIsFakeBoldTextWhenNoSet, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsFakeBoldText
    bool isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
    EXPECT_EQ(isFakeBoldText, false);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1300
 * @tc.name: testFontSetScaleXNormal
 * @tc.desc: test for testFontSetScaleXNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetScaleXNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to 10, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, 10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    float scaleX = OH_Drawing_FontGetScaleX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(scaleX, 10);
    // 3. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to 0.55, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, 0.55);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    scaleX = OH_Drawing_FontGetScaleX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(IsScalarAlmostEqual(scaleX, 0.55), true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1301
 * @tc.name: testFontSetScaleXNULL
 * @tc.desc: test for testFontSetScaleXNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetScaleXNULL, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetScaleX(nullptr, 10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_FontSetScaleX with 0 as the second parameter
    OH_Drawing_FontSetScaleX(font, 0);
    // 4. Call OH_Drawing_FontGetScaleX with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetScaleX(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1302
 * @tc.name: testFontSetScaleXMultipleCalls
 * @tc.desc: test for testFontSetScaleXMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetScaleXMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX 10 times (with random values for scaleX parameter), and call
    // OH_Drawing_FontGetScaleX each time to get the text scale on the x-axis
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 30);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        float val = dis(gen);
        OH_Drawing_FontSetScaleX(font, val);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        float scaleX = OH_Drawing_FontGetScaleX(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(scaleX, val);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1303
 * @tc.name: testFontGetScaleXWhenNoSet
 * @tc.desc: test for testFontGetScaleXWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetScaleXWhenNoSet, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    float scaleX = OH_Drawing_FontGetScaleX(font);
    EXPECT_EQ(scaleX, 1);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1304
 * @tc.name: testFontSetScaleXAbnormal
 * @tc.desc: test for testFontSetScaleXAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetScaleXAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to -1, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, -1);
    float scaleX = OH_Drawing_FontGetScaleX(font);
    EXPECT_EQ(scaleX, -1);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1305
 * @tc.name: testFontSetScaleXMaximum
 * @tc.desc: test for testFontSetScaleXMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetScaleXMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to FLT_MAX, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, FLT_MAX);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1400
 * @tc.name: testFontSetHintingNormal
 * @tc.desc: test for testFontSetHintingNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetHintingNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontSetHinting enum value OH_Drawing_FontHinting coverage verification, call
    // OH_Drawing_FontGetHinting to get the font outline effect enum type
    OH_Drawing_FontHinting hinting[] = {
        FONT_HINTING_NONE,
        FONT_HINTING_SLIGHT,
        FONT_HINTING_NORMAL,
        FONT_HINTING_FULL,
    };
    for (OH_Drawing_FontHinting h : hinting) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetHinting(font, h);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_FontHinting hinting2 = OH_Drawing_FontGetHinting(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(hinting2, h);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1401
 * @tc.name: testFontSetHintingNULL
 * @tc.desc: test for testFontSetHintingNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetHintingNULL, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_FontSetHinting with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetHinting(nullptr, FONT_HINTING_NONE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontGetHinting with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetHinting(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1402
 * @tc.name: testFontSetHintingMultipleCalls
 * @tc.desc: test for testFontSetHintingMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetHintingMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetHinting 10 times (with random enum values), and call OH_Drawing_FontGetHinting each
    // time to get the font outline effect enum type
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dis(0, 3);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_FontHinting hinting = static_cast<OH_Drawing_FontHinting>(dis(gen));
        OH_Drawing_FontSetHinting(font, hinting);
        OH_Drawing_FontHinting hinting2 = OH_Drawing_FontGetHinting(font);
        EXPECT_EQ(hinting2, hinting);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1403
 * @tc.name: testFontGetHintingWhenNoSet
 * @tc.desc: test for testFontGetHintingWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetHintingWhenNoSet, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetHinting
    OH_Drawing_FontHinting hinting = OH_Drawing_FontGetHinting(font);
    EXPECT_EQ(hinting, FONT_HINTING_NORMAL);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1500
 * @tc.name: testFontSetEmbeddedBitmapsNormal
 * @tc.desc: test for testFontSetEmbeddedBitmapsNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetEmbeddedBitmapsNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetEmbeddedBitmaps with false as the isEmbeddedBitmaps parameter, and call
    // OH_Drawing_FontIsEmbeddedBitmaps to check if the glyph is converted to a bitmap
    OH_Drawing_FontSetEmbeddedBitmaps(font, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmbeddedBitmaps, false);
    // 3. Call OH_Drawing_FontSetEmbeddedBitmaps with true as the isEmbeddedBitmaps parameter, and call
    // OH_Drawing_FontIsEmbeddedBitmaps to check if the glyph is converted to a bitmap
    OH_Drawing_FontSetEmbeddedBitmaps(font, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmbeddedBitmaps, true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1501
 * @tc.name: testFontSetEmbeddedBitmapsNULL
 * @tc.desc: test for testFontSetEmbeddedBitmapsNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetEmbeddedBitmapsNULL, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_FontSetEmbeddedBitmaps with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetEmbeddedBitmaps(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontIsEmbeddedBitmaps with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsEmbeddedBitmaps(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1502
 * @tc.name: testFontSetEmbeddedBitmapsMultipleCalls
 * @tc.desc: test for testFontSetEmbeddedBitmapsMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetEmbeddedBitmapsMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetEmbeddedBitmaps 10 times, and call OH_Drawing_FontIsEmbeddedBitmaps each time to check
    // if the glyph is converted to a bitmap
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetEmbeddedBitmaps(font, i % 2 == 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        bool isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(isEmbeddedBitmaps, i % 2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1503
 * @tc.name: testFontIsEmbeddedBitmapsWhenNoSet
 * @tc.desc: test for testFontIsEmbeddedBitmapsWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontIsEmbeddedBitmapsWhenNoSet, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsEmbeddedBitmaps
    bool isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
    EXPECT_EQ(isEmbeddedBitmaps, false);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1600
 * @tc.name: testFontSetEdgingNormal
 * @tc.desc: test for testFontSetEdgingNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontSetEdgingNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontSetEdging enum value OH_Drawing_FontEdging coverage verification, call OH_Drawing_FontGetEdging
    // to get the font edge effect enum type
    OH_Drawing_FontEdging edging[] = {
        FONT_EDGING_ALIAS,
        FONT_EDGING_ANTI_ALIAS,
        FONT_EDGING_SUBPIXEL_ANTI_ALIAS,
    };
    for (OH_Drawing_FontEdging e : edging) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetEdging(font, e);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_FontEdging e2 = OH_Drawing_FontGetEdging(font);
        EXPECT_EQ(e2, e);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1601
 * @tc.name: testFontSetEdgingNULL
 * @tc.desc: test for testFontSetEdgingNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetEdgingNULL, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_FontSetEdging with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetEdging(nullptr, FONT_EDGING_ALIAS);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontGetEdging with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetEdging(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1602
 * @tc.name: testFontSetEdgingMultipleCalls
 * @tc.desc: test for testFontSetEdgingMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontSetEdgingMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetEdging 10 times (with random enum values), and call OH_Drawing_FontGetEdging each time
    // to get the font edge effect enum type
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dis(0, 2);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontEdging edging = static_cast<OH_Drawing_FontEdging>(dis(gen));
        OH_Drawing_FontSetEdging(font, edging);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_FontEdging edging2 = OH_Drawing_FontGetEdging(font);
        EXPECT_EQ(edging2, edging);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1603
 * @tc.name: testFontGetEdgingWhenNoSet
 * @tc.desc: test for testFontGetEdgingWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetEdgingWhenNoSet, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetEdging
    OH_Drawing_FontEdging edging = OH_Drawing_FontGetEdging(font);
    EXPECT_EQ(edging, FONT_EDGING_ANTI_ALIAS);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1700
 * @tc.name: testFontGetMetricsNormal
 * @tc.desc: test for testFontGetMetricsNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontGetMetricsNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetMetrics
    OH_Drawing_Font_Metrics cFontMetrics;
    EXPECT_TRUE(OH_Drawing_FontGetMetrics(font, &cFontMetrics) >= 0);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1701
 * @tc.name: testFontGetMetricsNULL
 * @tc.desc: test for testFontGetMetricsNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetMetricsNULL, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetMetrics with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Font_Metrics cFontMetrics;
    OH_Drawing_FontGetMetrics(nullptr, &cFontMetrics);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_FontGetMetrics with nullptr as the second parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetMetrics(font, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1702
 * @tc.name: testFontGetMetricsMultipleCalls
 * @tc.desc: test for testFontGetMetricsMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontGetMetricsMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetMetrics 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Font_Metrics cFontMetrics;
        EXPECT_TRUE(OH_Drawing_FontGetMetrics(font, &cFontMetrics) >= 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1800
 * @tc.name: testFontMeasureSingleCharacterNormal
 * @tc.desc: test for testFontMeasureSingleCharacterNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontMeasureSingleCharacterNormal, Function | SmallTest | Level0)
{
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    //2. All OH_Drawing_FontMeasureSingleCharacter parameters are entered normally, including str single character,
    // UTF8 encoded Chinese/English characters
    float textWidth = 0.f;
    const char* strOne = "a";
    OH_Drawing_FontMeasureSingleCharacter(font, strOne, &textWidth);
    strOne = "我";
    OH_Drawing_FontMeasureSingleCharacter(font, strOne, &textWidth);
    //3. All OH_Drawing_FontMeasureSingleCharacter parameters are entered normally, including str multi-character,
    // UTF8 encoded Chinese/English characters
    const char* strTwo = "你好";
    OH_Drawing_FontMeasureSingleCharacter(font, strTwo, &textWidth);
    strTwo = "baby";
    OH_Drawing_FontMeasureSingleCharacter(font, strTwo, &textWidth);
    //4. free memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1801
 * @tc.name: testFontMeasureSingleCharacterNull
 * @tc.desc: test for testFontMeasureSingleCharacterNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontMeasureSingleCharacterNull, Function | SmallTest | Level3)
{
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    //2. OH_Drawing_FontMeasureSingleCharacter with the parameter font as null
    float textWidth = 0.f;
    const char *strOne = "a";
    OH_Drawing_FontMeasureSingleCharacter(nullptr, strOne, &textWidth);
    //3. OH_Drawing_FontMeasureSingleCharacter with the parameter str as null
    OH_Drawing_FontMeasureSingleCharacter(font, nullptr, &textWidth);
    //4. OH_Drawing_FontMeasureSingleCharacter with the parameter textWidth as null
    OH_Drawing_FontMeasureSingleCharacter(font, strOne, nullptr);
    //5. free memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1802
 * @tc.name: testFontMeasureSingleCharacterMultipleCalls
 * @tc.desc: test for testFontMeasureSingleCharacterMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontMeasureSingleCharacterMultipleCalls, Function | SmallTest | Level3)
{
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    //2. OH_Drawing_FontMeasureSingleCharacter API is called 10 times as a normal input parameter
    const char *str[] = {
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j"
    };
    float textWidth = 0.f;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_FontMeasureSingleCharacter(font, str[i], &textWidth);
    }
    //3. free memory
    OH_Drawing_FontDestroy(font);
}


/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1900
 * @tc.name: testFontMeasuretextNormal
 * @tc.desc: test for testFontMeasuretextNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontTest, testFontMeasuretextNormal, Function | SmallTest | Level0)
{
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(bounds, nullptr);
    //2. OH_Drawing_FontMeasureText enumeration traversal
    const void *text = "abc";
    const size_t byteLength = 3;
    float textWidth = 0.f;
    OH_Drawing_TextEncoding encodes[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF16,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    for (int i = 0; i < 4; i++) {
        OH_Drawing_FontMeasureText(font, text, byteLength, encodes[i], bounds, &textWidth);
    }
    //3. OH_Drawing_FontMeasureText with the fifth parameter as null(normally)
    OH_Drawing_FontMeasureText(font, text, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth);
    //4. free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(bounds);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1901
 * @tc.name: testFontMeasuretextNull
 * @tc.desc: test for testFontMeasuretextNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontMeasuretextNull, Function | SmallTest | Level3)
{
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(bounds, nullptr);
    // 2. Call OH_Drawing_FontMeasureText with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    const void *text = "abc";
    const size_t byteLength = 3;
    float textWidth = 0.f;
    EXPECT_EQ(OH_Drawing_FontMeasureText(nullptr, text, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_FontMeasureText with nullptr as the second parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_FontMeasureText(font, nullptr, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_FontMeasureText with nullptr or 0 as the third parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_FontMeasureText(font, text, 0, TEXT_ENCODING_UTF8, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_FontMeasureText with nullptr as the sixth parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_FontMeasureText(font, text, byteLength, TEXT_ENCODING_UTF8, bounds, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(bounds);
}


/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1902
 * @tc.name: testFontMeasuretextMultipleCalls
 * @tc.desc: test for testFontMeasuretextMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeFontTest, testFontMeasuretextMultipleCalls, Function | SmallTest | Level3)
{
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *fonts[10];
    for (int i = 0; i < 10; i++) {
        fonts[i] = OH_Drawing_FontCreate();
        // add assert
        EXPECT_NE(fonts[i], nullptr);
    }
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(bounds, nullptr);
    //2. Call OH_Drawing_FontMeasureText 10 times
    const void *text = "abc";
    const size_t byteLength = 3;
    float textWidth = 0.f;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_FontMeasureText(fonts[i], text, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth);
    }
    //3. free memory
    for (int i = 0; i < 10; i++) {
        OH_Drawing_FontDestroy(fonts[i]);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(bounds);
}


/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_1703
 * @tc.name: testFontMeasureSingleCharacter
 * @tc.desc: test for testFontMeasureSingleCharacter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontTest, testFontMeasureSingleCharacter, Function | SmallTest | Level1)
{
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetTextSize(font, 50); // 50 means font text size
    const char* strOne = "a";
    const char* strTwo = "你好";
    float textWidth = 0.f;
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(nullptr, strOne, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, nullptr, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strOne, nullptr);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    const char* strThree = "";
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strThree, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strOne, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    EXPECT_TRUE(textWidth > 0);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strTwo, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    EXPECT_TRUE(textWidth > 0);
    OH_Drawing_FontDestroy(font);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS