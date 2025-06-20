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

#define PARAM_0 0
#define PARAM_1 1

static napi_value OH_UdsPlainText_GetType_0100(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    const char *pt = OH_UdsPlainText_GetType(plainText);

    napi_value result = nullptr;
    napi_create_int32(env, pt == nullptr, &result);

    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_SetContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    int ret = OH_UdsPlainText_SetContent(plainText, "doing something");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_SetContent_002(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    int ret = OH_UdsPlainText_SetContent(plainText, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_SetContent_003(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    int ret = OH_UdsPlainText_SetContent(plainText, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_SetContent_004(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    int ret = OH_UdsPlainText_SetContent(plainText, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_SetContent_005(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    int ret = OH_UdsPlainText_SetContent(plainText, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_GetContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetContent(plainText, "");
    const char *pContent = OH_UdsPlainText_GetContent(plainText);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pContent, "") == PARAM_0, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}
static napi_value OH_UdsPlainText_GetContent_002(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    const char *pContent = OH_UdsPlainText_GetContent(plainText);

    napi_value result = nullptr;
    napi_create_int32(env, pContent == nullptr, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}
static napi_value OH_UdsPlainText_GetContent_003(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    const char *pContent = OH_UdsPlainText_GetContent(plainText);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pContent, "") == PARAM_0, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}
static napi_value OH_UdsPlainText_SetAbstract_001(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    int ret = OH_UdsPlainText_SetAbstract(plainText, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_SetAbstract_002(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    int ret = OH_UdsPlainText_SetAbstract(plainText, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_SetAbstract_003(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    int ret = OH_UdsPlainText_SetAbstract(plainText, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_SetAbstract_004(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    int ret = OH_UdsPlainText_SetAbstract(plainText, "doing something");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_SetAbstract_005(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    int ret = OH_UdsPlainText_SetAbstract(plainText, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_GetAbstract_001(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetAbstract(plainText, "");

    const char *pt = OH_UdsPlainText_GetAbstract(plainText);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, "") == PARAM_0, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}
static napi_value OH_UdsPlainText_GetAbstract_002(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();

    const char *pt = OH_UdsPlainText_GetAbstract(plainText);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, "") == PARAM_0, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}
static napi_value OH_UdsPlainText_GetAbstract_003(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;

    const char *pt = OH_UdsPlainText_GetAbstract(plainText);
    napi_value result = nullptr;
    napi_create_int32(env, pt == nullptr, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsHyperlink_GetType_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    const char *pt = OH_UdsHyperlink_GetType(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, pt == nullptr, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_SetUrl_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    int ret = OH_UdsHyperlink_SetUrl(pHyperlink, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_SetUrl_002(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    int ret = OH_UdsHyperlink_SetUrl(pHyperlink, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_SetUrl_003(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    int ret = OH_UdsHyperlink_SetUrl(pHyperlink, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_SetUrl_004(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    int ret = OH_UdsHyperlink_SetUrl(pHyperlink, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_SetUrl_005(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    int ret = OH_UdsHyperlink_SetUrl(pHyperlink, "www.xxx.com");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_GetUrl_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    OH_UdsHyperlink_SetUrl(pHyperlink, "");
    const char *ph = OH_UdsHyperlink_GetUrl(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(ph, "") == PARAM_0, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_GetUrl_002(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    const char *ph = OH_UdsHyperlink_GetUrl(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, ph == nullptr, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}
static napi_value OH_UdsHyperlink_GetUrl_003(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    const char *ph = OH_UdsHyperlink_GetUrl(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(ph, "") == PARAM_0, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_SetDescription_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    int ret = OH_UdsHyperlink_SetDescription(pHyperlink, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}
static napi_value OH_UdsHyperlink_SetDescription_002(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    int ret = OH_UdsHyperlink_SetDescription(pHyperlink, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_SetDescription_003(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    int ret = OH_UdsHyperlink_SetDescription(pHyperlink, "doing something");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_SetDescription_004(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    int ret = OH_UdsHyperlink_SetDescription(pHyperlink, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_GetDescription_005(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    const char *ph = OH_UdsHyperlink_GetDescription(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, ph == nullptr, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_GetDescription_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    OH_UdsHyperlink_SetDescription(pHyperlink, "");
    const char *ph = OH_UdsHyperlink_GetDescription(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(ph, "") == PARAM_0, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}
static napi_value OH_UdsHyperlink_GetDescription_002(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    const char *ph = OH_UdsHyperlink_GetDescription(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, ph == nullptr, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}
static napi_value OH_UdsHyperlink_GetDescription_003(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    const char *ph = OH_UdsHyperlink_GetDescription(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(ph, "") == PARAM_0, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHtml_GetType_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    const char *pt = OH_UdsHtml_GetType(html);

    napi_value result = nullptr;
    napi_create_int32(env, pt == nullptr, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    int ret = OH_UdsHtml_SetContent(html, "");
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetContent_002(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    int ret = OH_UdsHtml_SetContent(html, "");
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetContent_003(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    int ret = OH_UdsHtml_SetContent(html, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetContent_004(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    int ret = OH_UdsHtml_SetContent(html, "htmlxxx");
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetContent_005(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    int ret = OH_UdsHtml_SetContent(html, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_GetContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    OH_UdsHtml_SetContent(html, "");
    const char *pt = OH_UdsHtml_GetContent(html);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, "") == PARAM_0, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_GetContent_002(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    const char *pt = OH_UdsHtml_GetContent(html);

    napi_value result = nullptr;
    napi_create_int32(env, pt == nullptr, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}
static napi_value OH_UdsHtml_GetContent_003(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    const char *pt = OH_UdsHtml_GetContent(html);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, "") == PARAM_0, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}
static napi_value OH_UdsHtml_SetPlainContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    int ret = OH_UdsHtml_SetPlainContent(html, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetPlainContent_002(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    int ret = OH_UdsHtml_SetPlainContent(html, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetPlainContent_003(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    int ret = OH_UdsHtml_SetPlainContent(html, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetPlainContent_004(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    int ret = OH_UdsHtml_SetPlainContent(html, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetPlainContent_005(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    int ret = OH_UdsHtml_SetPlainContent(html, "doing something");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_GetPlainContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    OH_UdsHtml_SetPlainContent(html, "");
    const char *pt = OH_UdsHtml_GetPlainContent(html);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, "") == PARAM_0, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_GetPlainContent_002(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    const char *pt = OH_UdsHtml_GetPlainContent(html);

    napi_value result = nullptr;
    napi_create_int32(env, pt == nullptr, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_GetPlainContent_003(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    const char *pt = OH_UdsHtml_GetPlainContent(html);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, "") == PARAM_0, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsAppItem_GetType_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    const char *pt = OH_UdsAppItem_GetType(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, pt == nullptr, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetId(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetId_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetId(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_SetId_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetId(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_SetId_004(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetId(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_SetId_005(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetId(appItem, "com.xxx");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_GetId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetId(appItem, "");
    const char *pu = OH_UdsAppItem_GetId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_GetId_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    const char *pu = OH_UdsAppItem_GetId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, pu == nullptr, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetId_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    const char *pu = OH_UdsAppItem_GetId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetName(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetName_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetName(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetName_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetName(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetName_004(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetName(appItem, "OH");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_SetName_005(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetName(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetName(appItem, "");
    const char *pu = OH_UdsAppItem_GetName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetName_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    const char *pu = OH_UdsAppItem_GetName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetName_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    const char *pu = OH_UdsAppItem_GetName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, pu == nullptr, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetIconId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetIconId(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_SetIconId_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetIconId(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_SetIconId_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetIconId(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_SetIconId_004(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetIconId(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetIconId_005(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetIconId(appItem, "icon");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetIconId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetIconId(appItem, "");
    const char *pu = OH_UdsAppItem_GetIconId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetIconId_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    const char *pu = OH_UdsAppItem_GetIconId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, pu == nullptr, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetIconId_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    const char *pu = OH_UdsAppItem_GetIconId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetLabelId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetLabelId(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetLabelId_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetLabelId(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetLabelId_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetLabelId(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetLabelId_004(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetLabelId(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetLabelId_005(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetLabelId(appItem, "label");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetLabelId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetLabelId(appItem, "");
    const char *pu = OH_UdsAppItem_GetLabelId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetLabelId_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    const char *pu = OH_UdsAppItem_GetLabelId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, pu == nullptr, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetLabelId_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    const char *pu = OH_UdsAppItem_GetLabelId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetBundleName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetBundleName(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetBundleName_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetBundleName(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetBundleName_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetBundleName(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetBundleName_004(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetBundleName(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetBundleName_005(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetBundleName(appItem, "bundle");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetBundleName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetBundleName(appItem, "");
    const char *pu = OH_UdsAppItem_GetBundleName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_GetBundleName_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    const char *pu = OH_UdsAppItem_GetBundleName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, pu == nullptr, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_GetBundleName_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    const char *pu = OH_UdsAppItem_GetBundleName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetAbilityName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetAbilityName(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetAbilityName_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetAbilityName(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetAbilityName_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetAbilityName(appItem, "");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetAbilityName_004(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetAbilityName(appItem, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_SetAbilityName_005(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    int ret = OH_UdsAppItem_SetAbilityName(appItem, "ability");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetAbilityName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetAbilityName(appItem, "");
    const char *pu = OH_UdsAppItem_GetAbilityName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}
static napi_value OH_UdsAppItem_GetAbilityName_002(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    const char *pu = OH_UdsAppItem_GetAbilityName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, pu == nullptr, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetAbilityName_003(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    const char *pu = OH_UdsAppItem_GetAbilityName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value Init1(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_UdsHyperlink_SetUrl_005", nullptr, OH_UdsHyperlink_SetUrl_005, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_GetUrl_001", nullptr, OH_UdsHyperlink_GetUrl_001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_GetUrl_002", nullptr, OH_UdsHyperlink_GetUrl_002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_GetUrl_003", nullptr, OH_UdsHyperlink_GetUrl_003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_SetDescription_001", nullptr, OH_UdsHyperlink_SetDescription_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_SetDescription_002", nullptr, OH_UdsHyperlink_SetDescription_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_SetDescription_003", nullptr, OH_UdsHyperlink_SetDescription_003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_SetDescription_004", nullptr, OH_UdsHyperlink_SetDescription_004,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_GetDescription_005", nullptr, OH_UdsHyperlink_GetDescription_005,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_GetDescription_001", nullptr, OH_UdsHyperlink_GetDescription_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_GetDescription_002", nullptr, OH_UdsHyperlink_GetDescription_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_GetDescription_003", nullptr, OH_UdsHyperlink_GetDescription_003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_GetType_001", nullptr, OH_UdsHtml_GetType_001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetContent_001", nullptr, OH_UdsHtml_SetContent_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetContent_002", nullptr, OH_UdsHtml_SetContent_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetContent_003", nullptr, OH_UdsHtml_SetContent_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetContent_004", nullptr, OH_UdsHtml_SetContent_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetContent_005", nullptr, OH_UdsHtml_SetContent_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_GetContent_001", nullptr, OH_UdsHtml_GetContent_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_GetContent_002", nullptr, OH_UdsHtml_GetContent_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_GetContent_003", nullptr, OH_UdsHtml_GetContent_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetPlainContent_001", nullptr, OH_UdsHtml_SetPlainContent_001,
         nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
static napi_value Init2(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_UdsHtml_SetPlainContent_002", nullptr, OH_UdsHtml_SetPlainContent_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetPlainContent_003", nullptr, OH_UdsHtml_SetPlainContent_003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetPlainContent_004", nullptr, OH_UdsHtml_SetPlainContent_004,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetPlainContent_005", nullptr, OH_UdsHtml_SetPlainContent_005,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_GetPlainContent_001", nullptr, OH_UdsHtml_GetPlainContent_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_GetPlainContent_002", nullptr, OH_UdsHtml_GetPlainContent_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_GetPlainContent_003", nullptr, OH_UdsHtml_GetPlainContent_003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetType_001", nullptr, OH_UdsAppItem_GetType_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetId_001", nullptr, OH_UdsAppItem_SetId_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetId_002", nullptr, OH_UdsAppItem_SetId_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetId_003", nullptr, OH_UdsAppItem_SetId_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetId_004", nullptr, OH_UdsAppItem_SetId_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetId_005", nullptr, OH_UdsAppItem_SetId_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetId_001", nullptr, OH_UdsAppItem_GetId_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetId_002", nullptr, OH_UdsAppItem_GetId_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetId_003", nullptr, OH_UdsAppItem_GetId_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetName_001", nullptr, OH_UdsAppItem_SetName_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetName_002", nullptr, OH_UdsAppItem_SetName_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetName_003", nullptr, OH_UdsAppItem_SetName_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetName_004", nullptr, OH_UdsAppItem_SetName_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetName_005", nullptr, OH_UdsAppItem_SetName_005, nullptr,
         nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
static napi_value Init3(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_UdsAppItem_GetName_001", nullptr, OH_UdsAppItem_GetName_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetName_002", nullptr, OH_UdsAppItem_GetName_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetName_003", nullptr, OH_UdsAppItem_GetName_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetIconId_001", nullptr, OH_UdsAppItem_SetIconId_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetIconId_002", nullptr, OH_UdsAppItem_SetIconId_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetIconId_003", nullptr, OH_UdsAppItem_SetIconId_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetIconId_004", nullptr, OH_UdsAppItem_SetIconId_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetIconId_005", nullptr, OH_UdsAppItem_SetIconId_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetIconId_001", nullptr, OH_UdsAppItem_GetIconId_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetIconId_002", nullptr, OH_UdsAppItem_GetIconId_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetIconId_003", nullptr, OH_UdsAppItem_GetIconId_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetLabelId_001", nullptr, OH_UdsAppItem_SetLabelId_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetLabelId_002", nullptr, OH_UdsAppItem_SetLabelId_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetLabelId_003", nullptr, OH_UdsAppItem_SetLabelId_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetLabelId_004", nullptr, OH_UdsAppItem_SetLabelId_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetLabelId_005", nullptr, OH_UdsAppItem_SetLabelId_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetLabelId_001", nullptr, OH_UdsAppItem_GetLabelId_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetLabelId_002", nullptr, OH_UdsAppItem_GetLabelId_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetLabelId_003", nullptr, OH_UdsAppItem_GetLabelId_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetBundleName_001", nullptr, OH_UdsAppItem_SetIconId_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetBundleName_002", nullptr, OH_UdsAppItem_SetBundleName_002, nullptr,
         nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
static napi_value Init4(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_UdsAppItem_SetBundleName_003", nullptr, OH_UdsAppItem_SetBundleName_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetBundleName_004", nullptr, OH_UdsAppItem_SetBundleName_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetBundleName_005", nullptr, OH_UdsAppItem_SetBundleName_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetBundleName_001", nullptr, OH_UdsAppItem_GetBundleName_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetBundleName_002", nullptr, OH_UdsAppItem_GetBundleName_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetBundleName_003", nullptr, OH_UdsAppItem_GetBundleName_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetAbilityName_001", nullptr, OH_UdsAppItem_SetAbilityName_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetAbilityName_002", nullptr, OH_UdsAppItem_SetAbilityName_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetAbilityName_003", nullptr, OH_UdsAppItem_SetAbilityName_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetAbilityName_004", nullptr, OH_UdsAppItem_SetAbilityName_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetAbilityName_005", nullptr, OH_UdsAppItem_SetAbilityName_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetAbilityName_001", nullptr, OH_UdsAppItem_GetAbilityName_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetAbilityName_002", nullptr, OH_UdsAppItem_GetAbilityName_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetAbilityName_003", nullptr, OH_UdsAppItem_GetAbilityName_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_SetUrl_003", nullptr, OH_UdsHyperlink_SetUrl_003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_SetUrl_004", nullptr, OH_UdsHyperlink_SetUrl_004, nullptr, nullptr,
         nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_UdsPlainText_GetType_0100", nullptr, OH_UdsPlainText_GetType_0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetContent_001", nullptr, OH_UdsPlainText_SetContent_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetContent_002", nullptr, OH_UdsPlainText_SetContent_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetContent_003", nullptr, OH_UdsPlainText_SetContent_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetContent_004", nullptr, OH_UdsPlainText_SetContent_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetContent_005", nullptr, OH_UdsPlainText_SetContent_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_GetContent_001", nullptr, OH_UdsPlainText_GetContent_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_GetContent_002", nullptr, OH_UdsPlainText_GetContent_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_GetContent_003", nullptr, OH_UdsPlainText_GetContent_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetAbstract_001", nullptr, OH_UdsPlainText_SetAbstract_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetAbstract_002", nullptr, OH_UdsPlainText_SetAbstract_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetAbstract_003", nullptr, OH_UdsPlainText_SetAbstract_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetAbstract_004", nullptr, OH_UdsPlainText_SetAbstract_004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetAbstract_005", nullptr, OH_UdsPlainText_SetAbstract_005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_GetAbstract_001", nullptr, OH_UdsPlainText_GetAbstract_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_GetAbstract_002", nullptr, OH_UdsPlainText_GetAbstract_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_GetAbstract_003", nullptr, OH_UdsPlainText_GetAbstract_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_GetType_001", nullptr, OH_UdsHyperlink_GetType_001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_SetUrl_001", nullptr, OH_UdsHyperlink_SetUrl_001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_SetUrl_002", nullptr, OH_UdsHyperlink_SetUrl_002, nullptr, nullptr,
         nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    Init1(env, exports);
    Init2(env, exports);
    Init3(env, exports);
    Init4(env, exports);
    return exports;
}
    EXTERN_C_END

    static napi_module demoModule = {
        .nm_version = 1,
        .nm_flags = 0,
        .nm_filename = nullptr,
        .nm_register_func = Init,
        .nm_modname = "UdsNdkex",
        .nm_priv = ((void *)0),
        .reserved = {0},
    };

    extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
