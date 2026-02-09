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

static ani_double TestCustomDialogSetContent001(ani_env* env, ani_object info)
{
    const ArkUI_NativeDialogAPI_1* dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NativeDialogHandle customDialog = dialogAPI->create();
    auto ret = dialogAPI->setContent(customDialog, column);
    ASSERT_EQ(ret, SUCCESS);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogSetContent002(ani_env* env, ani_object info)
{
    const ArkUI_NativeDialogAPI_1* dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NativeDialogHandle customDialog = dialogAPI->create();
    auto ret = dialogAPI->setContent(nullptr, column);
    ASSERT_EQ(ret, INVALID_PARAM);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogSetContent003(ani_env* env, ani_object info)
{
    const ArkUI_NativeDialogAPI_1* dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    ArkUI_NativeDialogHandle customDialog = dialogAPI->create();
    auto ret = dialogAPI->setContent(customDialog, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}

static ani_double TestCustomDialogSetContent004(ani_env* env, ani_object info)
{
    const ArkUI_NativeDialogAPI_1* dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NativeDialogHandle customDialog = dialogAPI->create();
    auto ret = dialogAPI->setContent(nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    dialogAPI->dispose(customDialog);
    NAPI_END;
}
} // namespace ArkUIAniTest