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
    // 反序列化接口，把data_byte信息写到styledStringDescriber。
    auto status = OH_ArkUI_UnmarshallStyledStringDescriptor(data_bytes, arraySize, styledStringDescriber);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testStyledString001", 
      "UnmarshallingStyledStringDescriber status is %{public}d",status);
    ASSERT_EQ(status, 0);
    // (c++)属性字符串 -> html
    auto html = OH_ArkUI_ConvertToHtml(styledStringDescriber);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testStyledString001", "html is: %{public}s", html);
    ASSERT_STRNE(html, STR_TEXT);
    // (c++)属性字符串 -> uint8_t,
    size_t resultSize;
    size_t size = SIZE;
    uint8_t *buffer = (uint8_t *)malloc(size * sizeof(uint8_t));
    napi_value result = nullptr;
    if (OH_ArkUI_MarshallStyledStringDescriptor(buffer, size, styledStringDescriber, &resultSize) != 0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", 
          "resultSize is :[%{public}zu]", resultSize);
        if(resultSize <= 0 || resultSize >= MAX_RESULT_SIZE) {
            return nullptr;
        }
        uint8_t *buffer2 = (uint8_t *)malloc(resultSize * sizeof(uint8_t));
        size_t resultSize2;
        OH_ArkUI_MarshallStyledStringDescriptor(buffer2, resultSize, styledStringDescriber, &resultSize2);

        // 验证反序列化后的buffer2是否和data_bytes一致。
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001",
                     "序列化前数组长度:[%{public}zu],序列化后数组长度：[%{public}zu]", arraySize, resultSize2);
        ASSERT_EQ(arraySize, resultSize2);
        if (arraySize == resultSize2) {
            bool isAllEqual = true;
            for (size_t i = 0; i < arraySize; i++) {
                if (data_bytes[i] != buffer2[i]) {
                    isAllEqual = false;
                    break;
                }
            }
            ASSERT_EQ(isAllEqual, LIG);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", "序列化前后的数组是否完全一致：[%{public}d]",
                         isAllEqual);
            napi_create_int32(env, SUCC, &result);
        }
        else {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", "序列化前后的数组不完全一致");
            napi_create_int32(env, FAIL, &result);
        }

        free(buffer);
        free(buffer2);
    }
    OH_ArkUI_StyledString_Descriptor_Destroy(styledStringDescriber);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", "testStyledString001 end succ");
    
    return result;
}

}
