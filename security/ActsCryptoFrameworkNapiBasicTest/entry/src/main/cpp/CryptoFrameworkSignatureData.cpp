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

#include "include/CryptoFrameworkSignatureTest.h"

namespace Unittest::CryptoFramework {

SignSpec g_signPkcs1Data[] = {
    /* RSA512 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},        // 0
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},       // 1
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},     // 2
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},     // 3
    /* RSA768 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 4
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},       // 5
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},     // 6
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},     // 7
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},     // 8
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},     // 9
    /* RSA1024 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},      // 10
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},     // 11
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},   // 12
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},   // 13
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},   // 14
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},   // 15
    /* RSA2048 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},      // 16
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},     // 17
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},   // 18
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},   // 19
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},   // 20
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},   // 21
    /* RSA3072 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},      // 22
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},     // 23
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},   // 24
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},   // 25
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},   // 26
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},   // 27
    /* RSA4096 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},      // 28
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},     // 29
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},   // 30
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},   // 31
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},   // 32
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},   // 33
    /* RSA8192 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},      // 34
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},     // 35
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},   // 36
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},   // 37
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},   // 38
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},   // 39
    /* RSA */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|PKCS1|MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},           // 40
};

SignSpec g_signPssData[] = {
    /*RSA PSS MD5 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},              // 0
    /*RSA512 PSS MD5 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},           // 1
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},          // 2
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},        // 3
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},        // 4
    /*RSA512 PSS SHA1 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},           // 5
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},          // 6
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},        // 7
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},        // 8
    /*RSA512 PSS SHA224 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},           // 9
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},          // 10
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},        // 11
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},        // 12
    /*RSA512 PSS SHA256 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},           // 13
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},          // 14
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")), 62},        // 15
    /*RSA768 PSS MD5 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},           // 16
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},          // 17
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 18
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 19
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 20
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 21
    /*RSA768 PSS SHA1 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},           // 22
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},          // 23
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 24
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 25
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 26
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 27
    /*RSA768 PSS SHA224 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},           // 28
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},          // 29
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 30
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 31
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 32
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 33
    /*RSA768 PSS SHA256 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},           // 34
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},          // 35
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 36
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 37
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 38
    /*RSA768 PSS SHA384 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},           // 39
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},          // 40
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 41
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 42
    /*RSA768 PSS SHA512 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},           // 43
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},          // 44
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")), 62},        // 45
    /*RSA1024 PSS MD5 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},           // 46
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},          // 47
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 48
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 49
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 50
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 51
    /*RSA1024 PSS SHA1 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},           // 52
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},          // 53
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 54
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 55
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 56
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 57
    /*RSA1024 PSS SHA224 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},           // 58
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},          // 59
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 60
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 61
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 62
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 63
    /*RSA1024 PSS SHA256 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},           // 64
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},          // 65
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 66
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 67
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 68
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA256|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 69
    /*RSA1024 PSS SHA384 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},           // 70
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},          // 71
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 72
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 73
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 74
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA384|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 75
    /*RSA1024 PSS SHA512 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},           // 76
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},          // 77
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 78
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 79
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PSS|SHA512|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")), 62},        // 80
    /*RSA2048 PSS MD5 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},           // 81
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},          // 82
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 83
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 84
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 85
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 86
    /*RSA2048 PSS SHA1 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},           // 87
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},          // 88
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 89
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 90
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 91
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 92
    /*RSA2048 PSS SHA224 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},           // 93
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},          // 94
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 95
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 96
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 97
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 98
    /*RSA2048 PSS SHA256 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},           // 99
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},          // 100
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 101
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 102
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 103
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA256|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 104
    /*RSA2048 PSS SHA384 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},           // 105
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},          // 106
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 107
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 108
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 109
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA384|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 110
    /*RSA2048 PSS SHA512 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},           // 111
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},          // 112
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 113
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 114
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 115
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PSS|SHA512|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")), 62},        // 116
    /*RSA3072 PSS MD5 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},           // 117
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},          // 118
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 119
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 120
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 121
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 122
    /*RSA3072 PSS SHA1 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},           // 123
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},          // 124
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 125
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 126
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 127
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 128
    /*RSA3072 PSS SHA224 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},           // 129
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},          // 130
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 131
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 132
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 133
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 134
    /*RSA3072 PSS SHA256 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},           // 135
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},          // 136
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 137
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 138
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 139
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA256|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 140
    /*RSA3072 PSS SHA384 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},           // 141
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},          // 142
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 143
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 144
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 145
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA384|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 146
    /*RSA3072 PSS SHA512 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},           // 147
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},          // 148
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 149
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 150
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 151
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PSS|SHA512|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")), 62},        // 152
    /*RSA4096 PSS MD5 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},           // 153
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},          // 154
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 156
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 157
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 158
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 159
    /*RSA4096 PSS SHA1 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},           // 160
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},          // 161
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 162
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 163
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 164
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 165
    /*RSA4096 PSS SHA224 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},           // 167
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},          // 168
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 169
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 170
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 171
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 172
    /*RSA4096 PSS SHA256 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},           // 173
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},          // 174
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 175
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 176
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 177
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA256|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 178
    /*RSA4096 PSS SHA384 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},           // 179
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},          // 180
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 181
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 182
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 183
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA384|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 184
    /*RSA4096 PSS SHA512 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},           // 185
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},          // 186
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 187
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 188
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 189
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PSS|SHA512|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")), 62},        // 190
    /*RSA8192 PSS MD5 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},           // 191
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},          // 192
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 193
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 194
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 195
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|MD5|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 196
    /*RSA8192 PSS SHA1 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},           // 197
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},          // 198
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 199
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 200
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 201
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA1|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 202
    /*RSA8192 PSS SHA224 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},           // 203
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},          // 204
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 205
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 206
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 207
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA224|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 208
    /*RSA8192 PSS SHA256 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},           // 209
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},          // 210
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 211
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 212
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 213
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA256|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 214
    /*RSA8192 PSS SHA384 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},           // 215
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},          // 216
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 217
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 218
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 219
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA384|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 220
    /*RSA8192 PSS SHA512 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_MD5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},           // 221
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},          // 222
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 223
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 224
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 225
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PSS|SHA512|MGF1_SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")), 62},        // 226
};

OnlySignSpec g_onlySignData[] = {
    /* RSA512 PKCS1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|MD5|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("MD5")), 16
    }, // 0
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA1|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 20
    }, // 1
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA224|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 28
    }, // 2
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|SHA256|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 32
    }, // 3

    /* RSA768 PKCS1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|MD5|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("MD5")), 16
    }, // 4
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA1|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 20
    }, // 5
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA224|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 28
    }, // 6
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA256|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 32
    }, // 7
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA384|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 48
    }, // 8
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|SHA512|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 64
    }, // 9

    /* RSA1024 PKCS1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|MD5|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("MD5")), 16
    }, // 10
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA1|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 20
    }, // 11
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA224|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 28
    }, // 12
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA256|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 32
    }, // 13
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA384|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 48
    }, // 14
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|SHA512|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 64
    }, // 15

    /* RSA2048 PKCS1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|MD5|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("MD5")), 16
    }, // 16
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA1|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 20
    }, // 17
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA224|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 28
    }, // 18
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA256|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 32
    }, // 19
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA384|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 48
    }, // 20
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|SHA512|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 64
    }, // 21

    /* RSA3072 PKCS1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|MD5|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("MD5")), 16
    }, // 22
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA1|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 20
    }, // 23
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA224|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 28
    }, // 24
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA256|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 32
    }, // 25
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA384|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 48
    }, // 26
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|SHA512|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 64
    }, // 27

    /* RSA4096 PKCS1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|MD5|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("MD5")), 16
    }, // 28
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA1|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 20
    }, // 29
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA224|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 28
    }, // 30
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA256|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 32
    }, // 31
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA384|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 48
    }, // 32
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|SHA512|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 64
    }, // 33

    /* RSA8192 PKCS1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|MD5|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("MD5")), 16
    }, // 34
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA1|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA1|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 20
    }, // 35
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA224|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA224|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 28
    }, // 36
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA256|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA256|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 32
    }, // 37
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA384|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA384|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 48
    }, // 38
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA512|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|SHA512|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 64
    }, // 39

    /* RSA PKCS1 NoHash */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PKCS1|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 64 - 11
    }, // 40
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PKCS1|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 96 - 11
    }, // 41
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PKCS1|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 128 - 11
    }, // 42
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PKCS1|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 256 - 11
    }, // 43
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PKCS1|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 384 - 11
    }, // 44
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PKCS1|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 512 - 11
    }, // 45
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PKCS1|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 1024 - 11
    }, // 46

    /* RSA NoPadding NoHash */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|NoPadding|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 64
    }, // 47
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|NoPadding|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 96
    }, // 48
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|NoPadding|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 128
    }, // 49
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|NoPadding|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 256
    }, // 50
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|NoPadding|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 384
    }, // 51
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|NoPadding|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 512
    }, // 52
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|NoPadding|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 1024
    }, // 53

    /* RSA */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|PKCS1|MD5|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|PKCS1|MD5|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("MD5")), 16
    }, // 54
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|NoPadding|NoHash|OnlySign")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA|NoPadding|NoHash|Recover")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 64
    } // 55
};

