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
#include "../manager/plugin_manager.h"
#include <arkui/native_node.h>
#include <string>
#include <cstdint>
#include <cstdio>
#include <vector>

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <hilog/log.h>

#include <arkui/native_node_napi.h>
#include <arkui/styled_string.h>
#include "styledString_test.h"
#define STR_TEXT  "<div ></div>"
#define SIZE 10
#define SUCC 0
#define FAIL (-1)
#define LENGTH 175
#define MAX_RESULT_SIZE 10000
#define LIG true

namespace ArkUICapiTest {

napi_value StyledStringTest::testStyledString001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    size_t resultNumber = 0;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, NULL, NULL);
    if (argc < 1) {
        napi_throw_type_error(env, NULL, "Expected one argument");
        return nullptr;
    }
    napi_value typedarray = args[0];
    napi_typedarray_type type;
    size_t length, byte_offset;
    napi_value arraybuffer;
    if (napi_get_typedarray_info(env, typedarray, &type, &length, NULL, &arraybuffer, &byte_offset) != napi_ok) {
        napi_throw_type_error(env, NULL, "Expected a TypedArray argument");
        return nullptr;
    }
    if (type != napi_uint8_array) {
        napi_throw_type_error(env, NULL, "Expected a Uint8Array argument");
        return nullptr;
    }
    void *data;
    size_t byte_length;
    if (napi_get_arraybuffer_info(env, arraybuffer, &data, &byte_length)) {
        napi_throw_type_error(env, NULL, "Failed to get ArrayBuffer info");
        return nullptr;
    }
    
    
    uint8_t *data_bytes = static_cast<uint8_t *>(data) + byte_offset;

    size_t arraySize = length / sizeof(uint8_t);
    auto *styledStringDescriber = OH_ArkUI_StyledString_Descriptor_Create(); // ArkUI_StyledString_Descriptor {(C++) 属性字符串，html}
    ASSERT_EQ(styledStringDescriber == nullptr, false);
    // 反序列化接口，把data_byte信息写到styledStringDescriber。
    auto status = OH_ArkUI_UnmarshallStyledStringDescriptor(data_bytes, arraySize, styledStringDescriber);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testStyledString001", 
      "UnmarshallingStyledStringDescriber status is %{public}d",status);
    ASSERT_EQ(status, ARKUI_ERROR_CODE_NO_ERROR);
    auto status1Error = OH_ArkUI_UnmarshallStyledStringDescriptor(data_bytes, arraySize, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testStyledString001", 
      "UnmarshallingStyledStringDescriber status1Error is %{public}d",status1Error);
    ASSERT_EQ(status1Error, ARKUI_ERROR_CODE_PARAM_INVALID);
    // (c++)属性字符串 -> html
    auto html = OH_ArkUI_ConvertToHtml(styledStringDescriber);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testStyledString001", "html is: %{public}s", html);
    ASSERT_STRNE(html, STR_TEXT);
    // (c++)属性字符串 -> uint8_t,
    size_t resultSize;
    size_t size = SIZE;
    uint8_t *buffer = (uint8_t *)malloc(size * sizeof(uint8_t));
    napi_value result = nullptr;
    auto status2Err = OH_ArkUI_MarshallStyledStringDescriptor(buffer, size, styledStringDescriber, &resultSize);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", 
          "OH_ArkUI_MarshallStyledStringDescriptor status2Err is :[%{public}d]", status2Err);
    ASSERT_EQ(status2Err, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto *styledStringDescriber2 = OH_ArkUI_StyledString_Descriptor_Create();
    auto status2Err2 = OH_ArkUI_MarshallStyledStringDescriptor(buffer, size, styledStringDescriber2, &resultSize);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", 
          "OH_ArkUI_MarshallStyledStringDescriptor status2Err2 is :[%{public}d]", status2Err2);
    ASSERT_EQ(status2Err2, ARKUI_ERROR_CODE_INVALID_STYLED_STRING);
    if (OH_ArkUI_MarshallStyledStringDescriptor(buffer, size, styledStringDescriber, &resultSize) != 0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", 
          "resultSize is :[%{public}zu]", resultSize);
        if(resultSize <= 0 || resultSize >= MAX_RESULT_SIZE) {
            return nullptr;
        }
        uint8_t *buffer2 = (uint8_t *)malloc(resultSize * sizeof(uint8_t));
        size_t resultSize2;
        auto status2 = OH_ArkUI_MarshallStyledStringDescriptor(buffer2, resultSize, styledStringDescriber, &resultSize2);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", 
          "OH_ArkUI_MarshallStyledStringDescriptor2 is :[%{public}d]", status2);
        ASSERT_EQ(status2, ARKUI_ERROR_CODE_NO_ERROR);
        auto *styledStringDescriber1 = OH_ArkUI_StyledString_Descriptor_Create();
        // 反序列化接口，把buffer2信息写到styledStringDescriber1。
        auto status1 = OH_ArkUI_UnmarshallStyledStringDescriptor(buffer2, resultSize2, styledStringDescriber1);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testStyledString001", 
            "UnmarshallingStyledStringDescriber status1 is %{public}d", status1);
        ASSERT_EQ(status1, 0);
        // (c++)属性字符串 -> html
        auto html1 = OH_ArkUI_ConvertToHtml(styledStringDescriber1);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testStyledString001", "html1 is: %{public}s", html1);
        // 比较原始值直接反序列化解析的html与将原始值经过序列化和反序列化解析的html进行对比
        ASSERT_STREQ(html, html1);
        napi_create_int32(env, SUCC, &result);

        free(buffer);
        free(buffer2);
    }
    OH_ArkUI_StyledString_Descriptor_Destroy(styledStringDescriber);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", "testStyledString001 end succ");
    
    return result;
}

}
