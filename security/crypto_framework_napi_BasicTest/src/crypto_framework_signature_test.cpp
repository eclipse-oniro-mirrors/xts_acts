/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <stdbool.h>
#include <gtest/gtest.h>

#include "crypto_framework_signature_test.h"
#include "blob.h"
#include "log.h"
#include "rand.h"

#define OH_CRYPTO_SIGN_TEST_DATA_SIZE 200


using namespace testing::ext;
namespace Unittest::CryptoFrameworkSignatureNapiTest {
class OHCryptoFrameworkSignatureNapiTest : public testing::Test {
public:
    static void SetUpTestCase(void);
    static void TearDownTestCase(void);
    void SetUp();
    void TearDown();
};

void OHCryptoFrameworkSignatureNapiTest::SetUpTestCase(void)
{
}

void OHCryptoFrameworkSignatureNapiTest::TearDownTestCase(void)
{
}

void OHCryptoFrameworkSignatureNapiTest::SetUp()
{
}

void OHCryptoFrameworkSignatureNapiTest::TearDown()
{
}

SignSpec g_signPkcs1Data[] = {
    /* RSA512 */
    {(uint8_t *)"RSA512|PKCS1|MD5", (uint8_t *)"RSA512", 62},        // 0
    {(uint8_t *)"RSA512|PKCS1|SHA1", (uint8_t *)"RSA512", 62},       // 1
    {(uint8_t *)"RSA512|PKCS1|SHA224", (uint8_t *)"RSA512", 62},     // 2
    {(uint8_t *)"RSA512|PKCS1|SHA256", (uint8_t *)"RSA512", 62},     // 3
    /* RSA768 */
    {(uint8_t *)"RSA768|PKCS1|MD5", (uint8_t *)"RSA768", 62},        // 4
    {(uint8_t *)"RSA768|PKCS1|SHA1", (uint8_t *)"RSA768", 62},       // 5
    {(uint8_t *)"RSA768|PKCS1|SHA224", (uint8_t *)"RSA768", 62},     // 6
    {(uint8_t *)"RSA768|PKCS1|SHA256", (uint8_t *)"RSA768", 62},     // 7
    {(uint8_t *)"RSA768|PKCS1|SHA384", (uint8_t *)"RSA768", 62},     // 8
    {(uint8_t *)"RSA768|PKCS1|SHA512", (uint8_t *)"RSA768", 62},     // 9
    /* RSA1024 */
    {(uint8_t *)"RSA1024|PKCS1|MD5", (uint8_t *)"RSA1024", 62},      // 10
    {(uint8_t *)"RSA1024|PKCS1|SHA1", (uint8_t *)"RSA1024", 62},     // 11
    {(uint8_t *)"RSA1024|PKCS1|SHA224", (uint8_t *)"RSA1024", 62},   // 12
    {(uint8_t *)"RSA1024|PKCS1|SHA256", (uint8_t *)"RSA1024", 62},   // 13
    {(uint8_t *)"RSA1024|PKCS1|SHA384", (uint8_t *)"RSA1024", 62},   // 14
    {(uint8_t *)"RSA1024|PKCS1|SHA512", (uint8_t *)"RSA1024", 62},   // 15
    /* RSA2048 */
    {(uint8_t *)"RSA2048|PKCS1|MD5", (uint8_t *)"RSA2048", 62},      // 16
    {(uint8_t *)"RSA2048|PKCS1|SHA1", (uint8_t *)"RSA2048", 62},     // 17
    {(uint8_t *)"RSA2048|PKCS1|SHA224", (uint8_t *)"RSA2048", 62},   // 18
    {(uint8_t *)"RSA2048|PKCS1|SHA256", (uint8_t *)"RSA2048", 62},   // 19
    {(uint8_t *)"RSA2048|PKCS1|SHA384", (uint8_t *)"RSA2048", 62},   // 20
    {(uint8_t *)"RSA2048|PKCS1|SHA512", (uint8_t *)"RSA2048", 62},   // 21
    /* RSA3072 */
    {(uint8_t *)"RSA3072|PKCS1|MD5", (uint8_t *)"RSA3072", 62},      // 22
    {(uint8_t *)"RSA3072|PKCS1|SHA1", (uint8_t *)"RSA3072", 62},     // 23
    {(uint8_t *)"RSA3072|PKCS1|SHA224", (uint8_t *)"RSA3072", 62},   // 24
    {(uint8_t *)"RSA3072|PKCS1|SHA256", (uint8_t *)"RSA3072", 62},   // 25
    {(uint8_t *)"RSA3072|PKCS1|SHA384", (uint8_t *)"RSA3072", 62},   // 26
    {(uint8_t *)"RSA3072|PKCS1|SHA512", (uint8_t *)"RSA3072", 62},   // 27
    /* RSA4096 */
    {(uint8_t *)"RSA4096|PKCS1|MD5", (uint8_t *)"RSA4096", 62},      // 28
    {(uint8_t *)"RSA4096|PKCS1|SHA1", (uint8_t *)"RSA4096", 62},     // 29
    {(uint8_t *)"RSA4096|PKCS1|SHA224", (uint8_t *)"RSA4096", 62},   // 30
    {(uint8_t *)"RSA4096|PKCS1|SHA256", (uint8_t *)"RSA4096", 62},   // 31
    {(uint8_t *)"RSA4096|PKCS1|SHA384", (uint8_t *)"RSA4096", 62},   // 32
    {(uint8_t *)"RSA4096|PKCS1|SHA512", (uint8_t *)"RSA4096", 62},   // 33
    /* RSA8192 */
    {(uint8_t *)"RSA8192|PKCS1|MD5", (uint8_t *)"RSA8192", 62},      // 34
    {(uint8_t *)"RSA8192|PKCS1|SHA1", (uint8_t *)"RSA8192", 62},     // 35
    {(uint8_t *)"RSA8192|PKCS1|SHA224", (uint8_t *)"RSA8192", 62},   // 36
    {(uint8_t *)"RSA8192|PKCS1|SHA256", (uint8_t *)"RSA8192", 62},   // 37
    {(uint8_t *)"RSA8192|PKCS1|SHA384", (uint8_t *)"RSA8192", 62},   // 38
    {(uint8_t *)"RSA8192|PKCS1|SHA512", (uint8_t *)"RSA8192", 62},   // 39
    /* RSA */
    {(uint8_t *)"RSA|PKCS1|MD5", (uint8_t *)"RSA512", 62},           // 40
};

SignSpec g_signPssData[] = {
    /*RSA PSS MD5 */
    {(uint8_t *)"RSA|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA512", 62},              // 0
    /*RSA512 PSS MD5 */
    {(uint8_t *)"RSA512|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA512", 62},           // 1
    {(uint8_t *)"RSA512|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA512", 62},          // 2
    {(uint8_t *)"RSA512|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA512", 62},        // 3
    {(uint8_t *)"RSA512|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA512", 62},        // 4
    /*RSA512 PSS SHA1 */
    {(uint8_t *)"RSA512|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA512", 62},           // 5
    {(uint8_t *)"RSA512|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA512", 62},          // 6
    {(uint8_t *)"RSA512|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA512", 62},        // 7
    {(uint8_t *)"RSA512|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA512", 62},        // 8
    /*RSA512 PSS SHA224 */
    {(uint8_t *)"RSA512|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA512", 62},           // 9
    {(uint8_t *)"RSA512|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA512", 62},          // 10
    {(uint8_t *)"RSA512|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA512", 62},        // 11
    {(uint8_t *)"RSA512|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA512", 62},        // 12
    /*RSA512 PSS SHA256 */
    {(uint8_t *)"RSA512|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA512", 62},           // 13
    {(uint8_t *)"RSA512|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA512", 62},          // 14
    {(uint8_t *)"RSA512|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA512", 62},        // 15
    /*RSA768 PSS MD5 */
    {(uint8_t *)"RSA768|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA768", 62},           // 16
    {(uint8_t *)"RSA768|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA768", 62},          // 17
    {(uint8_t *)"RSA768|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA768", 62},        // 18
    {(uint8_t *)"RSA768|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA768", 62},        // 19
    {(uint8_t *)"RSA768|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA768", 62},        // 20
    {(uint8_t *)"RSA768|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA768", 62},        // 21
    /*RSA768 PSS SHA1 */
    {(uint8_t *)"RSA768|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA768", 62},           // 22
    {(uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA768", 62},          // 23
    {(uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA768", 62},        // 24
    {(uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA768", 62},        // 25
    {(uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA768", 62},        // 26
    {(uint8_t *)"RSA768|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA768", 62},        // 27
    /*RSA768 PSS SHA224 */
    {(uint8_t *)"RSA768|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA768", 62},           // 28
    {(uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA768", 62},          // 29
    {(uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA768", 62},        // 30
    {(uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA768", 62},        // 31
    {(uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA768", 62},        // 32
    {(uint8_t *)"RSA768|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA768", 62},        // 33
    /*RSA768 PSS SHA256 */
    {(uint8_t *)"RSA768|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA768", 62},           // 34
    {(uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA768", 62},          // 35
    {(uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA768", 62},        // 36
    {(uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA768", 62},        // 37
    {(uint8_t *)"RSA768|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA768", 62},        // 38
    /*RSA768 PSS SHA384 */
    {(uint8_t *)"RSA768|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA768", 62},           // 39
    {(uint8_t *)"RSA768|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA768", 62},          // 40
    {(uint8_t *)"RSA768|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA768", 62},        // 41
    {(uint8_t *)"RSA768|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA768", 62},        // 42
    /*RSA768 PSS SHA512 */
    {(uint8_t *)"RSA768|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA768", 62},           // 43
    {(uint8_t *)"RSA768|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA768", 62},          // 44
    {(uint8_t *)"RSA768|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA768", 62},        // 45
    /*RSA1024 PSS MD5 */
    {(uint8_t *)"RSA1024|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA1024", 62},           // 46
    {(uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA1024", 62},          // 47
    {(uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA1024", 62},        // 48
    {(uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA1024", 62},        // 49
    {(uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA1024", 62},        // 50
    {(uint8_t *)"RSA1024|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA1024", 62},        // 51
    /*RSA1024 PSS SHA1 */
    {(uint8_t *)"RSA1024|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA1024", 62},           // 52
    {(uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA1024", 62},          // 53
    {(uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA1024", 62},        // 54
    {(uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA1024", 62},        // 55
    {(uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA1024", 62},        // 56
    {(uint8_t *)"RSA1024|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA1024", 62},        // 57
    /*RSA1024 PSS SHA224 */
    {(uint8_t *)"RSA1024|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA1024", 62},           // 58
    {(uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA1024", 62},          // 59
    {(uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA1024", 62},        // 60
    {(uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA1024", 62},        // 61
    {(uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA1024", 62},        // 62
    {(uint8_t *)"RSA1024|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA1024", 62},        // 63
    /*RSA1024 PSS SHA256 */
    {(uint8_t *)"RSA1024|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA1024", 62},           // 64
    {(uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA1024", 62},          // 65
    {(uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA1024", 62},        // 66
    {(uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA1024", 62},        // 67
    {(uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA1024", 62},        // 68
    {(uint8_t *)"RSA1024|PSS|SHA256|MGF1_SHA512", (uint8_t *)"RSA1024", 62},        // 69
    /*RSA1024 PSS SHA384 */
    {(uint8_t *)"RSA1024|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA1024", 62},           // 70
    {(uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA1024", 62},          // 71
    {(uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA1024", 62},        // 72
    {(uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA1024", 62},        // 73
    {(uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA384", (uint8_t *)"RSA1024", 62},        // 74
    {(uint8_t *)"RSA1024|PSS|SHA384|MGF1_SHA512", (uint8_t *)"RSA1024", 62},        // 75
    /*RSA1024 PSS SHA512 */
    {(uint8_t *)"RSA1024|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA1024", 62},           // 76
    {(uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA1024", 62},          // 77
    {(uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA1024", 62},        // 78
    {(uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA256", (uint8_t *)"RSA1024", 62},        // 79
    {(uint8_t *)"RSA1024|PSS|SHA512|MGF1_SHA384", (uint8_t *)"RSA1024", 62},        // 80
    /*RSA2048 PSS MD5 */
    {(uint8_t *)"RSA2048|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA2048", 62},           // 81
    {(uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA2048", 62},          // 82
    {(uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA2048", 62},        // 83
    {(uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA2048", 62},        // 84
    {(uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA2048", 62},        // 85
    {(uint8_t *)"RSA2048|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA2048", 62},        // 86
    /*RSA2048 PSS SHA1 */
    {(uint8_t *)"RSA2048|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA2048", 62},           // 87
    {(uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA2048", 62},          // 88
    {(uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA2048", 62},        // 89
    {(uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA2048", 62},        // 90
    {(uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA2048", 62},        // 91
    {(uint8_t *)"RSA2048|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA2048", 62},        // 92
    /*RSA2048 PSS SHA224 */
    {(uint8_t *)"RSA2048|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA2048", 62},           // 93
    {(uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA2048", 62},          // 94
    {(uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA2048", 62},        // 95
    {(uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA2048", 62},        // 96
    {(uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA2048", 62},        // 97
    {(uint8_t *)"RSA2048|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA2048", 62},        // 98
    /*RSA2048 PSS SHA256 */
    {(uint8_t *)"RSA2048|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA2048", 62},           // 99
    {(uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA2048", 62},          // 100
    {(uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA2048", 62},        // 101
    {(uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA2048", 62},        // 102
    {(uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA2048", 62},        // 103
    {(uint8_t *)"RSA2048|PSS|SHA256|MGF1_SHA512", (uint8_t *)"RSA2048", 62},        // 104
    /*RSA2048 PSS SHA384 */
    {(uint8_t *)"RSA2048|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA2048", 62},           // 105
    {(uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA2048", 62},          // 106
    {(uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA2048", 62},        // 107
    {(uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA2048", 62},        // 108
    {(uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA384", (uint8_t *)"RSA2048", 62},        // 109
    {(uint8_t *)"RSA2048|PSS|SHA384|MGF1_SHA512", (uint8_t *)"RSA2048", 62},        // 110
    /*RSA2048 PSS SHA512 */
    {(uint8_t *)"RSA2048|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA2048", 62},           // 111
    {(uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA2048", 62},          // 112
    {(uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA2048", 62},        // 113
    {(uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA256", (uint8_t *)"RSA2048", 62},        // 114
    {(uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA384", (uint8_t *)"RSA2048", 62},        // 115
    {(uint8_t *)"RSA2048|PSS|SHA512|MGF1_SHA512", (uint8_t *)"RSA2048", 62},        // 116
    /*RSA3072 PSS MD5 */
    {(uint8_t *)"RSA3072|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA3072", 62},           // 117
    {(uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA3072", 62},          // 118
    {(uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA3072", 62},        // 119
    {(uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA3072", 62},        // 120
    {(uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA3072", 62},        // 121
    {(uint8_t *)"RSA3072|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA3072", 62},        // 122
    /*RSA3072 PSS SHA1 */
    {(uint8_t *)"RSA3072|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA3072", 62},           // 123
    {(uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA3072", 62},          // 124
    {(uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA3072", 62},        // 125
    {(uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA3072", 62},        // 126
    {(uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA3072", 62},        // 127
    {(uint8_t *)"RSA3072|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA3072", 62},        // 128
    /*RSA3072 PSS SHA224 */
    {(uint8_t *)"RSA3072|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA3072", 62},           // 129
    {(uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA3072", 62},          // 130
    {(uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA3072", 62},        // 131
    {(uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA3072", 62},        // 132
    {(uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA3072", 62},        // 133
    {(uint8_t *)"RSA3072|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA3072", 62},        // 134
    /*RSA3072 PSS SHA256 */
    {(uint8_t *)"RSA3072|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA3072", 62},           // 135
    {(uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA3072", 62},          // 136
    {(uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA3072", 62},        // 137
    {(uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA3072", 62},        // 138
    {(uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA3072", 62},        // 139
    {(uint8_t *)"RSA3072|PSS|SHA256|MGF1_SHA512", (uint8_t *)"RSA3072", 62},        // 140
    /*RSA3072 PSS SHA384 */
    {(uint8_t *)"RSA3072|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA3072", 62},           // 141
    {(uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA3072", 62},          // 142
    {(uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA3072", 62},        // 143
    {(uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA3072", 62},        // 144
    {(uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA384", (uint8_t *)"RSA3072", 62},        // 145
    {(uint8_t *)"RSA3072|PSS|SHA384|MGF1_SHA512", (uint8_t *)"RSA3072", 62},        // 146
    /*RSA3072 PSS SHA512 */
    {(uint8_t *)"RSA3072|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA3072", 62},           // 147
    {(uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA3072", 62},          // 148
    {(uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA3072", 62},        // 149
    {(uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA256", (uint8_t *)"RSA3072", 62},        // 150
    {(uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA384", (uint8_t *)"RSA3072", 62},        // 151
    {(uint8_t *)"RSA3072|PSS|SHA512|MGF1_SHA512", (uint8_t *)"RSA3072", 62},        // 152
    /*RSA4096 PSS MD5 */
    {(uint8_t *)"RSA4096|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA4096", 62},           // 153
    {(uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA4096", 62},          // 154
    {(uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA4096", 62},        // 156
    {(uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA4096", 62},        // 157
    {(uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA4096", 62},        // 158
    {(uint8_t *)"RSA4096|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA4096", 62},        // 159
    /*RSA4096 PSS SHA1 */
    {(uint8_t *)"RSA4096|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA4096", 62},           // 160
    {(uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA4096", 62},          // 161
    {(uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA4096", 62},        // 162
    {(uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA4096", 62},        // 163
    {(uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA4096", 62},        // 164
    {(uint8_t *)"RSA4096|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA4096", 62},        // 165
    /*RSA4096 PSS SHA224 */
    {(uint8_t *)"RSA4096|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA4096", 62},           // 167
    {(uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA4096", 62},          // 168
    {(uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA4096", 62},        // 169
    {(uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA4096", 62},        // 170
    {(uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA4096", 62},        // 171
    {(uint8_t *)"RSA4096|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA4096", 62},        // 172
    /*RSA4096 PSS SHA256 */
    {(uint8_t *)"RSA4096|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA4096", 62},           // 173
    {(uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA4096", 62},          // 174
    {(uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA4096", 62},        // 175
    {(uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA4096", 62},        // 176
    {(uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA4096", 62},        // 177
    {(uint8_t *)"RSA4096|PSS|SHA256|MGF1_SHA512", (uint8_t *)"RSA4096", 62},        // 178
    /*RSA4096 PSS SHA384 */
    {(uint8_t *)"RSA4096|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA4096", 62},           // 179
    {(uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA4096", 62},          // 180
    {(uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA4096", 62},        // 181
    {(uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA4096", 62},        // 182
    {(uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA384", (uint8_t *)"RSA4096", 62},        // 183
    {(uint8_t *)"RSA4096|PSS|SHA384|MGF1_SHA512", (uint8_t *)"RSA4096", 62},        // 184
    /*RSA4096 PSS SHA512 */
    {(uint8_t *)"RSA4096|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA4096", 62},           // 185
    {(uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA4096", 62},          // 186
    {(uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA4096", 62},        // 187
    {(uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA256", (uint8_t *)"RSA4096", 62},        // 188
    {(uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA384", (uint8_t *)"RSA4096", 62},        // 189
    {(uint8_t *)"RSA4096|PSS|SHA512|MGF1_SHA512", (uint8_t *)"RSA4096", 62},        // 190
    /*RSA8192 PSS MD5 */
    {(uint8_t *)"RSA8192|PSS|MD5|MGF1_MD5", (uint8_t *)"RSA8192", 62},           // 191
    {(uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA1", (uint8_t *)"RSA8192", 62},          // 192
    {(uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA224", (uint8_t *)"RSA8192", 62},        // 193
    {(uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA256", (uint8_t *)"RSA8192", 62},        // 194
    {(uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA384", (uint8_t *)"RSA8192", 62},        // 195
    {(uint8_t *)"RSA8192|PSS|MD5|MGF1_SHA512", (uint8_t *)"RSA8192", 62},        // 196
    /*RSA8192 PSS SHA1 */
    {(uint8_t *)"RSA8192|PSS|SHA1|MGF1_MD5", (uint8_t *)"RSA8192", 62},           // 197
    {(uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA1", (uint8_t *)"RSA8192", 62},          // 198
    {(uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA224", (uint8_t *)"RSA8192", 62},        // 199
    {(uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA256", (uint8_t *)"RSA8192", 62},        // 200
    {(uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA384", (uint8_t *)"RSA8192", 62},        // 201
    {(uint8_t *)"RSA8192|PSS|SHA1|MGF1_SHA512", (uint8_t *)"RSA8192", 62},        // 202
    /*RSA8192 PSS SHA224 */
    {(uint8_t *)"RSA8192|PSS|SHA224|MGF1_MD5", (uint8_t *)"RSA8192", 62},           // 203
    {(uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA1", (uint8_t *)"RSA8192", 62},          // 204
    {(uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA224", (uint8_t *)"RSA8192", 62},        // 205
    {(uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA256", (uint8_t *)"RSA8192", 62},        // 206
    {(uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA384", (uint8_t *)"RSA8192", 62},        // 207
    {(uint8_t *)"RSA8192|PSS|SHA224|MGF1_SHA512", (uint8_t *)"RSA8192", 62},        // 208
    /*RSA8192 PSS SHA256 */
    {(uint8_t *)"RSA8192|PSS|SHA256|MGF1_MD5", (uint8_t *)"RSA8192", 62},           // 209
    {(uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA1", (uint8_t *)"RSA8192", 62},          // 210
    {(uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA224", (uint8_t *)"RSA8192", 62},        // 211
    {(uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA256", (uint8_t *)"RSA8192", 62},        // 212
    {(uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA384", (uint8_t *)"RSA8192", 62},        // 213
    {(uint8_t *)"RSA8192|PSS|SHA256|MGF1_SHA512", (uint8_t *)"RSA8192", 62},        // 214
    /*RSA8192 PSS SHA384 */
    {(uint8_t *)"RSA8192|PSS|SHA384|MGF1_MD5", (uint8_t *)"RSA8192", 62},           // 215
    {(uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA1", (uint8_t *)"RSA8192", 62},          // 216
    {(uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA224", (uint8_t *)"RSA8192", 62},        // 217
    {(uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA256", (uint8_t *)"RSA8192", 62},        // 218
    {(uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA384", (uint8_t *)"RSA8192", 62},        // 219
    {(uint8_t *)"RSA8192|PSS|SHA384|MGF1_SHA512", (uint8_t *)"RSA8192", 62},        // 220
    /*RSA8192 PSS SHA512 */
    {(uint8_t *)"RSA8192|PSS|SHA512|MGF1_MD5", (uint8_t *)"RSA8192", 62},           // 221
    {(uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA1", (uint8_t *)"RSA8192", 62},          // 222
    {(uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA224", (uint8_t *)"RSA8192", 62},        // 223
    {(uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA256", (uint8_t *)"RSA8192", 62},        // 224
    {(uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA384", (uint8_t *)"RSA8192", 62},        // 225
    {(uint8_t *)"RSA8192|PSS|SHA512|MGF1_SHA512", (uint8_t *)"RSA8192", 62},        // 226
};

OnlySignSpec g_onlySignData[] = {
    /* RSA512 PKCS1 */
    {(uint8_t *)"RSA512|PKCS1|MD5|OnlySign", (uint8_t *)"RSA512|PKCS1|MD5|Recover", (uint8_t *)"RSA512", (uint8_t *)"MD5", 16},           // 0
    {(uint8_t *)"RSA512|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA512|PKCS1|SHA1|Recover", (uint8_t *)"RSA512", (uint8_t *)"SHA1", 20},        // 1
    {(uint8_t *)"RSA512|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA512|PKCS1|SHA224|Recover", (uint8_t *)"RSA512", (uint8_t *)"SHA224", 28},  // 2
    {(uint8_t *)"RSA512|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA512|PKCS1|SHA256|Recover", (uint8_t *)"RSA512", (uint8_t *)"SHA256", 32},  // 3
    /* RSA768 PKCS1 */
    {(uint8_t *)"RSA768|PKCS1|MD5|OnlySign", (uint8_t *)"RSA768|PKCS1|MD5|Recover", (uint8_t *)"RSA768", (uint8_t *)"MD5", 16},           // 4
    {(uint8_t *)"RSA768|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA768|PKCS1|SHA1|Recover", (uint8_t *)"RSA768", (uint8_t *)"SHA1", 20},        // 5
    {(uint8_t *)"RSA768|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA768|PKCS1|SHA224|Recover", (uint8_t *)"RSA768", (uint8_t *)"SHA224", 28},  // 6
    {(uint8_t *)"RSA768|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA768|PKCS1|SHA256|Recover", (uint8_t *)"RSA768", (uint8_t *)"SHA256", 32},  // 7
    {(uint8_t *)"RSA768|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA768|PKCS1|SHA384|Recover", (uint8_t *)"RSA768", (uint8_t *)"SHA384", 48},  // 8
    {(uint8_t *)"RSA768|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA768|PKCS1|SHA512|Recover", (uint8_t *)"RSA768", (uint8_t *)"SHA512", 64},  // 9
    /* RSA1024 PKCS1 */
    {(uint8_t *)"RSA1024|PKCS1|MD5|OnlySign", (uint8_t *)"RSA1024|PKCS1|MD5|Recover", (uint8_t *)"RSA1024", (uint8_t *)"MD5", 16},           // 10
    {(uint8_t *)"RSA1024|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA1024|PKCS1|SHA1|Recover", (uint8_t *)"RSA1024", (uint8_t *)"SHA1", 20},        // 11
    {(uint8_t *)"RSA1024|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA1024|PKCS1|SHA224|Recover", (uint8_t *)"RSA1024", (uint8_t *)"SHA224", 28},  // 12
    {(uint8_t *)"RSA1024|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA1024|PKCS1|SHA256|Recover", (uint8_t *)"RSA1024", (uint8_t *)"SHA256", 32},  // 13
    {(uint8_t *)"RSA1024|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA1024|PKCS1|SHA384|Recover", (uint8_t *)"RSA1024", (uint8_t *)"SHA384", 48},  // 14
    {(uint8_t *)"RSA1024|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA1024|PKCS1|SHA512|Recover", (uint8_t *)"RSA1024", (uint8_t *)"SHA512", 64},  // 15
    /* RSA2048 PKCS1 */
    {(uint8_t *)"RSA2048|PKCS1|MD5|OnlySign", (uint8_t *)"RSA2048|PKCS1|MD5|Recover", (uint8_t *)"RSA2048", (uint8_t *)"MD5", 16},           // 16
    {(uint8_t *)"RSA2048|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA2048|PKCS1|SHA1|Recover", (uint8_t *)"RSA2048", (uint8_t *)"SHA1", 20},        // 17
    {(uint8_t *)"RSA2048|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA2048|PKCS1|SHA224|Recover", (uint8_t *)"RSA2048", (uint8_t *)"SHA224", 28},  // 18
    {(uint8_t *)"RSA2048|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA2048|PKCS1|SHA256|Recover", (uint8_t *)"RSA2048", (uint8_t *)"SHA256", 32},  // 19
    {(uint8_t *)"RSA2048|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA2048|PKCS1|SHA384|Recover", (uint8_t *)"RSA2048", (uint8_t *)"SHA384", 48},  // 20
    {(uint8_t *)"RSA2048|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA2048|PKCS1|SHA512|Recover", (uint8_t *)"RSA2048", (uint8_t *)"SHA512", 64},  // 21
    /* RSA3072 PKCS1 */
    {(uint8_t *)"RSA3072|PKCS1|MD5|OnlySign", (uint8_t *)"RSA3072|PKCS1|MD5|Recover", (uint8_t *)"RSA3072", (uint8_t *)"MD5", 16},           // 22
    {(uint8_t *)"RSA3072|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA3072|PKCS1|SHA1|Recover", (uint8_t *)"RSA3072", (uint8_t *)"SHA1", 20},        // 23
    {(uint8_t *)"RSA3072|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA3072|PKCS1|SHA224|Recover", (uint8_t *)"RSA3072", (uint8_t *)"SHA224", 28},  // 24
    {(uint8_t *)"RSA3072|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA3072|PKCS1|SHA256|Recover", (uint8_t *)"RSA3072", (uint8_t *)"SHA256", 32},  // 25
    {(uint8_t *)"RSA3072|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA3072|PKCS1|SHA384|Recover", (uint8_t *)"RSA3072", (uint8_t *)"SHA384", 48},  // 26
    {(uint8_t *)"RSA3072|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA3072|PKCS1|SHA512|Recover", (uint8_t *)"RSA3072", (uint8_t *)"SHA512", 64},  // 27
    /* RSA4096 PKCS1 */
    {(uint8_t *)"RSA4096|PKCS1|MD5|OnlySign", (uint8_t *)"RSA4096|PKCS1|MD5|Recover", (uint8_t *)"RSA4096", (uint8_t *)"MD5", 16},           // 28
    {(uint8_t *)"RSA4096|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA4096|PKCS1|SHA1|Recover", (uint8_t *)"RSA4096", (uint8_t *)"SHA1", 20},        // 29
    {(uint8_t *)"RSA4096|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA4096|PKCS1|SHA224|Recover", (uint8_t *)"RSA4096", (uint8_t *)"SHA224", 28},  // 30
    {(uint8_t *)"RSA4096|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA4096|PKCS1|SHA256|Recover", (uint8_t *)"RSA4096", (uint8_t *)"SHA256", 32},  // 31
    {(uint8_t *)"RSA4096|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA4096|PKCS1|SHA384|Recover", (uint8_t *)"RSA4096", (uint8_t *)"SHA384", 48},  // 32
    {(uint8_t *)"RSA4096|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA4096|PKCS1|SHA512|Recover", (uint8_t *)"RSA4096", (uint8_t *)"SHA512", 64},  // 33
    /* RSA8192 PKCS1 */
    {(uint8_t *)"RSA8192|PKCS1|MD5|OnlySign", (uint8_t *)"RSA8192|PKCS1|MD5|Recover", (uint8_t *)"RSA8192", (uint8_t *)"MD5", 16},           // 34
    {(uint8_t *)"RSA8192|PKCS1|SHA1|OnlySign", (uint8_t *)"RSA8192|PKCS1|SHA1|Recover", (uint8_t *)"RSA8192", (uint8_t *)"SHA1", 20},        // 35
    {(uint8_t *)"RSA8192|PKCS1|SHA224|OnlySign", (uint8_t *)"RSA8192|PKCS1|SHA224|Recover", (uint8_t *)"RSA8192", (uint8_t *)"SHA224", 28},  // 36
    {(uint8_t *)"RSA8192|PKCS1|SHA256|OnlySign", (uint8_t *)"RSA8192|PKCS1|SHA256|Recover", (uint8_t *)"RSA8192", (uint8_t *)"SHA256", 32},  // 37
    {(uint8_t *)"RSA8192|PKCS1|SHA384|OnlySign", (uint8_t *)"RSA8192|PKCS1|SHA384|Recover", (uint8_t *)"RSA8192", (uint8_t *)"SHA384", 48},  // 38
    {(uint8_t *)"RSA8192|PKCS1|SHA512|OnlySign", (uint8_t *)"RSA8192|PKCS1|SHA512|Recover", (uint8_t *)"RSA8192", (uint8_t *)"SHA512", 64},  // 39
    /* RSA8192 PKCS1 NoHash */
    {(uint8_t *)"RSA512|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA512|PKCS1|NoHash|Recover", (uint8_t *)"RSA512", (uint8_t *)"NoHash", 64 - 11},     // 40
    {(uint8_t *)"RSA768|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA768|PKCS1|NoHash|Recover", (uint8_t *)"RSA768", (uint8_t *)"NoHash", 96 - 11},     // 41
    {(uint8_t *)"RSA1024|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA1024|PKCS1|NoHash|Recover", (uint8_t *)"RSA1024", (uint8_t *)"NoHash", 128 - 11}, // 42
    {(uint8_t *)"RSA2048|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA2048|PKCS1|NoHash|Recover", (uint8_t *)"RSA2048", (uint8_t *)"NoHash", 256 - 11}, // 43
    {(uint8_t *)"RSA3072|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA3072|PKCS1|NoHash|Recover", (uint8_t *)"RSA3072", (uint8_t *)"NoHash", 384 - 11}, // 44
    {(uint8_t *)"RSA4096|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA4096|PKCS1|NoHash|Recover", (uint8_t *)"RSA4096", (uint8_t *)"NoHash", 512 -11},  // 45
    {(uint8_t *)"RSA8192|PKCS1|NoHash|OnlySign", (uint8_t *)"RSA8192|PKCS1|NoHash|Recover", (uint8_t *)"RSA8192", (uint8_t *)"NoHash", 1024 -11}, // 46
    /* RSA8192 NoPadding NoHash */
    {(uint8_t *)"RSA512|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA512|NoPadding|NoHash|Recover", (uint8_t *)"RSA512", (uint8_t *)"NoHash", 64},      // 47
    {(uint8_t *)"RSA768|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA768|NoPadding|NoHash|Recover", (uint8_t *)"RSA768", (uint8_t *)"NoHash", 96},      // 48
    {(uint8_t *)"RSA1024|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA1024|NoPadding|NoHash|Recover", (uint8_t *)"RSA1024", (uint8_t *)"NoHash", 128},  // 49
    {(uint8_t *)"RSA2048|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA2048|NoPadding|NoHash|Recover", (uint8_t *)"RSA2048", (uint8_t *)"NoHash", 256},  // 50
    {(uint8_t *)"RSA3072|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA3072|NoPadding|NoHash|Recover", (uint8_t *)"RSA3072", (uint8_t *)"NoHash", 384},  // 51
    {(uint8_t *)"RSA4096|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA4096|NoPadding|NoHash|Recover", (uint8_t *)"RSA4096", (uint8_t *)"NoHash", 512},  // 52
    {(uint8_t *)"RSA8192|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA8192|NoPadding|NoHash|Recover", (uint8_t *)"RSA8192", (uint8_t *)"NoHash", 1024}, // 53
    /* RSA */
    {(uint8_t *)"RSA|PKCS1|MD5|OnlySign", (uint8_t *)"RSA|PKCS1|MD5|Recover", (uint8_t *)"RSA512", (uint8_t *)"MD5", 16},                        // 54
    {(uint8_t *)"RSA|NoPadding|NoHash|OnlySign", (uint8_t *)"RSA|NoPadding|NoHash|Recover", (uint8_t *)"RSA512", (uint8_t *)"NoHash", 64},       // 55
};

AsymSignSpec g_dsaData[] = {
    /* DSA1024 */
    {(uint8_t *)"DSA1024|SHA1", (uint8_t *)"DSA1024", (uint8_t *)"SHA1", 62},      // 0
    {(uint8_t *)"DSA1024|SHA224", (uint8_t *)"DSA1024", (uint8_t *)"SHA224", 62},  // 1
    {(uint8_t *)"DSA1024|SHA256", (uint8_t *)"DSA1024", (uint8_t *)"SHA256", 62},  // 2
    {(uint8_t *)"DSA1024|SHA384", (uint8_t *)"DSA1024", (uint8_t *)"SHA384", 62},  // 3
    {(uint8_t *)"DSA1024|SHA512", (uint8_t *)"DSA1024", (uint8_t *)"SHA512", 62},  // 4
    /* DSA2048 */
    {(uint8_t *)"DSA2048|SHA1", (uint8_t *)"DSA2048", (uint8_t *)"SHA1", 62},      // 5
    {(uint8_t *)"DSA2048|SHA224", (uint8_t *)"DSA2048", (uint8_t *)"SHA224", 62},  // 6
    {(uint8_t *)"DSA2048|SHA256", (uint8_t *)"DSA2048", (uint8_t *)"SHA256", 62},  // 7
    {(uint8_t *)"DSA2048|SHA384", (uint8_t *)"DSA2048", (uint8_t *)"SHA384", 62},  // 8
    {(uint8_t *)"DSA2048|SHA512", (uint8_t *)"DSA2048", (uint8_t *)"SHA512", 62},  // 9
    /* DSA3072 */
    {(uint8_t *)"DSA3072|SHA1", (uint8_t *)"DSA3072", (uint8_t *)"SHA1", 62},      // 10
    {(uint8_t *)"DSA3072|SHA224", (uint8_t *)"DSA3072", (uint8_t *)"SHA224", 62},  // 11
    {(uint8_t *)"DSA3072|SHA256", (uint8_t *)"DSA3072", (uint8_t *)"SHA256", 62},  // 12
    {(uint8_t *)"DSA3072|SHA384", (uint8_t *)"DSA3072", (uint8_t *)"SHA384", 62},  // 13
    {(uint8_t *)"DSA3072|SHA512", (uint8_t *)"DSA3072", (uint8_t *)"SHA512", 62},  // 14
    /* DSA */
    {(uint8_t *)"DSA|SHA256", (uint8_t *)"DSA1024", (uint8_t *)"SHA256", 62},      // 15
    /* DSA NoHash */
    {(uint8_t *)"DSA1024|NoHash", (uint8_t *)"DSA1024", (uint8_t *)"NoHash", 62},  // 16
    {(uint8_t *)"DSA2048|NoHash", (uint8_t *)"DSA2048", (uint8_t *)"NoHash", 62},  // 17
    {(uint8_t *)"DSA3072|NoHash", (uint8_t *)"DSA3072", (uint8_t *)"NoHash", 62},  // 18
    {(uint8_t *)"DSA|NoHash", (uint8_t *)"DSA1024", (uint8_t *)"NoHash", 62},      // 19
};

AsymSignSpec g_ecdsaData[] = {
    /* ECC224 */
    {(uint8_t *)"ECC224|SHA1", (uint8_t *)"ECC224", (uint8_t *)"SHA1", 62},      // 0
    {(uint8_t *)"ECC224|SHA224", (uint8_t *)"ECC224", (uint8_t *)"SHA224", 62},  // 1
    {(uint8_t *)"ECC224|SHA256", (uint8_t *)"ECC224", (uint8_t *)"SHA256", 62},  // 2
    {(uint8_t *)"ECC224|SHA384", (uint8_t *)"ECC224", (uint8_t *)"SHA384", 62},  // 3
    {(uint8_t *)"ECC224|SHA512", (uint8_t *)"ECC224", (uint8_t *)"SHA512", 62},  // 4
    /* ECC256 */
    {(uint8_t *)"ECC256|SHA1", (uint8_t *)"ECC256", (uint8_t *)"SHA1", 62},      // 5
    {(uint8_t *)"ECC256|SHA224", (uint8_t *)"ECC256", (uint8_t *)"SHA224", 62},  // 6
    {(uint8_t *)"ECC256|SHA256", (uint8_t *)"ECC256", (uint8_t *)"SHA256", 62},  // 7
    {(uint8_t *)"ECC256|SHA384", (uint8_t *)"ECC256", (uint8_t *)"SHA384", 62},  // 8
    {(uint8_t *)"ECC256|SHA512", (uint8_t *)"ECC256", (uint8_t *)"SHA512", 62},  // 9
    /* ECC384 */
    {(uint8_t *)"ECC384|SHA1", (uint8_t *)"ECC384", (uint8_t *)"SHA1", 62},      // 10
    {(uint8_t *)"ECC384|SHA224", (uint8_t *)"ECC384", (uint8_t *)"SHA224", 62},  // 11
    {(uint8_t *)"ECC384|SHA256", (uint8_t *)"ECC384", (uint8_t *)"SHA256", 62},  // 12
    {(uint8_t *)"ECC384|SHA384", (uint8_t *)"ECC384", (uint8_t *)"SHA384", 62},  // 13
    {(uint8_t *)"ECC384|SHA512", (uint8_t *)"ECC384", (uint8_t *)"SHA512", 62},  // 14
    /* ECC521 */
    {(uint8_t *)"ECC521|SHA1", (uint8_t *)"ECC521", (uint8_t *)"SHA1", 62},      // 15
    {(uint8_t *)"ECC521|SHA224", (uint8_t *)"ECC521", (uint8_t *)"SHA224", 62},  // 16
    {(uint8_t *)"ECC521|SHA256", (uint8_t *)"ECC521", (uint8_t *)"SHA256", 62},  // 17
    {(uint8_t *)"ECC521|SHA384", (uint8_t *)"ECC521", (uint8_t *)"SHA384", 62},  // 18
    {(uint8_t *)"ECC521|SHA512", (uint8_t *)"ECC521", (uint8_t *)"SHA512", 62},  // 19
    /* ECC_BrainPoolP160r1 */
    {(uint8_t *)"ECC_BrainPoolP160r1|SHA1", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"SHA1", 62},      // 20
    {(uint8_t *)"ECC_BrainPoolP160r1|SHA224", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"SHA224", 62},  // 21
    {(uint8_t *)"ECC_BrainPoolP160r1|SHA256", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"SHA256", 62},  // 22
    {(uint8_t *)"ECC_BrainPoolP160r1|SHA384", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"SHA384", 62},  // 23
    {(uint8_t *)"ECC_BrainPoolP160r1|SHA512", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"SHA512", 62},  // 24
    /* ECC_BrainPoolP160t1 */
    {(uint8_t *)"ECC_BrainPoolP160t1|SHA1", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"SHA1", 62},      // 25
    {(uint8_t *)"ECC_BrainPoolP160t1|SHA224", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"SHA224", 62},  // 26
    {(uint8_t *)"ECC_BrainPoolP160t1|SHA256", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"SHA256", 62},  // 27
    {(uint8_t *)"ECC_BrainPoolP160t1|SHA384", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"SHA384", 62},  // 28
    {(uint8_t *)"ECC_BrainPoolP160t1|SHA512", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"SHA512", 62},  // 29
    /* ECC_BrainPoolP192r1 */
    {(uint8_t *)"ECC_BrainPoolP192r1|SHA1", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"SHA1", 62},      // 30
    {(uint8_t *)"ECC_BrainPoolP192r1|SHA224", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"SHA224", 62},  // 31
    {(uint8_t *)"ECC_BrainPoolP192r1|SHA256", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"SHA256", 62},  // 32
    {(uint8_t *)"ECC_BrainPoolP192r1|SHA384", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"SHA384", 62},  // 33
    {(uint8_t *)"ECC_BrainPoolP192r1|SHA512", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"SHA512", 62},  // 34
    /* ECC_BrainPoolP192t1 */
    {(uint8_t *)"ECC_BrainPoolP192t1|SHA1", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"SHA1", 62},      // 35
    {(uint8_t *)"ECC_BrainPoolP192t1|SHA224", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"SHA224", 62},  // 36
    {(uint8_t *)"ECC_BrainPoolP192t1|SHA256", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"SHA256", 62},  // 37
    {(uint8_t *)"ECC_BrainPoolP192t1|SHA384", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"SHA384", 62},  // 38
    {(uint8_t *)"ECC_BrainPoolP192t1|SHA512", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"SHA512", 62},  // 39
    /* ECC_BrainPoolP224r1 */
    {(uint8_t *)"ECC_BrainPoolP224r1|SHA1", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"SHA1", 62},      // 40
    {(uint8_t *)"ECC_BrainPoolP224r1|SHA224", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"SHA224", 62},  // 41
    {(uint8_t *)"ECC_BrainPoolP224r1|SHA256", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"SHA256", 62},  // 42
    {(uint8_t *)"ECC_BrainPoolP224r1|SHA384", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"SHA384", 62},  // 43
    {(uint8_t *)"ECC_BrainPoolP224r1|SHA512", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"SHA512", 62},  // 44
    /* ECC_BrainPoolP224t1 */
    {(uint8_t *)"ECC_BrainPoolP224t1|SHA1", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"SHA1", 62},      // 45
    {(uint8_t *)"ECC_BrainPoolP224t1|SHA224", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"SHA224", 62},  // 46
    {(uint8_t *)"ECC_BrainPoolP224t1|SHA256", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"SHA256", 62},  // 47
    {(uint8_t *)"ECC_BrainPoolP224t1|SHA384", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"SHA384", 62},  // 48
    {(uint8_t *)"ECC_BrainPoolP224t1|SHA512", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"SHA512", 62},  // 49
    /* ECC_BrainPoolP256r1 */
    {(uint8_t *)"ECC_BrainPoolP256r1|SHA1", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"SHA1", 62},      // 50
    {(uint8_t *)"ECC_BrainPoolP256r1|SHA224", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"SHA224", 62},  // 51
    {(uint8_t *)"ECC_BrainPoolP256r1|SHA256", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"SHA256", 62},  // 52
    {(uint8_t *)"ECC_BrainPoolP256r1|SHA384", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"SHA384", 62},  // 53
    {(uint8_t *)"ECC_BrainPoolP256r1|SHA512", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"SHA512", 62},  // 54
    /* ECC_BrainPoolP256t1 */
    {(uint8_t *)"ECC_BrainPoolP256t1|SHA1", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"SHA1", 62},      // 55
    {(uint8_t *)"ECC_BrainPoolP256t1|SHA224", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"SHA224", 62},  // 56
    {(uint8_t *)"ECC_BrainPoolP256t1|SHA256", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"SHA256", 62},  // 57
    {(uint8_t *)"ECC_BrainPoolP256t1|SHA384", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"SHA384", 62},  // 58
    {(uint8_t *)"ECC_BrainPoolP256t1|SHA512", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"SHA512", 62},  // 59
    /* ECC_BrainPoolP320r1 */
    {(uint8_t *)"ECC_BrainPoolP320r1|SHA1", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"SHA1", 62},      // 60
    {(uint8_t *)"ECC_BrainPoolP320r1|SHA224", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"SHA224", 62},  // 61
    {(uint8_t *)"ECC_BrainPoolP320r1|SHA256", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"SHA256", 62},  // 62
    {(uint8_t *)"ECC_BrainPoolP320r1|SHA384", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"SHA384", 62},  // 63
    {(uint8_t *)"ECC_BrainPoolP320r1|SHA512", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"SHA512", 62},  // 64
    /* ECC_BrainPoolP320t1 */
    {(uint8_t *)"ECC_BrainPoolP320t1|SHA1", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"SHA1", 62},      // 65
    {(uint8_t *)"ECC_BrainPoolP320t1|SHA224", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"SHA224", 62},  // 66
    {(uint8_t *)"ECC_BrainPoolP320t1|SHA256", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"SHA256", 62},  // 67
    {(uint8_t *)"ECC_BrainPoolP320t1|SHA384", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"SHA384", 62},  // 68
    {(uint8_t *)"ECC_BrainPoolP320t1|SHA512", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"SHA512", 62},  // 69
    /* ECC_BrainPoolP384r1 */
    {(uint8_t *)"ECC_BrainPoolP384r1|SHA1", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"SHA1", 62},      // 70
    {(uint8_t *)"ECC_BrainPoolP384r1|SHA224", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"SHA224", 62},  // 71
    {(uint8_t *)"ECC_BrainPoolP384r1|SHA256", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"SHA256", 62},  // 72
    {(uint8_t *)"ECC_BrainPoolP384r1|SHA384", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"SHA384", 62},  // 73
    {(uint8_t *)"ECC_BrainPoolP384r1|SHA512", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"SHA512", 62},  // 74
    /* ECC_BrainPoolP384t1 */
    {(uint8_t *)"ECC_BrainPoolP384t1|SHA1", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"SHA1", 62},      // 75
    {(uint8_t *)"ECC_BrainPoolP384t1|SHA224", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"SHA224", 62},  // 76
    {(uint8_t *)"ECC_BrainPoolP384t1|SHA256", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"SHA256", 62},  // 77
    {(uint8_t *)"ECC_BrainPoolP384t1|SHA384", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"SHA384", 62},  // 78
    {(uint8_t *)"ECC_BrainPoolP384t1|SHA512", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"SHA512", 62},  // 79
    /* ECC_BrainPoolP512r1 */
    {(uint8_t *)"ECC_BrainPoolP512r1|SHA1", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"SHA1", 62},      // 80
    {(uint8_t *)"ECC_BrainPoolP512r1|SHA224", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"SHA224", 62},  // 81
    {(uint8_t *)"ECC_BrainPoolP512r1|SHA256", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"SHA256", 62},  // 82
    {(uint8_t *)"ECC_BrainPoolP512r1|SHA384", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"SHA384", 62},  // 83
    {(uint8_t *)"ECC_BrainPoolP512r1|SHA512", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"SHA512", 62},  // 84
    /* ECC_BrainPoolP512t1 */
    {(uint8_t *)"ECC_BrainPoolP512t1|SHA1", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"SHA1", 62},      // 85
    {(uint8_t *)"ECC_BrainPoolP512t1|SHA224", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"SHA224", 62},  // 86
    {(uint8_t *)"ECC_BrainPoolP512t1|SHA256", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"SHA256", 62},  // 87
    {(uint8_t *)"ECC_BrainPoolP512t1|SHA384", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"SHA384", 62},  // 88
    {(uint8_t *)"ECC_BrainPoolP512t1|SHA512", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"SHA512", 62},  // 89
    /* ECC_Secp256k1 */
    {(uint8_t *)"ECC_Secp256k1|SHA1", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"SHA1", 62},      // 90
    {(uint8_t *)"ECC_Secp256k1|SHA224", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"SHA224", 62},  // 91
    {(uint8_t *)"ECC_Secp256k1|SHA256", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"SHA256", 62},  // 92
    {(uint8_t *)"ECC_Secp256k1|SHA384", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"SHA384", 62},  // 93
    {(uint8_t *)"ECC_Secp256k1|SHA512", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"SHA512", 62},  // 94
    /* ECC */
    {(uint8_t *)"ECC|SHA1", (uint8_t *)"ECC521", (uint8_t *)"SHA1", 62},      // 95
};

AsymSignSpec g_signOtherData[] = {
    /* SM2 */
    {(uint8_t *)"SM2_256|SM3", (uint8_t *)"SM2_256", (uint8_t *)"SM3", 62},      // 0
    {(uint8_t *)"SM2|SM3", (uint8_t *)"SM2_256", (uint8_t *)"SM3", 62},          // 1
    /* Ed25519 */
    {(uint8_t *)"Ed25519", (uint8_t *)"Ed25519", nullptr, 62},                   // 2
};

class SIGNATURE_RSA_PKCS1_TEST : public testing::TestWithParam<SignSpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SIGNATURE_RSA_PSS_TEST : public testing::TestWithParam<SignSpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SIGNATURE_RSA_ONLYSIGN_TEST : public testing::TestWithParam<OnlySignSpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SIGNATURE_DSA_TEST : public testing::TestWithParam<AsymSignSpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SIGNATURE_ECDSA_TEST : public testing::TestWithParam<AsymSignSpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SIGNATURE_SM2_ED25519_TEST : public testing::TestWithParam<AsymSignSpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSignatureNapiTest, SIGNATURE_RSA_PKCS1_TEST, ::testing::ValuesIn(g_signPkcs1Data));

static OH_Crypto_ErrCode OHTEST_DoNoSegmentSign(const char *algoName, OH_CryptoPrivKey *privKey, Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData)
{
    OH_CryptoSign *sign = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    ret = OH_CryptoSign_Create(algoName, &sign);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoSign_Init(sign, privKey);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoSign_Final(sign, msgBlob, signData);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    } else {
        const char *signName = OH_CryptoSign_GetAlgoName(sign);
        EXPECT_TRUE(signName != nullptr);
    }

EXIT:
    OH_CryptoSign_Destroy(sign);
    return ret;
}

static OH_Crypto_ErrCode OHTEST_DoSegmentSign(const char *algoName, OH_CryptoPrivKey *privKey, Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData, int blockSize)
{
    OH_CryptoSign *sign = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    int quotient = msgBlob->len / blockSize;
    int remainder = msgBlob->len % blockSize;
    uint8_t *data = msgBlob->data;
    size_t len = msgBlob->len;
    Crypto_DataBlob *dataBlob = msgBlob;

    ret = OH_CryptoSign_Create(algoName, &sign);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoSign_Init(sign, privKey);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    for (int i = 0; i < quotient; i++) {
        dataBlob->len = blockSize;
        ret = OH_CryptoSign_Update(sign, dataBlob);
        if (ret != CRYPTO_SUCCESS) {
            goto EXIT;
        }
        dataBlob->data += blockSize;
    }
    dataBlob->len = remainder;
    ret = OH_CryptoSign_Final(sign, dataBlob, signData);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }

EXIT:
    dataBlob->data = data;
    dataBlob->len = len;
    OH_CryptoSign_Destroy(sign);
    return ret;
}

static bool OHTEST_DoVerify(const char *algoName, OH_CryptoPubKey *pubKey, Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData)
{
    OH_CryptoVerify *verify = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    bool res = false;

    ret = OH_CryptoVerify_Create(algoName, &verify);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoVerify_Init(verify, pubKey);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    res = OH_CryptoVerify_Final(verify, msgBlob, signData);

EXIT:
    OH_CryptoVerify_Destroy(verify);
    return res;
}

static OH_Crypto_ErrCode OHTEST_DoRecover(const char *algoName, OH_CryptoPubKey *pubKey, Crypto_DataBlob *signData, Crypto_DataBlob *rawBlob)
{
    OH_CryptoVerify *recover = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    ret = OH_CryptoVerify_Create(algoName, &recover);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoVerify_Init(recover, pubKey);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoVerify_Recover(recover, signData, rawBlob);

EXIT:
    OH_CryptoVerify_Destroy(recover);
    return ret;
}

static bool OHTEST_DoSegmentVerify(const char *algoName, OH_CryptoPubKey *pubKey, Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData, int blockSize)
{
    OH_CryptoVerify *verify = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    bool res = false;
    int quotient = msgBlob->len / blockSize;
    int remainder = msgBlob->len % blockSize;
    Crypto_DataBlob *dataBlob = msgBlob;
    uint8_t *data = msgBlob->data;
    size_t len = msgBlob->len;

    ret = OH_CryptoVerify_Create(algoName, &verify);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoVerify_Init(verify, pubKey);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    for (int i = 0; i < quotient; i++) {
        dataBlob->len = blockSize;
        ret = OH_CryptoVerify_Update(verify, dataBlob);
        if (ret != CRYPTO_SUCCESS) {
            goto EXIT;
        }
        dataBlob->data += blockSize;
    }
    dataBlob->len = remainder;
    res = OH_CryptoVerify_Final(verify, dataBlob, signData);

EXIT:
    dataBlob->data = data;
    dataBlob->len = len;
    OH_CryptoVerify_Destroy(verify);
    return res;
}

static OH_CryptoKeyPair *OHTEST_GenAsymKey(const char *algoName)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algoName, &ctx), CRYPTO_SUCCESS);
    if (strcmp(algoName, "RSA8192") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192pubKey, .len = sizeof(g_rsa8192pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa8192priKey, .len = sizeof(g_rsa8192priKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(algoName, "RSA4096") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa4096pubKey, .len = sizeof(g_rsa4096pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa4096priKey, .len = sizeof(g_rsa4096priKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(algoName, "RSA3072") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa3072pubKey, .len = sizeof(g_rsa3072pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa3072priKey, .len = sizeof(g_rsa3072priKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    }

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    return keyPair;
}

HWTEST_P(SIGNATURE_RSA_PKCS1_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_0100, TestSize.Level0)
{
    SignSpec specInfo = GetParam();
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)specInfo.algoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

HWTEST_P(SIGNATURE_RSA_PKCS1_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_0200, TestSize.Level0)
{
    SignSpec specInfo = GetParam();
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)specInfo.algoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData1 = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData2 = {.data = nullptr, .len = 0};
    int blockSize = 20;

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    ret = OHTEST_DoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData2, blockSize);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData1);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(signData1.data, signData2.data, signData1.len) == 0);
    EXPECT_TRUE(signData1.len == signData2.len);
    EXPECT_TRUE(OHTEST_DoSegmentVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData1, blockSize));

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData1);
    OH_Crypto_FreeDataBlob(&signData2);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSignatureNapiTest, SIGNATURE_RSA_PSS_TEST, ::testing::ValuesIn(g_signPssData));

HWTEST_P(SIGNATURE_RSA_PSS_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_0300, TestSize.Level0)
{
    SignSpec specInfo = GetParam();
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)specInfo.algoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

HWTEST_P(SIGNATURE_RSA_PSS_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_0400, TestSize.Level0)
{
    SignSpec specInfo = GetParam();
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)specInfo.algoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData1 = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData2 = {.data = nullptr, .len = 0};
    int blockSize = 20;

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    ret = OHTEST_DoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData2, blockSize);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData1);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(signData1.len == signData2.len);
    EXPECT_TRUE(OHTEST_DoSegmentVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData1, blockSize));
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData2));

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData1);
    OH_Crypto_FreeDataBlob(&signData2);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSignatureNapiTest, SIGNATURE_RSA_ONLYSIGN_TEST, ::testing::ValuesIn(g_onlySignData));

HWTEST_P(SIGNATURE_RSA_ONLYSIGN_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_0500, TestSize.Level0)
{
    OnlySignSpec specInfo = GetParam();
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *signAlgoName = (const char *)specInfo.signAlgoName;
    const char *verifyAlgoName = (const char *)specInfo.verifyAlgoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    Crypto_DataBlob rawData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(signAlgoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_EQ(OHTEST_DoRecover(verifyAlgoName, pubKey, &signData, &rawData), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(rawData.data, msgBlob.data, msgBlob.len) == 0);
    EXPECT_EQ(msgBlob.len, rawData.len);

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob(&rawData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSignatureNapiTest, SIGNATURE_DSA_TEST, ::testing::ValuesIn(g_dsaData));

HWTEST_P(SIGNATURE_DSA_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_0600, TestSize.Level0)
{
    AsymSignSpec specInfo = GetParam();
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)specInfo.algoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

HWTEST_P(SIGNATURE_DSA_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_0700, TestSize.Level0)
{
    AsymSignSpec specInfo = GetParam();
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)specInfo.algoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    const char *digestAlgoName= (const char *)specInfo.digestAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int blockSize = 20;
    /* NoHash Not Support Update*/
    SKIP_NOHASH_TEST(digestAlgoName);

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    ret = OHTEST_DoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData, blockSize);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSignatureNapiTest, SIGNATURE_ECDSA_TEST, ::testing::ValuesIn(g_ecdsaData));

HWTEST_P(SIGNATURE_ECDSA_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_0800, TestSize.Level0)
{
    AsymSignSpec specInfo = GetParam();
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)specInfo.algoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

HWTEST_P(SIGNATURE_ECDSA_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_0900, TestSize.Level0)
{
    AsymSignSpec specInfo = GetParam();
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)specInfo.algoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int blockSize = 20;

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    ret = OHTEST_DoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData, blockSize);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSignatureNapiTest, SIGNATURE_SM2_ED25519_TEST, ::testing::ValuesIn(g_signOtherData));

HWTEST_P(SIGNATURE_SM2_ED25519_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_1000, TestSize.Level0)
{
    AsymSignSpec specInfo = GetParam();
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)specInfo.algoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

HWTEST_P(SIGNATURE_SM2_ED25519_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_1100, TestSize.Level0)
{
    AsymSignSpec specInfo = GetParam();
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)specInfo.algoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int blockSize = 20;

    SKIP_ED25519_TEST(asymAlgoName);

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    ret = OHTEST_DoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData, blockSize);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_1200
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_1200
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_1200, TestSize.Level0)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoSign *sign = nullptr;
    const char *algoName = (const char *)"RSA512|PSS|SHA256|MGF1_SHA256";
    const char *asymAlgoName= (const char *)"RSA512";
    int32_t msgLen = 16;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    Crypto_DataBlob MdData = {.data = nullptr, .len = 0};
    Crypto_DataBlob MgfData = {.data = nullptr, .len = 0};
    Crypto_DataBlob Mgf1Data = {.data = nullptr, .len = 0};
    Crypto_DataBlob SaltLenData = {.data = nullptr, .len = 0};
    Crypto_DataBlob TarilerData = {.data = nullptr, .len = 0};
    Crypto_DataBlob Sm2UserIdData = {.data = nullptr, .len = 0};
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
    Crypto_DataBlob mgf1MdBlob = {
        .data = reinterpret_cast<uint8_t *>(MFG1MdText),
        .len = sizeof(MFG1MdText)
    };
    int32_t saltText1 = 30;
    Crypto_DataBlob saltBlob1 = {
        .data = (uint8_t *)&saltText1,
        .len = sizeof(int32_t)
    };
    int32_t TarilerText = -1;
    Crypto_DataBlob tarilerBlob = {
        .data = (uint8_t *)&TarilerText,
        .len = sizeof(int32_t)
    };

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MD_NAME_STR, &mdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF_NAME_STR, &mfgBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF1_NAME_STR, &mgf1MdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_TRAILER_FIELD_INT, &tarilerBlob), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_SALT_LEN_INT, &SaltLenData), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_SALT_LEN_INT, &saltBlob1), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_MD_NAME_STR, &MdData), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_MGF_NAME_STR, &MgfData), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_MGF1_NAME_STR, &Mgf1Data), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_SALT_LEN_INT, &SaltLenData), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_TRAILER_FIELD_INT, &TarilerData), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_SM2_USER_ID_DATABLOB, &Sm2UserIdData), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoSign_Destroy(sign);
    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob(&MdData);
    OH_Crypto_FreeDataBlob(&MgfData);
    OH_Crypto_FreeDataBlob(&Mgf1Data);
    OH_Crypto_FreeDataBlob(&SaltLenData);
    OH_Crypto_FreeDataBlob(&TarilerData);
    OH_Crypto_FreeDataBlob(&Sm2UserIdData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_1300
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_1300
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_1300, TestSize.Level0)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    OH_CryptoSign *sign = nullptr;
    const char *algoName = (const char *)"RSA768|PSS|SHA256|MGF1_SHA256";
    const char *asymAlgoName= (const char *)"RSA512";
    int32_t msgLen = 16;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    uint8_t mdText[] = "SHA224";
    Crypto_DataBlob mdBlob = {
        .data = reinterpret_cast<uint8_t *>(mdText),
        .len = sizeof(mdText)
    };
    uint8_t MFG1MdText[] = "SHA384";
    Crypto_DataBlob mgf1MdBlob = {
        .data = reinterpret_cast<uint8_t *>(MFG1MdText),
        .len = sizeof(MFG1MdText)
    };

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MD_NAME_STR, &mdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF1_NAME_STR, &mgf1MdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    OH_CryptoSign_Destroy(sign);
    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_1400
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_1400
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_1400, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = (const char *)"RSA768|NoPadding|SHA256|OnlySign";
    const char *asymAlgoName= (const char *)"RSA768";

    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_OPERTION_ERROR);
    
    OH_CryptoSign_Destroy(sign);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_1500
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_1500
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_1500, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)"RSA768|PKCS1|SHA256";
    const char *asymAlgoName= (const char *)"RSA1024";
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = 16;

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    OH_CryptoSign_Destroy(sign);
    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_1600
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_1600
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_1600, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    const char *algoName = (const char *)"RSA768|PKCS1|SHA256";
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = 16;

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Update(sign, (Crypto_DataBlob *)&msgBlob), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoSign_Destroy(sign);
    HcfObjDestroy(randomObj);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_1700
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_1700
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_1700, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = (const char *)"RSA768|PKCS1|SHA256|OnlySign";
    const char *asymAlgoName= (const char *)"RSA768";
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    int32_t msgLen = 16;

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Update(sign, (Crypto_DataBlob *)&msgBlob), CRYPTO_OPERTION_ERROR);

    OH_CryptoSign_Destroy(sign);
    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_1800
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_1800
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_1800, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = (const char *)"Ed25519";
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    int32_t msgLen = 16;

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(algoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Update(sign, (Crypto_DataBlob *)&msgBlob), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoSign_Destroy(sign);
    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_1900
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_1900
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_1900, TestSize.Level0)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = (const char *)"RSA512|NoPadding|NoHash|OnlySign";
    const char *asymAlgoName= (const char *)"RSA512";
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = 65;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_OPERTION_ERROR);

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    OH_Crypto_FreeDataBlob(&signData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_2000
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_2000
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_2000, TestSize.Level0)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = (const char *)"RSA512|PKCS1|NoHash|OnlySign";
    const char *asymAlgoName= (const char *)"RSA512";
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = 64 - 11 + 1;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_OPERTION_ERROR);

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    OH_Crypto_FreeDataBlob(&signData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_2100
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_2100
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_2100, TestSize.Level0)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = (const char *)"RSA512|PKCS1|SHA256|OnlySign";
    const char *asymAlgoName= (const char *)"RSA512";
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = 32 + 1;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_OPERTION_ERROR);

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    OH_Crypto_FreeDataBlob(&signData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_2200
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_2200
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_2200, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    const char *algoName = (const char *)"SM9";

    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_PARAMETER_CHECK_FAILED);
    
    OH_CryptoSign_Destroy(sign);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_2300
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_2300
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_2300, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = (const char *)"RSA512|PSS|SHA256|MGF1_SHA256";
    const char *asymAlgoName= (const char *)"RSA512";
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = 16;
    int32_t saltText = 32;
    Crypto_DataBlob saltBlob = {
        .data = (uint8_t *)&saltText,
        .len = sizeof(int32_t)
    };
    int32_t trailerText = 1;
    Crypto_DataBlob trailerBlob = {
        .data = (uint8_t *)&trailerText,
        .len = sizeof(int32_t)
    };

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_SALT_LEN_INT, &saltBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_TRAILER_FIELD_INT, &trailerBlob), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_OPERTION_ERROR);

    OH_CryptoSign_Destroy(sign);
    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    OH_Crypto_FreeDataBlob(&signData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_2400
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_2400
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_2400, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    HcfRand *randomObj = nullptr;
    const char *algoName = (const char *)"RSA512|PKCS1|SHA512";
    const char *asymAlgoName= (const char *)"RSA512";
    int32_t msgLen = 16;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_OPERTION_ERROR);
    
    OH_CryptoSign_Destroy(sign);
    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    OH_Crypto_FreeDataBlob(&signData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_2500
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_2500
 * @tc.desc   Signature function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_2500, TestSize.Level0)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoSign *sign = nullptr;
    const char *algoName = (const char *)"RSA512|PKCS1|SHA256";
    const char *asymAlgoName= (const char *)"RSA512";
    int32_t msgLen = 16;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    Crypto_DataBlob MdData = {.data = nullptr, .len = 0};
    Crypto_DataBlob MgfData = {.data = nullptr, .len = 0};
    Crypto_DataBlob Mgf1Data = {.data = nullptr, .len = 0};
    Crypto_DataBlob SaltLenData = {.data = nullptr, .len = 0};
    Crypto_DataBlob TarilerData = {.data = nullptr, .len = 0};
    Crypto_DataBlob Sm2UserIdData = {.data = nullptr, .len = 0};
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
    Crypto_DataBlob mgf1MdBlob = {
        .data = reinterpret_cast<uint8_t *>(MFG1MdText),
        .len = sizeof(MFG1MdText)
    };
    int32_t saltText1 = 32;
    Crypto_DataBlob saltBlob1 = {
        .data = (uint8_t *)&saltText1,
        .len = sizeof(int32_t)
    };
    int32_t TarilerText = -1;
    Crypto_DataBlob tarilerBlob = {
        .data = (uint8_t *)&TarilerText,
        .len = sizeof(int32_t)
    };

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MD_NAME_STR, &mdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF_NAME_STR, &mfgBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF1_NAME_STR, &mgf1MdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_TRAILER_FIELD_INT, &tarilerBlob), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_SALT_LEN_INT, &SaltLenData), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_SALT_LEN_INT, &saltBlob1), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_MD_NAME_STR, &MdData), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_MGF_NAME_STR, &MgfData), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_MGF1_NAME_STR, &Mgf1Data), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_SALT_LEN_INT, &SaltLenData), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_TRAILER_FIELD_INT, &TarilerData), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_SM2_USER_ID_DATABLOB, &Sm2UserIdData), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoSign_Destroy(sign);
    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob(&MdData);
    OH_Crypto_FreeDataBlob(&MgfData);
    OH_Crypto_FreeDataBlob(&Mgf1Data);
    OH_Crypto_FreeDataBlob(&SaltLenData);
    OH_Crypto_FreeDataBlob(&TarilerData);
    OH_Crypto_FreeDataBlob(&Sm2UserIdData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

static bool OHTEST_Sm2SignatureAsn1ToRS(uint8_t *sm2_asn1, size_t len)
{
    bool res = false;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob r = {.data = nullptr, .len = 0};
    Crypto_DataBlob s = {.data = nullptr, .len = 0};
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    Crypto_DataBlob sm2Signature = {
        .data = sm2_asn1,
        .len = len
    };

    ret = OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoEccSignatureSpec_GetRAndS(spec, &r, &s);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    OH_CryptoEccSignatureSpec_Destroy(spec);
    spec = nullptr;
    ret = OH_CryptoEccSignatureSpec_Create(nullptr, &spec);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoEccSignatureSpec_SetRAndS(spec, &r, &s);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoEccSignatureSpec_Encode(spec, &out);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    res = memcmp(sm2_asn1, out.data, len) == 0 ? (len != out.len ? false : true) : false;

EXIT:
    OH_CryptoEccSignatureSpec_Destroy(spec);
    OH_Crypto_FreeDataBlob(&out);
    OH_Crypto_FreeDataBlob(&r);
    OH_Crypto_FreeDataBlob(&s);
    return res;
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_2600
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_2600
 * @tc.desc   Signature sm2 asn1 to r\s, len = 0x43 test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_2600, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x30, 0x43, 0x02, 0x20, 0x00, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27, 0x6C,
        0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA, 0x52,
        0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34, 0x9F,
        0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30, 0xBC,
        0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2_asn1);
    
    bool ret = OHTEST_Sm2SignatureAsn1ToRS(sm2_asn1, len);
    EXPECT_TRUE(ret);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_2700
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_2700
 * @tc.desc   Signature sm2 asn1 to r\s, len = 0x45 test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_2700, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x30, 0x45, 0x02, 0x20, 0x71, 0xA0, 0xF5, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0x02, 0x21, 0x00, 0xDF, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22,
        0x34, 0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7,
        0x30, 0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0x99
    };
    size_t len = sizeof(sm2_asn1);
    
    bool ret = OHTEST_Sm2SignatureAsn1ToRS(sm2_asn1, len);
    EXPECT_TRUE(ret);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_2800
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_2800
 * @tc.desc   Signature sm2 asn1 to r\s, len = 0x46 test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_2800, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x30, 0x46, 0x02, 0x21, 0x00, 0xE8, 0xF5, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x21, 0x00, 0xDF, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94,
        0x22, 0x34, 0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38,
        0xD7, 0x30, 0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2_asn1);
    
    bool ret = OHTEST_Sm2SignatureAsn1ToRS(sm2_asn1, len);
    EXPECT_TRUE(ret);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_2900
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_2900
 * @tc.desc   Signature sm2 asn1 to r\s, len = 0x44 test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_2900, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x30, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2_asn1);
    
    bool ret = OHTEST_Sm2SignatureAsn1ToRS(sm2_asn1, len);
    EXPECT_TRUE(ret);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_3000
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_3000
 * @tc.desc   Signature ecc224|sha1 to r\s, len = 0x3c test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_3000, TestSize.Level0)
{
    uint8_t ecc_asn1[] = {
        0x30, 0x3c, 0x02, 0x1c, 0x53, 0x99, 0xa4, 0xd7, 0xf5, 0x0f, 0x25, 0xe2, 0xe1, 0x88, 0xcb, 0xe2,
        0x81, 0xfe, 0x1e, 0xc5, 0x1a, 0xc2, 0xac, 0xee, 0xc6, 0xf6, 0x80, 0xbd, 0xf3, 0xb8, 0x20, 0xcf,
        0x02, 0x1c, 0x39, 0xf1, 0xe0, 0x93, 0xe1, 0xef, 0x10, 0x39, 0x07, 0xd0, 0xa8, 0x88, 0x7d, 0x36,
        0xa6, 0x29, 0x6b, 0x45, 0x19, 0xd4, 0x7b, 0x42, 0xa3, 0xf4, 0xa0, 0x39, 0xee, 0xa4
    };
    size_t len = sizeof(ecc_asn1);
    
    bool ret = OHTEST_Sm2SignatureAsn1ToRS(ecc_asn1, len);
    EXPECT_TRUE(ret);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_3100
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_3100
 * @tc.desc   Signature invalid asn1 function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_3100, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x30, 0xff, 0x23, 0x1c, 0x53, 0x99, 0xa4, 0xd7, 0xf5, 0x0f, 0x25, 0xe2, 0xe1, 0x88, 0xcb, 0xe2,
        0x81, 0xfe, 0x1e, 0xc5, 0x1a, 0xc2, 0xac, 0xee, 0xc6, 0xf6, 0x80, 0xbd, 0xf3, 0xb8, 0x20, 0xcf,
        0x12, 0x1c, 0x39, 0xf1, 0xe0, 0x93, 0xe1, 0xef, 0x10, 0x39, 0x07, 0xd0, 0xa8, 0x88, 0x7d, 0x36,
        0xa6, 0x29, 0x6b, 0x45, 0x19, 0xd4, 0x7b, 0x42, 0xa3, 0xf4, 0xa0, 0x39, 0xee, 0xa4
    };
    size_t len = sizeof(sm2_asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2_asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_3200
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_3200
 * @tc.desc   Signature invalid asn1 function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_3200, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x30, 0x44, 0x02, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x02, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    };
    uint8_t sm2_asn1_f[] = {
        0x30, 0x44, 0x02, 0x20, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x20, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    };
    size_t len = sizeof(sm2_asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature1 = {
        .data = sm2_asn1,
        .len = len
    };
    Crypto_DataBlob sm2Signature2 = {
        .data = sm2_asn1_f,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature1, &spec), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature2, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_3300
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_3300
 * @tc.desc   Signature invalid asn1 function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_3300, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x31, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2_asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2_asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_3400
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_3400
 * @tc.desc   Signature invalid asn1 function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_3400, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x30, 0x45, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2_asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2_asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_3500
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_3500
 * @tc.desc   Signature invalid asn1 function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_3500, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x30, 0x44, 0x12, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2_asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2_asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_3600
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_3600
 * @tc.desc   Signature invalid asn1 function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_3600, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x30, 0x43, 0x02, 0x20, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2_asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2_asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_3700
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_3700
 * @tc.desc   Signature invalid asn1 function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_3700, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x30, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x20, 0x00, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2_asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2_asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_3800
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_3800
 * @tc.desc   Signature invalid asn1 function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_3800, TestSize.Level0)
{
    uint8_t sm2_asn1[] = {
        0x30, 0xFF, 0xFF, 0xFF, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2_asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2_asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
}

HWTEST_P(SIGNATURE_ECDSA_TEST, SUB_Security_CryptoFramework_NAPI_Signature_Test_3900, TestSize.Level0)
{
    AsymSignSpec specInfo = GetParam();
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = (const char *)specInfo.algoName;
    const char *asymAlgoName= (const char *)specInfo.asymAlgoName;
    int32_t msgLen = specInfo.msgLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_SUCCESS);
    bool ret = OHTEST_Sm2SignatureAsn1ToRS(signData.data, signData.len);
    EXPECT_TRUE(ret);

    HcfObjDestroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Signature_Test_4000
 * @tc.number SUB_Security_CryptoFramework_NAPI_Signature_Test_4000
 * @tc.desc   Signature msg ge n function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSignatureNapiTest, SUB_Security_CryptoFramework_NAPI_Signature_Test_4000, TestSize.Level0)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = (const char *)"RSA512|NoPadding|NoHash|OnlySign";
    const char *asymAlgoName= (const char *)"RSA512";
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    // 待签名消息大于公钥n的值
    g_rsa_512_pubKey_n[0]++;
    Crypto_DataBlob msgBlob = {
        .data = g_rsa_512_pubKey_n,
        .len = sizeof(g_rsa_512_pubKey_n)
    };
    Crypto_DataBlob pubKeyBlob = { .data = g_rsa_512_pubKey, .len = sizeof(g_rsa_512_pubKey) };
    Crypto_DataBlob priKeyBlob = { .data = g_rsa_512_priKey, .len = sizeof(g_rsa_512_priKey) };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(asymAlgoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, &msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_OPERTION_ERROR);

    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
}

} // namespace Unittest::CryptoFrameworkSignatureNapiTest
