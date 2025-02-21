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
#include "utils/scalar.h"
#include "gtest/gtest.h"
#include <random>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeTypeFaceTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0100
 * @tc.name: testTypefaceCreateDefaultNormal
 * @tc.desc: test for testTypefaceCreateDefaultNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateDefaultNormal, TestSize.Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // 2. OH_Drawing_TypefaceCreateDefault
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // 3. OH_Drawing_FontSetTypeface, call OH_Drawing_FontGetTypeface to get the typeface object
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Typeface *typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 4. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0101
 * @tc.name: testTypefaceCreateDefaultNull
 * @tc.desc: test for testTypefaceCreateDefaultNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateDefaultNull, TestSize.Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // 2. OH_Drawing_FontSetTypeface, pass nullptr as the first parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetTypeface(nullptr, typeface);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_FontSetTypeface, pass nullptr as the second parameter
    OH_Drawing_FontSetTypeface(font, nullptr);
    OH_Drawing_Typeface *typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 4. OH_Drawing_FontGetTypeface, pass nullptr as the parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetTypeface(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0200
 * @tc.name: testTypefaceCreateFromFileNormal
 * @tc.desc: test for testTypefaceCreateFromFileNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromFileNormal, TestSize.Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // 2. OH_Drawing_TypefaceCreateFromFile
    OH_Drawing_Typeface *typefaceFromFile =
        OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", 0);
    // 3. OH_Drawing_FontSetTypeface, call OH_Drawing_FontGetTypeface to get the typeface object
    OH_Drawing_FontSetTypeface(font, typefaceFromFile);
    OH_Drawing_Typeface *typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 4. When the index value is negative, count from the end of the sequence
    OH_Drawing_Typeface *typefaceFromFile2 =
        OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", -1);
    OH_Drawing_FontSetTypeface(font, typefaceFromFile2);
    OH_Drawing_Typeface *typefaceGet2 = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet2, nullptr);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typefaceFromFile);
    OH_Drawing_TypefaceDestroy(typefaceFromFile2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0201
 * @tc.name: testTypefaceCreateFromFileNull
 * @tc.desc: test for testTypefaceCreateFromFileNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromFileNull, TestSize.Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // 2. OH_Drawing_TypefaceCreateFromFile, pass nullptr as the first parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface *typefaceFromFile = OH_Drawing_TypefaceCreateFromFile(nullptr, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_TypefaceCreateFromFile, pass nullptr as the second parameter
    OH_Drawing_Typeface *typefaceFromFile2 =
        OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", 0);
    OH_Drawing_FontSetTypeface(font, typefaceFromFile2);
    OH_Drawing_Typeface *typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 4. OH_Drawing_TypefaceCreateFromFile, pass nullptr as the parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface *typefaceFromFile3 = OH_Drawing_TypefaceCreateFromFile(nullptr, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typefaceFromFile);
    OH_Drawing_TypefaceDestroy(typefaceFromFile2);
    OH_Drawing_TypefaceDestroy(typefaceFromFile3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0300
 * @tc.name: testTypefaceCreateFromStreamNormal
 * @tc.desc: test for testTypefaceCreateFromStreamNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromStreamNormal, TestSize.Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // 2. OH_Drawing_MemoryStream
    char testData[] = "Hello";
    size_t length = sizeof(testData) - 1;
    OH_Drawing_MemoryStream *memoryStream = OH_Drawing_MemoryStreamCreate(testData, length, false);
    ASSERT_TRUE(memoryStream != nullptr);
    // 3. OH_Drawing_TypefaceCreateFromStream
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromStream(memoryStream, 1);
    // 4. OH_Drawing_FontSetTypeface, call OH_Drawing_FontGetTypeface to get the typeface object
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Typeface *typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0301
 * @tc.name: testTypefaceCreateFromStreamNull
 * @tc.desc: test for testTypefaceCreateFromStreamNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromStreamNull, TestSize.Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    char testData[] = "Hello";
    size_t length = sizeof(testData) - 1;
    OH_Drawing_MemoryStream *memoryStream = OH_Drawing_MemoryStreamCreate(testData, length, false);
    // 2. OH_Drawing_TypefaceCreateFromStream, pass nullptr as the first parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateFromStream(nullptr, 1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_TypefaceCreateFromStream, pass nullptr as the second parameter
    OH_Drawing_Typeface *typeface2 = OH_Drawing_TypefaceCreateFromStream(memoryStream, 0);
    // 4. OH_Drawing_TypefaceCreateFromStream, pass nullptr as the parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface *typeface3 = OH_Drawing_TypefaceCreateFromStream(nullptr, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);
    OH_Drawing_TypefaceDestroy(typeface3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0400
 * @tc.name: testTypefaceCreateDestroyNormal
 * @tc.desc: test for testTypefaceCreateDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateDestroyNormal, TestSize.Level0) {
    // 1. OH_Drawing_TypefaceCreateDefault
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // 2. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0401
 * @tc.name: testTypefaceCreateDestroyNull
 * @tc.desc: test for testTypefaceCreateDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateDestroyNull, TestSize.Level3) {
    // 1. OH_Drawing_TypeFaceDestroy
    OH_Drawing_TypefaceDestroy(nullptr);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS