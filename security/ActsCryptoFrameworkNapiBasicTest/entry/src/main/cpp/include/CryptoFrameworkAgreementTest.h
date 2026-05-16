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
#ifndef OHCRYPTO_AGREEMENT_TEST_H
#define OHCRYPTO_AGREEMENT_TEST_H

#include <CryptoArchitectureKit/crypto_common.h>
#include <CryptoArchitectureKit/crypto_key_agreement.h>


typedef struct {
    const char *algoNameA;
    const char *algoNameB;
} AgreementSpec;

typedef struct {
    const char *algoName;
    const char *vectorSource;
    const char *localPrivKey;
    const char *localPubKey;
    const char *peerPrivKey;
    const char *peerPubKey;
    const char *sharedKey;
} VectorAgreementSpec;

typedef struct {
    const char *algoName;
    const char *nidName;
    const char *vectorSource;
    const char *bobD;
    const char *bobX;
    const char *bobY;
    const char *aliceD;
    const char *aliceX;
    const char *aliceY;
    const char *sharedKey;
} VectorEccAgreementSpec;

typedef struct {
    const char *algoName;
    const char *vectorSource;
    const char *p;
    const char *g;
    const char *bobSk;
    const char *bobPk;
    const char *aliceSk;
    const char *alicePk;
    const char *sharedKey;
} VectorDhAgreementSpec;

namespace Unittest::CryptoFramework {

int SubCryptoFrameworkNapiAgreementTest0100 ();
int SubCryptoFrameworkNapiAgreementTest0200 ();
int SubCryptoFrameworkNapiAgreementTest0300 ();
int SubCryptoFrameworkNapiAgreementTest0400 ();
int SubCryptoFrameworkNapiAgreementTest0500 ();
int SubCryptoFrameworkNapiAgreementVectorTest0100 ();
int SubCryptoFrameworkNapiAgreementVectorTest0200 ();
int SubCryptoFrameworkNapiAgreementVectorTest0300 ();

} // Unittest::CryptoFramework
#endif