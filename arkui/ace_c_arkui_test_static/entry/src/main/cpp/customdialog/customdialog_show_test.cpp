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

static ani_double TestCustomDialogShow001(ani_env* env, ani_object info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    auto ret = dialogAPI->show(customDialog, true);
    ASSERT_EQ(ret, INVALID_PARAM);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogShow002(ani_env* env, ani_object info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    auto ret = dialogAPI->show(customDialog, false);
    ASSERT_EQ(ret, INVALID_PARAM);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogShow003(ani_env* env, ani_object info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    auto ret = dialogAPI->show(nullptr, true);
    ASSERT_EQ(ret, INVALID_PARAM);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogShow004(ani_env* env, ani_object info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    auto ret = dialogAPI->show(nullptr, false);
    ASSERT_EQ(ret, INVALID_PARAM);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogShow005(ani_env* env, ani_object info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto customDialog = dialogAPI->create();
    dialogAPI->setContent(customDialog, column);
    auto event = [](int32_t reason) {
        if (reason == 1) {
            return true;
        }
        return false;
    };
    dialogAPI->registerOnWillDismiss(customDialog, event);
    auto ret = dialogAPI->show(customDialog, true);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}
} // namespace ArkUIAniTest