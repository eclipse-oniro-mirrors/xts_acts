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

#include "CryptoArchitectureTest.h"
#include <vector>

void InitPush1(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"OHCryptoRandCreate0100", nullptr, OHCryptoRandCreate0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoRandCreate0200", nullptr, OHCryptoRandCreate0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoRandGenerateRandom0100", nullptr, OHCryptoRandGenerateRandom0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoRandGenerateRandom0200", nullptr, OHCryptoRandGenerateRandom0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoRandSetSeed0100", nullptr, OHCryptoRandSetSeed0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoRandSetSeed0200", nullptr, OHCryptoRandSetSeed0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoRandEnableHardwareEntropy0100", nullptr, OHCryptoRandEnableHardwareEntropy0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoRandEnableHardwareEntropy0200", nullptr, OHCryptoRandEnableHardwareEntropy0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifyCreate0100", nullptr, OHCryptoVerifyCreate0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifyCreate0200", nullptr, OHCryptoVerifyCreate0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifyInit0100", nullptr, OHCryptoVerifyInit0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifyInit0200", nullptr, OHCryptoVerifyInit0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifyUpdate0100", nullptr, OHCryptoVerifyUpdate0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifyUpdate0200", nullptr, OHCryptoVerifyUpdate0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifyRecover0100", nullptr, OHCryptoVerifyRecover0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifyRecover0200", nullptr, OHCryptoVerifyRecover0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifySetParam0100", nullptr, OHCryptoVerifySetParam0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifySetParam0200", nullptr, OHCryptoVerifySetParam0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifyGetParam0100", nullptr, OHCryptoVerifyGetParam0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifyGetParam0200", nullptr, OHCryptoVerifyGetParam0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignCreate0100", nullptr, OHCryptoSignCreate0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignCreate0200", nullptr, OHCryptoSignCreate0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
}
void InitPush2(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"OHCryptoSignInit0100", nullptr, OHCryptoSignInit0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignInit0200", nullptr, OHCryptoSignInit0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignUpdate0100", nullptr, OHCryptoSignUpdate0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignUpdate0200", nullptr, OHCryptoSignUpdate0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignFinal0100", nullptr, OHCryptoSignFinal0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignFinal0200", nullptr, OHCryptoSignFinal0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignSetParam0100", nullptr, OHCryptoSignSetParam0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignSetParam0200", nullptr, OHCryptoSignSetParam0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignGetParam0100", nullptr, OHCryptoSignGetParam0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignGetParam0200", nullptr, OHCryptoSignGetParam0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEccSignatureSpecCreate0100", nullptr, OHCryptoEccSignatureSpecCreate0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEccSignatureSpecCreate0200", nullptr, OHCryptoEccSignatureSpecCreate0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEccSignatureSpecGetRAndS0100", nullptr, OHCryptoEccSignatureSpecGetRAndS0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEccSignatureSpecGetRAndS0200", nullptr, OHCryptoEccSignatureSpecGetRAndS0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEccSignatureSpecSetRAndS0100", nullptr, OHCryptoEccSignatureSpecSetRAndS0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEccSignatureSpecSetRAndS0200", nullptr, OHCryptoEccSignatureSpecSetRAndS0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEccSignatureSpecEncode0100", nullptr, OHCryptoEccSignatureSpecEncode0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEccSignatureSpecEncode0200", nullptr, OHCryptoEccSignatureSpecEncode0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherParamsCreate0100", nullptr, OHCryptoSymCipherParamsCreate0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherParamsCreate0200", nullptr, OHCryptoSymCipherParamsCreate0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherParamsSetParam0100", nullptr, OHCryptoSymCipherParamsSetParam0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherParamsSetParam0200", nullptr, OHCryptoSymCipherParamsSetParam0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
}

void InitPush3(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"OHCryptoSymCipherCreate0100", nullptr, OHCryptoSymCipherCreate0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherCreate0200", nullptr, OHCryptoSymCipherCreate0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherInit0100", nullptr, OHCryptoSymCipherInit0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherInit0200", nullptr, OHCryptoSymCipherInit0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherUpdate0100", nullptr, OHCryptoSymCipherUpdate0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherUpdate0200", nullptr, OHCryptoSymCipherUpdate0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherFinale0100", nullptr, OHCryptoSymCipherFinale0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherFinale0200", nullptr, OHCryptoSymCipherFinale0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymKeyGeneratorCreate0100", nullptr, OHCryptoSymKeyGeneratorCreate0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymKeyGeneratorCreate0200", nullptr, OHCryptoSymKeyGeneratorCreate0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymKeyGeneratorGenerate0100", nullptr, OHCryptoSymKeyGeneratorGenerate0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymKeyGeneratorGenerate0200", nullptr, OHCryptoSymKeyGeneratorGenerate0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymKeyGeneratorConvert0100", nullptr, OHCryptoSymKeyGeneratorConvert0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymKeyGeneratorConvert0200", nullptr, OHCryptoSymKeyGeneratorConvert0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymKeyGetKeyData0100", nullptr, OHCryptoSymKeyGetKeyData0100,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymKeyGetKeyData0200", nullptr, OHCryptoSymKeyGetKeyData0200,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEccSignatureSpecCreateOpertionError", nullptr, OHCryptoEccSignatureSpecCreateOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymCipherCreateNotSupport", nullptr, OHCryptoSymCipherCreateNotSupport,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSymKeyGeneratorCreateNotSupport", nullptr, OHCryptoSymKeyGeneratorCreateNotSupport,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
}

void AddDescToVectorFour(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"OHCryptoMacCreateSuccess", nullptr, OHCryptoMacCreateSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacCreateInvalidParams", nullptr, OHCryptoMacCreateParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacSetParamSuccess", nullptr, OHCryptoMacSetParamSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacSetParamInvalidParams", nullptr, OHCryptoMacSetParamParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacInitSuccess", nullptr, OHCryptoMacInitSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacInitInvalidParams", nullptr, OHCryptoMacInitParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacUpdateSuccess", nullptr, OHCryptoMacUpdateSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacUpdateInvalidParams", nullptr, OHCryptoMacUpdateParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacUpdateOpertionError", nullptr, OHCryptoMacUpdateOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacFinalSuccess", nullptr, OHCryptoMacFinalSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacFinalInvalidParams", nullptr, OHCryptoMacFinalParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacFinalOpertionError", nullptr, OHCryptoMacFinalOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacGetLengthSuccess", nullptr, OHCryptoMacGetLengthSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoMacGetLengthInvalidParams", nullptr, OHCryptoMacGetLengthParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifySetParamNotSupport", nullptr, OHCryptoVerifySetParamNotSupport,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignInitOpertionError", nullptr, OHCryptoSignInitOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignUpdateOpertionError", nullptr, OHCryptoSignUpdateOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoVerifyRecoverOpertionError", nullptr, OHCryptoVerifyRecoverOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignFinalOpertionError", nullptr, OHCryptoSignFinalOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignSetParamNotSupport", nullptr, OHCryptoSignSetParamNotSupport,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSignGetParamOpertionError", nullptr, OHCryptoSignGetParamOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
}

