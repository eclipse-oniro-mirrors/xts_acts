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
#include <random>

#include "gtest/gtest.h"

#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_error_code.h"
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
class DrawingNativeColorFilterTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeColorFilterTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeColorFilterTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeColorFilterTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeColorFilterTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0100
 * @tc.name: testColorFilterCreateBlendModeNormal
 * @tc.desc: test for testColorFilterCreateBlendModeNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateBlendModeNormal, TestSize.Level0) {
    // 1. Enumerate OH_Drawing_BlendMode values in OH_Drawing_ColorFilterCreateBlendMode interface
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    for (int i = 0; i < sizeof(blendMode) / sizeof(blendMode[0]); i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff, blendMode[i]);
        EXPECT_NE(colorFilter, nullptr);
        // 2. Free memory
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0101
 * @tc.name: testColorFilterCreateBlendModeNULL
 * @tc.desc: test for testColorFilterCreateBlendModeNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateBlendModeNULL, TestSize.Level3) {
    // 1. Pass an empty value as the first parameter to OH_Drawing_ColorFilterCreateBlendMode
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateBlendMode(0, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0102
 * @tc.name: testColorFilterCreateBlendModeMultipleCalls
 * @tc.desc: test for testColorFilterCreateBlendModeMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateBlendModeMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_ColorFilterCreateBlendMode, random value between 0x00000000 and 0xFFFFFFFF
    for (int i = 0; i < 10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<uint32_t> dis(0x00000000, 0xFFFFFFFF);
        uint32_t random_number = dis(gen);
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateBlendMode(random_number, BLEND_MODE_CLEAR);
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }

    // 2. Randomly select OH_Drawing_BlendMode values, call 10 times
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    for (int i = 0; i < 10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<uint32_t> dis(0, 28);
        uint32_t random_number = dis(gen);
        OH_Drawing_ColorFilter *colorFilter =
            OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff, blendMode[random_number]);
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0103
 * @tc.name: testColorFilterCreateBlendModeAbnormal
 * @tc.desc: test for testColorFilterCreateBlendModeAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateBlendModeAbnormal, TestSize.Level3) {
    // 1. Pass a negative value as the first parameter to OH_Drawing_ColorFilterCreateBlendMode
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateBlendMode(-0x01, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0104
 * @tc.name: testColorFilterCreateBlendModeMaximum
 * @tc.desc: test for testColorFilterCreateBlendModeMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateBlendModeMaximum, TestSize.Level3) {
    // 1. Pass 0xFFFFFFFF as the first parameter to OH_Drawing_ColorFilterCreateBlendMode
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateBlendMode(0xFFFFFFFF, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0200
 * @tc.name: testColorFilterCreateComposeNormal
 * @tc.desc: test for testColorFilterCreateComposeNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateComposeNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_ColorFilterCreateBlendMode to create colorFilter1 and colorFilter2
    OH_Drawing_ColorFilter *colorFilter1 = OH_Drawing_ColorFilterCreateBlendMode(0x00FFFFFF, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter1, nullptr);
    OH_Drawing_ColorFilter *colorFilter2 = OH_Drawing_ColorFilterCreateBlendMode(0x0000FFFF, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter2, nullptr);
    // 2. Call OH_Drawing_ColorFilterCreateCompose with colorFilter1 and colorFilter2
    OH_Drawing_ColorFilterCreateCompose(colorFilter1, colorFilter2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ColorFilterCreateBlendMode to create colorFilter3
    OH_Drawing_ColorFilter *colorFilter3 = OH_Drawing_ColorFilterCreateBlendMode(0x000000FF, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter3, nullptr);
    // 4. Call OH_Drawing_ColorFilterCreateCompose with colorFilter1 and colorFilter3
    OH_Drawing_ColorFilterCreateCompose(colorFilter1, colorFilter3);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_ColorFilterCreateLuma to create colorFilter4
    OH_Drawing_ColorFilter *colorFilter4 = OH_Drawing_ColorFilterCreateLuma();
    // add assert
    EXPECT_NE(colorFilter4, nullptr);
    // 6. Call OH_Drawing_ColorFilterCreateMatrix to create colorFilter5
    const float matrix[20] = {1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0};
    OH_Drawing_ColorFilter *colorFilter5 = OH_Drawing_ColorFilterCreateMatrix(matrix);
    // add assert
    EXPECT_NE(colorFilter5, nullptr);
    // 7. Call OH_Drawing_ColorFilterCreateCompose with colorFilter4 and colorFilter5
    OH_Drawing_ColorFilterCreateCompose(colorFilter4, colorFilter5);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter1);
    OH_Drawing_ColorFilterDestroy(colorFilter2);
    OH_Drawing_ColorFilterDestroy(colorFilter3);
    OH_Drawing_ColorFilterDestroy(colorFilter4);
    OH_Drawing_ColorFilterDestroy(colorFilter5);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0201
 * @tc.name: testColorFilterCreateComposeNULL
 * @tc.desc: test for testColorFilterCreateComposeNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateComposeNULL, TestSize.Level3) {
    // 1. Pass an empty value as the first parameter to OH_Drawing_ColorFilterCreateBlendMode
    OH_Drawing_ColorFilter *colorFilter1 = OH_Drawing_ColorFilterCreateBlendMode(0, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter1, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter1);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0202
 * @tc.name: testColorFilterCreateComposeMultipleCalls
 * @tc.desc: test for testColorFilterCreateComposeMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateComposeMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_ColorFilterCreateBlendMode with a random value between 0x00000000 and 0xFFFFFFFF
    for (int i = 0; i < 10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<uint32_t> dis(0x00000000, 0xFFFFFFFF);
        uint32_t random_number = dis(gen);
        OH_Drawing_ColorFilter *colorFilter1 = OH_Drawing_ColorFilterCreateBlendMode(random_number, BLEND_MODE_CLEAR);
        // add assert
        EXPECT_NE(colorFilter1, nullptr);
        OH_Drawing_ColorFilter *colorFilter2 = OH_Drawing_ColorFilterCreateBlendMode(random_number, BLEND_MODE_CLEAR);
        // add assert
        EXPECT_NE(colorFilter2, nullptr);
        OH_Drawing_ColorFilterCreateCompose(colorFilter1, colorFilter2);
        OH_Drawing_ColorFilterDestroy(colorFilter1);
        OH_Drawing_ColorFilterDestroy(colorFilter2);
    }
    // 2. Randomly select OH_Drawing_BlendMode values and call 10 times
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    for (int i = 0; i < 10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<uint32_t> dis(0, 28);
        uint32_t random_number = dis(gen);
        OH_Drawing_ColorFilter *colorFilter1 =
            OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff, blendMode[random_number]);
        // add assert
        EXPECT_NE(colorFilter1, nullptr);
        OH_Drawing_ColorFilter *colorFilter2 =
            OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff, blendMode[random_number]);
        // add assert
        EXPECT_NE(colorFilter2, nullptr);
        OH_Drawing_ColorFilterCreateCompose(colorFilter1, colorFilter2);
        OH_Drawing_ColorFilterDestroy(colorFilter1);
        OH_Drawing_ColorFilterDestroy(colorFilter2);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0300
 * @tc.name: testColorFilterCreateMatrixNormal
 * @tc.desc: test for testColorFilterCreateMatrixNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateMatrixNormal, TestSize.Level0) {
    const float matrix[20] = {1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0.5f, 0};
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(colorFilter, nullptr);

    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0301
 * @tc.name: testColorFilterCreateMatrixNULL
 * @tc.desc: test for testColorFilterCreateMatrixNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateMatrixNULL, TestSize.Level3) {
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateMatrix(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();

    const float matrix[20] = {};
    colorFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0302
 * @tc.name: testColorFilterCreateMatrixAbnormal
 * @tc.desc: test for testColorFilterCreateMatrixAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateMatrixAbnormal, TestSize.Level3) {
    const float matrix[19] = {
        1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0.5f,
    };
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    const float matrix2[21] = {
        1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0.5f, 0, 0,
    };
    OH_Drawing_ColorFilter *colorFilter2 = OH_Drawing_ColorFilterCreateMatrix(matrix2);
    // add assert
    EXPECT_NE(colorFilter2, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_ColorFilterDestroy(colorFilter2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0303
 * @tc.name: testColorFilterCreateMatrixMultipleCalls
 * @tc.desc: test for testColorFilterCreateMatrixMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateMatrixMultipleCalls, TestSize.Level3) {
    for (int i = 0; i < 10; i++) {
        const float matrix[20] = {1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0.5f, 0};
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0400
 * @tc.name: testColorFilterCreateLinearToSrgbGammaNormal
 * @tc.desc: test for testColorFilterCreateLinearToSrgbGammaNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateLinearToSrgbGammaNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_ColorFilterCreateLinearToSrgbGamma
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    // add assert
    EXPECT_NE(colorFilter, nullptr);

    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0401
 * @tc.name: testColorFilterCreateLinearToSrgbGammaMultipleCalls
 * @tc.desc: test for testColorFilterCreateLinearToSrgbGammaMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateLinearToSrgbGammaMultipleCalls, TestSize.Level3) {
    // 1、OH_Drawing_ColorFilterCreateLinearToSrgbGamma 调用10次
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0500
 * @tc.name: testColorFilterCreateSrgbGammaToLinearNormal
 * @tc.desc: test for testColorFilterCreateSrgbGammaToLinearNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateSrgbGammaToLinearNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_ColorFilterCreateSrgbGammaToLinear
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0501
 * @tc.name: testColorFilterCreateSrgbGammaToLinearMultipleCalls
 * @tc.desc: test for testColorFilterCreateSrgbGammaToLinearMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateSrgbGammaToLinearMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_ColorFilterCreateSrgbGammaToLinear 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0600
 * @tc.name: testColorFilterCreateLumaNormal
 * @tc.desc: test for testColorFilterCreateLumaNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateLumaNormal, TestSize.Level0) {
    // 1. OH_Drawing_ColorFilterCreateLuma
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLuma();
    EXPECT_NE(colorFilter, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0601
 * @tc.name: testColorFilterCreateLumaMultipleCalls
 * @tc.desc: test for testColorFilterCreateLumaMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterCreateLumaMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_ColorFilterCreateLuma 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLuma();
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0700
 * @tc.name: testColorFilterDestroyNormal
 * @tc.desc: test for testColorFilterDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterDestroyNormal, TestSize.Level0) {
    // 1. OH_Drawing_ColorFilterCreateLuma
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLuma();
    EXPECT_NE(colorFilter, nullptr);
    // 2. OH_Drawing_ColorFilterDestroy()
    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_FILTER_0701
 * @tc.name: testColorFilterDestroyNULL
 * @tc.desc: test for testColorFilterDestroyNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeColorFilterTest, testColorFilterDestroyNULL, TestSize.Level3) {
    // 1. OH_Drawing_ColorFilterDestroy with empty parameter
    OH_Drawing_ColorFilterDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS