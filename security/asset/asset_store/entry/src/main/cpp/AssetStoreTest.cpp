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
#include <asset/asset_api.h>
#include <asset/asset_type.h>
#include <napi/native_api.h>
#include <bits/alltypes.h>
#include <cstring>
#include <string>

static const int BUFF_MAX = 4096;
static const uint32_t MAX_BUFFER_SIZE = 128;
static const uint32_t MAX_ARG_COUNT = 8;
static const int32_t INVALID_STATUS = -1;

bool GetString(napi_env env, napi_callback_info info, uint32_t index, std::string& outstr)
{
    size_t argc = MAX_ARG_COUNT;
    napi_value args[MAX_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        return false;
    }
    if (index >= argc) {
        return false;
    }
    char output[MAX_BUFFER_SIZE] = {0};
    size_t size = 0;
    if (napi_get_value_string_utf8(env, args[index], output, MAX_BUFFER_SIZE, &size) != napi_ok) {
        return false;
    }
    outstr = std::string(output);
    return true;
}

static int32_t GetInt(napi_env env, napi_callback_info info, uint32_t index, int32_t& outint)
{
    size_t argc = MAX_ARG_COUNT;
    napi_value args[MAX_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        return false;
    }
    if (index >= argc) {
        return false;
    }
    if (napi_get_value_int32(env, args[index], &outint) != napi_ok) {
        return false;
    }
    return true;
}

static napi_value ReturnInt(napi_env env, int32_t value, napi_value* result)
{
    napi_create_int32(env, value, result);
    return *result;
}

enum ARG_INDEX {
    ARG_INDEX_0 = 0,
    ARG_INDEX_1 = ARG_INDEX_0 + 1,
    ARG_INDEX_2 = ARG_INDEX_0 + 2,
    ARG_INDEX_3 = ARG_INDEX_0 + 3,
    ARG_INDEX_4 = ARG_INDEX_0 + 4,
    ARG_INDEX_5 = ARG_INDEX_0 + 5,
    ARG_INDEX_6 = ARG_INDEX_0 + 6,
    ARG_INDEX_7 = ARG_INDEX_0 + 7,
    ARG_INDEX_8 = ARG_INDEX_0 + 8,
    ARG_INDEX_9 = ARG_INDEX_0 + 9,
    ARG_INDEX_10 = ARG_INDEX_0 + 10,
    ARG_INDEX_11 = ARG_INDEX_0 + 11,
    ARG_INDEX_12 = ARG_INDEX_0 + 12,
    ARG_INDEX_13 = ARG_INDEX_0 + 13,
};

static napi_value Asset_Add(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::string ar;
    std::string sr;
    if (GetString(env, info, 0, ar) == false || GetString(env, info, 1, sr) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    Asset_Blob secret{static_cast<uint32_t>(sr.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(sr.c_str()))};
    Asset_Attr attr[] = { {ASSET_TAG_SECRET, {.blob = secret}}, {ASSET_TAG_ALIAS, {.blob = secret}} };
    int32_t rest = OH_Asset_Add(attr, sizeof(attr) / sizeof(attr[0]));
    int32_t ret = rest;
    if (rest == ASSET_IPC_ERROR) {
        ret = ASSET_IPC_ERROR;
    } else if (rest == ASSET_SUCCESS) {
        ret = ASSET_SUCCESS;
    } else if (rest == ASSET_PERMISSION_DENIED) {
        ret = ASSET_PERMISSION_DENIED;
    } else if (rest ==  ASSET_OUT_OF_MEMORY) {
        ret = ASSET_OUT_OF_MEMORY;
    } else if (rest == ASSET_DATA_CORRUPTED) {
        ret = ASSET_DATA_CORRUPTED;
    } else if (rest == ASSET_DUPLICATED) {
        ret = ASSET_DUPLICATED;
    } else if (rest == ASSET_CRYPTO_ERROR) {
        ret = ASSET_CRYPTO_ERROR;
    } else if (rest == ASSET_GET_SYSTEM_TIME_ERROR) {
        ret = ASSET_GET_SYSTEM_TIME_ERROR;
    } else if (rest == ASSET_SERVICE_UNAVAILABLE) {
        ret = ASSET_SERVICE_UNAVAILABLE;
    } else if (rest == ASSET_BMS_ERROR) {
        ret = ASSET_BMS_ERROR;
    } else if (rest == ASSET_INVALID_ARGUMENT) {
        ret = ASSET_INVALID_ARGUMENT;
    } else if (rest == ASSET_ACCESS_TOKEN_ERROR) {
        ret = ASSET_ACCESS_TOKEN_ERROR;
    } else if (rest == ASSET_FILE_OPERATION_ERROR) {
        ret = ASSET_FILE_OPERATION_ERROR;
    } else if (rest == ASSET_ACCOUNT_ERROR) {
        ret = ASSET_ACCOUNT_ERROR;
    } else if (rest == ASSET_DATABASE_ERROR) {
        ret = ASSET_DATABASE_ERROR;
    } else if (rest == ASSET_STATUS_MISMATCH) {
        ret = ASSET_STATUS_MISMATCH;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value Asset_RemoveAll(napi_env env, napi_callback_info info)
{
    Asset_Attr attr[] = {};
    int32_t rest = OH_Asset_Remove(attr, sizeof(attr) / sizeof(attr[0]));
    int32_t ret = rest;
    if (rest == ASSET_IPC_ERROR) {
        ret = ASSET_IPC_ERROR;
    } else if (rest == ASSET_SUCCESS) {
        ret = ASSET_SUCCESS;
    } else if (rest == ASSET_NOT_FOUND) {
        ret = ASSET_NOT_FOUND;
    } else if (rest == ASSET_OUT_OF_MEMORY) {
        ret = ASSET_OUT_OF_MEMORY;
    } else if (rest == ASSET_DATA_CORRUPTED) {
        ret = ASSET_DATA_CORRUPTED;
    } else if (rest == ASSET_GET_SYSTEM_TIME_ERROR) {
        ret = ASSET_GET_SYSTEM_TIME_ERROR;
    } else if (rest == ASSET_SERVICE_UNAVAILABLE) {
        ret = ASSET_SERVICE_UNAVAILABLE;
    } else if (rest == ASSET_BMS_ERROR) {
        ret = ASSET_BMS_ERROR;
    } else if (rest == ASSET_ACCESS_TOKEN_ERROR) {
        ret = ASSET_ACCESS_TOKEN_ERROR;
    } else if (rest == ASSET_ACCOUNT_ERROR) {
        ret = ASSET_ACCOUNT_ERROR;
    } else if (rest == ASSET_DATABASE_ERROR) {
        ret = ASSET_DATABASE_ERROR;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value Asset_Remove(napi_env env, napi_callback_info info)
{
    int32_t index;
    napi_value result;
    std::string ar;
    if (GetInt(env, info, 0, index) == false || GetString(env, info, 1, ar) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    Asset_Blob alias{static_cast<uint32_t>(ar.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(ar.c_str()))};
    Asset_Attr attr[ARG_INDEX_6];
    Asset_Attr* pattr = attr;
    uint32_t attrSize = 0;
    if (index == ARG_INDEX_0) {
        attrSize = 0;
    } else if (index == ARG_INDEX_1) {
        attr[0].tag = ASSET_TAG_ALIAS;
        attr[0].value.blob = alias;
        attrSize = ARG_INDEX_1;
    } else if (index == ARG_INDEX_2) {
        pattr = nullptr;
        attrSize = INVALID_STATUS;
    }
    int32_t rest = OH_Asset_Remove(pattr, attrSize);
    int32_t ret = rest;
    if (rest == ASSET_IPC_ERROR) {
        ret = ASSET_IPC_ERROR;
    } else if (rest == ASSET_SUCCESS) {
        ret = ASSET_SUCCESS;
    } else if (rest == ASSET_NOT_FOUND) {
        ret = ASSET_NOT_FOUND;
    } else if (rest == ASSET_OUT_OF_MEMORY) {
        ret = ASSET_OUT_OF_MEMORY;
    } else if (rest == ASSET_DATA_CORRUPTED) {
        ret = ASSET_DATA_CORRUPTED;
    } else if (rest == ASSET_GET_SYSTEM_TIME_ERROR) {
        ret = ASSET_GET_SYSTEM_TIME_ERROR;
    } else if (rest == ASSET_SERVICE_UNAVAILABLE) {
        ret = ASSET_SERVICE_UNAVAILABLE;
    } else if (rest == ASSET_BMS_ERROR) {
        ret = ASSET_BMS_ERROR;
    } else if (rest == ASSET_ACCESS_TOKEN_ERROR) {
        ret = ASSET_ACCESS_TOKEN_ERROR;
    } else if (rest == ASSET_ACCOUNT_ERROR) {
        ret = ASSET_ACCOUNT_ERROR;
    } else if (rest == ASSET_DATABASE_ERROR) {
        ret = ASSET_DATABASE_ERROR;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value Asset_Update(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::string ar;
    std::string sr;
    if (GetString(env, info, 0, ar) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    if (GetString(env, info, 0, sr) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    Asset_Blob alias{static_cast<uint32_t>(ar.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(ar.c_str()))};
    Asset_Blob secret{static_cast<uint32_t>(sr.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(sr.c_str()))};
    Asset_Attr query[] = {
        {.tag = ASSET_TAG_ALIAS, .value = {.blob = alias}}
    };
    Asset_Attr atup[] = {{.tag = ASSET_TAG_SECRET, .value = {.blob = secret}}};
    int32_t rest = OH_Asset_Update(query, sizeof(query) / sizeof(query[0]), atup, sizeof(atup) / sizeof(atup[0]));
    int32_t ret = rest;
    if (rest == ASSET_SUCCESS) {
        ret = ASSET_SUCCESS;
    } else if (rest == ASSET_IPC_ERROR) {
        ret = ASSET_IPC_ERROR;
    } else if (rest == ASSET_NOT_FOUND) {
        ret = ASSET_NOT_FOUND;
    } else if (rest == ASSET_OUT_OF_MEMORY) {
        ret = ASSET_OUT_OF_MEMORY;
    } else if (rest == ASSET_DATA_CORRUPTED) {
        ret = ASSET_DATA_CORRUPTED;
    } else if (rest == ASSET_CRYPTO_ERROR) {
        ret = ASSET_CRYPTO_ERROR;
    } else if (rest == ASSET_GET_SYSTEM_TIME_ERROR) {
        ret = ASSET_GET_SYSTEM_TIME_ERROR;
    } else if (rest == ASSET_SERVICE_UNAVAILABLE) {
        ret = ASSET_SERVICE_UNAVAILABLE;
    } else if (rest == ASSET_BMS_ERROR) {
        ret = ASSET_BMS_ERROR;
    } else if (rest == ASSET_ACCESS_TOKEN_ERROR) {
        ret = ASSET_ACCESS_TOKEN_ERROR;
    } else if (rest == ASSET_ACCOUNT_ERROR) {
        ret = ASSET_ACCOUNT_ERROR;
    } else if (rest == ASSET_DATABASE_ERROR) {
        ret = ASSET_DATABASE_ERROR;
    } else if (rest == ASSET_STATUS_MISMATCH) {
        ret = ASSET_STATUS_MISMATCH;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value Asset_PreQuery(napi_env env, napi_callback_info info)
{
    int32_t index;
    std::string ar;
    napi_value result;
    if (GetInt(env, info, 0, index) == false || GetString(env, info, 1, ar) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    Asset_Blob alias{static_cast<uint32_t>(ar.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(ar.c_str()))};
    uint8_t challengeBuffer[BUFF_MAX];
    Asset_Blob challenge = {static_cast<uint32_t>(BUFF_MAX), reinterpret_cast<uint8_t *>(challengeBuffer)};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_ALIAS, .value = {.blob = alias}},
    };
    int32_t rest = OH_Asset_PreQuery(attr, sizeof(attr) / sizeof(attr[0]), &challenge);
    int32_t ret = rest;
    if (rest == ASSET_IPC_ERROR) {
        ret = ASSET_IPC_ERROR;
    } else if (rest == ASSET_LIMIT_EXCEEDED) {
        ret = ASSET_LIMIT_EXCEEDED;
    } else if (rest == ASSET_OUT_OF_MEMORY) {
        ret = ASSET_OUT_OF_MEMORY;
    } else if (rest == ASSET_DATA_CORRUPTED) {
        ret = ASSET_DATA_CORRUPTED;
    } else if (rest == ASSET_CRYPTO_ERROR) {
        ret = ASSET_CRYPTO_ERROR;
    } else if (rest == ASSET_UNSUPPORTED) {
        ret = ASSET_UNSUPPORTED;
    } else if (rest == ASSET_SERVICE_UNAVAILABLE) {
        ret = ASSET_SERVICE_UNAVAILABLE;
    } else if (rest == ASSET_BMS_ERROR) {
        ret = ASSET_BMS_ERROR;
    } else if (rest == ASSET_ACCESS_TOKEN_ERROR) {
        ret = ASSET_ACCESS_TOKEN_ERROR;
    } else if (rest == ASSET_ACCOUNT_ERROR) {
        ret = ASSET_ACCOUNT_ERROR;
    } else if (rest == ASSET_DATABASE_ERROR) {
        ret = ASSET_DATABASE_ERROR;
    } else if (rest == ASSET_STATUS_MISMATCH) {
        ret = ASSET_STATUS_MISMATCH;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value Asset_Query(napi_env env, napi_callback_info info)
{
    std::string ar;
    std::string sr;
    napi_value result;
    if (GetString(env, info, 0, ar) == false || GetString(env, info, 1, sr) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    Asset_Blob alias{static_cast<uint32_t>(ar.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(ar.c_str()))};
    Asset_Blob secret{static_cast<uint32_t>(sr.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(sr.c_str()))};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_ALIAS, .value = {.blob = alias}},
        {.tag = ASSET_TAG_RETURN_TYPE, .value = {.u32 = ASSET_RETURN_ALL}},
    };
    Asset_ResultSet resultSet = {0};
    int32_t rest = OH_Asset_Query(attr, sizeof(attr) / sizeof(attr[0]), &resultSet);
    int32_t ret = rest;
    if (rest == ASSET_SUCCESS) {
        ret = ASSET_SUCCESS;
    } else if (rest == ASSET_IPC_ERROR) {
        ret = ASSET_IPC_ERROR;
    } else if (rest == ASSET_NOT_FOUND) {
        ret = ASSET_NOT_FOUND;
    } else if (rest == ASSET_ACCESS_DENIED) {
        ret = ASSET_ACCESS_DENIED;
    } else if (rest == ASSET_OUT_OF_MEMORY) {
        ret = ASSET_OUT_OF_MEMORY;
    } else if (rest == ASSET_DATA_CORRUPTED) {
        ret = ASSET_DATA_CORRUPTED;
    } else if (rest == ASSET_CRYPTO_ERROR) {
        ret = ASSET_CRYPTO_ERROR;
    } else if (rest == ASSET_UNSUPPORTED) {
        ret = ASSET_UNSUPPORTED;
    } else if (rest == ASSET_SERVICE_UNAVAILABLE) {
        ret = ASSET_SERVICE_UNAVAILABLE;
    } else if (rest == ASSET_BMS_ERROR) {
        ret = ASSET_BMS_ERROR;
    } else if (rest == ASSET_ACCESS_TOKEN_ERROR) {
        ret = ASSET_ACCESS_TOKEN_ERROR;
    } else if (rest == ASSET_ACCOUNT_ERROR) {
        ret = ASSET_ACCOUNT_ERROR;
    } else if (rest == ASSET_DATABASE_ERROR) {
        ret = ASSET_DATABASE_ERROR;
    } else if (rest == ASSET_STATUS_MISMATCH) {
        ret = ASSET_STATUS_MISMATCH;
    }
    OH_Asset_FreeResultSet(&resultSet);
    return ReturnInt(env, ret, &result);
}

static napi_value Asset_QuerySyncResult(napi_env env, napi_callback_info info)
{
    std::string ar;
    std::string sr;
    napi_value result;
    if (GetString(env, info, 0, ar) == false || GetString(env, info, 1, sr) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    Asset_Blob alias{static_cast<uint32_t>(ar.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(ar.c_str()))};
    Asset_Blob secret{static_cast<uint32_t>(sr.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(sr.c_str()))};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_ALIAS, .value = {.blob = alias}},
        {.tag = ASSET_TAG_RETURN_TYPE, .value = {.u32 = ASSET_RETURN_ALL}},
    };
    Asset_SyncResult syncResult = {0};
    int32_t rest = OH_Asset_QuerySyncResult(attr, sizeof(attr) / sizeof(attr[0]), &syncResult);
    int32_t ret = rest;
    if (rest == ASSET_IPC_ERROR) {
        ret = ASSET_IPC_ERROR;
    } else if (rest == ASSET_PARAM_VERIFICATION_FAILED) {
        ret = ASSET_PARAM_VERIFICATION_FAILED;
    } else if (rest == ASSET_OUT_OF_MEMORY) {
        ret = ASSET_OUT_OF_MEMORY;
    } else if (rest == ASSET_SERVICE_UNAVAILABLE) {
        ret = ASSET_SERVICE_UNAVAILABLE;
    } else if (rest == ASSET_BMS_ERROR) {
        ret = ASSET_BMS_ERROR;
    } else if (rest == ASSET_ACCESS_TOKEN_ERROR) {
        ret = ASSET_ACCESS_TOKEN_ERROR;
    } else if (rest == ASSET_FILE_OPERATION_ERROR) {
        ret = ASSET_FILE_OPERATION_ERROR;
    } else if (rest == ASSET_ACCOUNT_ERROR) {
        ret = ASSET_ACCOUNT_ERROR;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value Asset_CoverTagType(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::string ar;
    std::string sr;
    if (GetString(env, info, 0, ar) == false || GetString(env, info, 1, sr) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    Asset_Blob alias{static_cast<uint32_t>(ar.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(ar.c_str()))};
    Asset_Blob secret{static_cast<uint32_t>(sr.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(sr.c_str()))};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_SECRET, .value = {.blob = secret}},
        {.tag = ASSET_TAG_ALIAS, .value = {.blob = alias}},
        {.tag = ASSET_TAG_REQUIRE_ATTR_ENCRYPTED, .value = {.boolean = true}},
    };
    OH_Asset_Add(attr, sizeof(attr) / sizeof(attr[0]));
    Asset_Attr attr2[] = {
        {.tag = ASSET_TAG_ALIAS, .value = {.blob = alias}},
        {.tag = ASSET_TAG_RETURN_TYPE, .value = {.u32 = ASSET_RETURN_ALL}},
        {.tag = ASSET_TAG_REQUIRE_ATTR_ENCRYPTED, .value = {.boolean = true}},
    };
    Asset_ResultSet resultSet = {0};
    int32_t ret = OH_Asset_Query(attr2, sizeof(attr2) / sizeof(attr2[0]), &resultSet);
    if (ret != ASSET_SUCCESS) {
        return ReturnInt(env, ret, &result);
    }
    for (uint32_t i = 0 ;i < resultSet.count; i++) {
        for (uint32_t j = 0; j < resultSet.results[i].count; j++) {
            uint32_t tag = resultSet.results[i].attrs[j].tag;
            if (tag & ASSET_TYPE_BOOL) {
                ret = ASSET_TYPE_BOOL;
                break;
            } else if (tag & ASSET_TYPE_NUMBER) {
                ret = ASSET_TYPE_NUMBER;
                break;
            } else if (tag & ASSET_TYPE_BYTES) {
                ret = ASSET_TYPE_BYTES;
                break;
            }
        }
    }
    OH_Asset_FreeResultSet(&resultSet);
    ret = ((ret & ASSET_TYPE_BOOL) || (ret & ASSET_TYPE_NUMBER) || (ret & ASSET_TYPE_BYTES)) ? 0 : 1;
    return ReturnInt(env, ret, &result);
}

int32_t ReadCode(int32_t errCode)
{
    int32_t ret = errCode;
    if (errCode == ASSET_IPC_ERROR) {
        ret = ASSET_IPC_ERROR;
    } else if (errCode == ASSET_SUCCESS) {
        ret = ASSET_SUCCESS;
    } else if (errCode == ASSET_PERMISSION_DENIED) {
        ret = ASSET_PERMISSION_DENIED;
    } else if (errCode ==  ASSET_OUT_OF_MEMORY) {
        ret = ASSET_OUT_OF_MEMORY;
    } else if (errCode == ASSET_DATA_CORRUPTED) {
        ret = ASSET_DATA_CORRUPTED;
    } else if (errCode == ASSET_DUPLICATED) {
        ret = ASSET_DUPLICATED;
    } else if (errCode == ASSET_CRYPTO_ERROR) {
        ret = ASSET_CRYPTO_ERROR;
    } else if (errCode == ASSET_GET_SYSTEM_TIME_ERROR) {
        ret = ASSET_GET_SYSTEM_TIME_ERROR;
    } else if (errCode == ASSET_SERVICE_UNAVAILABLE) {
        ret = ASSET_SERVICE_UNAVAILABLE;
    } else if (errCode == ASSET_BMS_ERROR) {
        ret = ASSET_BMS_ERROR;
    } else if (errCode == ASSET_INVALID_ARGUMENT) {
        ret = ASSET_INVALID_ARGUMENT;
    } else if (errCode == ASSET_ACCESS_TOKEN_ERROR) {
        ret = ASSET_ACCESS_TOKEN_ERROR;
    } else if (errCode == ASSET_FILE_OPERATION_ERROR) {
        ret = ASSET_FILE_OPERATION_ERROR;
    } else if (errCode == ASSET_ACCOUNT_ERROR) {
        ret = ASSET_ACCOUNT_ERROR;
    } else if (errCode == ASSET_DATABASE_ERROR) {
        ret = ASSET_DATABASE_ERROR;
    } else if (errCode == ASSET_STATUS_MISMATCH) {
        ret = ASSET_STATUS_MISMATCH;
    }
    return  ret;
}

static napi_value Asset_CoverTag(napi_env env, napi_callback_info info)
{
    int32_t index;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    std::string name = __FUNCTION__;
    Asset_Blob funcName = { .size = static_cast<uint32_t>(name.size()),
        .data = reinterpret_cast<uint8_t*>(const_cast<char*>(name.c_str()))};
    static Asset_Attr attr[] = {
        { .tag = ASSET_TAG_ALIAS, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_SECRET, .value = {.blob = funcName} },
        { .tag = ASSET_TYPE_NUMBER | 0x03, .value = {.u32 = 0} },
        { .tag = ASSET_TAG_REQUIRE_PASSWORD_SET, .value = {.boolean = false} },
        { .tag = ASSET_TAG_AUTH_TOKEN, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_SYNC_TYPE, .value = {.u32 = ASSET_SYNC_TYPE_NEVER} },
        { .tag = ASSET_TAG_IS_PERSISTENT, .value = {.boolean = true} },
        { .tag = ASSET_TAG_DATA_LABEL_CRITICAL_1, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_DATA_LABEL_CRITICAL_2, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_DATA_LABEL_CRITICAL_3, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_DATA_LABEL_CRITICAL_4, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_DATA_LABEL_NORMAL_2, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_DATA_LABEL_NORMAL_3, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_DATA_LABEL_NORMAL_4, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_DATA_LABEL_NORMAL_LOCAL_1, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_DATA_LABEL_NORMAL_LOCAL_2, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_DATA_LABEL_NORMAL_LOCAL_3, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_DATA_LABEL_NORMAL_LOCAL_4, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_CONFLICT_RESOLUTION, .value = {.u32 = ASSET_CONFLICT_OVERWRITE} },
        { .tag = ASSET_TAG_UPDATE_TIME, .value = {.u32 = 0} },
        { .tag = ASSET_TAG_OPERATION_TYPE, .value = {.u32 = 0} },
        { .tag = ASSET_TAG_GROUP_ID, .value = {.u32 = 0} },
        { .tag = ASSET_TAG_WRAP_TYPE, .value = {.u32 = 0} },
    };
    const uint32_t attrSize = sizeof(attr) / sizeof(attr[0]);
    if (index < 0 || index >= attrSize) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    Asset_Attr attrToAdd[ARG_INDEX_3] = {attr[0], attr[1]};
    attrToAdd[ARG_INDEX_2] = attr[index];
    int32_t rest = OH_Asset_Add(attrToAdd, ARG_INDEX_3);
    int32_t ret = ReadCode(rest);
    return ReturnInt(env, ret, &result);
}

int32_t CheckRetCode(int32_t rest)
{
    int32_t ret = INVALID_STATUS;
    if (rest == ASSET_SUCCESS) {
        ret = ASSET_SUCCESS;
    } else if (rest == ASSET_PERMISSION_DENIED) {
        ret = ASSET_PERMISSION_DENIED;
    } else if (rest == ASSET_SERVICE_UNAVAILABLE) {
        ret = ASSET_SERVICE_UNAVAILABLE;
    } else if (rest == ASSET_DUPLICATED) {
        ret = ASSET_DUPLICATED;
    } else if (rest == ASSET_ACCESS_DENIED) {
        ret = ASSET_ACCESS_DENIED;
    } else if (rest == ASSET_STATUS_MISMATCH) {
        ret = ASSET_STATUS_MISMATCH;
    } else if (rest == ASSET_OUT_OF_MEMORY) {
        ret = ASSET_OUT_OF_MEMORY;
    } else if (rest == ASSET_DATA_CORRUPTED) {
        ret = ASSET_DATA_CORRUPTED;
    } else if (rest == ASSET_DATABASE_ERROR) {
        ret = ASSET_DATABASE_ERROR;
    } else if (rest == ASSET_CRYPTO_ERROR) {
        ret = ASSET_CRYPTO_ERROR;
    } else if (rest == ASSET_IPC_ERROR) {
        ret = ASSET_IPC_ERROR;
    } else if (rest == ASSET_BMS_ERROR) {
        ret = ASSET_BMS_ERROR;
    } else if (rest == ASSET_ACCOUNT_ERROR) {
        ret = ASSET_ACCOUNT_ERROR;
    } else if (rest == ASSET_ACCESS_TOKEN_ERROR) {
        ret = ASSET_ACCESS_TOKEN_ERROR;
    } else if (rest == ASSET_FILE_OPERATION_ERROR) {
        ret = ASSET_FILE_OPERATION_ERROR;
    } else if (rest == ASSET_GET_SYSTEM_TIME_ERROR) {
        ret = ASSET_GET_SYSTEM_TIME_ERROR;
    } else if (rest == ASSET_LIMIT_EXCEEDED) {
        ret = ASSET_LIMIT_EXCEEDED;
    } else if (rest == ASSET_UNSUPPORTED) {
        ret = ASSET_UNSUPPORTED;
    } else if (rest == ASSET_PARAM_VERIFICATION_FAILED) {
        ret = ASSET_PARAM_VERIFICATION_FAILED;
    }
    return ret;
}

static napi_value Asset_RstCode(napi_env env, napi_callback_info info)
{
    std::string sr;
    napi_value result;
    if (GetString(env, info, 0, sr) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    Asset_Blob secret{static_cast<uint32_t>(sr.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(sr.c_str()))};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_SECRET, .value = {.blob = secret}},
        {.tag = ASSET_TAG_ALIAS, .value = {.blob = secret}},
    };
    int32_t rest = OH_Asset_Add(attr, sizeof(attr) / sizeof(attr[0]));
    if (rest != ASSET_SUCCESS) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    int32_t ret = CheckRetCode(rest);
    Asset_Attr query_attr[] = {
        {.tag = ASSET_TAG_ALIAS, .value = {.blob = secret}},
        {.tag = ASSET_TAG_RETURN_TYPE, .value = {.u32 = ASSET_RETURN_ATTRIBUTES}},
    };
    Asset_ResultSet resultSet = {0};
    rest = OH_Asset_Query(query_attr, sizeof(query_attr) / sizeof(query_attr[0]), &resultSet);
    if (rest != ASSET_SUCCESS) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    for (uint32_t i = 0; i < resultSet.count; i++) {
        Asset_Attr *label = OH_Asset_ParseAttr(resultSet.results + i, ASSET_TAG_DATA_LABEL_NORMAL_1);
        if (label == nullptr) {
            continue;
        }
        if (label->value.u32 == ASSET_RETURN_ATTRIBUTES) {
            ret = ASSET_RETURN_ATTRIBUTES;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value Asset_Deny(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::string name = __FUNCTION__;
    Asset_Blob funcName = { .size = static_cast<uint32_t>(name.size()),
        .data = reinterpret_cast<uint8_t*>(const_cast<char*>(name.c_str()))};
    Asset_Attr addAttr[] = {
        { .tag = ASSET_TAG_ALIAS, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_SECRET, .value = {.blob = funcName} },
        { .tag = ASSET_TYPE_NUMBER | 0x03, .value = {.u32 = 0} },
        { .tag = ASSET_TAG_AUTH_TYPE, .value = {.u32 = ASSET_AUTH_TYPE_ANY} },
    };
    OH_Asset_Add(addAttr, sizeof(addAttr) / sizeof(addAttr[0]));
    Asset_Attr preQueryAttr[] = {};
    Asset_Blob challenge = { 0 };
    OH_Asset_PreQuery(preQueryAttr, sizeof(preQueryAttr) / sizeof(Asset_Attr), &challenge);

    Asset_ResultSet queryResultSet = { 0 };
    Asset_Attr queryAttr[] = {
        { .tag = ASSET_TAG_ALIAS, .value = {.blob = funcName} },
        { .tag = ASSET_TAG_RETURN_TYPE, .value = {.u32 = ASSET_RETURN_ALL} },
        { .tag = ASSET_TAG_AUTH_CHALLENGE, .value = {.blob = challenge} },
        { .tag = ASSET_TAG_AUTH_TOKEN, .value = {.blob = funcName} },
    };
    int ret = ASSET_SUCCESS;
    int rest = OH_Asset_Query(queryAttr, sizeof(queryAttr) / sizeof(queryAttr[0]), &queryResultSet);
    if (rest == ASSET_ACCESS_DENIED) {
        ret = ASSET_ACCESS_DENIED;
    } else {
        ret = rest;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value Asset_IPCErr(napi_env env, napi_callback_info info)
{
    std::string name = __FUNCTION__;
    Asset_Blob funcName = { .size = static_cast<uint32_t>(name.size()),
        .data = reinterpret_cast<uint8_t*>(const_cast<char*>(name.c_str()))};
    std::string ar = name;
    std::string sr = name;
    Asset_Blob secret{static_cast<uint32_t>(sr.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(sr.c_str()))};
    Asset_Blob alias{static_cast<uint32_t>(ar.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(ar.c_str()))};
    
    Asset_Blob label{static_cast<uint32_t>(sr.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(sr.c_str()))};
    Asset_Blob group{static_cast<uint32_t>(ar.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(ar.c_str()))};
    Asset_Attr attr[] = {
        {.tag = ASSET_TYPE_NUMBER | 0x03, .value = {.u32 = ASSET_ACCESSIBILITY_DEVICE_FIRST_UNLOCKED}},
        {.tag = ASSET_TAG_SECRET, .value = {.blob = secret}},
        {.tag = ASSET_TAG_ALIAS, .value = {.blob = alias}},
        {.tag = ASSET_TAG_DATA_LABEL_NORMAL_1, .value = {.blob = label}},
        {.tag = ASSET_TAG_GROUP_ID, .value = {.blob = group}},
    };

    int rest = OH_Asset_Add(attr, sizeof(attr) / sizeof(attr[0]));
    int ret = ASSET_SUCCESS;
    if (rest == ASSET_IPC_ERROR) {
        ret = ASSET_IPC_ERROR;
    } else {
        ret = rest;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static int32_t CheckTagValue(uint32_t tagVal)
{
    uint32_t ret = 0;
    if (tagVal == ASSET_ACCESSIBILITY_DEVICE_FIRST_UNLOCKED) {
        ret = ASSET_ACCESSIBILITY_DEVICE_FIRST_UNLOCKED;
    } else if (tagVal == ASSET_ACCESSIBILITY_DEVICE_UNLOCKED) {
        ret = ASSET_ACCESSIBILITY_DEVICE_UNLOCKED;
    } else if (tagVal == ASSET_AUTH_TYPE_NONE) {
        ret = ASSET_AUTH_TYPE_NONE;
    } else if (tagVal == ASSET_SYNC_TYPE_NEVER) {
        ret = ASSET_SYNC_TYPE_NEVER;
    } else if (tagVal == ASSET_SYNC_TYPE_THIS_DEVICE) {
        ret = ASSET_SYNC_TYPE_THIS_DEVICE;
    } else if (tagVal == ASSET_SYNC_TYPE_TRUSTED_DEVICE) {
        ret = ASSET_SYNC_TYPE_TRUSTED_DEVICE;
    } else if (tagVal == ASSET_SYNC_TYPE_TRUSTED_ACCOUNT) {
        ret = ASSET_SYNC_TYPE_TRUSTED_ACCOUNT;
    } else if (tagVal == ASSET_WRAP_TYPE_NEVER) {
        ret = ASSET_WRAP_TYPE_NEVER;
    } else if (tagVal == ASSET_WRAP_TYPE_TRUSTED_ACCOUNT) {
        ret = ASSET_WRAP_TYPE_TRUSTED_ACCOUNT;
    } else if (tagVal == ASSET_CONFLICT_OVERWRITE) {
        ret = ASSET_CONFLICT_OVERWRITE;
    } else if (tagVal == ASSET_CONFLICT_THROW_ERROR) {
        ret = ASSET_CONFLICT_THROW_ERROR;
    } else if (tagVal == ASSET_RETURN_ATTRIBUTES) {
        ret = ASSET_RETURN_ATTRIBUTES;
    } else if (tagVal == ASSET_NEED_SYNC) {
        ret = ASSET_NEED_SYNC;
    } else if (tagVal == ASSET_NEED_LOGOUT) {
        ret = ASSET_NEED_LOGOUT;
    }
    return ret;
}

static int32_t CheckAblity(Asset_ResultSet& resultSet)
{
    int32_t ret = INVALID_STATUS;
    for (uint32_t i = 0 ;i < resultSet.count; i++) {
        for (uint32_t j = 0; j < resultSet.results[i].count; j++) {
            uint32_t vau32 = resultSet.results[i].attrs[j].value.u32;
            ret = CheckTagValue(vau32);
        }
    }
    if (ret != INVALID_STATUS) {
        ret = 0;
    }
    return ret;
}

static int32_t AddAndQuery(const std::vector<Asset_Attr>& attrs, const Asset_Blob& secret)
{
    int ret = OH_Asset_Add(attrs.data(), attrs.size());
    if (ret != ASSET_SUCCESS) {
        return ret;
    }
    Asset_Attr preQueryAttr[] = {};
    Asset_Blob challenge = { 0 };
    ret = OH_Asset_PreQuery(preQueryAttr, sizeof(preQueryAttr) / sizeof(Asset_Attr), &challenge);
    Asset_ResultSet resultSet = { 0 };
    Asset_Attr queryAttr[] = {
        { .tag = ASSET_TAG_ALIAS, .value = {.blob = secret} },
        { .tag = ASSET_TAG_RETURN_TYPE, .value = {.u32 = ASSET_RETURN_ALL} },
    };
    int32_t rest = OH_Asset_Query(queryAttr, sizeof(queryAttr) / sizeof(queryAttr[0]), &resultSet);
    if (rest != ASSET_SUCCESS) {
        return rest;
    }
    return CheckAblity(resultSet);
}

static napi_value Asset_Ablity(napi_env env, napi_callback_info info)
{
    int32_t index;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    std::string fn = __FUNCTION__;
    Asset_Blob secret{static_cast<uint32_t>(fn.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(fn.c_str()))};
    std::vector<Asset_Attr> attrs;
    attrs.push_back({.tag = ASSET_TAG_SECRET, .value = {.blob = secret}});
    attrs.push_back({.tag = ASSET_TAG_ALIAS, .value = {.blob = secret}});
    if (index == ARG_INDEX_0) {
        attrs.push_back({.tag = ASSET_TYPE_NUMBER | 0x03, .value = {.u32 = ASSET_ACCESSIBILITY_DEVICE_FIRST_UNLOCKED}});
    } else if (index == ARG_INDEX_1) {
        attrs.push_back({.tag = ASSET_TYPE_NUMBER | 0x03, .value = {.u32 = ASSET_ACCESSIBILITY_DEVICE_UNLOCKED}});
    } else if (index == ARG_INDEX_2) {
        attrs.push_back({.tag = ASSET_TAG_AUTH_TYPE, .value = {.u32 = ASSET_AUTH_TYPE_NONE}});
    } else if (index == ARG_INDEX_3) {
        attrs.push_back({.tag = ASSET_TAG_SYNC_TYPE, .value = {.u32 = ASSET_SYNC_TYPE_NEVER}});
    } else if (index == ARG_INDEX_4) {
        attrs.push_back({.tag = ASSET_TAG_SYNC_TYPE, .value = {.u32 = ASSET_SYNC_TYPE_THIS_DEVICE}});
    } else if (index == ARG_INDEX_5) {
        attrs.push_back({.tag = ASSET_TAG_SYNC_TYPE, .value = {.u32 = ASSET_SYNC_TYPE_TRUSTED_DEVICE}});
    } else if (index == ARG_INDEX_6) {
        attrs.push_back({.tag = ASSET_TAG_SYNC_TYPE, .value = {.u32 = ASSET_SYNC_TYPE_TRUSTED_ACCOUNT}});
    } else if (index == ARG_INDEX_7) {
        attrs.push_back({.tag = ASSET_TAG_WRAP_TYPE, .value = {.u32 = ASSET_WRAP_TYPE_NEVER}});
    } else if (index == ARG_INDEX_8) {
        attrs.push_back({.tag = ASSET_TAG_WRAP_TYPE, .value = {.u32 = ASSET_WRAP_TYPE_TRUSTED_ACCOUNT}});
    } else if (index == ARG_INDEX_9) {
        attrs.push_back({.tag = ASSET_TAG_CONFLICT_RESOLUTION, .value = {.u32 = ASSET_CONFLICT_OVERWRITE}});
    } else if (index == ARG_INDEX_10) {
        attrs.push_back({.tag = ASSET_TAG_CONFLICT_RESOLUTION, .value = {.u32 = ASSET_CONFLICT_THROW_ERROR}});
    } else if (index == ARG_INDEX_11) {
        attrs.push_back({.tag = ASSET_TAG_SYNC_TYPE, .value = {.u32 = ASSET_NEED_SYNC}});
    } else if (index == ARG_INDEX_12) {
        attrs.push_back({.tag = ASSET_TAG_OPERATION_TYPE, .value = {.u32 = ASSET_NEED_LOGOUT}});
    }
    Asset_ResultSet resultSet = { 0 };
    int32_t ret = AddAndQuery(attrs, secret);
    return ReturnInt(env, ret, &result);
}

static napi_value Asset_ResultMember(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t index;
    std::string ar;
    if (GetInt(env, info, 0, index) == false || GetString(env, info, 1, ar) == false) {
        return ReturnInt(env, INVALID_STATUS, &result);
    }
    Asset_Blob alias{static_cast<uint32_t>(ar.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(ar.c_str()))};
    Asset_Blob secret{static_cast<uint32_t>(ar.length()), reinterpret_cast<uint8_t *>(const_cast<char *>(ar.c_str()))};
    Asset_Attr attr[] = {
        {.tag = ASSET_TAG_SECRET, .value = {.blob = secret}},
        {.tag = ASSET_TAG_ALIAS, .value = {.blob = alias}},
        {.tag = ASSET_TAG_REQUIRE_ATTR_ENCRYPTED, .value = {.boolean = true}},
    };
    OH_Asset_Add(attr, sizeof(attr) / sizeof(attr[0]));
    Asset_Attr attr2[] = {
        {.tag = ASSET_TAG_ALIAS, .value = {.blob = alias}},
        {.tag = ASSET_TAG_RETURN_TYPE, .value = {.u32 = ASSET_RETURN_ALL}},
        {.tag = ASSET_TAG_REQUIRE_ATTR_ENCRYPTED, .value = {.boolean = true}},
    };
    Asset_ResultSet resultSet = {0};
    int32_t ret = OH_Asset_Query(attr2, sizeof(attr2) / sizeof(attr2[0]), &resultSet);
    if (ret != ASSET_SUCCESS) {
        return ReturnInt(env, ret, &result);
    }
    Asset_Attr* attrs = nullptr;
    int32_t cnt = INVALID_STATUS;
    for (uint32_t i = 0; i < resultSet.count; i++) {
        Asset_Result* results = resultSet.results + i;
        if (results) {
            attrs = results->attrs;
            cnt = static_cast<int32_t>(results->count);
            break;
        }
    }
    OH_Asset_FreeResultSet(&resultSet);
    if (index == ARG_INDEX_0) {
        ret = (cnt != INVALID_STATUS) ? 0 : INVALID_STATUS;
    } else {
        ret = attrs ? 0 : INVALID_STATUS;
    }
    return ReturnInt(env, ret, &result);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"Asset_Add", nullptr, Asset_Add, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_Remove", nullptr, Asset_Remove, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_RemoveAll", nullptr, Asset_RemoveAll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_Update", nullptr, Asset_Update, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_PreQuery", nullptr, Asset_PreQuery, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_Query", nullptr, Asset_Query, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_QuerySyncResult", nullptr, Asset_QuerySyncResult, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_CoverTagType", nullptr, Asset_CoverTagType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_CoverTag", nullptr, Asset_CoverTag, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_RstCode", nullptr, Asset_RstCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_Deny", nullptr, Asset_Deny, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_IPCErr", nullptr, Asset_IPCErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_Ablity", nullptr, Asset_Ablity, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asset_ResultMember", nullptr, Asset_ResultMember, nullptr, nullptr, nullptr, napi_default, nullptr},
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
                               .nm_modname = "assetstoretest",
                               .nm_priv = ((void *)0),
                               .reserved = {0}};

/*
 * module register
 */
extern "C" __attribute__((constructor)) void MyPixelMapRegisterModule(void) { napi_module_register(&g_module); }