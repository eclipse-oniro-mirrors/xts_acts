 /*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "TextInputContentType.h"
#include "arkui/native_dialog.h"
#include <arkui/native_type.h>
namespace TextInputContentTypeTest {
napi_value TextInputContentTypeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PASSPORT_NUMBER } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_PASSPORT_NUMBER;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputContentTypeTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_VALIDITY } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_VALIDITY;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputContentTypeTest_003(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_ISSUE_AT } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_ISSUE_AT;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputContentTypeTest_004(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_ORGANIZATION } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_ORGANIZATION;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputContentTypeTest_005(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_TAX_ID } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_TAX_ID;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputContentTypeTest_006(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_ADDRESS_CITY_AND_STATE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_ADDRESS_CITY_AND_STATE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputContentTypeTest_007(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_FLIGHT_NUMBER } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_FLIGHT_NUMBER;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputContentTypeTest_008(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_NUMBER } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_NUMBER;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputContentTypeTest_009(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_FILE_NUMBER } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_FILE_NUMBER;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputContentTypeTest_010(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_PLATE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_PLATE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputContentTypeTest_011(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_ENGINE_NUMBER } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_ENGINE_NUMBER;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputContentTypeTest_012(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_CHASSIS_NUMBER } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_CONTENT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_CONTENT_TYPE_LICENSE_CHASSIS_NUMBER;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextVerticalAlignmentTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_VERTICAL_ALIGNMENT_BASELINE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_VERTICAL_ALIGN, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_VERTICAL_ALIGN);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXT_VERTICAL_ALIGNMENT_BASELINE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextVerticalAlignmentTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_VERTICAL_ALIGNMENT_BOTTOM } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_VERTICAL_ALIGN, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_VERTICAL_ALIGN);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXT_VERTICAL_ALIGNMENT_BOTTOM;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextVerticalAlignmentTest_003(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_VERTICAL_ALIGNMENT_CENTER } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_VERTICAL_ALIGN, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_VERTICAL_ALIGN);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXT_VERTICAL_ALIGNMENT_CENTER;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextVerticalAlignmentTest_004(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_VERTICAL_ALIGNMENT_TOP } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_VERTICAL_ALIGN, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_VERTICAL_ALIGN);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXT_VERTICAL_ALIGNMENT_TOP;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextInputTypeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_TYPE_ONE_TIME_CODE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_INPUT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_INPUT_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTINPUT_TYPE_ONE_TIME_CODE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextAreaTypeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTAREA_TYPE_ONE_TIME_CODE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_AREA_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_AREA_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXTAREA_TYPE_ONE_TIME_CODE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextCopyOptionsTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_COPY_OPTIONS_NONE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_COPY_OPTION, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_COPY_OPTION);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXT_COPY_OPTIONS_NONE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextCopyOptionsTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_COPY_OPTIONS_IN_APP } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_COPY_OPTION, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_COPY_OPTION);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXT_COPY_OPTIONS_IN_APP;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextCopyOptionsTest_003(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_COPY_OPTIONS_LOCAL_DEVICE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_COPY_OPTION, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_COPY_OPTION);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXT_COPY_OPTIONS_LOCAL_DEVICE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextCopyOptionsTest_004(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_COPY_OPTIONS_CROSS_DEVICE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_COPY_OPTION, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_COPY_OPTION);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_TEXT_COPY_OPTIONS_CROSS_DEVICE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value EffectEdgeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_EDGE_EFFECT_FADE }, { .i32 = 1 }, { .i32 = ARKUI_EFFECT_EDGE_START }};
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_3 };
    int32_t setResult = nodeAPI->setAttribute(column, NODE_SCROLL_EDGE_EFFECT, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(column, NODE_SCROLL_EDGE_EFFECT);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[2].i32 == ARKUI_EFFECT_EDGE_START;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value EffectEdgeTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_EDGE_EFFECT_FADE }, { .i32 = 1 }, { .i32 = ARKUI_EFFECT_EDGE_END }};
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_3 };
    int32_t setResult = nodeAPI->setAttribute(column, NODE_SCROLL_EDGE_EFFECT, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(column, NODE_SCROLL_EDGE_EFFECT);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[2].i32 == ARKUI_EFFECT_EDGE_END;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value FocusWrapModeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_GRID);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_FOCUS_WRAP_MODE_DEFAULT } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(column, NODE_GRID_FOCUS_WRAP_MODE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(column, NODE_GRID_FOCUS_WRAP_MODE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_FOCUS_WRAP_MODE_DEFAULT;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value FocusWrapModeTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_GRID);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_FOCUS_WRAP_WITH_ARROW } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(column, NODE_GRID_FOCUS_WRAP_MODE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(column, NODE_GRID_FOCUS_WRAP_MODE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_FOCUS_WRAP_WITH_ARROW;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value StickystyleTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM_GROUP);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_STICKY_STYLE_NONE} };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(column, NODE_LIST_STICKY, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(column, NODE_LIST_STICKY);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_STICKY_STYLE_NONE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ContentClipModeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_SCROLL_CLIP_CONTENT, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_SCROLL_CLIP_CONTENT);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ContentClipModeTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_CONTENT_CLIP_MODE_BOUNDARY } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_SCROLL_CLIP_CONTENT, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_SCROLL_CLIP_CONTENT);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_CONTENT_CLIP_MODE_BOUNDARY;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ContentClipModeTest_003(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_CONTENT_CLIP_MODE_SAFE_AREA } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_SCROLL_CLIP_CONTENT, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_SCROLL_CLIP_CONTENT);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_CONTENT_CLIP_MODE_SAFE_AREA;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value WaterFlowLayoutModeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_WATER_FLOW_LAYOUT_MODE_ALWAYS_TOP_DOWN } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_WATER_FLOW_LAYOUT_MODE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_WATER_FLOW_LAYOUT_MODE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_WATER_FLOW_LAYOUT_MODE_ALWAYS_TOP_DOWN;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value WaterFlowLayoutModeTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_WATER_FLOW_LAYOUT_MODE_SLIDING_WINDOW } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_WATER_FLOW_LAYOUT_MODE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_WATER_FLOW_LAYOUT_MODE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_WATER_FLOW_LAYOUT_MODE_SLIDING_WINDOW;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HitTestModeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_HIT_TEST_MODE_BLOCK_HIERARCHY } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_HIT_TEST_BEHAVIOR, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_HIT_TEST_BEHAVIOR);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_HIT_TEST_MODE_BLOCK_HIERARCHY;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HitTestModeTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_HIT_TEST_MODE_BLOCK_DESCENDANTS } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_HIT_TEST_BEHAVIOR, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_HIT_TEST_BEHAVIOR);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_HIT_TEST_MODE_BLOCK_DESCENDANTS;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value PageFlipModeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SWIPER);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_PAGE_FLIP_MODE_CONTINUOUS } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_SWIPER_PAGE_FLIP_MODE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_SWIPER_PAGE_FLIP_MODE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_PAGE_FLIP_MODE_CONTINUOUS;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value PageFlipModeTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SWIPER);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_PAGE_FLIP_MODE_SINGLE} };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_SWIPER_PAGE_FLIP_MODE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_SWIPER_PAGE_FLIP_MODE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_PAGE_FLIP_MODE_SINGLE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SwiperAnimationModeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SWIPER);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_SWIPER_NO_ANIMATION } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_SWIPER_INDEX, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_SWIPER_INDEX);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_SWIPER_NO_ANIMATION;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SwiperAnimationModeTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SWIPER);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_SWIPER_DEFAULT_ANIMATION } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_SWIPER_INDEX, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_SWIPER_INDEX);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_SWIPER_DEFAULT_ANIMATION;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SwiperAnimationModeTest_003(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SWIPER);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_SWIPER_FAST_ANIMATION } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_SWIPER_INDEX, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_SWIPER_INDEX);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_SWIPER_FAST_ANIMATION;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ImageSpanAlignmentTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_IMAGE_SPAN_ALIGNMENT_FOLLOW_PARAGRAPH } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_IMAGE_SPAN_ALIGNMENT_FOLLOW_PARAGRAPH;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ColorStrategyTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_COLOR_STRATEGY_AVERAGE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_FOREGROUND_COLOR, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_FOREGROUND_COLOR);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_COLOR_STRATEGY_AVERAGE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ColorStrategyTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_COLOR_STRATEGY_PRIMARY } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_FOREGROUND_COLOR, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_FOREGROUND_COLOR);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_COLOR_STRATEGY_PRIMARY;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ButtonTypeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_BUTTON_ROUNDED_RECTANGLE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_BUTTON_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_BUTTON_TYPE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_BUTTON_ROUNDED_RECTANGLE ;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value KeyboardAppearanceTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_KEYBOARD_APPEARANCE_NONE_IMMERSIVE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_TEXT_INPUT_KEYBOARD_APPEARANCE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_TEXT_INPUT_KEYBOARD_APPEARANCE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_KEYBOARD_APPEARANCE_NONE_IMMERSIVE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value KeyboardAppearanceTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_KEYBOARD_APPEARANCE_IMMERSIVE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_TEXT_INPUT_KEYBOARD_APPEARANCE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_TEXT_INPUT_KEYBOARD_APPEARANCE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_KEYBOARD_APPEARANCE_IMMERSIVE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value KeyboardAppearanceTest_003(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_KEYBOARD_APPEARANCE_LIGHT_IMMERSIVE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_TEXT_INPUT_KEYBOARD_APPEARANCE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_TEXT_INPUT_KEYBOARD_APPEARANCE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_KEYBOARD_APPEARANCE_LIGHT_IMMERSIVE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value KeyboardAppearanceTest_004(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_KEYBOARD_APPEARANCE_DARK_IMMERSIVE } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_TEXT_INPUT_KEYBOARD_APPEARANCE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_TEXT_INPUT_KEYBOARD_APPEARANCE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == ARKUI_KEYBOARD_APPEARANCE_DARK_IMMERSIVE;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SafeAreaTypeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_LIST);
    ArkUI_NumberValue value[] = { { .u32 = ARKUI_SAFE_AREA_TYPE_KEYBOARD } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_EXPAND_SAFE_AREA, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_EXPAND_SAFE_AREA);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].u32 == ARKUI_SAFE_AREA_TYPE_KEYBOARD;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SafeAreaEdgeTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_LIST);
    ArkUI_NumberValue value[] = { { .u32 = ARKUI_SAFE_AREA_TYPE_SYSTEM }, { .u32 = ARKUI_SAFE_AREA_EDGE_START} };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_2 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_EXPAND_SAFE_AREA, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_EXPAND_SAFE_AREA);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[1].u32 == ARKUI_SAFE_AREA_EDGE_START;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SafeAreaEdgeTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_LIST);
    ArkUI_NumberValue value[] = { { .u32 = ARKUI_SAFE_AREA_TYPE_SYSTEM }, { .u32 = ARKUI_SAFE_AREA_EDGE_END} };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_2 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_EXPAND_SAFE_AREA, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(scroll, NODE_EXPAND_SAFE_AREA);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[1].u32 == ARKUI_SAFE_AREA_EDGE_END;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value BlurStyleActivePolicyTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto dialog = OH_ArkUI_CustomDialog_CreateOptions(column);
    ArkUI_NumberValue dialog_BlurStyleOptions_value[] = { {.i32 = ARKUI_COLOR_MODE_LIGHT},
        {.i32 = ARKUI_ADAPTIVE_COLOR_AVERAGE}, {.f32 = 1}, {.u32 = 20}, {.u32 = 20},
        {.i32 = ARKUI_BLUR_STYLE_ACTIVE_POLICY_FOLLOWS_WINDOW_ACTIVE_STATE }, {.u32 = 0x00FF0000} };
    ArkUI_AttributeItem dialog_BlurStyleOptions_item = { dialog_BlurStyleOptions_value,
        sizeof(dialog_BlurStyleOptions_value) / sizeof(ArkUI_NumberValue) };
    auto ret = OH_ArkUI_CustomDialog_SetBackgroundBlurStyleOptions(dialog, &dialog_BlurStyleOptions_item);
    napi_value retValue;
    if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value BlurStyleActivePolicyTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto dialog = OH_ArkUI_CustomDialog_CreateOptions(column);
    ArkUI_NumberValue dialog_BlurStyleOptions_value[] = { {.i32 = ARKUI_COLOR_MODE_LIGHT},
        {.i32 = ARKUI_ADAPTIVE_COLOR_AVERAGE}, {.f32 = 1}, {.u32 = 20}, {.u32 = 20},
        {.i32 = ARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_INACTIVE }, {.u32 = 0x00FF0000} };
    ArkUI_AttributeItem dialog_BlurStyleOptions_item = { dialog_BlurStyleOptions_value,
        sizeof(dialog_BlurStyleOptions_value) / sizeof(ArkUI_NumberValue) };
    auto ret = OH_ArkUI_CustomDialog_SetBackgroundBlurStyleOptions(dialog, &dialog_BlurStyleOptions_item);
    napi_value retValue;
    if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ScrollAlignmentTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = { { .i32 = 38 }, { .i32 = 1 }, { .i32 = ARKUI_SCROLL_ALIGNMENT_CENTER }, { .i32 = 1 } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_4 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_LIST_SCROLL_TO_INDEX, &item);
    napi_value retValue;
    if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ScrollAlignmentTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = { { .i32 = 38 }, { .i32 = 1 }, { .i32 = ARKUI_SCROLL_ALIGNMENT_END }, { .i32 = 1 } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_4 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_LIST_SCROLL_TO_INDEX, &item);
    napi_value retValue;
    if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ScrollAlignmentTest_003(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = { { .i32 = 38 }, { .i32 = 1 }, { .i32 = ARKUI_SCROLL_ALIGNMENT_AUTO }, { .i32 = 1 } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_4 };
    int32_t setResult = nodeAPI->setAttribute(scroll, NODE_LIST_SCROLL_TO_INDEX, &item);
    napi_value retValue;
    if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextPickerRangeContentTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto textpicker = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    const char* icon = "../../resources/base/media/icon.png";
    const char* text = "text11";
    ARKUI_TextPickerRangeContent object = { icon, text };
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTPICKER_RANGETYPE_RANGE_CONTENT } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1, .object = &object };
    int32_t setResult = nodeAPI->setAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE, &item);
    napi_value retValue;
    if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextPickerRangeContentTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto textpicker = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    const char* icon = "https://ts3.tc.mm.bing.net/th/id/OIP-C.g9UbVfyVZX-SfD09JcYr5QHaEK?rs=1&pid=ImgDetMain&o=7&rm=3";
    const char* text = "text11";
    ARKUI_TextPickerRangeContent object = { .icon = icon, .text = text };
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTPICKER_RANGETYPE_RANGE_CONTENT } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1, .object = &object };
    int32_t setResult = nodeAPI->setAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->object;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextPickerRangeContentTest_003(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto textpicker = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    const char* icon = "../../resources/base/media/icon.png";
    const char* text = "text11";
    ARKUI_TextPickerRangeContent object = { icon, text };
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTPICKER_RANGETYPE_RANGE_CONTENT } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1, .object = &object };
    int32_t setResult = nodeAPI->setAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->object;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextPickerCascadeRangeContentTest_001(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto textpicker = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    int32_t size = 2;
    const char* text = "textpickercascade";
    const char* icon1 = "../../resources/base/media/icon.png";
    const char* text1 = "text11";
    ARKUI_TextPickerRangeContent children = { icon1, text1 };
    ARKUI_TextPickerCascadeRangeContent object = { text, &children, size };
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTPICKER_RANGETYPE_CASCADE_RANGE_CONTENT } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1, .object = &object };
    int32_t setResult = nodeAPI->setAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE, &item);
    napi_value retValue;
    if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextPickerCascadeRangeContentTest_002(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto textpicker = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    int32_t size = 2;
    const char* text = "textpickercascade";
    const char* icon1 = "../../resources/base/media/icon.png";
    const char* text1 = "text11";
    ARKUI_TextPickerRangeContent children = { icon1, text1 };
    ARKUI_TextPickerCascadeRangeContent object = { text, &children, size };
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTPICKER_RANGETYPE_CASCADE_RANGE_CONTENT } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1, .object = &object };
    int32_t setResult = nodeAPI->setAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->object;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextPickerCascadeRangeContentTest_003(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto textpicker = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    int32_t size = 2;
    const char* text = "textpickercascade";
    const char* icon1 = "../../resources/base/media/icon.png";
    const char* text1 = "text11";
    ARKUI_TextPickerRangeContent children = { icon1, text1 };
    ARKUI_TextPickerCascadeRangeContent object = { text, &children, size };
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTPICKER_RANGETYPE_CASCADE_RANGE_CONTENT } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1, .object = &object };
    int32_t setResult = nodeAPI->setAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->object;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TextPickerCascadeRangeContentTest_004(napi_env env, napi_callback_info info)
{
    int32_t result = 1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto textpicker = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    int32_t size = 2;
    const char* text = "textpickercascade";
    const char* icon1 = "../../resources/base/media/icon.png";
    const char* text1 = "text11";
    ARKUI_TextPickerRangeContent children = { icon1, text1 };
    ARKUI_TextPickerCascadeRangeContent object = { text, &children, size };
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTPICKER_RANGETYPE_CASCADE_RANGE_CONTENT } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1, .object = &object };
    int32_t setResult = nodeAPI->setAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE);
    napi_value retValue;
    if (itemptr != nullptr) {
        bool condition = itemptr->object;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
}