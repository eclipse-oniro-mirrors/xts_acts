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
#include "database/udmf/udmf.h"
#include "database/udmf/udmf_err_code.h"
#include <bits/alltypes.h>
#include <iostream>
#include <string>
#include "database/udmf/udmf_meta.h"
#include "database/udmf/uds.h"
#include "database/udmf/utd.h"
#include "common.h"
#include "napi/native_api.h"

#define PARAM_0 0
#define PARAM_1 1

static napi_value OH_Udmf_AddRecord001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    int status = OH_UdmfData_AddRecord(unifiedData, nullptr);
    napi_value result;
    napi_create_int32(env, status == UDMF_E_INVALID_PARAM, &result);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}

static napi_value OH_Udmf_AddRecord002(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    int status = OH_UdmfData_AddRecord(nullptr, record);
    napi_value result;
    napi_create_int32(env, status == UDMF_E_INVALID_PARAM, &result);
    OH_UdmfRecord_Destroy(record);
    return result;
}

static napi_value OH_Udmf_AddRecord003(napi_env env, napi_callback_info info)
{
    int status = OH_UdmfData_AddRecord(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, status == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdmfData_HasType001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(unifiedData, record);
    int hasType1 = OH_UdmfData_HasType(unifiedData, "");
    napi_value result;
    napi_create_int32(env,  hasType1 == 0, &result);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}

static napi_value OH_UdmfData_HasType002(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(unifiedData, record);
    char type2[] = "general.html";
    int hasType2 = OH_UdmfData_HasType(unifiedData, type2);
    napi_value result;
    napi_create_int32(env, hasType2 == 0, &result);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}
static napi_value OH_UdmfData_HasType003(napi_env env, napi_callback_info info)
{
    char type2[] = "general.html";
    int hasType2 = OH_UdmfData_HasType(nullptr, type2);
    napi_value result;
    napi_create_int32(env, hasType2 == 0, &result);
    return result;
}

static napi_value OH_UdmfData_HasType004(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(unifiedData, record);
    int hasType1 = OH_UdmfData_HasType(unifiedData, nullptr);
    napi_value result;
    napi_create_int32(env,  hasType1 == 0, &result);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}

static napi_value OH_UdmfData_HasType005(napi_env env, napi_callback_info info)
{
    int hasType2 = OH_UdmfData_HasType(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, hasType2 == 0, &result);
    return result;
}

static napi_value OH_UdmfData_GetTypes001(napi_env env, napi_callback_info info)
{
    unsigned int count1 = 0;
    char **types1 = OH_UdmfData_GetTypes(nullptr, &count1);
    napi_value result;
    napi_create_int32(env, types1 == nullptr, &result);
    return result;
}

static napi_value OH_UdmfData_GetTypes002(napi_env env, napi_callback_info info)
{
    char **types1 = OH_UdmfData_GetTypes(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, types1 == nullptr, &result);
    return result;
}

static napi_value OH_UdmfData_GetTypes003(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(unifiedData, record);
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHyperlink *hyperlink = OH_UdsHyperlink_Create();
    OH_UdmfRecord_AddHyperlink(record1, hyperlink);
    OH_UdmfData_AddRecord(unifiedData, record1);
    int num = 0;
    char **types1 = OH_UdmfData_GetTypes(unifiedData, nullptr);
    napi_value result;
    napi_create_int32(env, types1 == nullptr, &result);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdsHyperlink_Destroy(hyperlink);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}

static napi_value OH_UdmfRecord_GetTypes001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plaintext = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plaintext);
    char **types1 = OH_UdmfRecord_GetTypes(record, nullptr);
    napi_value result;
    napi_create_int32(env, (types1 == nullptr), &result);
    OH_UdmfRecord_Destroy(record);
    OH_UdsPlainText_Destroy(plaintext);
    return result;
}

static napi_value OH_UdmfRecord_GetTypes002(napi_env env, napi_callback_info info)
{
    unsigned int count = 0;
    char **types1 = OH_UdmfRecord_GetTypes(nullptr, &count);
    napi_value result;
    napi_create_int32(env, (types1 == nullptr), &result);
    return result;
}

static napi_value OH_UdmfRecord_GetTypes003(napi_env env, napi_callback_info info)
{
    char **types1 = OH_UdmfRecord_GetTypes(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, (types1 == nullptr), &result);
    return result;
}

static napi_value OH_Udmf_SetUnifiedData001(napi_env env, napi_callback_info info)
{
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedData(intention, nullptr, key, UDMF_KEY_BUFFER_LEN);
    napi_value result;
    napi_create_int32(env, setRes == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdmfData_GetRecords001(napi_env env, napi_callback_info info)
{
    unsigned int count = 0;
    OH_UdmfRecord** setRes = OH_UdmfData_GetRecords(nullptr, &count);
    napi_value result;
    napi_create_int32(env, setRes == nullptr, &result);
    return result;
}
static napi_value OH_UdmfData_GetRecords002(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord** setRes = OH_UdmfData_GetRecords(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, setRes == nullptr, &result);
    return result;
}

static napi_value OH_Udmf_GetUnifiedData002(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    char key[UDMF_KEY_BUFFER_LEN];
    OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    int getRes = OH_Udmf_GetUnifiedData(key, intention, nullptr);
    napi_value result;
    napi_create_int32(env, getRes == UDMF_E_INVALID_PARAM, &result);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return result;
}

static napi_value OH_Udmf_GetUnifiedData003(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    char key[UDMF_KEY_BUFFER_LEN];
    OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    int getRes = OH_Udmf_GetUnifiedData(nullptr, intention, readUnifiedData);
    napi_value result;
    napi_create_int32(env, getRes == UDMF_E_INVALID_PARAM, &result);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfData_Destroy(readUnifiedData);
    return result;
}

static napi_value OH_Udmf_AddAndGetGeneralEntry001(napi_env env, napi_callback_info info)
{
    char typeId[] = "general.plain-text";
    unsigned char entry[] = "CreateGeneralRecord";
    unsigned int count = sizeof(entry);
    int addRes1 = OH_UdmfRecord_AddGeneralEntry(nullptr, typeId, entry, count);
    napi_value result;
    napi_create_int32(env, (addRes1 == UDMF_E_INVALID_PARAM), &result);
    return result;
}
static napi_value OH_Udmf_AddAndGetGeneralEntry002(napi_env env, napi_callback_info info)
{
    char typeId[] = "general.plain-text";
    unsigned char entry[] = "";
    unsigned int count = sizeof(entry);
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    int addRes1 = OH_UdmfRecord_AddGeneralEntry(record, typeId, entry, count);
    napi_value result;
    napi_create_int32(env, addRes1 == UDMF_E_OK, &result);
    return result;
}
static napi_value OH_Udmf_AddAndGetGeneralEntry003(napi_env env, napi_callback_info info)
{
    char typeId[] = "";
    unsigned char entry[] = "CreateGeneralRecord";
    unsigned int count = sizeof(entry);
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    int addRes1 = OH_UdmfRecord_AddGeneralEntry(record, typeId, entry, count);
    napi_value result;
    napi_create_int32(env, addRes1 == UDMF_E_OK, &result);
    return result;
}
static napi_value OH_Udmf_AddAndGetGeneralEntry004(napi_env env, napi_callback_info info)
{
    char typeId[] = "";
    unsigned char entry[] = "CreateGeneralRecord";
    unsigned int count = sizeof(entry);
    int addRes1 = OH_UdmfRecord_AddGeneralEntry(nullptr, typeId, entry, count);
    napi_value result;
    napi_create_int32(env, (addRes1 == UDMF_E_INVALID_PARAM), &result);
    return result;
}
static napi_value OH_UdmfRecord_AddPlainText001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText1 = OH_UdsPlainText_Create();
    char content[] = "";
    OH_UdsPlainText_SetContent(plainText1, content);
    int buildRes = OH_UdmfRecord_AddPlainText(record1, plainText1);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_OK, &returnCode);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsPlainText_Destroy(plainText1);
    return returnCode;
}
static napi_value OH_UdmfRecord_AddPlainText002(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText1 = OH_UdsPlainText_Create();
    int buildRes = OH_UdmfRecord_AddPlainText(record1, plainText1);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_OK, &returnCode);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsPlainText_Destroy(plainText1);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddPlainText003(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    int buildRes = OH_UdmfRecord_AddPlainText(record1, nullptr);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecord_Destroy(record1);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddPlainText004(napi_env env, napi_callback_info info)
{
    int buildRes = OH_UdmfRecord_AddPlainText(nullptr, nullptr);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddPlainText005(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText *plainText1 = OH_UdsPlainText_Create();
    int buildRes = OH_UdmfRecord_AddPlainText(nullptr, plainText1);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdsPlainText_Destroy(plainText1);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetPlainText001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    int getRes = OH_UdmfRecord_GetPlainText(record1, nullptr);
    napi_value returnCode;
    napi_create_double(env, getRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecord_Destroy(record1);
    return returnCode;
}
static napi_value OH_UdmfRecord_GetPlainText002(napi_env env, napi_callback_info info)
{
    int getRes = OH_UdmfRecord_GetPlainText(nullptr, nullptr);
    napi_value returnCode;
    napi_create_double(env, getRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetPlainText003(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText *plainText2 = OH_UdsPlainText_Create();
    int getRes = OH_UdmfRecord_GetPlainText(nullptr, plainText2);
    napi_value returnCode;
    napi_create_double(env, getRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdsPlainText_Destroy(plainText2);
    return returnCode;
}
static napi_value OH_UdmfRecord_AddHyperlink001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHyperlink *hyperlink1 = OH_UdsHyperlink_Create();
    char url[] = "";
    OH_UdsHyperlink_SetUrl(hyperlink1, url);
    int buildRes = OH_UdmfRecord_AddHyperlink(record1, hyperlink1);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_OK, &returnCode);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsHyperlink_Destroy(hyperlink1);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddHyperlink002(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    int buildRes = OH_UdmfRecord_AddHyperlink(record1, nullptr);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecord_Destroy(record1);
    return returnCode;
}
static napi_value OH_UdmfRecord_AddHyperlink003(napi_env env, napi_callback_info info)
{
    int buildRes = OH_UdmfRecord_AddHyperlink(nullptr, nullptr);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddHyperlink004(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink *hyperlink1 = OH_UdsHyperlink_Create();
    char url[] = "";
    OH_UdsHyperlink_SetUrl(hyperlink1, url);
    int buildRes = OH_UdmfRecord_AddHyperlink(nullptr, hyperlink1);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdsHyperlink_Destroy(hyperlink1);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetHyperlink001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHyperlink *hyperlink1 = OH_UdsHyperlink_Create();
    char url[] = "";
    OH_UdsHyperlink_SetUrl(hyperlink1, url);
    OH_UdmfRecord_AddHyperlink(record1, hyperlink1);
    OH_UdsHyperlink *hyperlink2 = OH_UdsHyperlink_Create();
    int getRes = OH_UdmfRecord_GetHyperlink(record1, hyperlink2);
    napi_value returnCode;
    napi_create_double(env, getRes == UDMF_E_OK, &returnCode);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsHyperlink_Destroy(hyperlink1);
    OH_UdsHyperlink_Destroy(hyperlink2);
    return returnCode;
}
static napi_value OH_UdmfRecord_GetHyperlink002(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHyperlink *hyperlink1 = OH_UdsHyperlink_Create();
    char url[] = "";
    OH_UdsHyperlink_SetUrl(hyperlink1, url);
    OH_UdmfRecord_AddHyperlink(record1, hyperlink1);
    int getRes = OH_UdmfRecord_GetHyperlink(record1, nullptr);
    napi_value returnCode;
    napi_create_double(env, getRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsHyperlink_Destroy(hyperlink1);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetHyperlink003(napi_env env, napi_callback_info info)
{
    int getRes = OH_UdmfRecord_GetHyperlink(nullptr, nullptr);
    napi_value returnCode;
    napi_create_double(env, getRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}
static napi_value OH_UdmfRecord_GetHyperlink004(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink *hyperlink2 = OH_UdsHyperlink_Create();
    int getRes = OH_UdmfRecord_GetHyperlink(nullptr, hyperlink2);
    napi_value returnCode;
    napi_create_double(env, getRes == UDMF_E_INVALID_PARAM, &returnCode);
    OH_UdsHyperlink_Destroy(hyperlink2);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddHtml001(napi_env env, napi_callback_info info)
{
    int errCode = 0;
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHtml *html1 = OH_UdsHtml_Create();
    char content[] = "";
    OH_UdsHtml_SetContent(html1, content);
    int buildRes = OH_UdmfRecord_AddHtml(record1, html1);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsHtml_Destroy(html1);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_OK, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddHtml002(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    int buildRes = OH_UdmfRecord_AddHtml(record1, nullptr);
    OH_UdmfRecord_Destroy(record1);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddHtml003(napi_env env, napi_callback_info info)
{
    int buildRes = OH_UdmfRecord_AddHtml(nullptr, nullptr);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddHtml004(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHtml *html1 = OH_UdsHtml_Create();
    char content[] = "hello world";
    OH_UdsHtml_SetContent(html1, content);
    int buildRes = OH_UdmfRecord_AddHtml(nullptr, html1);
    OH_UdsHtml_Destroy(html1);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetHtml001(napi_env env, napi_callback_info info)
{
    int errCode = 0;
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHtml *html1 = OH_UdsHtml_Create();
    char content[] = "hello world";
    OH_UdsHtml_SetContent(html1, content);
    OH_UdmfRecord_AddHtml(record1, html1);
    int getRes = OH_UdmfRecord_GetHtml(record1, nullptr);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsHtml_Destroy(html1);
    napi_value returnCode;
    napi_create_double(env, getRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_GetHtml002(napi_env env, napi_callback_info info)
{
    int getRes = OH_UdmfRecord_GetHtml(nullptr, nullptr);
    napi_value returnCode;
    napi_create_double(env, getRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}
static napi_value OH_UdmfRecord_GetHtml003(napi_env env, napi_callback_info info)
{
    OH_UdsHtml *html2 = OH_UdsHtml_Create();
    int getRes = OH_UdmfRecord_GetHtml(nullptr, html2);
    OH_UdsHtml_Destroy(html2);
    napi_value returnCode;
    napi_create_double(env, getRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddAppItem001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsAppItem *appItem1 = OH_UdsAppItem_Create();
    char name[] = "";
    OH_UdsAppItem_SetName(appItem1, name);
    int buildRes = OH_UdmfRecord_AddAppItem(record1, appItem1);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsAppItem_Destroy(appItem1);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_OK, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddAppItem002(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    int buildRes = OH_UdmfRecord_AddAppItem(record1, nullptr);
    OH_UdmfRecord_Destroy(record1);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddAppItem003(napi_env env, napi_callback_info info)
{
    int buildRes = OH_UdmfRecord_AddAppItem(nullptr, nullptr);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfRecord_AddAppItem004(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem *appItem1 = OH_UdsAppItem_Create();
    char name[] = "appItem";
    OH_UdsAppItem_SetName(appItem1, name);
    int buildRes = OH_UdmfRecord_AddAppItem(nullptr, appItem1);
    OH_UdsAppItem_Destroy(appItem1);
    napi_value returnCode;
    napi_create_double(env, buildRes == UDMF_E_INVALID_PARAM, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfProperty_Create001(napi_env env, napi_callback_info info)
{
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, properties == nullptr, &result);
    return result;
}

static napi_value OH_Udmf_SetPropertiesTag001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    int ret = OH_UdmfProperty_SetTag(properties, "");
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}
static napi_value OH_Udmf_SetPropertiesTag002(napi_env env, napi_callback_info info)
{
    int ret = OH_UdmfProperty_SetTag(nullptr, "");
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_Udmf_SetPropertiesTag003(napi_env env, napi_callback_info info)
{
    int ret = OH_UdmfProperty_SetTag(nullptr, "tag");
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_Udmf_SetPropertiesTag004(napi_env env, napi_callback_info info)
{
    int ret = OH_UdmfProperty_SetTag(nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_Udmf_GetPropertiesTag001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    OH_UdmfProperty_SetTag(properties, "");
    const char* pf = OH_UdmfProperty_GetTag(properties);
    int64_t resTime = OH_UdmfProperty_GetTimestamp (properties);
    napi_value result = nullptr;
    napi_create_int32(env, (strcmp(pf, "") == PARAM_0) && (resTime !=0), &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}
static napi_value OH_Udmf_GetPropertiesTag002(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    const char* pf = OH_UdmfProperty_GetTag(properties);
    int64_t resTime = OH_UdmfProperty_GetTimestamp(properties);
    napi_value result = nullptr;
    napi_create_int32(env, (strcmp(pf, "") == PARAM_0) && (resTime !=0), &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_UdmfProperty_GetTimestamp001(napi_env env, napi_callback_info info)
{
    int64_t resTime = OH_UdmfProperty_GetTimestamp(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, (resTime !=0), &result);
    return result;
}

static napi_value OH_Udmf_SetPropertiesShareOption001(napi_env env, napi_callback_info info)
{
    int ret = OH_UdmfProperty_SetShareOption(nullptr, Udmf_ShareOption::SHARE_OPTIONS_IN_APP);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_Udmf_SetPropertiesShareOption002(napi_env env, napi_callback_info info)
{
    int ret = OH_UdmfProperty_SetShareOption(nullptr, Udmf_ShareOption::SHARE_OPTIONS_CROSS_APP);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_Udmf_SetPropertiesShareOption003(napi_env env, napi_callback_info info)
{
    int ret = OH_UdmfProperty_GetShareOption(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret == Udmf_ShareOption::SHARE_OPTIONS_INVALID, &result);
    return result;
}
static napi_value OH_Udmf_SetPropertiesExtrasIntParam001(napi_env env, napi_callback_info info)
{
    int ret = OH_UdmfProperty_SetExtrasIntParam(nullptr, "keyInt", 0);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_Udmf_GetPropertiesExtrasIntParam002(napi_env env, napi_callback_info info)
{
    int ret = OH_UdmfProperty_GetExtrasIntParam(nullptr, "keyInt", 0);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 0, &result);
    return result;
}

static napi_value OH_Udmf_SetPropertiesExtrasStringParam001(napi_env env, napi_callback_info info)
{
    int ret = OH_UdmfProperty_SetExtrasStringParam(nullptr, "keyStr", "str");
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_Udmf_GetPropertiesExtrasStringParam001(napi_env env, napi_callback_info info)
{
    const char* pf = OH_UdmfProperty_GetExtrasStringParam(nullptr, "keyStr");
    napi_value result = nullptr;
    napi_create_int32(env, pf == nullptr, &result);
    return result;
}

static napi_value Init1(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_UdmfRecord_AddHtml001", nullptr, OH_UdmfRecord_AddHtml001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddHtml002", nullptr, OH_UdmfRecord_AddHtml002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddHtml003", nullptr, OH_UdmfRecord_AddHtml003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddHtml004", nullptr, OH_UdmfRecord_AddHtml004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetHtml001", nullptr, OH_UdmfRecord_GetHtml001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetHtml002", nullptr, OH_UdmfRecord_GetHtml002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetHtml003", nullptr, OH_UdmfRecord_GetHtml003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddAppItem001", nullptr, OH_UdmfRecord_AddAppItem001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddAppItem002", nullptr, OH_UdmfRecord_AddAppItem002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddAppItem003", nullptr, OH_UdmfRecord_AddAppItem003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddAppItem004", nullptr, OH_UdmfRecord_AddAppItem004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfProperty_Create001", nullptr, OH_UdmfProperty_Create001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesTag001", nullptr, OH_Udmf_SetPropertiesTag001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesTag002", nullptr, OH_Udmf_SetPropertiesTag002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesTag003", nullptr, OH_Udmf_SetPropertiesTag003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesTag004", nullptr, OH_Udmf_SetPropertiesTag004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetPropertiesTag001", nullptr, OH_Udmf_GetPropertiesTag001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetPropertiesTag002", nullptr, OH_Udmf_GetPropertiesTag002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfProperty_GetTimestamp001", nullptr, OH_UdmfProperty_GetTimestamp001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesShareOption001", nullptr, OH_Udmf_SetPropertiesShareOption001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesShareOption002", nullptr, OH_Udmf_SetPropertiesShareOption002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesShareOption003", nullptr, OH_Udmf_SetPropertiesShareOption003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
static napi_value Init2(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Udmf_AddAndGetGeneralEntry001", nullptr, OH_Udmf_AddAndGetGeneralEntry001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndGetGeneralEntry002", nullptr, OH_Udmf_AddAndGetGeneralEntry002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndGetGeneralEntry003", nullptr, OH_Udmf_AddAndGetGeneralEntry003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndGetGeneralEntry004", nullptr, OH_Udmf_AddAndGetGeneralEntry004,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddPlainText001", nullptr, OH_UdmfRecord_AddPlainText001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddPlainText002", nullptr, OH_UdmfRecord_AddPlainText002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddPlainText003", nullptr, OH_UdmfRecord_AddPlainText003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddPlainText004", nullptr, OH_UdmfRecord_AddPlainText004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddPlainText005", nullptr, OH_UdmfRecord_AddPlainText005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetPlainText001", nullptr, OH_UdmfRecord_GetPlainText001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetPlainText002", nullptr, OH_UdmfRecord_GetPlainText002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetPlainText003", nullptr, OH_UdmfRecord_GetPlainText003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddHyperlink001", nullptr, OH_UdmfRecord_AddHyperlink001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddHyperlink002", nullptr, OH_UdmfRecord_AddHyperlink002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddHyperlink003", nullptr, OH_UdmfRecord_AddHyperlink003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_AddHyperlink004", nullptr, OH_UdmfRecord_AddHyperlink004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetHyperlink001", nullptr, OH_UdmfRecord_GetHyperlink001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetHyperlink002", nullptr, OH_UdmfRecord_GetHyperlink002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetHyperlink003", nullptr, OH_UdmfRecord_GetHyperlink003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetHyperlink004", nullptr, OH_UdmfRecord_GetHyperlink004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
static napi_value Init3(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Udmf_SetPropertiesExtrasIntParam001", nullptr, OH_Udmf_SetPropertiesExtrasIntParam001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetPropertiesExtrasIntParam002", nullptr, OH_Udmf_GetPropertiesExtrasIntParam002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesExtrasStringParam001", nullptr, OH_Udmf_SetPropertiesExtrasStringParam001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetPropertiesExtrasStringParam001", nullptr, OH_Udmf_GetPropertiesExtrasStringParam001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Udmf_AddRecord001", nullptr, OH_Udmf_AddRecord001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddRecord002", nullptr, OH_Udmf_AddRecord002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddRecord003", nullptr, OH_Udmf_AddRecord003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_HasType001", nullptr, OH_UdmfData_HasType001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_HasType002", nullptr, OH_UdmfData_HasType002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_HasType003", nullptr, OH_UdmfData_HasType003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_HasType004", nullptr, OH_UdmfData_HasType004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_HasType005", nullptr, OH_UdmfData_HasType005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetTypes001", nullptr, OH_UdmfData_GetTypes001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetTypes002", nullptr, OH_UdmfData_GetTypes002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetTypes003", nullptr, OH_UdmfData_GetTypes003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetTypes001", nullptr, OH_UdmfRecord_GetTypes001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetTypes002", nullptr, OH_UdmfRecord_GetTypes002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfRecord_GetTypes003", nullptr, OH_UdmfRecord_GetTypes003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedData001", nullptr, OH_Udmf_SetUnifiedData001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecords001", nullptr, OH_UdmfData_GetRecords001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_GetRecords002", nullptr, OH_UdmfData_GetRecords002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedData002", nullptr, OH_Udmf_GetUnifiedData002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedData003", nullptr, OH_Udmf_GetUnifiedData003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    Init1(env, exports);
    Init2(env, exports);
    Init3(env, exports);
    return exports;
}

    EXTERN_C_END

    static napi_module demoModule = {
        .nm_version = 1,
        .nm_flags = 0,
        .nm_filename = nullptr,
        .nm_register_func = Init,
        .nm_modname = "UdmfNdkex",
        .nm_priv = ((void *)0),
        .reserved = {0},
    };

    extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }

