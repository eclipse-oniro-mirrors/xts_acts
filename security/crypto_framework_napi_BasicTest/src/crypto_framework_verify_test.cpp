/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>

#include "crypto_framework_verify_test.h"
#include "crypto_asym_key.h"
#include "crypto_framework_digest_test.h"
#include "blob.h"
#include "log.h"
#include "signature.h"
#include "rand.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::CryptoFrameworkVerifyNapiTest {

class OHCryptoFrameworkVerifyNapiTest : public testing::Test {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};

class VERIFY_PKCS1_TEST : public testing::TestWithParam<VerifySpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class VERIFY_PSS_TEST : public testing::TestWithParam<VerifySpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class VERIFY_ECC_TEST : public testing::TestWithParam<VerifySpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class VERIFY_DSA_TEST : public testing::TestWithParam<VerifySpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class VERIFY_RSA_ONLY_SIGN_TEST : public testing::TestWithParam<VerifySpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

VerifySpec g_verifyPkcs1Data[] = {
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PKCS1|MD5", (uint8_t *)"RSA512|PKCS1|MD5", 32},          // 0
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PKCS1|SHA1", (uint8_t *)"RSA512|PKCS1|SHA1", 32},        // 1
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PKCS1|SHA224", (uint8_t *)"RSA512|PKCS1|SHA224", 32},    // 2
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PKCS1|SHA256", (uint8_t *)"RSA512|PKCS1|SHA256", 32},    // 3
   
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|MD5", (uint8_t *)"RSA768|PKCS1|MD5", 32},          // 4
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|SHA1", (uint8_t *)"RSA768|PKCS1|SHA1", 32},        // 5
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|SHA224", (uint8_t *)"RSA768|PKCS1|SHA224", 32},    // 6
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|SHA256", (uint8_t *)"RSA768|PKCS1|SHA256", 32},    // 7
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|SHA384", (uint8_t *)"RSA768|PKCS1|SHA384", 32},    // 8
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|SHA512", (uint8_t *)"RSA768|PKCS1|SHA512", 32},    // 9

    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|MD5", (uint8_t *)"RSA1024|PKCS1|MD5", 32},       // 10
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|SHA1", (uint8_t *)"RSA1024|PKCS1|SHA1", 32},     // 11
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|SHA224", (uint8_t *)"RSA1024|PKCS1|SHA224", 32}, // 12
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|SHA256", (uint8_t *)"RSA1024|PKCS1|SHA256", 32}, // 13
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|SHA384", (uint8_t *)"RSA1024|PKCS1|SHA384", 32}, // 14
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|SHA512", (uint8_t *)"RSA1024|PKCS1|SHA512", 32}, // 15

    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|MD5", (uint8_t *)"RSA2048|PKCS1|MD5", 32},       // 16
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|SHA1", (uint8_t *)"RSA2048|PKCS1|SHA1", 32},     // 17
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|SHA224", (uint8_t *)"RSA2048|PKCS1|SHA224", 32}, // 18
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|SHA256", (uint8_t *)"RSA2048|PKCS1|SHA256", 32}, // 19
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|SHA384", (uint8_t *)"RSA2048|PKCS1|SHA384", 32}, // 20
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|SHA512", (uint8_t *)"RSA2048|PKCS1|SHA512", 32}, // 21

    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|MD5", (uint8_t *)"RSA3072|PKCS1|MD5", 32},       // 22
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|SHA1", (uint8_t *)"RSA3072|PKCS1|SHA1", 32},     // 23
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|SHA224", (uint8_t *)"RSA3072|PKCS1|SHA224", 32}, // 24
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|SHA256", (uint8_t *)"RSA3072|PKCS1|SHA256", 32}, // 25
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|SHA384", (uint8_t *)"RSA3072|PKCS1|SHA384", 32}, // 26
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|SHA512", (uint8_t *)"RSA3072|PKCS1|SHA512", 32}, // 27

    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|MD5", (uint8_t *)"RSA4096|PKCS1|MD5", 32},       // 28
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|SHA1", (uint8_t *)"RSA4096|PKCS1|SHA1", 32},     // 29
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|SHA224", (uint8_t *)"RSA4096|PKCS1|SHA224", 32}, // 30
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|SHA256", (uint8_t *)"RSA4096|PKCS1|SHA256", 32}, // 31
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|SHA384", (uint8_t *)"RSA4096|PKCS1|SHA384", 32}, // 32
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|SHA512", (uint8_t *)"RSA4096|PKCS1|SHA512", 32}, // 33

    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|MD5", (uint8_t *)"RSA8192|PKCS1|MD5", 32},       // 34
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|SHA1", (uint8_t *)"RSA8192|PKCS1|SHA1", 32},     // 35
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|SHA224", (uint8_t *)"RSA8192|PKCS1|SHA224", 32}, // 36
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|SHA256", (uint8_t *)"RSA8192|PKCS1|SHA256", 32}, // 37
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|SHA384", (uint8_t *)"RSA8192|PKCS1|SHA384", 32}, // 38
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|SHA512", (uint8_t *)"RSA8192|PKCS1|SHA512", 32}, // 39

    {(uint8_t *)"RSA768", (uint8_t *)"RSA|PKCS1|SHA512", (uint8_t *)"RSA|PKCS1|SHA512", 32},          // 40
};

