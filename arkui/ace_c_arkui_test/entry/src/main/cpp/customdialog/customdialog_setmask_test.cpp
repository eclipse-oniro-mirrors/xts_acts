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

static napi_value TestCustomDialogSetMask001(napi_env env, napi_callback_info info)
{
    const ArkUI_NativeDialogAPI_1* dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    uint32_t maskColor = COLOR_YELLOW;
    ArkUI_Rect maskRect;
    maskRect.x = PARAM_0;
    maskRect.y = PARAM_0;
    maskRect.width = PARAM_10;
    maskRect.height = PARAM_10;
    auto ret = dialogAPI->setMask(customDialog, maskColor, &maskRect);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static napi_value TestCustomDialogSetMask002(napi_env env, napi_callback_info info)
{
    const ArkUI_NativeDialogAPI_1* dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    uint32_t maskColor = COLOR_YELLOW;
    ArkUI_Rect maskRect;
    maskRect.x = PARAM_0;
    maskRect.y = PARAM_0;
    maskRect.width = PARAM_10;
    maskRect.height = PARAM_10;
    auto ret = dialogAPI->setMask(nullptr, maskColor, &maskRect);
    ASSERT_EQ(ret, INVALID_PARAM);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static napi_value TestCustomDialogSetMask003(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    uint32_t maskColor = PARAM_NEGATIVE_1;
    ArkUI_Rect maskRect;
    maskRect.x = PARAM_0;
    maskRect.y = PARAM_0;
    maskRect.width = PARAM_10;
    maskRect.height = PARAM_10;
    auto ret = dialogAPI->setMask(customDialog, maskColor, &maskRect);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static napi_value TestCustomDialogSetMask004(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    auto customDialog = dialogAPI->create();
    uint32_t maskColor = COLOR_YELLOW;
    ArkUI_Rect maskRect;
    maskRect.x = PARAM_0;
    maskRect.y = PARAM_0;
    maskRect.width = PARAM_NEGATIVE_10;
    maskRect.height = PARAM_10;
    auto ret = dialogAPI->setMask(customDialog, maskColor, &maskRect);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}
} // namespace ArkUICapiTest