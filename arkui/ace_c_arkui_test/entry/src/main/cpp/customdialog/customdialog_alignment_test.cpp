/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

static napi_value TestCustomDialogAlignment001(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto customDialog = dialogAPI->create();
    dialogAPI->setContent(customDialog, column);
    dialogAPI->show(customDialog, true);
    dialogAPI->close(customDialog);
    auto ret = dialogAPI->setContentAlignment(customDialog, ARKUI_ALIGNMENT_TOP_START, PARAM_0, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomDialogAlignment002(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto customDialog = dialogAPI->create();
    dialogAPI->setContent(customDialog, column);
    dialogAPI->show(customDialog, true);
    dialogAPI->close(customDialog);
    auto ret = dialogAPI->setContentAlignment(customDialog, ARKUI_ALIGNMENT_TOP, PARAM_0, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomDialogAlignment003(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto customDialog = dialogAPI->create();
    dialogAPI->setContent(customDialog, column);
    dialogAPI->show(customDialog, true);
    dialogAPI->close(customDialog);
    auto ret = dialogAPI->setContentAlignment(customDialog, ARKUI_ALIGNMENT_TOP_END, PARAM_0, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomDialogAlignment004(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto customDialog = dialogAPI->create();
    dialogAPI->setContent(customDialog, column);
    dialogAPI->show(customDialog, true);
    dialogAPI->close(customDialog);
    auto ret = dialogAPI->setContentAlignment(customDialog, ARKUI_ALIGNMENT_START, PARAM_0, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomDialogAlignment005(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto customDialog = dialogAPI->create();
    dialogAPI->setContent(customDialog, column);
    dialogAPI->show(customDialog, true);
    dialogAPI->close(customDialog);
    auto ret = dialogAPI->setContentAlignment(customDialog, ARKUI_ALIGNMENT_CENTER, SIZE_50, SIZE_50);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomDialogAlignment006(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto customDialog = dialogAPI->create();
    dialogAPI->setContent(customDialog, column);
    dialogAPI->show(customDialog, true);
    dialogAPI->close(customDialog);
    auto ret = dialogAPI->setContentAlignment(customDialog, ARKUI_ALIGNMENT_END, PARAM_0, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomDialogAlignment007(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto customDialog = dialogAPI->create();
    dialogAPI->setContent(customDialog, column);
    dialogAPI->show(customDialog, true);
    dialogAPI->close(customDialog);
    auto ret = dialogAPI->setContentAlignment(customDialog, ARKUI_ALIGNMENT_BOTTOM_START, PARAM_0, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomDialogAlignment008(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto customDialog = dialogAPI->create();
    dialogAPI->setContent(customDialog, column);
    dialogAPI->show(customDialog, true);
    dialogAPI->close(customDialog);
    auto ret = dialogAPI->setContentAlignment(customDialog, ARKUI_ALIGNMENT_BOTTOM, PARAM_0, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomDialogAlignment009(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto customDialog = dialogAPI->create();
    dialogAPI->setContent(customDialog, column);
    dialogAPI->show(customDialog, true);
    dialogAPI->close(customDialog);
    auto ret = dialogAPI->setContentAlignment(customDialog, ARKUI_ALIGNMENT_BOTTOM_END, PARAM_0, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomDialogAlignment010(napi_env env, napi_callback_info info)
{
    const auto dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto customDialog = dialogAPI->create();
    dialogAPI->setContent(customDialog, column);
    dialogAPI->show(customDialog, true);
    dialogAPI->close(customDialog);
    auto ret = dialogAPI->setContentAlignment(customDialog, -1, PARAM_0, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
} // namespace ArkUICapiTest
