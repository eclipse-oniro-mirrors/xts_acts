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
#include "asset_api.h"
#include <bits/alltypes.h>
#include <cstring>

static const int MAGIC_RET = 9999;
static const int BUFF_MAX = 2048;
static const char *DEMO_LABEL = "demo_label";

static napi_value Asset_Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    char secretBuffer[BUFF_MAX];
    bufferSize = BUFF_MAX;
    copied = 0;

    napi_get_value_string_utf8(env, args[1], secretBuffer, bufferSize, &copied);

    Asset_Blob secret = {(uint32_t)(strlen(secretBuffer)), (uint8_t *)secretBuffer};
    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};

    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_ACCESSIBILITY, .value.u32 = ASSET_ACCESSIBILITY_DEVICE_POWERED_ON},
        {.tag = ASSET_TAG_SECRET, .value.blob = secret},
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
    };
    int32_t ret = OH_Asset_Add(attr, sizeof(attr) / sizeof(attr[0]));
    napi_value result;
    napi_create_uint32(env, ret, &result);

    return result;
}


static napi_value Asset_Add_Auth(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    char secretBuffer[BUFF_MAX];
    bufferSize = BUFF_MAX;
    copied = 0;

    napi_get_value_string_utf8(env, args[1], secretBuffer, bufferSize, &copied);
    
    Asset_Blob secret = {(uint32_t)(strlen(secretBuffer)), (uint8_t *)secretBuffer};
    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};
    Asset_Blob label = {(uint32_t)(strlen(DEMO_LABEL)), (uint8_t *)DEMO_LABEL};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_ACCESSIBILITY, .value.u32 = ASSET_ACCESSIBILITY_DEVICE_POWERED_ON},
        {.tag = ASSET_TAG_SECRET, .value.blob = secret},
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
        {.tag = ASSET_TAG_DATA_LABEL_NORMAL_1, .value.blob = label},
        {.tag = ASSET_TAG_AUTH_TYPE, .value.u32 = ASSET_AUTH_TYPE_ANY},
    };
    int32_t ret = OH_Asset_Add(attr, sizeof(attr) / sizeof(attr[0]));
    napi_value result;
    napi_create_uint32(env, ret, &result);

    return result;
}


static napi_value Asset_PreAndPostQueryNormal(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    char aliasBuffer2[BUFF_MAX];
    bufferSize = BUFF_MAX;
    copied = 0;

    napi_get_value_string_utf8(env, args[1], aliasBuffer2, bufferSize, &copied);

    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};

    uint8_t challengeBuffer[32] = "";
    Asset_Blob challenge = {(uint32_t)32, (uint8_t *)challengeBuffer};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_AUTH_VALIDITY_PERIOD, .value.u32 = 2 * 60},
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
    };

    int32_t ret = OH_Asset_PreQuery(attr, sizeof(attr) / sizeof(attr[0]), &challenge);

    int32_t result ;
    napi_value tmp;
    if (ret == ASSET_SUCCESS) {
        napi_create_string_utf8(env, (char *)challenge.data, challenge.size, &tmp);
        if (tmp != NULL) {
            Asset_Attr attr[] = {
                {.tag = ASSET_TAG_AUTH_CHALLENGE, .value.blob = challenge},
            };
            int32_t ret = OH_Asset_PostQuery(attr, sizeof(attr) / sizeof(attr[0]));
            if (ret == ASSET_SUCCESS) {
                result = MAGIC_RET;
            } else {
                result = -1;
            }
        } else {
            result = -1;
        }
    } else {
        result = -1;
    }
    OH_Asset_FreeBlob(&challenge);
    napi_value result_real;
    napi_create_uint32(env, result, &result_real);
    return result_real;
}

static napi_value Asset_PreAndPostQueryError(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    char secretBuffer[BUFF_MAX];
    bufferSize = BUFF_MAX;
    copied = 0;

    napi_get_value_string_utf8(env, args[1], secretBuffer, bufferSize, &copied);

    Asset_Blob secret = {(uint32_t)(strlen(secretBuffer)), (uint8_t *)secretBuffer};

    uint8_t challengeBuffer[32] = "";
    Asset_Blob challenge = {(uint32_t)32, (uint8_t *)challengeBuffer};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_SECRET, .value.blob = secret},
    };

    int32_t ret = OH_Asset_PreQuery(attr, sizeof(attr) / sizeof(attr[0]), &challenge);
    int32_t result;
    if (ret == ASSET_INVALID_ARGUMENT) {
        result = MAGIC_RET;
    } else {
        result = -1;
    }

    Asset_Attr attr2[] = {
        {.tag = ASSET_TAG_RETURN_LIMIT, .value.u32 = 0},
        {.tag = ASSET_TAG_RETURN_OFFSET, .value.u32 = 10},
        {.tag = ASSET_TAG_RETURN_ORDERED_BY, .value.u32 = 0},
    };

    ret = OH_Asset_PreQuery(attr2, sizeof(attr2) / sizeof(attr2[0]), &challenge);
    if (ret == ASSET_INVALID_ARGUMENT && result == MAGIC_RET) {
        result = MAGIC_RET;
    } else {
        result = -1;
    }
    Asset_Attr attr3[] = {};
    ret = OH_Asset_PostQuery(attr3, sizeof(attr3) / sizeof(attr3[0]));
    if (ret == ASSET_INVALID_ARGUMENT && result == MAGIC_RET) {
        result = MAGIC_RET;
    } else {
        result = -1;
    }
    napi_value result_real;
    napi_create_uint32(env, result, &result_real);
    return result_real;
}

static napi_value Asset_PreQuery(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};
    uint8_t challengeBuffer[32] = "";
    Asset_Blob challenge = {(uint32_t)32, (uint8_t *)challengeBuffer};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
    };

    int32_t ret = OH_Asset_PreQuery(attr, sizeof(attr) / sizeof(attr[0]), &challenge);
    napi_value result;
    napi_value tmp;
    if (ret == ASSET_SUCCESS) {
        napi_create_string_utf8(env, (char *)challenge.data, challenge.size, &tmp);
        if (tmp != NULL) {
            return tmp;
        } else {
            ret = -1;
        }
    }
    OH_Asset_FreeBlob(&challenge);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value Asset_PreAndPostQuery(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};
    uint8_t challengeBuffer[32] = "";
    Asset_Blob challenge = {(uint32_t)32, (uint8_t *)challengeBuffer};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_AUTH_VALIDITY_PERIOD, .value.u32 = 2 * 60},
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
    };

    int32_t ret = OH_Asset_PreQuery(attr, sizeof(attr) / sizeof(attr[0]), &challenge);
    napi_value result;
    napi_value tmp;
    if (ret == ASSET_SUCCESS) {
        napi_create_string_utf8(env, (char *)challenge.data, challenge.size, &tmp);
        if (tmp != NULL) {
            Asset_Attr attr[] = {
                {.tag = ASSET_TAG_AUTH_CHALLENGE, .value.blob = challenge},
            };
            int32_t ret = OH_Asset_PostQuery(attr, sizeof(attr) / sizeof(attr[0]));
            napi_create_uint32(env, ret, &result);
            return result;
        } else {
            ret = -1;
        }
    }
    OH_Asset_FreeBlob(&challenge);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value Asset_PostQuery(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char challengeBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], challengeBuffer, bufferSize, &copied);

    Asset_Blob challenge = {(uint32_t)(strlen(challengeBuffer)), (uint8_t *)challengeBuffer};
    napi_value result;
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_AUTH_CHALLENGE, .value.blob = challenge},
    };
    int32_t ret = OH_Asset_PostQuery(attr, sizeof(attr) / sizeof(attr[0]));
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value Asset_RemoveAll(napi_env env, napi_callback_info info)
{
    Asset_Attr attr[] = {

    };
    int32_t ret = OH_Asset_Remove(attr, sizeof(attr) / sizeof(attr[0]));
    napi_value result;
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value Asset_Remove(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);
    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};

    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
    };
    int32_t ret = OH_Asset_Remove(attr, sizeof(attr) / sizeof(attr[0]));
    napi_value result;
    napi_create_uint32(env, ret, &result);

    return result;
}

static napi_value Asset_RemoveLabel(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char labelBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], labelBuffer, bufferSize, &copied);
    Asset_Blob label = {(uint32_t)(strlen(labelBuffer)), (uint8_t *)labelBuffer};

    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_DATA_LABEL_NORMAL_1, .value.blob = label},
    };
    int32_t ret = OH_Asset_Remove(attr, sizeof(attr) / sizeof(attr[0]));
    napi_value result;
    napi_create_uint32(env, ret, &result);

    return result;
}

