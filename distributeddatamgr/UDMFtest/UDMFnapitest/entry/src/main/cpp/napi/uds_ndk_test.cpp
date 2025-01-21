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
#include "udmf.h"
#include "udmf_err_code.h"
#include <bits/alltypes.h>
#include <iostream>
#include <string>
#include "udmf_meta.h"
#include "uds.h"
#include "utd.h"

#define PARAM_0 0
#define PARAM_1 1

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
        {"OH_UdsAppItem_GetAbilityName_001", nullptr, OH_UdsAppItem_GetAbilityName_001, nullptr, nullptr, nullptr, napi_default, nullptr}

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
