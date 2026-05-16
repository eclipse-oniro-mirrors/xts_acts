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
#include "database/udmf/uds.h"
#include "database/udmf/udmf_err_code.h"
#include "database/udmf/udmf_meta.h"
#include "common.h"
#include <string>

#define PARAM_0 0
#define PARAM_1 1

static napi_value OH_UdsContentForm_Create_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    napi_value result;
    napi_create_int32(env, contentForm != nullptr, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_GetType_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    std::string res = std::string(OH_UdsContentForm_GetType(contentForm));
    napi_value result;
    napi_create_int32(env, res == UDMF_METE_GENERAL_CONTENT_FORM, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_GetType_002(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_GetType(nullptr);
    napi_value result;
    napi_create_int32(env, res == nullptr, &result);
    return result;
}
static napi_value OH_UdsContentForm_SetThumbData_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    int thumbDataLength = 5;
    int res = OH_UdsContentForm_SetThumbData(contentForm, thumbData, thumbDataLength);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_SetThumbData_002(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetThumbData(contentForm, nullptr, 0);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_SetThumbData_003(napi_env env, napi_callback_info info)
{
    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    auto res = OH_UdsContentForm_SetThumbData(nullptr, thumbData, 0);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_UdsContentForm_SetThumbData_004(napi_env env, napi_callback_info info)
{
    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    auto res = OH_UdsContentForm_SetThumbData(nullptr, nullptr, 0);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_UdsContentForm_SetThumbData_005(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    auto res = OH_UdsContentForm_SetThumbData(contentForm, thumbData, 0);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_GetThumbData_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    int thumbDataLength = 5;
    OH_UdsContentForm_SetThumbData(contentForm, thumbData, thumbDataLength);
    unsigned char *readThumbData;
    unsigned int thumbDataLen = 0;
    auto res = OH_UdsContentForm_GetThumbData(contentForm, &readThumbData, &thumbDataLen);
    int num = 5;
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK && thumbDataLen == num, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_GetThumbData_002(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned int thumbDataLen = 0;
    unsigned char *readThumbData;
    auto res = OH_UdsContentForm_GetThumbData(contentForm, &readThumbData, &thumbDataLen);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK && thumbDataLen == 0, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_GetThumbData_003(napi_env env, napi_callback_info info)
{
    unsigned int thumbDataLen = 0;
    auto res = OH_UdsContentForm_GetThumbData(nullptr, nullptr, &thumbDataLen);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdsContentForm_GetThumbData_004(napi_env env, napi_callback_info info)
{
    unsigned char *readThumbData;
    unsigned int thumbDataLen = 0;
    auto res = OH_UdsContentForm_GetThumbData(nullptr, &readThumbData, &thumbDataLen);
    int num = 5;
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdsContentForm_SetDescription_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetDescription(contentForm, "description");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_SetDescription_002(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetDescription(contentForm, "");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_SetDescription_003(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetDescription(contentForm, nullptr);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_SetDescription_004(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_SetDescription(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_UdsContentForm_SetDescription_005(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_SetDescription(nullptr, "description");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_UdsContentForm_SetDescription_006(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_SetDescription(nullptr, "");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_UdsContentForm_GetDescription_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    OH_UdsContentForm_SetDescription(contentForm, "description");
    auto res = OH_UdsContentForm_GetDescription(contentForm);
    napi_value result;
    napi_create_int32(env, strcmp(res, "description") == PARAM_0, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_GetDescription_002(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_GetDescription(nullptr);
    napi_value result;
    napi_create_int32(env, res == nullptr, &result);
    return result;
}

static napi_value OH_UdsContentForm_SetTitle_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetTitle(contentForm, "tittle");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_SetTitle_002(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetTitle(contentForm, "");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_SetTitle_003(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetTitle(contentForm, nullptr);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_SetTitle_004(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_SetTitle(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_UdsContentForm_SetTitle_005(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_SetTitle(nullptr, "nullptr");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_UdsContentForm_SetTitle_006(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_SetTitle(nullptr, "");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdsContentForm_GetTitle_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    OH_UdsContentForm_SetTitle(contentForm, "tittle");
    auto res = OH_UdsContentForm_GetTitle(contentForm);
    napi_value result;
    napi_create_int32(env, strcmp(res, "tittle") == PARAM_0, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_GetTitle_002(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_GetTitle(nullptr);
    napi_value result;
    napi_create_int32(env, res == nullptr, &result);
    return result;
}
static napi_value OH_UdsContentForm_SetAppIcon_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char appIcon[] = {5, 6, 7, 8, 9};
    int appIconLength = 5;
    auto res = OH_UdsContentForm_SetAppIcon(contentForm, appIcon, appIconLength);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_SetAppIcon_002(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char appIcon[] = {5, 6, 7, 8, 9};
    auto res = OH_UdsContentForm_SetAppIcon(contentForm, appIcon, 0);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_SetAppIcon_003(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetAppIcon(contentForm, nullptr, 0);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_SetAppIcon_004(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_SetAppIcon(nullptr, nullptr, 0);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_UdsContentForm_SetAppIcon_005(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char appIcon[] = {5, 6, 7, 8, 9};
    int thumbDataLength = 5;
    auto res = OH_UdsContentForm_SetAppIcon(nullptr, appIcon, thumbDataLength);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_GetAppIcon_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char appIcon[] = {5, 6, 7, 8, 9};
    int appIconLength = 5;
    OH_UdsContentForm_SetAppIcon(contentForm, appIcon, appIconLength);
    unsigned char *readAppIcon;
    unsigned int appIconLen = 0;
    auto res = OH_UdsContentForm_GetAppIcon(contentForm, &readAppIcon, &appIconLen);
    int num = 5;
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK && appIconLen == num, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_GetAppIcon_002(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned int appIconLen = 0;
    unsigned char *readAppIcon;
    auto res = OH_UdsContentForm_GetAppIcon(contentForm, &readAppIcon, &appIconLen);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_GetAppIcon_003(napi_env env, napi_callback_info info)
{
    unsigned char *readAppIcon;
    unsigned int appIconLen = 0;
    auto res = OH_UdsContentForm_GetAppIcon(nullptr, &readAppIcon, &appIconLen);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdsContentForm_GetAppIcon_004(napi_env env, napi_callback_info info)
{
    unsigned char *readAppIcon;
    unsigned int appIconLen = 0;
    auto res = OH_UdsContentForm_GetAppIcon(nullptr, nullptr, &appIconLen);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdsContentForm_SetAppName_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetAppName(contentForm, "appName");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_SetAppName_002(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetAppName(contentForm, "");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_SetAppName_003(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetAppName(contentForm, nullptr);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_SetAppName_004(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_SetAppName(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdsContentForm_GetAppName_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    OH_UdsContentForm_SetAppName(contentForm, "appName");
    auto res =  OH_UdsContentForm_GetAppName(contentForm);
    napi_value result;
    napi_create_int32(env, strcmp(res, "appName") == PARAM_0, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_GetAppName_002(napi_env env, napi_callback_info info)
{
    auto res =  OH_UdsContentForm_GetAppName(nullptr);
    napi_value result;
    napi_create_int32(env, res == nullptr, &result);
    return result;
}

static napi_value OH_UdsContentForm_SetLinkUri_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetLinkUri(contentForm, "link url");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_SetLinkUri_002(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetLinkUri(contentForm, "");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_SetLinkUri_003(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    auto res = OH_UdsContentForm_SetLinkUri(contentForm, nullptr);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}
static napi_value OH_UdsContentForm_SetLinkUri_004(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_SetLinkUri(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_UdsContentForm_SetLinkUri_005(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_SetLinkUri(nullptr, "");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdsContentForm_SetLinkUri_006(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_SetLinkUri(nullptr, "link url");
    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdsContentForm_GetLinkUri_001(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    OH_UdsContentForm_SetLinkUri(contentForm, "link url");
    auto res = OH_UdsContentForm_GetLinkUri(contentForm);
    napi_value result;
    napi_create_int32(env, strcmp(res, "link url") == PARAM_0, &result);
    OH_UdsContentForm_Destroy(contentForm);
    return result;
}

static napi_value OH_UdsContentForm_GetLinkUri_003(napi_env env, napi_callback_info info)
{
    auto res = OH_UdsContentForm_GetLinkUri(nullptr);
    napi_value result;
    napi_create_int32(env, res == nullptr, &result);
    return result;
}

static napi_value OH_Udmf_AddAndContentForm_001(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    int thumbDataLength = 5;
    OH_UdsContentForm_SetThumbData(contentForm, thumbData, thumbDataLength);
    OH_UdsContentForm_SetDescription(contentForm, "description");
    auto res = OH_UdmfRecord_AddContentForm(record, contentForm);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    char key[UDMF_KEY_BUFFER_LEN];

    OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    OH_Udmf_GetUnifiedData(key, intention, readUnifiedData);
    unsigned int count = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(readUnifiedData, &count);
    OH_UdsContentForm *getContentForm = OH_UdsContentForm_Create();
    auto res1 = OH_UdmfRecord_GetContentForm(getRecords[0], getContentForm);
    unsigned char *readThumbData;
    unsigned int thumbDataLen = 0;
    OH_UdsContentForm_GetThumbData(getContentForm, &readThumbData, &thumbDataLen);
    OH_UdsContentForm_Destroy(contentForm);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);

    OH_UdsContentForm_Destroy(getContentForm);
    OH_UdmfData_Destroy(readUnifiedData);
    napi_value result;
    napi_create_int32(env, res == UDMF_E_OK && res1 == UDMF_E_OK, &result);
    return result;
}

static napi_value OH_Udmf_AddAndContentForm_007(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    int thumbDataLength = 5;
    OH_UdsContentForm_SetThumbData(contentForm, thumbData, thumbDataLength);
    OH_UdsContentForm_SetDescription(contentForm, "description");
    OH_UdmfRecord_AddContentForm(record, contentForm);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    char key[UDMF_KEY_BUFFER_LEN];

    OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    OH_Udmf_GetUnifiedData(key, intention, readUnifiedData);
    unsigned int count = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(readUnifiedData, &count);
    OH_UdsContentForm *getContentForm = OH_UdsContentForm_Create();
    auto res1 = OH_UdmfRecord_GetContentForm(getRecords[0], nullptr);
    unsigned char *readThumbData;
    unsigned int thumbDataLen = 0;
    OH_UdsContentForm_GetThumbData(getContentForm, &readThumbData, &thumbDataLen);
    OH_UdsContentForm_Destroy(contentForm);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);

    OH_UdsContentForm_Destroy(getContentForm);
    OH_UdmfData_Destroy(readUnifiedData);
    napi_value result;
    napi_create_int32(env, res1 == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_Udmf_AddAndContentForm_002(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    int thumbDataLength = 5;
    OH_UdsContentForm_SetThumbData(contentForm, thumbData, thumbDataLength);
    OH_UdsContentForm_SetDescription(contentForm, "description");
    OH_UdmfRecord_AddContentForm(record, contentForm);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    char key[UDMF_KEY_BUFFER_LEN];

    OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    OH_Udmf_GetUnifiedData(key, intention, readUnifiedData);
    unsigned int count = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(readUnifiedData, &count);
    OH_UdsContentForm *getContentForm = OH_UdsContentForm_Create();
    auto res1 = OH_UdmfRecord_GetContentForm(nullptr, nullptr);
    unsigned char *readThumbData;
    unsigned int thumbDataLen = 0;
    OH_UdsContentForm_GetThumbData(getContentForm, &readThumbData, &thumbDataLen);
    OH_UdsContentForm_Destroy(contentForm);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);

    OH_UdsContentForm_Destroy(getContentForm);
    OH_UdmfData_Destroy(readUnifiedData);
    napi_value result;
    napi_create_int32(env, res1 == UDMF_E_INVALID_PARAM, &result);
    return result;
}
static napi_value OH_Udmf_AddAndContentForm_003(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    int thumbDataLength = 5;
    OH_UdsContentForm_SetThumbData(contentForm, thumbData, thumbDataLength);
    OH_UdsContentForm_SetDescription(contentForm, "description");
    OH_UdmfRecord_AddContentForm(record, contentForm);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    char key[UDMF_KEY_BUFFER_LEN];

    OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    OH_Udmf_GetUnifiedData(key, intention, readUnifiedData);
    unsigned int count = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(readUnifiedData, &count);
    OH_UdsContentForm *getContentForm = OH_UdsContentForm_Create();
    auto res1 = OH_UdmfRecord_GetContentForm(nullptr, getContentForm);
    unsigned char *readThumbData;
    unsigned int thumbDataLen = 0;
    OH_UdsContentForm_GetThumbData(getContentForm, &readThumbData, &thumbDataLen);
    OH_UdsContentForm_Destroy(contentForm);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);

    OH_UdsContentForm_Destroy(getContentForm);
    OH_UdmfData_Destroy(readUnifiedData);
    napi_value result;
    napi_create_int32(env, res1 == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_Udmf_AddAndContentForm_004(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    int thumbDataLength = 5;
    OH_UdsContentForm_SetThumbData(contentForm, thumbData, thumbDataLength);
    OH_UdsContentForm_SetDescription(contentForm, "description");
    auto res =   OH_UdmfRecord_AddContentForm(record, nullptr);

    OH_UdsContentForm_Destroy(contentForm);
    OH_UdmfRecord_Destroy(record);

    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_Udmf_AddAndContentForm_005(napi_env env, napi_callback_info info)
{
    auto res =   OH_UdmfRecord_AddContentForm(nullptr, nullptr);

    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_Udmf_AddAndContentForm_006(napi_env env, napi_callback_info info)
{
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();
    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    int thumbDataLength = 5;
    OH_UdsContentForm_SetThumbData(contentForm, thumbData, thumbDataLength);
    OH_UdsContentForm_SetDescription(contentForm, "description");
    auto res =   OH_UdmfRecord_AddContentForm(nullptr, contentForm);

    OH_UdsContentForm_Destroy(contentForm);

    napi_value result;
    napi_create_int32(env, res == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_Udmf_AddAndContentForm_008(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsContentForm *contentForm = OH_UdsContentForm_Create();

    unsigned char thumbData[] = {0, 1, 2, 3, 4};
    unsigned char appIcon[] = {5, 6, 7, 8, 9};
    int thumbDataLength = 5;
    OH_UdsContentForm_SetThumbData(contentForm, thumbData, thumbDataLength);
    OH_UdsContentForm_SetDescription(contentForm, "description");
    OH_UdsContentForm_SetLinkUri(contentForm, "link url");
    OH_UdsContentForm_SetTitle(contentForm, "tittle");
    OH_UdsContentForm_SetAppName(contentForm, "appName");
    int appIconLength = 5;
    OH_UdsContentForm_SetAppIcon(contentForm, appIcon, appIconLength);

    OH_UdmfRecord_AddContentForm(record, contentForm);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    char key[UDMF_KEY_BUFFER_LEN];

    OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    OH_Udmf_GetUnifiedData(key, intention, readUnifiedData);
    unsigned int count = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(readUnifiedData, &count);
    OH_UdsContentForm *getContentForm = OH_UdsContentForm_Create();
    OH_UdmfRecord_GetContentForm(getRecords[0], getContentForm);
    unsigned char *readThumbData;
    unsigned int thumbDataLen = 0;
    auto res4 = OH_UdsContentForm_GetThumbData(getContentForm, &readThumbData, &thumbDataLen);
    const char* res = OH_UdsContentForm_GetLinkUri(getContentForm);
    const char* res1 = OH_UdsContentForm_GetAppName(getContentForm);
    unsigned char *readAppIcon;
    unsigned int appIconLen = 0;
    auto res5 = OH_UdsContentForm_GetAppIcon(getContentForm, &readAppIcon, &appIconLen);
    const char* res2 = OH_UdsContentForm_GetTitle(getContentForm);
    const char* res3 = OH_UdsContentForm_GetDescription(getContentForm);

    napi_value result;
    napi_create_int32(env, thumbDataLen == thumbDataLength && res4 == UDMF_E_OK &&
     appIconLen == appIconLength && res5 == UDMF_E_OK && strcmp(res3, "description") == PARAM_0 &&
     strcmp(res2, "tittle") == PARAM_0 && strcmp(res1, "appName") == PARAM_0 &&
     strcmp(res, "link url") == PARAM_0, &result);
    OH_UdsContentForm_Destroy(contentForm);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);

    OH_UdsContentForm_Destroy(getContentForm);
    OH_UdmfData_Destroy(readUnifiedData);
    return result;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_UdsContentForm_Create_001", nullptr, OH_UdsContentForm_Create_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetType_001", nullptr, OH_UdsContentForm_GetType_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetType_002", nullptr, OH_UdsContentForm_GetType_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetThumbData_001", nullptr, OH_UdsContentForm_SetThumbData_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetThumbData_002", nullptr, OH_UdsContentForm_SetThumbData_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetThumbData_003", nullptr, OH_UdsContentForm_SetThumbData_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetThumbData_004", nullptr, OH_UdsContentForm_SetThumbData_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetThumbData_005", nullptr, OH_UdsContentForm_SetThumbData_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetThumbData_001", nullptr, OH_UdsContentForm_GetThumbData_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetThumbData_002", nullptr, OH_UdsContentForm_GetThumbData_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetThumbData_003", nullptr, OH_UdsContentForm_GetThumbData_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetThumbData_004", nullptr, OH_UdsContentForm_GetThumbData_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetDescription_001", nullptr, OH_UdsContentForm_SetDescription_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetDescription_002", nullptr, OH_UdsContentForm_SetDescription_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetDescription_003", nullptr, OH_UdsContentForm_SetDescription_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetDescription_004", nullptr, OH_UdsContentForm_SetDescription_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetDescription_005", nullptr, OH_UdsContentForm_SetDescription_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetDescription_006", nullptr, OH_UdsContentForm_SetDescription_006, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetDescription_001", nullptr, OH_UdsContentForm_GetDescription_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetDescription_002", nullptr, OH_UdsContentForm_GetDescription_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetTitle_001", nullptr, OH_UdsContentForm_SetTitle_001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetTitle_002", nullptr, OH_UdsContentForm_SetTitle_002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetTitle_003", nullptr, OH_UdsContentForm_SetTitle_003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetTitle_004", nullptr, OH_UdsContentForm_SetTitle_004, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetTitle_005", nullptr, OH_UdsContentForm_SetTitle_005, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetTitle_006", nullptr, OH_UdsContentForm_SetTitle_006, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetTitle_001", nullptr, OH_UdsContentForm_GetTitle_001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetTitle_002", nullptr, OH_UdsContentForm_GetTitle_002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetAppIcon_001", nullptr, OH_UdsContentForm_SetAppIcon_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetAppIcon_002", nullptr, OH_UdsContentForm_SetAppIcon_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetAppIcon_003", nullptr, OH_UdsContentForm_SetAppIcon_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetAppIcon_004", nullptr, OH_UdsContentForm_SetAppIcon_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetAppIcon_005", nullptr, OH_UdsContentForm_SetAppIcon_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetAppIcon_001", nullptr, OH_UdsContentForm_GetAppIcon_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetAppIcon_002", nullptr, OH_UdsContentForm_GetAppIcon_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetAppIcon_003", nullptr, OH_UdsContentForm_GetAppIcon_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetAppIcon_004", nullptr, OH_UdsContentForm_GetAppIcon_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetAppName_001", nullptr, OH_UdsContentForm_SetAppName_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetAppName_002", nullptr, OH_UdsContentForm_SetAppName_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetAppName_003", nullptr, OH_UdsContentForm_SetAppName_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetAppName_004", nullptr, OH_UdsContentForm_SetAppName_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetAppName_001", nullptr, OH_UdsContentForm_GetAppName_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetAppName_002", nullptr, OH_UdsContentForm_GetAppName_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetLinkUri_001", nullptr, OH_UdsContentForm_SetLinkUri_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetLinkUri_002", nullptr, OH_UdsContentForm_SetLinkUri_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetLinkUri_003", nullptr, OH_UdsContentForm_SetLinkUri_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetLinkUri_004", nullptr, OH_UdsContentForm_SetLinkUri_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetLinkUri_005", nullptr, OH_UdsContentForm_SetLinkUri_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_SetLinkUri_006", nullptr, OH_UdsContentForm_SetLinkUri_006, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetLinkUri_001", nullptr, OH_UdsContentForm_GetLinkUri_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsContentForm_GetLinkUri_003", nullptr, OH_UdsContentForm_GetLinkUri_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndContentForm_001", nullptr, OH_Udmf_AddAndContentForm_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndContentForm_007", nullptr, OH_Udmf_AddAndContentForm_007, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndContentForm_002", nullptr, OH_Udmf_AddAndContentForm_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndContentForm_003", nullptr, OH_Udmf_AddAndContentForm_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndContentForm_004", nullptr, OH_Udmf_AddAndContentForm_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndContentForm_005", nullptr, OH_Udmf_AddAndContentForm_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndContentForm_006", nullptr, OH_Udmf_AddAndContentForm_006, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndContentForm_008", nullptr, OH_Udmf_AddAndContentForm_008, nullptr,
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
    .nm_modname = "UdsConetformNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}



