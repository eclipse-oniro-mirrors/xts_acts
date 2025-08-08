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
static napi_value OH_Udmf_SetAndGetUnifiedData003(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_PICKER;
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

static napi_value OH_Udmf_SetAndGetUnifiedData004(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_DATA_HUB;
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_INVALID_PARAM, "OH_Udmf_SetUnifiedData is fail.");
   
    napi_value result;
    napi_create_int32(env, setRes == UDMF_E_INVALID_PARAM, &result);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return result;
}

static napi_value OH_Udmf_SetAndGetUnifiedData005(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_SYSTEM_SHARE;
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

static napi_value OH_Udmf_SetAndGetUnifiedData006(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_MENU;
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

static napi_value OH_UdmfOptions_Create_001(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    NAPI_ASSERT(env, options != nullptr, "OH_UdmfOptions_Create is fail.");
    const char* testKey = "testKey";
    int result = OH_UdmfOptions_SetKey(options, testKey);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdmfOptions_SetKey is fail.");
    const char* getKey = OH_UdmfOptions_GetKey(options);
    NAPI_ASSERT(env, strcmp(getKey, testKey) == 0, "OH_UdmfOptions_GetKey is fail.");
    Udmf_Intention testIntention = UDMF_INTENTION_DRAG;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    Udmf_Intention getIntention = OH_UdmfOptions_GetIntention(options);
    NAPI_ASSERT(env, getIntention == testIntention, "OH_UdmfOptions_GetIntention is fail.");
    int resetResult = OH_UdmfOptions_Reset(options);
    NAPI_ASSERT(env, resetResult == UDMF_E_OK, "OH_UdmfOptions_Reset is fail.");
    const char* getKey1 = OH_UdmfOptions_GetKey(options);
    NAPI_ASSERT(env, strcmp(getKey1, "") == 0, "OH_UdmfOptions_GetKey2 is fail.");
    Udmf_Intention getIntention1 = OH_UdmfOptions_GetIntention(options);
    Udmf_Intention getIntention2 =  {};
    NAPI_ASSERT(env, getIntention1 == getIntention2, "OH_UdmfOptions_GetIntention2 is fail.");

    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    return res;
}

static napi_value OH_UdmfOptions_Create_002(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    NAPI_ASSERT(env, options != nullptr, "OH_UdmfOptions_Create is fail.");
    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    NAPI_ASSERT(env, options1 != nullptr, "OH_UdmfOptions_Create is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);
    return res;
}

static napi_value OH_UdmfOptions_Create_003(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    NAPI_ASSERT(env, options != nullptr, "OH_UdmfOptions_Create is fail.");

    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    return res;
}

static napi_value OH_UdmfOptions_Destroy001(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = nullptr;
    OH_UdmfOptions_Destroy(options);
    NAPI_ASSERT(env, options == nullptr, "OH_UdmfOptions_Create is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_GetKey_001(napi_env env, napi_callback_info info)
{
    const char* getKey = OH_UdmfOptions_GetKey(nullptr);
    NAPI_ASSERT(env, getKey == nullptr, "OH_UdmfOptions_GetKey is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_GetKey_002(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    const char* getKey = OH_UdmfOptions_GetKey(options);
    NAPI_ASSERT(env, strcmp(getKey, "") == 0, "OH_UdmfOptions_GetKey is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}
static napi_value OH_UdmfOptions_GetKey_003(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    const char* testKey = "testKey";
    int result = OH_UdmfOptions_SetKey(options, testKey);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdmfOptions_SetKey is fail.");
    const char* getKey = OH_UdmfOptions_GetKey(options);
    NAPI_ASSERT(env, strcmp(getKey, "testKey") == 0, "OH_UdmfOptions_GetKey is fail.");
    OH_UdmfOptions_Destroy(options);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetKey_001(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    const char* testKey = "";
    int result = OH_UdmfOptions_SetKey(options, testKey);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdmfOptions_SetKey is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    return res;
}

static napi_value OH_UdmfOptions_SetKey_002(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    const char* testKey = nullptr;
    int result = OH_UdmfOptions_SetKey(options, testKey);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdmfOptions_SetKey is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    return res;
}

static napi_value OH_UdmfOptions_SetKey_003(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = nullptr;
    const char* testKey = "testKey";
    int result = OH_UdmfOptions_SetKey(options, testKey);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdmfOptions_SetKey is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetKey_004(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    const char* testKey = "testKey";
    int result1 = OH_UdmfOptions_SetKey(options, testKey);
    NAPI_ASSERT(env, result1 == UDMF_E_OK, "OH_UdmfOptions_SetKey is fail.");
    int result = OH_UdmfOptions_SetKey(options, testKey);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdmfOptions_SetKey is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    return res;
}

static napi_value OH_UdmfOptions_SetKey_005(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    const char* testKey = "testKey";
    const char* testKey1 = "testKey_123456";
    int result = OH_UdmfOptions_SetKey(options, testKey);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdmfOptions_SetKey is fail.");
    int result1 = OH_UdmfOptions_SetKey(options, testKey1);
    NAPI_ASSERT(env, result1 == UDMF_E_OK, "OH_UdmfOptions_SetKey is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_GetIntention_001(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = nullptr;
    Udmf_Intention getIntention = OH_UdmfOptions_GetIntention(options);
    Udmf_Intention getIntention2 =  {};
    NAPI_ASSERT(env, getIntention == getIntention2, "OH_UdmfOptions_GetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_GetIntention_002(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention getIntention = OH_UdmfOptions_GetIntention(options);
    Udmf_Intention getIntention2 =  {};
    NAPI_ASSERT(env, getIntention == getIntention2, "OH_UdmfOptions_GetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetIntention_001(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DRAG;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);

    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetIntention_002(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_SYSTEM_SHARE;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetIntention_003(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_PICKER;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetIntention_004(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_MENU;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetIntention_005(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_PASTEBOARD;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetIntention_006(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetIntention_007(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = {};
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetIntention_008(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = nullptr;
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_INVALID_PARAM, "OH_UdmfOptions_SetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetIntention_009(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DRAG;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    int setResult1 = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult1 == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetIntention_010(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DRAG;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    Udmf_Intention testIntention1 = UDMF_INTENTION_DATA_HUB;
    int setResult1 = OH_UdmfOptions_SetIntention(options, testIntention1);
    NAPI_ASSERT(env, setResult1 == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_SetIntention_011(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    const char* testKey = "testKey";
    int result = OH_UdmfOptions_SetKey(options, testKey);
    const char* testKey1 = "testKey1";
    int result1 = OH_UdmfOptions_SetKey(options1, testKey1);
    NAPI_ASSERT(env, result1 == UDMF_E_OK, "OH_UdmfOptions_SetKey is fail.");
    Udmf_Intention testIntention = UDMF_INTENTION_DRAG;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    int setResult1 = OH_UdmfOptions_SetIntention(options1, testIntention);
    NAPI_ASSERT(env, setResult1 == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_Reset_001(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = nullptr;
    int resetResult = OH_UdmfOptions_Reset(options);
    NAPI_ASSERT(env, resetResult == UDMF_E_INVALID_PARAM, "OH_UdmfOptions_Reset is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfOptions_Reset_002(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    NAPI_ASSERT(env, options != nullptr, "OH_UdmfOptions_Create is fail.");
    const char* testKey = "testKey";
    int result = OH_UdmfOptions_SetKey(options, testKey);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdmfOptions_SetKey is fail.");
    const char* getKey = OH_UdmfOptions_GetKey(options);
    NAPI_ASSERT(env, strcmp(getKey, testKey) == 0, "OH_UdmfOptions_GetKey is fail.");
    Udmf_Intention testIntention = UDMF_INTENTION_DRAG;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    NAPI_ASSERT(env, setResult == UDMF_E_OK, "OH_UdmfOptions_SetIntention is fail.");
    Udmf_Intention getIntention = OH_UdmfOptions_GetIntention(options);
    NAPI_ASSERT(env, getIntention == testIntention, "OH_UdmfOptions_GetIntention is fail.");
    int resetResult = OH_UdmfOptions_Reset(options);
    NAPI_ASSERT(env, resetResult == UDMF_E_OK, "OH_UdmfOptions_Reset is fail.");
    int resetResult1 = OH_UdmfOptions_Reset(options);
    NAPI_ASSERT(env, resetResult1 == UDMF_E_OK, "OH_UdmfOptions_Reset is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_GetUnifiedDataByOptions_001(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_PICKER;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options1, testIntention);
    OH_UdmfOptions_SetKey(options1, key);
    unsigned dataSize1 = 0;
    OH_UdmfData* dataArray1 = nullptr;
    int getRes = OH_Udmf_GetUnifiedDataByOptions(options1, &dataArray1, &dataSize1);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_UdmfOptions_Reset is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options1, &dataArray2, &dataSize2);
    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_Udmf_DestroyDataArray(&dataArray1, dataSize1);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return res;
}
static napi_value OH_Udmf_GetUnifiedDataByOptions_002(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_PICKER;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    OH_UdmfOptions* options1 = nullptr;
    unsigned dataSize1 = 0;
    OH_UdmfData* dataArray1 = nullptr;
    int getRes = OH_Udmf_GetUnifiedDataByOptions(options1, &dataArray1, &dataSize1);
    NAPI_ASSERT(env, getRes == UDMF_E_INVALID_PARAM, "OH_UdmfOptions_Reset is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);
    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_Udmf_DestroyDataArray(&dataArray1, dataSize1);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return res;
}

static napi_value OH_Udmf_GetUnifiedDataByOptions_003(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_PICKER;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options1, testIntention);
    OH_UdmfOptions_SetKey(options1, key);
    OH_UdmfData* dataArray1 = nullptr;
    int getRes = OH_Udmf_GetUnifiedDataByOptions(options1, &dataArray1, nullptr);
    NAPI_ASSERT(env, getRes == UDMF_E_INVALID_PARAM, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);
    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return res;
}

static napi_value OH_Udmf_GetUnifiedDataByOptions_004(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_MENU;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);

    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options1, testIntention);
    OH_UdmfOptions_SetKey(options1, key);

    unsigned dataSize1 = 0;
    OH_UdmfData* dataArray1 = nullptr;
    int getRes = OH_Udmf_GetUnifiedDataByOptions(options1, &dataArray1, &dataSize1);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);

    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_Udmf_DestroyDataArray(&dataArray1, dataSize1);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);

    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return res;
}

static napi_value OH_Udmf_GetUnifiedDataByOptions_005(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_MENU;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);

    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options1, testIntention);
    OH_UdmfOptions_SetKey(options1, key);

    unsigned dataSize1 = 10000;
    OH_UdmfData* dataArray1 = nullptr;
    int getRes = OH_Udmf_GetUnifiedDataByOptions(options1, &dataArray1, &dataSize1);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);

    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_Udmf_DestroyDataArray(&dataArray1, dataSize1);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);

    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return res;
}

static napi_value OH_Udmf_GetUnifiedDataByOptions_006(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_MENU;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);

    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options1, testIntention);
    OH_UdmfOptions_SetKey(options1, key);

    unsigned dataSize1 = 1;
    OH_UdmfData* dataArray1 = nullptr;
    int getRes = OH_Udmf_GetUnifiedDataByOptions(options1, &dataArray1, &dataSize1);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);

    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_Udmf_DestroyDataArray(&dataArray1, dataSize1);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);

    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return res;
}

static napi_value OH_Udmf_GetUnifiedDataByOptions_007(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_MENU;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);

    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options1, testIntention);
    OH_UdmfOptions_SetKey(options1, key);

    unsigned dataSize1 = -1;
    OH_UdmfData* dataArray1 = nullptr;
    int getRes = OH_Udmf_GetUnifiedDataByOptions(options1, &dataArray1, &dataSize1);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);

    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_Udmf_DestroyDataArray(&dataArray1, dataSize1);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);

    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return res;
}

static napi_value OH_Udmf_SetUnifiedDataByOptions_001(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DRAG;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_INVALID_PARAM, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_SetUnifiedDataByOptions_002(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] !=  '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);
    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_SetUnifiedDataByOptions_003(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = nullptr;
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_INVALID_PARAM, "OH_Udmf_SetUnifiedDataByOptions is fail.");
   
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_SetUnifiedDataByOptions_004(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = nullptr;
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
  
    OH_UdmfOptions_Destroy(options);
    napi_value res;
    napi_create_int32(env, setRes == UDMF_E_INVALID_PARAM, &res);
    return res;
}

static napi_value OH_Udmf_SetUnifiedDataByOptions_005(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, -1);
    NAPI_ASSERT(env, setRes == UDMF_ERR, "OH_Udmf_SetUnifiedDataByOptions is fail.");

    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_SetUnifiedDataByOptions_006(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, 0);
    NAPI_ASSERT(env, setRes == UDMF_E_INVALID_PARAM, "OH_Udmf_SetUnifiedDataByOptions is fail.");

    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_SetUnifiedDataByOptions_008(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    char key1[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] !=  '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");
    int setRes1 = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key1, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes1 == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] !=  '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);

    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_SetUnifiedDataByOptions_009(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    std::string uri1 = "https://xxx/xx11/xx.jpg";
    OH_UdmfData *udmfUnifiedData1 = OH_UdmfData_Create();
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri1 = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri1, uri1.c_str());
    OH_UdsFileUri_SetFileType(fileUri1, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record1, fileUri1);
    OH_UdmfData_AddRecord(udmfUnifiedData1, record1);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] !=  '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");
    int setRes1 = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData1, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes1 == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] !=  '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);

    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdsFileUri_Destroy(fileUri1);
    OH_UdmfRecord_Destroy(record1);
    OH_UdmfData_Destroy(udmfUnifiedData1);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_SetUnifiedDataByOptions_010(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, nullptr, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_INVALID_PARAM, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);

    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_SetUnifiedDataByOptions_011(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, 0);
    NAPI_ASSERT(env, setRes == UDMF_E_INVALID_PARAM, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);

    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}
static napi_value OH_Udmf_SetUnifiedDataByOptions_012(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    int setResult = OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, 1);
    NAPI_ASSERT(env, setRes == UDMF_E_INVALID_PARAM, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);

    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}
static napi_value OH_Udmf_UpdateUnifiedData_001(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");
    std::string uri2 = "https://new/uri/path.jpg";
    OH_UdmfData *udmfUnifiedData2 = OH_UdmfData_Create();
    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri2 = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri2, uri2.c_str());
    OH_UdsFileUri_SetFileType(fileUri2, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record2, fileUri2);
    OH_UdmfData_AddRecord(udmfUnifiedData2, record2);
    OH_UdmfOptions* options2 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options2, testIntention);
    OH_UdmfOptions_SetKey(options2, key);
    int updataRes = OH_Udmf_UpdateUnifiedData(options2, udmfUnifiedData2);
    NAPI_ASSERT(env, updataRes == UDMF_E_OK, "OH_Udmf_UpdateUnifiedData is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    int deleteRes = OH_Udmf_DeleteUnifiedData(options2, &dataArray2, &dataSize2);
    NAPI_ASSERT(env, deleteRes == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray2 != nullptr, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataSize2 == 1, "OH_Udmf_DeleteUnifiedData is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options2);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(fileUri2);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(record2);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfData_Destroy(udmfUnifiedData2);
    return res;
}

static napi_value OH_Udmf_UpdateUnifiedData_002(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_MENU;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");

    std::string uri2 = "https://new/uri/path.jpg";
    OH_UdmfData *udmfUnifiedData2 = OH_UdmfData_Create();
    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri2 = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri2, uri2.c_str());
    OH_UdsFileUri_SetFileType(fileUri2, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record2, fileUri2);
    OH_UdmfData_AddRecord(udmfUnifiedData2, record2);
    OH_UdmfOptions* options2 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options2, testIntention);
    OH_UdmfOptions_SetKey(options2, key);
    int updataRes = OH_Udmf_UpdateUnifiedData(options2, udmfUnifiedData2);
    NAPI_ASSERT(env, updataRes == UDMF_E_INVALID_PARAM, "OH_Udmf_UpdateUnifiedData is fail.");
    OH_UdmfOptions* options3 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options3, testIntention);
    OH_UdmfOptions_SetKey(options3, key);
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    int deleteRes = OH_Udmf_DeleteUnifiedData(options3, &dataArray2, &dataSize2);
    NAPI_ASSERT(env, deleteRes == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray2 != nullptr, "OH_Udmf_DeleteUnifiedData is fail.");

    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options2);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(fileUri2);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(record2);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfData_Destroy(udmfUnifiedData2);
    return res;
}

static napi_value OH_Udmf_UpdateUnifiedData_003(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");
    std::string uri2 = "https://new/uri/path.jpg";
    OH_UdmfData *udmfUnifiedData2 = OH_UdmfData_Create();
    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri2 = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri2, uri2.c_str());
    OH_UdsFileUri_SetFileType(fileUri2, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record2, fileUri2);
    OH_UdmfData_AddRecord(udmfUnifiedData2, record2);
    OH_UdmfOptions* options2 = OH_UdmfOptions_Create();
    Udmf_Intention testIntention2 = UDMF_INTENTION_MENU;
    OH_UdmfOptions_SetIntention(options2, testIntention2);
    OH_UdmfOptions_SetKey(options2, key);
    int updataRes = OH_Udmf_UpdateUnifiedData(options2, udmfUnifiedData2);
    NAPI_ASSERT(env, updataRes == UDMF_E_INVALID_PARAM, "OH_Udmf_UpdateUnifiedData is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    int deleteRes = OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);
    NAPI_ASSERT(env, deleteRes == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray2 != nullptr, "OH_Udmf_DeleteUnifiedData is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options2);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(fileUri2);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(record2);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfData_Destroy(udmfUnifiedData2);
    return res;
}

static napi_value OH_Udmf_UpdateUnifiedData_004(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");

    std::string uri2 = "https://new/uri/path.jpg";
    OH_UdmfData *udmfUnifiedData2 = OH_UdmfData_Create();
    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri2 = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri2, uri2.c_str());
    OH_UdsFileUri_SetFileType(fileUri2, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record2, fileUri2);
    OH_UdmfData_AddRecord(udmfUnifiedData2, record2);
    OH_UdmfOptions* options2 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options2, testIntention);
    OH_UdmfOptions_SetKey(options2, key);
    int updataRes = OH_Udmf_UpdateUnifiedData(options2, udmfUnifiedData2);
    NAPI_ASSERT(env, updataRes == UDMF_E_OK, "OH_Udmf_UpdateUnifiedData is fail.");
    int updataRes1 = OH_Udmf_UpdateUnifiedData(options2, udmfUnifiedData2);
    NAPI_ASSERT(env, updataRes1 == UDMF_E_OK, "OH_Udmf_UpdateUnifiedData is fail.");

    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    int deleteRes1 = OH_Udmf_DeleteUnifiedData(options2, &dataArray2, &dataSize2);
    NAPI_ASSERT(env, deleteRes1 == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray2 != nullptr, "OH_Udmf_DeleteUnifiedData is fail.");

    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options2);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(fileUri2);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(record2);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfData_Destroy(udmfUnifiedData2);
    return res;
}

static napi_value OH_Udmf_UpdateUnifiedData_005(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");
    std::string uri2 = "https://new/uri/path.jpg";
    OH_UdmfData *udmfUnifiedData2 = OH_UdmfData_Create();
    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri2 = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri2, uri2.c_str());
    OH_UdsFileUri_SetFileType(fileUri2, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record2, fileUri2);
    OH_UdmfData_AddRecord(udmfUnifiedData2, record2);
    OH_UdmfOptions* options2 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options2, testIntention);
    OH_UdmfOptions_SetKey(options2, key);
    int updataRes = OH_Udmf_UpdateUnifiedData(options2, udmfUnifiedData2);
    NAPI_ASSERT(env, updataRes == UDMF_E_OK, "OH_Udmf_UpdateUnifiedData 1 is fail.");
    int updataRes1 = OH_Udmf_UpdateUnifiedData(options2, udmfUnifiedData);
    NAPI_ASSERT(env, updataRes1 == UDMF_E_OK, "OH_Udmf_UpdateUnifiedData 2 is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    int deleteRes1 = OH_Udmf_DeleteUnifiedData(options2, &dataArray2, &dataSize2);
    NAPI_ASSERT(env, deleteRes1 == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray2 != nullptr, "OH_Udmf_DeleteUnifiedData is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options2);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(fileUri2);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(record2);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfData_Destroy(udmfUnifiedData2);
    return res;
}

static napi_value OH_Udmf_UpdateUnifiedData_006(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");
    std::string uri2 = "https://new/uri/path.jpg";
    OH_UdmfData *udmfUnifiedData2 = OH_UdmfData_Create();
    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri2 = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri2, uri2.c_str());
    OH_UdsFileUri_SetFileType(fileUri2, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record2, fileUri2);
    OH_UdmfData_AddRecord(udmfUnifiedData2, record2);
    OH_UdmfOptions* options1 = nullptr;
    int updataRes = OH_Udmf_UpdateUnifiedData(options1, udmfUnifiedData2);
    NAPI_ASSERT(env, updataRes == UDMF_E_INVALID_PARAM, "OH_Udmf_UpdateUnifiedData is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    int deleteRes = OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);
    NAPI_ASSERT(env, deleteRes == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray2 != nullptr, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataSize2 == 1, "OH_Udmf_DeleteUnifiedData is fail.");
    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(fileUri2);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(record2);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfData_Destroy(udmfUnifiedData2);
    return res;
}

static napi_value OH_Udmf_UpdateUnifiedData_007(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");

    std::string uri2 = "https://new/uri/path.jpg";
    OH_UdmfData *udmfUnifiedData2 = OH_UdmfData_Create();
    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri2 = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri2, uri2.c_str());
    OH_UdsFileUri_SetFileType(fileUri2, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record2, fileUri2);
    OH_UdmfData_AddRecord(udmfUnifiedData2, record2);
    OH_UdmfOptions* options1 = nullptr;
    int updataRes = OH_Udmf_UpdateUnifiedData(options1, udmfUnifiedData2);
    NAPI_ASSERT(env, updataRes == UDMF_E_INVALID_PARAM, "OH_Udmf_UpdateUnifiedData is fail.");

    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    int deleteRes = OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);
    NAPI_ASSERT(env, deleteRes == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray2 != nullptr, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataSize2 == 1, "OH_Udmf_DeleteUnifiedData is fail.");

    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(fileUri2);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(record2);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfData_Destroy(udmfUnifiedData2);
    return res;
}

