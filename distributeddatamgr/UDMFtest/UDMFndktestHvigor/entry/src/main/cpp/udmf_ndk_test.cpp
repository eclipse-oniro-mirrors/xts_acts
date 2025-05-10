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

static napi_value OH_Udmf_CreateUnifiedData001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    napi_value result;
    napi_create_int32(env, unifiedData != nullptr, &result);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}
static napi_value OH_Udmf_AddRecordToUnifiedData001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    int status = OH_UdmfData_AddRecord(unifiedData, record);
    napi_value result;
    napi_create_int32(env, status == UDMF_E_OK, &result);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}

static napi_value OH_Udmf_HasUnifiedDataType001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(unifiedData, record);

    char type1[] = "general.plain-text";
    int hasType1 = OH_UdmfData_HasType(unifiedData, type1);

    char type2[] = "general.html";
    int hasType2 = OH_UdmfData_HasType(unifiedData, type2);

    napi_value result;
    napi_create_int32(env, (unifiedData !=nullptr) && (hasType1 == 1) &&  (hasType2 == 0), &result);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}
static napi_value OH_Udmf_GetUnifiedDataTypes001(napi_env env, napi_callback_info info)
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
    int num = 2;
    unsigned int count1 = 0;
    char **types1 = OH_UdmfData_GetTypes(unifiedData, &count1);
    NAPI_ASSERT(env, types1 != nullptr, "OH_UdmfData_GetTypes is fail.");
    NAPI_ASSERT(env, count1 == num, "OH_UdmfData_GetTypes is fail.");

    char **types2 = OH_UdmfData_GetTypes(unifiedData, &count1);
    NAPI_ASSERT(env, types1 == types2, "OH_UdmfData_GetTypes is fail.");
    napi_value result;
    napi_create_int32(env, 1, &result);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdsHyperlink_Destroy(hyperlink);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}
static napi_value OH_Udmf_GetUnifiedRecordTypes001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plaintext = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plaintext);
    unsigned int count = 0;
    char **types1 = OH_UdmfRecord_GetTypes(record, &count);

    unsigned int count1 = 0;
    char **types2 = OH_UdmfRecord_GetTypes(record, &count1);

    napi_value result;
    napi_create_int32(env, (types1 != nullptr) && (count == 1) && (types1 == types2)
         && (types2 != nullptr) && (count1 == 1), &result);
    OH_UdmfRecord_Destroy(record);
    OH_UdsPlainText_Destroy(plaintext);
    return result;
}
static napi_value OH_Udmf_GetRecords001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plaintext = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plaintext);
    unsigned int count = 0;
    char **types1 = OH_UdmfRecord_GetTypes(record, &count);

    unsigned int count1 = 0;
    char **types2 = OH_UdmfRecord_GetTypes(record, &count1);

    napi_value result;
    napi_create_int32(env, (types1 != nullptr) && (count == 1) && (types1 == types2)
         && (types2 != nullptr) && (count1 == 1), &result);
    OH_UdmfRecord_Destroy(record);
    OH_UdsPlainText_Destroy(plaintext);
    return result;
}
static napi_value OH_Udmf_SetAndGetUnifiedData001(napi_env env, napi_callback_info info)
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

    int setRes = OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedData is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedData is fail.");

    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    int getRes = OH_Udmf_GetUnifiedData(key, intention, readUnifiedData);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_Udmf_GetUnifiedData is fail.");

    unsigned int count = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(readUnifiedData, &count);
    NAPI_ASSERT(env, count == 1, "OH_UdmfData_GetRecords is fail.");
    
    OH_UdsPlainText *getPlainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_GetPlainText(getRecords[0], getPlainText);
    const char *getContent = OH_UdsPlainText_GetContent(getPlainText);
    NAPI_ASSERT(env, strcmp(getContent, content) == 0, "OH_UdmfData_GetRecords is fail.");

    napi_value result;
    napi_create_int32(env, 1, &result);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);

    OH_UdsPlainText_Destroy(getPlainText);
    OH_UdmfData_Destroy(readUnifiedData);
    return result;
}
static napi_value OH_Udmf_SetAndGetUnifiedData002(napi_env env, napi_callback_info info)
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

    int setRes = OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedData is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedData is fail.");

    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    int getRes = OH_Udmf_GetUnifiedData(key, intention, readUnifiedData);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_Udmf_GetUnifiedData is fail.");

    unsigned int count = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(readUnifiedData, &count);
    NAPI_ASSERT(env, count == 1, "OH_UdmfData_GetRecords is fail.");

    OH_UdsPlainText *getPlainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_GetPlainText(getRecords[0], getPlainText);
    const char *getContent = OH_UdsPlainText_GetContent(getPlainText);
    NAPI_ASSERT(env, strcmp(getContent, content) == 0, "OH_UdsPlainText_GetContent is fail.");

    napi_value result;
    napi_create_int32(env, 1, &result);

    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);

    OH_UdsPlainText_Destroy(getPlainText);
    OH_UdmfData_Destroy(readUnifiedData);
    return result;
}
static napi_value OH_Udmf_GetRecords002(napi_env env, napi_callback_info info)
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

    unsigned int count = 0;
    OH_UdmfRecord **records1 = OH_UdmfData_GetRecords(unifiedData, &count);

    OH_UdmfRecord **records2 = OH_UdmfData_GetRecords(unifiedData, &count);
    int num = 2;
    napi_value result;
    napi_create_int32(env, (count == num) &&(records1 != nullptr) && (count == num)
         && (records2 != nullptr) && (records2 == records1), &result);

    OH_UdsPlainText_Destroy(plainText);
    OH_UdsHyperlink_Destroy(hyperlink);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(record1);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}
