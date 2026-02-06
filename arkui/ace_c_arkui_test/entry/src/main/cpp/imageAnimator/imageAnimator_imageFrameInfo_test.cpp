/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestImageAniMatorImageFramelnfo001(napi_env env, napi_callback_info info)
{
    char *content = "C ImageAnimator Test";
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(content);
    if (ret == nullptr) {
        NAPI_END;
    }
    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    OH_ArkUI_ImageAnimatorFrameInfo_Dispose(ret);
    return result;
}

static napi_value TestImageAniMatorImageFramelnfo002(napi_env env, napi_callback_info info)
{
    ArkUI_DrawableDescriptor* drawableDescripter = nullptr;
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromDrawableDescriptor(drawableDescripter);
    if (ret == nullptr) {
        NAPI_END;
    }
    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    OH_ArkUI_ImageAnimatorFrameInfo_Dispose(ret);
    return result;
}

static napi_value TestImageAniMatorImageFramelnfo003(napi_env env, napi_callback_info info)
{
    char *content = "C ImageAnimator Test";
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(content);
    OH_ArkUI_ImageAnimatorFrameInfo_SetWidth(ret, SIZE_200);
    OH_ArkUI_ImageAnimatorFrameInfo_SetHeight(ret, SIZE_200);
    OH_ArkUI_ImageAnimatorFrameInfo_SetTop(ret, SIZE_20);
    OH_ArkUI_ImageAnimatorFrameInfo_SetLeft(ret, SIZE_20);
    OH_ArkUI_ImageAnimatorFrameInfo_SetDuration(ret, SIZE_600);

    auto value_width = OH_ArkUI_ImageAnimatorFrameInfo_GetWidth(ret);
    ASSERT_EQ(value_width, SIZE_200);
    auto value_height = OH_ArkUI_ImageAnimatorFrameInfo_GetHeight(ret);
    ASSERT_EQ(value_height, SIZE_200);
    auto value_top = OH_ArkUI_ImageAnimatorFrameInfo_GetTop(ret);
    ASSERT_EQ(value_top, SIZE_20);
    auto value_left = OH_ArkUI_ImageAnimatorFrameInfo_GetLeft(ret);
    ASSERT_EQ(value_left, SIZE_20);
    auto value_duration = OH_ArkUI_ImageAnimatorFrameInfo_GetDuration(ret);
    ASSERT_EQ(value_duration, SIZE_600);

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    OH_ArkUI_ImageAnimatorFrameInfo_Dispose(ret);
    return result;
}

static napi_value TestImageAniMatorImageFramelnfo004(napi_env env, napi_callback_info info)
{
    char *content = "C ImageAnimator Test";
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(content);
    OH_ArkUI_ImageAnimatorFrameInfo_SetWidth(ret, PARAM_NEGATIVE_200);
    OH_ArkUI_ImageAnimatorFrameInfo_SetHeight(ret, PARAM_NEGATIVE_200);
    OH_ArkUI_ImageAnimatorFrameInfo_SetTop(ret, PARAM_NEGATIVE_20);
    OH_ArkUI_ImageAnimatorFrameInfo_SetLeft(ret, PARAM_NEGATIVE_20);
    OH_ArkUI_ImageAnimatorFrameInfo_SetDuration(ret, PARAM_NEGATIVE_600);

    auto value_width = OH_ArkUI_ImageAnimatorFrameInfo_GetWidth(ret);
    ASSERT_EQ(value_width, PARAM_NEGATIVE_200);
    auto value_height = OH_ArkUI_ImageAnimatorFrameInfo_GetHeight(ret);
    ASSERT_EQ(value_height, PARAM_NEGATIVE_200);
    auto value_top = OH_ArkUI_ImageAnimatorFrameInfo_GetTop(ret);
    ASSERT_EQ(value_top, PARAM_NEGATIVE_20);
    auto value_left = OH_ArkUI_ImageAnimatorFrameInfo_GetLeft(ret);
    ASSERT_EQ(value_left, PARAM_NEGATIVE_20);
    auto value_duration = OH_ArkUI_ImageAnimatorFrameInfo_GetDuration(ret);
    ASSERT_EQ(value_duration, PARAM_NEGATIVE_600);

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    OH_ArkUI_ImageAnimatorFrameInfo_Dispose(ret);
    return result;
}

static napi_value TestImageAniMatorImageFramelnfo005(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(nullptr);
    ASSERT_OBJ(ret, nullptr);
    NAPI_END;
}

static napi_value TestImageAniMatorImageFramelnfo006(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromDrawableDescriptor(nullptr);
    ASSERT_OBJ(ret, nullptr);
    NAPI_END;
}
} // namespace ArkUICapiTest