static napi_value OH_Udmf_UpdateUnifiedData_008(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");

    std::string uri2 = "https://new/uri/path.jpg";
    OH_UdmfOptions* options2 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options2, testIntention);
    OH_UdmfOptions_SetKey(options2, key);
    int updataRes = OH_Udmf_UpdateUnifiedData(options2, nullptr);
    NAPI_ASSERT(env, updataRes == UDMF_E_INVALID_PARAM, "OH_Udmf_UpdateUnifiedData is fail.");

    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    int deleteRes = OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);
    NAPI_ASSERT(env, deleteRes == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray2 != nullptr, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataSize2 == 1, "OH_Udmf_DeleteUnifiedData is fail.");

    napi_value res;
    napi_create_int32(env, 1, &res);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options2);
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return res;
}

static napi_value OH_Udmf_DeleteUnifiedData_001(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");

    unsigned int dataSize = 0;
    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options, &dataArray, &dataSize);
    NAPI_ASSERT(env, dateleRes == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray != nullptr, "OH_Udmf_DeleteUnifiedData is fail.");
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_DeleteUnifiedData_002(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_SYSTEM_SHARE;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");

    OH_UdmfOptions* options2 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options2, testIntention);
    OH_UdmfOptions_SetKey(options2, key);
    unsigned int dataSize = 0;
    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options2, &dataArray, &dataSize);
    NAPI_ASSERT(env, dateleRes == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options2, testIntention);
    OH_UdmfOptions_SetKey(options1, key);
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    int dateleRes1 = OH_Udmf_DeleteUnifiedData(options1, &dataArray2, &dataSize2);
    NAPI_ASSERT(env, dateleRes1 == UDMF_E_INVALID_PARAM, "OH_Udmf_DeleteUnifiedData is fail.");
    OH_Udmf_DestroyDataArray(&dataArray2, dataSize2);
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);
    OH_UdmfOptions_Destroy(options2);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_DeleteUnifiedData_003(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");

    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options1 = nullptr;

    unsigned int dataSize = 0;
    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options1, &dataArray, &dataSize);
    NAPI_ASSERT(env, dateleRes == UDMF_E_INVALID_PARAM, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray == nullptr, "OH_Udmf_DeleteUnifiedData is fail.");
    unsigned int dataSize2 = 0;
    OH_UdmfData* dataArray2 = nullptr;
    int dateleRes1 = OH_Udmf_DeleteUnifiedData(options, &dataArray2, &dataSize2);
    NAPI_ASSERT(env, dateleRes1 == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    OH_UdmfOptions_Destroy(options1);
    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_DeleteUnifiedData_004(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");

    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options1, testIntention);
    OH_UdmfOptions_SetKey(options1, key);
    unsigned int dataSize = 0;
    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options1, &dataArray, &dataSize);
    NAPI_ASSERT(env, dateleRes == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    unsigned int dataSize1 = 0;
    OH_UdmfData* dataArray1 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray1, &dataSize1);
    OH_Udmf_DestroyDataArray(&dataArray1, dataSize1);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_DeleteUnifiedData_005(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");

    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options1, testIntention);

    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options1, &dataArray, nullptr);
    NAPI_ASSERT(env, dateleRes == UDMF_E_INVALID_PARAM, "OH_Udmf_DeleteUnifiedData is fail.");

    unsigned int dataSize1 = 0;
    OH_UdmfData* dataArray1 = nullptr;
    OH_Udmf_DeleteUnifiedData(options, &dataArray1, &dataSize1);

    OH_Udmf_DestroyDataArray(&dataArray1, dataSize1);
    OH_UdmfOptions_Destroy(options1);
    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_DeleteUnifiedData_006(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize = 0;
    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options, &dataArray, &dataSize);
    NAPI_ASSERT(env, dateleRes == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray != nullptr, "OH_Udmf_DeleteUnifiedData is fail.");
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_DeleteUnifiedData_008(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, key[0] != '\0', "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize = 10000;
    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options, &dataArray, &dataSize);
    NAPI_ASSERT(env, dateleRes == UDMF_E_OK, "OH_Udmf_DeleteUnifiedData is fail.");
    NAPI_ASSERT(env, dataArray != nullptr, "OH_Udmf_DeleteUnifiedData is fail.");

    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfOptions_Destroy(options);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_DestroyDataArray_001(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    NAPI_ASSERT(env, setRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    unsigned int dataSize = 0;
    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options, &dataArray, &dataSize);
    NAPI_ASSERT(env, dateleRes == UDMF_E_OK, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    NAPI_ASSERT(env, dataArray == nullptr, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_DestroyDataArray_002(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    unsigned int dataSize = 0;
    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options, &dataArray, &dataSize);
    OH_UdmfData* dataArray1 = nullptr;
    OH_Udmf_DestroyDataArray(&dataArray1, dataSize);
    NAPI_ASSERT(env, dataArray1 == nullptr, "OH_Udmf_DestroyDataArray is fail.");
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_DestroyDataArray_003(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    unsigned int dataSize = 0;
    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options, &dataArray, &dataSize);
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    NAPI_ASSERT(env, dataArray == nullptr, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    NAPI_ASSERT(env, dataArray == nullptr, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_DestroyDataArray_004(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int num = 10;
    for (int i = 0; i < num; i++) {
        OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    }
    unsigned int dataSize = 0;
    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options, &dataArray, &dataSize);

    OH_Udmf_DestroyDataArray(&dataArray, 0);
    NAPI_ASSERT(env, dataArray == nullptr, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_Udmf_DestroyDataArray_005(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    int num = 10;
    for (int i = 0; i < num; i++) {
        OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    }
    unsigned int dataSize = 0;
    OH_UdmfData* dataArray = nullptr;
    int dateleRes = OH_Udmf_DeleteUnifiedData(options, &dataArray, &dataSize);

    OH_Udmf_DestroyDataArray(&dataArray, 1);
    NAPI_ASSERT(env, dataArray == nullptr, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfData_CreateAndSetUnifiedDataByOptions_001(napi_env env, napi_callback_info info)
{
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];

    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    OH_UdmfOptions_Destroy(options);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    napi_value res;
    napi_create_string_utf8(env, key, sizeof(key), &res);
    return res;
}

static napi_value OH_UdmfData_CreateAndGetUnifiedDataByOptions_001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    size_t bufferSize = 0;
    napi_get_value_string_latin1(env, args[0], nullptr, 0, &bufferSize);
    char str[bufferSize + 1];
    size_t strLength;
    napi_get_value_string_utf8(env, args[0], str, sizeof(str), &strLength);
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    int result = OH_UdmfOptions_SetKey(options, str);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_Udmf_GetUnifiedDataByOptions is fail.");
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    unsigned int dataSize = 0;
    OH_UdmfData* dataArray = nullptr;
    int getRes = OH_Udmf_GetUnifiedDataByOptions(options, &dataArray, &dataSize);
    NAPI_ASSERT(env, getRes == UDMF_E_OK, "OH_Udmf_GetUnifiedDataByOptions is fail.");
    NAPI_ASSERT(env, dataArray != nullptr, "OH_Udmf_SetUnifiedDataByOptions is fail.");
    OH_Udmf_DestroyDataArray(&dataArray, dataSize);
    OH_UdmfOptions_Destroy(options);
    napi_value res;
    napi_create_int32(env, 1, &res);
    return res;
}

static napi_value OH_UdmfDataLoadParams_Create001(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadParams*  dataLoadParams = OH_UdmfDataLoadParams_Create();
    napi_value result;
    napi_create_int32(env, dataLoadParams != nullptr, &result);
    OH_UdmfDataLoadParams_Destroy(dataLoadParams);
    return result;
}

static napi_value OH_UdmfDataLoadParams_Create002(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadParams*  dataLoadParams = OH_UdmfDataLoadParams_Create();
    napi_value result;
    napi_create_int32(env, dataLoadParams != nullptr, &result);
    OH_UdmfDataLoadParams_Destroy(dataLoadParams);
    return result;
}

static napi_value OH_UdmfDataLoadInfo_Create001(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadInfo*  dataLoadInfo = OH_UdmfDataLoadInfo_Create();
    napi_value result;
    napi_create_int32(env, dataLoadInfo != nullptr, &result);
    OH_UdmfDataLoadInfo_Destroy(dataLoadInfo);
    return result;
}

static napi_value OH_UdmfDataLoadInfo_SetTypeAndGetTypes001(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadInfo*  dataLoadInfo = OH_UdmfDataLoadInfo_Create();
    OH_UdmfDataLoadInfo_SetType(dataLoadInfo, "image");
    OH_UdmfDataLoadInfo_SetType(dataLoadInfo, "text");
    OH_UdmfDataLoadInfo_SetType(dataLoadInfo, "text");
    unsigned int count = 0;
    OH_UdmfDataLoadInfo_GetTypes(dataLoadInfo, &count);
    int num = 2;
    napi_value result;
    napi_create_int32(env, count == num, &result);
    OH_UdmfDataLoadInfo_Destroy(dataLoadInfo);
    return result;
}

static napi_value OH_UdmfDataLoadInfo_SetTypeAndGetTypes002(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadInfo*  dataLoadInfo = OH_UdmfDataLoadInfo_Create();
    OH_UdmfDataLoadInfo_SetType(dataLoadInfo, "");
    unsigned int count = 0;
    OH_UdmfDataLoadInfo_GetTypes(dataLoadInfo, &count);
    napi_value result;
    napi_create_int32(env, count == 1, &result);
    OH_UdmfDataLoadInfo_Destroy(dataLoadInfo);
    return result;
}

static napi_value OH_UdmfDataLoadInfo_SetTypeAndGetTypes003(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadInfo*  dataLoadInfo = OH_UdmfDataLoadInfo_Create();
    OH_UdmfDataLoadInfo_SetType(dataLoadInfo, "hello");
    unsigned int count = 0;
    OH_UdmfDataLoadInfo_GetTypes(dataLoadInfo, &count);
    napi_value result;
    napi_create_int32(env, count == 1, &result);
    OH_UdmfDataLoadInfo_Destroy(dataLoadInfo);
    return result;
}
static napi_value OH_UdmfDataLoadInfo_GetTypes001(napi_env env, napi_callback_info info)
{
    unsigned int count = 0;
    char** result1 = OH_UdmfDataLoadInfo_GetTypes(nullptr, &count);
    napi_value result;
    napi_create_int32(env, result1 == nullptr, &result);
    return result;
}

static napi_value OH_UdmfDataLoadInfo_GetTypes002(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadInfo* dataLoadInfo = OH_UdmfDataLoadInfo_Create();
    char** result2 = OH_UdmfDataLoadInfo_GetTypes(dataLoadInfo, nullptr);
    napi_value result;
    napi_create_int32(env, result2 == nullptr, &result);
    OH_UdmfDataLoadInfo_Destroy(dataLoadInfo);
    return result;
}

static napi_value OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount001(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadInfo*  dataLoadInfo = OH_UdmfDataLoadInfo_Create();
    int num = 10;
    OH_UdmfDataLoadInfo_SetRecordCount(dataLoadInfo, num);
    int count = OH_UdmfDataLoadInfo_GetRecordCount(dataLoadInfo);
    napi_value result;
    napi_create_int32(env, count == num, &result);
    OH_UdmfDataLoadInfo_Destroy(dataLoadInfo);
    return result;
}

static napi_value OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount002(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadInfo*  dataLoadInfo = OH_UdmfDataLoadInfo_Create();
    OH_UdmfDataLoadInfo_SetRecordCount(dataLoadInfo, 1);
    int count = OH_UdmfDataLoadInfo_GetRecordCount(dataLoadInfo);
    napi_value result;
    napi_create_int32(env, count == 1, &result);
    OH_UdmfDataLoadInfo_Destroy(dataLoadInfo);
    return result;
}

static napi_value OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount003(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadInfo*  dataLoadInfo = OH_UdmfDataLoadInfo_Create();
    OH_UdmfDataLoadInfo_SetRecordCount(dataLoadInfo, 0);
    int count = OH_UdmfDataLoadInfo_GetRecordCount(dataLoadInfo);
    napi_value result;
    napi_create_int32(env, count == 0, &result);
    OH_UdmfDataLoadInfo_Destroy(dataLoadInfo);
    return result;
}

static napi_value OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount004(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadInfo*  dataLoadInfo = OH_UdmfDataLoadInfo_Create();
    OH_UdmfDataLoadInfo_SetRecordCount(dataLoadInfo, -1);
    int count = OH_UdmfDataLoadInfo_GetRecordCount(dataLoadInfo);
    napi_value result;
    napi_create_int32(env, count == -1, &result);
    OH_UdmfDataLoadInfo_Destroy(dataLoadInfo);
    return result;
}

static napi_value OH_UdmfDataLoadInfo_GetRecordCount001(napi_env env, napi_callback_info info)
{
    int count = OH_UdmfDataLoadInfo_GetRecordCount(nullptr);
    napi_value result;
    napi_create_int32(env, count == 0, &result);
    return result;
}

static napi_value OH_UdmfDataLoadParams_SetDataLoadInfo001(napi_env env, napi_callback_info info)
{
    int code = 0;
    OH_UdmfDataLoadParams*  dataLoadParams = OH_UdmfDataLoadParams_Create();
    OH_UdmfDataLoadInfo*  dataLoadInfo = OH_UdmfDataLoadInfo_Create();
    OH_UdmfDataLoadInfo_SetType(dataLoadInfo, "general.plain-text");
    OH_UdmfDataLoadInfo_SetType(dataLoadInfo, "general.html");
    int num = 2;
    OH_UdmfDataLoadInfo_SetRecordCount(dataLoadInfo, num);
    OH_UdmfDataLoadParams_SetDataLoadInfo(dataLoadParams, dataLoadInfo);
    int count = OH_UdmfDataLoadInfo_GetRecordCount(dataLoadInfo);
    napi_value result;
    napi_create_int32(env, count == num, &result);
    OH_UdmfDataLoadInfo_Destroy(dataLoadInfo);
    OH_UdmfDataLoadParams_Destroy(dataLoadParams);
    return result;
}

static napi_value OH_UdmfDataLoadParams_SetLoadHandler001(napi_env env, napi_callback_info info)
{
    int code = 0;
    OH_UdmfDataLoadParams*  dataLoadParams = OH_UdmfDataLoadParams_Create();
    OH_Udmf_DataLoadHandler loadHandler = [] (OH_UdmfDataLoadInfo* acceptableInfo) {
        auto recordCount = OH_UdmfDataLoadInfo_GetRecordCount(acceptableInfo);
        unsigned int typeCount = 0;
        auto types = OH_UdmfDataLoadInfo_GetTypes(acceptableInfo, &typeCount);

        OH_UdmfData *unifiedData = OH_UdmfData_Create();
        OH_UdmfRecord *record = OH_UdmfRecord_Create();
        OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
        auto status = OH_UdsPlainText_SetContent(plainText, "content1");
        status = OH_UdmfRecord_AddPlainText(record, plainText);
        status = OH_UdmfData_AddRecord(unifiedData, record);

        return unifiedData;
    };

    OH_UdmfDataLoadParams_SetLoadHandler(dataLoadParams, loadHandler);
    napi_value result;
    napi_create_int32(env, code == 0, &result);
    OH_UdmfDataLoadParams_Destroy(dataLoadParams);
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
        {"OH_Udmf_SetAndGetUnifiedData003", nullptr, OH_Udmf_SetAndGetUnifiedData003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetAndGetUnifiedData004", nullptr, OH_Udmf_SetAndGetUnifiedData004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetAndGetUnifiedData005", nullptr, OH_Udmf_SetAndGetUnifiedData005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetAndGetUnifiedData006", nullptr, OH_Udmf_SetAndGetUnifiedData006, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_Create_001", nullptr, OH_UdmfOptions_Create_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_Create_002", nullptr, OH_UdmfOptions_Create_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_Create_003", nullptr, OH_UdmfOptions_Create_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_Destroy001", nullptr, OH_UdmfOptions_Destroy001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_GetKey_001", nullptr, OH_UdmfOptions_GetKey_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_GetKey_002", nullptr, OH_UdmfOptions_GetKey_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_GetKey_003", nullptr, OH_UdmfOptions_GetKey_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetKey_001", nullptr, OH_UdmfOptions_SetKey_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetKey_002", nullptr, OH_UdmfOptions_SetKey_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetKey_003", nullptr, OH_UdmfOptions_SetKey_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetKey_004", nullptr, OH_UdmfOptions_SetKey_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetKey_005", nullptr, OH_UdmfOptions_SetKey_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_GetIntention_001", nullptr, OH_UdmfOptions_GetIntention_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_GetIntention_002", nullptr, OH_UdmfOptions_GetIntention_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetIntention_001", nullptr, OH_UdmfOptions_SetIntention_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetIntention_002", nullptr, OH_UdmfOptions_SetIntention_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetIntention_003", nullptr, OH_UdmfOptions_SetIntention_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetIntention_004", nullptr, OH_UdmfOptions_SetIntention_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetIntention_005", nullptr, OH_UdmfOptions_SetIntention_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetIntention_006", nullptr, OH_UdmfOptions_SetIntention_006, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetIntention_007", nullptr, OH_UdmfOptions_SetIntention_007, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetIntention_008", nullptr, OH_UdmfOptions_SetIntention_008, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetIntention_009", nullptr, OH_UdmfOptions_SetIntention_009, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetIntention_010", nullptr, OH_UdmfOptions_SetIntention_010, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_SetIntention_011", nullptr, OH_UdmfOptions_SetIntention_011, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_Reset_001", nullptr, OH_UdmfOptions_Reset_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfOptions_Reset_002", nullptr, OH_UdmfOptions_Reset_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedDataByOptions_001", nullptr, OH_Udmf_GetUnifiedDataByOptions_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedDataByOptions_002", nullptr, OH_Udmf_GetUnifiedDataByOptions_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedDataByOptions_003", nullptr, OH_Udmf_GetUnifiedDataByOptions_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedDataByOptions_004", nullptr, OH_Udmf_GetUnifiedDataByOptions_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedDataByOptions_005", nullptr, OH_Udmf_GetUnifiedDataByOptions_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedDataByOptions_006", nullptr, OH_Udmf_GetUnifiedDataByOptions_006, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedDataByOptions_007", nullptr, OH_Udmf_GetUnifiedDataByOptions_007, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedDataByOptions_001", nullptr, OH_Udmf_SetUnifiedDataByOptions_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedDataByOptions_002", nullptr, OH_Udmf_SetUnifiedDataByOptions_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedDataByOptions_003", nullptr, OH_Udmf_SetUnifiedDataByOptions_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedDataByOptions_004", nullptr, OH_Udmf_SetUnifiedDataByOptions_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedDataByOptions_005", nullptr, OH_Udmf_SetUnifiedDataByOptions_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedDataByOptions_006", nullptr, OH_Udmf_SetUnifiedDataByOptions_006, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedDataByOptions_008", nullptr, OH_Udmf_SetUnifiedDataByOptions_008, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedDataByOptions_009", nullptr, OH_Udmf_SetUnifiedDataByOptions_009, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedDataByOptions_010", nullptr, OH_Udmf_SetUnifiedDataByOptions_010, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedDataByOptions_011", nullptr, OH_Udmf_SetUnifiedDataByOptions_011, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetUnifiedDataByOptions_012", nullptr, OH_Udmf_SetUnifiedDataByOptions_012, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_UpdateUnifiedData_001", nullptr, OH_Udmf_UpdateUnifiedData_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_UpdateUnifiedData_002", nullptr, OH_Udmf_UpdateUnifiedData_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_UpdateUnifiedData_003", nullptr, OH_Udmf_UpdateUnifiedData_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_UpdateUnifiedData_004", nullptr, OH_Udmf_UpdateUnifiedData_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_UpdateUnifiedData_005", nullptr, OH_Udmf_UpdateUnifiedData_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_UpdateUnifiedData_006", nullptr, OH_Udmf_UpdateUnifiedData_006, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_UpdateUnifiedData_007", nullptr, OH_Udmf_UpdateUnifiedData_007, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_UpdateUnifiedData_008", nullptr, OH_Udmf_UpdateUnifiedData_008, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DeleteUnifiedData_001", nullptr, OH_Udmf_DeleteUnifiedData_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DeleteUnifiedData_002", nullptr, OH_Udmf_DeleteUnifiedData_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DeleteUnifiedData_003", nullptr, OH_Udmf_DeleteUnifiedData_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DeleteUnifiedData_004", nullptr, OH_Udmf_DeleteUnifiedData_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DeleteUnifiedData_005", nullptr, OH_Udmf_DeleteUnifiedData_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DeleteUnifiedData_006", nullptr, OH_Udmf_DeleteUnifiedData_006, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DeleteUnifiedData_008", nullptr, OH_Udmf_DeleteUnifiedData_008, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DestroyDataArray_001", nullptr, OH_Udmf_DestroyDataArray_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DestroyDataArray_002", nullptr, OH_Udmf_DestroyDataArray_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DestroyDataArray_003", nullptr, OH_Udmf_DestroyDataArray_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DestroyDataArray_004", nullptr, OH_Udmf_DestroyDataArray_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_DestroyDataArray_005", nullptr, OH_Udmf_DestroyDataArray_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_CreateAndSetUnifiedDataByOptions_001", nullptr, OH_UdmfData_CreateAndSetUnifiedDataByOptions_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_CreateAndGetUnifiedDataByOptions_001", nullptr, OH_UdmfData_CreateAndGetUnifiedDataByOptions_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadParams_Create001", nullptr, OH_UdmfDataLoadParams_Create001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadParams_Create002", nullptr, OH_UdmfDataLoadParams_Create002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadInfo_Create001", nullptr, OH_UdmfDataLoadInfo_Create001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadInfo_SetTypeAndGetTypes001", nullptr, OH_UdmfDataLoadInfo_SetTypeAndGetTypes001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadInfo_SetTypeAndGetTypes002", nullptr, OH_UdmfDataLoadInfo_SetTypeAndGetTypes002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadInfo_SetTypeAndGetTypes003", nullptr, OH_UdmfDataLoadInfo_SetTypeAndGetTypes003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadInfo_GetTypes001", nullptr, OH_UdmfDataLoadInfo_GetTypes001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadInfo_GetTypes002", nullptr, OH_UdmfDataLoadInfo_GetTypes002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount001", nullptr,
         OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount002", nullptr,
         OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount003", nullptr,
         OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount004", nullptr,
         OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadInfo_GetRecordCount001", nullptr, OH_UdmfDataLoadInfo_GetRecordCount001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadParams_SetDataLoadInfo001", nullptr, OH_UdmfDataLoadParams_SetDataLoadInfo001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfDataLoadParams_SetLoadHandler001", nullptr, OH_UdmfDataLoadParams_SetLoadHandler001, nullptr,
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
