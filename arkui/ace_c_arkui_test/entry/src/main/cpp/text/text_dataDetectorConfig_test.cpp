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

namespace ArkUICapiTest {

static napi_value TestTextDataDetectorConfig001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_DATA_DETECTOR_TYPE_PHONE_NUMBER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG)->value[PARAM_0].i32,
        ARKUI_TEXT_DATA_DETECTOR_TYPE_PHONE_NUMBER);

    NAPI_END;
}

static napi_value TestTextDataDetectorConfig002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_DATA_DETECTOR_TYPE_URL } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG)->value[PARAM_0].i32,
        ARKUI_TEXT_DATA_DETECTOR_TYPE_URL);

    NAPI_END;
}

static napi_value TestTextDataDetectorConfig003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_DATA_DETECTOR_TYPE_EMAIL } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG)->value[PARAM_0].i32,
        ARKUI_TEXT_DATA_DETECTOR_TYPE_EMAIL);

    NAPI_END;
}

static napi_value TestTextDataDetectorConfig004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_DATA_DETECTOR_TYPE_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG)->value[PARAM_0].i32,
        ARKUI_TEXT_DATA_DETECTOR_TYPE_ADDRESS);

    NAPI_END;
}

static napi_value TestTextDataDetectorConfig005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG, &value_item);
    ASSERT_EQ(ret, SUCCESS);

    NAPI_END;
}

static napi_value TestTextDataDetectorConfig006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG, &value_item);
    ASSERT_EQ(ret, SUCCESS);

    NAPI_END;
}

static napi_value TestTextDataDetectorConfig007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = PARAM_4 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG, &value_item);
    ASSERT_EQ(ret, SUCCESS);

    NAPI_END;
}

static napi_value TestTextDataDetectorConfig008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXT_DATA_DETECTOR_TYPE_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG);
    ASSERT_EQ(ret1, SUCCESS);

    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG)->value[PARAM_0].i32,
        ARKUI_TEXT_DATA_DETECTOR_TYPE_PHONE_NUMBER);

    NAPI_END;
}
} // namespace ArkUICapiTest