AsymSignSpec g_dsaData[] = {
    /* DSA1024 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    }, // 0
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    }, // 1
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    }, // 2
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    }, // 3
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    }, // 4
    /* DSA2048 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    }, // 5
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    }, // 6
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    }, // 7
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    }, // 8
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    }, // 9
    /* DSA3072 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    }, // 10
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    }, // 11
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    }, // 12
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    }, // 13
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    }, // 14
    /* DSA */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    }, // 15
    /* DSA NoHash */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024|NoHash")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 62
    }, // 16
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048|NoHash")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 62
    }, // 17
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072|NoHash")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 62
    }, // 18
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA|NoHash")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("NoHash")), 62
    } // 19
};

AsymSignSpec g_ecdsaData[] = {
    /* ECC224 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 0
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 1
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 2
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 3
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 4
    /* ECC256 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 5
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 6
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 7
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 8
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 9
    /* ECC384 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 10
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 11
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 12
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 13
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 14
    /* ECC521 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 15
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 16
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 17
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 18
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 19
    /* ECC_BrainPoolP160r1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 20
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 21
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 22
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 23
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 24
    /* ECC_BrainPoolP160t1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 25
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 26
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 27
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 28
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 29
    /* ECC_BrainPoolP192r1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 30
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 31
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 32
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 33
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 34
    /* ECC_BrainPoolP192t1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 35
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 36
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 37
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 38
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 39
    /* ECC_BrainPoolP224r1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 40
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 41
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 42
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 43
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 44
    /* ECC_BrainPoolP224t1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 45
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 46
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 47
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 48
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 49
    /* ECC_BrainPoolP256r1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 50
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 51
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 52
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 53
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 54
    /* ECC_BrainPoolP256t1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 55
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 56
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 57
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 58
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 59
    /* ECC_BrainPoolP320r1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 60
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 61
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 62
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 63
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 64
    /* ECC_BrainPoolP320t1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 65
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 66
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 67
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 68
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 69
    /* ECC_BrainPoolP384r1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 70
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 71
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 72
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 73
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 74
    /* ECC_BrainPoolP384t1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 75
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 76
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 77
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 78
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 79
    /* ECC_BrainPoolP512r1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 80
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 81
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 82
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 83
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 84
    /* ECC_BrainPoolP512t1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 85
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 86
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 87
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 88
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 89
    /* ECC_Secp256k1 */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 90
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1|SHA224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), 62
    },  // 91
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1|SHA256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), 62
    },  // 92
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1|SHA384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), 62
    },  // 93
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1|SHA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), 62
    },  // 94
    /* ECC */
    {
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC|SHA1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), 62
    },      // 95
};

}