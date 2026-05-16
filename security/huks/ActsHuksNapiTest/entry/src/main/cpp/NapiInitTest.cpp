/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <array>
#include "include/HuksAgreeDhTest.h"
#include "include/HuksAgreeEcdhTest.h"
#include "include/HuksAgreeX25519Test.h"
#include "include/HuksAttestTest.h"
#include "include/HuksCipherAesTest.h"
#include "include/HuksCipherRsaTest.h"
#include "include/HuksCipherSm4Test.h"
#include "include/HuksDeriveHkdfTest.h"
#include "include/HuksDerivePbkdfTest.h"
#include "include/HuksHmacTest.h"
#include "include/HuksMiscTest.h"
#include "include/HuksNullptrTest.h"
#include "include/HuksSignVerifyDsaTest.h"
#include "include/HuksSignVerifyEccTest.h"
#include "include/HuksSignVerifyEd25519Test.h"
#include "include/HuksSignVerifyRsaTest.h"
#include "include/HuksSignVerifySm2Test.h"
#include "include/HuksTest.h"
#include "include/HuksWrappedTest.h"
#include "napi/native_api.h"

// Case number constants
enum CaseNum {
    CASE_NUM_0 = 0,
    CASE_NUM_1,
};

// 异步工作数据结构（用于 RSA 测试）
struct AsyncHuksRsaTestData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int testCaseIndex = -1;
    int result = -1;
};

// 在工作线程执行 RSA 测试（不阻塞主线程）
static void ExecuteHuksRsaAsyncWork(napi_env env, void* data)
{
    AsyncHuksRsaTestData* workData = static_cast<AsyncHuksRsaTestData*>(data);

    // 在工作线程执行耗时的 RSA-4096 密钥生成和加密解密测试
    if (workData->testCaseIndex == CASE_NUM_0) {
        workData->result = Acts::Huks::SecurityHuksNapiCipherRsa0100();
    } else {
        workData->result = RESULT_ERROR;
    }
}

// 完成回调（回到主线程，处理 Promise）
static void CompleteHuksRsaAsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncHuksRsaTestData* workData = static_cast<AsyncHuksRsaTestData*>(data);

    napi_value result;
    napi_create_int32(env, workData->result, &result);

    // 根据测试结果 resolve 或 reject Promise
    if (workData->result == 0) {
        napi_resolve_deferred(env, workData->deferred, result);
    } else {
        napi_reject_deferred(env, workData->deferred, result);
    }

    // 清理资源
    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

// 异步工作数据结构（用于 Wrapped 测试）
struct AsyncHuksWrappedTestData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int testCaseIndex = -1;
    int result = -1;
};

// 在工作线程执行 Wrapped 测试（不阻塞主线程）
static void ExecuteHuksWrappedAsyncWork(napi_env env, void* data)
{
    AsyncHuksWrappedTestData* workData = static_cast<AsyncHuksWrappedTestData*>(data);

    // 在工作线程执行耗时的包装密钥导入测试
    if (workData->testCaseIndex == CASE_NUM_0) {
        workData->result = Acts::Huks::SecurityHuksNapiWrapped0100();
    } else {
        workData->result = RESULT_ERROR;
    }
}

// 完成回调（回到主线程，处理 Promise）
static void CompleteHuksWrappedAsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncHuksWrappedTestData* workData = static_cast<AsyncHuksWrappedTestData*>(data);

    napi_value result;
    napi_create_int32(env, workData->result, &result);

    // 根据测试结果 resolve 或 reject Promise
    if (workData->result == 0) {
        napi_resolve_deferred(env, workData->deferred, result);
    } else {
        napi_reject_deferred(env, workData->deferred, result);
    }

    // 清理资源
    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

// 异步工作数据结构（用于 Attest 测试）
struct AsyncHuksAttestTestData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int testCaseIndex = -1;
    int result = -1;
};

