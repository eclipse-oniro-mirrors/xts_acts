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

static ani_double TestCustomDialogSetMask001(ani_env* env, ani_object info)
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

static ani_double TestCustomDialogSetMask002(ani_env* env, ani_object info)
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

static ani_double TestCustomDialogSetMask003(ani_env* env, ani_object info)
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

static ani_double TestCustomDialogSetMask004(ani_env* env, ani_object info)
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
} // namespace ArkUIAniTest