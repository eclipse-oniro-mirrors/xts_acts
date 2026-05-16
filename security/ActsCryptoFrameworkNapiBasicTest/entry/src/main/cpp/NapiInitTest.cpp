/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include "include/CommonToolTest.h"
#include "include/CryptoFrameworkAgreementTest.h"
#include "include/CryptoFrameworkAsymCipherTest.h"
#include "include/CryptoFrameworkAsymKey2Test.h"
#include "include/CryptoFrameworkAsymKeyTest.h"
#include "include/CryptoFrameworkCommonTest.h"
#include "include/CryptoFrameworkDigestTest.h"
#include "include/CryptoFrameworkKdfTest.h"
#include "include/CryptoFrameworkMacTest.h"
#include "include/CryptoFrameworkRandomTest.h"
#include "include/CryptoFrameworkReinforcementTest.h"
#include "include/CryptoFrameworkSignatureTest.h"
#include "include/CryptoFrameworkSignature2Test.h"
#include "include/CryptoFrameworkSymCipherTest.h"
#include "include/CryptoFrameworkSymKeyTest.h"
#include "include/CryptoFrameworkVerifyTest.h"
#include "napi/native_api.h"

using namespace Unittest::CryptoFramework;

static constexpr int ARG_INDEX = 0;
static constexpr int ARG_INDEX_1 = 1;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

static constexpr size_t CRYPTO_FRAMEWORK_AGREEMENT_TEST_COUNT = 8;
static constexpr size_t CRYPTO_FRAMEWORK_ASYM_CIPHER_TEST_COUNT = 21;
static constexpr size_t CRYPTO_FRAMEWORK_ASYM_KEY_TEST_COUNT = 21;
static constexpr size_t CRYPTO_FRAMEWORK_ASYM_KEY2_TEST_COUNT = 28;
static constexpr size_t CRYPTO_FRAMEWORK_DIGEST_TEST_COUNT = 9;
static constexpr size_t CRYPTO_FRAMEWORK_KDF_TEST_COUNT = 14;
static constexpr size_t CRYPTO_FRAMEWORK_MAC_TEST_COUNT = 11;
static constexpr size_t CRYPTO_FRAMEWORK_RANDOM_TEST_COUNT = 6;
static constexpr size_t CRYPTO_FRAMEWORK_REINFORCEMENT_TEST_COUNT = 56;
static constexpr size_t CRYPTO_FRAMEWORK_SIGNATURE_TEST_COUNT = 20;
static constexpr size_t CRYPTO_FRAMEWORK_SIGNATURE2_TEST_COUNT = 20;
static constexpr size_t CRYPTO_FRAMEWORK_SYM_CIPHER_TEST_COUNT = 29;
static constexpr size_t CRYPTO_FRAMEWORK_SYM_KEY_TEST_COUNT = 11;
static constexpr size_t CRYPTO_FRAMEWORK_VERIFY_TEST_COUNT = 28;
static constexpr size_t PREPARE_FUNC_COUNT = 4;

using TestHandler = int (*)();

using PrepareFn = void (*)();

int DispatchByCaseNum(int caseNum, const TestHandler* handlers, size_t count)
{
    if (caseNum < 0 || caseNum >= count) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}
 	 
int DispatchByCaseNum(int caseNum, const PrepareFn* handlers, size_t count)
{
    if (caseNum < 0 || caseNum >= count) {
        return RESULT_ERROR;
    }
    if (handlers[caseNum] != nullptr) {
        handlers[caseNum]();
    }
    return SUCCESS_CODE;
}

struct GenericAsyncContext {
    napi_env env;
    napi_async_work work;
    napi_deferred deferred;
 	 
    int32_t caseNum;
    int result;
 	 
    const TestHandler* handlers;
    size_t handlerCount;
};

static void ExecuteGenericWork(napi_env env, void* data)
{
    auto* context = static_cast<GenericAsyncContext*>(data);
    try {
        context->result = DispatchByCaseNum(context->caseNum, context->handlers, context->handlerCount);
    } catch (...) {
        context->result = RESULT_ERROR;
    }
}

static void CompleteGenericWork(napi_env env, napi_status status, void* data)
{
    auto* context = static_cast<GenericAsyncContext*>(data);
 	 
    napi_value resultValue;
    napi_create_int32(env, context->result, &resultValue);
 	 
    napi_resolve_deferred(env, context->deferred, resultValue);
    napi_delete_async_work(env, context->work);
 	 
    delete context;
}

static napi_value CreatePrepareFunc(napi_env env, napi_callback_info info, const PrepareFn* handlers, size_t count)
{
    int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
    if (caseNum < 0 || caseNum >= count) {
        napi_throw_error(env, nullptr, "Invalid case number");
        return nullptr;
    }
    int resultCode = DispatchByCaseNum(caseNum, handlers, count);
    napi_value result;
    napi_create_int32(env, resultCode, &result);
    return result;
}

static napi_value CreateAsyncTest(napi_env env,
                                  napi_callback_info info,
                                  const TestHandler* handlers,
                                  size_t handlerCount,
                                  const char* resourceNameStr)
{
    int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
    if (caseNum < 0 || caseNum >= handlerCount) {
        napi_throw_error(env, nullptr, "Invalid case number");
        return nullptr;
    }
    napi_value promise;
    auto* context = new GenericAsyncContext();
    context->env = env;
    context->caseNum = caseNum;
    context->result = RESULT_ERROR;
    context->handlers = handlers;
    context->handlerCount = handlerCount;
    napi_create_promise(env, &context->deferred, &promise);
    napi_value resourceName;
    napi_create_string_utf8(env, resourceNameStr, NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(
        env, nullptr, resourceName, ExecuteGenericWork, CompleteGenericWork, context, &context->work);
        napi_queue_async_work(env, context->work);
    return promise;
}

static const std::array<TestHandler, CRYPTO_FRAMEWORK_AGREEMENT_TEST_COUNT> g_agreementTestHandlers = {
    SubCryptoFrameworkNapiAgreementTest0100,
    SubCryptoFrameworkNapiAgreementTest0200,
    SubCryptoFrameworkNapiAgreementTest0300,
    SubCryptoFrameworkNapiAgreementTest0400,
    SubCryptoFrameworkNapiAgreementTest0500,
    SubCryptoFrameworkNapiAgreementVectorTest0100,
    SubCryptoFrameworkNapiAgreementVectorTest0200,
    SubCryptoFrameworkNapiAgreementVectorTest0300
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_ASYM_CIPHER_TEST_COUNT> g_asymCipherTestHandlers = {
    SubCryptoFrameworkNapiAsymCipherTest0100,
    SubCryptoFrameworkNapiAsymCipherTest0200,
    SubCryptoFrameworkNapiAsymCipherTest0300,
    SubCryptoFrameworkNapiAsymCipherTest0400,
    SubCryptoFrameworkNapiAsymCipherTest0500,
    SubCryptoFrameworkNapiAsymCipherTest0600,
    SubCryptoFrameworkNapiAsymCipherTest0700,
    SubCryptoFrameworkNapiAsymCipherTest0800,
    SubCryptoFrameworkNapiAsymCipherTest0900,
    SubCryptoFrameworkNapiAsymCipherTest1000,
    SubCryptoFrameworkNapiAsymCipherTest1100,
    SubCryptoFrameworkNapiAsymCipherTest1200,
    SubCryptoFrameworkNapiAsymCipherTest1300,
    SubCryptoFrameworkNapiAsymCipherTest1400,
    SubCryptoFrameworkNapiAsymCipherTest1500,
    SubCryptoFrameworkNapiAsymCipherTest1600,
    SubCryptoFrameworkNapiAsymCipherTest1700,
    SubCryptoFrameworkNapiAsymCipherTest1800,
    SubCryptoFrameworkNapiAsymCipherTest1900,
    SubCryptoFrameworkNapiAsymCipherTest2000,
    SubCryptoFrameworkNapiAsymCipherTest2100
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_ASYM_KEY_TEST_COUNT> g_asymKeyTestHandlers = {
    SubCryptoFrameworkNapiAsymKeyTest0100,
    SubCryptoFrameworkNapiAsymKeyTest0200,
    SubCryptoFrameworkNapiAsymKeyTest0300,
    SubCryptoFrameworkNapiAsymKeyTest0400,
    SubCryptoFrameworkNapiAsymKeyTest0500,
    SubCryptoFrameworkNapiAsymKeyTest0600,
    SubCryptoFrameworkNapiAsymKeyTest0700,
    SubCryptoFrameworkNapiAsymKeyTest0800,
    SubCryptoFrameworkNapiAsymKeyTest0900,
    SubCryptoFrameworkNapiAsymKeyTest1000,
    SubCryptoFrameworkNapiAsymKeyTest1100,
    SubCryptoFrameworkNapiAsymKeyTest1200,
    SubCryptoFrameworkNapiAsymKeyTest1300,
    SubCryptoFrameworkNapiAsymKeyTest1400,
    SubCryptoFrameworkNapiAsymKeyTest1500,
    SubCryptoFrameworkNapiAsymKeyTest1600,
    SubCryptoFrameworkNapiAsymKeyTest1700,
    SubCryptoFrameworkNapiAsymKeyTest1800,
    SubCryptoFrameworkNapiAsymKeyTest1900,
    SubCryptoFrameworkNapiAsymKeyTest2000,
    SubCryptoFrameworkNapiAsymKeyTest2100,
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_ASYM_KEY2_TEST_COUNT> g_asymKey2TestHandlers = {
    SubCryptoFrameworkNapiAsymKey2Test0100,
    SubCryptoFrameworkNapiAsymKey2Test0200,
    SubCryptoFrameworkNapiAsymKey2Test0300,
    SubCryptoFrameworkNapiAsymKey2Test0400,
    SubCryptoFrameworkNapiAsymKey2Test0500,
    SubCryptoFrameworkNapiAsymKey2Test0600,
    SubCryptoFrameworkNapiAsymKey2Test0700,
    SubCryptoFrameworkNapiAsymKey2Test0800,
    SubCryptoFrameworkNapiAsymKey2Test0900,
    SubCryptoFrameworkNapiAsymKey2Test1000,
    SubCryptoFrameworkNapiAsymKey2Test1100,
    SubCryptoFrameworkNapiAsymKey2Test1200,
    SubCryptoFrameworkNapiAsymKey2Test1300,
    SubCryptoFrameworkNapiAsymKey2Test1400,
    SubCryptoFrameworkNapiAsymKey2Test1500,
    SubCryptoFrameworkNapiAsymKey2Test1600,
    SubCryptoFrameworkNapiAsymKey2Test1700,
    SubCryptoFrameworkNapiAsymKey2Test1800,
    SubCryptoFrameworkNapiAsymKey2Test1900,
    SubCryptoFrameworkNapiAsymKey2Test2000,
    SubCryptoFrameworkNapiAsymKey2Test2100,
    SubCryptoFrameworkNapiAsymKey2Test2200,
    SubCryptoFrameworkNapiAsymKey2Test2300,
    SubCryptoFrameworkNapiAsymKey2Test2400,
    SubCryptoFrameworkNapiAsymKey2Test2500,
    SubCryptoFrameworkNapiAsymKey2Test2600,
    SubCryptoFrameworkNapiAsymKey2Test2700,
    SubCryptoFrameworkNapiAsymKey2Test2800
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_DIGEST_TEST_COUNT> g_digestTestHandlers = {
    SubCryptoFrameworkNapiDigestTest0100,
    SubCryptoFrameworkNapiDigestTest0200,
    SubCryptoFrameworkNapiDigestTest0300,
    SubCryptoFrameworkNapiDigestTest0400,
    SubCryptoFrameworkNapiDigestTest0500,
    SubCryptoFrameworkNapiDigestTest0600,
    SubCryptoFrameworkNapiDigestTest0700,
    SubCryptoFrameworkNapiDigestTest0800,
    SubCryptoFrameworkNapiDigestTest0900
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_KDF_TEST_COUNT> g_kdfTestHandlers = {
    SubCryptoFrameworkNapiKdfTest0100,
    SubCryptoFrameworkNapiKdfTest0200,
    SubCryptoFrameworkNapiKdfTest0300,
    SubCryptoFrameworkNapiKdfTest0400,
    SubCryptoFrameworkNapiKdfTest0500,
    SubCryptoFrameworkNapiKdfTest0600,
    SubCryptoFrameworkNapiKdfTest0700,
    SubCryptoFrameworkNapiKdfTest0800,
    SubCryptoFrameworkNapiKdfTest0900,
    SubCryptoFrameworkNapiKdfTest1000,
    SubCryptoFrameworkNapiKdfTest1100,
    SubCryptoFrameworkNapiKdfTest1200,
    SubCryptoFrameworkNapiKdfVectorTest0100,
    SubCryptoFrameworkNapiKdfTest1300
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_MAC_TEST_COUNT> g_macTestHandlers = {
    SubCryptoFrameworkNapiMacTest0100,
    SubCryptoFrameworkNapiMacTest0200,
    SubCryptoFrameworkNapiMacTest0300,
    SubCryptoFrameworkNapiMacTest0400,
    SubCryptoFrameworkNapiMacTest0500,
    SubCryptoFrameworkNapiMacTest0600,
    SubCryptoFrameworkNapiMacTest0700,
    SubCryptoFrameworkNapiMacTest0800,
    SubCryptoFrameworkNapiMacTest0900,
    SubCryptoFrameworkNapiMacTest1000,
    SubCryptoFrameworkNapiMacVectorTest0100
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_RANDOM_TEST_COUNT> g_randomTestHandlers = {
    SubCryptoFrameworkNapiRandomTest0100,
    SubCryptoFrameworkNapiRandomTest0200,
    SubCryptoFrameworkNapiRandomTest0300,
    SubCryptoFrameworkNapiRandomTest0400,
    SubCryptoFrameworkNapiRandomTest0500,
    SubCryptoFrameworkNapiRandomTest0600
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_REINFORCEMENT_TEST_COUNT> g_reinforcementTestHandlers = {
    SubCryptoFrameworkNapiReinforcementTest0100,
    SubCryptoFrameworkNapiReinforcementTest0200,
    SubCryptoFrameworkNapiReinforcementTest0300,
    SubCryptoFrameworkNapiReinforcementTest0400,
    SubCryptoFrameworkNapiReinforcementTest0500,
    SubCryptoFrameworkNapiReinforcementTest0600,
    SubCryptoFrameworkNapiReinforcementTest0700,
    SubCryptoFrameworkNapiReinforcementTest0800,
    SubCryptoFrameworkNapiReinforcementTest0900,
    SubCryptoFrameworkNapiReinforcementTest1000,
    SubCryptoFrameworkNapiReinforcementTest1100,
    SubCryptoFrameworkNapiReinforcementTest1200,
    SubCryptoFrameworkNapiReinforcementTest1300,
    SubCryptoFrameworkNapiReinforcementTest1400,
    SubCryptoFrameworkNapiReinforcementTest1500,
    SubCryptoFrameworkNapiReinforcementTest1600,
    SubCryptoFrameworkNapiReinforcementTest1700,
    SubCryptoFrameworkNapiReinforcementTest1800,
    SubCryptoFrameworkNapiReinforcementTest1900,
    SubCryptoFrameworkNapiReinforcementTest2000,
    SubCryptoFrameworkNapiReinforcementTest2100,
    SubCryptoFrameworkNapiReinforcementTest2200,
    SubCryptoFrameworkNapiReinforcementTest2300,
    SubCryptoFrameworkNapiReinforcementTest2400,
    SubCryptoFrameworkNapiReinforcementTest2500,
    SubCryptoFrameworkNapiReinforcementTest2600,
    SubCryptoFrameworkNapiReinforcementTest2700,
    SubCryptoFrameworkNapiReinforcementTest2800,
    SubCryptoFrameworkNapiReinforcementTest2900,
    SubCryptoFrameworkNapiReinforcementTest3000,
    SubCryptoFrameworkNapiReinforcementTest3100,
    SubCryptoFrameworkNapiReinforcementTest3200,
    SubCryptoFrameworkNapiReinforcementTest3300,
    SubCryptoFrameworkNapiReinforcementTest3400,
    SubCryptoFrameworkNapiReinforcementTest3500,
    SubCryptoFrameworkNapiReinforcementTest3600,
    SubCryptoFrameworkNapiReinforcementTest3700,
    SubCryptoFrameworkNapiReinforcementTest3800,
    SubCryptoFrameworkNapiReinforcementTest3900,
    SubCryptoFrameworkNapiReinforcementTest4000,
    SubCryptoFrameworkNapiReinforcementTest4100,
    SubCryptoFrameworkNapiReinforcementTest4200,
    SubCryptoFrameworkNapiReinforcementTest4300,
    SubCryptoFrameworkNapiReinforcementTest4400,
    SubCryptoFrameworkNapiReinforcementTest4500,
    SubCryptoFrameworkNapiReinforcementTest4600,
    SubCryptoFrameworkNapiReinforcementTest4700,
    SubCryptoFrameworkNapiReinforcementTest4800,
    SubCryptoFrameworkNapiReinforcementTest4900,
    SubCryptoFrameworkNapiReinforcementTest5000,
    SubCryptoFrameworkNapiReinforcementTest5100,
    SubCryptoFrameworkNapiReinforcementTest5200,
    SubCryptoFrameworkNapiReinforcementTest5300,
    SubCryptoFrameworkNapiReinforcementTest5400,
    SubCryptoFrameworkNapiReinforcementTest5500,
    SubCryptoFrameworkNapiReinforcementTest5600
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_SIGNATURE_TEST_COUNT> g_signatureTestHandlers = {
    SubCryptoFrameworkNapiSignatureTest0100,
    SubCryptoFrameworkNapiSignatureTest0200,
    SubCryptoFrameworkNapiSignatureTest0300,
    SubCryptoFrameworkNapiSignatureTest0400,
    SubCryptoFrameworkNapiSignatureTest0500,
    SubCryptoFrameworkNapiSignatureTest0600,
    SubCryptoFrameworkNapiSignatureTest0700,
    SubCryptoFrameworkNapiSignatureTest0800,
    SubCryptoFrameworkNapiSignatureTest0900,
    SubCryptoFrameworkNapiSignatureTest1000,
    SubCryptoFrameworkNapiSignatureTest1100,
    SubCryptoFrameworkNapiSignatureTest1200,
    SubCryptoFrameworkNapiSignatureTest1300,
    SubCryptoFrameworkNapiSignatureTest1400,
    SubCryptoFrameworkNapiSignatureTest1500,
    SubCryptoFrameworkNapiSignatureTest1600,
    SubCryptoFrameworkNapiSignatureTest1700,
    SubCryptoFrameworkNapiSignatureTest1800,
    SubCryptoFrameworkNapiSignatureTest1900,
    SubCryptoFrameworkNapiSignatureTest2000
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_SIGNATURE2_TEST_COUNT> g_signature2TestHandlers = {
    SubCryptoFrameworkNapiSignature2Test0100,
    SubCryptoFrameworkNapiSignature2Test0200,
    SubCryptoFrameworkNapiSignature2Test0300,
    SubCryptoFrameworkNapiSignature2Test0400,
    SubCryptoFrameworkNapiSignature2Test0500,
    SubCryptoFrameworkNapiSignature2Test0600,
    SubCryptoFrameworkNapiSignature2Test0700,
    SubCryptoFrameworkNapiSignature2Test0800,
    SubCryptoFrameworkNapiSignature2Test0900,
    SubCryptoFrameworkNapiSignature2Test1000,
    SubCryptoFrameworkNapiSignature2Test1100,
    SubCryptoFrameworkNapiSignature2Test1200,
    SubCryptoFrameworkNapiSignature2Test1300,
    SubCryptoFrameworkNapiSignature2Test1400,
    SubCryptoFrameworkNapiSignature2Test1500,
    SubCryptoFrameworkNapiSignature2Test1600,
    SubCryptoFrameworkNapiSignature2Test1700,
    SubCryptoFrameworkNapiSignature2Test1800,
    SubCryptoFrameworkNapiSignature2Test1900,
    SubCryptoFrameworkNapiSignature2Test2000
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_SYM_CIPHER_TEST_COUNT> g_symCipherTestHandlers = {
    SubCryptoFrameworkNapiSymCipherTest0100,
    SubCryptoFrameworkNapiSymCipherTest0200,
    SubCryptoFrameworkNapiSymCipherTest0300,
    SubCryptoFrameworkNapiSymCipherTest0400,
    SubCryptoFrameworkNapiSymCipherTest3100,
    SubCryptoFrameworkNapiSymCipherTest0500,
    SubCryptoFrameworkNapiSymCipherTest0600,
    SubCryptoFrameworkNapiSymCipherTest0700,
    SubCryptoFrameworkNapiSymCipherTest0800,
    SubCryptoFrameworkNapiSymCipherTest0900,
    SubCryptoFrameworkNapiSymCipherTest1000,
    SubCryptoFrameworkNapiSymCipherTest1100,
    SubCryptoFrameworkNapiSymCipherTest1200,
    SubCryptoFrameworkNapiSymCipherTest1300,
    SubCryptoFrameworkNapiSymCipherTest1400,
    SubCryptoFrameworkNapiSymCipherTest1500,
    SubCryptoFrameworkNapiSymCipherTest1600,
    SubCryptoFrameworkNapiSymCipherTest1700,
    SubCryptoFrameworkNapiSymCipherTest1800,
    SubCryptoFrameworkNapiSymCipherTest1900,
    SubCryptoFrameworkNapiSymCipherTest2000,
    SubCryptoFrameworkNapiSymCipherTest2100,
    SubCryptoFrameworkNapiSymCipherTest2200,
    SubCryptoFrameworkNapiSymCipherTest2300,
    SubCryptoFrameworkNapiSymCipherTest2600,
    SubCryptoFrameworkNapiSymCipherTest2700,
    SubCryptoFrameworkNapiSymCipherTest2800,
    SubCryptoFrameworkNapiSymCipherTest2900,
    SubCryptoFrameworkNapiSymCipherTest3000
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_SYM_KEY_TEST_COUNT> g_symKeyTestHandlers = {
    SubCryptoFrameworkNapiSymKeyTest0100,
    SubCryptoFrameworkNapiSymKeyTest0200,
    SubCryptoFrameworkNapiSymKeyTest0300,
    SubCryptoFrameworkNapiSymKeyTest0400,
    SubCryptoFrameworkNapiSymKeyTest0500,
    SubCryptoFrameworkNapiSymKeyTest0600,
    SubCryptoFrameworkNapiSymKeyTest0700,
    SubCryptoFrameworkNapiSymKeyTest0800,
    SubCryptoFrameworkNapiSymKeyTest0900,
    SubCryptoFrameworkNapiSymKeyTest1000,
    SubCryptoFrameworkNapiSymKeyTest1100
};

static const std::array<TestHandler, CRYPTO_FRAMEWORK_VERIFY_TEST_COUNT> g_verifyTestHandlers = {
    SubCryptoFrameworkNapiVerifyTest0100,
    SubCryptoFrameworkNapiVerifyTest0200,
    SubCryptoFrameworkNapiVerifyTest2800,
    SubCryptoFrameworkNapiVerifyTest0300,
    SubCryptoFrameworkNapiVerifyTest0400,
    SubCryptoFrameworkNapiVerifyTest0500,
    SubCryptoFrameworkNapiVerifyTest0600,
    SubCryptoFrameworkNapiVerifyTest0700,
    SubCryptoFrameworkNapiVerifyTest0800,
    SubCryptoFrameworkNapiVerifyTest0900,
    SubCryptoFrameworkNapiVerifyTest1000,
    SubCryptoFrameworkNapiVerifyTest1100,
    SubCryptoFrameworkNapiVerifyTest1200,
    SubCryptoFrameworkNapiVerifyTest1300,
    SubCryptoFrameworkNapiVerifyTest1400,
    SubCryptoFrameworkNapiVerifyTest1500,
    SubCryptoFrameworkNapiVerifyTest1600,
    SubCryptoFrameworkNapiVerifyTest1700,
    SubCryptoFrameworkNapiVerifyTest1800,
    SubCryptoFrameworkNapiVerifyTest1900,
    SubCryptoFrameworkNapiVerifyTest2000,
    SubCryptoFrameworkNapiVerifyTest2100,
    SubCryptoFrameworkNapiVerifyTest2200,
    SubCryptoFrameworkNapiVerifyTest2300,
    SubCryptoFrameworkNapiVerifyTest2400,
    SubCryptoFrameworkNapiVerifyTest2500,
    SubCryptoFrameworkNapiVerifyTest2600,
    SubCryptoFrameworkNapiVerifyTest2700
};


inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

static napi_value Agreement_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_agreementTestHandlers.data(),
        g_agreementTestHandlers.size(),
        "Agreement_Test");
}

static napi_value Asym_Cipher_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_asymCipherTestHandlers.data(),
        g_asymCipherTestHandlers.size(),
        "Asym_Cipher_Test");
}

static napi_value Asym_Key2_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_asymKey2TestHandlers.data(),
        g_asymKey2TestHandlers.size(),
        "Asym_Key2_Test");
}

static napi_value Asym_Key_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_asymKeyTestHandlers.data(),
        g_asymKeyTestHandlers.size(),
        "Asym_Key_Test");
}

static napi_value Digest_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_digestTestHandlers.data(),
        g_digestTestHandlers.size(),
        "Digest_Test");
}

static napi_value Kdf_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_kdfTestHandlers.data(),
        g_kdfTestHandlers.size(),
        "Kdf_Test");
}

static napi_value Mac_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_macTestHandlers.data(),
        g_macTestHandlers.size(),
        "Mac_Test");
}

static napi_value Random_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_randomTestHandlers.data(),
        g_randomTestHandlers.size(),
        "Random_Test");
}

static napi_value Reinforcement_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_reinforcementTestHandlers.data(),
        g_reinforcementTestHandlers.size(),
        "Reinforcement_Test");
}

static napi_value Signature2_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_signature2TestHandlers.data(),
        g_signature2TestHandlers.size(),
        "Signature2_Test");
}

static napi_value Signature_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_signatureTestHandlers.data(),
        g_signatureTestHandlers.size(),
        "Signature_Test");
}

static napi_value Sym_Cipher_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_symCipherTestHandlers.data(),
        g_symCipherTestHandlers.size(),
        "Sym_Cipher_Test");
}

static napi_value Sym_Key_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_symKeyTestHandlers.data(),
        g_symKeyTestHandlers.size(),
        "Sym_Key_Test");
}

static napi_value Verify_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_verifyTestHandlers.data(),
        g_verifyTestHandlers.size(),
        "Verify_Test");
}

static const napi_property_descriptor g_cryptoFrameworkDescriptors[] = {
    DECL_NAPI_DESC(Agreement_Test),
    DECL_NAPI_DESC(Asym_Cipher_Test),
    DECL_NAPI_DESC(Asym_Key2_Test),
    DECL_NAPI_DESC(Asym_Key_Test),
    DECL_NAPI_DESC(Digest_Test),
    DECL_NAPI_DESC(Kdf_Test),
    DECL_NAPI_DESC(Mac_Test),
    DECL_NAPI_DESC(Random_Test),
    DECL_NAPI_DESC(Reinforcement_Test),
    DECL_NAPI_DESC(Signature2_Test),
    DECL_NAPI_DESC(Signature_Test),
    DECL_NAPI_DESC(Sym_Cipher_Test),
    DECL_NAPI_DESC(Sym_Key_Test),
    DECL_NAPI_DESC(Verify_Test)
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports,
        sizeof(g_cryptoFrameworkDescriptors) / sizeof(g_cryptoFrameworkDescriptors[0]),
        g_cryptoFrameworkDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