// 在工作线程执行 Attest 测试（不阻塞主线程）
static void ExecuteHuksAttestAsyncWork(napi_env env, void* data)
{
    AsyncHuksAttestTestData* workData = static_cast<AsyncHuksAttestTestData*>(data);

    // 在工作线程执行耗时的密钥认证测试
    if (workData->testCaseIndex == CASE_NUM_0) {
        workData->result = Acts::Huks::SecurityHuksNapiAttest0100();
    } else {
        workData->result = RESULT_ERROR;
    }
}

// 完成回调（回到主线程，处理 Promise）
static void CompleteHuksAttestAsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncHuksAttestTestData* workData = static_cast<AsyncHuksAttestTestData*>(data);

    napi_value result;
    napi_create_int32(env, workData->result, &result);

    // 根据测试结果 resolve 或 reject Promise
    if (workData->result == 0) {
        napi_resolve_deferred(env, workData->deferred, result);
    } else {
        napi_reject_deferred(env, workData->deferred, result);
    }

    // 清理资源
    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

// HuksAgreeDh Test Group
static napi_value HuksAgreeDhTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiAgreeDh0100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksAgreeEcdh Test Group
static napi_value HuksAgreeEcdhTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiAgreeEcdh0100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksAgreeX25519 Test Group
static napi_value HuksAgreeX25519Test(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiAgreeX255190100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksAttest Test Group（异步版本）
static napi_value HuksAttestTest(napi_env env, napi_callback_info info)
{
    // 1. 获取参数
    size_t argc = 1;
    napi_value args[1];
    napi_valuetype valuetype;
    int32_t caseNum = -1;
    napi_status status;

    if ((status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) != napi_ok ||
        napi_typeof(env, args[0], &valuetype) != napi_ok || valuetype != napi_number ||
        (status = napi_get_value_int32(env, args[0], &caseNum)) != napi_ok) {
        napi_throw_error(env, nullptr, "Invalid argument");
        return nullptr;
    }

    // 2. 创建 Promise
    napi_value promise;
    napi_deferred deferred;
    if ((status = napi_create_promise(env, &deferred, &promise)) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }

    // 3. 创建异步工作数据
    AsyncHuksAttestTestData* workData = new AsyncHuksAttestTestData();
    workData->deferred = deferred;
    workData->testCaseIndex = caseNum;

    // 4. 创建异步工作
    napi_value resourceName;
    napi_create_string_utf8(env, "HuksAttestTest", NAPI_AUTO_LENGTH, &resourceName);

    if ((status = napi_create_async_work(env,
                                         nullptr,
                                         resourceName,
                                         ExecuteHuksAttestAsyncWork,
                                         CompleteHuksAttestAsyncWork,
                                         workData,
                                         &workData->asyncWork)) != napi_ok ||
        (status = napi_queue_async_work(env, workData->asyncWork)) != napi_ok) {
        // 失败时清理资源
        if (workData->asyncWork) {
            napi_delete_async_work(env, workData->asyncWork);
        }
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create/queue async work");
        return nullptr;
    }

    // 5. 返回 Promise（主线程立即返回，不阻塞）
    return promise;
}

// HuksCipherAes Test Group
static napi_value HuksCipherAesTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiCipherAes0100();
                break;
            case CASE_NUM_1:
                result = Acts::Huks::SecurityHuksNapiCipherAes0200();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksCipherRsa Test Group
static napi_value HuksCipherRsaTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiCipherRsa0100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksCipherRsa Test Group（异步 Promise 版本）
static napi_value HuksCipherRsaTestAsync(napi_env env, napi_callback_info info)
{
    // 1. 获取参数
    size_t argc = 1;
    napi_value args[1];
    napi_valuetype valuetype;
    int32_t caseNum = -1;
    napi_status status;

    if ((status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) != napi_ok ||
        napi_typeof(env, args[0], &valuetype) != napi_ok || valuetype != napi_number ||
        (status = napi_get_value_int32(env, args[0], &caseNum)) != napi_ok) {
        napi_throw_error(env, nullptr, "Invalid argument");
        return nullptr;
    }

    // 2. 创建 Promise
    napi_value promise;
    napi_deferred deferred;
    if ((status = napi_create_promise(env, &deferred, &promise)) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }

    // 3. 创建异步工作数据
    AsyncHuksRsaTestData* workData = new AsyncHuksRsaTestData();
    workData->deferred = deferred;
    workData->testCaseIndex = caseNum;

    // 4. 创建异步工作
    napi_value resourceName;
    napi_create_string_utf8(env, "HuksCipherRsaTestAsync", NAPI_AUTO_LENGTH, &resourceName);

    if ((status = napi_create_async_work(env,
                                         nullptr,
                                         resourceName,
                                         ExecuteHuksRsaAsyncWork,
                                         CompleteHuksRsaAsyncWork,
                                         workData,
                                         &workData->asyncWork)) != napi_ok ||
        (status = napi_queue_async_work(env, workData->asyncWork)) != napi_ok) {
        // 失败时清理资源
        if (workData->asyncWork) {
            napi_delete_async_work(env, workData->asyncWork);
        }
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create/queue async work");
        return nullptr;
    }

    // 5. 返回 Promise（主线程立即返回，不阻塞）
    return promise;
}

// HuksCipherSm4 Test Group
static napi_value HuksCipherSm4Test(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiCipherSm40100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksDeriveHkdf Test Group
static napi_value HuksDeriveHkdfTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiDeriveHkdf0100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksDerivePbkdf Test Group
static napi_value HuksDerivePbkdfTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiDerivePbkdf0100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksHmac Test Group
static napi_value HuksHmacTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiHmacHmac0100();
                break;
            case CASE_NUM_1:
                result = Acts::Huks::SecurityHuksNapiHmacSm30100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksMisc Test Group
static napi_value HuksMiscTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiMisc0100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksNullptr Test Group
static napi_value HuksNullptrTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiNullptr0100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksSignVerifyDsa Test Group
static napi_value HuksSignVerifyDsaTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiSignVerifyDsa0100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksSignVerifyEcc Test Group
static napi_value HuksSignVerifyEccTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiSignVerifyEcc0100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksSignVerifyEd25519 Test Group
static napi_value HuksSignVerifyEd25519Test(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiSignVerifyEd255190100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksSignVerifyRsa Test Group（异步版本）
static napi_value HuksSignVerifyRsaTest(napi_env env, napi_callback_info info)
{
    // 1. 获取参数
    size_t argc = 1;
    napi_value args[1];
    napi_valuetype valuetype;
    int32_t caseNum = -1;
    napi_status status;

    if ((status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) != napi_ok ||
        napi_typeof(env, args[0], &valuetype) != napi_ok || valuetype != napi_number ||
        (status = napi_get_value_int32(env, args[0], &caseNum)) != napi_ok) {
        napi_throw_error(env, nullptr, "Invalid argument");
        return nullptr;
    }

    // 2. 创建 Promise
    napi_value promise;
    napi_deferred deferred;
    if ((status = napi_create_promise(env, &deferred, &promise)) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }

    // 3. 创建异步工作数据
    AsyncHuksRsaTestData* workData = new AsyncHuksRsaTestData();
    workData->deferred = deferred;
    workData->testCaseIndex = caseNum;

    // 4. 创建异步工作
    napi_value resourceName;
    napi_create_string_utf8(env, "HuksRsaSignVerifyTest", NAPI_AUTO_LENGTH, &resourceName);

    if ((status = napi_create_async_work(env,
                                         nullptr,
                                         resourceName,
                                         ExecuteHuksRsaAsyncWork,
                                         CompleteHuksRsaAsyncWork,
                                         workData,
                                         &workData->asyncWork)) != napi_ok ||
        (status = napi_queue_async_work(env, workData->asyncWork)) != napi_ok) {
        // 失败时清理资源
        if (workData->asyncWork) {
            napi_delete_async_work(env, workData->asyncWork);
        }
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create/queue async work");
        return nullptr;
    }

    // 5. 返回 Promise（主线程立即返回，不阻塞）
    return promise;
}

// HuksSignVerifySm2 Test Group
static napi_value HuksSignVerifySm2Test(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Huks::SecurityHuksNapiSignVerifySm20100();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HuksWrapped Test Group（异步版本）
static napi_value HuksWrappedTest(napi_env env, napi_callback_info info)
{
    // 1. 获取参数
    size_t argc = 1;
    napi_value args[1];
    napi_valuetype valuetype;
    int32_t caseNum = -1;
    napi_status status;

    if ((status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) != napi_ok ||
        napi_typeof(env, args[0], &valuetype) != napi_ok || valuetype != napi_number ||
        (status = napi_get_value_int32(env, args[0], &caseNum)) != napi_ok) {
        napi_throw_error(env, nullptr, "Invalid argument");
        return nullptr;
    }

    // 2. 创建 Promise
    napi_value promise;
    napi_deferred deferred;
    if ((status = napi_create_promise(env, &deferred, &promise)) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }

    // 3. 创建异步工作数据
    AsyncHuksWrappedTestData* workData = new AsyncHuksWrappedTestData();
    workData->deferred = deferred;
    workData->testCaseIndex = caseNum;

    // 4. 创建异步工作
    napi_value resourceName;
    napi_create_string_utf8(env, "HuksWrappedTest", NAPI_AUTO_LENGTH, &resourceName);

    if ((status = napi_create_async_work(env,
                                         nullptr,
                                         resourceName,
                                         ExecuteHuksWrappedAsyncWork,
                                         CompleteHuksWrappedAsyncWork,
                                         workData,
                                         &workData->asyncWork)) != napi_ok ||
        (status = napi_queue_async_work(env, workData->asyncWork)) != napi_ok) {
        // 失败时清理资源
        if (workData->asyncWork) {
            napi_delete_async_work(env, workData->asyncWork);
        }
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create/queue async work");
        return nullptr;
    }

    // 5. 返回 Promise（主线程立即返回，不阻塞）
    return promise;
}

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

static const napi_property_descriptor g_huksDescriptors[] = {
    DECL_NAPI_DESC(HuksAgreeDhTest),       DECL_NAPI_DESC(HuksAgreeEcdhTest),
    DECL_NAPI_DESC(HuksAgreeX25519Test),   DECL_NAPI_DESC(HuksAttestTest),
    DECL_NAPI_DESC(HuksCipherAesTest),     DECL_NAPI_DESC(HuksCipherRsaTest),
    DECL_NAPI_DESC(HuksCipherRsaTestAsync), DECL_NAPI_DESC(HuksCipherSm4Test),
    DECL_NAPI_DESC(HuksDeriveHkdfTest),    DECL_NAPI_DESC(HuksDerivePbkdfTest),
    DECL_NAPI_DESC(HuksHmacTest),          DECL_NAPI_DESC(HuksMiscTest),
    DECL_NAPI_DESC(HuksNullptrTest),       DECL_NAPI_DESC(HuksSignVerifyDsaTest),
    DECL_NAPI_DESC(HuksSignVerifyEccTest), DECL_NAPI_DESC(HuksSignVerifyEd25519Test),
    DECL_NAPI_DESC(HuksSignVerifyRsaTest), DECL_NAPI_DESC(HuksSignVerifySm2Test),
    DECL_NAPI_DESC(HuksWrappedTest),
};

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(
        env, exports, sizeof(g_huksDescriptors) / sizeof(g_huksDescriptors[CASE_NUM_0]), g_huksDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module huksModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "huks",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&huksModule);
}