static napi_value Asset_RemoveError(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    char secretBuffer[BUFF_MAX];
    bufferSize = BUFF_MAX;
    copied = 0;

    napi_get_value_string_utf8(env, args[1], secretBuffer, bufferSize, &copied);

    Asset_Blob secret = {(uint32_t)(strlen(secretBuffer)), (uint8_t *)secretBuffer};
    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};
    
    Asset_Blob label = {(uint32_t)(strlen(DEMO_LABEL)), (uint8_t *)DEMO_LABEL};

    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_SECRET, .value.blob = secret},
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
    };

    int32_t ret = OH_Asset_Remove(attr, sizeof(attr) / sizeof(attr[0]));

    int32_t result;
    if (ret == ASSET_INVALID_ARGUMENT) {
        result = MAGIC_RET;
    } else {
        result = -1;
    }

    Asset_Attr attr2[] = {
        {.tag = ASSET_TAG_SECRET, .value.blob = secret},
    };

    ret = OH_Asset_Remove(attr2, sizeof(attr2) / sizeof(attr2[0]));
    if (ret == ASSET_INVALID_ARGUMENT && result == MAGIC_RET) {
        result = MAGIC_RET;
    } else {
        result = -1;
    }

    Asset_Attr attr3[] = {
        {.tag = ASSET_TAG_SECRET, .value.blob = secret},
        {.tag = ASSET_TAG_DATA_LABEL_NORMAL_1, .value.blob = label},
    };
    ret = OH_Asset_Remove(attr3, sizeof(attr3) / sizeof(attr3[0]));
    if (ret == ASSET_INVALID_ARGUMENT && result == MAGIC_RET) {
        result = MAGIC_RET;
    } else {
        result = -1;
    }
    
    napi_value result_real;
    napi_create_uint32(env, result, &result_real);
    return result_real;
}

static napi_value Asset_QueryAll(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    char secretBuffer[BUFF_MAX];
    bufferSize = BUFF_MAX;
    copied = 0;

    napi_get_value_string_utf8(env, args[1], secretBuffer, bufferSize, &copied);
    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
        {.tag = ASSET_TAG_RETURN_TYPE, .value.u32 = ASSET_RETURN_ALL},
    };
    Asset_ResultSet resultSet = {0};
    int32_t ret = OH_Asset_Query(attr, sizeof(attr) / sizeof(attr[0]), &resultSet);
    if (ret == ASSET_SUCCESS) {
        Asset_Attr *secret = OH_Asset_ParseAttr(resultSet.results + 0, ASSET_TAG_SECRET);
        if (memcmp(secret->value.blob.data, (uint8_t *)secretBuffer, secret->value.blob.size) == 0) {
            ret = MAGIC_RET;
        } else {
            ret = -1;
        }
    } else {
        ret = -1;
    }
    napi_value result;
    napi_create_uint32(env, ret, &result);
    OH_Asset_FreeResultSet(&resultSet);
    return result;
}

static napi_value Asset_QueryOption(napi_env env, napi_callback_info info)
{
    size_t argc = 4;
    napi_value args[4] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t return_limit;
    napi_get_value_uint32(env, args[0], &return_limit);
    uint32_t return_offset;
    napi_get_value_uint32(env, args[1], &return_offset);
    uint32_t return_ordered_by;
    napi_get_value_uint32(env, args[2], &return_ordered_by); // 2 is index

    uint32_t value0;
    napi_get_value_uint32(env, args[3], &value0); // 3 is index
    
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_RETURN_LIMIT, .value.u32 = return_limit},
        {.tag = ASSET_TAG_RETURN_OFFSET, .value.u32 = return_offset},
        {.tag = ASSET_TAG_RETURN_ORDERED_BY, .value.u32 = return_ordered_by},
    };
    Asset_ResultSet resultSet = {0};
    int32_t ret = OH_Asset_Query(attr, sizeof(attr) / sizeof(attr[0]), &resultSet);
    if (ret == ASSET_SUCCESS) {
        if (resultSet.count == value0) {
            ret = MAGIC_RET;
        }
    }
    napi_value result;
    napi_create_uint32(env, ret, &result);
    OH_Asset_FreeResultSet(&resultSet);
    return result;
}

