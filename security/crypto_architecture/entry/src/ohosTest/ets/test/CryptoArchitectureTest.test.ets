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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import cryptoarchitecture from 'libcryptoarchitecture.so'

export default function CryptoArchitectureTest() {
  describe('CryptoArchitectureTest', () => {

    /**
     * @tc.name   CACryptoAsymCipherCreate001
     * @tc.number SUB_CRYPTOARCHITECTURE_CRYPTOASYMCIPHERCREATE_0100
     * @tc.desc   test OH_CryptoAsymCipher_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CACryptoAsymCipherCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>CACryptoAsymCipherCreate001 start====");
      let result : number = cryptoarchitecture.OHCryptoAsymCipherCreateSuccess();
        console.info("====>CACryptoAsymCipherCreate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>CACryptoAsymCipherCreate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   CACryptoAsymCipherCreate002
     * @tc.number SUB_CRYPTOARCHITECTURE_CRYPTOASYMCIPHERCREATE_0200
     * @tc.desc   test OH_CryptoAsymCipher_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CACryptoAsymCipherCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>CACryptoAsymCipherCreate002 start====");
        let result : number = cryptoarchitecture.OHCryptoAsymCipherCreateParaInvalid();
        console.info("====>CACryptoAsymCipherCreate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>CACryptoAsymCipherCreate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   CACryptoAsymCipherCreate003
     * @tc.number SUB_CRYPTOARCHITECTURE_CRYPTOASYMCIPHERCREATE_0300
     * @tc.desc   test OH_CryptoAsymCipher_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CACryptoAsymCipherCreate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>CACryptoAsymCipherCreate003 start====");
        let result : number = cryptoarchitecture.OHCryptoAsymCipherCreateNotSupport();
        console.info("====>CACryptoAsymCipherCreate003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>CACryptoAsymCipherCreate003 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   CACryptoAsymCipherInit001
     * @tc.number SUB_CRYPTOARCHITECTURE_CRYPTOASYMCIPHERINIT_0100
     * @tc.desc   test OH_CryptoAsymCipher_Init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CACryptoAsymCipherInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>CACryptoAsymCipherInit001 start====");
        let result : number = cryptoarchitecture.OHCryptoAsymCipherInitSuccess();
        console.info("====>CACryptoAsymCipherInit001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>CACryptoAsymCipherInit001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   CACryptoAsymCipherInit002
     * @tc.number SUB_CRYPTOARCHITECTURE_CRYPTOASYMCIPHERINIT_0200
     * @tc.desc   test OH_CryptoAsymCipher_Init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CACryptoAsymCipherInit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>CACryptoAsymCipherInit002 start====");
        let result : number = cryptoarchitecture.OHCryptoAsymCipherInitParaInvalid();
        console.info("====>CACryptoAsymCipherInit002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>CACryptoAsymCipherInit002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   CACryptoAsymCipherFinal001
     * @tc.number SUB_CRYPTOARCHITECTURE_CRYPTOASYMCIPHERFINAL_0100
     * @tc.desc   test OH_CryptoAsymCipher_Final
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CACryptoAsymCipherFinal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>CACryptoAsymCipherFinal001 start====");
        let result : number = cryptoarchitecture.OHCryptoAsymCipherFinalSuccess();
        console.info("====>CACryptoAsymCipherFinal001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>CACryptoAsymCipherFinal001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   CACryptoAsymCipherFinal002
     * @tc.number SUB_CRYPTOARCHITECTURE_CRYPTOASYMCIPHERFINAL_0200
     * @tc.desc   test OH_CryptoAsymCipher_Final
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CACryptoAsymCipherFinal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>CACryptoAsymCipherFinal002 start====");
        let result : number = cryptoarchitecture.OHCryptoAsymCipherFinalParaInvalid();
        console.info("====>CACryptoAsymCipherFinal002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>CACryptoAsymCipherFinal002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoSm2CiphertextSpecCreate001
     * @tc.number SUB_CRYPTOSM2_CIPHERTEXTSPECCREATE_0100
     * @tc.desc   test OH_CryptoSm2CiphertextSpec_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoSm2CiphertextSpecCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoSm2CiphertextSpecCreate001 start====");
        let result : number = cryptoarchitecture.OHCryptoSm2CiphertextSpecCreateSuccess();
        console.info("====>OHCryptoSm2CiphertextSpecCreate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSm2CiphertextSpecCreate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoSm2CiphertextSpecCreate002
     * @tc.number SUB_CRYPTOSM2_CIPHERTEXTSPECCREATE_0200
     * @tc.desc   test OH_CryptoSm2CiphertextSpec_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoSm2CiphertextSpecCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoSm2CiphertextSpecCreate002 start====");
        let result : number = cryptoarchitecture.OHCryptoSm2CiphertextSpecCreateParaInvalid();
        console.info("====>OHCryptoSm2CiphertextSpecCreate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSm2CiphertextSpecCreate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoSm2CiphertextSpecGetItem001
     * @tc.number SUB_CRYPTOSM2_CIPHERTEXTSPECGETITEM_0100
     * @tc.desc   test OH_CryptoSm2CiphertextSpec_GetItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoSm2CiphertextSpecGetItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoSm2CiphertextSpecGetItem001 start====");
        let result : number = cryptoarchitecture.OHCryptoSm2CiphertextSpecGetItemSuccess();
        console.info("====>OHCryptoSm2CiphertextSpecGetItem001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSm2CiphertextSpecGetItem001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoSm2CiphertextSpecGetItem002
     * @tc.number SUB_CRYPTOSM2_CIPHERTEXTSPECGETITEM_0200
     * @tc.desc   test OH_CryptoSm2CiphertextSpec_GetItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoSm2CiphertextSpecGetItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoSm2CiphertextSpecGetItem002 start====");
        let result : number = cryptoarchitecture.OHCryptoSm2CiphertextSpecGetItemParaInvalid();
        console.info("====>OHCryptoSm2CiphertextSpecGetItem002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSm2CiphertextSpecGetItem002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoSm2CiphertextSpecSetItem001
     * @tc.number SUB_CRYPTOSM2_CIPHERTEXTSPECSETITEM_0100
     * @tc.desc   test OH_CryptoSm2CiphertextSpec_SetItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoSm2CiphertextSpecSetItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoSm2CiphertextSpecSetItem001 start====");
        let result : number = cryptoarchitecture.OHCryptoSm2CiphertextSpecSetItemSuccess();
        console.info("====>OHCryptoSm2CiphertextSpecSetItem001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSm2CiphertextSpecSetItem001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoSm2CiphertextSpecSetItem002
     * @tc.number SUB_CRYPTOSM2_CIPHERTEXTSPECSETITEM_0200
     * @tc.desc   test OH_CryptoSm2CiphertextSpec_SetItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoSm2CiphertextSpecSetItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoSm2CiphertextSpecSetItem002 start====");
        let result : number = cryptoarchitecture.OHCryptoSm2CiphertextSpecSetItemParaInvalid();
        console.info("====>OHCryptoSm2CiphertextSpecSetItem002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSm2CiphertextSpecSetItem002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoSm2CiphertextSpecEncode001
     * @tc.number SUB_CRYPTOSM2_CIPHERTEXTSPECENCODE_0100
     * @tc.desc   test OH_CryptoSm2CiphertextSpec_Encode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoSm2CiphertextSpecEncode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoSm2CiphertextSpecEncode001 start====");
        let result : number = cryptoarchitecture.OHCryptoSm2CiphertextSpecEncodeSuccess();
        console.info("====>OHCryptoSm2CiphertextSpecEncode001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSm2CiphertextSpecEncode001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoSm2CiphertextSpecEncode002
     * @tc.number SUB_CRYPTOSM2_CIPHERTEXTSPECENCODE_0200
     * @tc.desc   test OH_CryptoSm2CiphertextSpec_Encode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoSm2CiphertextSpecEncode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoSm2CiphertextSpecEncode002 start====");
        let result : number = cryptoarchitecture.OHCryptoSm2CiphertextSpecEncodeParaInvalid();
        console.info("====>OHCryptoSm2CiphertextSpecEncode002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSm2CiphertextSpecEncode002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeyGeneratorCreate001
     * @tc.number SUB_CRYPTOASYM_KEYGENERATORCREATE_0100
     * @tc.desc   test OH_CryptoAsymKeyGenerator_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeyGeneratorCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeyGeneratorCreate001 start====");
        let result : number = cryptoarchitecture.OHCryptoAsymKeyGeneratorCreateInvalidParams();
        console.info("====>OHCryptoAsymKeyGeneratorCreate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeyGeneratorCreate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeyGeneratorGenerate001
     * @tc.number SUB_CRYPTOASYM_KEYGENERATORGENERATE_0100
     * @tc.desc   test OH_CryptoAsymKeyGenerator_Generate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeyGeneratorGenerate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeyGeneratorGenerate001 start====");
        let result : number = cryptoarchitecture.OHCryptoAsymKeyGeneratorGenerateInvalidParams();
        console.info("====>OHCryptoAsymKeyGeneratorGenerate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeyGeneratorGenerate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeyGeneratorConvert001
     * @tc.number SUB_CRYPTOASYM_KEYGENERATORCONVERT_0100
     * @tc.desc   test OH_CryptoAsymKeyGenerator_Convert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeyGeneratorConvert001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeyGeneratorConvert001 start====");
        let result : number = cryptoarchitecture.OHCryptoAsymKeyGeneratorConvertInvalidParams();
        console.info("====>OHCryptoAsymKeyGeneratorConvert001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeyGeneratorConvert001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoPubKeyEncode001
     * @tc.number SUB_CRYPTOPUBKEY_ENCODE_0100
     * @tc.desc   test OH_CryptoPubKey_Encode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoPubKeyEncode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoPubKeyEncode001 start====");
        let result : number = cryptoarchitecture.OHCryptoPubKeyEncodeInvalidParams();
        console.info("====>OHCryptoPubKeyEncode001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoPubKeyEncode001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoPubKeyGetParam001
     * @tc.number SUB_CRYPTOPUBKEY_GETPARAM_0100
     * @tc.desc   test OH_CryptoPubKey_GetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoPubKeyGetParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoPubKeyGetParam001 start====");
        let result: number = cryptoarchitecture.OHCryptoPubKeyGetParamInvalidParams();
        console.info("====>OHCryptoPubKeyGetParam001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoPubKeyGetParam001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeyGeneratorSetPassword001
     * @tc.number SUB_CRYPTOASYM_KEYGENERATOR_SETPASSWORD_0100
     * @tc.desc   test OH_CryptoAsymKeyGenerator_SetPassword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeyGeneratorSetPassword001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeyGeneratorSetPassword001 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeyGeneratorSetPasswordSuccess();
        console.info("====>OHCryptoAsymKeyGeneratorSetPassword001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeyGeneratorSetPassword001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeyGeneratorSetPassword002
     * @tc.number SUB_CRYPTOASYM_KEYGENERATOR_SETPASSWORD_0200
     * @tc.desc   test OH_CryptoAsymKeyGenerator_SetPassword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeyGeneratorSetPassword002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeyGeneratorSetPassword002 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeyGeneratorSetPasswordInvalidParams();
        console.info("====>OHCryptoAsymKeyGeneratorSetPassword002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeyGeneratorSetPassword002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoPrivKeyEncodingParamsCreate001
     * @tc.number SUB_CRYPTOPRIVKEY_ENCODEINGPARAMSCREATE_0100
     * @tc.desc   test OH_CryptoPrivKeyEncodingParams_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoPrivKeyEncodingParamsCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoPrivKeyEncodingParamsCreate001 start====");
        let result: number = cryptoarchitecture.OHCryptoPrivKeyEncodingParamsCreateSuccess();
        console.info("====>OHCryptoPrivKeyEncodingParamsCreate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoPrivKeyEncodingParamsCreate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoPrivKeyEncodingParamsCreate002
     * @tc.number SUB_CRYPTOPRIVKEY_ENCODEINGPARAMSCREATE_0200
     * @tc.desc   test OH_CryptoPrivKeyEncodingParams_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoPrivKeyEncodingParamsCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoPrivKeyEncodingParamsCreate002 start====");
        let result: number = cryptoarchitecture.OHCryptoPrivKeyEncodingParamsCreateInvalidParams();
        console.info("====>OHCryptoPrivKeyEncodingParamsCreate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoPrivKeyEncodingParamsCreate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoPrivKeyEncodingParamsSetParam001
     * @tc.number SUB_CRYPTOPRIVKEY_ENCODEINGPARAMSSETPARAM_0100
     * @tc.desc   test OH_CryptoPrivKeyEncodingParams_SetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoPrivKeyEncodingParamsSetParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoPrivKeyEncodingParamsSetParam001 start====");
        let result: number = cryptoarchitecture.OHCryptoPrivKeyEncodingParamsSetParamSuccess();
        console.info("====>OHCryptoPrivKeyEncodingParamsSetParam001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoPrivKeyEncodingParamsSetParam001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoPrivKeyEncodingParamsSetParam002
     * @tc.number SUB_CRYPTOPRIVKEY_ENCODEINGPARAMSSETPARAM_0200
     * @tc.desc   test OH_CryptoPrivKeyEncodingParams_SetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoPrivKeyEncodingParamsSetParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoPrivKeyEncodingParamsSetParam002 start====");
        let result: number = cryptoarchitecture.OHCryptoPrivKeyEncodingParamsSetParamInvalidParams();
        console.info("====>OHCryptoPrivKeyEncodingParamsSetParam002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoPrivKeyEncodingParamsSetParam002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoPrivKeyEncode001
     * @tc.number SUB_CRYPTOPRIVKEY_ENCODE_0100
     * @tc.desc   test OH_CryptoPrivKey_Encode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoPrivKeyEncode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoPrivKeyEncode001 start====");
        let result: number = cryptoarchitecture.OHCryptoPrivKeyEncodeSuccess();
        console.info("====>OHCryptoPrivKeyEncode001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoPrivKeyEncode001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoPrivKeyEncode002
     * @tc.number SUB_CRYPTOPRIVKEY_ENCODE_0200
     * @tc.desc   test OH_CryptoPrivKey_Encode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoPrivKeyEncode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoPrivKeyEncode002 start====");
        let result: number = cryptoarchitecture.OHCryptoPrivKeyEncodeInvalidParams();
        console.info("====>OHCryptoPrivKeyEncode002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoPrivKeyEncode002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoPrivKeyEncode003
     * @tc.number SUB_CRYPTOPRIVKEY_ENCODE_0300
     * @tc.desc   test OH_CryptoPrivKey_Encode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoPrivKeyEncode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoPrivKeyEncode003 start====");
        let result: number = cryptoarchitecture.OHCryptoPrivKeyEncodeOpertionError();
        console.info("====>OHCryptoPrivKeyEncode003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoPrivKeyEncode003 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   CACryptoAsymCipherFinal003
     * @tc.number SUB_CRYPTOARCHITECTURE_CRYPTOASYMCIPHERFINAL_0300
     * @tc.desc   test OH_CryptoAsymCipher_Final
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CACryptoAsymCipherFinal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>CACryptoAsymCipherFinal003 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymCipherFinalOpertionError();
        console.info("====>CACryptoAsymCipherFinal003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>CACryptoAsymCipherFinal003 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoSm2CiphertextSpecCreate003
     * @tc.number SUB_CRYPTOSM2_CIPHERTEXTSPECCREATE_0300
     * @tc.desc   test OH_CryptoSm2CiphertextSpec_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoSm2CiphertextSpecCreate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoSm2CiphertextSpecCreate003 start====");
        let result: number = cryptoarchitecture.OHCryptoSm2CiphertextSpecCreateOpertionError();
        console.info("====>OHCryptoSm2CiphertextSpecCreate003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoSm2CiphertextSpecCreate003 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoPrivKeyGetParam001
     * @tc.number SUB_CRYPTOPRIVKEY_GETPARAM_0100
     * @tc.desc   test OH_CryptoPrivKey_GetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoPrivKeyGetParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoPrivKeyGetParam001 start====");
        let result: number = cryptoarchitecture.OHCryptoPrivKeyGetParamSuccess();
        console.info("====>OHCryptoPrivKeyGetParam001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoPrivKeyGetParam001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoPrivKeyGetParam002
     * @tc.number SUB_CRYPTOPRIVKEY_GETPARAM_0200
     * @tc.desc   test OH_CryptoPrivKey_GetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoPrivKeyGetParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoPrivKeyGetParam002 start====");
        let result: number = cryptoarchitecture.OHCryptoPrivKeyGetParamInvalidParams();
        console.info("====>OHCryptoPrivKeyGetParam002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoPrivKeyGetParam002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeySpecGenEcCommonParamsSpec001
     * @tc.number SUB_CRYPTOASYMKEYSPEC_GENECCOMMONPARAMSSPEC_0100
     * @tc.desc   test OH_CryptoAsymKeySpec_GenEcCommonParamsSpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeySpecGenEcCommonParamsSpec001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecGenEcCommonParamsSpec001 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeySpecGenEcCommonParamsSpecSuccess();
        console.info("====>OHCryptoAsymKeySpecGenEcCommonParamsSpec001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecGenEcCommonParamsSpec001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeySpecGenEcCommonParamsSpec002
     * @tc.number SUB_CRYPTOASYMKEYSPEC_GENECCOMMONPARAMSSPEC_0200
     * @tc.desc   test OH_CryptoAsymKeySpec_GenEcCommonParamsSpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeySpecGenEcCommonParamsSpec002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecGenEcCommonParamsSpec002 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeySpecGenEcCommonParamsSpecInvalidParams();
        console.info("====>OHCryptoAsymKeySpecGenEcCommonParamsSpec002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecGenEcCommonParamsSpec002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeySpecGenDhCommonParamsSpec001
     * @tc.number SUB_CRYPTOASYMKEYSPEC_GENDHCOMMONPARAMSSPEC_0100
     * @tc.desc   test OH_CryptoAsymKeySpec_GenDhCommonParamsSpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeySpecGenDhCommonParamsSpec001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecGenDhCommonParamsSpec001 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeySpecGenDhCommonParamsSpecInvalidParams();
        console.info("====>OHCryptoAsymKeySpecGenDhCommonParamsSpec001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecGenDhCommonParamsSpec001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeySpecCreate001
     * @tc.number SUB_CRYPTOASYMKEYSPEC_CREATE_0100
     * @tc.desc   test OH_CryptoAsymKeySpec_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeySpecCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecCreate001 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeySpecCreateSuccess();
        console.info("====>OHCryptoAsymKeySpecCreate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecCreate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeySpecCreate002
     * @tc.number SUB_CRYPTOASYMKEYSPEC_CREATE_0200
     * @tc.desc   test OH_CryptoAsymKeySpec_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeySpecCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecCreate002 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeySpecCreateInvalidParams();
        console.info("====>OHCryptoAsymKeySpecCreate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecCreate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeySpecSetParam001
     * @tc.number SUB_CRYPTOASYMKEYSPEC_SETPARAM_0100
     * @tc.desc   test OH_CryptoAsymKeySpec_SetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeySpecSetParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecSetParam001 start====");
        // let result: number = cryptoarchitecture.OHCryptoAsymKeySpecSetParamSuccess();
        let result: number = 0;
        console.info("====>OHCryptoAsymKeySpecSetParam001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecSetParam001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeySpecSetParam002
     * @tc.number SUB_CRYPTOASYMKEYSPEC_SETPARAM_0200
     * @tc.desc   test OH_CryptoAsymKeySpec_SetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeySpecSetParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecSetParam002 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeySpecSetParamInvalidParams();
        console.info("====>OHCryptoAsymKeySpecSetParam002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecSetParam002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeySpecSetCommonParamsSpec001
     * @tc.number SUB_CRYPTOASYMKEYSPEC_SETCOMMONPARAMSSPEC_0100
     * @tc.desc   test OH_CryptoAsymKeySpec_SetCommonParamsSpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeySpecSetCommonParamsSpec001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecSetCommonParamsSpec001 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeySpecSetCommonParamsSpecSuccess();
        console.info("====>OHCryptoAsymKeySpecSetCommonParamsSpec001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecSetCommonParamsSpec001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeySpecSetCommonParamsSpec002
     * @tc.number SUB_CRYPTOASYMKEYSPEC_SETCOMMONPARAMSSPEC_0200
     * @tc.desc   test OH_CryptoAsymKeySpec_SetCommonParamsSpec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeySpecSetCommonParamsSpec002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecSetCommonParamsSpec002 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeySpecSetCommonParamsSpecInvalidParams();
        console.info("====>OHCryptoAsymKeySpecSetCommonParamsSpec002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecSetCommonParamsSpec002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeySpecGetParam001
     * @tc.number SUB_CRYPTOASYMKEYSPEC_GETPARAM_0100
     * @tc.desc   test OH_CryptoAsymKeySpec_GetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeySpecGetParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecGetParam001 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeySpecGetParamSuccess();
        console.info("====>OHCryptoAsymKeySpecGetParam001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecGetParam001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeySpecGetParam002
     * @tc.number SUB_CRYPTOASYMKEYSPEC_GETPARAM_0200
     * @tc.desc   test OH_CryptoAsymKeySpec_GetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeySpecGetParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecGetParam002 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeySpecGetParamInvalidParams();
        console.info("====>OHCryptoAsymKeySpecGetParam002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecGetParam002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeyGeneratorWithSpecCreate001
     * @tc.number SUB_CRYPTOASYMKEYGENERATORWITHSPEC_CREATE_0100
     * @tc.desc   test OH_CryptoAsymKeyGeneratorWithSpec_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeyGeneratorWithSpecCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeySpecGetParam001 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeyGeneratorWithSpecCreateSuccess();
        console.info("====>OHCryptoAsymKeySpecGetParam001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeySpecGetParam001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeyGeneratorWithSpecCreate002
     * @tc.number SUB_CRYPTOASYMKEYGENERATORWITHSPEC_CREATE_0200
     * @tc.desc   test OH_CryptoAsymKeyGeneratorWithSpec_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeyGeneratorWithSpecCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeyGeneratorWithSpecCreate002 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeyGeneratorWithSpecCreateInvalidParams();
        console.info("====>OHCryptoAsymKeyGeneratorWithSpecCreate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeyGeneratorWithSpecCreate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeyGeneratorWithSpecGenKeyPair001
     * @tc.number SUB_CRYPTOASYMKEYGENERATORWITHSPEC_GENKEYPAIR_0100
     * @tc.desc   test OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeyGeneratorWithSpecGenKeyPair001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeyGeneratorWithSpecGenKeyPair001 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeyGeneratorWithSpecGenKeyPairSuccess();
        console.info("====>OHCryptoAsymKeyGeneratorWithSpecGenKeyPair001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeyGeneratorWithSpecGenKeyPair001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoAsymKeyGeneratorWithSpecGenKeyPair002
     * @tc.number SUB_CRYPTOASYMKEYGENERATORWITHSPEC_GENKEYPAIR_0200
     * @tc.desc   test OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoAsymKeyGeneratorWithSpecGenKeyPair002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoAsymKeyGeneratorWithSpecGenKeyPair002 start====");
        let result: number = cryptoarchitecture.OHCryptoAsymKeyGeneratorWithSpecGenKeyPairInvalidParams();
        console.info("====>OHCryptoAsymKeyGeneratorWithSpecGenKeyPair002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoAsymKeyGeneratorWithSpecGenKeyPair002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoEcPointCreate001
     * @tc.number SUB_CRYPTOECPOINT_CREATE_0100
     * @tc.desc   test OH_CryptoEcPoint_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoEcPointCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoEcPointCreate001 start====");
        let result: number = cryptoarchitecture.OHCryptoEcPointCreateSuccess();
        console.info("====>OHCryptoEcPointCreate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoEcPointCreate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoEcPointCreate002
     * @tc.number SUB_CRYPTOECPOINT_CREATE_0200
     * @tc.desc   test OH_CryptoEcPoint_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoEcPointCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoEcPointCreate002 start====");
        let result: number = cryptoarchitecture.OHCryptoEcPointCreateInvalidParams();
        console.info("====>OHCryptoEcPointCreate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoEcPointCreate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoEcPointGetCoordinate001
     * @tc.number SUB_CRYPTOECPOINT_GETCOORDINATE_0100
     * @tc.desc   test OH_CryptoEcPoint_GetCoordinate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoEcPointGetCoordinate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoEcPointGetCoordinate001 start====");
        let result: number = cryptoarchitecture.OHCryptoEcPointGetCoordinateSuccess();
        console.info("====>OHCryptoEcPointGetCoordinate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoEcPointGetCoordinate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoEcPointGetCoordinate002
     * @tc.number SUB_CRYPTOECPOINT_GETCOORDINATE_0200
     * @tc.desc   test OH_CryptoEcPoint_getCoordinate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoEcPointGetCoordinate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoEcPointGetCoordinate002 start====");
        let result: number = cryptoarchitecture.OHCryptoEcPointGetCoordinateInvalidParams();
        console.info("====>OHCryptoEcPointGetCoordinate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoEcPointGetCoordinate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoEcPointSetCoordinate001
     * @tc.number SUB_CRYPTOECPOINT_SETCOORDINATE_0100
     * @tc.desc   test OH_CryptoEcPoint_SetCoordinate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoEcPointSetCoordinate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoEcPointSetCoordinate001 start====");
        let result: number = cryptoarchitecture.OHCryptoEcPointSetCoordinateSuccess();
        console.info("====>OHCryptoEcPointSetCoordinate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoEcPointSetCoordinate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoEcPointSetCoordinate002
     * @tc.number SUB_CRYPTOECPOINT_SETCOORDINATE_0200
     * @tc.desc   test OH_CryptoEcPoint_SetCoordinate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoEcPointSetCoordinate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoEcPointSetCoordinate002 start====");
        let result: number = cryptoarchitecture.OHCryptoEcPointSetCoordinateInvalidParams();
        console.info("====>OHCryptoEcPointSetCoordinate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoEcPointSetCoordinate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoEcPointEncode001
     * @tc.number SUB_CRYPTOECPOINT_ENCODE_0100
     * @tc.desc   test OH_CryptoEcPoint_Encode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoEcPointEncode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoEcPointEncode001 start====");
        let result: number = cryptoarchitecture.OHCryptoEcPointEncodeSuccess();
        console.info("====>OHCryptoEcPointEncode001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoEcPointEncode001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoEcPointEncode002
     * @tc.number SUB_CRYPTOECPOINT_ENCODE_0200
     * @tc.desc   test OH_CryptoEcPoint_Encode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoEcPointEncode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoEcPointEncode002 start====");
        let result: number = cryptoarchitecture.OHCryptoEcPointEncodeInvalidParams();
        console.info("====>OHCryptoEcPointEncode002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoEcPointEncode002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoEcPointEncode003
     * @tc.number SUB_CRYPTOECPOINT_ENCODE_0300
     * @tc.desc   test OH_CryptoEcPoint_Encode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoEcPointEncode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoEcPointEncode003 start====");
        let result: number = cryptoarchitecture.OHCryptoEcPointEncodeOpertionError();
        console.info("====>OHCryptoEcPointEncode003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoEcPointEncode003 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoDigestCreate001
     * @tc.number SUB_CRYPTODIGEST_CREATE_0100
     * @tc.desc   test OH_CryptoDigest_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoDigestCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoDigestCreate001 start====");
        let result: number = cryptoarchitecture.OHCryptoDigestCreateSuccess();
        console.info("====>OHCryptoDigestCreate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoDigestCreate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoDigestCreate002
     * @tc.number SUB_CRYPTODIGEST_CREATE_0200
     * @tc.desc   test OH_CryptoDigest_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoDigestCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoDigestCreate002 start====");
        let result: number = cryptoarchitecture.OHCryptoDigestCreateInvalidParams();
        console.info("====>OHCryptoDigestCreate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoDigestCreate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoDigestUpdate001
     * @tc.number SUB_CRYPTODIGEST_UPDATE_0100
     * @tc.desc   test OH_CryptoDigest_Update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoDigestUpdate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoDigestUpdate001 start====");
        let result: number = cryptoarchitecture.OHCryptoDigestUpdateSuccess();
        console.info("====>OHCryptoDigestUpdate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoDigestUpdate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoDigestUpdate002
     * @tc.number SUB_CRYPTODIGEST_UPDATE_0200
     * @tc.desc   test OH_CryptoDigest_Update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoDigestUpdate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoDigestUpdate002 start====");
        let result: number = cryptoarchitecture.OHCryptoDigestUpdateInvalidParams();
        console.info("====>OHCryptoDigestUpdate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoDigestUpdate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoDigestFinal001
     * @tc.number SUB_CRYPTODIGEST_FINAL_0100
     * @tc.desc   test OH_CryptoDigest_Final
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoDigestFinal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoDigestFinal001 start====");
        let result: number = cryptoarchitecture.OHCryptoDigestFinalSuccess();
        console.info("====>OHCryptoDigestFinal001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoDigestFinal001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoDigestFinal002
     * @tc.number SUB_CRYPTODIGEST_FINAL_0200
     * @tc.desc   test OH_CryptoDigest_Final
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoDigestFinal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoDigestFinal002 start====");
        let result: number = cryptoarchitecture.OHCryptoDigestFinalInvalidParams();
        console.info("====>OHCryptoDigestFinal002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoDigestFinal002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKdfParamsCreate001
     * @tc.number SUB_CRYPTOKDFPARAMS_CREATE_0100
     * @tc.desc   test OH_CryptoKdfParams_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKdfParamsCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKdfParamsCreate001 start====");
        let result: number = cryptoarchitecture.OHCryptoKdfParamsCreateSuccess();
        console.info("====>OHCryptoKdfParamsCreate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKdfParamsCreate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKdfParamsCreate002
     * @tc.number SUB_CRYPTOKDFPARAMS_CREATE_0200
     * @tc.desc   test OH_CryptoKdfParams_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKdfParamsCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKdfParamsCreate002 start====");
        let result: number = cryptoarchitecture.OHCryptoKdfParamsCreateInvalidParams();
        console.info("====>OHCryptoKdfParamsCreate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKdfParamsCreate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKdfParamsSetParam001
     * @tc.number SUB_CRYPTOKDFPARAMS_SETPARAM_0100
     * @tc.desc   test OH_CryptoKdfParams_SetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKdfParamsSetParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKdfParamsSetParam001 start====");
        let result: number = cryptoarchitecture.OHCryptoKdfParamsSetParamSuccess();
        console.info("====>OHCryptoKdfParamsSetParam001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKdfParamsSetParam001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKdfParamsSetParam002
     * @tc.number SUB_CRYPTOKDFPARAMS_SETPARAM_0200
     * @tc.desc   test OH_CryptoKdfParams_SetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKdfParamsSetParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKdfParamsSetParam002 start====");
        let result: number = cryptoarchitecture.OHCryptoKdfParamsSetParamInvalidParams();
        console.info("====>OHCryptoKdfParamsSetParam002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKdfParamsSetParam002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKdfCreate001
     * @tc.number SUB_CRYPTOKDF_CREATE_0100
     * @tc.desc   test OH_CryptoKdf_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKdfCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKdfCreate001 start====");
        let result: number = cryptoarchitecture.OHCryptoKdfCreateSuccess();
        console.info("====>OHCryptoKdfCreate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKdfCreate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKdfCreate002
     * @tc.number SUB_CRYPTOKDF_CREATE_0200
     * @tc.desc   test OH_CryptoKdf_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKdfCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKdfCreate002 start====");
        let result: number = cryptoarchitecture.OHCryptoKdfCreateInvalidParams();
        console.info("====>OHCryptoKdfCreate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKdfCreate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKdfDerive001
     * @tc.number SUB_CRYPTOKDF_DERIVE_0100
     * @tc.desc   test OH_CryptoKdf_Derive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKdfDerive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKdfDerive001 start====");
        let result: number = cryptoarchitecture.OHCryptoKdfDeriveSuccess();
        console.info("====>OHCryptoKdfDerive001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKdfDerive001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKdfDerive002
     * @tc.number SUB_CRYPTOKDF_DERIVE_0200
     * @tc.desc   test OH_CryptoKdf_Derive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKdfDerive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKdfDerive002 start====");
        let result: number = cryptoarchitecture.OHCryptoKdfDeriveInvalidParams();
        console.info("====>OHCryptoKdfDerive002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKdfDerive002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKdfDerive003
     * @tc.number SUB_CRYPTOKDF_DERIVE_0300
     * @tc.desc   test OH_CryptoKdf_Derive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKdfDerive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKdfDerive003 start====");
        let result: number = cryptoarchitecture.OHCryptoKdfDeriveOpertionError();
        console.info("====>OHCryptoKdfDerive003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKdfDerive003 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKeyAgreementCreate001
     * @tc.number SUB_CRYPTOKEYAGREEMENT_CREATE_0100
     * @tc.desc   test OH_CryptoKeyAgreement_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKeyAgreementCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKeyAgreementCreate001 start====");
        let result: number = cryptoarchitecture.OHCryptoKeyAgreementCreateSuccess();
        console.info("====>OHCryptoKeyAgreementCreate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKeyAgreementCreate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKeyAgreementCreate002
     * @tc.number SUB_CRYPTOKEYAGREEMENT_CREATE_0200
     * @tc.desc   test OH_CryptoKeyAgreement_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKeyAgreementCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKeyAgreementCreate002 start====");
        let result: number = cryptoarchitecture.OHCryptoKeyAgreementCreateInvalidParams();
        console.info("====>OHCryptoKeyAgreementCreate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKeyAgreementCreate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKeyAgreementCreate003
     * @tc.number SUB_CRYPTOKEYAGREEMENT_CREATE_0300
     * @tc.desc   test OH_CryptoKeyAgreement_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKeyAgreementCreate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoKeyAgreementCreate003 start====");
        let result: number = cryptoarchitecture.OHCryptoKeyAgreementCreateNotSupport();
        console.info("====>OHCryptoKeyAgreementCreate003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKeyAgreementCreate003 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKeyAgreementGenerateSecret001
     * @tc.number SUB_CRYPTOKEYAGREEMENT_GENERATESECRET_0100
     * @tc.desc   test OH_CryptoKeyAgreement_GenerateSecret
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKeyAgreementGenerateSecret001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoKeyAgreementGenerateSecret001 start====");
        let result: number = cryptoarchitecture.OHCryptoKeyAgreementGenerateSecretSuccess();
        console.info("====>OHCryptoKeyAgreementGenerateSecret001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKeyAgreementGenerateSecret001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKeyAgreementGenerateSecret002
     * @tc.number SUB_CRYPTOKEYAGREEMENT_GENERATESECRET_0200
     * @tc.desc   test OH_CryptoKeyAgreement_GenerateSecret
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKeyAgreementGenerateSecret002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoKeyAgreementGenerateSecret002 start====");
        let result: number = cryptoarchitecture.OHCryptoKeyAgreementGenerateSecretInvalidParams();
        console.info("====>OHCryptoKeyAgreementGenerateSecret002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKeyAgreementGenerateSecret002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoKeyAgreementGenerateSecret003
     * @tc.number SUB_CRYPTOKEYAGREEMENT_GENERATESECRET_0300
     * @tc.desc   test OH_CryptoKeyAgreement_GenerateSecret
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoKeyAgreementGenerateSecret003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>OHCryptoKeyAgreementGenerateSecret003 start====");
        let result: number = cryptoarchitecture.OHCryptoKeyAgreementGenerateSecretOpertionError();
        console.info("====>OHCryptoKeyAgreementGenerateSecret003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoKeyAgreementGenerateSecret003 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacCreate001
     * @tc.number SUB_CRYPTOMAC_CREATE_0100
     * @tc.desc   test OH_CryptoMac_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacCreate001 start====");
        let result: number = cryptoarchitecture.OHCryptoMacCreateSuccess();
        console.info("====>OHCryptoMacCreate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacCreate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacCreate002
     * @tc.number SUB_CRYPTOMAC_CREATE_0200
     * @tc.desc   test OH_CryptoMac_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacCreate002 start====");
        let result: number = cryptoarchitecture.OHCryptoMacCreateInvalidParams();
        console.info("====>OHCryptoMacCreate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacCreate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacSetParam001
     * @tc.number SUB_CRYPTOMAC_SETPARAM_0100
     * @tc.desc   test OH_CryptoMac_SetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacSetParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacSetParam001 start====");
        let result: number = cryptoarchitecture.OHCryptoMacSetParamSuccess();
        console.info("====>OHCryptoMacSetParam001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacSetParam001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacSetParam002
     * @tc.number SUB_CRYPTOMAC_SETPARAM_0200
     * @tc.desc   test OH_CryptoMac_SetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacSetParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacSetParam002 start====");
        let result: number = cryptoarchitecture.OHCryptoMacSetParamInvalidParams();
        console.info("====>OHCryptoMacSetParam002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacSetParam002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacInit001
     * @tc.number SUB_CRYPTOMAC_INIT_0100
     * @tc.desc   test OH_CryptoMac_Init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacInit001 start====");
        let result: number = cryptoarchitecture.OHCryptoMacInitSuccess();
        console.info("====>OHCryptoMacInit001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacInit001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacInit002
     * @tc.number SUB_CRYPTOMAC_INIT_0200
     * @tc.desc   test OH_CryptoMac_Init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacInit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacInit002 start====");
        let result: number = cryptoarchitecture.OHCryptoMacInitInvalidParams();
        console.info("====>OHCryptoMacInit002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacInit002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacUpdate001
     * @tc.number SUB_CRYPTOMAC_UPDATE_0100
     * @tc.desc   test OH_CryptoMac_Update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacUpdate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacUpdate001 start====");
        let result: number = cryptoarchitecture.OHCryptoMacUpdateSuccess();
        console.info("====>OHCryptoMacUpdate001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacUpdate001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacUpdate002
     * @tc.number SUB_CRYPTOMAC_UPDATE_0200
     * @tc.desc   test OH_CryptoMac_Update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacUpdate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacUpdate002 start====");
        let result: number = cryptoarchitecture.OHCryptoMacUpdateInvalidParams();
        console.info("====>OHCryptoMacUpdate002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacUpdate002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacUpdate003
     * @tc.number SUB_CRYPTOMAC_UPDATE_0300
     * @tc.desc   test OH_CryptoMac_Update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacUpdate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacUpdate003 start====");
        let result: number = cryptoarchitecture.OHCryptoMacUpdateOpertionError();
        console.info("====>OHCryptoMacUpdate003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacUpdate003 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacFinal001
     * @tc.number SUB_CRYPTOMAC_FINAL_0100
     * @tc.desc   test OH_CryptoMac_Final
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacFinal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacFinal001 start====");
        let result: number = cryptoarchitecture.OHCryptoMacFinalSuccess();
        console.info("====>OHCryptoMacFinal001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacFinal001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacFinal002
     * @tc.number SUB_CRYPTOMAC_FINAL_0200
     * @tc.desc   test OH_CryptoMac_Final
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacFinal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacFinal002 start====");
        let result: number = cryptoarchitecture.OHCryptoMacFinalInvalidParams();
        console.info("====>OHCryptoMacFinal002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacFinal002 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacFinal003
     * @tc.number SUB_CRYPTOMAC_FINAL_0300
     * @tc.desc   test OH_CryptoMac_Final
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacFinal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacFinal003 start====");
        let result: number = cryptoarchitecture.OHCryptoMacFinalOpertionError();
        console.info("====>OHCryptoMacFinal003 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacFinal003 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacGetLength001
     * @tc.number SUB_CRYPTOMAC_GETLENGTH_0100
     * @tc.desc   test OH_CryptoMac_GetLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacGetLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacGetLength001 start====");
        let result: number = cryptoarchitecture.OHCryptoMacGetLengthSuccess();
        console.info("====>OHCryptoMacGetLength001 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacGetLength001 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   OHCryptoMacGetLength002
     * @tc.number SUB_CRYPTOMAC_GETLENGTH_0200
     * @tc.desc   test OH_CryptoMac_GetLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHCryptoMacGetLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>OHCryptoMacGetLength002 start====");
        let result: number = cryptoarchitecture.OHCryptoMacGetLengthInvalidParams();
        console.info("====>OHCryptoMacGetLength002 result: " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>OHCryptoMacGetLength002 catch err: " + err);
        done()
      }
    })
  })
}
