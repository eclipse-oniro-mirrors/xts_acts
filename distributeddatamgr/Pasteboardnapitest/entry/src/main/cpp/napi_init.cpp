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
static constexpr char HYPERLINK_URL[] = "file://data/image.png";
static constexpr char PLAINTEXT_CONTENT[] = "PLAINTEXT_CONTENT";
static void* GetDataCallback(void* context, const char* type);
static int g_callbackValue;
static constexpr int UPDATE_VALUE = 1;

void FinalizeFunc(void* context) {};
void ContextFinalizeFunc(void* context) {};
void CallbackFunc(void* context, Pasteboard_NotifyType type)
{
    g_callbackValue = UPDATE_VALUE;
}


void* GetDataCallbackFunc(void* context, const char* type)
{
    auto plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetAbstract(plainText, "doing something");
    OH_UdsPlainText_SetContent(plainText, "doing something");
    return plainText;
}

void* GetDataCallback(void* context, const char* type)
{
    if (std::string(type) == "general.plain-text") {
        OH_UdsPlainText* plainText = OH_UdsPlainText_Create();
        OH_UdsPlainText_SetContent(plainText, PLAINTEXT_CONTENT);
        return plainText;
    } else if (std::string(type) == "general.hyperlink") {
        OH_UdsHyperlink* link = OH_UdsHyperlink_Create();
        OH_UdsHyperlink_SetUrl(link, HYPERLINK_URL);
        return link;
    }
    return nullptr;
}

static napi_value OH_PasteboardSubscriber_Create0100(napi_env env, napi_callback_info info)
{
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    napi_value result = nullptr;
    napi_create_int32(env, observer != nullptr, &result);
    OH_PasteboardObserver_Destroy(observer);
    OH_PasteboardObserver_Destroy(nullptr);
    return result;
}

static napi_value OH_PasteboardObserver_SetData0100(napi_env env, napi_callback_info info)
{
    napi_value returncode = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    void* context = static_cast<void*>(pasteboard);
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    int setRes1 = OH_PasteboardObserver_SetData(observer, context, CallbackFunc, ContextFinalizeFunc);
    napi_create_int32(env, setRes1 == ERR_OK, &returncode);
    OH_PasteboardObserver_Destroy(observer);
    OH_Pasteboard_Destroy(pasteboard);
    return returncode;
}

static napi_value OH_PasteboardObserver_SetData0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    void* context = static_cast<void*>(pasteboard);
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();

    int setRes1 = OH_PasteboardObserver_SetData(nullptr, context, CallbackFunc, ContextFinalizeFunc);

    napi_create_int32(env, setRes1 == ERR_INVALID_PARAMETER, &result);
   
    OH_PasteboardObserver_Destroy(observer);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_PasteboardObserver_SetData0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    void* context = static_cast<void*>(pasteboard);
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    int setRes2 = OH_PasteboardObserver_SetData(observer, context, nullptr, ContextFinalizeFunc);
    napi_create_int32(env, setRes2 == ERR_INVALID_PARAMETER, &result);
    OH_PasteboardObserver_Destroy(observer);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_PasteboardObserver_SetData0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    void* context = static_cast<void*>(pasteboard);
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    int setRes3 = OH_PasteboardObserver_SetData(observer, context, CallbackFunc, nullptr);
    napi_create_int32(env, setRes3 == ERR_INVALID_PARAMETER, &result);
    OH_PasteboardObserver_Destroy(observer);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_Pasteboard_Create0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    napi_create_int32(env, pasteboard != nullptr, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_Pasteboard_Subscribe0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);
    int res = OH_Pasteboard_Subscribe(pasteboard, NOTIFY_LOCAL_DATA_CHANGE, observer);
    napi_create_int32(env, res == ERR_OK, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);
    return result;
}

static napi_value OH_Pasteboard_Subscribe0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);
    int resRepeat = OH_Pasteboard_Subscribe(pasteboard, NOTIFY_LOCAL_DATA_CHANGE, observer);
    napi_create_int32(env, resRepeat == ERR_OK, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);
    return result;
}

static napi_value OH_Pasteboard_Subscribe0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);

    int resRepeat = OH_Pasteboard_Subscribe(nullptr, NOTIFY_LOCAL_DATA_CHANGE, observer);
    napi_create_int32(env, resRepeat == ERR_INVALID_PARAMETER, &result);

    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);
    return result;
}

static napi_value OH_Pasteboard_Subscribe0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);
    int res = OH_Pasteboard_Subscribe(pasteboard, 10, observer);
    napi_create_int32(env, res == ERR_INVALID_PARAMETER, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);
    return result;
}


static napi_value OH_Pasteboard_Subscribe0500(napi_env env, napi_callback_info info)

{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);
    int res = OH_Pasteboard_Subscribe(pasteboard, -1, observer);
    napi_create_int32(env, res == ERR_INVALID_PARAMETER, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);

    return result;
}

static napi_value OH_Pasteboard_Subscribe0600(napi_env env, napi_callback_info info)

{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);
    int res = OH_Pasteboard_Subscribe(pasteboard, NOTIFY_LOCAL_DATA_CHANGE, nullptr);
    napi_create_int32(env, res == ERR_INVALID_PARAMETER, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);
    return result;
}


static napi_value OH_Pasteboard_Unsubcribe0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);
    OH_Pasteboard_Subscribe(pasteboard, NOTIFY_LOCAL_DATA_CHANGE, observer);

    int res = OH_Pasteboard_Unsubscribe(pasteboard, NOTIFY_LOCAL_DATA_CHANGE, observer);
    napi_create_int32(env, res == ERR_OK, &result);

    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);
    return result;
}

static napi_value OH_Pasteboard_Unsubcribe0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);

    int res = OH_Pasteboard_Unsubscribe(nullptr, NOTIFY_LOCAL_DATA_CHANGE, observer);
    napi_create_int32(env, res == ERR_INVALID_PARAMETER, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);
    return result;
}


static napi_value OH_Pasteboard_Unsubcribe0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);
    int res = OH_Pasteboard_Unsubscribe(pasteboard, 10, observer);
    napi_create_int32(env, res == ERR_INVALID_PARAMETER, &result);

    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);
    return result;
}

static napi_value OH_Pasteboard_Unsubcribe0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);
    int res = OH_Pasteboard_Unsubscribe(pasteboard, -1, observer);
    napi_create_int32(env, res == ERR_INVALID_PARAMETER, &result);

    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);
    return result;
}

static napi_value OH_Pasteboard_Unsubcribe0500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);
    int res = OH_Pasteboard_Unsubscribe(pasteboard, NOTIFY_LOCAL_DATA_CHANGE, nullptr);
    napi_create_int32(env, res == ERR_INVALID_PARAMETER, &result);

    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);
    return result;
}

static napi_value OH_Pasteboard_IsRemoteData0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();

    bool res = OH_Pasteboard_IsRemoteData(pasteboard);
    napi_create_int32(env, res == false, &result);

    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_Pasteboard_GetDataSrouce0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdmfData* setData = OH_UdmfData_Create();
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdsPlainText* plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(setData, record);

    OH_Pasteboard_SetData(pasteboard, setData);

    int len = 100;
    char source[100];
    int res = OH_Pasteboard_GetDataSource(pasteboard, source, len);
    napi_create_int32(env, res == ERR_OK, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_Pasteboard_HasType0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdmfData* setData = OH_UdmfData_Create();
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdsPlainText* plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(setData, record);

    OH_Pasteboard_SetData(pasteboard, setData);
    char type[] = "general.plain-text";
    bool res = OH_Pasteboard_HasType(pasteboard, type);
    napi_create_int32(env, res == false, &result);
    OH_Pasteboard_Destroy(pasteboard);

    return result;
}


static napi_value OH_Pasteboard_HasData0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_Pasteboard_ClearData(pasteboard);
    bool res = OH_Pasteboard_HasData(pasteboard);
    NAPI_ASSERT(env, res == false, "createTable is fail.");

    OH_UdmfData* setData = OH_UdmfData_Create();
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdsPlainText* plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(setData, record);
    OH_Pasteboard_SetData(pasteboard, setData);
    res = OH_Pasteboard_HasData(pasteboard);
    NAPI_ASSERT(env, res == true, "OH_Pasteboard_HasData is fail.");
    napi_create_int32(env, res == true, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}


static napi_value OH_Pasteboard_ClearData0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    bool res = OH_Pasteboard_ClearData(pasteboard);
    NAPI_ASSERT(env, res == ERR_OK, "OH_Pasteboard_ClearData is fail.");
    napi_create_int32(env, res == ERR_OK, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}


static napi_value OH_Pasteboard_SetData0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdmfData *setData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(setData, record);

    bool res = OH_Pasteboard_SetData(pasteboard, setData);
    NAPI_ASSERT(env, res == ERR_OK, "OH_Pasteboard_SetData is fail.");
    napi_create_int32(env, res == ERR_OK, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(setData);
    return result;
}


static napi_value OH_Pasteboard_GetData0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdmfData* setData = OH_UdmfData_Create();
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdsPlainText* plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(setData, record);

    int res = OH_Pasteboard_SetData(pasteboard, setData);
    NAPI_ASSERT(env, res == ERR_OK, "OH_Pasteboard_SetData is fail.");

    int status = -1;
    OH_UdmfData* getData = OH_Pasteboard_GetData(pasteboard, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetData is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetData is fail.");

    unsigned int count = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &count);
    NAPI_ASSERT(env, count == 1, "OH_Pasteboard_GetData is fail.");

    OH_UdsPlainText *getPlainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_GetPlainText(getRecords[0], getPlainText);
    const char *getContent = OH_UdsPlainText_GetContent(getPlainText);
 
    NAPI_ASSERT(env, strcmp(getContent, content) == 0, "OH_Pasteboard_GetData is fail.");
    napi_create_int32(env, res == ERR_OK, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdsPlainText_Destroy(getPlainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(setData);
    OH_UdmfData_Destroy(getData);
    return result;
}


static napi_value OH_Pasteboard_GetData0200(napi_env env, napi_callback_info info)
{
    int num = 3;
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdmfData* setData = OH_UdmfData_Create();
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfRecordProvider* provider = OH_UdmfRecordProvider_Create();
    NAPI_ASSERT(env, provider != nullptr, "OH_Pasteboard_SetData is fail.");

    OH_UdmfRecordProvider_SetData(provider, static_cast<void *>(record), GetDataCallback, ContextFinalizeFunc);
    OH_UdmfData_AddRecord(setData, record);
    const char* types[3] = { "general.plain-text", "general.hyperlink", "general.html" };
    OH_UdmfRecord_SetProvider(record, types, num, provider);
    int res = OH_Pasteboard_SetData(pasteboard, setData);
    NAPI_ASSERT(env, res == ERR_OK, "OH_Pasteboard_SetData is fail.");

    int status = -1;
    OH_UdmfData* getData = OH_Pasteboard_GetData(pasteboard, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetData is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetData is fail.");

    unsigned int count = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &count);
    NAPI_ASSERT(env, count == 1, "OH_UdmfData_GetRecords is fail.");

    OH_UdsPlainText *getPlainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_GetPlainText(getRecords[0], getPlainText);
    const char *getContent = OH_UdsPlainText_GetContent(getPlainText);
    NAPI_ASSERT(env, strcmp(getContent, PLAINTEXT_CONTENT) == 0, "OH_UdsPlainText_GetContent is fail.");

    OH_UdsHyperlink *getHyperLink = OH_UdsHyperlink_Create();
    OH_UdmfRecord_GetHyperlink(getRecords[0], getHyperLink);
    const char *getUrl = OH_UdsHyperlink_GetUrl(getHyperLink);
    NAPI_ASSERT(env, strcmp(getUrl, HYPERLINK_URL) == 0, "OH_UdsHyperlink_GetUrl is fail.");
    napi_create_int32(env, res == ERR_OK, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdsPlainText_Destroy(getPlainText);
    OH_UdsHyperlink_Destroy(getHyperLink);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(setData);
    OH_UdmfData_Destroy(getData);
    return result;
}

static napi_value OH_Pasteboard_GetData0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char typeId[] = "ApplicationDefined-myType";
    unsigned char entry[] = "CreateGeneralRecord1";
    unsigned int count = sizeof(entry);
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    int addRes1 = OH_UdmfRecord_AddGeneralEntry(record, typeId, entry, count);
    NAPI_ASSERT(env, addRes1 == ERR_OK, "OH_AddGeneralEntry is fail.");

    OH_UdmfData* setData = OH_UdmfData_Create();
    OH_UdmfData_AddRecord(setData, record);
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    int res = OH_Pasteboard_SetData(pasteboard, setData);
    NAPI_ASSERT(env, res == ERR_OK, "OH_SetData is fail.");

    int status = -1;
    OH_UdmfData* getData = OH_Pasteboard_GetData(pasteboard, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_GetData is fail");
    NAPI_ASSERT(env, getData != nullptr, "OH_GetData is fail");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_getRecords is fail");

    unsigned int getCount = 0;
    unsigned char *getEntry;
    int getRes = OH_UdmfRecord_GetGeneralEntry(getRecords[0], typeId, &getEntry, &getCount);
    NAPI_ASSERT(env, getRes == ERR_OK, "OH_getRecords is fail");
    NAPI_ASSERT(env, getCount == count, "OH_getRecords is fail");
    NAPI_ASSERT(env, memcmp(entry, getEntry, getCount) == 0, "OH_getRecords is fail");
    napi_create_int32(env, res == ERR_OK, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(setData);
    OH_UdmfData_Destroy(getData);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_PasteboardSubscriber_Create0100", nullptr, OH_PasteboardSubscriber_Create0100,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_PasteboardObserver_SetData0100", nullptr, OH_PasteboardObserver_SetData0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_PasteboardObserver_SetData0200", nullptr, OH_PasteboardObserver_SetData0200, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_PasteboardObserver_SetData0300", nullptr, OH_PasteboardObserver_SetData0300, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_PasteboardObserver_SetData0400", nullptr, OH_PasteboardObserver_SetData0400, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Create0100", nullptr, OH_Pasteboard_Create0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Subscribe0100", nullptr, OH_Pasteboard_Subscribe0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Subscribe0200", nullptr, OH_Pasteboard_Subscribe0200, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Subscribe0300", nullptr, OH_Pasteboard_Subscribe0300, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Subscribe0400", nullptr, OH_Pasteboard_Subscribe0400, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Subscribe0500", nullptr, OH_Pasteboard_Subscribe0500, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Subscribe0600", nullptr, OH_Pasteboard_Subscribe0600, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Unsubcribe0100", nullptr, OH_Pasteboard_Unsubcribe0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Unsubcribe0200", nullptr, OH_Pasteboard_Unsubcribe0200, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Unsubcribe0300", nullptr, OH_Pasteboard_Unsubcribe0300, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Unsubcribe0400", nullptr, OH_Pasteboard_Unsubcribe0400, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_Unsubcribe0500", nullptr, OH_Pasteboard_Unsubcribe0500, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_IsRemoteData0100", nullptr, OH_Pasteboard_IsRemoteData0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataSrouce0100", nullptr, OH_Pasteboard_GetDataSrouce0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_HasType0100", nullptr, OH_Pasteboard_HasType0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_HasData0100", nullptr, OH_Pasteboard_HasData0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_ClearData0100", nullptr, OH_Pasteboard_ClearData0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_SetData0100", nullptr, OH_Pasteboard_SetData0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetData0100", nullptr, OH_Pasteboard_GetData0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetData0200", nullptr, OH_Pasteboard_GetData0200, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetData0300", nullptr, OH_Pasteboard_GetData0300, nullptr,
         nullptr, nullptr, napi_default, nullptr}
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
