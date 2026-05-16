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
 
#include "napi/native_api.h"
#include "hilog/log.h"
#include <string>
#include <unistd.h>
#include "database/pasteboard/oh_pasteboard.h"
#include "database/pasteboard/oh_pasteboard_err_code.h"
#include "database/udmf/udmf.h"
#include "database/udmf/udmf_meta.h"
#include "database/udmf/uds.h"
#include "database/udmf/utd.h"
#include <iostream>
#include <map>
#include <ctime>
#include "common.h"
#include <cctype>
#include <condition_variable>
#include <cstdint>
#include <fcntl.h>
#include <functional>
#include <iostream>
#include <list>
#include <map>
#include <memory>
#include <mutex>
#include <string>
#include <sys/mman.h>
#include <thread>
#include <vector>
#include <string>
#include <random>
#include <chrono>
const char *TAG = "testLog";

static napi_value OH_Pasteboard_GetMimeTypes0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    NAPI_ASSERT(env, pasteboard != nullptr, "OH_Pasteboard_Create is fail.");
    OH_Pasteboard_ClearData(pasteboard);
    unsigned int count = 1000;
    char** res = OH_Pasteboard_GetMimeTypes(pasteboard, &count);
    NAPI_ASSERT(env, count == 0, "OH_Pasteboard_GetMimeTypes is fail.");
    NAPI_ASSERT(env, res == nullptr, "OH_Pasteboard_GetMimeTypes is fail.");
    napi_create_int32(env, res == nullptr, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_Pasteboard_GetMimeTypes0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    NAPI_ASSERT(env, pasteboard != nullptr, "OH_Pasteboard_Create is fail.");
    OH_UdmfData* setData = OH_UdmfData_Create();
    NAPI_ASSERT(env, setData != nullptr, "OH_UdmfData_Create is fail.");
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    NAPI_ASSERT(env, record != nullptr, "OH_UdmfData_Create is fail.");
    OH_UdsPlainText* plainText = OH_UdsPlainText_Create();
    NAPI_ASSERT(env, plainText != nullptr, "OH_UdmfData_Create is fail.");
    
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(setData, record);
    OH_Pasteboard_SetData(pasteboard, setData);

    unsigned int count = 1000;
    char** res = OH_Pasteboard_GetMimeTypes(pasteboard, &count);
    NAPI_ASSERT(env, count == 1, "OH_Pasteboard_GetMimeTypes is fail.");
    NAPI_ASSERT(env, res != nullptr, "OH_Pasteboard_GetMimeTypes is fail.");
    NAPI_ASSERT(env, strcmp("text/plain", res[0]) == 0, "OH_Pasteboard_GetMimeTypes is fail.");
    napi_create_int32(env, strcmp("text/plain", res[0]) == 0, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_Pasteboard_GetMimeTypes0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    NAPI_ASSERT(env, pasteboard != nullptr, "OH_Pasteboard_Create is fail.");
    OH_UdmfData* setData = OH_UdmfData_Create();
    NAPI_ASSERT(env, setData != nullptr, "OH_UdmfData_Create is fail.");
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    NAPI_ASSERT(env, record != nullptr, "OH_UdmfData_Create is fail.");
    OH_UdsPlainText* plainText = OH_UdsPlainText_Create();
    NAPI_ASSERT(env, plainText != nullptr, "OH_UdmfData_Create is fail.");
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(setData, record);

    OH_UdmfRecord* record2 = OH_UdmfRecord_Create();
    NAPI_ASSERT(env, record2 != nullptr, "OH_UdmfData_Create is fail.");
    OH_UdsHtml* htmlText = OH_UdsHtml_Create();
    NAPI_ASSERT(env, htmlText != nullptr, "OH_UdmfData_Create is fail.");
    char html[] = "<div class='disabled'>hello</div>";
    OH_UdsHtml_SetContent(htmlText, html);
    OH_UdmfRecord_AddHtml(record2, htmlText);
    OH_UdmfData_AddRecord(setData, record2);
    OH_Pasteboard_SetData(pasteboard, setData);

    unsigned int count = 1000;
    int num = 2;
    char** res = OH_Pasteboard_GetMimeTypes(pasteboard, &count);
    NAPI_ASSERT(env, count == num, "OH_Pasteboard_GetMimeTypes is fail.");
    NAPI_ASSERT(env, res != nullptr, "OH_Pasteboard_GetMimeTypes is fail.");
    NAPI_ASSERT(env, (strcmp("text/plain", res[0]) == 0 && strcmp("text/html", res[1]) == 0) ||
        (strcmp("text/plain", res[1]) == 0 && strcmp("text/html", res[0]) == 0), "OH_Pasteboard_GetMimeTypes is fail.");
    napi_create_int32(env, (strcmp("text/plain", res[0]) == 0 && strcmp("text/html", res[1]) == 0) ||
        (strcmp("text/plain", res[1]) == 0 && strcmp("text/html", res[0]) == 0), &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithNoProgress001(napi_env env, napi_callback_info info)
{
    const char *uri =  "file://com.acts.Pastboard.ndkWithPermissionstest/data/storage/el2/base/files/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData(pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");

    const char *uri1 = "file://com.acts.Pastboard.ndkWithPermissionstest/data/storage/el2/base/files/haps/";
    Pasteboard_GetDataParams* params = OH_Pasteboard_GetDataParams_Create();
    OH_Pasteboard_GetDataParams_SetDestUri(params, uri1, strlen(uri1));
    OH_Pasteboard_GetDataParams_SetFileConflictOptions(params, PASTEBOARD_SKIP);
    OH_Pasteboard_GetDataParams_SetProgressIndicator(params, PASTEBOARD_DEFAULT);
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, params, &status);
    NAPI_ASSERT(env, status == ERR_PERMISSION_ERROR, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData == nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Pasteboard_GetMimeTypes0100", nullptr, OH_Pasteboard_GetMimeTypes0100,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetMimeTypes0200", nullptr, OH_Pasteboard_GetMimeTypes0200,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetMimeTypes0300", nullptr, OH_Pasteboard_GetMimeTypes0300,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithNoProgress001", nullptr, OH_Pasteboard_GetDataWithNoProgress001,
         nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