VerifySpec g_verifyPssData[] = {
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA512|PSS|MD5|MGF1_MD5", 32},                 // 0
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA512|PSS|MD5|MGF1_SHA1", 32},               // 1
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA512|PSS|MD5|MGF1_SHA224", 32},           // 2
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA512|PSS|MD5|MGF1_SHA256", 32},           // 3
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA512|PSS|SHA1|MGF1_MD5", 32},               // 4
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA512|PSS|SHA1|MGF1_SHA1", 32},             // 5
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA512|PSS|SHA1|MGF1_SHA224", 32},         // 6
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA512|PSS|SHA1|MGF1_SHA256", 32},         // 7
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA512|PSS|SHA224|MGF1_MD5", 32},           // 8
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA512|PSS|SHA224|MGF1_SHA1", 32},         // 9
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA512|PSS|SHA224|MGF1_SHA224", 32},     // 10
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA512|PSS|SHA224|MGF1_SHA256", 32},     // 11
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA512|PSS|SHA256|MGF1_MD5", 32},           // 12
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA512|PSS|SHA256|MGF1_SHA1", 32},         // 13
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA512|PSS|SHA256|MGF1_SHA224", 32},     // 14
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA512|PSS|SHA256|MGF1_SHA256", 32},     // 15

    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA768|PSS|MD5|MGF1_MD5", 32},                 // 16
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA768|PSS|MD5|MGF1_SHA1", 32},               // 17
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA768|PSS|MD5|MGF1_SHA224", 32},           // 18
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA768|PSS|MD5|MGF1_SHA256", 32},           // 19
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA768|PSS|MD5|MGF1_SHA384", 32},           // 20
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA768|PSS|MD5|MGF1_SHA512", 32},           // 21
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA768|PSS|SHA1|MGF1_MD5", 32},               // 22
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA1", 32},             // 23
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA224", 32},         // 24
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA256", 32},         // 25
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA384", 32},         // 26
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA512", 32},         // 27
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA768|PSS|SHA224|MGF1_MD5", 32},           // 28
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA1", 32},         // 29
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA224", 32},     // 30
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA256", 32},     // 31
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA384", 32},     // 32
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA512", 32},     // 33
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA768|PSS|SHA256|MGF1_MD5", 32},           // 34
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA1", 32},         // 35
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA224", 32},     // 36
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA256", 32},     // 37
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA384", 32},     // 38
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA768|PSS|SHA384|MGF1_MD5", 32},           // 39
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA768|PSS|SHA384|MGF1_SHA1", 32},         // 40
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA768|PSS|SHA384|MGF1_SHA224", 32},     // 41
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA768|PSS|SHA384|MGF1_SHA256", 32},     // 42
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA768|PSS|SHA512|MGF1_MD5", 32},           // 43
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA768|PSS|SHA512|MGF1_SHA1", 32},         // 44
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA768|PSS|SHA512|MGF1_SHA224", 32},     // 45

    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA1024|PSS|MD5|MGF1_MD5", 32},              // 46
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA1", 32},            // 47
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA224", 32},        // 48
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA256", 32},        // 49
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA384", 32},        // 50
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA512", 32},        // 51
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_MD5", 32},            // 52
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA1", 32},          // 53
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA224", 32},      // 54
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA256", 32},      // 55
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA384", 32},      // 56
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA512", 32},      // 57
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_MD5", 32},        // 58
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA1", 32},      // 59
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA224", 32},  // 60
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA256", 32},  // 61
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA384", 32},  // 62
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA512", 32},  // 63
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_MD5", 32},        // 64
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA1", 32},      // 65
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA224", 32},  // 66
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA256", 32},  // 67
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA384", 32},  // 68
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA512", (uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA512", 32},  // 69
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_MD5", 32},        // 70
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA1", 32},      // 71
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA224", 32},  // 72
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA256", 32},  // 73
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA384", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA384", 32},  // 74
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA512", (uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA512", 32},  // 75
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA1024|PSS|SHA512|MGF1_MD5", 32},        // 76
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA1", 32},      // 77
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA224", 32},  // 78
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA256", (uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA256", 32},  // 79
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA384", (uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA384", 32},  // 80

    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA2048|PSS|MD5|MGF1_MD5", 32},              // 81
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA1", 32},            // 82
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA224", 32},        // 83
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA256", 32},        // 84
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA384", 32},        // 85
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA512", 32},        // 86
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_MD5", 32},            // 87
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA1", 32},          // 88
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA224", 32},      // 89
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA256", 32},      // 90
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA384", 32},      // 91
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA512", 32},      // 92
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_MD5", 32},        // 93
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA1", 32},      // 94
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA224", 32},  // 95
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA256", 32},  // 96
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA384", 32},  // 97
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA512", 32},  // 98
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_MD5", 32},        // 99
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA1", 32},      // 100
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA224", 32},  // 101
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA256", 32},  // 102
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA384", 32},  // 103
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA512", (uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA512", 32},  // 104
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_MD5", 32},        // 105
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA1", 32},      // 106
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA224", 32},  // 107
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA256", 32},  // 108
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA384", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA384", 32},  // 109
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA512", (uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA512", 32},  // 110
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_MD5", 32},        // 111
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA1", 32},      // 112
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA224", 32},  // 113
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA256", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA256", 32},  // 114
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA384", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA384", 32},  // 115
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA512", (uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA512", 32},  // 116
    
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA3072|PSS|MD5|MGF1_MD5", 32},              // 117
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA1", 32},            // 118
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA224", 32},        // 119
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA256", 32},        // 120
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA384", 32},        // 121
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA512", 32},        // 122
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_MD5", 32},            // 123
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA1", 32},          // 124
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA224", 32},      // 125
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA256", 32},      // 126
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA384", 32},      // 127
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA512", 32},      // 128
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_MD5", 32},        // 129
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA1", 32},      // 130
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA224", 32},  // 131
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA256", 32},  // 132
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA384", 32},  // 133
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA512", 32},  // 134
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_MD5", 32},        // 135
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA1", 32},      // 136
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA224", 32},  // 137
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA256", 32},  // 138
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA384", 32},  // 139
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA512", (uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA512", 32},  // 140
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_MD5", 32},        // 141
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA1", 32},      // 142
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA224", 32},  // 143
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA256", 32},  // 144
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA384", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA384", 32},  // 145
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA512", (uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA512", 32},  // 146
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_MD5", 32},        // 147
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA1", 32},      // 148
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA224", 32},  // 149
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA256", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA256", 32},  // 150
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA384", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA384", 32},  // 151
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA512", (uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA512", 32},  // 152

    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA4096|PSS|MD5|MGF1_MD5", 32},              // 153
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA1", 32},            // 154
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA224", 32},        // 155
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA256", 32},        // 156
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA384", 32},        // 157
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA512", 32},        // 158
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_MD5", 32},            // 159
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA1", 32},          // 160
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA224", 32},      // 161
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA256", 32},      // 162
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA384", 32},      // 163
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA512", 32},      // 164
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_MD5", 32},        // 165
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA1", 32},      // 166
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA224", 32},  // 167
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA256", 32},  // 168
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA384", 32},  // 169
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA512", 32},  // 170
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_MD5", 32},        // 171
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA1", 32},      // 172
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA224", 32},  // 173
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA256", 32},  // 174
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA384", 32},  // 175
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA512", (uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA512", 32},  // 176
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_MD5", 32},        // 177
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA1", 32},      // 178
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA224", 32},  // 179
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA256", 32},  // 180
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA384", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA384", 32},  // 181
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA512", (uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA512", 32},  // 182
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_MD5", 32},        // 183
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA1", 32},      // 184
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA224", 32},  // 185
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA256", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA256", 32},  // 186
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA384", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA384", 32},  // 187
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA512", (uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA512", 32},  // 188

    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA8192|PSS|MD5|MGF1_MD5", 32},              // 189
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA1", 32},            // 190
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA224", 32},        // 191
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA256", 32},        // 192
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA384", 32},        // 193
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA512", 32},        // 194
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_MD5", 32},            // 195
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA1", 32},          // 196
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA224", 32},      // 197
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA256", 32},      // 198
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA384", 32},      // 199
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA512", 32},      // 200
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_MD5", 32},        // 201
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA1", 32},      // 202
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA224", 32},  // 203
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA256", 32},  // 204
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA384", 32},  // 205
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA512", 32},  // 206
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_MD5", 32},        // 207
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA1", 32},      // 208
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA224", 32},  // 209
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA256", 32},  // 210
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA384", 32},  // 211
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA512", (uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA512", 32},  // 212
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_MD5", 32},        // 213
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA1", 32},      // 214
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA224", 32},  // 215
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA256", 32},  // 216
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA384", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA384", 32},  // 217
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA512", (uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA512", 32},  // 218
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_MD5", 32},        // 219
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA1", 32},      // 220
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA224", 32},  // 221
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA256", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA256", 32},  // 222
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA384", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA384", 32},  // 223
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA512", (uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA512", 32},  // 224

    {(uint8_t *)"RSA1024", (uint8_t *)"RSA|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA|PSS|MD5|MGF1_MD5", 32},                      // 225
};

VerifySpec g_verifyEccData[] = {
    {(uint8_t *)"ECC224", (uint8_t *)"ECC224|SHA1", (uint8_t *)"ECC224|SHA1", 32},      // 0
    {(uint8_t *)"ECC224", (uint8_t *)"ECC224|SHA224", (uint8_t *)"ECC224|SHA224", 32},  // 1
    {(uint8_t *)"ECC224", (uint8_t *)"ECC224|SHA256", (uint8_t *)"ECC224|SHA256", 32},  // 2
    {(uint8_t *)"ECC224", (uint8_t *)"ECC224|SHA384", (uint8_t *)"ECC224|SHA384", 32},  // 3
    {(uint8_t *)"ECC224", (uint8_t *)"ECC224|SHA512", (uint8_t *)"ECC224|SHA512", 32},  // 4

    {(uint8_t *)"ECC256", (uint8_t *)"ECC256|SHA1", (uint8_t *)"ECC256|SHA1", 32},      // 5
    {(uint8_t *)"ECC256", (uint8_t *)"ECC256|SHA224", (uint8_t *)"ECC256|SHA224", 32},  // 6
    {(uint8_t *)"ECC256", (uint8_t *)"ECC256|SHA256", (uint8_t *)"ECC256|SHA256", 32},  // 7
    {(uint8_t *)"ECC256", (uint8_t *)"ECC256|SHA384", (uint8_t *)"ECC256|SHA384", 32},  // 8
    {(uint8_t *)"ECC256", (uint8_t *)"ECC256|SHA512", (uint8_t *)"ECC256|SHA512", 32},  // 9

    {(uint8_t *)"ECC384", (uint8_t *)"ECC384|SHA1", (uint8_t *)"ECC384|SHA1", 32},      // 10
    {(uint8_t *)"ECC384", (uint8_t *)"ECC384|SHA224", (uint8_t *)"ECC384|SHA224", 32},  // 11
    {(uint8_t *)"ECC384", (uint8_t *)"ECC384|SHA256", (uint8_t *)"ECC384|SHA256", 32},  // 12
    {(uint8_t *)"ECC384", (uint8_t *)"ECC384|SHA384", (uint8_t *)"ECC384|SHA384", 32},  // 13
    {(uint8_t *)"ECC384", (uint8_t *)"ECC384|SHA512", (uint8_t *)"ECC384|SHA512", 32},  // 14

    {(uint8_t *)"ECC521", (uint8_t *)"ECC521|SHA1", (uint8_t *)"ECC521|SHA1", 32},      // 15
    {(uint8_t *)"ECC521", (uint8_t *)"ECC521|SHA224", (uint8_t *)"ECC521|SHA224", 32},  // 16
    {(uint8_t *)"ECC521", (uint8_t *)"ECC521|SHA256", (uint8_t *)"ECC521|SHA256", 32},  // 17
    {(uint8_t *)"ECC521", (uint8_t *)"ECC521|SHA384", (uint8_t *)"ECC521|SHA384", 32},  // 18
    {(uint8_t *)"ECC521", (uint8_t *)"ECC521|SHA512", (uint8_t *)"ECC521|SHA512", 32},  // 19

    {(uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"ECC_BrainPoolP160r1|SHA1", (uint8_t *)"ECC_BrainPoolP160r1|SHA1", 32},      // 20
    {(uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"ECC_BrainPoolP160r1|SHA224", (uint8_t *)"ECC_BrainPoolP160r1|SHA224", 32},  // 21
    {(uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"ECC_BrainPoolP160r1|SHA256", (uint8_t *)"ECC_BrainPoolP160r1|SHA256", 32},  // 22
    {(uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"ECC_BrainPoolP160r1|SHA384", (uint8_t *)"ECC_BrainPoolP160r1|SHA384", 32},  // 23
    {(uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"ECC_BrainPoolP160r1|SHA512", (uint8_t *)"ECC_BrainPoolP160r1|SHA512", 32},  // 24

    {(uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"ECC_BrainPoolP160t1|SHA1", (uint8_t *)"ECC_BrainPoolP160t1|SHA1", 32},      // 25
    {(uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"ECC_BrainPoolP160t1|SHA224", (uint8_t *)"ECC_BrainPoolP160t1|SHA224", 32},  // 26
    {(uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"ECC_BrainPoolP160t1|SHA256", (uint8_t *)"ECC_BrainPoolP160t1|SHA256", 32},  // 27
    {(uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"ECC_BrainPoolP160t1|SHA384", (uint8_t *)"ECC_BrainPoolP160t1|SHA384", 32},  // 28
    {(uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"ECC_BrainPoolP160t1|SHA512", (uint8_t *)"ECC_BrainPoolP160t1|SHA512", 32},  // 29

    {(uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"ECC_BrainPoolP192r1|SHA1", (uint8_t *)"ECC_BrainPoolP192r1|SHA1", 32},      // 30
    {(uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"ECC_BrainPoolP192r1|SHA224", (uint8_t *)"ECC_BrainPoolP192r1|SHA224", 32},  // 31
    {(uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"ECC_BrainPoolP192r1|SHA256", (uint8_t *)"ECC_BrainPoolP192r1|SHA256", 32},  // 32
    {(uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"ECC_BrainPoolP192r1|SHA384", (uint8_t *)"ECC_BrainPoolP192r1|SHA384", 32},  // 33
    {(uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"ECC_BrainPoolP192r1|SHA512", (uint8_t *)"ECC_BrainPoolP192r1|SHA512", 32},  // 34

    {(uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"ECC_BrainPoolP192t1|SHA1", (uint8_t *)"ECC_BrainPoolP192t1|SHA1", 32},      // 35
    {(uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"ECC_BrainPoolP192t1|SHA224", (uint8_t *)"ECC_BrainPoolP192t1|SHA224", 32},  // 36
    {(uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"ECC_BrainPoolP192t1|SHA256", (uint8_t *)"ECC_BrainPoolP192t1|SHA256", 32},  // 37
    {(uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"ECC_BrainPoolP192t1|SHA384", (uint8_t *)"ECC_BrainPoolP192t1|SHA384", 32},  // 38
    {(uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"ECC_BrainPoolP192t1|SHA512", (uint8_t *)"ECC_BrainPoolP192t1|SHA512", 32},  // 39

    {(uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"ECC_BrainPoolP224r1|SHA1", (uint8_t *)"ECC_BrainPoolP224r1|SHA1", 32},      // 40
    {(uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"ECC_BrainPoolP224r1|SHA224", (uint8_t *)"ECC_BrainPoolP224r1|SHA224", 32},  // 41
    {(uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"ECC_BrainPoolP224r1|SHA256", (uint8_t *)"ECC_BrainPoolP224r1|SHA256", 32},  // 42
    {(uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"ECC_BrainPoolP224r1|SHA384", (uint8_t *)"ECC_BrainPoolP224r1|SHA384", 32},  // 43
    {(uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"ECC_BrainPoolP224r1|SHA512", (uint8_t *)"ECC_BrainPoolP224r1|SHA512", 32},  // 44

    {(uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"ECC_BrainPoolP224t1|SHA1", (uint8_t *)"ECC_BrainPoolP224t1|SHA1", 32},      // 45
    {(uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"ECC_BrainPoolP224t1|SHA224", (uint8_t *)"ECC_BrainPoolP224t1|SHA224", 32},  // 46
    {(uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"ECC_BrainPoolP224t1|SHA256", (uint8_t *)"ECC_BrainPoolP224t1|SHA256", 32},  // 47
    {(uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"ECC_BrainPoolP224t1|SHA384", (uint8_t *)"ECC_BrainPoolP224t1|SHA384", 32},  // 48
    {(uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"ECC_BrainPoolP224t1|SHA512", (uint8_t *)"ECC_BrainPoolP224t1|SHA512", 32},  // 49


    {(uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"ECC_BrainPoolP256r1|SHA1", (uint8_t *)"ECC_BrainPoolP256r1|SHA1", 32},      // 50
    {(uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"ECC_BrainPoolP256r1|SHA224", (uint8_t *)"ECC_BrainPoolP256r1|SHA224", 32},  // 51
    {(uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"ECC_BrainPoolP256r1|SHA256", (uint8_t *)"ECC_BrainPoolP256r1|SHA256", 32},  // 52
    {(uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"ECC_BrainPoolP256r1|SHA384", (uint8_t *)"ECC_BrainPoolP256r1|SHA384", 32},  // 53
    {(uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"ECC_BrainPoolP256r1|SHA512", (uint8_t *)"ECC_BrainPoolP256r1|SHA512", 32},  // 54

    {(uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"ECC_BrainPoolP256t1|SHA1", (uint8_t *)"ECC_BrainPoolP256t1|SHA1", 32},      // 55
    {(uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"ECC_BrainPoolP256t1|SHA224", (uint8_t *)"ECC_BrainPoolP256t1|SHA224", 32},  // 56
    {(uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"ECC_BrainPoolP256t1|SHA256", (uint8_t *)"ECC_BrainPoolP256t1|SHA256", 32},  // 57
    {(uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"ECC_BrainPoolP256t1|SHA384", (uint8_t *)"ECC_BrainPoolP256t1|SHA384", 32},  // 58
    {(uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"ECC_BrainPoolP256t1|SHA512", (uint8_t *)"ECC_BrainPoolP256t1|SHA512", 32},  // 59


    {(uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"ECC_BrainPoolP320r1|SHA1", (uint8_t *)"ECC_BrainPoolP320r1|SHA1", 32},      // 60
    {(uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"ECC_BrainPoolP320r1|SHA224", (uint8_t *)"ECC_BrainPoolP320r1|SHA224", 32},  // 61
    {(uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"ECC_BrainPoolP320r1|SHA256", (uint8_t *)"ECC_BrainPoolP320r1|SHA256", 32},  // 62
    {(uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"ECC_BrainPoolP320r1|SHA384", (uint8_t *)"ECC_BrainPoolP320r1|SHA384", 32},  // 63
    {(uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"ECC_BrainPoolP320r1|SHA512", (uint8_t *)"ECC_BrainPoolP320r1|SHA512", 32},  // 64

    {(uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"ECC_BrainPoolP320t1|SHA1", (uint8_t *)"ECC_BrainPoolP320t1|SHA1", 32},      // 65
    {(uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"ECC_BrainPoolP320t1|SHA224", (uint8_t *)"ECC_BrainPoolP320t1|SHA224", 32},  // 66
    {(uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"ECC_BrainPoolP320t1|SHA256", (uint8_t *)"ECC_BrainPoolP320t1|SHA256", 32},  // 67
    {(uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"ECC_BrainPoolP320t1|SHA384", (uint8_t *)"ECC_BrainPoolP320t1|SHA384", 32},  // 68
    {(uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"ECC_BrainPoolP320t1|SHA512", (uint8_t *)"ECC_BrainPoolP320t1|SHA512", 32},  // 69

    {(uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"ECC_BrainPoolP384r1|SHA1", (uint8_t *)"ECC_BrainPoolP384r1|SHA1", 32},      // 70
    {(uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"ECC_BrainPoolP384r1|SHA224", (uint8_t *)"ECC_BrainPoolP384r1|SHA224", 32},  // 71
    {(uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"ECC_BrainPoolP384r1|SHA256", (uint8_t *)"ECC_BrainPoolP384r1|SHA256", 32},  // 72
    {(uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"ECC_BrainPoolP384r1|SHA384", (uint8_t *)"ECC_BrainPoolP384r1|SHA384", 32},  // 73
    {(uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"ECC_BrainPoolP384r1|SHA512", (uint8_t *)"ECC_BrainPoolP384r1|SHA512", 32},  // 74

    {(uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"ECC_BrainPoolP384t1|SHA1", (uint8_t *)"ECC_BrainPoolP384t1|SHA1", 32},      // 75
    {(uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"ECC_BrainPoolP384t1|SHA224", (uint8_t *)"ECC_BrainPoolP384t1|SHA224", 32},  // 76
    {(uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"ECC_BrainPoolP384t1|SHA256", (uint8_t *)"ECC_BrainPoolP384t1|SHA256", 32},  // 77
    {(uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"ECC_BrainPoolP384t1|SHA384", (uint8_t *)"ECC_BrainPoolP384t1|SHA384", 32},  // 78
    {(uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"ECC_BrainPoolP384t1|SHA512", (uint8_t *)"ECC_BrainPoolP384t1|SHA512", 32},  // 79

    {(uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"ECC_BrainPoolP512r1|SHA1", (uint8_t *)"ECC_BrainPoolP512r1|SHA1", 32},      // 80
    {(uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"ECC_BrainPoolP512r1|SHA224", (uint8_t *)"ECC_BrainPoolP512r1|SHA224", 32},  // 81
    {(uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"ECC_BrainPoolP512r1|SHA256", (uint8_t *)"ECC_BrainPoolP512r1|SHA256", 32},  // 82
    {(uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"ECC_BrainPoolP512r1|SHA384", (uint8_t *)"ECC_BrainPoolP512r1|SHA384", 32},  // 83
    {(uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"ECC_BrainPoolP512r1|SHA512", (uint8_t *)"ECC_BrainPoolP512r1|SHA512", 32},  // 84

    {(uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"ECC_BrainPoolP512t1|SHA1", (uint8_t *)"ECC_BrainPoolP512t1|SHA1", 32},      // 85
    {(uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"ECC_BrainPoolP512t1|SHA224", (uint8_t *)"ECC_BrainPoolP512t1|SHA224", 32},  // 86
    {(uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"ECC_BrainPoolP512t1|SHA256", (uint8_t *)"ECC_BrainPoolP512t1|SHA256", 32},  // 87
    {(uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"ECC_BrainPoolP512t1|SHA384", (uint8_t *)"ECC_BrainPoolP512t1|SHA384", 32},  // 88
    {(uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"ECC_BrainPoolP512t1|SHA512", (uint8_t *)"ECC_BrainPoolP512t1|SHA512", 32},  // 89

    {(uint8_t *)"SM2_256", (uint8_t *)"SM2_256|SM3", (uint8_t *)"SM2_256|SM3", 32},                                            // 90
    {(uint8_t *)"SM2_256", (uint8_t *)"SM2|SM3", (uint8_t *)"SM2|SM3", 32},                                                    // 91

    {(uint8_t *)"Ed25519", (uint8_t *)"Ed25519", (uint8_t *)"Ed25519", 32},                                                    // 92

    {(uint8_t *)"ECC224", (uint8_t *)"ECC|SHA1", (uint8_t *)"ECC|SHA1", 32},                                                   // 93
};

VerifySpec g_verifyDsaData[] = {
    {(uint8_t *)"DSA1024", (uint8_t *)"DSA1024|NoHash", (uint8_t *)"DSA1024|NoHash", 32},  // 0
    {(uint8_t *)"DSA1024", (uint8_t *)"DSA1024|SHA1", (uint8_t *)"DSA1024|SHA1", 32},      // 1
    {(uint8_t *)"DSA1024", (uint8_t *)"DSA1024|SHA224", (uint8_t *)"DSA1024|SHA224", 32},  // 2
    {(uint8_t *)"DSA1024", (uint8_t *)"DSA1024|SHA256", (uint8_t *)"DSA1024|SHA256", 32},  // 3
    {(uint8_t *)"DSA1024", (uint8_t *)"DSA1024|SHA384", (uint8_t *)"DSA1024|SHA384", 32},  // 4
    {(uint8_t *)"DSA1024", (uint8_t *)"DSA1024|SHA512", (uint8_t *)"DSA1024|SHA512", 32},  // 5

    {(uint8_t *)"DSA2048", (uint8_t *)"DSA2048|NoHash", (uint8_t *)"DSA2048|NoHash", 32},  // 6
    {(uint8_t *)"DSA2048", (uint8_t *)"DSA2048|SHA1", (uint8_t *)"DSA2048|SHA1", 32},      // 7
    {(uint8_t *)"DSA2048", (uint8_t *)"DSA2048|SHA224", (uint8_t *)"DSA2048|SHA224", 32},  // 8
    {(uint8_t *)"DSA2048", (uint8_t *)"DSA2048|SHA256", (uint8_t *)"DSA2048|SHA256", 32},  // 9
    {(uint8_t *)"DSA2048", (uint8_t *)"DSA2048|SHA384", (uint8_t *)"DSA2048|SHA384", 32},  // 10
    {(uint8_t *)"DSA2048", (uint8_t *)"DSA2048|SHA512", (uint8_t *)"DSA2048|SHA512", 32},  // 11

    {(uint8_t *)"DSA3072", (uint8_t *)"DSA3072|NoHash", (uint8_t *)"DSA3072|NoHash", 32},  // 12
    {(uint8_t *)"DSA3072", (uint8_t *)"DSA3072|SHA1", (uint8_t *)"DSA3072|SHA1", 32},      // 13
    {(uint8_t *)"DSA3072", (uint8_t *)"DSA3072|SHA224", (uint8_t *)"DSA3072|SHA224", 32},  // 14
    {(uint8_t *)"DSA3072", (uint8_t *)"DSA3072|SHA256", (uint8_t *)"DSA3072|SHA256", 32},  // 15
    {(uint8_t *)"DSA3072", (uint8_t *)"DSA3072|SHA384", (uint8_t *)"DSA3072|SHA384", 32},  // 16
    {(uint8_t *)"DSA3072", (uint8_t *)"DSA3072|SHA512", (uint8_t *)"DSA3072|SHA512", 32},  // 17

    {(uint8_t *)"DSA1024", (uint8_t *)"DSA|NoHash", (uint8_t *)"DSA|NoHash", 32},          // 18
    {(uint8_t *)"DSA1024", (uint8_t *)"DSA|SHA1", (uint8_t *)"DSA|SHA1", 32},              // 19
    {(uint8_t *)"DSA1024", (uint8_t *)"DSA|SHA224", (uint8_t *)"DSA|SHA224", 32},          // 20
    {(uint8_t *)"DSA1024", (uint8_t *)"DSA|SHA256", (uint8_t *)"DSA|SHA256", 32},          // 21
    {(uint8_t *)"DSA1024", (uint8_t *)"DSA|SHA384", (uint8_t *)"DSA|SHA384", 32},          // 22
    {(uint8_t *)"DSA1024", (uint8_t *)"DSA|SHA512", (uint8_t *)"DSA|SHA512", 32},          // 23
};

VerifySpec g_verifyRsaOnlySignData[] = {
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA512|PKCS1|NoHash|Recover", 32},          // 0
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA512|NoPadding|NoHash|Recover", 64},  // 1
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PKCS1|MD5|OnlySign", (uint8_t *)"RSA512|PKCS1|MD5|Recover", 16},                // 2
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA512|PKCS1|SHA1|Recover", 20},              // 3
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA512|PKCS1|SHA224|Recover", 28},          // 4
    {(uint8_t *)"RSA512", (uint8_t *)"RSA512|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA512|PKCS1|SHA256|Recover", 32},          // 5

    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA768|PKCS1|NoHash|Recover", 32},          // 6
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA768|NoPadding|NoHash|Recover", 96},  // 7
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|MD5|OnlySign", (uint8_t *)"RSA768|PKCS1|MD5|Recover", 16},                // 8
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA768|PKCS1|SHA1|Recover", 20},              // 9
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA768|PKCS1|SHA224|Recover", 28},          // 10
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA768|PKCS1|SHA256|Recover", 32},          // 11
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA768|PKCS1|SHA384|Recover", 48},          // 12
    {(uint8_t *)"RSA768", (uint8_t *)"RSA768|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA768|PKCS1|SHA512|Recover", 64},          // 13

    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA1024|PKCS1|NoHash|Recover", 32},          // 14
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA1024|NoPadding|NoHash|Recover", 128}, // 15
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|MD5|OnlySign", (uint8_t *)"RSA1024|PKCS1|MD5|Recover", 16},                // 16
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA1024|PKCS1|SHA1|Recover", 20},              // 17
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA1024|PKCS1|SHA224|Recover", 28},          // 18
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA1024|PKCS1|SHA256|Recover", 32},          // 19
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA1024|PKCS1|SHA384|Recover", 48},          // 20
    {(uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA1024|PKCS1|SHA512|Recover", 64},          // 21

    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA2048|PKCS1|NoHash|Recover", 32},          // 22
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA2048|NoPadding|NoHash|Recover", 256}, // 23
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|MD5|OnlySign", (uint8_t *)"RSA2048|PKCS1|MD5|Recover", 16},                // 24
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA2048|PKCS1|SHA1|Recover", 20},              // 25
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA2048|PKCS1|SHA224|Recover", 28},          // 26
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA2048|PKCS1|SHA256|Recover", 32},          // 27
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA2048|PKCS1|SHA384|Recover", 48},          // 28
    {(uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA2048|PKCS1|SHA512|Recover", 64},          // 29

    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA3072|PKCS1|NoHash|Recover", 32},          // 30
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA3072|NoPadding|NoHash|Recover", 384}, // 31
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|MD5|OnlySign", (uint8_t *)"RSA3072|PKCS1|MD5|Recover", 16},                // 32
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA3072|PKCS1|SHA1|Recover", 20},              // 33
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA3072|PKCS1|SHA224|Recover", 28},          // 34
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA3072|PKCS1|SHA256|Recover", 32},          // 35
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA3072|PKCS1|SHA384|Recover", 48},          // 36
    {(uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA3072|PKCS1|SHA512|Recover", 64},          // 37

    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA4096|PKCS1|NoHash|Recover", 32},          // 38
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA4096|NoPadding|NoHash|Recover", 512}, // 39
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|MD5|OnlySign", (uint8_t *)"RSA4096|PKCS1|MD5|Recover", 16},                // 40
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA4096|PKCS1|SHA1|Recover", 20},              // 41
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA4096|PKCS1|SHA224|Recover", 28},          // 42
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA4096|PKCS1|SHA256|Recover", 32},          // 43
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA4096|PKCS1|SHA384|Recover", 48},          // 44
    {(uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA4096|PKCS1|SHA512|Recover", 64},          // 45

    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA8192|PKCS1|NoHash|Recover", 32},           // 46
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA8192|NoPadding|NoHash|Recover", 1024}, // 47
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|MD5|OnlySign", (uint8_t *)"RSA8192|PKCS1|MD5|Recover", 16},                 // 48
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA8192|PKCS1|SHA1|Recover", 20},               // 49
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA8192|PKCS1|SHA224|Recover", 28},           // 50
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA8192|PKCS1|SHA256|Recover", 32},           // 51
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA8192|PKCS1|SHA384|Recover", 48},           // 52
    {(uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA8192|PKCS1|SHA512|Recover", 64},           // 53

    {(uint8_t *)"RSA1024", (uint8_t *)"RSA|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA|PKCS1|SHA1|Recover", 20},                       // 54
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkVerifyNapiTest, VERIFY_PKCS1_TEST, ::testing::ValuesIn(g_verifyPkcs1Data));
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkVerifyNapiTest, VERIFY_PSS_TEST, ::testing::ValuesIn(g_verifyPssData));
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkVerifyNapiTest, VERIFY_ECC_TEST, ::testing::ValuesIn(g_verifyEccData));
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkVerifyNapiTest, VERIFY_DSA_TEST, ::testing::ValuesIn(g_verifyDsaData));
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkVerifyNapiTest, VERIFY_RSA_ONLY_SIGN_TEST, ::testing::ValuesIn(g_verifyRsaOnlySignData));

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_0100
* @tc.name OHCryptoFrameworkVerifyNapiTest/VERIFY_PKCS1_TEST.SUB_Security_CryptoFramework_NAPI_Verify_Test_0100/x
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(VERIFY_PKCS1_TEST, SUB_Security_CryptoFramework_NAPI_Verify_Test_0100, TestSize.Level0)
{
    VerifySpec verifyData = GetParam();
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = verifyData.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    Crypto_DataBlob n = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)verifyData.keyAlgName, &keyCtx), CRYPTO_SUCCESS);
    // keypair
    if (strcmp((const char *)verifyData.keyAlgName, "RSA8192") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192_pubKey, .len = sizeof(g_rsa8192_pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa8192_priKey, .len = sizeof(g_rsa8192_priKey) };
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp((const char *)verifyData.keyAlgName, "RSA4096") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa4096_pubKey, .len = sizeof(g_rsa4096_pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa4096_priKey, .len = sizeof(g_rsa4096_priKey) };
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp((const char *)verifyData.keyAlgName, "RSA3072") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa3072_pubKey, .len = sizeof(g_rsa3072_pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa3072_priKey, .len = sizeof(g_rsa3072_priKey) };
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else {
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    }
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_RSA_N_DATABLOB, &n), CRYPTO_SUCCESS);
    // sign
    ASSERT_EQ(HcfSignCreate((const char *)verifyData.signAlgName, &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    // verify
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)verifyData.verifyAlgName, &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    const char * getVerifyAlgName = OH_CryptoVerify_GetAlgoName(verify);
    ASSERT_TRUE(memcmp(getVerifyAlgName, (const char *)verifyData.verifyAlgName, strlen((const char *)verifyData.verifyAlgName)) == 0);

    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    HcfObjDestroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_0200
* @tc.name OHCryptoFrameworkVerifyNapiTest/VERIFY_PSS_TEST.SUB_Security_CryptoFramework_NAPI_Verify_Test_0200/x
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(VERIFY_PSS_TEST, SUB_Security_CryptoFramework_NAPI_Verify_Test_0200, TestSize.Level0)
{
    VerifySpec verifyData = GetParam();
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = verifyData.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)verifyData.keyAlgName, &keyCtx), CRYPTO_SUCCESS);
    if (strcmp((const char *)verifyData.keyAlgName, "RSA8192") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192_pubKey, .len = sizeof(g_rsa8192_pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa8192_priKey, .len = sizeof(g_rsa8192_priKey) };
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp((const char *)verifyData.keyAlgName, "RSA4096") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa4096_pubKey, .len = sizeof(g_rsa4096_pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa4096_priKey, .len = sizeof(g_rsa4096_priKey) };
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp((const char *)verifyData.keyAlgName, "RSA3072") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa3072_pubKey, .len = sizeof(g_rsa3072_pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa3072_priKey, .len = sizeof(g_rsa3072_priKey) };
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else {
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    }
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)verifyData.signAlgName, &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)verifyData.verifyAlgName, &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    const char * getVerifyAlgName = OH_CryptoVerify_GetAlgoName(verify);
    ASSERT_TRUE(memcmp(getVerifyAlgName, (const char *)verifyData.verifyAlgName, strlen((const char *)verifyData.verifyAlgName)) == 0);

    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    HcfObjDestroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_0301
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_0301
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_0301, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192_pubKey, .len = sizeof(g_rsa8192_pubKey) };
    Crypto_DataBlob priKeyBlob = { .data = g_rsa8192_priKey, .len = sizeof(g_rsa8192_priKey) };

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA8192", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);

    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_0300
* @tc.name OHCryptoFrameworkVerifyNapiTest/VERIFY_ECC_TEST.SUB_Security_CryptoFramework_NAPI_Verify_Test_0300/x
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(VERIFY_ECC_TEST, SUB_Security_CryptoFramework_NAPI_Verify_Test_0300, TestSize.Level0)
{
    VerifySpec verifyData = GetParam();
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = verifyData.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)verifyData.keyAlgName, &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)verifyData.signAlgName, &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)verifyData.verifyAlgName, &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    const char * getVerifyAlgName = OH_CryptoVerify_GetAlgoName(verify);
    ASSERT_TRUE(memcmp(getVerifyAlgName, (const char *)verifyData.verifyAlgName, strlen((const char *)verifyData.verifyAlgName)) == 0);

    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    HcfObjDestroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_0400
* @tc.name OHCryptoFrameworkVerifyNapiTest/VERIFY_DSA_TEST.SUB_Security_CryptoFramework_NAPI_Verify_Test_0400/x
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(VERIFY_DSA_TEST, SUB_Security_CryptoFramework_NAPI_Verify_Test_0400, TestSize.Level0)
{
    VerifySpec verifyData = GetParam();
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = verifyData.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)verifyData.keyAlgName, &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)verifyData.signAlgName, &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)verifyData.verifyAlgName, &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    const char * getVerifyAlgName = OH_CryptoVerify_GetAlgoName(verify);
    ASSERT_TRUE(memcmp(getVerifyAlgName, (const char *)verifyData.verifyAlgName, strlen((const char *)verifyData.verifyAlgName)) == 0);

    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    HcfObjDestroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_0500
* @tc.name OHCryptoFrameworkVerifyNapiTest/VERIFY_RSA_ONLY_SIGN_TEST.SUB_Security_CryptoFramework_NAPI_Verify_Test_0500/x
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(VERIFY_RSA_ONLY_SIGN_TEST, SUB_Security_CryptoFramework_NAPI_Verify_Test_0500, TestSize.Level0)
{
    VerifySpec verifyData = GetParam();
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = verifyData.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)verifyData.keyAlgName, &keyCtx), CRYPTO_SUCCESS);
    msgBlob.data[0] = 0;
    if (strcmp((const char *)verifyData.keyAlgName, "RSA8192") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192_pubKey, .len = sizeof(g_rsa8192_pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa8192_priKey, .len = sizeof(g_rsa8192_priKey) };
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp((const char *)verifyData.keyAlgName, "RSA4096") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa4096_pubKey, .len = sizeof(g_rsa4096_pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa4096_priKey, .len = sizeof(g_rsa4096_priKey) };
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp((const char *)verifyData.keyAlgName, "RSA3072") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa3072_pubKey, .len = sizeof(g_rsa3072_pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa3072_priKey, .len = sizeof(g_rsa3072_priKey) };
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else {
        ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    }
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)verifyData.signAlgName, &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)verifyData.verifyAlgName, &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData), CRYPTO_SUCCESS);
    const char * getVerifyAlgName = OH_CryptoVerify_GetAlgoName(verify);
    ASSERT_TRUE(memcmp(getVerifyAlgName, (const char *)verifyData.verifyAlgName, strlen((const char *)verifyData.verifyAlgName)) == 0);
    ASSERT_TRUE(memcmp(msgBlob.data, rawSignData.data, msgBlob.len) == 0);
    ASSERT_EQ(msgBlob.len, rawSignData.len);


    HcfObjDestroy(signObj);
    HcfObjDestroy(verify);
    HcfObjDestroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_0600
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_0600
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_0600, TestSize.Level0)
{
    OH_CryptoVerify *verify = nullptr;

    ASSERT_EQ(OH_CryptoVerify_Create(nullptr, &verify), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA512|PKCS1|MD10", &verify), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA512|PKCS1|MD5", nullptr), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"SM9|SM3", &verify), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA512|PKCS6|MD5", &verify), CRYPTO_INVALID_PARAMS);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_0700
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_0700
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_0700, TestSize.Level0)
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA1024", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA1024|PKCS1|SHA1", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(nullptr, pubKey), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_0800
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_0800
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_0800, TestSize.Level0)
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };
    Crypto_DataBlob rawBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA768", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA768|PKCS1|SHA224", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Update(verify, &msgBlob), CRYPTO_INVALID_PARAMS);
    ASSERT_FALSE(OH_CryptoVerify_Final(verify, &msgBlob, &rawBlob));
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Update(nullptr, &msgBlob), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoVerify_Update(verify, nullptr), CRYPTO_INVALID_PARAMS);
    ASSERT_FALSE(OH_CryptoVerify_Final(nullptr, &msgBlob, &rawBlob));
    ASSERT_FALSE(OH_CryptoVerify_Final(verify, nullptr, &rawBlob));
    ASSERT_FALSE(OH_CryptoVerify_Final(verify, &msgBlob, nullptr));
    ASSERT_FALSE(OH_CryptoVerify_GetAlgoName(nullptr));

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_0900
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_0900
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_0900, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = OH_CRYPTO_SHA1_DIGESTSIZE;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA1024", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA1024|PKCS1|SHA1|OnlySign", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA1024|PKCS1|SHA1|Recover", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Recover(nullptr, (Crypto_DataBlob *)&signData, &rawSignData), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoVerify_Recover(verify, nullptr, &rawSignData), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, nullptr), CRYPTO_INVALID_PARAMS);

    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    HcfObjDestroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_1000
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_1000
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_1000, TestSize.Level0)
{
    OH_CryptoVerify *verify1 = nullptr;
    OH_CryptoVerify *verify2 = nullptr;
    uint8_t MdName[] = "MD5";
    Crypto_DataBlob inBlob = {
        .data = reinterpret_cast<uint8_t *>(MdName),
        .len = sizeof(MdName)
    };
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA768", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA768|PSS|MD5|MGF1_SHA384", &verify1), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_SetParam(nullptr, CRYPTO_PSS_MGF_NAME_STR, &inBlob), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoVerify_SetParam(verify1, CRYPTO_PSS_MGF_NAME_STR, nullptr), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify1, pubKey), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA1024|PKCS1|SHA256", &verify2), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_SetParam(verify2, CRYPTO_PSS_MD_NAME_STR, &inBlob), CRYPTO_NOT_SUPPORTED);
    ASSERT_EQ(OH_CryptoVerify_SetParam(verify2, CRYPTO_SM2_USER_ID_DATABLOB, &inBlob), CRYPTO_NOT_SUPPORTED);
    ASSERT_EQ(OH_CryptoVerify_SetParam(verify1, CRYPTO_PSS_MD_NAME_STR, &inBlob), CRYPTO_NOT_SUPPORTED);
    ASSERT_EQ(OH_CryptoVerify_GetParam(nullptr, CRYPTO_PSS_MGF_NAME_STR, &inBlob), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoVerify_GetParam(verify1, CRYPTO_PSS_MGF_NAME_STR, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoVerify_Destroy(verify1);
    OH_CryptoVerify_Destroy(verify2);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_1100
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_1100
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_1100, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA512", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA512|PKCS1|MD5", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, (HcfBlob *)&msgBlob, &signData), HCF_SUCCESS);
    signData.data[signData.len-1]--;
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA512|PKCS1|MD5", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_FALSE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    signData.data[signData.len-1]++;
    msgBlob.data[msgBlob.len-1]--;
    ASSERT_FALSE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    
    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_1200
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_1200
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_1200, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA768", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA768|PKCS1|SHA1", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, (HcfBlob *)&msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA1024|PKCS1|SHA1", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    
    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_1300
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_1300
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_1300, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA1024", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA1024|PKCS1|SHA224", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, (HcfBlob *)&msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA1024|PKCS1|SHA256", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_FALSE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    
    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_1400
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_1400
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_1400, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = OH_CRYPTO_MD5_DIGESTSIZE;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA512", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA512|PKCS1|MD5|OnlySign", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA512|PKCS1|MD5", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_FALSE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    
    HcfObjDestroy(signObj);
    HcfObjDestroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_1500
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_1500
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_1500, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx_A = nullptr;
    OH_CryptoKeyPair *keyPair_A = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx_B = nullptr;
    OH_CryptoKeyPair *keyPair_B = nullptr;
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = 16;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA768", &keyCtx_A), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx_A, &keyPair_A), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA768", &keyCtx_B), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx_B, &keyPair_B), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair_B);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA768|PKCS1|SHA256", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair_A)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA768|PKCS1|SHA256", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_FALSE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    
    HcfObjDestroy(signObj);
    HcfObjDestroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx_A);
    OH_CryptoKeyPair_Destroy(keyPair_A);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx_B);
    OH_CryptoKeyPair_Destroy(keyPair_B);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_1600
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_1600
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_1600, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = OH_CRYPTO_MD5_DIGESTSIZE;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA512", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA512|PKCS1|MD5|OnlySign", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    signData.data[signData.len-1]--;
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA512|PKCS1|MD5|Recover", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData), CRYPTO_OPERTION_ERROR);
    
    HcfObjDestroy(signObj);
    HcfObjDestroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_1700
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_1700
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_1700, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = OH_CRYPTO_SHA1_DIGESTSIZE;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA768", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA768|PKCS1|SHA1|OnlySign", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA1024|PKCS1|SHA1|Recover", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData), CRYPTO_SUCCESS);
    
    HcfObjDestroy(signObj);
    HcfObjDestroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_1800
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_1800
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_1800, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = OH_CRYPTO_SHA224_DIGESTSIZE;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA1024", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA1024|PKCS1|SHA224|OnlySign", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA1024|PKCS1|SHA256|Recover", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData), CRYPTO_OPERTION_ERROR);
    
    HcfObjDestroy(signObj);
    HcfObjDestroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_1900
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_1900
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_1900, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = 64;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};
    OH_CryptoDigest *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA512", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA512|PKCS1|MD5", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA512|PKCS1|MD5|Recover", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData), CRYPTO_SUCCESS);
    ASSERT_EQ(rawSignData.len, OH_CRYPTO_MD5_DIGESTSIZE);
    ASSERT_EQ(OH_CryptoDigest_Create((const char *)"MD5", &ctx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoDigest_Update(ctx, (Crypto_DataBlob *)&msgBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoDigest_Final(ctx, &out), CRYPTO_SUCCESS);
    ASSERT_TRUE(memcmp(out.data, rawSignData.data, out.len) == 0);

    OH_DigestCrypto_Destroy(ctx);
    HcfObjDestroy(signObj);
    HcfObjDestroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
    OH_Crypto_FreeDataBlob(&out);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_2000
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_2000
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_2000, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx_A = nullptr;
    OH_CryptoKeyPair *keyPair_A = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx_B = nullptr;
    OH_CryptoKeyPair *keyPair_B = nullptr;
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = 20;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA1024", &keyCtx_A), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx_A, &keyPair_A), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA1024", &keyCtx_B), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx_B, &keyPair_B), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair_B);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA1024|PKCS1|SHA1|OnlySign", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair_A)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA1024|PKCS1|SHA1|Recover", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData), CRYPTO_OPERTION_ERROR);

    HcfObjDestroy(signObj);
    HcfObjDestroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx_A);
    OH_CryptoKeyPair_Destroy(keyPair_A);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx_B);
    OH_CryptoKeyPair_Destroy(keyPair_B);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_2100
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_2100
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_2100, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoVerify *verify = nullptr;

    uint8_t plainText[] = {
        0xe4, 0x2b, 0xcc, 0x08, 0x11, 0x79, 0x16, 0x1b, 0x35, 0x7f, 0xb3, 0xaf, 0x40, 0x3b, 0x3f, 0x7c
    };
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(plainText),
        .len = sizeof(plainText)
    };
    uint8_t pubKeyText[] = {
        0x30, 0x39, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a,
        0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07, 0x03, 0x22, 0x00, 0x03, 0x4d, 0xe4, 0xbb, 0x11, 0x10,
        0x1a, 0xd2, 0x05, 0x74, 0xf1, 0x0b, 0xb4, 0x75, 0x57, 0xf4, 0x3e, 0x55, 0x14, 0x17, 0x05, 0x4a,
        0xb2, 0xfb, 0x8c, 0x84, 0x64, 0x38, 0x02, 0xa0, 0x2a, 0xa6, 0xf0
    };
    Crypto_DataBlob keyBlob = {
        .data = reinterpret_cast<uint8_t *>(pubKeyText),
        .len = sizeof(pubKeyText)
    };
    uint8_t signText[] = {
        0x30, 0x44, 0x02, 0x20, 0x21, 0x89, 0x99, 0xb1, 0x56, 0x4e, 0x3a, 0x2c, 0x16, 0x08, 0xb5, 0x8a,
        0x06, 0x6f, 0x67, 0x47, 0x1b, 0x04, 0x18, 0x7d, 0x53, 0x2d, 0xba, 0x00, 0x38, 0xd9, 0xe3, 0xe7,
        0x8c, 0xcf, 0x76, 0x83, 0x02, 0x20, 0x13, 0x54, 0x84, 0x9d, 0x73, 0x40, 0xc3, 0x92, 0x66, 0xdc,
        0x3e, 0xc9, 0xf1, 0x4c, 0x33, 0x84, 0x2a, 0x76, 0xaf, 0xc6, 0x61, 0x84, 0x5c, 0xae, 0x4b, 0x0d,
        0x3c, 0xb0, 0xc8, 0x04, 0x89, 0x71
    };
    Crypto_DataBlob signBlob = {
        .data = reinterpret_cast<uint8_t *>(signText),
        .len = sizeof(signText)
    };
    
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"ECC256", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &keyBlob, nullptr, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"ECC|SHA256", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_TRUE(OH_CryptoVerify_Final(verify, &msgBlob, &signBlob));

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_2200
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_2200
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_2200, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = 16;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    uint8_t mdText[] = "MD5";
    Crypto_DataBlob mdBlob = {
        .data = reinterpret_cast<uint8_t *>(mdText),
        .len = sizeof(mdText)
    };
    uint8_t MFGText[] = "MGF1";
    Crypto_DataBlob mfgBlob = {
        .data = reinterpret_cast<uint8_t *>(MFGText),
        .len = sizeof(MFGText)
    };
    uint8_t MFG1MdText[] = "SHA1";
    Crypto_DataBlob mgf1MddBlob = {
        .data = reinterpret_cast<uint8_t *>(MFG1MdText),
        .len = sizeof(MFG1MdText)
    };
    int32_t saltText1 = 32;
    Crypto_DataBlob saltBlob1 = {
        .data = (uint8_t *)&saltText1,
        .len = sizeof(int32_t)
    };
    int32_t saltText2 = -1;
    Crypto_DataBlob saltBlob2 = {
        .data = (uint8_t *)&saltText2,
        .len = sizeof(int32_t)
    };

    Crypto_DataBlob outMdBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob outMfgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob outMfg1MdBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob outSaltBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob outTrailerFieldBlob = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA512", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA512|PSS|MD5|MGF1_SHA1", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA512|PSS|SHA1|MGF1_MD5", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MD_NAME_STR, &mdBlob), CRYPTO_NOT_SUPPORTED);
    ASSERT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MGF_NAME_STR, &mfgBlob), CRYPTO_NOT_SUPPORTED);
    ASSERT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MGF1_NAME_STR, &mgf1MddBlob), CRYPTO_NOT_SUPPORTED);
    ASSERT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_SALT_LEN_INT, &saltBlob1), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_SALT_LEN_INT, &saltBlob2), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_GetParam(verify, CRYPTO_PSS_MD_NAME_STR, &outMdBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_GetParam(verify, CRYPTO_PSS_MGF_NAME_STR, &outMfgBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_GetParam(verify, CRYPTO_PSS_MGF1_NAME_STR, &outMfg1MdBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_GetParam(verify, CRYPTO_PSS_TRAILER_FIELD_INT, &outTrailerFieldBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_GetParam(verify, CRYPTO_PSS_SALT_LEN_INT, &outSaltBlob), CRYPTO_SUCCESS);
    ASSERT_FALSE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));

    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    HcfObjDestroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&outMdBlob);
    OH_Crypto_FreeDataBlob(&outMfgBlob);
    OH_Crypto_FreeDataBlob(&outMfg1MdBlob);
    OH_Crypto_FreeDataBlob(&outTrailerFieldBlob);
    OH_Crypto_FreeDataBlob(&outSaltBlob);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_2300
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_2300
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_2300, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = 16;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA2048", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    Crypto_DataBlob retBlob = { .data = nullptr, .len = 0 };
    ASSERT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_PEM, "PKCS1", &retBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA2048|PSS|SHA256|MGF1_SHA256", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA2048|PSS|SHA256|MGF1_SHA256", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));

    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    HcfObjDestroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_2400
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_2400
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_2400, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = 32;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA1024", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    Crypto_DataBlob retBlob = { .data = nullptr, .len = 0 };
    ASSERT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_PEM, "PKCS1", &retBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA1024|PKCS1|SHA256|OnlySign", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA1024|PKCS1|SHA256|Recover", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData), CRYPTO_SUCCESS);
    
    OH_CryptoVerify_Destroy(verify);
    OH_Crypto_FreeDataBlob(&rawSignData);
    HcfObjDestroy(signObj);
    HcfObjDestroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_2500
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_2500
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_2500, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = 32;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"SM2_256", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    Crypto_DataBlob retBlob = { .data = nullptr, .len = 0 };
    ASSERT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &retBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(HcfSignCreate((const char *)"SM2_256|SM3", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"SM2_256|SM3", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    ASSERT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));

    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    HcfObjDestroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Verify_Test_2600
* @tc.name OHCryptoFrameworkVerifyNapiTest.SUB_Security_CryptoFramework_NAPI_Verify_Test_2600
* @tc.desc algorithm is Verify
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkVerifyNapiTest, SUB_Security_CryptoFramework_NAPI_Verify_Test_2600, TestSize.Level0)
{
    HcfSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = 64;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int blockSize = 20;
    int cnt_s = 64 / blockSize;
    int rem_s = 64 % blockSize;

    HcfRandCreate(&randomObj);
    ASSERT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA1024", &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);        
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    Crypto_DataBlob retBlob = { .data = nullptr, .len = 0 };
    ASSERT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_PEM, "PKCS1", &retBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(HcfSignCreate((const char *)"RSA1024|PKCS1|SHA256", &signObj), HCF_SUCCESS);
    ASSERT_EQ(signObj->init(signObj, nullptr, ((HcfKeyPair *)keyPair)->priKey), HCF_SUCCESS);
    
    for (int i = 0; i < cnt_s; i++) {
        msgBlob.len = blockSize;
        ASSERT_EQ(signObj->update(signObj, &msgBlob), HCF_SUCCESS);
        msgBlob.data += blockSize;
    }
    if (rem_s > 0) {
        msgBlob.len = rem_s;
        ASSERT_EQ(signObj->sign(signObj, &msgBlob, &signData), HCF_SUCCESS);
    }
    msgBlob.data -=  64 - rem_s;
    msgBlob.len = 64;
    ASSERT_EQ(OH_CryptoVerify_Create((const char *)"RSA1024|PKCS1|SHA256", &verify), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    for (int i = 0; i < cnt_s; i++) {
        msgBlob.len = blockSize;
        ASSERT_EQ(OH_CryptoVerify_Update(verify, (Crypto_DataBlob *)&msgBlob), CRYPTO_SUCCESS);
        msgBlob.data += blockSize;
    }
    if (rem_s > 0) {
        msgBlob.len = rem_s;
       ASSERT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    }

    msgBlob.data -=  64 - rem_s;
    msgBlob.len = 64;
    HcfObjDestroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    HcfObjDestroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
}

} // namespace Unittest::CryptoFrameworkVerifyNapiTest