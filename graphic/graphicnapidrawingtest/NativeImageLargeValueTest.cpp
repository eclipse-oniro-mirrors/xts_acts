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
#include "drawing_bitmap.h"
#include "drawing_image.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeImageLargeValueTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
};

void NativeImageLargeValueTest::SetUpTestCase() {}
void NativeImageLargeValueTest::TearDownTestCase() {}
void NativeImageLargeValueTest::SetUp() {}
void NativeImageLargeValueTest::TearDown() {}

/*
 * @tc.name: NativeImageLargeValueTest_BuildFromBitmap001
 * @tc.desc: test BuildFromBitmap
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageLargeValueTest, NativeImageLargeValueTest_BuildFromBitmap001, TestSize.Level1)
{
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 2160;
    constexpr uint32_t height = 4096;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    EXPECT_TRUE(OH_Drawing_ImageBuildFromBitmap(image, bitmap));
    EXPECT_TRUE(!OH_Drawing_ImageBuildFromBitmap(image, nullptr));
    EXPECT_TRUE(!OH_Drawing_ImageBuildFromBitmap(nullptr, nullptr));
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_ImageDestroy(image);
}

/*
 * @tc.name: NativeImageLargeValueTest_GetWidth001
 * @tc.desc: test GetWidth
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageLargeValueTest, NativeImageLargeValueTest_GetWidth001, TestSize.Level1)
{
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 2160;
    constexpr uint32_t height = 4096;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    EXPECT_EQ(OH_Drawing_ImageGetWidth(image), width);
    EXPECT_EQ(OH_Drawing_ImageGetWidth(nullptr), -1);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_ImageDestroy(image);
}

/*
 * @tc.name: NativeImageLargeValueTest_GetHeight001
 * @tc.desc: test GetHeight
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageLargeValueTest, NativeImageLargeValueTest_GetHeight001, TestSize.Level1)
{
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 2160;
    constexpr uint32_t height = 4096;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    EXPECT_EQ(OH_Drawing_ImageGetHeight(image), height);
    EXPECT_EQ(OH_Drawing_ImageGetHeight(nullptr), -1);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_ImageDestroy(image);
}

/*
 * @tc.name: NativeImageLargeValueTest_GetImageInfo001
 * @tc.desc: test GetImageInfo
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageLargeValueTest, NativeImageLargeValueTest_GetImageInfo001, TestSize.Level1)
{
    OH_Drawing_ImageGetImageInfo(nullptr, nullptr);
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 2160;
    constexpr uint32_t height = 4096;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    OH_Drawing_ImageGetImageInfo(image, nullptr);
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    EXPECT_EQ(imageInfo.width, width);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_ImageDestroy(image);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS