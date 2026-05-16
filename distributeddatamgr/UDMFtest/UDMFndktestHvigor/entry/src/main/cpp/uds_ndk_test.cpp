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

const unsigned int EXPECTED_COUNT_TWO = 2;
// 1. PlainText=================================================
static napi_value OH_UdsPlainText_Create_0100(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();

    napi_value result = nullptr;
    napi_create_int32(env, plainText != nullptr, &result);

    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_Destroy_0100(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_Destroy(plainText);

    napi_value result = nullptr;
    napi_create_int32(env, plainText != nullptr, &result);
    return result;
}

static napi_value OH_UdsPlainText_GetType_0100(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    const char *pt = OH_UdsPlainText_GetType(plainText);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, UDMF_META_PLAIN_TEXT) == PARAM_0, &result);

    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_SetContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    int ret = OH_UdsPlainText_SetContent(plainText, "doing something");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_GetContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetContent(plainText, "doing something");
    const char *pContent = OH_UdsPlainText_GetContent(plainText);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pContent, "doing something") == PARAM_0, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_SetAbstract_001(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    int ret = OH_UdsPlainText_SetAbstract(plainText, "doing something");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

static napi_value OH_UdsPlainText_GetAbstract_001(napi_env env, napi_callback_info info)
{
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetAbstract(plainText, "doing something");

    const char *pt = OH_UdsPlainText_GetAbstract(plainText);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, "doing something") == PARAM_0, &result);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

// 2. Hyperlink ========================================================
static napi_value OH_UdsHyperlink_Create_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();

    napi_value result = nullptr;
    napi_create_int32(env, pHyperlink != nullptr, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_Destroy_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    OH_UdsHyperlink_Destroy(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, pHyperlink != nullptr, &result);
    
    return result;
}
static napi_value OH_UdsHyperlink_GetType_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    const char *pt = OH_UdsHyperlink_GetType(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, UDMF_META_HYPERLINK) == PARAM_0, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_SetUrl_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    int ret = OH_UdsHyperlink_SetUrl(pHyperlink, "www.xxx.com");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_GetUrl_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    OH_UdsHyperlink_SetUrl(pHyperlink, "www.xxx.com");
    const char *ph = OH_UdsHyperlink_GetUrl(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(ph, "www.xxx.com") == PARAM_0, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_SetDescription_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    int ret = OH_UdsHyperlink_SetDescription(pHyperlink, "doing something");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

static napi_value OH_UdsHyperlink_GetDescription_001(napi_env env, napi_callback_info info)
{
    OH_UdsHyperlink* pHyperlink = nullptr;
    pHyperlink = OH_UdsHyperlink_Create();
    OH_UdsHyperlink_SetDescription(pHyperlink, "doing something");
    const char *ph = OH_UdsHyperlink_GetDescription(pHyperlink);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(ph, "doing something") == PARAM_0, &result);
    OH_UdsHyperlink_Destroy(pHyperlink);
    return result;
}

// 3.html ========================================================
static napi_value OH_UdsHtml_Create_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();

    napi_value result = nullptr;
    napi_create_int32(env, html != nullptr, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_Destroy_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    OH_UdsHtml_Destroy(html);

    napi_value result = nullptr;
    napi_create_int32(env, html != nullptr, &result);
    
    return result;
}

static napi_value OH_UdsHtml_GetType_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    const char *pt = OH_UdsHtml_GetType(html);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, UDMF_META_HTML) == PARAM_0, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    int ret = OH_UdsHtml_SetContent(html, "htmlxxx");
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_GetContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    OH_UdsHtml_SetContent(html, "htmlxxx");
    const char *pt = OH_UdsHtml_GetContent(html);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, "htmlxxx") == PARAM_0, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetPlainContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    int ret = OH_UdsHtml_SetPlainContent(html, "doing something");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_GetPlainContent_001(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    OH_UdsHtml_SetPlainContent(html, "doing something");
    const char *pt = OH_UdsHtml_GetPlainContent(html);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, "doing something") == PARAM_0, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

// 4. AppItem ========================================================
static napi_value OH_UdsAppItem_Create_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();

    napi_value result = nullptr;
    napi_create_int32(env, appItem != nullptr, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_Destroy_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_Destroy(appItem);
    napi_value result = nullptr;
    napi_create_int32(env, appItem != nullptr, &result);
    return result;
}

