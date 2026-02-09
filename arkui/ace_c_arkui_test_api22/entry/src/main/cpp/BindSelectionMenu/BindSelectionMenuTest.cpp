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

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions01(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NodeHandle text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_TextSelectionMenuOptions *menuOptions = OH_ArkUI_TextSelectionMenuOptions_Create();
    ASSERT_EQ(menuOptions == nullptr, false);
    OH_ArkUI_TextSelectionMenuOptions_SetContentNode(menuOptions, text1);
    ArkUI_AttributeItem textBindSelectionItem = {.object = menuOptions};
    auto res =  nodeAPI->setAttribute(text, NODE_TEXT_BIND_SELECTION_MENU, &textBindSelectionItem);
    ASSERT_EQ(res,ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextSelectionMenuOptions_Dispose(menuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions02(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_TextSelectionMenuOptions *menuOptions = OH_ArkUI_TextSelectionMenuOptions_Create();
    auto result = OH_ArkUI_TextSelectionMenuOptions_SetSpanType(menuOptions, ArkUI_TextSpanType::ARKUI_TEXT_SPAN_TYPE_DEFAULT);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextSelectionMenuOptions_Dispose(menuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions03(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_TextSelectionMenuOptions_SetSpanType({}, ArkUI_TextSpanType::ARKUI_TEXT_SPAN_TYPE_DEFAULT);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions04(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_TextSelectionMenuOptions *menuOptions = OH_ArkUI_TextSelectionMenuOptions_Create();
    OH_ArkUI_TextSelectionMenuOptions_SetSpanType(menuOptions, ArkUI_TextSpanType::ARKUI_TEXT_SPAN_TYPE_DEFAULT);
    auto spanType = ARKUI_TEXT_SPAN_TYPE_DEFAULT;
    auto res = OH_ArkUI_TextSelectionMenuOptions_GetSpanType(menuOptions, &spanType);
    ASSERT_EQ(res, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextSelectionMenuOptions_Dispose(menuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions05(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto spanType = ARKUI_TEXT_SPAN_TYPE_DEFAULT;
    auto res = OH_ArkUI_TextSelectionMenuOptions_GetSpanType({}, &spanType);
    ASSERT_EQ(res, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}


static napi_value Test_OH_ArkUI_TextSelectionMenuOptions06(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_TextSelectionMenuOptions *menuOptions = OH_ArkUI_TextSelectionMenuOptions_Create();
    auto res = OH_ArkUI_TextSelectionMenuOptions_SetContentNode(menuOptions, text);
    ASSERT_EQ(res, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextSelectionMenuOptions_Dispose(menuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions07(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto res = OH_ArkUI_TextSelectionMenuOptions_SetContentNode({}, text);
    ASSERT_EQ(res, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}


static napi_value Test_OH_ArkUI_TextSelectionMenuOptions08(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_TextSelectionMenuOptions *menuOptions = OH_ArkUI_TextSelectionMenuOptions_Create();
    auto res = OH_ArkUI_TextSelectionMenuOptions_GetContentNode(menuOptions, &text);
    ASSERT_EQ(res, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextSelectionMenuOptions_Dispose(menuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions09(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto res = OH_ArkUI_TextSelectionMenuOptions_GetContentNode({}, &text);
    ASSERT_EQ(res, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions10(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_TextSelectionMenuOptions *menuOptions = OH_ArkUI_TextSelectionMenuOptions_Create();
    auto res = OH_ArkUI_TextSelectionMenuOptions_SetResponseType(menuOptions, ArkUI_TextResponseType::ARKUI_TEXT_RESPONSE_TYPE_DEFAULT);
    ASSERT_EQ(res, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextSelectionMenuOptions_Dispose(menuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions11(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto res = OH_ArkUI_TextSelectionMenuOptions_SetResponseType({}, ArkUI_TextResponseType::ARKUI_TEXT_RESPONSE_TYPE_DEFAULT);
    ASSERT_EQ(res, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}   

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions12(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_TextSelectionMenuOptions *menuOptions = OH_ArkUI_TextSelectionMenuOptions_Create();
    auto responseType = ARKUI_TEXT_RESPONSE_TYPE_DEFAULT;
    auto res = OH_ArkUI_TextSelectionMenuOptions_GetResponseType(menuOptions,&responseType);
    ASSERT_EQ(res, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextSelectionMenuOptions_Dispose(menuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions13(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto responseType = ARKUI_TEXT_RESPONSE_TYPE_DEFAULT;
    auto res = OH_ArkUI_TextSelectionMenuOptions_GetResponseType({}, &responseType);
    ASSERT_EQ(res, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}   

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions14(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_TextSelectionMenuOptions *menuOptions = OH_ArkUI_TextSelectionMenuOptions_Create();
    ArkUI_AttributeItem userData1 = {.string = "menu show test"};
    auto res = OH_ArkUI_TextSelectionMenuOptions_RegisterOnMenuShowCallback(
        menuOptions, &userData1, [](int32_t start, int32_t end, void *userData) {});
    ASSERT_EQ(res, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextSelectionMenuOptions_Dispose(menuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions15(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem userData1 = {.string = "menu show test"};
    auto res = OH_ArkUI_TextSelectionMenuOptions_RegisterOnMenuShowCallback(
        {}, &userData1, [](int32_t start, int32_t end, void *userData) {});
    ASSERT_EQ(res, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}   


static napi_value Test_OH_ArkUI_TextSelectionMenuOptions16(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_TextSelectionMenuOptions *menuOptions = OH_ArkUI_TextSelectionMenuOptions_Create();
    ArkUI_AttributeItem userData1 = {.string = "menu hide test"};
    auto res = OH_ArkUI_TextSelectionMenuOptions_RegisterOnMenuHideCallback(
        menuOptions, &userData1, [](int32_t start, int32_t end, void *userData) {});
    ASSERT_EQ(res, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextSelectionMenuOptions_Dispose(menuOptions);
    NAPI_END;
}

static napi_value Test_OH_ArkUI_TextSelectionMenuOptions17(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem userData1 = {.string = "menu hide test"};
    auto res = OH_ArkUI_TextSelectionMenuOptions_RegisterOnMenuHideCallback(
        {}, &userData1, [](int32_t start, int32_t end, void *userData) {});
    ASSERT_EQ(res, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}   

} // namespace ArkUICapiTest