static napi_value OH_Udmf_AddAndGetGeneralEntry001(napi_env env, napi_callback_info info)
{
    char typeId[] = "general.plain-text";
    unsigned char entry[] = "CreateGeneralRecord";
    unsigned int count = sizeof(entry);
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    int addRes1 = OH_UdmfRecord_AddGeneralEntry(record, typeId, entry, count);

    unsigned int getCount = 0;
    unsigned char *getEntry;
    int getRes = OH_UdmfRecord_GetGeneralEntry(record, typeId, &getEntry, &getCount);

    unsigned int getCount1 = 0;
    unsigned char *getEntry1;
    int getRes1 = OH_UdmfRecord_GetGeneralEntry(record, typeId, &getEntry1, &getCount1);

    napi_value result;
    napi_create_int32(env, (addRes1 == UDMF_E_OK) &&(getRes == UDMF_E_OK) && (getCount == count)
         && (std::memcmp(getEntry, entry, getCount) == 0) && (getEntry1 == getEntry)
         && (getRes1 == UDMF_E_OK), &result);

    OH_UdmfRecord_Destroy(record);

    return result;
}

// 2. BuildAndGet NAPI_ASSERT =======================================================
static napi_value OH_Udmf_BuildAndGetPlainTextFromRecord001(napi_env env, napi_callback_info info)
{
    int errCode = 0;
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText1 = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText1, content);
    int buildRes = OH_UdmfRecord_AddPlainText(record1, plainText1);
    NAPI_ASSERT(env, buildRes == UDMF_E_OK, "OH_UdmfRecord_AddPlainText is fail.");

    OH_UdsPlainText *plainText2 = OH_UdsPlainText_Create();
    int getRes = OH_UdmfRecord_GetPlainText(record1, plainText2);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_UdmfRecord_GetPlainText is fail.");

    const char *getContent = OH_UdsPlainText_GetContent(plainText2);
    NAPI_ASSERT(env, strcmp(content, getContent) == 0, "OH_UdsPlainText_GetContent is fail.");

    OH_UdmfRecord_Destroy(record1);
    OH_UdsPlainText_Destroy(plainText1);
    OH_UdsPlainText_Destroy(plainText2);

    errCode = buildRes;
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value OH_Udmf_BuildAndGetHyperlinkFromRecord001(napi_env env, napi_callback_info info)
{
    int errCode = 0;
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHyperlink *hyperlink1 = OH_UdsHyperlink_Create();
    char url[] = "https://gitee.com/openharmony/distributeddatamgr_udmf/members";
    OH_UdsHyperlink_SetUrl(hyperlink1, url);
    int buildRes = OH_UdmfRecord_AddHyperlink(record1, hyperlink1);
    NAPI_ASSERT(env, buildRes == UDMF_E_OK, "OH_UdmfRecord_AddHyperlink is fail.");

    OH_UdsHyperlink *hyperlink2 = OH_UdsHyperlink_Create();
    int getRes = OH_UdmfRecord_GetHyperlink(record1, hyperlink2);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_UdmfRecord_GetHyperlink is fail.");

    const char *getUrl = OH_UdsHyperlink_GetUrl(hyperlink2);
    NAPI_ASSERT(env, strcmp(url, getUrl) == 0, "OH_UdsHyperlink_GetUrl is fail.");

    OH_UdmfRecord_Destroy(record1);
    OH_UdsHyperlink_Destroy(hyperlink1);
    OH_UdsHyperlink_Destroy(hyperlink2);

    errCode = buildRes;
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


static napi_value OH_Udmf_BuildAndGetHtmlFromRecord001(napi_env env, napi_callback_info info)
{
    int errCode = 0;
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHtml *html1 = OH_UdsHtml_Create();
    char content[] = "hello world";
    OH_UdsHtml_SetContent(html1, content);
    int buildRes = OH_UdmfRecord_AddHtml(record1, html1);
    NAPI_ASSERT(env, buildRes == UDMF_E_OK, "OH_UdmfRecord_AddHtml is fail.");

    OH_UdsHtml *html2 = OH_UdsHtml_Create();
    int getRes = OH_UdmfRecord_GetHtml(record1, html2);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_UdmfRecord_GetHtml is fail.");

    const char *getContent = OH_UdsHtml_GetContent(html2);
    NAPI_ASSERT(env, strcmp(content, getContent) == 0, "OH_UdsHtml_GetContent is fail.");

    OH_UdmfRecord_Destroy(record1);
    OH_UdsHtml_Destroy(html1);
    OH_UdsHtml_Destroy(html2);

    errCode = buildRes;
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value OH_Udmf_BuildAndGetAppItemFromRecord001(napi_env env, napi_callback_info info)
{
    int errCode = 0;
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsAppItem *appItem1 = OH_UdsAppItem_Create();
    char name[] = "appItem";
    OH_UdsAppItem_SetName(appItem1, name);
    int buildRes = OH_UdmfRecord_AddAppItem(record1, appItem1);
    NAPI_ASSERT(env, buildRes == UDMF_E_OK, "OH_UdmfRecord_AddAppItem is fail.");

    OH_UdsAppItem *appItem2 = OH_UdsAppItem_Create();
    int getRes = OH_UdmfRecord_GetAppItem(record1, appItem2);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_UdmfRecord_GetAppItem is fail.");

    const char *getName = OH_UdsAppItem_GetName(appItem2);
    NAPI_ASSERT(env, strcmp(name, getName) == 0, "OH_UdsAppItem_GetName is fail.");

    OH_UdmfRecord_Destroy(record1);
    OH_UdsAppItem_Destroy(appItem1);
    OH_UdsAppItem_Destroy(appItem2);

    errCode = buildRes;
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

// 3. OH_UdmfProperty  napi_create_int32 =======================================================
static napi_value OH_Udmf_CreatePropertiesFromUnifiedData001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);

    napi_value result = nullptr;
    napi_create_int32(env, properties != nullptr, &result);

    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_SetPropertiesTag001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    int ret = OH_UdmfProperty_SetTag(properties, "tag");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_GetPropertiesTag001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    OH_UdmfProperty_SetTag(properties, "tag");
    const char* pf = OH_UdmfProperty_GetTag(properties);

    int64_t resTime = OH_UdmfProperty_GetTimestamp (properties);

    napi_value result = nullptr;
    napi_create_int32(env, (strcmp(pf, "tag") == PARAM_0) && (resTime !=0), &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_SetPropertiesShareOption001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    int ret = OH_UdmfProperty_SetShareOption(properties, Udmf_ShareOption::SHARE_OPTIONS_IN_APP);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_GetPropertiesShareOption001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    OH_UdmfProperty_SetShareOption(properties, Udmf_ShareOption::SHARE_OPTIONS_IN_APP);
    int ret = OH_UdmfProperty_GetShareOption(properties);

    napi_value result = nullptr;
    napi_create_int32(env, ret == Udmf_ShareOption::SHARE_OPTIONS_IN_APP, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_SetPropertiesShareOption002(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    int ret = OH_UdmfProperty_SetShareOption(properties, Udmf_ShareOption::SHARE_OPTIONS_CROSS_APP);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_GetPropertiesShareOption002(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    OH_UdmfProperty_SetShareOption(properties, Udmf_ShareOption::SHARE_OPTIONS_CROSS_APP);
    int ret = OH_UdmfProperty_GetShareOption(properties);

    napi_value result = nullptr;
    napi_create_int32(env, ret == Udmf_ShareOption::SHARE_OPTIONS_CROSS_APP, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_SetPropertiesShareOption003(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    int ret = OH_UdmfProperty_SetShareOption(properties, Udmf_ShareOption::SHARE_OPTIONS_INVALID);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_SetPropertiesExtrasIntParam001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    int ret = OH_UdmfProperty_SetExtrasIntParam(properties, "keyInt", 0);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_GetPropertiesExtrasIntParam001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    OH_UdmfProperty_SetExtrasIntParam(properties, "keyInt", 0);
    int ret = OH_UdmfProperty_GetExtrasIntParam(properties, "keyInt", -1);

    napi_value result = nullptr;
    napi_create_int32(env, ret == 0, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_SetPropertiesExtrasStringParam001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    int ret = OH_UdmfProperty_SetExtrasStringParam(properties, "keyStr", "str");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_GetPropertiesExtrasStringParam001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    OH_UdmfProperty_SetExtrasStringParam(properties, "keyStr", "str");
    const char* pf = OH_UdmfProperty_GetExtrasStringParam(properties, "keyStr");

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pf, "str") == PARAM_0, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Udmf_CreatePropertiesFromUnifiedData001", nullptr, OH_Udmf_CreatePropertiesFromUnifiedData001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesTag001", nullptr, OH_Udmf_SetPropertiesTag001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Udmf_AddRecordToUnifiedData001", nullptr, OH_Udmf_AddRecordToUnifiedData001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_CreateUnifiedData001", nullptr, OH_Udmf_CreateUnifiedData001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Udmf_HasUnifiedDataType001", nullptr, OH_Udmf_HasUnifiedDataType001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedDataTypes001", nullptr, OH_Udmf_GetUnifiedDataTypes001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedRecordTypes001", nullptr, OH_Udmf_GetUnifiedRecordTypes001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Udmf_GetRecords001", nullptr, OH_Udmf_GetRecords001, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Udmf_SetAndGetUnifiedData001", nullptr, OH_Udmf_SetAndGetUnifiedData001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Udmf_GetRecords002", nullptr, OH_Udmf_GetRecords002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndGetGeneralEntry001", nullptr, OH_Udmf_AddAndGetGeneralEntry001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Udmf_SetAndGetUnifiedData002", nullptr, OH_Udmf_SetAndGetUnifiedData002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Udmf_BuildAndGetPlainTextFromRecord001", nullptr, OH_Udmf_BuildAndGetPlainTextFromRecord001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_BuildAndGetHyperlinkFromRecord001", nullptr, OH_Udmf_BuildAndGetHyperlinkFromRecord001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_BuildAndGetHtmlFromRecord001", nullptr, OH_Udmf_BuildAndGetHtmlFromRecord001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Udmf_BuildAndGetAppItemFromRecord001", nullptr, OH_Udmf_BuildAndGetAppItemFromRecord001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetPropertiesTag001", nullptr, OH_Udmf_GetPropertiesTag001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Udmf_SetPropertiesShareOption001", nullptr, OH_Udmf_SetPropertiesShareOption001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Udmf_GetPropertiesShareOption001", nullptr, OH_Udmf_GetPropertiesShareOption001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Udmf_SetPropertiesShareOption002", nullptr, OH_Udmf_SetPropertiesShareOption002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Udmf_GetPropertiesShareOption002", nullptr, OH_Udmf_GetPropertiesShareOption002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Udmf_SetPropertiesShareOption003", nullptr, OH_Udmf_SetPropertiesShareOption003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Udmf_SetPropertiesExtrasIntParam001", nullptr, OH_Udmf_SetPropertiesExtrasIntParam001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Udmf_GetPropertiesExtrasIntParam001", nullptr, OH_Udmf_GetPropertiesExtrasIntParam001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesExtrasStringParam001", nullptr, OH_Udmf_SetPropertiesExtrasStringParam001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetPropertiesExtrasStringParam001", nullptr, OH_Udmf_GetPropertiesExtrasStringParam001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
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
        .nm_modname = "UdmfNdk",
        .nm_priv = ((void *)0),
        .reserved = {0},
    };

    extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
