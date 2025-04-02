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

#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_image.h"
#include "drawing_matrix.h"
#include "drawing_path.h"
#include "drawing_path_effect.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "utils/scalar.h"
#include "gtest/gtest.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativePathEffectTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0100
 * @tc.name: testCreateDashPathEffectNormal
 * @tc.desc: test for testCreateDashPathEffectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateDashPathEffectNormal, TestSize.Level0) {
    // 1. OH_Drawing_CreateDashPathEffect
    float intervals[] = {1, 1, 1};
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, 3, 0.0);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0101
 * @tc.name: testCreateDashPathEffectNull
 * @tc.desc: test for testCreateDashPathEffectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateDashPathEffectNull, TestSize.Level3) {
    float intervals[] = {1, 1};
    // 1. OH_Drawing_CreateDashPathEffect with nullptr as the first parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateDashPathEffect(nullptr, 2, 1.0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_CreateDashPathEffect with 0 as the second parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateDashPathEffect(intervals, 0, 1.0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CreateDashPathEffect with 0.0 as the third parameter
    OH_Drawing_PathEffect *pathEffect3 = OH_Drawing_CreateDashPathEffect(intervals, 2, 0.0);
    // 4. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    OH_Drawing_PathEffectDestroy(pathEffect3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0102
 * @tc.name: testCreateDashPathEffectAbnormal
 * @tc.desc: test for testCreateDashPathEffectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateDashPathEffectAbnormal, TestSize.Level3) {
    float intervals[] = {1, 1, 1};
    // 1. OH_Drawing_CreateDashPathEffect with the first parameter not being even
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateDashPathEffect(intervals, 3, 1.0);
    // 2. OH_Drawing_CreateDashPathEffect with the second parameter being negative, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateDashPathEffect(intervals, -3, 1.0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CreateDashPathEffect with the second parameter being 1
    OH_Drawing_PathEffect *pathEffect3 = OH_Drawing_CreateDashPathEffect(intervals, 1, 1.0);
    // 4. OH_Drawing_CreateDashPathEffect with the third parameter being negative
    OH_Drawing_PathEffect *pathEffect4 = OH_Drawing_CreateDashPathEffect(intervals, 3, -1.0);
    // 5. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    OH_Drawing_PathEffectDestroy(pathEffect3);
    OH_Drawing_PathEffectDestroy(pathEffect4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0104
 * @tc.name: testCreateDashPathEffectMultipleCalls
 * @tc.desc: test for testCreateDashPathEffectMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateDashPathEffectMultipleCalls, TestSize.Level3) {
    float intervals[] = {1, 1};
    // 1. Call OH_Drawing_CreateDashPathEffect 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, 2, 1.0);
        // 2. Free memory
        OH_Drawing_PathEffectDestroy(pathEffect);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0200
 * @tc.name: testPathEffectDestroyNormal
 * @tc.desc: test for testPathEffectDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathEffectTest, testPathEffectDestroyNormal, TestSize.Level0) {
    float intervals[] = {1, 1, 1};
    // 1. OH_Drawing_CreateDashPathEffect
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, 3, 0.0);
    // 2. OH_Drawing_PathEffectDestroy
    OH_Drawing_PathEffectDestroy(pathEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0201
 * @tc.name: testPathEffectDestroyNull
 * @tc.desc: test for testPathEffectDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testPathEffectDestroyNull, TestSize.Level3) {
    // 1. OH_Drawing_PathEffectDestroy with nullptr as the parameter
    OH_Drawing_PathEffectDestroy(nullptr);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS