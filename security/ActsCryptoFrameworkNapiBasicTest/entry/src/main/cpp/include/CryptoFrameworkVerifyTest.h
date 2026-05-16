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
#ifndef OHCRYPTO_VERIFY_TEST_H
#define OHCRYPTO_VERIFY_TEST_H

#include <CryptoArchitectureKit/crypto_common.h>
#include <CryptoArchitectureKit/crypto_signature.h>
#include "include/CryptoFrameworkCommonTest.h"

typedef struct VerifySpec {
    uint8_t *keyAlgName;
    uint8_t *signAlgName;
    uint8_t *verifyAlgName;
    int32_t msgLen;
} VerifySpec;

namespace Unittest::CryptoFramework {

const size_t VERIFY_PKCS1_DATA_COUNT = 41;
const size_t VERIFY_PSS_DATA_COUNT = 226;
const size_t VERIFY_ECC_DATA_COUNT = 94;
const size_t VERIFY_DSA_DATA_COUNT = 24;
const size_t VERIFY_RSA_ONLY_SIGN_DATA_COUNT = 55;

extern VerifySpec g_verifyPkcs1Data[VERIFY_PKCS1_DATA_COUNT];
extern VerifySpec g_verifyPssData[VERIFY_PSS_DATA_COUNT];
extern VerifySpec g_verifyEccData[VERIFY_ECC_DATA_COUNT];
extern VerifySpec g_verifyDsaData[VERIFY_DSA_DATA_COUNT];
extern VerifySpec g_verifyRsaOnlySignData[VERIFY_RSA_ONLY_SIGN_DATA_COUNT];

int SubCryptoFrameworkNapiVerifyTest0100 ();
int SubCryptoFrameworkNapiVerifyTest0200 ();
int SubCryptoFrameworkNapiVerifyTest2800 ();
int SubCryptoFrameworkNapiVerifyTest0300 ();
int SubCryptoFrameworkNapiVerifyTest0400 ();
int SubCryptoFrameworkNapiVerifyTest0500 ();
int SubCryptoFrameworkNapiVerifyTest0600 ();
int SubCryptoFrameworkNapiVerifyTest0700 ();
int SubCryptoFrameworkNapiVerifyTest0800 ();
int SubCryptoFrameworkNapiVerifyTest0900 ();
int SubCryptoFrameworkNapiVerifyTest1000 ();
int SubCryptoFrameworkNapiVerifyTest1100 ();
int SubCryptoFrameworkNapiVerifyTest1200 ();
int SubCryptoFrameworkNapiVerifyTest1300 ();
int SubCryptoFrameworkNapiVerifyTest1400 ();
int SubCryptoFrameworkNapiVerifyTest1500 ();
int SubCryptoFrameworkNapiVerifyTest1600 ();
int SubCryptoFrameworkNapiVerifyTest1700 ();
int SubCryptoFrameworkNapiVerifyTest1800 ();
int SubCryptoFrameworkNapiVerifyTest1900 ();
int SubCryptoFrameworkNapiVerifyTest2000 ();
int SubCryptoFrameworkNapiVerifyTest2100 ();
int SubCryptoFrameworkNapiVerifyTest2200 ();
int SubCryptoFrameworkNapiVerifyTest2300 ();
int SubCryptoFrameworkNapiVerifyTest2400 ();
int SubCryptoFrameworkNapiVerifyTest2500 ();
int SubCryptoFrameworkNapiVerifyTest2600 ();
int SubCryptoFrameworkNapiVerifyTest2700 ();
}

#endif