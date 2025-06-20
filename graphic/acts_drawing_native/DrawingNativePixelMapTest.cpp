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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0100
 * @tc.name: testPixelMapGetFromNativePixelMapNormal
 * @tc.desc: test for testPixelMapGetFromNativePixelMapNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromNativePixelMapNormal, TestSize.Level0) {
    // todo: how to get NativePixelMap_?
    NativePixelMap_ *pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
    EXPECT_EQ(drPixelMap, nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0101
 * @tc.name: testPixelMapGetFromNativePixelMapNull
 * @tc.desc: test for testPixelMapGetFromNativePixelMapNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromNativePixelMapNull, TestSize.Level3) {
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(nullptr);
    EXPECT_EQ(drPixelMap, nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0102
 * @tc.name: testPixelMapGetFromNativePixelMapMultipleCalls
 * @tc.desc: test for testPixelMapGetFromNativePixelMapMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromNativePixelMapMultipleCalls, TestSize.Level3) {
    // todo: how to get NativePixelMap_?
    NativePixelMap_ *pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
        EXPECT_EQ(drPixelMap, nullptr);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0102
 * @tc.name: testPixelMapGetFromNativePixelMapBoundary
 * @tc.desc: test for testPixelMapGetFromNativePixelMapBoundary.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromNativePixelMapBoundary, TestSize.Level0) {
    // todo: how to get NativePixelMap_?
    NativePixelMap_ *pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
    EXPECT_EQ(drPixelMap, nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0200
 * @tc.name: testPixelMapGetFromOhPixelMapNativeNormal
 * @tc.desc: test for testPixelMapGetFromOhPixelMapNativeNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromOhPixelMapNativeNormal, TestSize.Level0) {
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative();
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    // add assert
    EXPECT_NE(drPixelMap, nullptr);
    // 2. Release memory
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_PixelmapNative_Release(pixelMap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0201
 * @tc.name: testPixelMapGetFromOhPixelMapNativeNull
 * @tc.desc: test for testPixelMapGetFromOhPixelMapNativeNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromOhPixelMapNativeNull, TestSize.Level3) {
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative with nullptr as parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(nullptr);
    EXPECT_EQ(drPixelMap, nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0202
 * @tc.name: testPixelMapGetFromOhPixelMapNativeMultipleCalls
 * @tc.desc: test for testPixelMapGetFromOhPixelMapNativeMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromOhPixelMapNativeMultipleCalls, TestSize.Level3) {
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0203
 * @tc.name: testPixelMapGetFromOhPixelMapNativeBoundary
 * @tc.desc: test for testPixelMapGetFromOhPixelMapNativeBoundary.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapGetFromOhPixelMapNativeBoundary, TestSize.Level0) {
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0300
 * @tc.name: testPixelMapDissolveNormal
 * @tc.desc: test for testPixelMapDissolveNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapDissolveNormal, TestSize.Level0) {
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PIXEL_MAP_0301
 * @tc.name: testPixelMapDissolveNull
 * @tc.desc: test for testPixelMapDissolveNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePixelMapTest, testPixelMapDissolveNull, TestSize.Level3) {
    // 1. OH_Drawing_PixelMapDissolve parameter is null
    OH_Drawing_PixelMapDissolve(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS