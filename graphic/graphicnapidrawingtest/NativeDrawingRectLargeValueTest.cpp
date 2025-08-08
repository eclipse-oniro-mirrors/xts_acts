/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, Hardware
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "gtest/gtest.h"

#include "drawing_color.h"
#include "drawing_filter.h"
#include "drawing_mask_filter.h"
#include "drawing_rect.h"
#include "utils/scalar.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeDrawingRectLargeValueTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
};

void NativeDrawingRectLargeValueTest::SetUpTestCase() {}
void NativeDrawingRectLargeValueTest::TearDownTestCase() {}
void NativeDrawingRectLargeValueTest::SetUp() {}
void NativeDrawingRectLargeValueTest::TearDown() {}

/*
 * @tc.name: NativeDrawingRectLargeValueTest_GetHeight003
 * @tc.desc: test for get height of rect.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingRectLargeValueTest, NativeDrawingRectLargeValueTest_GetHeight003, Function | MediumTest | Level1)
{
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 2160, 4096);
    float height = OH_Drawing_RectGetHeight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(height, 4096)); // 4096 means height
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: NativeDrawingRectLargeValueTest_GetWidth004
 * @tc.desc: test for get width of rect.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingRectLargeValueTest, NativeDrawingRectLargeValueTest_GetWidth004, Function | MediumTest | Level1)
{
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 2160, 4096);
    float width = OH_Drawing_RectGetWidth(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(width, 2160)); // 2160 means width
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: NativeDrawingRectLargeValueTest_SetAndGetBoundary005
 * @tc.desc: test for set and get of rect.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingRectLargeValueTest, NativeDrawingRectLargeValueTest_SetAndGetBoundary005,
    Function | MediumTest | Level1)
{
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 400, 800);
    OH_Drawing_RectSetLeft(rect, 10);
    OH_Drawing_RectSetTop(rect, 10);
    OH_Drawing_RectSetRight(rect, 2160);
    OH_Drawing_RectSetBottom(rect, 4096);
    float left = OH_Drawing_RectGetLeft(rect);
    float top = OH_Drawing_RectGetTop(rect);
    float right = OH_Drawing_RectGetRight(rect);
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 10)); // 10 means left
    EXPECT_TRUE(IsScalarAlmostEqual(top, 10)); // 10 means top
    EXPECT_TRUE(IsScalarAlmostEqual(right, 2160)); // 2160 means right
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, 4096)); // 4096 means bottom
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: NativeDrawingRectLargeValueTest_Copy006
 * @tc.desc: test for Copy of rect.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingRectLargeValueTest, NativeDrawingRectLargeValueTest_Copy006, Function | MediumTest | Level1)
{
    OH_Drawing_Rect* rectSrc = OH_Drawing_RectCreate(0, 0, 400, 800);
    OH_Drawing_Rect* rectDst = OH_Drawing_RectCreate(11, 22, 2160, 4096);
    OH_Drawing_RectCopy(rectDst, rectSrc);
    float left = OH_Drawing_RectGetLeft(rectSrc);
    float top = OH_Drawing_RectGetTop(rectSrc);
    float right = OH_Drawing_RectGetRight(rectSrc);
    float bottom = OH_Drawing_RectGetBottom(rectSrc);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 11)); // 11 means left
    EXPECT_TRUE(IsScalarAlmostEqual(top, 22)); // 22 means top
    EXPECT_TRUE(IsScalarAlmostEqual(right, 2160)); // 2160 means right
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, 4096)); // 4096 means bottom
    OH_Drawing_RectDestroy(rectSrc);
    OH_Drawing_RectDestroy(rectDst);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS