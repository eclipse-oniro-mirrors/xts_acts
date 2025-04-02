/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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

#include <cstdio>
#include "gtest/gtest.h"

#include "drawing_path.h"
#include "drawing_matrix.h"
#include "drawing_rect.h"
#include "drawing_round_rect.h"
#include "draw/path.h"
#include "utils/scalar.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeDrawingPathLargeValueTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
};

void NativeDrawingPathLargeValueTest::SetUpTestCase() {}
void NativeDrawingPathLargeValueTest::TearDownTestCase() {}
void NativeDrawingPathLargeValueTest::SetUp() {}
void NativeDrawingPathLargeValueTest::TearDown() {}

/*
 * @tc.name: NativeDrawingPathLargeValueTest_pathCreate001
 * @tc.desc: test for create drawing_path.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingPathLargeValueTest, NativeDrawingPathLargeValueTest_pathCreate001, TestSize.Level1)
{
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_EQ(path == nullptr, false);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: NativeDrawingPathLargeValueTest_pathMoveTo002
 * @tc.desc: test for PathMoveTo func.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingPathLargeValueTest, NativeDrawingPathLargeValueTest_pathMoveTo002, TestSize.Level1)
{
    OH_Drawing_Path* path1 = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path1, 2160, 4096);
    OH_Drawing_PathMoveTo(path1, -1, 20.6f);
    OH_Drawing_PathDestroy(path1);
}

/*
 * @tc.name: NativeDrawingPathLargeValueTest_pathLineTo003
 * @tc.desc: test for PathLineTo func.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingPathLargeValueTest, NativeDrawingPathLargeValueTest_pathLineTo003, TestSize.Level1)
{
    OH_Drawing_Path* path2 = OH_Drawing_PathCreate();
    OH_Drawing_PathLineTo(path2, 2160, 4096);
    OH_Drawing_PathLineTo(path2, -50, 10.2f);
    OH_Drawing_PathDestroy(path2);
}

/*
 * @tc.name: NativeDrawingPathLargeValueTest_pathReset004
 * @tc.desc: test for PathReset func.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingPathLargeValueTest, NativeDrawingPathLargeValueTest_pathReset004, TestSize.Level1)
{
    OH_Drawing_Path* path3 = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path3, 2160, 4096);
    OH_Drawing_PathReset(path3);
    OH_Drawing_PathDestroy(path3);
}

/*
 * @tc.name: NativeDrawingPathLargeValueTest_pathArcTo005
 * @tc.desc: test for PathArcTo func.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingPathLargeValueTest, NativeDrawingPathLargeValueTest_pathArcTo005, TestSize.Level1)
{
    OH_Drawing_Path* path4 = OH_Drawing_PathCreate();
    OH_Drawing_PathArcTo(path4, 10, 10, 2160, 4096, 0, 90);
    OH_Drawing_PathArcTo(path4, -10, 10, 10, -10, 0, 90);
    OH_Drawing_PathDestroy(path4);
}

/*
 * @tc.name: NativeDrawingPathLargeValueTest_pathQuadTo006
 * @tc.desc: test for PathQuadTo func.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingPathLargeValueTest, NativeDrawingPathLargeValueTest_pathQuadTo006, TestSize.Level1)
{
    OH_Drawing_Path* path5 = OH_Drawing_PathCreate();
    OH_Drawing_PathQuadTo(path5, 0, 0, 2160, 4096);
    OH_Drawing_PathQuadTo(path5, -20.5f, -20.5f, 30, 0);
    OH_Drawing_PathDestroy(path5);
}

/*
 * @tc.name: NativeDrawingPathLargeValueTest_pathCubicTo007
 * @tc.desc: test for PathCubicTo func.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingPathLargeValueTest, NativeDrawingPathLargeValueTest_pathCubicTo007, TestSize.Level1)
{
    OH_Drawing_Path* path6 = OH_Drawing_PathCreate();
    OH_Drawing_PathCubicTo(path6, 30, 40, 60, 0, 2160, 4096);
    OH_Drawing_PathCubicTo(path6, -30, 40, 60, -30.6f, 50, -20);
    OH_Drawing_PathDestroy(path6);
}

/*
 * @tc.name: NativeDrawingPathLargeValueTest_pathClose008
 * @tc.desc: test for PathClose func.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingPathLargeValueTest, NativeDrawingPathLargeValueTest_pathClose008, TestSize.Level1)
{
    OH_Drawing_Path* path7 = OH_Drawing_PathCreate();
    OH_Drawing_PathLineTo(path7, 2160, 4096);
    OH_Drawing_PathClose(path7);
    OH_Drawing_PathDestroy(path7);
}

/*
 * @tc.name: NativeDrawingPathLargeValueTest_pathCopy009
 * @tc.desc: test for PathCopy func.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingPathLargeValueTest, NativeDrawingPathLargeValueTest_pathCopy009, TestSize.Level1)
{
    OH_Drawing_Path* path7 = OH_Drawing_PathCreate();
    OH_Drawing_PathLineTo(path7, 2160, 4096);
    OH_Drawing_PathClose(path7);
    EXPECT_EQ(OH_Drawing_PathCopy(nullptr), nullptr);
    OH_Drawing_Path* pathCopy = OH_Drawing_PathCopy(path7);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path*>(pathCopy)->GetBounds().GetWidth(), 2160.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path*>(pathCopy)->GetBounds().GetHeight(), 4096.0));
    OH_Drawing_PathDestroy(path7);
    OH_Drawing_PathDestroy(pathCopy);
}

/*
 * @tc.name: NativeDrawingPathLargeValueTest_pathAddRect010
 * @tc.desc: test for PathAddRect func.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingPathLargeValueTest, NativeDrawingPathLargeValueTest_pathAddRect010, TestSize.Level1)
{
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathAddRect(nullptr, 50, 50, 2160, 4096, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathAddRect(path, 50, 50, 2160, 4096, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path*>(path)->GetBounds().GetWidth(), 2110.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path*>(path)->GetBounds().GetHeight(), 4046.0));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: NativeDrawingPathLargeValueTest_pathAddRoundRect011
 * @tc.desc: test for PathAddRoundRect  func.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingPathLargeValueTest, NativeDrawingPathLargeValueTest_pathAddRoundRect011, TestSize.Level1)
{
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathAddRect(nullptr, 50, 50, 2160, 4096, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(50, 50, 2160, 4096);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    OH_Drawing_PathAddRoundRect(path, roundRect, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path*>(path)->GetBounds().GetWidth(), 2110.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path*>(path)->GetBounds().GetHeight(), 4046.0));
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS