/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include "c/drawing_bitmap.h"
#include "c/drawing_types.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeDrawingBitmapTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    protected:
        OH_Drawing_Bitmap* bitmap_ = nullptr;
};

void NativeDrawingBitmapTest::SetUpTestCase() {}
void NativeDrawingBitmapTest::TearDownTestCase() {}
void NativeDrawingBitmapTest::SetUp()
{
    bitmap_ = OH_Drawing_BitmapCreate();
    ASSERT_NE(bitmap_, nullptr);
}

void NativeDrawingBitmapTest::TearDown()
{
    if (bitmap_ != nullptr) {
        OH_Drawing_BitmapDestroy(bitmap_);
        bitmap_ = nullptr;
    }
}

/*
 * @tc.name: NativeDrawingBitmapTest_bitmap002
 * @tc.desc: test for drawing_bitmap build.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingBitmapTest, NativeDrawingBitmapTest_bitmap002, TestSize.Level1)
{
    const unsigned int width = 500;
    const unsigned int height = 500;
    OH_Drawing_BitmapFormat bitmapFormat { COLOR_FORMAT_ALPHA_8, ALPHA_FORMAT_PREMUL };
    OH_Drawing_BitmapBuild(bitmap_, width, height, &bitmapFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(bitmap_));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(bitmap_));
}

/*
 * @tc.name: NativeDrawingBitmapTest_bitmap003
 * @tc.desc: test for drawing_bitmap build.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingBitmapTest, NativeDrawingBitmapTest_bitmap003, TestSize.Level1)
{
    const unsigned int width = 0;
    const unsigned int height = 0;
    OH_Drawing_BitmapFormat bitmapFormat { COLOR_FORMAT_RGB_565, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_BitmapBuild(bitmap_, width, height, &bitmapFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(bitmap_));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(bitmap_));
}

/*
 * @tc.name: NativeDrawingBitmapTest_bitmap004
 * @tc.desc: test for drawing_bitmap build.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingBitmapTest, NativeDrawingBitmapTest_bitmap004, TestSize.Level1)
{
    const unsigned int width = 500;
    const unsigned int height = 500;
    OH_Drawing_BitmapFormat bitmapFormat { COLOR_FORMAT_ARGB_4444, ALPHA_FORMAT_UNPREMUL };
    OH_Drawing_BitmapBuild(bitmap_, width, height, &bitmapFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(bitmap_));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(bitmap_));
    EXPECT_EQ(OH_Drawing_BitmapGetPixels(bitmap_) == nullptr, false);
}

/*
 * @tc.name: NativeDrawingBitmapTest_bitmap005
 * @tc.desc: test for drawing_bitmap build.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingBitmapTest, NativeDrawingBitmapTest_bitmap005, TestSize.Level1)
{
    const unsigned int width = 500;
    const unsigned int height = 500;
    OH_Drawing_BitmapFormat bitmapFormat { COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    OH_Drawing_BitmapBuild(bitmap_, width, height, &bitmapFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(bitmap_));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(bitmap_));
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS