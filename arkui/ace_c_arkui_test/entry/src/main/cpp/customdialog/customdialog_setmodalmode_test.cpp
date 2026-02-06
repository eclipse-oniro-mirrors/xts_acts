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
#include <arkui/native_dialog.h>

namespace ArkUICapiTest {

static napi_value TestCustomDialogSetModalMode001(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    bool isModal = true;
    auto ret = dialogAPI->setModalMode(customDialog, isModal);
    dialogAPI->dispose(customDialog);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomDialogSetModalMode002(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    bool isModal = false;
    auto ret = dialogAPI->setModalMode(customDialog, isModal);
    dialogAPI->dispose(customDialog);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomDialogSetModalMode003(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    bool isModal = true;
    auto ret = dialogAPI->setModalMode(nullptr, isModal);
    dialogAPI->dispose(customDialog);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCustomDialogSetModalMode004(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    bool isModal = false;
    auto ret = dialogAPI->setModalMode(nullptr, isModal);
    dialogAPI->dispose(customDialog);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
} // namespace ArkUICapiTest