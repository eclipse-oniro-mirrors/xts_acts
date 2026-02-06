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
#ifndef CRYPTO_ARCHITECTURE_TEST_H
#define CRYPTO_ARCHITECTURE_TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>

napi_value OHCryptoAsymCipherCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymCipherCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymCipherCreateNotSupport(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymCipherInitSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymCipherInitParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymCipherFinalSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymCipherFinalParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoSm2CiphertextSpecCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoSm2CiphertextSpecCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoSm2CiphertextSpecGetItemSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoSm2CiphertextSpecGetItemParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoSm2CiphertextSpecSetItemSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoSm2CiphertextSpecSetItemParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoSm2CiphertextSpecEncodeSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoSm2CiphertextSpecEncodeParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeyGeneratorCreateInvalidParams(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeyGeneratorGenerateInvalidParams(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeyGeneratorConvertInvalidParams(napi_env env, napi_callback_info info);
napi_value OHCryptoPubKeyEncodeInvalidParams(napi_env env, napi_callback_info info);
napi_value OHCryptoPubKeyGetParamInvalidParams(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeyGeneratorSetPasswordSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeyGeneratorSetPasswordParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoPrivKeyEncodingParamsCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoPrivKeyEncodingParamsCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoPrivKeyEncodingParamsSetParamSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoPrivKeyEncodingParamsSetParamParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoPrivKeyEncodeSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoPrivKeyEncodeParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoPrivKeyEncodeOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymCipherFinalOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoSm2CiphertextSpecCreateOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoPrivKeyGetParamSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoPrivKeyGetParamParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecGenEcCommonParamsSpecSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecGenEcCommonParamsSpecParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecGenDhCommonParamsSpecSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecGenDhCommonParamsSpecParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecGenDhCommonParamsSpecParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecSetParamSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecSetParamParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecSetCommonParamsSpecSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecSetCommonParamsSpecParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecGetParamSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeySpecGetParamParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeyGeneratorWithSpecCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeyGeneratorWithSpecCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeyGeneratorWithSpecGenKeyPairSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoAsymKeyGeneratorWithSpecGenKeyPairParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoEcPointCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoEcPointCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoEcPointGetCoordinateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoEcPointGetCoordinateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoEcPointSetCoordinateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoEcPointSetCoordinateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoEcPointEncodeSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoEcPointEncodeParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoEcPointEncodeOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoDigestCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoDigestCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoDigestUpdateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoDigestUpdateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoDigestFinalSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoDigestFinalParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoKdfParamsCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoKdfParamsCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoKdfParamsSetParamSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoKdfParamsSetParamParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoKdfCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoKdfCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoKdfDeriveSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoKdfDeriveParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoKdfDeriveOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoKeyAgreementCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoKeyAgreementCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoKeyAgreementCreateNotSupport(napi_env env, napi_callback_info info);
napi_value OHCryptoKeyAgreementGenerateSecretSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoKeyAgreementGenerateSecretParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoKeyAgreementGenerateSecretOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoMacCreateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoMacCreateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoMacSetParamSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoMacSetParamParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoMacInitSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoMacInitParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoMacUpdateSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoMacUpdateParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoMacUpdateOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoMacFinalSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoMacFinalParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoMacFinalOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoMacGetLengthSuccess(napi_env env, napi_callback_info info);
napi_value OHCryptoMacGetLengthParameterCheckFailed(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifySetParamNotSupport(napi_env env, napi_callback_info info);
napi_value OHCryptoSignInitOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoSignUpdateOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifyRecoverOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoSignFinalOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoSignSetParamNotSupport(napi_env env, napi_callback_info info);
napi_value OHCryptoSignGetParamOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoEccSignatureSpecCreateOpertionError(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherCreateNotSupport(napi_env env, napi_callback_info info);
napi_value OHCryptoSymKeyGeneratorCreateNotSupport(napi_env env, napi_callback_info info);
napi_value OHCryptoRandCreate0100(napi_env env, napi_callback_info info);
napi_value OHCryptoRandCreate0200(napi_env env, napi_callback_info info);
napi_value OHCryptoRandGenerateRandom0100(napi_env env, napi_callback_info info);
napi_value OHCryptoRandGenerateRandom0200(napi_env env, napi_callback_info info);
napi_value OHCryptoRandSetSeed0100(napi_env env, napi_callback_info info);
napi_value OHCryptoRandSetSeed0200(napi_env env, napi_callback_info info);
napi_value OHCryptoRandEnableHardwareEntropy0100(napi_env env, napi_callback_info info);
napi_value OHCryptoRandEnableHardwareEntropy0200(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifyCreate0100(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifyCreate0200(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifyInit0100(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifyInit0200(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifyUpdate0100(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifyUpdate0200(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifyRecover0100(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifyRecover0200(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifySetParam0100(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifySetParam0200(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifyGetParam0100(napi_env env, napi_callback_info info);
napi_value OHCryptoVerifyGetParam0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSignCreate0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSignCreate0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSignInit0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSignInit0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSignUpdate0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSignUpdate0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSignFinal0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSignFinal0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSignSetParam0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSignSetParam0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSignGetParam0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSignGetParam0200(napi_env env, napi_callback_info info);
napi_value OHCryptoEccSignatureSpecCreate0100(napi_env env, napi_callback_info info);
napi_value OHCryptoEccSignatureSpecCreate0200(napi_env env, napi_callback_info info);
napi_value OHCryptoEccSignatureSpecGetRAndS0100(napi_env env, napi_callback_info info);
napi_value OHCryptoEccSignatureSpecGetRAndS0200(napi_env env, napi_callback_info info);
napi_value OHCryptoEccSignatureSpecSetRAndS0100(napi_env env, napi_callback_info info);
napi_value OHCryptoEccSignatureSpecSetRAndS0200(napi_env env, napi_callback_info info);
napi_value OHCryptoEccSignatureSpecEncode0100(napi_env env, napi_callback_info info);
napi_value OHCryptoEccSignatureSpecEncode0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherParamsCreate0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherParamsCreate0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherParamsSetParam0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherParamsSetParam0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherCreate0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherCreate0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherInit0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherInit0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherUpdate0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherUpdate0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherFinale0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSymCipherFinale0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSymKeyGeneratorCreate0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSymKeyGeneratorCreate0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSymKeyGeneratorGenerate0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSymKeyGeneratorGenerate0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSymKeyGeneratorConvert0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSymKeyGeneratorConvert0200(napi_env env, napi_callback_info info);
napi_value OHCryptoSymKeyGetKeyData0100(napi_env env, napi_callback_info info);
napi_value OHCryptoSymKeyGetKeyData0200(napi_env env, napi_callback_info info);
#endif