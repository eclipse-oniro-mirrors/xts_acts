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
#include "drawing_pixel_map.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"
#include "image/pixelmap_native.h"
#include "gtest/gtest.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativePixelMapTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativePixelMapTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativePixelMapTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativePixelMapTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativePixelMapTest errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testPixelMapGetFromNativePixelMapNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0100
 * @tc.desc   test for testPixelMapGetFromNativePixelMapNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromNativePixelMapNormal, Function | SmallTest | Level0) {
    // todo: how to get NativePixelMap_?
    NativePixelMap_ *pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
    EXPECT_EQ(drPixelMap, nullptr);
}

/**
 * @tc.name   testPixelMapGetFromNativePixelMapNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0101
 * @tc.desc   test for testPixelMapGetFromNativePixelMapNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromNativePixelMapNull, Function | SmallTest | Level3) {
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(nullptr);
    EXPECT_EQ(drPixelMap, nullptr);
}

/**
 * @tc.name   testPixelMapGetFromNativePixelMapMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0102
 * @tc.desc   test for testPixelMapGetFromNativePixelMapMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromNativePixelMapMultipleCalls, Function | SmallTest | Level3) {
    // todo: how to get NativePixelMap_?
    NativePixelMap_ *pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
        EXPECT_EQ(drPixelMap, nullptr);
    }
}

/**
 * @tc.name   testPixelMapGetFromNativePixelMapBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0102
 * @tc.desc   test for testPixelMapGetFromNativePixelMapBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromNativePixelMapBoundary, Function | SmallTest | Level0) {
    // todo: how to get NativePixelMap_?
    NativePixelMap_ *pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
    EXPECT_EQ(drPixelMap, nullptr);
}

/**
 * @tc.name   testPixelMapGetFromOhPixelMapNativeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0200
 * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromOhPixelMapNativeNormal, Function | SmallTest | Level0) {
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative();
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    // add assert
    EXPECT_NE(drPixelMap, nullptr);
    // 2. Release memory
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_PixelmapNative_Release(pixelMap);
}

/**
 * @tc.name   testPixelMapGetFromOhPixelMapNativeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0201
 * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromOhPixelMapNativeNull, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative with nullptr as parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(nullptr);
    EXPECT_EQ(drPixelMap, nullptr);
}

/**
 * @tc.name   testPixelMapGetFromOhPixelMapNativeMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0202
 * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromOhPixelMapNativeMultipleCalls, Function | SmallTest | Level3) {
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative();
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
        // add assert
        EXPECT_NE(drPixelMap, nullptr);
        OH_Drawing_PixelMapDissolve(drPixelMap);
    }
    OH_PixelmapNative_Release(pixelMap);
}

/**
 * @tc.name   testPixelMapGetFromOhPixelMapNativeBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0203
 * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromOhPixelMapNativeBoundary, Function | SmallTest | Level0) {
    uint32_t width = 4096;
    uint32_t height = 2160;
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative(width, height);
    // add assert
    EXPECT_EQ(pixelMap, nullptr);
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    // add assert
    EXPECT_EQ(drPixelMap, nullptr);
    // 2. Release memory
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_PixelmapNative_Release(pixelMap);
    EXPECT_EQ(pixelMap, nullptr);
}

/**
 * @tc.name   testPixelMapDissolveNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0300
 * @tc.desc   test for testPixelMapDissolveNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapDissolveNormal, Function | SmallTest | Level0) {
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative();
    // add assert
    EXPECT_NE(pixelMap, nullptr);
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    // add assert
    EXPECT_NE(drPixelMap, nullptr);
    // 2. Call OH_Drawing_PixelMapDissolve
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_PixelmapNative_Release(pixelMap);
}

/**
 * @tc.name   testPixelMapDissolveNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0301
 * @tc.desc   test for testPixelMapDissolveNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapDissolveNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_PixelMapDissolve parameter is null
    OH_Drawing_PixelMapDissolve(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS