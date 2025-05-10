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
#include "hilog/log.h"
#include "napi/native_api.h"
#include <unistd.h>
#include "database/udmf/udmf.h"
#include "database/udmf/uds.h"
#include "database/udmf/utd.h"
#include "database/udmf/udmf_err_code.h"
#include "database/udmf/udmf_meta.h"
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <iostream>
#include "common.h"
#include <string>
#include <iostream>
#include <string>


#define PARAM_0 0
#define PARAM_1 1
void* GetDataCallbackFunc(void* context, const char* type)
{
    auto plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetAbstract(plainText, "doing something");
    OH_UdsPlainText_SetContent(plainText, "doing something");
    return plainText;
}
void FinalizeFunc(void* context) {};

bool CheckUnsignedChar(unsigned char* dst, unsigned char* src, int size)
{
    if (dst == nullptr) {
        return false;
    }
    if (src == nullptr) {
        return false;
    }
    for (int i = 0; i < size; ++i) {
        if (dst[i] != src[i]) {
            return false;
        }
    }
    return true;
}
static napi_value OH_UdmfData_GetPrimaryPlainText_0001(napi_env env, napi_callback_info info)
{
    int result = OH_UdmfData_GetPrimaryPlainText(nullptr, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_INVALID_PARAM, &returnCode);

    return returnCode;
}


static napi_value OH_UdmfData_GetPrimaryPlainText_0003(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    int result = OH_UdmfData_GetPrimaryPlainText(data, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetPrimaryPlainText_0005(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdmfData *data = OH_UdmfData_Create();
    int result = OH_UdmfData_GetPrimaryPlainText(data, plainText);
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_ERR, &returnCode);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfData_Destroy(data);
    return returnCode;
}
static napi_value OH_UdmfData_GetPrimaryPlainText_0006(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdsHtml *html = OH_UdsHtml_Create();
    OH_UdsPlainText *plainTextOutput = OH_UdsPlainText_Create();
    OH_UdsHtml_SetContent(html, "<p>Hello world</p>");
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdmfRecord_AddHtml(record, html);
    OH_UdmfData_AddRecord(data, record);
    int result = OH_UdmfData_GetPrimaryPlainText(data, plainTextOutput);
   
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_ERR, &returnCode);

    OH_UdsHtml_Destroy(html);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetPrimaryPlainText_0007(napi_env env, napi_callback_info info)
{
    const char *helloWorld = "Hello world";

    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetContent(plainText, helloWorld);
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(data, record);
    OH_UdmfData_AddRecord(data, record);
    int result = OH_UdmfData_GetPrimaryPlainText(data, plainText);

    auto *content = OH_UdsPlainText_GetContent(plainText);
   
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_OK && strcmp(content, helloWorld) == 0, &returnCode);
    
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetPrimaryHtml_0001(napi_env env, napi_callback_info info)
{
    int result = OH_UdmfData_GetPrimaryHtml(nullptr, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_INVALID_PARAM, &returnCode);

    return returnCode;
}


static napi_value OH_UdmfData_GetPrimaryHtml_0003(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    int result = OH_UdmfData_GetPrimaryHtml(data, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetPrimaryHtml_0005(napi_env env, napi_callback_info info)
{
    OH_UdsHtml *html = OH_UdsHtml_Create();
    OH_UdmfData *data = OH_UdmfData_Create();
    int result = OH_UdmfData_GetPrimaryHtml(data, html);
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_ERR, &returnCode);
    OH_UdsHtml_Destroy(html);
    OH_UdmfData_Destroy(data);
    return returnCode;
}
static napi_value OH_UdmfData_GetPrimaryHtml_0006(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdsHtml *htmlOutput = OH_UdsHtml_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetContent(plainText, "Hello world");
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(data, record);
    int result = OH_UdmfData_GetPrimaryHtml(data, htmlOutput);

    napi_value returnCode;
    napi_create_int32(env, result == UDMF_ERR, &returnCode);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdsHtml_Destroy(htmlOutput);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(data);
    return returnCode;
}
static napi_value OH_UdmfData_GetPrimaryHtml_0007(napi_env env, napi_callback_info info)
{
    const char *helloWorld = "Hello world";

    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdsHtml *html = OH_UdsHtml_Create();
    OH_UdsHtml_SetContent(html, helloWorld);
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfRecord_AddHtml(record, html);
    OH_UdmfData_AddRecord(data, record);

    int result = OH_UdmfData_GetPrimaryHtml(data, html);
    auto content = OH_UdsHtml_GetContent(html);

    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_OK && strcmp(content, helloWorld) == 0, &returnCode);
    
    OH_UdsHtml_Destroy(html);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetRecordCount001(napi_env env, napi_callback_info info)
{
    int result = OH_UdmfData_GetRecordCount(nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == 0, &returnCode);
    return returnCode;
}


static napi_value OH_UdmfData_GetRecordCount003(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    int result = OH_UdmfData_GetRecordCount(data);
    napi_value returnCode;
    napi_create_int32(env, result == 0, &returnCode);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetRecordCount004(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdmfData_AddRecord(data, record);
    int result = OH_UdmfData_GetRecordCount(data);

    napi_value returnCode;
    napi_create_int32(env, result == 1, &returnCode);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetRecordCount005(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdmfData_AddRecord(data, record);
    OH_UdmfData_AddRecord(data, record2);
    int result = OH_UdmfData_GetRecordCount(data);
    int num = 2;
    napi_value returnCode;
    napi_create_int32(env, result == num, &returnCode);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(record2);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetRecord001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *result = OH_UdmfData_GetRecord(nullptr, -1);
    napi_value returnCode;
    napi_create_int32(env, result == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfData_GetRecord004(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfRecord *result = OH_UdmfData_GetRecord(data, -1);
    napi_value returnCode;
    napi_create_int32(env, result == nullptr, &returnCode);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetRecord005(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfRecord *result = OH_UdmfData_GetRecord(data, 0);
    napi_value returnCode;
    napi_create_int32(env, result == nullptr, &returnCode);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetRecord011(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfRecord *result = OH_UdmfData_GetRecord(data, 1);
    napi_value returnCode;
    napi_create_int32(env, result == nullptr, &returnCode);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetRecord006(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData_AddRecord(data, record);
    int result1 = OH_UdmfData_GetRecordCount(data);
    OH_UdmfRecord *result = OH_UdmfData_GetRecord(data, -1);
    napi_value returnCode;
    napi_create_int32(env, result1 == 1 && result == nullptr, &returnCode);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetRecord007(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData_AddRecord(data, record);
    int result1 = OH_UdmfData_GetRecordCount(data);
    OH_UdmfRecord *result = OH_UdmfData_GetRecord(data, 0);
    napi_value returnCode;
    napi_create_int32(env, result1 == 1 && result != nullptr, &returnCode);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(data);
    return returnCode;
}
static napi_value OH_UdmfData_GetRecord008(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData_AddRecord(data, record);
    int result1 = OH_UdmfData_GetRecordCount(data);
    OH_UdmfRecord *result = OH_UdmfData_GetRecord(data, 1);

    napi_value returnCode;
    napi_create_int32(env, result1 == 1 && result == nullptr, &returnCode);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfData_GetRecord009(napi_env env, napi_callback_info info)
{
    const char *helloWorld = "Hello world";
   
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetContent(plainText, helloWorld);
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(data, record);
    OH_UdmfRecord *result = OH_UdmfData_GetRecord(data, 0);

    OH_UdsPlainText *plainText2 = OH_UdsPlainText_Create();
    OH_UdmfRecord_GetPlainText(result, plainText2);
    auto content = OH_UdsPlainText_GetContent(plainText2);

    napi_value returnCode;
    napi_create_int32(env, strcmp(content, helloWorld) == 0 &&
     result != nullptr, &returnCode);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(data);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdsPlainText_Destroy(plainText2);
    return returnCode;
}

static napi_value OH_UdmfData_GetRecord010(napi_env env, napi_callback_info info)
{
    const char *helloWorld = "Hello world";
    const char *helloWorld2 = "Hello world2";

    OH_UdmfData *data3 = OH_UdmfData_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetContent(plainText, helloWorld);
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(data3, record);
    OH_UdmfRecord *result9 = OH_UdmfData_GetRecord(data3, 0);
    OH_UdsPlainText *plainText2 = OH_UdsPlainText_Create();
    OH_UdmfRecord_GetPlainText(result9, plainText2);
    auto content = OH_UdsPlainText_GetContent(plainText2);

    OH_UdmfData *data4 = OH_UdmfData_Create();
    OH_UdsPlainText *plainText3 = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetContent(plainText3, helloWorld2);
    OH_UdmfRecord* record2 = OH_UdmfRecord_Create();
    OH_UdmfRecord_AddPlainText(record2, plainText3);
    OH_UdmfData_AddRecord(data4, record);
    OH_UdmfData_AddRecord(data4, record2);
    OH_UdmfRecord *result10 = OH_UdmfData_GetRecord(data4, -1);
    OH_UdmfRecord *result11 = OH_UdmfData_GetRecord(data4, 2);
    OH_UdmfRecord *result12 = OH_UdmfData_GetRecord(data4, 0);
    OH_UdsPlainText *plainText4 = OH_UdsPlainText_Create();
    OH_UdmfRecord_GetPlainText(result12, plainText4);
    auto content2 = OH_UdsPlainText_GetContent(plainText4);
    OH_UdmfRecord *result13 = OH_UdmfData_GetRecord(data4, 1);
    OH_UdsPlainText *plainText5 = OH_UdsPlainText_Create();
    OH_UdmfRecord_GetPlainText(result13, plainText5);
    auto content3 = OH_UdsPlainText_GetContent(plainText5);

    napi_value returnCode;
    napi_create_int32(
        env,
        result9 != nullptr && strcmp(content, helloWorld) == PARAM_0 &&
        result10 == nullptr && result11 == nullptr && result12 != nullptr &&
        strcmp(content2, helloWorld) == PARAM_0 && result13 != nullptr &&
        strcmp(content2, helloWorld) == PARAM_0 &&
        strcmp(content3, helloWorld2) == PARAM_0,
        &returnCode);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(record2);
    OH_UdmfData_Destroy(data4);
    OH_UdsPlainText_Destroy(plainText3);
    OH_UdsPlainText_Destroy(plainText4);
    OH_UdsPlainText_Destroy(plainText5);
    return returnCode;
}


static napi_value OH_UdmfData_IsLocal001(napi_env env, napi_callback_info info)
{
    bool result = OH_UdmfData_IsLocal(nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == true, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfData_IsLocal003(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    bool result = OH_UdmfData_IsLocal(data);
    napi_value returnCode;
    napi_create_int32(env, result == true, &returnCode);
    OH_UdmfData_Destroy(data);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddArrayBuffer001(napi_env env, napi_callback_info info)
{
    int buildRes = OH_UdmfRecord_AddArrayBuffer(nullptr, nullptr, nullptr);

    napi_value returnCode;
    napi_create_int32(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}


static napi_value OH_UdmfRecord_AddArrayBuffer003(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    int buildRes = OH_UdmfRecord_AddArrayBuffer(record, nullptr, nullptr);
    napi_value returnCode;
    napi_create_int32(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecord_Destroy(record);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddArrayBuffer005(napi_env env, napi_callback_info info)
{
    OH_UdsArrayBuffer *buffer = OH_UdsArrayBuffer_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    int buildRes = OH_UdmfRecord_AddArrayBuffer(record, nullptr, buffer);
    napi_value returnCode;
    napi_create_int32(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecord_Destroy(record);
    OH_UdsArrayBuffer_Destroy(buffer);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddArrayBuffer006(napi_env env, napi_callback_info info)
{
    OH_UdsArrayBuffer *buffer = OH_UdsArrayBuffer_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    char type[] = "general.plain-text";
    int buildRes = OH_UdmfRecord_AddArrayBuffer(record, type, buffer);
    napi_value returnCode;
    napi_create_int32(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecord_Destroy(record);
    OH_UdsArrayBuffer_Destroy(buffer);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddArrayBuffer007(napi_env env, napi_callback_info info)
{
    OH_UdsArrayBuffer *buffer = OH_UdsArrayBuffer_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    char type[] = "ApplicationDefined-myType1";
    int buildRes = OH_UdmfRecord_AddArrayBuffer(record, type, buffer);
    napi_value returnCode;
    napi_create_int32(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecord_Destroy(record);
    OH_UdsArrayBuffer_Destroy(buffer);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddArrayBuffer008(napi_env env, napi_callback_info info)
{
    unsigned char data1[] = "Hello world";
    unsigned int len1 = sizeof(data1);
    OH_UdsArrayBuffer *buffer1 = OH_UdsArrayBuffer_Create();
    OH_UdsArrayBuffer_SetData(buffer1, data1, len1);

    char type1[] = "ApplicationDefined-myType1";
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    int buildRes = OH_UdmfRecord_AddArrayBuffer(record1, type1, buffer1);
    napi_value returnCode;
    napi_create_int32(env, buildRes == UDMF_E_OK, &returnCode);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsArrayBuffer_Destroy(buffer1);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetArrayBuffer001(napi_env env, napi_callback_info info)
{
    unsigned char data1[] = "Hello world";
    unsigned int len1 = sizeof(data1);
    OH_UdsArrayBuffer *buffer1 = OH_UdsArrayBuffer_Create();
    OH_UdsArrayBuffer_SetData(buffer1, data1, len1);

    char type1[] = "ApplicationDefined-myType1";
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    int buildRes = OH_UdmfRecord_AddArrayBuffer(record1, type1, buffer1);

    char type2[] = "ApplicationDefined-myType2";
    OH_UdsArrayBuffer *buffer2 = OH_UdsArrayBuffer_Create();
    int getRes = OH_UdmfRecord_GetArrayBuffer(record1, type2, buffer2);

    napi_value returnCode;
    napi_create_int32(env, buildRes == UDMF_E_OK && getRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsArrayBuffer_Destroy(buffer1);
    OH_UdsArrayBuffer_Destroy(buffer2);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetArrayBuffer002(napi_env env, napi_callback_info info)
{
    unsigned char data1[] = "Hello world";
    unsigned int len1 = sizeof(data1);
    OH_UdsArrayBuffer *buffer1 = OH_UdsArrayBuffer_Create();
    OH_UdsArrayBuffer_SetData(buffer1, data1, len1);

    char type1[] = "ApplicationDefined-myType1";
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    int buildRes = OH_UdmfRecord_AddArrayBuffer(record1, type1, buffer1);
    OH_UdsArrayBuffer *buffer2 = OH_UdsArrayBuffer_Create();
    int getRes = OH_UdmfRecord_GetArrayBuffer(record1, type1, buffer2);

    napi_value returnCode;
    napi_create_int32(env, buildRes == UDMF_E_OK && getRes == UDMF_E_OK, &returnCode);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsArrayBuffer_Destroy(buffer1);
    OH_UdsArrayBuffer_Destroy(buffer2);
    return returnCode;
}

static napi_value OH_UdsArrayBuffer_Create_001(napi_env env, napi_callback_info info)
{
    auto buffer = OH_UdsArrayBuffer_Create();

    int ret = OH_UdsArrayBuffer_Destroy(buffer);

    napi_value returnCode;
    napi_create_int32(env, buffer != nullptr && ret == UDMF_E_OK, &returnCode);
    return returnCode;
}

static napi_value OH_UdsArrayBuffer_SetData_001(napi_env env, napi_callback_info info)
{
    int result = OH_UdsArrayBuffer_SetData(nullptr, nullptr, 0);

    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdsArrayBuffer_SetData_002(napi_env env, napi_callback_info info)
{
    auto buffer = OH_UdsArrayBuffer_Create();
    int result = OH_UdsArrayBuffer_SetData(buffer, nullptr, 0);

    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdsArrayBuffer_Destroy(buffer);
    return returnCode;
}

static napi_value OH_UdsArrayBuffer_SetData_003(napi_env env, napi_callback_info info)
{
    unsigned char data[] = "doing something";
    auto buffer = OH_UdsArrayBuffer_Create();
    int result = OH_UdsArrayBuffer_SetData(buffer, data, 0);

    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdsArrayBuffer_Destroy(buffer);
    return returnCode;
}

static napi_value OH_UdsArrayBuffer_SetData_004(napi_env env, napi_callback_info info)
{
    unsigned char data[] = "doing something";
    auto buffer = OH_UdsArrayBuffer_Create();
    int result = OH_UdsArrayBuffer_SetData(buffer, data, 128 * 1024 * 1024 + 1);

    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdsArrayBuffer_Destroy(buffer);
    return returnCode;
}

static napi_value OH_UdsArrayBuffer_SetData_005(napi_env env, napi_callback_info info)
{
    unsigned char data[] = "doing something";
    unsigned int len = sizeof(data);
    auto buffer = OH_UdsArrayBuffer_Create();
    int result = OH_UdsArrayBuffer_SetData(buffer, data, len);

    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_OK, &returnCode);
    OH_UdsArrayBuffer_Destroy(buffer);
    return returnCode;
}

static napi_value OH_UdsArrayBuffer_GetData001(napi_env env, napi_callback_info info)
{
    unsigned char data[] = "doing something";
    unsigned int len = sizeof(data);
    auto buffer = OH_UdsArrayBuffer_Create();
    OH_UdsArrayBuffer_SetData(buffer, data, len);

    unsigned char *getData;
    unsigned int getLen;
    int ret = OH_UdsArrayBuffer_GetData(buffer, &getData, &getLen);

    napi_value returnCode;
    napi_create_int32(env, ret == UDMF_E_OK && getLen == len &&
     CheckUnsignedChar(data, getData, getLen) == true, &returnCode);
    OH_UdsArrayBuffer_Destroy(buffer);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetFileUri001(napi_env env, napi_callback_info info)
{
    const char* uri = "https://xxx/xx/xx.jpg";
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord *udmfRecord = OH_UdmfRecord_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdsFileUri_SetFileType(fileUri, "general.image");
    OH_UdmfRecord_AddFileUri(udmfRecord, fileUri);

    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfData_AddRecord(udmfUnifiedData, udmfRecord);
    char key[UDMF_KEY_BUFFER_LEN] = {0};

    OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, sizeof(key));

    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    OH_Udmf_GetUnifiedData(key, intention, readUnifiedData);

    unsigned int recordCount;
    
    OH_UdmfRecord** reRecords = OH_UdmfData_GetRecords(readUnifiedData, &recordCount);
    int getFileUriRet = 1;
    
    for (unsigned int idx = 0; idx < recordCount; ++idx) {
        unsigned int recordTypeCount;
        char** recordTypes = OH_UdmfRecord_GetTypes(reRecords[idx], &recordTypeCount);
        OH_UdmfRecord_GetTypes(reRecords[0], &recordTypeCount);
        for (unsigned int recordIdx = 0; recordIdx < recordTypeCount; ++recordIdx) {
            if (strcmp(recordTypes[recordIdx], "general.image") == 0) {
                OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
                getFileUriRet = OH_UdmfRecord_GetFileUri(reRecords[idx], fileUri);
            }
        }
    }

    napi_value returnCode;
    napi_create_int32(env, getFileUriRet == UDMF_E_OK, &returnCode);
   
    OH_UdmfRecord_Destroy(udmfRecord);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfData_Destroy(readUnifiedData);

    return returnCode;
}

static napi_value OH_UdmfRecord_GetFileUri002(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *udmfRecord = OH_UdmfRecord_Create();
    int res = OH_UdmfRecord_GetFileUri(udmfRecord, nullptr);
    napi_value returnCode;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecord_Destroy(udmfRecord);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetFileUri003(napi_env env, napi_callback_info info)
{
    int res = OH_UdmfRecord_GetFileUri(nullptr, nullptr);
    napi_value returnCode;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetPixelMap001(napi_env env, napi_callback_info info)
{
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    OH_UdsPixelMap *pixelMap = OH_UdsPixelMap_Create();
    uint8_t data [500];
    int dataSize = 500;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    int width = 6;
    OH_PixelmapInitializationOptions_SetWidth(createOpts, width);
    int height = 4;
    OH_PixelmapInitializationOptions_SetHeight(createOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative *pixelmapNative;
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmapNative);

    int result1 = OH_UdsPixelMap_SetPixelMap(pixelMap, pixelmapNative);

    OH_UdmfRecord *udmfRecord = OH_UdmfRecord_Create();
    OH_UdmfRecord_AddPixelMap(udmfRecord, pixelMap);
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfData_AddRecord(udmfUnifiedData, udmfRecord);
    char key[UDMF_KEY_BUFFER_LEN] = {0};

    OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, sizeof(key));

    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    OH_Udmf_GetUnifiedData(key, intention, readUnifiedData);

    unsigned int recordCount;
    
    OH_UdmfRecord** reRecords = OH_UdmfData_GetRecords(readUnifiedData, &recordCount);
    OH_UdsPixelMap *pixelMap1 = OH_UdsPixelMap_Create();
    int result = OH_UdmfRecord_GetPixelMap(reRecords[0], pixelMap1);
    
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_E_OK && result1 == UDMF_E_OK, &returnCode);

    OH_UdsPixelMap_Destroy(pixelMap);
    OH_UdsPixelMap_Destroy(pixelMap1);
    OH_UdmfRecord_Destroy(udmfRecord);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfData_Destroy(readUnifiedData);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetPixelMap002(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *udmfRecord = OH_UdmfRecord_Create();
    int res = OH_UdmfRecord_GetPixelMap(udmfRecord, nullptr);
    
    napi_value returnCode;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecord_Destroy(udmfRecord);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetPixelMap003(napi_env env, napi_callback_info info)
{
    int res = OH_UdmfRecord_GetPixelMap(nullptr, nullptr);
    napi_value returnCode;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdsFileUri_Create001(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_Destroy(fileUri);
    napi_value returnCode;
    napi_create_int32(env, fileUri != nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_UdsFileUri_GetType001(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    const char*  result = OH_UdsFileUri_GetType(fileUri);
    OH_UdsFileUri_Destroy(fileUri);

    napi_value returnCode;
    napi_create_int32(env, strcmp(result, UDMF_META_GENERAL_FILE_URI) == PARAM_0, &returnCode);
    return returnCode;
}

static napi_value OH_UdsFileUri_GetType002(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri* fileUriNullptr = nullptr;
    auto result = OH_UdsFileUri_GetType(fileUriNullptr);
    OH_UdsFileUri_Destroy(fileUriNullptr);
    
    napi_value returnCode;
    napi_create_int32(env, result == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_UdsFileUri_GetFileUri001(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    const char* fileparam = "fileUri";
    OH_UdsFileUri_SetFileUri(fileUri, fileparam);
    const char*  result = OH_UdsFileUri_GetFileUri(fileUri);
    
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, fileparam) == PARAM_0, &returnCode);
    OH_UdsFileUri_Destroy(fileUri);

    return returnCode;
}

static napi_value OH_UdsFileUri_GetFileUri002(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri* fileUriNullptr = nullptr;
    auto  result = OH_UdsFileUri_GetFileUri(fileUriNullptr);
    
    napi_value returnCode;
    napi_create_int32(env, result == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_UdsFileUri_GetFileType001(napi_env env, napi_callback_info info)
{
    auto fileUri = OH_UdsFileUri_Create();
    const char* fileparam = "file type";
    OH_UdsFileUri_SetFileType(fileUri, fileparam);
    const char* result = OH_UdsFileUri_GetFileType(fileUri);
    
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, fileparam) == PARAM_0, &returnCode);
    OH_UdsFileUri_Destroy(fileUri);
    return returnCode;
}

static napi_value OH_UdsFileUri_GetFileType002(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri* fileUriNullptr = nullptr;
    auto  result = OH_UdsFileUri_GetFileType(fileUriNullptr);
    
    napi_value returnCode;
    napi_create_int32(env, result == nullptr, &returnCode);
    return returnCode;
}


static napi_value OH_UdsFileUri_SetFileUri_0100(napi_env env, napi_callback_info info)
{
    napi_value returnCode = nullptr;
    auto fileUri = OH_UdsFileUri_Create();
    int result = OH_UdsFileUri_SetFileUri(fileUri, "file uri");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsFileUri_SetFileUri is fail");

    result = OH_UdsFileUri_SetFileUri(nullptr, "file uri");
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsFileUri_SetFileUri is fail");

    result = OH_UdsFileUri_SetFileUri(fileUri, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsFileUri_SetFileUri is fail");
    
    napi_create_int32(env, result == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdsFileUri_Destroy(fileUri);
    return returnCode;
}

static napi_value OH_UdsFileUri_SetFileType_0100(napi_env env, napi_callback_info info)
{
    napi_value returnCode = nullptr;
    auto fileUri = OH_UdsFileUri_Create();
    int result = OH_UdsFileUri_SetFileType(fileUri, "file type");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsFileUri_SetFileType is fail");
    
    result = OH_UdsFileUri_SetFileType(nullptr, "file type");
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsFileUri_SetFileType is fail");
    
    result = OH_UdsFileUri_SetFileType(fileUri, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsFileUri_SetFileType is fail");
    
    napi_create_int32(env, result == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdsFileUri_Destroy(fileUri);
    return returnCode;
}

static napi_value OH_UdsPixelMap_Create_0100(napi_env env, napi_callback_info info)
{
    napi_value returnCode = nullptr;
    auto pixelMap = OH_UdsPixelMap_Create();
    napi_create_int32(env, returnCode == nullptr, &returnCode);
    OH_UdsPixelMap_Destroy(pixelMap);
    return returnCode;
}

static napi_value OH_UdsPixelMap_GetType_0100(napi_env env, napi_callback_info info)
{
    napi_value returnCode = nullptr;
    auto pixelMap = OH_UdsPixelMap_Create();
    NAPI_ASSERT(env, UDMF_META_OPENHARMONY_PIXEL_MAP == std::string(OH_UdsPixelMap_GetType(pixelMap)),
        "OH_UdsFileUri_SetFileType is fail");
    OH_UdsPixelMap_Destroy(pixelMap);
    OH_UdsPixelMap* pixelMapNullptr = nullptr;
    NAPI_ASSERT(env, OH_UdsPixelMap_GetType(pixelMapNullptr) == nullptr, "OH_UdsPixelMap_GetType is fail");
    
    napi_create_int32(env, returnCode == nullptr, &returnCode);
    
    OH_UdsPixelMap_Destroy(pixelMapNullptr);
    return returnCode;
}

static napi_value OH_UdsPixelMap_SetPixelMap_0100(napi_env env, napi_callback_info info)
{
    napi_value returnCode = nullptr;
    auto pixelMap = OH_UdsPixelMap_Create();
    uint8_t data [500];
    int dataSize = 500;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    int width = 6;
    OH_PixelmapInitializationOptions_SetWidth(createOpts, width);
    int height = 4;
    OH_PixelmapInitializationOptions_SetHeight(createOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative *pixelmapNative;
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmapNative);
    
    int result = OH_UdsPixelMap_SetPixelMap(pixelMap, pixelmapNative);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsPixelMap_SetPixelMap is fail");
    
    uint8_t data1 [500];
    int dataSize1 = 500;
    for (int i = 0; i < dataSize1; i++) {
        data1[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts1;
    OH_PixelmapInitializationOptions_Create(&createOpts1);
    int width1 = 6;
    OH_PixelmapInitializationOptions_SetWidth(createOpts1, width1);
    int height1 = 4;
    OH_PixelmapInitializationOptions_SetHeight(createOpts1, height1);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts1, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts1, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative *pixelmapNativeGet;
    OH_PixelmapNative_CreatePixelmap(data1, dataSize1, createOpts1, &pixelmapNativeGet);
    OH_UdsPixelMap_GetPixelMap(pixelMap, pixelmapNativeGet);
    
    NAPI_ASSERT(env, pixelmapNativeGet != nullptr, "OH_OH_UdsPixelMap_GetPixelMap is fail");
    napi_create_int32(env, result == UDMF_E_OK, &returnCode);
    OH_PixelmapNative_Release (pixelmapNative);
    OH_UdsPixelMap_Destroy(pixelMap);
    return returnCode;
}

static napi_value OH_UdmfRecordProvider_Destroy0100(napi_env env, napi_callback_info info)
{
    OH_UdmfRecordProvider* provider = OH_UdmfRecordProvider_Create();
    NAPI_ASSERT(env, provider != nullptr, "OH_UdmfRecordProvider_Create is fail");
    
    int num = 1;
    void* context = &num;
    OH_UdmfRecordProvider_SetData(provider, context, GetDataCallbackFunc, FinalizeFunc);
    int res1 = OH_UdmfRecordProvider_Destroy(provider);
    NAPI_ASSERT(env, res1 == UDMF_E_OK, "OH_UdmfRecordProvider_SetData is fail");
    
    napi_value returnCode;
    napi_create_int32(env, res1 == UDMF_E_OK, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecordProvider_Destroy0200(napi_env env, napi_callback_info info)
{
    OH_UdmfRecordProvider* provider = OH_UdmfRecordProvider_Create();
    NAPI_ASSERT(env, provider != nullptr, "OH_UdmfRecordProvider_Create is fail");
    
    int num = 1;
    void* context = &num;
    OH_UdmfRecordProvider_SetData(provider, context, GetDataCallbackFunc, nullptr);
    int res1 = OH_UdmfRecordProvider_Destroy(provider);
    NAPI_ASSERT(env, res1 == UDMF_E_OK, "OH_UdmfRecordProvider_Destroy is fail");
    
    napi_value returnCode;
    napi_create_int32(env, res1 == UDMF_E_OK, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecordProvider_Create0100(napi_env env, napi_callback_info info)
{
    OH_UdmfRecordProvider* provider = OH_UdmfRecordProvider_Create();
    napi_value returnCode;
    napi_create_int32(env, provider != nullptr, &returnCode);
    OH_UdmfRecordProvider_Destroy(provider);
    return returnCode;
}


static napi_value OH_UdmfRecordProvider_SetData0100(napi_env env, napi_callback_info info)
{
    napi_value returnCode;
    OH_UdmfRecordProvider* provider = OH_UdmfRecordProvider_Create();
    NAPI_ASSERT(env, provider != nullptr, "OH_UdmfRecordProvider_Create is fail");
    int num = 1;
    void* context = &num;
    int res = OH_UdmfRecordProvider_SetData(provider, context, GetDataCallbackFunc, FinalizeFunc);
    NAPI_ASSERT(env, res == UDMF_E_OK, "OH_UdmfRecordProvider_SetData is fail");
    napi_create_int32(env, res == UDMF_E_OK, &returnCode);
    OH_UdmfRecordProvider_Destroy(provider);
    return returnCode;
}
static napi_value OH_UdmfRecordProvider_SetData0200(napi_env env, napi_callback_info info)
{
    OH_UdmfRecordProvider* provider = OH_UdmfRecordProvider_Create();
    NAPI_ASSERT(env, provider != nullptr, "OH_UdmfRecordProvider_Create is fail");
    int num = 1;
    void* context = &num;
    int res1 = OH_UdmfRecordProvider_SetData(provider, context, GetDataCallbackFunc, nullptr);
    NAPI_ASSERT(env, res1 == UDMF_E_INVALID_PARAM, "OH_UdmfRecordProvider_SetData is fail");

    int res2 = OH_UdmfRecordProvider_SetData(nullptr, context, GetDataCallbackFunc, nullptr);
    NAPI_ASSERT(env, res2 == UDMF_E_INVALID_PARAM, "OH_UdmfRecordProvider_SetData is fail");

    int res3 = OH_UdmfRecordProvider_SetData(provider, context, nullptr, nullptr);
    NAPI_ASSERT(env, res3 == UDMF_E_INVALID_PARAM, "OH_UdmfRecordProvider_SetData is fail");
    
    napi_value returnCode;
    napi_create_int32(env, res1 == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecordProvider_Destroy(provider);
    return returnCode;
}

static napi_value OH_UdmfRecord_SetProvider0100(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfRecordProvider* provider = OH_UdmfRecordProvider_Create();
    NAPI_ASSERT(env, provider != nullptr, "OH_UdmfRecordProvider_Create is fail");
    
    int num = 1;
    void* context = &num;
    OH_UdmfRecordProvider_SetData(provider, context, GetDataCallbackFunc, FinalizeFunc);
    const char* types[3] = { "general.plain-text", "general.hyperlink", "general.html" };
    int res = OH_UdmfRecord_SetProvider(record, types, 3, provider);
    NAPI_ASSERT(env, res == UDMF_E_OK, "OH_UdmfRecord_SetProvider is fail");
    
    napi_value returnCode;
    napi_create_int32(env, res == UDMF_E_OK, &returnCode);
    OH_UdmfRecordProvider_Destroy(provider);
    return returnCode;
}

static napi_value OH_UdmfRecord_SetProvider0200(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfRecordProvider* provider = OH_UdmfRecordProvider_Create();
    NAPI_ASSERT(env, provider != nullptr, "OH_UdmfRecordProvider_Create is fail");
    
    int num = 1;
    void* context = &num;
    OH_UdmfRecordProvider_SetData(provider, context, GetDataCallbackFunc, FinalizeFunc);
    const char* types[3] = { "general.plain-text", "general.hyperlink", "general.html" };
    int res = OH_UdmfRecord_SetProvider(record, types, 3, provider);
    NAPI_ASSERT(env, res == UDMF_E_OK, "OH_UdmfRecord_SetProvider is fail");
    
    napi_value returnCode;
    napi_create_int32(env, res == UDMF_E_OK, &returnCode);
    OH_UdmfRecordProvider_Destroy(provider);
    return returnCode;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_UdmfData_GetPrimaryPlainText_0001", nullptr, OH_UdmfData_GetPrimaryPlainText_0001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetPrimaryPlainText_0003", nullptr, OH_UdmfData_GetPrimaryPlainText_0003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetPrimaryPlainText_0005", nullptr, OH_UdmfData_GetPrimaryPlainText_0005, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetPrimaryPlainText_0006", nullptr, OH_UdmfData_GetPrimaryPlainText_0006, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetPrimaryPlainText_0007", nullptr, OH_UdmfData_GetPrimaryPlainText_0007, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetPrimaryHtml_0001", nullptr, OH_UdmfData_GetPrimaryHtml_0001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetPrimaryHtml_0003", nullptr, OH_UdmfData_GetPrimaryHtml_0003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetPrimaryHtml_0005", nullptr, OH_UdmfData_GetPrimaryHtml_0005, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetPrimaryHtml_0006", nullptr, OH_UdmfData_GetPrimaryHtml_0006, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetPrimaryHtml_0007", nullptr, OH_UdmfData_GetPrimaryHtml_0007, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecordCount001", nullptr, OH_UdmfData_GetRecordCount001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecordCount003", nullptr, OH_UdmfData_GetRecordCount003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecordCount004", nullptr, OH_UdmfData_GetRecordCount004, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecordCount005", nullptr, OH_UdmfData_GetRecordCount005, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecord001", nullptr, OH_UdmfData_GetRecord001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecord004", nullptr, OH_UdmfData_GetRecord004, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecord005", nullptr, OH_UdmfData_GetRecord005, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecord006", nullptr, OH_UdmfData_GetRecord006, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecord007", nullptr, OH_UdmfData_GetRecord007, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecord008", nullptr, OH_UdmfData_GetRecord008, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecord009", nullptr, OH_UdmfData_GetRecord009, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecord010", nullptr, OH_UdmfData_GetRecord010, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecord011", nullptr, OH_UdmfData_GetRecord011, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_IsLocal001", nullptr, OH_UdmfData_IsLocal001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_IsLocal003", nullptr, OH_UdmfData_IsLocal003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddArrayBuffer001", nullptr, OH_UdmfRecord_AddArrayBuffer001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddArrayBuffer003", nullptr, OH_UdmfRecord_AddArrayBuffer003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddArrayBuffer005", nullptr, OH_UdmfRecord_AddArrayBuffer005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddArrayBuffer006", nullptr, OH_UdmfRecord_AddArrayBuffer006, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddArrayBuffer007", nullptr, OH_UdmfRecord_AddArrayBuffer007, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddArrayBuffer008", nullptr, OH_UdmfRecord_AddArrayBuffer008, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetArrayBuffer001", nullptr, OH_UdmfRecord_GetArrayBuffer001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetArrayBuffer002", nullptr, OH_UdmfRecord_GetArrayBuffer002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsArrayBuffer_Create_001", nullptr, OH_UdsArrayBuffer_Create_001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsArrayBuffer_SetData_001", nullptr, OH_UdsArrayBuffer_SetData_001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsArrayBuffer_SetData_002", nullptr, OH_UdsArrayBuffer_SetData_002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsArrayBuffer_SetData_003", nullptr, OH_UdsArrayBuffer_SetData_003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsArrayBuffer_SetData_004", nullptr, OH_UdsArrayBuffer_SetData_004, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsArrayBuffer_SetData_005", nullptr, OH_UdsArrayBuffer_SetData_005, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsArrayBuffer_GetData001", nullptr, OH_UdsArrayBuffer_GetData001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetFileUri001", nullptr, OH_UdmfRecord_GetFileUri001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetFileUri002", nullptr, OH_UdmfRecord_GetFileUri002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetFileUri003", nullptr, OH_UdmfRecord_GetFileUri003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetPixelMap001", nullptr, OH_UdmfRecord_GetPixelMap001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetPixelMap002", nullptr, OH_UdmfRecord_GetPixelMap002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetPixelMap003", nullptr, OH_UdmfRecord_GetPixelMap003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_Create001", nullptr, OH_UdsFileUri_Create001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_GetType001", nullptr, OH_UdsFileUri_GetType001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_GetType002", nullptr, OH_UdsFileUri_GetType002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_GetFileUri001", nullptr, OH_UdsFileUri_GetFileUri001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_GetFileUri002", nullptr, OH_UdsFileUri_GetFileUri002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_GetFileType001", nullptr, OH_UdsFileUri_GetFileType001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_GetFileType002", nullptr, OH_UdsFileUri_GetFileType002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_SetFileUri_0100", nullptr, OH_UdsFileUri_SetFileUri_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_SetFileType_0100", nullptr, OH_UdsFileUri_SetFileType_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsPixelMap_Create_0100", nullptr, OH_UdsPixelMap_Create_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsPixelMap_GetType_0100", nullptr, OH_UdsPixelMap_GetType_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsPixelMap_SetPixelMap_0100", nullptr, OH_UdsPixelMap_SetPixelMap_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecordProvider_Destroy0100", nullptr, OH_UdmfRecordProvider_Destroy0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecordProvider_Destroy0200", nullptr, OH_UdmfRecordProvider_Destroy0200, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecordProvider_Create0100", nullptr, OH_UdmfRecordProvider_Create0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecordProvider_SetData0100", nullptr, OH_UdmfRecordProvider_SetData0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecordProvider_SetData0200", nullptr, OH_UdmfRecordProvider_SetData0200, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_SetProvider0100", nullptr, OH_UdmfRecord_SetProvider0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_SetProvider0200", nullptr, OH_UdmfRecord_SetProvider0200, nullptr, nullptr,
         nullptr, napi_default, nullptr},
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