static napi_value Asset_QueryError(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    char secretBuffer[BUFF_MAX];
    bufferSize = BUFF_MAX;
    copied = 0;

    napi_get_value_string_utf8(env, args[1], secretBuffer, bufferSize, &copied);

    Asset_Blob secret = {(uint32_t)(strlen(secretBuffer)), (uint8_t *)secretBuffer};
    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};

    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_SECRET, .value.blob = secret},
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
    };
    Asset_ResultSet resultSet = {0};
    int32_t ret = OH_Asset_Query(attr, sizeof(attr) / sizeof(attr[0]), &resultSet);

    int32_t result;
    if (ret == ASSET_INVALID_ARGUMENT) {
        result = MAGIC_RET;
    } else {
        result = -1;
    }
    OH_Asset_FreeResultSet(&resultSet);

    Asset_Attr attr2[] = {
        {.tag = ASSET_TAG_SECRET, .value.blob = secret},
    };
    resultSet = {0};
    ret = OH_Asset_Query(attr2, sizeof(attr2) / sizeof(attr2[0]), &resultSet);
    if (ret == ASSET_INVALID_ARGUMENT && result == MAGIC_RET) {
        result = MAGIC_RET;
    } else {
        result = -1;
    }
    OH_Asset_FreeResultSet(&resultSet);
    napi_value result_real;
    napi_create_uint32(env, result, &result_real);
    return result_real;
}

static napi_value Asset_QueryNum(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);

    Asset_Attr attr[] = {

    };
    Asset_ResultSet resultSet = {0};
    int32_t ret = OH_Asset_Query(attr, sizeof(attr) / sizeof(attr[0]), &resultSet);
    if (ret == ASSET_SUCCESS) {
        if (resultSet.count == value0) {
            ret = MAGIC_RET;
        }
    }
    napi_value result;
    napi_create_uint32(env, ret, &result);
    OH_Asset_FreeResultSet(&resultSet);
    return result;
}

static napi_value Asset_QueryLabel(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char labelBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], labelBuffer, bufferSize, &copied);

    int32_t value0;
    napi_get_value_int32(env, args[1], &value0);

    Asset_Blob label = {(uint32_t)(strlen(labelBuffer)), (uint8_t *)labelBuffer};
    ;

    Asset_Attr attr[] = {{.tag = ASSET_TAG_DATA_LABEL_NORMAL_1, .value.blob = label}};
    Asset_ResultSet resultSet = {0};
    int32_t ret = OH_Asset_Query(attr, sizeof(attr) / sizeof(attr[0]), &resultSet);
    if (ret == ASSET_SUCCESS) {
        if (resultSet.count == value0) {
            ret = MAGIC_RET;
        }
    }
    napi_value result;
    napi_create_uint32(env, ret, &result);
    OH_Asset_FreeResultSet(&resultSet);
    return result;
}

static napi_value Asset_UpdateEasy(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    char secretBuffer[BUFF_MAX];
    bufferSize = BUFF_MAX;
    copied = 0;

    napi_get_value_string_utf8(env, args[1], secretBuffer, bufferSize, &copied);

    Asset_Blob secret = {(uint32_t)(strlen(secretBuffer)), (uint8_t *)secretBuffer};
    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};

    Asset_Attr query[] = {
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
    };
    Asset_Attr attributesToUpdate[] = {
        {.tag = ASSET_TAG_SECRET, .value.blob = secret},
    };

    int32_t ret = OH_Asset_Update(query, sizeof(query) / sizeof(query[0]), attributesToUpdate,
                                  sizeof(attributesToUpdate) / sizeof(attributesToUpdate[0]));

    napi_value result;
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value Asset_UpdateLabel(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    char secretBuffer[BUFF_MAX];
    bufferSize = BUFF_MAX;
    copied = 0;

    napi_get_value_string_utf8(env, args[1], secretBuffer, bufferSize, &copied);

    char labelBuffer[BUFF_MAX];
    bufferSize = BUFF_MAX;
    copied = 0;

    napi_get_value_string_utf8(env, args[2], labelBuffer, bufferSize, &copied); // 2 is index

    Asset_Blob secret = {(uint32_t)(strlen(secretBuffer)), (uint8_t *)secretBuffer};
    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};
    Asset_Blob label = {(uint32_t)(strlen(labelBuffer)), (uint8_t *)labelBuffer};

    Asset_Attr query[] = {
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
    };
    Asset_Attr attributesToUpdate[] = {{.tag = ASSET_TAG_SECRET, .value.blob = secret},
                                       {.tag = ASSET_TAG_DATA_LABEL_NORMAL_1, .value.blob = label}};

    int32_t ret = OH_Asset_Update(query, sizeof(query) / sizeof(query[0]), attributesToUpdate,
                                  sizeof(attributesToUpdate) / sizeof(attributesToUpdate[0]));
    napi_value result;
    napi_create_uint32(env, ret, &result);
    return result;
}


static napi_value Asset_UpdateError(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char aliasBuffer[BUFF_MAX];
    size_t bufferSize = BUFF_MAX;
    size_t copied = 0;

    napi_get_value_string_utf8(env, args[0], aliasBuffer, bufferSize, &copied);

    char secretBuffer[BUFF_MAX];
    bufferSize = BUFF_MAX;
    copied = 0;

    napi_get_value_string_utf8(env, args[1], secretBuffer, bufferSize, &copied);

    Asset_Blob alias = {(uint32_t)(strlen(aliasBuffer)), (uint8_t *)aliasBuffer};

    int32_t result;

    Asset_Attr query[] = {
        {.tag = ASSET_TAG_ALIAS, .value.blob = alias},
    };
    Asset_Attr attributesToUpdate[] = {};
    int32_t ret = OH_Asset_Update(query, sizeof(query) / sizeof(query[0]), attributesToUpdate,
                                  sizeof(attributesToUpdate) / sizeof(attributesToUpdate[0]));
    if (ret == ASSET_INVALID_ARGUMENT) {
        result = MAGIC_RET;
    } else {
        result = -1;
    }

    Asset_Attr attributesToUpdate2[] = {
        {.tag = ASSET_TAG_RETURN_LIMIT, .value.u32 = 0},
        {.tag = ASSET_TAG_RETURN_OFFSET, .value.u32 = 10},
        {.tag = ASSET_TAG_RETURN_ORDERED_BY, .value.u32 = 0},
    };
    ret = OH_Asset_Update(query, sizeof(query) / sizeof(query[0]), attributesToUpdate2,
                          sizeof(attributesToUpdate2) / sizeof(attributesToUpdate2[0]));
    if (ret == ASSET_INVALID_ARGUMENT && result == MAGIC_RET) {
        result = MAGIC_RET;
    } else {
        result = -1;
    }

    napi_value result_real;
    napi_create_uint32(env, result, &result_real);
    return result_real;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"asset_add", nullptr, Asset_Add, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_queryNum", nullptr, Asset_QueryNum, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_queryAll", nullptr, Asset_QueryAll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_removeAll", nullptr, Asset_RemoveAll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_remove", nullptr, Asset_Remove, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_removeLabel", nullptr, Asset_RemoveLabel, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_removeError", nullptr, Asset_RemoveError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_queryLabel", nullptr, Asset_QueryLabel, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_queryOption", nullptr, Asset_QueryOption, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_queryError", nullptr, Asset_QueryError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_updateEasy", nullptr, Asset_UpdateEasy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_updateLabel", nullptr, Asset_UpdateLabel, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_updateError", nullptr, Asset_UpdateError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_preAndPostQueryNormal", nullptr, Asset_PreAndPostQueryNormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"asset_preAndPostQueryError", nullptr, Asset_PreAndPostQueryError, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"asset_addAuth", nullptr, Asset_Add_Auth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_preQuery", nullptr, Asset_PreQuery, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_preAndPostQuery", nullptr, Asset_PreAndPostQuery, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asset_postQuery", nullptr, Asset_PostQuery, nullptr, nullptr, nullptr, napi_default, nullptr},

    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

/*
 * module define
 */
static napi_module g_module = {.nm_version = 1,
                               .nm_flags = 0,
                               .nm_filename = nullptr,
                               .nm_register_func = Init,
                               .nm_modname = "assetNdkTest",
                               .nm_priv = ((void *)0),
                               .reserved = {0}};

/*
 * module register
 */
extern "C" __attribute__((constructor)) void MyPixelMapRegisterModule(void) { napi_module_register(&g_module); }