static napi_value OH_UdsAppItem_GetType_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    const char *pt = OH_UdsAppItem_GetType(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pt, UDMF_META_OPENHARMONY_APP_ITEM) == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetId(appItem, "com.xxx");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetId(appItem, "com.xxx");
    const char *pu = OH_UdsAppItem_GetId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "com.xxx") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetName(appItem, "OH");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetName(appItem, "OH");
    const char *pu = OH_UdsAppItem_GetName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "OH") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetIconId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetIconId(appItem, "icon");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}


static napi_value OH_UdsAppItem_GetIconId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetIconId(appItem, "icon");
    const char *pu = OH_UdsAppItem_GetIconId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "icon") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetLabelId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetLabelId(appItem, "label");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}


static napi_value OH_UdsAppItem_GetLabelId_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetLabelId(appItem, "label");
    const char *pu = OH_UdsAppItem_GetLabelId(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "label") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}


static napi_value OH_UdsAppItem_SetBundleName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetBundleName(appItem, "bundle");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}


static napi_value OH_UdsAppItem_GetBundleName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetBundleName(appItem, "bundle");
    const char *pu = OH_UdsAppItem_GetBundleName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "bundle") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_SetAbilityName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    int ret = OH_UdsAppItem_SetAbilityName(appItem, "ability");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

static napi_value OH_UdsAppItem_GetAbilityName_001(napi_env env, napi_callback_info info)
{
    OH_UdsAppItem* appItem = nullptr;
    appItem = OH_UdsAppItem_Create();
    OH_UdsAppItem_SetAbilityName(appItem, "ability");
    const char *pu = OH_UdsAppItem_GetAbilityName(appItem);

    napi_value result = nullptr;
    napi_create_int32(env, strcmp(pu, "ability") == PARAM_0, &result);
    OH_UdsAppItem_Destroy(appItem);
    return result;
}

//======OH_UdsDetails=========================================================
static napi_value OH_UdsDetails_HasKey_001(napi_env env, napi_callback_info info)
{
    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create fail.");

    int result = OH_UdsDetails_SetValue(details, "detailsKey", "detailsValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue fail.");

    bool bkey = OH_UdsDetails_HasKey(nullptr, "detailsKey");
    NAPI_ASSERT(env, bkey == false, "OH_UdsDetails_HasKey  e1 fail.");

    bkey = OH_UdsDetails_HasKey(details, nullptr);
    NAPI_ASSERT(env, bkey == false, "OH_UdsDetails_HasKey e2 fail.");

    bkey = OH_UdsDetails_HasKey(details, "unkownKey");
    NAPI_ASSERT(env, bkey == false, "OH_UdsDetails_HasKey e3  fail.");

    bkey = OH_UdsDetails_HasKey(details, "detailsKey");
    NAPI_ASSERT(env, bkey == true, "OH_UdsDetails_HasKey true fail.");

    OH_UdsDetails_Destroy(nullptr);
    OH_UdsDetails_Destroy(details);

    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}

static napi_value OH_UdsDetails_Remove_001(napi_env env, napi_callback_info info)
{
    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create fail.");

    int result = OH_UdsDetails_SetValue(details, "detailsKey", "detailsValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue fail.");
    result = OH_UdsDetails_SetValue(details, "detailsKey1", "detailsValue1");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue 1 fail.");

    result = OH_UdsDetails_Remove(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsDetails_Remove e1 fail.");
    result = OH_UdsDetails_Remove(details, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsDetails_Remove e2 fail.");

    result = OH_UdsDetails_Remove(details, "details");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_Remove ok fail.");
    result = OH_UdsDetails_Remove(details, "detailsKey");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_Remove ok fail.");

    OH_UdsDetails_Destroy(details);

    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}

static napi_value OH_UdsDetails_Clear_001(napi_env env, napi_callback_info info)
{
    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create fail.");

    int result = OH_UdsDetails_SetValue(details, "detailsKey", "detailsValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue fail.");

    result = OH_UdsDetails_Clear(nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsDetails_Clear nullptr fail.");
    result = OH_UdsDetails_Clear(details);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_Clear nullptr fail.");

    OH_UdsDetails_Destroy(details);
    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}

static napi_value OH_UdsDetails_SetValue_001(napi_env env, napi_callback_info info)
{
    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create fail.");

    int result = OH_UdsDetails_SetValue(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsDetails_SetValue e1 fail.");
    result = OH_UdsDetails_SetValue(details, nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsDetails_SetValue e2 fail.");
    result = OH_UdsDetails_SetValue(details, "detailsKey", nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsDetails_SetValue e3 fail.");
    result = OH_UdsDetails_SetValue(details, "", "detailsValue");
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsDetails_SetValue e3 fail.");

    result = OH_UdsDetails_SetValue(details, "detailsKey", "detailsValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue e3 fail.");

    OH_UdsDetails_Destroy(details);
    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}

static napi_value OH_UdsDetails_GetValue_001(napi_env env, napi_callback_info info)
{
    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create fail.");

    int result = OH_UdsDetails_SetValue(details, "detailsKey", "detailsValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue fail.");

    auto ret = OH_UdsDetails_GetValue(nullptr, nullptr);
    NAPI_ASSERT(env, ret == nullptr, "OH_UdsDetails_GetValue e1 fail.");
    ret = OH_UdsDetails_GetValue(details, nullptr);
    NAPI_ASSERT(env, ret == nullptr, "OH_UdsDetails_GetValue e2 fail.");
    ret = OH_UdsDetails_GetValue(details, "details");
    NAPI_ASSERT(env, ret == nullptr, "OH_UdsDetails_GetValue e3 fail.");
    
    ret = OH_UdsDetails_GetValue(details, "detailsKey");
    NAPI_ASSERT(env, ret != nullptr, "OH_UdsDetails_GetValue ok fail.");
    NAPI_ASSERT(env, strcmp(ret, "detailsValue") == 0, "OH_UdsDetails_GetValue  ok2 fail.");

    result = OH_UdsDetails_SetValue(details, "detailsKey", "detailsValueRepeate");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue 222 fail.");

    ret = OH_UdsDetails_GetValue(details, "detailsKey");
    NAPI_ASSERT(env, ret != nullptr, "OH_UdsDetails_GetValue ok 222 fail.");
    NAPI_ASSERT(env, strcmp(ret, "detailsValueRepeate") == 0, "OH_UdsDetails_GetValue  ok2  222 fail.");

    OH_UdsDetails_Destroy(details);
    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}

static napi_value OH_UdsDetails_GetAllKeys_001(napi_env env, napi_callback_info info)
{
    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create fail.");

    int result = OH_UdsDetails_SetValue(details, "detailsKey", "detailsValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue fail.");

    unsigned int count = 0;
    char **keys1 = OH_UdsDetails_GetAllKeys(nullptr, &count);
    NAPI_ASSERT(env, keys1 == nullptr, "OH_UdsDetails_GetAllKeys e1 fail.");
    char **keys2 = OH_UdsDetails_GetAllKeys(details, nullptr);
    NAPI_ASSERT(env, keys2 == nullptr, "OH_UdsDetails_GetAllKeys e2 fail.");

    char **keys3 = OH_UdsDetails_GetAllKeys(details, &count);
    NAPI_ASSERT(env, keys3 != nullptr, "OH_UdsDetails_GetAllKeys ok fail.");
    NAPI_ASSERT(env, strcmp(keys3[0], "detailsKey") == 0, "OH_UdsDetails_GetAllKeys ok 2 fail.");
    NAPI_ASSERT(env, count == 1, "OH_UdsDetails_GetAllKeys ok 3 fail.");

    char **keys4 = OH_UdsDetails_GetAllKeys(details, &count);
    NAPI_ASSERT(env, keys4 != nullptr, "OH_UdsDetails_GetAllKeys k4 fail.");

    result = OH_UdsDetails_SetValue(details, "detailsKey1", "detailsValue1");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue fail.");

    char **keys5 = OH_UdsDetails_GetAllKeys(details, &count);
    NAPI_ASSERT(env, keys5 != nullptr, "OH_UdsDetails_GetAllKeys k5 fail.");
    NAPI_ASSERT(env, strcmp(keys5[0], "detailsKey") == 0, "OH_UdsDetails_GetAllKeys k5 fail.");
    NAPI_ASSERT(env, strcmp(keys5[1], "detailsKey1") == 0, "OH_UdsDetails_GetAllKeys k5 fail.");
    NAPI_ASSERT(env, count == EXPECTED_COUNT_TWO, "OH_UdsDetails_GetAllKeys k5 fail.");

    char **keys6 = OH_UdsDetails_GetAllKeys(details, &count);
    NAPI_ASSERT(env, keys6 != nullptr, "OH_UdsDetails_GetAllKeys k6 fail.");
    NAPI_ASSERT(env, count == EXPECTED_COUNT_TWO, "OH_UdsDetails_GetAllKeys k6 fail.");

    OH_UdsDetails_Destroy(details);
    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}

static napi_value OH_UdsPlainText_SetDetails_001(napi_env env, napi_callback_info info)
{
    int result = OH_UdsPlainText_SetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPlainText_SetDetails e1 fail.");
    result = OH_UdsPlainText_GetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPlainText_GetDetails e1 fail.");
    
    OH_UdsPlainText* plainText = nullptr;
    plainText = OH_UdsPlainText_Create();
    result = OH_UdsPlainText_SetDetails(plainText, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPlainText_SetDetails e3 fail.");
    result = OH_UdsPlainText_GetDetails(plainText, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPlainText_SetDetails e4 fail.");

    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create fail.");
    result = OH_UdsDetails_SetValue(details, "", "empty");
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsDetails_SetValue empty fail.");
    result = OH_UdsDetails_SetValue(details, "plainTextKey", "plainTextValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue ok fail.");

    result = OH_UdsPlainText_SetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPlainText_SetDetails  e5 fail.");
    result = OH_UdsPlainText_GetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPlainText_SetDetails  e6 fail.");

    result = OH_UdsPlainText_SetDetails(plainText, details);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsPlainText_SetDetails ok fail.");

    OH_UdsDetails* details1 = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details1 != nullptr, "OH_UdsDetails_Create details1 fail.");

    result = OH_UdsPlainText_GetDetails(plainText, details1);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsPlainText_GetDetails details1  fail.");

    unsigned int count = 0;
    char **keys = OH_UdsDetails_GetAllKeys(details1, &count);
    NAPI_ASSERT(env, keys != nullptr, "OH_UdsDetails_GetAllKeys keys fail.");
    NAPI_ASSERT(env, strcmp(keys[0], "plainTextKey") == 0, "OH_UdsDetails_GetAllKeys keys[0] fail.");
    NAPI_ASSERT(env, count == 1, "OH_UdsDetails_GetAllKeys  count fail.");

    OH_UdsDetails_Destroy(details);
    OH_UdsDetails_Destroy(details1);
    OH_UdsPlainText_Destroy(plainText);

    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}

static napi_value OH_UdsHyperlink_SetDetails_001(napi_env env, napi_callback_info info)
{
    int result = OH_UdsHyperlink_SetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHyperlink_SetDetails e1 fail.");
    result = OH_UdsHyperlink_GetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHyperlink_GetDetails e1 fail.");

    OH_UdsHyperlink* hyperlink = OH_UdsHyperlink_Create();
    NAPI_ASSERT(env, hyperlink != nullptr, "OH_UdsHyperlink_Create fail.");

    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create details fail.");

    result = OH_UdsHyperlink_SetDetails(hyperlink, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHyperlink_SetDetails e2 fail.");
    result = OH_UdsHyperlink_GetDetails(hyperlink, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHyperlink_GetDetails e2 fail.");
    result = OH_UdsHyperlink_SetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHyperlink_SetDetails e3 fail.");
    result = OH_UdsHyperlink_GetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHyperlink_GetDetails e3 fail.");

    result = OH_UdsHyperlink_GetDetails(hyperlink, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHyperlink_GetDetails e1 fail.");

    OH_UdsDetails* details1 = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details1 != nullptr, "OH_UdsDetails_Create details1 fail.");

    result = OH_UdsDetails_SetValue(details1, "hyperlinkKey", "hyperlinkValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue details1 fail.");

    result = OH_UdsHyperlink_SetDetails(hyperlink, details1);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsHyperlink_SetDetails details1 fail.");

    result = OH_UdsHyperlink_GetDetails(hyperlink, details);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsHyperlink_GetDetails details1 fail.");

    unsigned int count = 0;
    char **keys = OH_UdsDetails_GetAllKeys(details, &count);
    NAPI_ASSERT(env, keys != nullptr, "OH_UdsDetails_GetAllKeys keys fail.");
    NAPI_ASSERT(env, strcmp(keys[0], "hyperlinkKey") == 0, "OH_UdsDetails_GetAllKeys keys[0] fail.");
    NAPI_ASSERT(env, count == 1, "OH_UdsDetails_GetAllKeys  count fail.");

    OH_UdsDetails_Destroy(details);
    OH_UdsDetails_Destroy(details1);
    OH_UdsHyperlink_Destroy(hyperlink);

    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}


static napi_value OH_UdsHtml_SetDetails_001(napi_env env, napi_callback_info info)
{
    int result = OH_UdsHtml_SetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHtml_SetDetails e1 fail.");
    result = OH_UdsHtml_GetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHtml_GetDetails e1 fail.");

    OH_UdsHtml* html = OH_UdsHtml_Create();
    NAPI_ASSERT(env, html != nullptr, "OH_UdsHtml_Create fail.");

    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create details fail.");

    result = OH_UdsHtml_SetDetails(html, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHtml_SetDetails e2 fail.");
    result = OH_UdsHtml_GetDetails(html, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHtml_GetDetails e2 fail.");
    result = OH_UdsHtml_SetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHtml_SetDetails e3 fail.");
    result = OH_UdsHtml_GetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsHtml_GetDetails e3 fail.");

    result = OH_UdsDetails_SetValue(details, "htmlKey", "htmlValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue htmlKey fail.");
    result = OH_UdsDetails_SetValue(details, "htmlKey1", "htmlValue1");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue htmlKey1 fail.");

    result = OH_UdsHtml_SetDetails(html, details);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue htmlKey1 fail.");

    OH_UdsDetails* details1 = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details1 != nullptr, "OH_UdsDetails_Create details1 fail.");

    result = OH_UdsHtml_GetDetails(html, details1);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsHtml_GetDetails details1 fail.");

    unsigned int count = 0;
    char **keys = OH_UdsDetails_GetAllKeys(details1, &count);
    NAPI_ASSERT(env, keys != nullptr, "OH_UdsDetails_GetAllKeys keys fail.");
    NAPI_ASSERT(env, strcmp(keys[0], "htmlKey") == 0, "OH_UdsDetails_GetAllKeys keys[0] fail.");
    NAPI_ASSERT(env, strcmp(keys[1], "htmlKey1") == 0, "OH_UdsDetails_GetAllKeys keys[1] fail.");
    NAPI_ASSERT(env, count == EXPECTED_COUNT_TWO, "OH_UdsDetails_GetAllKeys  count fail.");

    OH_UdsDetails_Destroy(details);
    OH_UdsDetails_Destroy(details1);
    OH_UdsHtml_Destroy(html);
    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}

static napi_value OH_UdsAppItem_SetDetails_001(napi_env env, napi_callback_info info)
{
    int result = OH_UdsAppItem_SetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsAppItem_SetDetails e1 fail.");
    result = OH_UdsAppItem_GetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsAppItem_GetDetails e1 fail.");

    OH_UdsAppItem* appItem = OH_UdsAppItem_Create();
    NAPI_ASSERT(env, appItem != nullptr, "OH_UdsHtml_Create fail.");

    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create details fail.");

    result = OH_UdsAppItem_SetDetails(appItem, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsAppItem_SetDetails e2 fail.");
    result = OH_UdsAppItem_GetDetails(appItem, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsAppItem_GetDetails e2 fail.");
    result = OH_UdsAppItem_SetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsAppItem_SetDetails e3 fail.");
    result = OH_UdsAppItem_GetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsAppItem_GetDetails e3 fail.");

    result = OH_UdsDetails_SetValue(details, "appItemKey", "appItemValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue ok fail.");

    result = OH_UdsAppItem_SetDetails(appItem, details);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsAppItem_SetDetails ok fail.");

    OH_UdsDetails* details1 = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details1 != nullptr, "OH_UdsDetails_Create details1 fail.");

    result = OH_UdsAppItem_GetDetails(appItem, details1);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsAppItem_SetDetails ok fail.");

    unsigned int count = 0;
    char **keys = OH_UdsDetails_GetAllKeys(details1, &count);
    NAPI_ASSERT(env, keys != nullptr, "OH_UdsDetails_GetAllKeys keys fail.");
    NAPI_ASSERT(env, strcmp(keys[0], "appItemKey") == 0, "OH_UdsDetails_GetAllKeys keys[0] fail.");
    NAPI_ASSERT(env, count == 1, "OH_UdsDetails_GetAllKeys  count fail.");

    OH_UdsDetails_Destroy(details);
    OH_UdsDetails_Destroy(details1);
    OH_UdsAppItem_Destroy(appItem);
    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}

static napi_value OH_UdsFileUri_SetDetails_001(napi_env env, napi_callback_info info)
{
    int result = OH_UdsFileUri_SetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsFileUri_SetDetails e1 fail.");
    result = OH_UdsFileUri_GetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsFileUri_GetDetails e1 fail.");

    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    NAPI_ASSERT(env, fileUri != nullptr, "OH_UdsFileUri_Create fail.");

    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create details fail.");

    result = OH_UdsFileUri_SetDetails(fileUri, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsFileUri_SetDetails e2 fail.");
    result = OH_UdsFileUri_GetDetails(fileUri, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsFileUri_GetDetails e2 fail.");
    result = OH_UdsFileUri_SetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsFileUri_SetDetails e3 fail.");
    result = OH_UdsFileUri_GetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsFileUri_GetDetails e3 fail.");

    result = OH_UdsDetails_SetValue(details, "fileUriKey", "fileUriValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue ok fail.");

    result = OH_UdsFileUri_SetDetails(fileUri, details);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue ok fail.");

    OH_UdsDetails* details1 = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details1 != nullptr, "OH_UdsDetails_Create details1 fail.");

    result = OH_UdsFileUri_GetDetails(fileUri, details1);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsFileUri_GetDetails ok fail.");

    unsigned int count = 0;
    char **keys = OH_UdsDetails_GetAllKeys(details1, &count);
    NAPI_ASSERT(env, keys != nullptr, "OH_UdsDetails_GetAllKeys keys fail.");
    NAPI_ASSERT(env, strcmp(keys[0], "fileUriKey") == 0, "OH_UdsDetails_GetAllKeys keys[0] fail.");
    NAPI_ASSERT(env, count == 1, "OH_UdsDetails_GetAllKeys  count fail.");

    OH_UdsDetails_Destroy(details);
    OH_UdsDetails_Destroy(details1);
    OH_UdsFileUri_Destroy(fileUri);
    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}

static napi_value OH_UdsPixelMap_SetDetails_001(napi_env env, napi_callback_info info)
{
    int result = OH_UdsPixelMap_SetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPixelMap_SetDetails e1 fail.");
    result = OH_UdsPixelMap_GetDetails(nullptr, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPixelMap_GetDetails e1 fail.");

    OH_UdsPixelMap *pixelMap = OH_UdsPixelMap_Create();
    NAPI_ASSERT(env, pixelMap != nullptr, "OH_UdsPixelMap_Create fail.");

    OH_UdsDetails* details = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details != nullptr, "OH_UdsDetails_Create details fail.");

    result = OH_UdsPixelMap_SetDetails(pixelMap, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPixelMap_SetDetails e2 fail.");
    result = OH_UdsPixelMap_GetDetails(pixelMap, nullptr);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPixelMap_GetDetails e2 fail.");
    result = OH_UdsPixelMap_SetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPixelMap_SetDetails e3 fail.");
    result = OH_UdsPixelMap_GetDetails(nullptr, details);
    NAPI_ASSERT(env, result == UDMF_E_INVALID_PARAM, "OH_UdsPixelMap_GetDetails e3 fail.");

    result = OH_UdsDetails_SetValue(details, "pixelMapKey", "pixelMapValue");
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsDetails_SetValue ok fail.");

    result = OH_UdsPixelMap_SetDetails(pixelMap, details);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsPixelMap_SetDetails ok fail.");

    OH_UdsDetails* details1 = OH_UdsDetails_Create();
    NAPI_ASSERT(env, details1 != nullptr, "OH_UdsDetails_Create details1 fail.");

    result = OH_UdsPixelMap_GetDetails(pixelMap, details1);
    NAPI_ASSERT(env, result == UDMF_E_OK, "OH_UdsPixelMap_SetDetails ok fail.");

    unsigned int count = 0;
    char **keys = OH_UdsDetails_GetAllKeys(details1, &count);
    NAPI_ASSERT(env, keys != nullptr, "OH_UdsDetails_GetAllKeys keys fail.");
    NAPI_ASSERT(env, strcmp(keys[0], "pixelMapKey") == 0, "OH_UdsDetails_GetAllKeys keys[0] fail.");
    NAPI_ASSERT(env, count == 1, "OH_UdsDetails_GetAllKeys  count fail.");
    napi_value re = nullptr;
    napi_create_int32(env, 1, &re);
    return re;
}

//========================================================================

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_UdsPlainText_Create_0100", nullptr, OH_UdsPlainText_Create_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_Destroy_0100", nullptr, OH_UdsPlainText_Destroy_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_GetType_0100", nullptr, OH_UdsPlainText_GetType_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetContent_001", nullptr, OH_UdsPlainText_SetContent_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_GetContent_001", nullptr, OH_UdsPlainText_GetContent_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetAbstract_001", nullptr, OH_UdsPlainText_SetAbstract_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_GetAbstract_001", nullptr, OH_UdsPlainText_GetAbstract_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_Create_001", nullptr, OH_UdsHyperlink_Create_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_Destroy_001", nullptr, OH_UdsHyperlink_Destroy_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_GetType_001", nullptr, OH_UdsHyperlink_GetType_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_SetUrl_001", nullptr, OH_UdsHyperlink_SetUrl_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_GetUrl_001", nullptr, OH_UdsHyperlink_GetUrl_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_SetDescription_001", nullptr, OH_UdsHyperlink_SetDescription_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_GetDescription_001", nullptr, OH_UdsHyperlink_GetDescription_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_Create_001", nullptr, OH_UdsHtml_Create_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_Destroy_001", nullptr, OH_UdsHtml_Destroy_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_GetType_001", nullptr, OH_UdsHtml_GetType_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetContent_001", nullptr, OH_UdsHtml_SetContent_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_GetContent_001", nullptr, OH_UdsHtml_GetContent_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetPlainContent_001", nullptr, OH_UdsHtml_SetPlainContent_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_GetPlainContent_001", nullptr, OH_UdsHtml_GetPlainContent_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_Create_001", nullptr, OH_UdsAppItem_Create_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_Destroy_001", nullptr, OH_UdsAppItem_Destroy_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetType_001", nullptr, OH_UdsAppItem_GetType_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetId_001", nullptr, OH_UdsAppItem_SetId_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetId_001", nullptr, OH_UdsAppItem_GetId_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetName_001", nullptr, OH_UdsAppItem_SetName_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetName_001", nullptr, OH_UdsAppItem_GetName_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetIconId_001", nullptr, OH_UdsAppItem_SetIconId_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetIconId_001", nullptr, OH_UdsAppItem_GetIconId_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetLabelId_001", nullptr, OH_UdsAppItem_SetLabelId_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetLabelId_001", nullptr, OH_UdsAppItem_GetLabelId_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetBundleName_001", nullptr, OH_UdsAppItem_SetBundleName_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetBundleName_001", nullptr, OH_UdsAppItem_GetBundleName_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetAbilityName_001", nullptr, OH_UdsAppItem_SetAbilityName_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_GetAbilityName_001", nullptr, OH_UdsAppItem_GetAbilityName_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsDetails_HasKey_001", nullptr, OH_UdsDetails_HasKey_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsDetails_Remove_001", nullptr, OH_UdsDetails_Remove_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsDetails_Clear_001", nullptr, OH_UdsDetails_Clear_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsDetails_SetValue_001", nullptr, OH_UdsDetails_SetValue_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsDetails_GetValue_001", nullptr, OH_UdsDetails_GetValue_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsDetails_GetAllKeys_001", nullptr, OH_UdsDetails_GetAllKeys_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPlainText_SetDetails_001", nullptr, OH_UdsPlainText_SetDetails_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHyperlink_SetDetails_001", nullptr, OH_UdsHyperlink_SetDetails_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetDetails_001", nullptr, OH_UdsHtml_SetDetails_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsAppItem_SetDetails_001", nullptr, OH_UdsAppItem_SetDetails_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_SetDetails_001", nullptr, OH_UdsFileUri_SetDetails_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsPixelMap_SetDetails_001", nullptr, OH_UdsPixelMap_SetDetails_001, nullptr, nullptr, nullptr, napi_default, nullptr},

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
        .nm_modname = "UdsNdk",
        .nm_priv = ((void *)0),
        .reserved = {0},
    };

    extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
