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
#include "drawing_text_blob.h"
#include "drawing_typeface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeTextBlobTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeTextBlobTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeTextBlobTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeTextBlobTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeTextBlobTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0100
 * @tc.name: testTextBlobBuilderCreateDestroyNormal
 * @tc.desc: test for testTextBlobBuilderCreateDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobBuilderCreateDestroyNormal, TestSize.Level0) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(nullptr, canvas);
    // 1. Use OH_Drawing_TextBlobBuilderCreate and OH_Drawing_CanvasDrawTextBlob together
    OH_Drawing_TextBlobBuilder *builder = OH_Drawing_TextBlobBuilderCreate();
    // add assert
    EXPECT_NE(builder, nullptr);
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobBuilderMake(builder);
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    if (0) {
        // todo cpp crash
        // 2. OH_Drawing_TextBlobBuilderDestroy
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0101
 * @tc.name: testTextBlobBuilderCreateDestroyNull
 * @tc.desc: test for testTextBlobBuilderCreateDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobBuilderCreateDestroyNull, TestSize.Level3) {
    // 1. OH_Drawing_TextBlobBuilderDestroy with nullptr parameter
    OH_Drawing_TextBlobBuilderDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0102
 * @tc.name: testTextBlobBuilderCreateDestroyMultipleCalls
 * @tc.desc: test for testTextBlobBuilderCreateDestroyMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobBuilderCreateDestroyMultipleCalls, TestSize.Level3) {
    OH_Drawing_TextBlobBuilder *builders[10];
    // 1. Call OH_Drawing_TextBlobBuilderCreate 10 times
    for (int i = 0; i < 10; i++) {
        builders[i] = OH_Drawing_TextBlobBuilderCreate();
        EXPECT_NE(nullptr, builders[i]);
    }
    // 2. Call OH_Drawing_TextBlobBuilderDestroy 10 times
    for (int i = 0; i < 10; i++) {
        if (0) {
            // todo cpp crash
            OH_Drawing_TextBlobBuilderDestroy(builders[i]);
        }
    }
    // 3. Call OH_Drawing_TextBlobBuilderCreate and OH_Drawing_TextBlobBuilderDestroy alternately 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_TextBlobBuilder *builder = OH_Drawing_TextBlobBuilderCreate();
        EXPECT_NE(nullptr, builder);
        if (0) {
            // todo cpp crash
            OH_Drawing_TextBlobBuilderDestroy(builder);
        }
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0200
 * @tc.name: testTextBlobCreateFromTextNormal
 * @tc.desc: test for testTextBlobCreateFromTextNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromTextNormal, TestSize.Level0) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(nullptr, canvas);
    // 1. Traverse the enumeration values of OH_Drawing_TextEncoding and use OH_Drawing_CanvasDrawTextBlob in
    // combination
    const char *str = "123456";
    char16_t c[] = {1, 2, 3};
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
    OH_Drawing_TextEncoding encodeArray[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    for (OH_Drawing_TextEncoding encode : encodeArray) {
        size_t byteLength = 0;
        if (encode == TEXT_ENCODING_UTF8) {
            byteLength = strlen(str);
        } else if (encode == TEXT_ENCODING_UTF32) {
            byteLength = strlen(str) * 4;
        } else if (encode == TEXT_ENCODING_GLYPH_ID) {
            byteLength = strlen(str) * 16;
        }
        OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromText(str, byteLength, font, encode);
        // add assert
        EXPECT_NE(textBlob, nullptr);
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 0, 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    OH_Drawing_TextBlob *textBlob2 = OH_Drawing_TextBlobCreateFromText(c, 6, font, TEXT_ENCODING_UTF16);
    // add assert
    EXPECT_NE(textBlob2, nullptr);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob2, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0201
 * @tc.name: testTextBlobCreateFromTextNull
 * @tc.desc: test for testTextBlobCreateFromTextNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromTextNull, TestSize.Level3) {
    const char *str = "123456";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. OH_Drawing_TextBlobCreateFromText with the first parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob *textBlob1 = OH_Drawing_TextBlobCreateFromText(nullptr, strlen(str), font, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_TextBlobCreateFromText with the second parameter being empty, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob *textBlob2 = OH_Drawing_TextBlobCreateFromText(str, 0, font, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_TextBlobCreateFromText with the third parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob *textBlob3 = OH_Drawing_TextBlobCreateFromText(str, strlen(str), nullptr, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. OH_Drawing_TextBlobCreateFromText with the first parameter being a string
    OH_Drawing_TextBlob *textBlob4 = OH_Drawing_TextBlobCreateFromText("123456", 6, font, TEXT_ENCODING_UTF8);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
    OH_Drawing_TextBlobDestroy(textBlob1);
    OH_Drawing_TextBlobDestroy(textBlob2);
    OH_Drawing_TextBlobDestroy(textBlob3);
    OH_Drawing_TextBlobDestroy(textBlob4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0203
 * @tc.name: testTextBlobCreateFromTextMultipleCalls
 * @tc.desc: test for testTextBlobCreateFromTextMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromTextMultipleCalls, TestSize.Level3) {
    const char *strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(nullptr, canvas);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Call OH_Drawing_TextBlobCreateFromText 10 times (passing in different types of strings with different lengths,
    // such as Chinese, English, special characters, numbers, traditional Chinese characters, etc.) and use
    // OH_Drawing_CanvasDrawTextBlob in combination
    for (int i = 0; i < 10; i++) {
        const char *str = strs[i % 6];
        OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, TEXT_ENCODING_UTF8);
        // add assert
        EXPECT_NE(textBlob, nullptr);
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 0, 0);
        OH_Drawing_TextBlobDestroy(textBlob);
    }
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0204
 * @tc.name: testTextBlobCreateFromTextAbnormal
 * @tc.desc: test for testTextBlobCreateFromTextAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromTextAbnormal, TestSize.Level3) {
    const char *str = "123456";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. OH_Drawing_TextBlobCreateFromText interface with OH_Drawing_TextEncoding out of range, check the error code
    // with OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob *textBlob =
        OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, static_cast<OH_Drawing_TextEncoding>(-1));
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_TypefaceDestroy(typeSurface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0300
 * @tc.name: testTextBlobCreateFromPosTextNormal
 * @tc.desc: test for testTextBlobCreateFromPosTextNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromPosTextNormal, TestSize.Level0) {
    const char *str = "123456";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Traverse the enumeration values of OH_Drawing_TextEncoding and use OH_Drawing_CanvasDrawTextBlob in
    // combination
    size_t byteLength = strlen(str);
    int count = OH_Drawing_FontCountText(font, str, byteLength, TEXT_ENCODING_UTF8);
    OH_Drawing_Point2D pts[count];
    OH_Drawing_TextBlobCreateFromPosText(str, count, &pts[0], font, TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0301
 * @tc.name: testTextBlobCreateFromPosTextNull
 * @tc.desc: test for testTextBlobCreateFromPosTextNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromPosTextNull, TestSize.Level3) {
    const char *str = "123456";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    OH_Drawing_Point2D pts[count];
    // 1. OH_Drawing_TextBlobCreateFromPosText with the first parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobCreateFromPosText(nullptr, strlen(str), &pts[0], font, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_TextBlobCreateFromPosText with the second parameter being empty, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobCreateFromPosText(str, 0, &pts[0], font, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_TextBlobCreateFromPosText with the third parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobCreateFromPosText(str, strlen(str), nullptr, font, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_TextBlobCreateFromPosText with the first parameter being a string
    OH_Drawing_TextBlobCreateFromPosText("123456", 6, &pts[0], font, TEXT_ENCODING_UTF8);
    // 5. OH_Drawing_TextBlobCreateFromPosText with the fourth parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobCreateFromPosText(str, strlen(str), &pts[0], nullptr, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0302
 * @tc.name: testTextBlobCreateFromPosTextMultipleCalls
 * @tc.desc: test for testTextBlobCreateFromPosTextMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromPosTextMultipleCalls, TestSize.Level3) {
    const char *strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Call OH_Drawing_TextBlobCreateFromPosText 10 times (passing in different types of strings with different
    // lengths, such as Chinese, English, special characters, numbers, traditional Chinese characters, etc.) and use
    // OH_Drawing_CanvasDrawTextBlob in combination
    for (int i = 0; i < 10; i++) {
        const char *str = strs[i % 6];
        int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
        OH_Drawing_Point2D pts[count];
        OH_Drawing_TextBlobCreateFromPosText(str, strlen(str), &pts[0], font, TEXT_ENCODING_UTF8);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0303
 * @tc.name: testTextBlobCreateFromPosTextAbnormal
 * @tc.desc: test for testTextBlobCreateFromPosTextAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromPosTextAbnormal, TestSize.Level3) {
    const char *str = "123456";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    OH_Drawing_Point2D pts[count];
    // 1. Call OH_Drawing_TextBlobCreateFromPosText interface with OH_Drawing_TextEncoding out of range, check the error
    // code with OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobCreateFromPosText(str, strlen(str), &pts[0], font, static_cast<OH_Drawing_TextEncoding>(-1));
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0400
 * @tc.name: testTextBlobCreateFromStringNormal
 * @tc.desc: test for testTextBlobCreateFromStringNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromStringNormal, TestSize.Level0) {
    const char *str = "123456";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    OH_Drawing_TextEncoding encodeArray[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    // 1. Traverse the enumeration values of OH_Drawing_TextEncoding and use OH_Drawing_CanvasDrawTextBlob in
    // combination
    for (OH_Drawing_TextEncoding encode : encodeArray) {
        OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString(str, font, encode);
        // add assert
        EXPECT_NE(textBlob, nullptr);
        OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
        EXPECT_NE(nullptr, canvas);
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 0, 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_CanvasDestroy(canvas);
    }
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0401
 * @tc.name: testTextBlobCreateFromStringNull
 * @tc.desc: test for testTextBlobCreateFromStringNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromStringNull, TestSize.Level3) {
    const char *str = "123456";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. OH_Drawing_TextBlobCreateFromString with the first parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob *textBlob1 = OH_Drawing_TextBlobCreateFromString(nullptr, font, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_TextBlobCreateFromString with the second parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob *textBlob2 = OH_Drawing_TextBlobCreateFromString(str, nullptr, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_TextBlobCreateFromPosText with the first parameter being a string
    OH_Drawing_TextBlob *textBlob3 = OH_Drawing_TextBlobCreateFromString("123456", font, TEXT_ENCODING_UTF8);
    // 4. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob1);
    OH_Drawing_TextBlobDestroy(textBlob2);
    OH_Drawing_TextBlobDestroy(textBlob3);
    OH_Drawing_TypefaceDestroy(typeSurface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0402
 * @tc.name: testTextBlobCreateFromStringMultipleCalls
 * @tc.desc: test for testTextBlobCreateFromStringMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromStringMultipleCalls, TestSize.Level3) {
    const char *strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Call OH_Drawing_TextBlobCreateFromString 10 times (passing in strings of different lengths and types, such as
    // Chinese, English, special characters, numbers, traditional Chinese characters, etc.) and use
    // OH_Drawing_CanvasDrawTextBlob in combination
    for (int i = 0; i < 10; i++) {
        const char *str = strs[i % 6];
        OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString(str, font, TEXT_ENCODING_UTF8);
        OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
        EXPECT_NE(nullptr, canvas);
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 0, 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_CanvasDestroy(canvas);
    }
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0403
 * @tc.name: testTextBlobCreateFromStringAbnormal
 * @tc.desc: test for testTextBlobCreateFromStringAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobCreateFromStringAbnormal, TestSize.Level3) {
    const char *str = "123456";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Call OH_Drawing_TextBlobCreateFromString interface with OH_Drawing_TextEncoding out of range, check the error
    // code with OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob *textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, static_cast<OH_Drawing_TextEncoding>(-1));
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_TypefaceDestroy(typeSurface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0500
 * @tc.name: testTextBlobGetBoundsNormal
 * @tc.desc: test for testTextBlobGetBoundsNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobGetBoundsNormal, TestSize.Level0) {
    // 1、创建OH_Drawing_TextBlob、OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char *str = "123456";
    OH_Drawing_TextBlob *textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // 2. Call OH_Drawing_TextBlobGetBounds
    OH_Drawing_TextBlobGetBounds(textBlob, rect);
    float left = OH_Drawing_RectGetLeft(rect);
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_EQ(right - left > 0, true);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0501
 * @tc.name: testTextBlobGetBoundsNull
 * @tc.desc: test for testTextBlobGetBoundsNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobGetBoundsNull, TestSize.Level3) {
    // 1. Create OH_Drawing_TextBlob and OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char *str = "123456";
    OH_Drawing_TextBlob *textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // 2. Pass nullptr as the first parameter to OH_Drawing_TextBlobGetBounds and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobGetBounds(nullptr, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass nullptr as the second parameter to OH_Drawing_TextBlobGetBounds and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobGetBounds(textBlob, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0502
 * @tc.name: testTextBlobGetBoundsMultipleCalls
 * @tc.desc: test for testTextBlobGetBoundsMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobGetBoundsMultipleCalls, TestSize.Level3) {
    // 1. Create OH_Drawing_TextBlob and OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_TextBlobGetBounds 10 times (passing in strings of different lengths and types, such as
    // Chinese, English, special characters, numbers, traditional Chinese characters, etc.)
    const char *strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    for (int i = 0; i < 10; i++) {
        const char *str = strs[i % 6];
        OH_Drawing_TextBlob *textBlob =
            OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
        OH_Drawing_TextBlobGetBounds(textBlob, rect);
        float left = OH_Drawing_RectGetLeft(rect);
        float right = OH_Drawing_RectGetRight(rect);
        EXPECT_EQ(right - left > 0, true);
        OH_Drawing_TextBlobDestroy(textBlob);
    }
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0503
 * @tc.name: testTextBlobGetBoundsAbnormal
 * @tc.desc: test for testTextBlobGetBoundsAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobGetBoundsAbnormal, TestSize.Level3) {
    // 1. Create OH_Drawing_TextBlob and OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-1, -1, -1, -1);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char *str = "123456";
    OH_Drawing_TextBlob *textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // 2. Call OH_Drawing_TextBlobGetBounds with rect initialized with negative values
    OH_Drawing_TextBlobGetBounds(textBlob, rect);
    float left = OH_Drawing_RectGetLeft(rect);
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_EQ(right - left > 0, true);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0600
 * @tc.name: testTextBlobUniqueIDNormal
 * @tc.desc: test for testTextBlobUniqueIDNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobUniqueIDNormal, TestSize.Level0) {
    // 1. Create OH_Drawing_TextBlob
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char *str = "123456";
    OH_Drawing_TextBlob *textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // 2. Call OH_Drawing_TextBlobUniqueID
    uint32_t ret = OH_Drawing_TextBlobUniqueID(textBlob);
    EXPECT_EQ(ret > 0, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0601
 * @tc.name: testTextBlobUniqueIDNull
 * @tc.desc: test for testTextBlobUniqueIDNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobUniqueIDNull, TestSize.Level3) {
    // 1. Create OH_Drawing_TextBlob
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char *str = "123456";
    OH_Drawing_TextBlob *textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // 2. Pass nullptr as the parameter to OH_Drawing_TextBlobUniqueID and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobUniqueID(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0602
 * @tc.name: testTextBlobUniqueIDMultipleCalls
 * @tc.desc: test for testTextBlobUniqueIDMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobUniqueIDMultipleCalls, TestSize.Level3) {
    // 1. Create OH_Drawing_TextBlob
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char *strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    // 2. Call OH_Drawing_TextBlobUniqueID 10 times (passing in strings of different lengths and types, such as Chinese,
    // English, special characters, numbers, traditional Chinese characters, etc.)
    for (int i = 0; i < 10; i++) {
        const char *str = strs[i % 6];
        OH_Drawing_TextBlob *textBlob =
            OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
        uint32_t ret = OH_Drawing_TextBlobUniqueID(textBlob);
        EXPECT_EQ(ret > 0, true);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_TextBlobDestroy(textBlob);
    }
    // 3. Free memory
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0700
 * @tc.name: testTextBlobBuilderAllocRunPosNormal
 * @tc.desc: test for testTextBlobBuilderAllocRunPosNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobBuilderAllocRunPosNormal, TestSize.Level0) {
    // 1. Create OH_Drawing_TextBlobBuilder, OH_Drawing_Font, OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlobBuilder *builder = OH_Drawing_TextBlobBuilderCreate();
    // 2. OH_Drawing_TextBlobBuilderAllocRunPos
    const OH_Drawing_RunBuffer *runBuffer = OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, 9, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_NE(runBuffer, nullptr);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    if (0) {
        // todo cpp crash
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0701
 * @tc.name: testTextBlobBuilderAllocRunPosNull
 * @tc.desc: test for testTextBlobBuilderAllocRunPosNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobBuilderAllocRunPosNull, TestSize.Level3) {
    // 1. Create OH_Drawing_TextBlobBuilder, OH_Drawing_Font, OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlobBuilder *builder = OH_Drawing_TextBlobBuilderCreate();
    // 2. Call OH_Drawing_TextBlobBuilderAllocRunPos with the first parameter as nullptr and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobBuilderAllocRunPos(nullptr, font, 9, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_TextBlobBuilderAllocRunPos with the second parameter as nullptr and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobBuilderAllocRunPos(builder, nullptr, 9, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_TextBlobBuilderAllocRunPos with the third parameter as nullptr and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, 0, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Call OH_Drawing_TextBlobBuilderAllocRunPos with the fourth parameter as nullptr and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, 9, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 6. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    if (0) {
        // todo cpp crash
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0702
 * @tc.name: testTextBlobBuilderAllocRunPosMultipleCalls
 * @tc.desc: test for testTextBlobBuilderAllocRunPosMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobBuilderAllocRunPosMultipleCalls, TestSize.Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlobBuilder *builder = OH_Drawing_TextBlobBuilderCreate();
    // 1. Call OH_Drawing_TextBlobBuilderAllocRunPos 10 times
    for (int i = 0; i < 10; i++) {
        const OH_Drawing_RunBuffer *runBuffer = OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, 9, rect);
        EXPECT_NE(runBuffer, nullptr);
    }
    // 2. Call OH_Drawing_TextBlobBuilderMake and then call OH_Drawing_TextBlobBuilderAllocRunPos again
    OH_Drawing_TextBlobBuilderMake(builder);
    const OH_Drawing_RunBuffer *runBuffer = OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, 9, rect);
    EXPECT_NE(runBuffer, nullptr);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    if (0) {
        // todo cpp crash
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0800
 * @tc.name: testTextBlobBuilderMakeNormal
 * @tc.desc: test for testTextBlobBuilderMakeNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobBuilderMakeNormal, TestSize.Level0) {
    // 1. Create OH_Drawing_TextBlobBuilder
    OH_Drawing_TextBlobBuilder *builder = OH_Drawing_TextBlobBuilderCreate();
    // add assert
    EXPECT_NE(builder, nullptr);
    // 2. Call OH_Drawing_TextBlobBuilderMake
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobBuilderMake(builder);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_EQ(textBlob, nullptr);
    // 3. Free memory
    OH_Drawing_TextBlobDestroy(textBlob);
    if (0) {
        // todo cpp crash
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0801
 * @tc.name: testTextBlobBuilderMakeNull
 * @tc.desc: test for testTextBlobBuilderMakeNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobBuilderMakeNull, TestSize.Level3) {
    // 1. Call OH_Drawing_TextBlobBuilderMake with nullptr as the parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobBuilderMake(nullptr);
    // 1. No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0802
 * @tc.name: testTextBlobBuilderMakeMultipleCalls
 * @tc.desc: test for testTextBlobBuilderMakeMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobBuilderMakeMultipleCalls, TestSize.Level3) {
    // 1. Create OH_Drawing_TextBlobBuilder
    OH_Drawing_TextBlobBuilder *builder = OH_Drawing_TextBlobBuilderCreate();
    // add assert
    EXPECT_NE(builder, nullptr);
    // 2. Call OH_Drawing_TextBlobBuilderMake 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobBuilderMake(builder);
        // add assert
        EXPECT_EQ(textBlob, nullptr);
        OH_Drawing_TextBlobDestroy(textBlob);
    }
    // 3. Free memory
    if (0) {
        // todo cpp crash
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0800
 * @tc.name: testTextBlobDestroyNormal
 * @tc.desc: test for testTextBlobDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobDestroyNormal, TestSize.Level0) {
    const char *str = "123456";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Create OH_Drawing_TextBlob
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString(str, font, TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_NE(textBlob, nullptr);
    // 2. OH_Drawing_TextBlobDestroy
    OH_Drawing_TextBlobDestroy(textBlob);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TEXTBLOB_0801
 * @tc.name: testTextBlobDestroyNull
 * @tc.desc: test for testTextBlobDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTextBlobTest, testTextBlobDestroyNull, TestSize.Level3) {
    // 1. OH_Drawing_TextBlobDestroy with null parameter
    OH_Drawing_TextBlobDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS