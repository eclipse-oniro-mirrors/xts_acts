/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

#include <gtest/gtest.h>
#include "image/pixelmap_native.h"
#include "pixelmap_native_impl.h"
#include "common_utils.h"

using namespace testing::ext;
using namespace OHOS::Media;
namespace OHOS {
namespace Media {
class PixelMapNdk2Test : public testing::Test {
public:
    PixelMapNdk2Test() {}
    ~PixelMapNdk2Test() {}
};

/**
 * @tc.name: OH_PixelmapInitializationOptions_SetGetSrcPixelFormat
 * @tc.desc: OH_PixelmapInitializationOptions_SetGetSrcPixelFormat
 * @tc.type: FUNC
 */
HWTEST_F(PixelMapNdk2Test, OH_PixelmapInitializationOptions_SetGetSrcPixelFormat, TestSize.Level3)
{
    GTEST_LOG_(INFO) << "PixelMapNdk2Test: OH_PixelmapNative_InitializationSetOptionsGetSrcPixelFormat start";
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    int32_t srcpixelFormat = 0;
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(ops, 1);
    OH_PixelmapInitializationOptions_GetSrcPixelFormat(ops, &srcpixelFormat);
    ASSERT_EQ(srcpixelFormat, 1);
    Image_ErrorCode ret = OH_PixelmapInitializationOptions_Release(ops);
    ASSERT_EQ(ret, IMAGE_SUCCESS);
    GTEST_LOG_(INFO) << "PixelMapNdk2Test: OH_PixelmapNative_InitializationSetOptionsGetSrcPixelFormat end";
}

/**
 * @tc.name: OH_PixelmapNative_CreateEmptyPixelmap
 * @tc.desc: OH_PixelmapNative_CreateEmptyPixelmap
 * @tc.type: FUNC
 */
HWTEST_F(PixelMapNdk2Test, OH_PixelmapNative_CreateEmptyPixelmap, TestSize.Level3)
{
    GTEST_LOG_(INFO) << "PixelMapNdk2Test: OH_PixelmapNative_CreateEmptyPixelmap start";
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative **pixelmap = nullptr;
    Image_ErrorCode ret = OH_PixelmapNative_CreateEmptyPixelmap(options, pixelmap);
    ASSERT_EQ(ret, IMAGE_BAD_PARAMETER);
    GTEST_LOG_(INFO) << "PixelMapNdk2Test: OH_PixelmapNative_CreateEmptyPixelmap end";
}

/**
 * @tc.name: OH_PixelmapNative_ConvertAlphaFormat
 * @tc.desc: OH_PixelmapNative_ConvertAlphaFormat
 * @tc.type: FUNC
 */
HWTEST_F(PixelMapNdk2Test, OH_PixelmapNative_ConvertAlphaFormat, TestSize.Level3)
{
    GTEST_LOG_(INFO) << "PixelMapNdk2Test: OH_PixelmapNative_ConvertAlphaFormat start";
    OH_PixelmapNative* srcpixelmap = nullptr;
    OH_PixelmapNative* dstpixelmap = nullptr;
    const bool isPremul = false;
    Image_ErrorCode ret = OH_PixelmapNative_ConvertAlphaFormat(srcpixelmap, dstpixelmap, isPremul);
    ASSERT_EQ(ret, IMAGE_BAD_PARAMETER);
    GTEST_LOG_(INFO) << "PixelMapNdk2Test: OH_PixelmapNative_ConvertAlphaFormat end";
}
}
}
