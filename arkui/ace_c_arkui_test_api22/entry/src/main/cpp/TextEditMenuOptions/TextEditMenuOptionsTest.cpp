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
#include <arkui/native_node.h>
#include <arkui/native_interface.h>

namespace ArkUICapiTest {

static napi_value Test_OH_ArkUI_TextEditMenuOptions01(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_TextEditMenuOptions *editMenuOptions = OH_ArkUI_TextEditMenuOptions_Create();
    ASSERT_EQ(editMenuOptions == nullptr, false);
    ArkUI_AttributeItem menuOptionItem = {.object = editMenuOptions};
    nodeAPI->setAttribute(text, NODE_TEXT_EDIT_MENU_OPTIONS, &menuOptionItem);
    OH_ArkUI_TextEditMenuOptions_Dispose(editMenuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextEditMenuOptions02(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_TextEditMenuOptions *editMenuOptions = OH_ArkUI_TextEditMenuOptions_Create();
    char *onCreateUserData = "onCreateUserData";
    auto result = OH_ArkUI_TextEditMenuOptions_RegisterOnCreateMenuCallback(
        editMenuOptions, reinterpret_cast<void *>(onCreateUserData),
        [](ArkUI_TextMenuItemArray *items, void *userData) {});
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditMenuOptions_Dispose(editMenuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextEditMenuOptions03(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    char *onCreateUserData = "onCreateUserData";
    auto result = OH_ArkUI_TextEditMenuOptions_RegisterOnCreateMenuCallback(
        {}, reinterpret_cast<void *>(onCreateUserData),
        [](ArkUI_TextMenuItemArray *items, void *userData) {});
    ASSERT_EQ(result, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextEditMenuOptions04(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    char *onPrepareUserData = "onPrepareUserData";
    ArkUI_TextEditMenuOptions *editMenuOptions = OH_ArkUI_TextEditMenuOptions_Create();
    auto result = OH_ArkUI_TextEditMenuOptions_RegisterOnPrepareMenuCallback(
        editMenuOptions, reinterpret_cast<void *>(onPrepareUserData),
        [](ArkUI_TextMenuItemArray *items, void *userData) {});
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditMenuOptions_Dispose(editMenuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextEditMenuOptions05(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    char *onPrepareUserData = "onPrepareUserData";
    auto result = OH_ArkUI_TextEditMenuOptions_RegisterOnPrepareMenuCallback(
        {}, reinterpret_cast<void *>(onPrepareUserData),
        [](ArkUI_TextMenuItemArray *items, void *userData) {});
    ASSERT_EQ(result, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}


static napi_value Test_OH_ArkUI_TextEditMenuOptions06(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_TextEditMenuOptions *editMenuOptions = OH_ArkUI_TextEditMenuOptions_Create();
    char *onItemClickUserData = "onItemClickUserData";
    auto result = OH_ArkUI_TextEditMenuOptions_RegisterOnMenuItemClickCallback(
        editMenuOptions, reinterpret_cast<void *>(onItemClickUserData),
        [](const ArkUI_TextMenuItem *item, int32_t start, int32_t end, void *userData) {
            return false;
        });
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditMenuOptions_Dispose(editMenuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextEditMenuOptions07(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    char *onItemClickUserData = "onItemClickUserData";
    auto result = OH_ArkUI_TextEditMenuOptions_RegisterOnMenuItemClickCallback(
        {}, reinterpret_cast<void *>(onItemClickUserData),
        [](const ArkUI_TextMenuItem *item, int32_t start, int32_t end, void *userData) {
            return false;
        });
    ASSERT_EQ(result, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
} // namespace ArkUICapiTest