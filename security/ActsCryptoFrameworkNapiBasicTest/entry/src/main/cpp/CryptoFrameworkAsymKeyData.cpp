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
#include "include/CryptoFrameworkAsymKeyTest.h"

namespace Unittest::CryptoFramework {
AsymKeySpec g_asymKeyData[] = {
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")), "DSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")), "DSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")), "DSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("Ed25519")), "Ed25519"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("X25519")), "X25519"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp1536")), "DH"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp2048")), "DH"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp3072")), "DH"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp4096")), "DH"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp6144")), "DH"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp8192")), "DH"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe2048")), "DH"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe3072")), "DH"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe4096")), "DH"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe6144")), "DH"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe8192")), "DH"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")), "RSA"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SM2_256")), "SM2"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")), "ECC"},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")), "ECC"},
};

AsymPrivKeySpec g_asymPrivKeyData[] = {
    /* RSA privKey format not support der type，RSA privKey support der type */
    /* RSA512*/
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 0
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 1
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 2
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM}, // 3
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 4
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 5
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 6
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 7
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 8
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 9
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 10
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 11
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 12
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 13
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 14
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 15
    /* RSA768 */
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")), CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")), CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")), CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")), CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")), CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")), CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")), CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")), CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")), CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")), CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")), CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")), CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")), CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA768|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    /* RSA1024 */
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA1024|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    /* RSA2048 */
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA2048|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    /* RSA3072 */
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA3072|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    /* RSA4096 */
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA4096|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    /* RSA8192 */
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_2")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_3")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_4")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 16
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 17
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 18
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 19
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 20
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 21
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 22
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM}, // 23
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 24
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 25
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 26
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_PEM},  // 27
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 28
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 29
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 30
    {"PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA8192|PRIMES_5")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS1")),
        CRYPTO_PEM},  // 31
    /* ECC privKey not support pem、pkcs1 type */
    /* ECC224 */
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC224")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC256 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC256")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC384 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC384")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC521 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC521")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP160r1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160r1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP160t1 */
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP160t1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP192r1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192r1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP192t1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP192t1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP224r1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224r1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP224t1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP224t1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP256r1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256r1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP256t1 */
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|UNCOMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP256t1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP320r1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320r1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP320t1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP320t1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP384r1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384r1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP384t1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP384t1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP512r1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512r1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_BrainPoolP512t1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_BrainPoolP512t1")),
        nullptr, 0, nullptr, 0,
        reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    /* ECC_Secp256k1 */
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-192-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 17
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-256-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER},  // 18
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("DES-EDE3-CBC")),
        12, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")),
        CRYPTO_DER}, // 19
    {"X509|COMPRESSED", reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("ECC_Secp256k1")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    /* DSA not format not support pem、der */
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA1024")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA2048")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DSA3072")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    /* SM2 not format not support pem、der */
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("SM2_256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SM2_256")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    /* Ed25519 not format not support pem、der */
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("Ed25519")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("Ed25519")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    /* X25519 not format not support pem、der */
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("X25519")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("X25519")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    /* DH not format not support pem、der */
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp1536")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp1536")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp2048")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp3072")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp4096")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp6144")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp6144")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DH_modp8192")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe2048")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe2048")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe3072")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe3072")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe4096")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe4096")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe6144")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe6144")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe8192")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("DH_ffdhe8192")),
        nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
};

} // namespace Unittest