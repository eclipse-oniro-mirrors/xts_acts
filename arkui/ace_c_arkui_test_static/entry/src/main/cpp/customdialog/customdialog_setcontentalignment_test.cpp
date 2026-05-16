/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"
#include <arkui/native_dialog.h>

namespace ArkUIAniTest {

static ani_double TestCustomDialogSetContentAlignment001(ani_env* env, ani_object info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    int32_t alignment = PARAM_0;
    float offsetX = PARAM_1;
    float offsetY = PARAM_1;
    int32_t ret = dialogAPI->setContentAlignment(customDialog, alignment, offsetX, offsetY);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogSetContentAlignment002(ani_env* env, ani_object info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    int32_t alignment = PARAM_0;
    float offsetX = PARAM_1;
    float offsetY = PARAM_1;
    int32_t ret = dialogAPI->setContentAlignment(nullptr, alignment, offsetX, offsetY);
    ASSERT_EQ(ret, INVALID_PARAM);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogSetContentAlignment003(ani_env* env, ani_object info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    int32_t alignment = ARKUI_ALIGNMENT_BOTTOM_END;
    float offsetX = PARAM_1;
    float offsetY = PARAM_1;
    int32_t ret = dialogAPI->setContentAlignment(customDialog, alignment, offsetX, offsetY);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogSetContentAlignment004(ani_env* env, ani_object info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    int32_t alignment = PARAM_NEGATIVE_1;
    float offsetX = PARAM_1;
    float offsetY = PARAM_1;
    int32_t ret = dialogAPI->setContentAlignment(customDialog, alignment, offsetX, offsetY);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogSetContentAlignment005(ani_env* env, ani_object info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    int32_t alignment = PARAM_7;
    float offsetX = PARAM_NEGATIVE_1;
    float offsetY = PARAM_1;
    int32_t ret = dialogAPI->setContentAlignment(customDialog, alignment, offsetX, offsetY);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogSetContentAlignment006(ani_env* env, ani_object info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    int32_t alignment = PARAM_7;
    float offsetX = PARAM_1;
    float offsetY = PARAM_NEGATIVE_1;
    int32_t ret = dialogAPI->setContentAlignment(customDialog, alignment, offsetX, offsetY);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}
} // namespace ArkUIAniTest