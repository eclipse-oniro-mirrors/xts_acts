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
#include "CryptoFrameworkVerifyTest.h"

namespace Unittest::CryptoFramework {

VerifySpec g_verifyPkcs1Data[] = {
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|MD5")), 32},          // 0
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA1")), 32},        // 1
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA224")), 32},      // 2
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA256")), 32},      // 3

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|MD5")), 32},         // 4
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA1")), 32},        // 5
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA224")), 32},      // 6
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA256")), 32},      // 7
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA384")), 32},      // 8
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA512")), 32},      // 9

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|MD5")), 32},        // 10
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA1")), 32},       // 11
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA224")), 32},     // 12
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA256")), 32},     // 13
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA384")), 32},     // 14
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA512")), 32},     // 15

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|MD5")), 32},        // 16
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA1")), 32},       // 17
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA224")), 32},     // 18
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA256")), 32},     // 19
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA384")), 32},     // 20
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA512")), 32},     // 21

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|MD5")), 32},        // 22
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA1")), 32},       // 23
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA224")), 32},     // 24
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA256")), 32},     // 25
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA384")), 32},     // 26
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA512")), 32},     // 27

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|MD5")), 32},        // 28
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA1")), 32},       // 29
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA224")), 32},     // 30
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA256")), 32},     // 31
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA384")), 32},     // 32
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA512")), 32},     // 33

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|MD5")), 32},        // 34
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA1")), 32},       // 35
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA224")), 32},     // 36
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA256")), 32},     // 37
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA384")), 32},     // 38
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA512")), 32},     // 39

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|PKCS1|SHA512")), 32}          // 40
};

VerifySpec g_verifyPssData[] = {
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_MD5")), 32}, // 0
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_SHA1")), 32}, // 1
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_SHA224")), 32}, // 2
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_SHA256")), 32}, // 3
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_MD5")), 32}, // 4
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_SHA1")), 32}, // 5
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_SHA224")), 32}, // 6
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_SHA256")), 32}, // 7
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_MD5")), 32}, // 8
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_SHA1")), 32}, // 9
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_SHA224")), 32}, // 10
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_SHA256")), 32}, // 11
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA256|MGF1_MD5")), 32}, // 12
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA256|MGF1_SHA1")), 32}, // 13
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA256|MGF1_SHA224")), 32}, // 14
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA256|MGF1_SHA256")), 32}, // 15

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_MD5")), 32}, // 16
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA1")), 32}, // 17
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA224")), 32}, // 18
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA256")), 32}, // 19
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA384")), 32}, // 20
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA512")), 32}, // 21
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_MD5")), 32}, // 22
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA1")), 32}, // 23
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA224")), 32}, // 24
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA256")), 32}, // 25
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA384")), 32}, // 26
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA512")), 32}, // 27
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_MD5")), 32}, // 28
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA1")), 32}, // 29
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA224")), 32}, // 30
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA256")), 32}, // 31
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA384")), 32}, // 32
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA512")), 32}, // 33
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_MD5")), 32}, // 34
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA1")), 32}, // 35
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA224")), 32}, // 36
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA256")), 32}, // 37
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA384")), 32}, // 38
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_MD5")), 32}, // 39
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_SHA1")), 32}, // 40
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_SHA224")), 32}, // 41
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_SHA256")), 32}, // 42
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA512|MGF1_MD5")), 32}, // 43
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA512|MGF1_SHA1")), 32}, // 44
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA512|MGF1_SHA224")), 32}, // 45

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_MD5")), 32}, // 46
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA1")), 32}, // 47
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA224")), 32}, // 48
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA256")), 32}, // 49
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA384")), 32}, // 50
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA512")), 32}, // 51
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_MD5")), 32}, // 52
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA1")), 32}, // 53
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA224")), 32}, // 54
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA256")), 32}, // 55
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA384")), 32}, // 56
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA512")), 32}, // 57
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_MD5")), 32}, // 58
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA1")), 32}, // 59
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA224")), 32}, // 60
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA256")), 32}, // 61
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA384")), 32}, // 62
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA512")), 32}, // 63
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_MD5")), 32}, // 64
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA1")), 32}, // 65
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA224")), 32}, // 66
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA256")), 32}, // 67
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA384")), 32}, // 68
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA512")), 32}, // 69
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_MD5")), 32}, // 70
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA1")), 32}, // 71
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA224")), 32}, // 72
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA256")), 32}, // 73
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA384")), 32}, // 74
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA512")), 32}, // 75
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_MD5")), 32}, // 76
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA1")), 32}, // 77
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA224")), 32}, // 78
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA256")), 32}, // 79
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA384")), 32}, // 80

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_MD5")), 32}, // 81
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA1")), 32}, // 82
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA224")), 32}, // 83
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA256")), 32}, // 84
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA384")), 32}, // 85
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA512")), 32}, // 86
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_MD5")), 32}, // 87
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA1")), 32}, // 88
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA224")), 32}, // 89
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA256")), 32}, // 90
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA384")), 32}, // 91
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA512")), 32}, // 92
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_MD5")), 32}, // 93
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA1")), 32}, // 94
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA224")), 32}, // 95
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA256")), 32}, // 96
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA384")), 32}, // 97
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA512")), 32}, // 98
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_MD5")), 32}, // 99
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA1")), 32}, // 100
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA224")), 32}, // 101
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA256")), 32}, // 102
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA384")), 32}, // 103
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA512")), 32}, // 104
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_MD5")), 32}, // 105
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA1")), 32}, // 106
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA224")), 32}, // 107
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA256")), 32}, // 108
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA384")), 32}, // 109
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA512")), 32}, // 110
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_MD5")), 32}, // 111
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA1")), 32}, // 112
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA224")), 32}, // 113
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA256")), 32}, // 114
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA384")), 32}, // 115
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA512")), 32}, // 116

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_MD5")), 32}, // 117
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA1")), 32}, // 118
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA224")), 32}, // 119
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA256")), 32}, // 120
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA384")), 32}, // 121
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA512")), 32}, // 122
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_MD5")), 32}, // 123
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA1")), 32}, // 124
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA224")), 32}, // 125
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA256")), 32}, // 126
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA384")), 32}, // 127
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA512")), 32}, // 128
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_MD5")), 32}, // 129
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA1")), 32}, // 130
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA224")), 32}, // 131
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA256")), 32}, // 132
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA384")), 32}, // 133
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA512")), 32}, // 134
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_MD5")), 32}, // 135
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA1")), 32}, // 136
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA224")), 32}, // 137
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA256")), 32}, // 138
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA384")), 32}, // 139
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA512")), 32}, // 140
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_MD5")), 32}, // 141
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA1")), 32}, // 142
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA224")), 32}, // 143
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA256")), 32}, // 144
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA384")), 32}, // 145
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA512")), 32}, // 146
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_MD5")), 32}, // 147
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA1")), 32}, // 148
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA224")), 32}, // 149
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA256")), 32}, // 150
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA384")), 32}, // 151
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA512")), 32}, // 152

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_MD5")), 32}, // 153
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA1")), 32}, // 154
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA224")), 32}, // 155
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA256")), 32}, // 156
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA384")), 32}, // 157
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA512")), 32}, // 158
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_MD5")), 32}, // 159
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA1")), 32}, // 160
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA224")), 32}, // 161
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA256")), 32}, // 162
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA384")), 32}, // 163
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA512")), 32}, // 164
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_MD5")), 32}, // 165
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA1")), 32}, // 166
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA224")), 32}, // 167
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA256")), 32}, // 168
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA384")), 32}, // 169
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA512")), 32}, // 170
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_MD5")), 32}, // 171
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA1")), 32}, // 172
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA224")), 32}, // 173
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA256")), 32}, // 174
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA384")), 32}, // 175
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA512")), 32}, // 176
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_MD5")), 32}, // 177
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA1")), 32}, // 178
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA224")), 32}, // 179
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA256")), 32}, // 180
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA384")), 32}, // 181
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA512")), 32}, // 182
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_MD5")), 32}, // 183
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA1")), 32}, // 184
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA224")), 32}, // 185
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA256")), 32}, // 186
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA384")), 32}, // 187
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA512")), 32}, // 188

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_MD5")), 32}, // 189
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA1")), 32}, // 190
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA224")), 32}, // 191
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA256")), 32}, // 192
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA384")), 32}, // 193
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA512")), 32}, // 194
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_MD5")), 32}, // 195
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA1")), 32}, // 196
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA224")), 32}, // 197
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA256")), 32}, // 198
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA384")), 32}, // 199
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA512")), 32}, // 200
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_MD5")), 32}, // 201
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA1")), 32}, // 202
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA224")), 32}, // 203
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA256")), 32}, // 204
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA384")), 32}, // 205
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA512")), 32}, // 206
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_MD5")), 32}, // 207
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA1")), 32}, // 208
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA224")), 32}, // 209
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA256")), 32}, // 210
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA384")), 32}, // 211
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA512")), 32}, // 212
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_MD5")), 32}, // 213
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA1")), 32}, // 214
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA224")), 32}, // 215
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA256")), 32}, // 216
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA384")), 32}, // 217
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA512")), 32}, // 218
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_MD5")), 32}, // 219
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA1")), 32}, // 220
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA224")), 32}, // 221
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA256")), 32}, // 222
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA384")), 32}, // 223
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA512")), 32}, // 224

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|PSS|MD5|MGF1_MD5")), 32} // 225
};

VerifySpec g_verifyEccData[] = {
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA1")), 32},      // 0
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA224")), 32},    // 1
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA256")), 32},    // 2
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA384")), 32},    // 3
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA512")), 32},    // 4

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA1")), 32},      // 5
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA224")), 32},    // 6
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA256")), 32},    // 7
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA384")), 32},    // 8
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA512")), 32},    // 9

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA1")), 32},      // 10
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA224")), 32},    // 11
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA256")), 32},    // 12
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA384")), 32},    // 13
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA512")), 32},    // 14

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA1")), 32},      // 15
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA224")), 32},    // 16
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA256")), 32},    // 17
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA384")), 32},    // 18
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA512")), 32},    // 19

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA1")), 32},      // 20
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA224")), 32},    // 21
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA256")), 32},    // 22
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA384")), 32},    // 23
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA512")), 32},    // 24

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA1")), 32},      // 25
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA224")), 32},    // 26
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA256")), 32},    // 27
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA384")), 32},    // 28
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA512")), 32},    // 29

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA1")), 32},      // 30
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA224")), 32},    // 31
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA256")), 32},    // 32
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA384")), 32},    // 33
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA512")), 32},    // 34

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA1")), 32},      // 35
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA224")), 32},    // 36
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA256")), 32},    // 37
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA384")), 32},    // 38
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA512")), 32},    // 39

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA1")), 32},      // 40
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA224")), 32},    // 41
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA256")), 32},    // 42
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA384")), 32},    // 43
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA512")), 32},    // 44

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA1")), 32},      // 45
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA224")), 32},    // 46
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA256")), 32},    // 47
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA384")), 32},    // 48
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA512")), 32},    // 49

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA1")), 32},      // 50
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA224")), 32},    // 51
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA256")), 32},    // 52
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA384")), 32},    // 53
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA512")), 32},    // 54

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA1")), 32},      // 55
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA224")), 32},    // 56
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA256")), 32},    // 57
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA384")), 32},    // 58
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA512")), 32},    // 59

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA1")), 32},      // 60
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA224")), 32},    // 61
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA256")), 32},    // 62
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA384")), 32},    // 63
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA512")), 32},    // 64

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA1")), 32},      // 65
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA224")), 32},    // 66
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA256")), 32},    // 67
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA384")), 32},    // 68
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA512")), 32},    // 69

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA1")), 32},      // 70
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA224")), 32},    // 71
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA256")), 32},    // 72
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA384")), 32},    // 73
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA512")), 32},    // 74

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA1")), 32},      // 75
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA224")), 32},    // 76
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA256")), 32},    // 77
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA384")), 32},    // 78
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA512")), 32},    // 79

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA1")), 32},      // 80
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA224")), 32},    // 81
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA256")), 32},    // 82
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA384")), 32},    // 83
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA512")), 32},    // 84

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA1")), 32},      // 85
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA224")), 32},    // 86
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA256")), 32},    // 87
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA384")), 32},    // 88
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA512")), 32},    // 89

    {reinterpret_cast<uint8_t*>(const_cast<char*>("SM2_256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SM2_256|SM3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SM2_256|SM3")), 32},                  // 90
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SM2_256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SM2|SM3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SM2|SM3")), 32},                      // 91

    {reinterpret_cast<uint8_t*>(const_cast<char*>("Ed25519")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("Ed25519")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("Ed25519")), 32},                      // 92

    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC|SHA1")), 32}                      // 93
};

VerifySpec g_verifyDsaData[] = {
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|NoHash")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|NoHash")), 32},  // 0
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA1")), 32},    // 1
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA224")), 32},  // 2
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA256")), 32},  // 3
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA384")), 32},  // 4
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA512")), 32},  // 5

    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|NoHash")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|NoHash")), 32},  // 6
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA1")), 32},    // 7
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA224")), 32},  // 8
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA256")), 32},  // 9
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA384")), 32},  // 10
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA512")), 32},  // 11

    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|NoHash")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|NoHash")), 32},  // 12
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA1")), 32},    // 13
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA224")), 32},  // 14
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA256")), 32},  // 15
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA384")), 32},  // 16
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA512")), 32},  // 17

    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|NoHash")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|NoHash")), 32},      // 18
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|SHA1")), 32},        // 19
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|SHA224")), 32},      // 20
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|SHA256")), 32},      // 21
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|SHA384")), 32},      // 22
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|SHA512")), 32}       // 23
};

VerifySpec g_verifyRsaOnlySignData[] = {
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|NoHash|Recover")), 32},          // 0
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|NoPadding|NoHash|Recover")), 64},      // 1
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|MD5|Recover")), 16},             // 2
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA1|Recover")), 20},            // 3
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA224|Recover")), 28},          // 4
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA256|Recover")), 32},          // 5

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|NoHash|Recover")), 32},          // 6
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|NoPadding|NoHash|Recover")), 96},      // 7
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|MD5|Recover")), 16},             // 8
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA1|Recover")), 20},            // 9
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA224|Recover")), 28},          // 10
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA256|Recover")), 32},          // 11
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA384|Recover")), 48},          // 12
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA512|Recover")), 64},          // 13

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|NoHash|Recover")), 32},         // 14
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|NoPadding|NoHash|Recover")), 128},    // 15
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|MD5|Recover")), 16},            // 16
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA1|Recover")), 20},           // 17
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA224|Recover")), 28},         // 18
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA256|Recover")), 32},         // 19
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA384|Recover")), 48},         // 20
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA512|Recover")), 64},         // 21

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|NoHash|Recover")), 32},         // 22
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|NoPadding|NoHash|Recover")), 256},    // 23
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|MD5|Recover")), 16},            // 24
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA1|Recover")), 20},           // 25
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA224|Recover")), 28},         // 26
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA256|Recover")), 32},         // 27
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA384|Recover")), 48},         // 28
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA512|Recover")), 64},         // 29

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|NoHash|Recover")), 32},         // 30
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|NoPadding|NoHash|Recover")), 384},    // 31
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|MD5|Recover")), 16},            // 32
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA1|Recover")), 20},           // 33
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA224|Recover")), 28},         // 34
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA256|Recover")), 32},         // 35
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA384|Recover")), 48},         // 36
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA512|Recover")), 64},         // 37

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|NoHash|Recover")), 32},         // 38
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|NoPadding|NoHash|Recover")), 512},    // 39
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|MD5|Recover")), 16},            // 40
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA1|Recover")), 20},           // 41
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA224|Recover")), 28},         // 42
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA256|Recover")), 32},         // 43
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA384|Recover")), 48},         // 44
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA512|Recover")), 64},         // 45

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|NoHash|Recover")), 32},         // 46
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|NoPadding|NoHash|Recover")), 1024},   // 47
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|MD5|Recover")), 16},            // 48
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA1|Recover")), 20},           // 49
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA224|Recover")), 28},         // 50
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA256|Recover")), 32},         // 51
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA384|Recover")), 48},         // 52
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA512|Recover")), 64},         // 53

    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|PKCS1|SHA1|Recover")), 20}                // 54
};

}