void AddDescToVectorThree(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"OHCryptoEcPointEncodeOpertionError", nullptr, OHCryptoEcPointEncodeOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoDigestCreateSuccess", nullptr, OHCryptoDigestCreateSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoDigestCreateInvalidParams", nullptr, OHCryptoDigestCreateParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoDigestUpdateSuccess", nullptr, OHCryptoDigestUpdateSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoDigestUpdateInvalidParams", nullptr, OHCryptoDigestUpdateParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoDigestFinalSuccess", nullptr, OHCryptoDigestFinalSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoDigestFinalInvalidParams", nullptr, OHCryptoDigestFinalParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKdfParamsCreateSuccess", nullptr, OHCryptoKdfParamsCreateSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKdfParamsCreateInvalidParams", nullptr, OHCryptoKdfParamsCreateParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKdfParamsSetParamSuccess", nullptr, OHCryptoKdfParamsSetParamSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKdfParamsSetParamInvalidParams", nullptr, OHCryptoKdfParamsSetParamParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKdfCreateSuccess", nullptr, OHCryptoKdfCreateSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKdfCreateInvalidParams", nullptr, OHCryptoKdfCreateParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKdfDeriveSuccess", nullptr, OHCryptoKdfDeriveSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKdfDeriveInvalidParams", nullptr, OHCryptoKdfDeriveParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKdfDeriveOpertionError", nullptr, OHCryptoKdfDeriveOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKeyAgreementCreateSuccess", nullptr, OHCryptoKeyAgreementCreateSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKeyAgreementCreateInvalidParams", nullptr, OHCryptoKeyAgreementCreateParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKeyAgreementCreateNotSupport", nullptr, OHCryptoKeyAgreementCreateNotSupport,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKeyAgreementGenerateSecretSuccess", nullptr, OHCryptoKeyAgreementGenerateSecretSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoKeyAgreementGenerateSecretInvalidParams", nullptr,
                   OHCryptoKeyAgreementGenerateSecretParameterCheckFailed, nullptr, nullptr, nullptr, napi_default,
                   nullptr});
    desc.push_back({"OHCryptoKeyAgreementGenerateSecretOpertionError", nullptr,
                   OHCryptoKeyAgreementGenerateSecretOpertionError, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void AddDescToVectorTwo(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"OHCryptoAsymKeySpecGenDhCommonParamsSpecInvalidParams", nullptr,
                   OHCryptoAsymKeySpecGenDhCommonParamsSpecParameterCheckFailed, nullptr, nullptr, nullptr,
                   napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeySpecCreateSuccess", nullptr, OHCryptoAsymKeySpecCreateSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeySpecCreateInvalidParams", nullptr, OHCryptoAsymKeySpecCreateParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeySpecSetParamSuccess", nullptr, OHCryptoAsymKeySpecSetParamSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeySpecSetParamInvalidParams", nullptr,
                   OHCryptoAsymKeySpecSetParamParameterCheckFailed, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeySpecSetCommonParamsSpecSuccess", nullptr,
                   OHCryptoAsymKeySpecSetCommonParamsSpecSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeySpecSetCommonParamsSpecInvalidParams", nullptr,
                   OHCryptoAsymKeySpecSetCommonParamsSpecParameterCheckFailed, nullptr, nullptr, nullptr, napi_default,
                   nullptr});
    desc.push_back({"OHCryptoAsymKeySpecGetParamSuccess", nullptr, OHCryptoAsymKeySpecGetParamSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeySpecGetParamInvalidParams", nullptr,
                   OHCryptoAsymKeySpecGetParamParameterCheckFailed, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeyGeneratorWithSpecCreateSuccess", nullptr,
                   OHCryptoAsymKeyGeneratorWithSpecCreateSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeyGeneratorWithSpecCreateInvalidParams", nullptr,
                   OHCryptoAsymKeyGeneratorWithSpecCreateParameterCheckFailed, nullptr, nullptr, nullptr, napi_default,
                   nullptr});
    desc.push_back({"OHCryptoAsymKeyGeneratorWithSpecGenKeyPairSuccess", nullptr,
                   OHCryptoAsymKeyGeneratorWithSpecGenKeyPairSuccess, nullptr, nullptr, nullptr, napi_default,
                   nullptr});
    desc.push_back({"OHCryptoAsymKeyGeneratorWithSpecGenKeyPairInvalidParams", nullptr,
                   OHCryptoAsymKeyGeneratorWithSpecGenKeyPairParameterCheckFailed, nullptr, nullptr, nullptr,
                   napi_default, nullptr});
    desc.push_back({"OHCryptoEcPointCreateSuccess", nullptr, OHCryptoEcPointCreateSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEcPointCreateInvalidParams", nullptr, OHCryptoEcPointCreateParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEcPointGetCoordinateSuccess", nullptr, OHCryptoEcPointGetCoordinateSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEcPointGetCoordinateInvalidParams", nullptr,
                   OHCryptoEcPointGetCoordinateParameterCheckFailed, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEcPointSetCoordinateSuccess", nullptr, OHCryptoEcPointSetCoordinateSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEcPointSetCoordinateInvalidParams", nullptr,
                   OHCryptoEcPointSetCoordinateParameterCheckFailed, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEcPointEncodeSuccess", nullptr, OHCryptoEcPointEncodeSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoEcPointEncodeInvalidParams", nullptr, OHCryptoEcPointEncodeParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
}

void AddDescToVectorOne(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"OHCryptoAsymKeyGeneratorCreateInvalidParams", nullptr,
                   OHCryptoAsymKeyGeneratorCreateInvalidParams, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeyGeneratorGenerateInvalidParams", nullptr,
                   OHCryptoAsymKeyGeneratorGenerateInvalidParams, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeyGeneratorConvertInvalidParams", nullptr,
                   OHCryptoAsymKeyGeneratorConvertInvalidParams, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoPubKeyEncodeInvalidParams", nullptr,
                   OHCryptoPubKeyEncodeInvalidParams, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoPubKeyGetParamInvalidParams", nullptr,
                   OHCryptoPubKeyGetParamInvalidParams, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeyGeneratorSetPasswordSuccess", nullptr,
                   OHCryptoAsymKeyGeneratorSetPasswordSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeyGeneratorSetPasswordInvalidParams", nullptr,
                   OHCryptoAsymKeyGeneratorSetPasswordParameterCheckFailed, nullptr, nullptr, nullptr, napi_default,
                   nullptr});
    desc.push_back({"OHCryptoPrivKeyEncodingParamsCreateSuccess", nullptr,
                   OHCryptoPrivKeyEncodingParamsCreateSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoPrivKeyEncodingParamsCreateInvalidParams", nullptr,
                   OHCryptoPrivKeyEncodingParamsCreateParameterCheckFailed, nullptr, nullptr, nullptr, napi_default,
                   nullptr});
    desc.push_back({"OHCryptoPrivKeyEncodingParamsSetParamSuccess", nullptr,
                   OHCryptoPrivKeyEncodingParamsSetParamSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoPrivKeyEncodingParamsSetParamInvalidParams", nullptr,
                   OHCryptoPrivKeyEncodingParamsSetParamParameterCheckFailed, nullptr, nullptr, nullptr, napi_default,
                   nullptr});
    desc.push_back({"OHCryptoPrivKeyEncodeSuccess", nullptr, OHCryptoPrivKeyEncodeSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoPrivKeyEncodeInvalidParams", nullptr, OHCryptoPrivKeyEncodeParameterCheckFailed,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoPrivKeyEncodeOpertionError", nullptr, OHCryptoPrivKeyEncodeOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymCipherFinalOpertionError", nullptr, OHCryptoAsymCipherFinalOpertionError,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoSm2CiphertextSpecCreateOpertionError", nullptr,
                   OHCryptoSm2CiphertextSpecCreateOpertionError, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoPrivKeyGetParamSuccess", nullptr, OHCryptoPrivKeyGetParamSuccess,
                   nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoPrivKeyGetParamInvalidParams", nullptr,
                   OHCryptoPrivKeyGetParamParameterCheckFailed, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeySpecGenEcCommonParamsSpecSuccess", nullptr,
                   OHCryptoAsymKeySpecGenEcCommonParamsSpecSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OHCryptoAsymKeySpecGenEcCommonParamsSpecInvalidParams", nullptr,
                   OHCryptoAsymKeySpecGenEcCommonParamsSpecParameterCheckFailed, nullptr, nullptr, nullptr,
                   napi_default, nullptr});
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc = {
        {"OHCryptoAsymCipherCreateSuccess", nullptr, OHCryptoAsymCipherCreateSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoAsymCipherCreateParaInvalid", nullptr, OHCryptoAsymCipherCreateParameterCheckFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoAsymCipherCreateNotSupport", nullptr, OHCryptoAsymCipherCreateNotSupport,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoAsymCipherInitSuccess", nullptr, OHCryptoAsymCipherInitSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoAsymCipherInitParaInvalid", nullptr, OHCryptoAsymCipherInitParameterCheckFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoAsymCipherFinalSuccess", nullptr, OHCryptoAsymCipherFinalSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoAsymCipherFinalParaInvalid", nullptr, OHCryptoAsymCipherFinalParameterCheckFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoSm2CiphertextSpecCreateSuccess", nullptr, OHCryptoSm2CiphertextSpecCreateSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoSm2CiphertextSpecCreateParaInvalid", nullptr, OHCryptoSm2CiphertextSpecCreateParameterCheckFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoSm2CiphertextSpecGetItemSuccess", nullptr, OHCryptoSm2CiphertextSpecGetItemSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoSm2CiphertextSpecGetItemParaInvalid", nullptr, OHCryptoSm2CiphertextSpecGetItemParameterCheckFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoSm2CiphertextSpecSetItemSuccess", nullptr, OHCryptoSm2CiphertextSpecSetItemSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoSm2CiphertextSpecSetItemParaInvalid", nullptr, OHCryptoSm2CiphertextSpecSetItemParameterCheckFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoSm2CiphertextSpecEncodeSuccess", nullptr, OHCryptoSm2CiphertextSpecEncodeSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHCryptoSm2CiphertextSpecEncodeParaInvalid", nullptr, OHCryptoSm2CiphertextSpecEncodeParameterCheckFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    AddDescToVectorOne(desc);
    AddDescToVectorTwo(desc);
    AddDescToVectorThree(desc);
    AddDescToVectorFour(desc);
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());

    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "cryptoarchitecture",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}