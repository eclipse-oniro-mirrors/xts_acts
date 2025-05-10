/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as specUtil from './utils/common/keyGenSpecUtil';
import { AsyAlgName } from './utils/common/keyGenSpecUtil';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc';
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc';
import * as compareSpecFunc from './utils/keyGenerate/compareSpecFunc';
import * as signVerifyPromise from './utils/signVerify/signVerifyAsyPromiseFunc';
import * as agreementPromise from './utils/agreement/agreementAsyPromiseFunc';

export default function SecurityCryptoFwKeyGenerateECCTestUnit() {
  describe('SecurityCryptoFwKeyGenerateECCTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0100
     * @tc.name test convertKey with ECC, promise style, process success
     * @tc.desc AsyKeyGenerator with algName X25519, getEncoded by keyPair, then convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0100";
      console.log(testNumber + ": started.");
      let param: string = "X25519";
      try {
        let res: boolean = await asyKeyGenPromiseFunc.convertX25519Key(param);
        expect(res).assertTrue();
        console.log(testNumber + ": convertKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0200
     * @tc.name test convertKey with ECC, callback style, process success
     * @tc.desc AsyKeyGenerator with algName X25519, getEncoded by keyPair, then convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0200";
      console.log(testNumber + ": started.");
      let param: string = "X25519";
      try {
        let res: boolean = await asyKeyGenCallbackFunc.convertX25519Key(param);
        expect(res).assertTrue();
        console.log(testNumber + ": convertKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0300
     * @tc.name test key generate with ECC, promise style, process success
     * @tc.desc AsyKeyGeneratorBySpec with X25519Spec, generatePubKey by DHCommonParamsSpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "Security_CryptoFramework_AsyKeyGenerator_DH_Func_0300";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        console.log(testNumber + ": genX25519KeySpec success");
        let pubKey: cryptoFramework.PubKey = await asyKeyGenPromiseFunc.genPubKey(spec);
        expect(pubKey != null).assertTrue();
        console.log(testNumber + ": genPubKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0400
     * @tc.name test key generate bySpec with ECC, promise style, process success
     * @tc.desc generatePriKey by X25519Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0400";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        console.log(testNumber + ": genX25519KeySpec success");
        let priKey: cryptoFramework.PriKey = await asyKeyGenPromiseFunc.genPriKey(spec);
        expect(priKey != null).assertTrue();
        console.log(testNumber + ": genPriKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0500
     * @tc.name test key generate with ECC, callback style, process success
     * @tc.desc AsyKeyGeneratorBySpec with X25519Spec, generatePubKey by DHCommonParamsSpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0500";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        console.log(testNumber + ": genX25519KeySpec success");
        let pubKey: cryptoFramework.PubKey = await asyKeyGenCallbackFunc.genPubKey(spec);
        expect(pubKey != null).assertTrue();
        console.log(testNumber + ": genPubKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0600
     * @tc.name test key generate bySpec with ECC, callback style, process success
     * @tc.desc generatePriKey by X25519spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0600";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        console.log(testNumber + ": genX25519KeySpec success");
        let priKey: cryptoFramework.PriKey = await asyKeyGenCallbackFunc.genPriKey(spec);
        expect(priKey != null).assertTrue();
        console.log(testNumber + ": genPriKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0700
     * @tc.name test key generate bySpec with ECC, promise style, process success
     * @tc.desc generateKeyPair by X25519spec, getAsyKeySpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0700";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(testNumber + ": genX25519KeySpec success");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log(testNumber + ": genKeyPair success");
        let res: boolean = compareSpecFunc.X25519KeyPair(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0800
     * @tc.name test key generate bySpec with ECC, callback style, process success
     * @tc.desc generateKeyPair by X25519, getAsyKeySpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0800";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(testNumber + ": genX25519KeySpec success");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(spec);
        console.log(testNumber + ": genKeyPair success");
        let res: boolean = compareSpecFunc.X25519KeyPair(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0900
     * @tc.name test convertKey with ECC, promise style, process success
     * @tc.desc AsyKeyGenerator with algName Ed25519, getEncoded by keyPair, then convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0900";
      console.log(testNumber + ": started.");
      let param: string = "Ed25519";
      try {
        let res: boolean = await asyKeyGenPromiseFunc.convertEd25519Key(param);
        expect(res).assertTrue();
        console.log(testNumber + ": convertKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1000
     * @tc.name test convertKey with ECC, callback style, process success
     * @tc.desc AsyKeyGenerator with algName Ed25519, getEncoded by keyPair, then convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1000";
      console.log(testNumber + ": started.");
      let param: string = "Ed25519";
      try {
        let res: boolean = await asyKeyGenCallbackFunc.convertEd25519Key(param);
        expect(res).assertTrue();
        console.log(testNumber + ": convertKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1100
     * @tc.name test key generate with ECC, promise style, process success
     * @tc.desc AsyKeyGeneratorBySpec with Ed25519Spec, generatePubKey by DHCommonParamsSpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1100";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        console.log(testNumber + ": genEd25519KeySpec success");
        let pubKey: cryptoFramework.PubKey = await asyKeyGenPromiseFunc.genPubKey(spec);
        expect(pubKey != null).assertTrue();
        console.log(testNumber + ": genPubKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1200
     * @tc.name test key generate bySpec with ECC, promise style, process success
     * @tc.desc generatePriKey by Ed25519spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1200";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        console.log(testNumber + ": genEd25519KeySpec success");
        let priKey: cryptoFramework.PriKey = await asyKeyGenPromiseFunc.genPriKey(spec);
        expect(priKey != null).assertTrue();
        console.log(testNumber + ": genPriKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1300
     * @tc.name test key generate with ECC, callback style, process success
     * @tc.desc AsyKeyGeneratorBySpec with Ed25519Spec, generatePubKey by DHCommonParamsSpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1300";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        console.log(testNumber + ": genEd25519KeySpec success");
        let pubKey: cryptoFramework.PubKey = await asyKeyGenCallbackFunc.genPubKey(spec);
        expect(pubKey != null).assertTrue();
        console.log(testNumber + ": genPubKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1400
     * @tc.name test key generate bySpec with ECC, callback style, process success
     * @tc.desc generatePriKey by Ed25519Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0600";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        console.log(testNumber + ": genEd25519KeySpec success");
        let priKey: cryptoFramework.PriKey = await asyKeyGenCallbackFunc.genPriKey(spec);
        expect(priKey != null).assertTrue();
        console.log(testNumber + ": genPriKey success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1500
     * @tc.name test key generate bySpec with ECC, promise style, process success
     * @tc.desc generateKeyPair by Ed25519Spec, getAsyKeySpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1500";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(testNumber + ": genEd25519KeySpec success");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log(testNumber + ": genKeyPair success");
        let res: boolean = compareSpecFunc.Ed25519KeyPair(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1600
     * @tc.name test key generate bySpec with ECC, callback style, process success
     * @tc.desc generateKeyPair by Ed25519Spec, getAsyKeySpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1600";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(testNumber + ": genEd25519KeySpec success");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(spec);
        console.log(testNumber + ": genKeyPair success");
        let res: boolean = compareSpecFunc.Ed25519KeyPair(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec success");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1700
     * @tc.name test key format/algName with ecc. Promise style, process success
     * @tc.desc generateKeyPair by X25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1700";
      console.log(testNumber + ": started.");
      let keyAlg: string = "X25519";
      try {
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(keyAlg);
        expect(keyPair.pubKey.format == "X.509").assertTrue();
        expect(keyPair.pubKey.algName == "X25519").assertTrue();
        expect(keyPair.priKey.format == "PKCS#8").assertTrue();
        expect(keyPair.priKey.algName == "X25519").assertTrue();
      } catch (err) {
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1800
     * @tc.name test key format/algName with ecc. Promise style, process success
     * @tc.desc generateKeyPair by X25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1800";
      console.log(testNumber + ": started");
      let keyAlg: string = "Ed25519";
      try {
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(keyAlg);
        expect(keyPair.pubKey.format == "X.509").assertTrue();
        expect(keyPair.pubKey.algName == "Ed25519").assertTrue();
        expect(keyPair.priKey.format == "PKCS#8").assertTrue();
        expect(keyPair.priKey.algName == "Ed25519").assertTrue();
      } catch (err) {
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1900
     * @tc.name test ecc key getEncodedDer to compressed format, process success
     * @tc.desc generateKeyPair by ecc
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1900";
      console.log(testNumber + ": started");
      let algNames: AsyAlgName[] = [AsyAlgName.ECC224, AsyAlgName.ECC256, AsyAlgName.ECC384, AsyAlgName.ECC521];
      let format: string = "X509|COMPRESSED";
      try {
        for (let i = 0; i < algNames.length; i++) {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algNames[i]);
          let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algNames[i], cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
          let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
          let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
          let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          expect(pubData.data.toString()).assertEqual(specUtil.compressedKeyBlob(algNames[i]).data.toString());
          console.log(testNumber + `: ${algNames[i]} getEncodedDer success`);
          let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
          let res: boolean = compareSpecFunc.ECCKey(keyPair, postKeyPair);
          expect(res).assertEqual(true);
        }
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2000
     * @tc.name test brainPool key getEncodedDer to compressed format, process success
     * @tc.desc generateKeyPair by brainPool
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2000";
      console.log(testNumber + ": started");
      let algNames: AsyAlgName[] = [AsyAlgName.P160r1, AsyAlgName.P160t1, AsyAlgName.P192r1, AsyAlgName.P192t1,
        AsyAlgName.P224r1, AsyAlgName.P224t1, AsyAlgName.P256r1, AsyAlgName.P256t1, AsyAlgName.P320r1,
        AsyAlgName.P320t1, AsyAlgName.P384r1, AsyAlgName.P384t1, AsyAlgName.P512r1, AsyAlgName.P512t1];
      let format: string = "X509|COMPRESSED";
      try {
        for (let i = 0; i < algNames.length; i++) {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algNames[i]);
          let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algNames[i], cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
          let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
          let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
          let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          expect(pubData.data.toString()).assertEqual(specUtil.compressedKeyBlob(algNames[i]).data.toString());
          console.log(testNumber + `: ${algNames[i]} getEncodedDer success`);
          let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
          let res: boolean = compareSpecFunc.ECCKey(keyPair, postKeyPair);
          expect(res).assertEqual(true);
        }
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2100
     * @tc.name test ecc key getEncodedDer to unCompressed format, process success
     * @tc.desc generateKeyPair by ecc
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2100";
      console.log(testNumber + ": started");
      let algNames: AsyAlgName[] = [AsyAlgName.ECC224, AsyAlgName.ECC256, AsyAlgName.ECC384, AsyAlgName.ECC521];
      let format: string = "X509|UNCOMPRESSED";
      try {
        for (let i = 0; i < algNames.length; i++) {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algNames[i]);
          let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algNames[i], cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
          let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
          let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
          let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          expect(pubData.data.toString()).assertEqual(specUtil.unCompressedKeyBlob(algNames[i]).data.toString());
          console.log(testNumber + `: ${algNames[i]} getEncodedDer success`);
          let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
          let res: boolean = compareSpecFunc.ECCKey(keyPair, postKeyPair);
          expect(res).assertEqual(true);
        }
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2200
     * @tc.name test brainPool key getEncodedDer to unCompressed format, process success
     * @tc.desc generateKeyPair by brainPool
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2200";
      console.log(testNumber + ": started");
      let algNames: AsyAlgName[] = [AsyAlgName.P160r1, AsyAlgName.P160t1, AsyAlgName.P192r1, AsyAlgName.P192t1,
        AsyAlgName.P224r1, AsyAlgName.P224t1, AsyAlgName.P256r1, AsyAlgName.P256t1, AsyAlgName.P320r1,
        AsyAlgName.P320t1, AsyAlgName.P384r1, AsyAlgName.P384t1, AsyAlgName.P512r1, AsyAlgName.P512t1];
      let format: string = "X509|UNCOMPRESSED";
      try {
        for (let i = 0; i < algNames.length; i++) {
          let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algNames[i]);
          let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algNames[i], cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
          let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
          let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
          let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
          expect(pubData.data.toString()).assertEqual(specUtil.unCompressedKeyBlob(algNames[i]).data.toString());
          console.log(testNumber + `: ${algNames[i]} getEncodedDer success`);
          let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
          let res: boolean = compareSpecFunc.ECCKey(keyPair, postKeyPair);
          expect(res).assertEqual(true);
        }
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2300
     * @tc.name test convert unCompressed brainPoolP256r1 key to signVerify, process success
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2300";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = specUtil.unCompressedKeyBlob(algName);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
        let res: boolean = await signVerifyPromise.keyPairProcess(algName + "|SHA256", postKeyPair);
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2400
     * @tc.name test convert compressed brainPoolP256r1 key to agreement, process success
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2400";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = specUtil.unCompressedKeyBlob(algName);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
        let res: boolean = await agreementPromise.keyPairProcess(algName, postKeyPair.priKey, postKeyPair.pubKey);
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2500
     * @tc.name test getEncodedDer with unsupported sm2 key and unCompressed format, process fail
     * @tc.desc generateKeyPair by sm2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2500";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.SM2;
      let format: string = "X509|UNCOMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        keyPair.pubKey.getEncodedDer(format);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.INVALID_PARAMS).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2600
     * @tc.name test getEncodedDer with unsupported rsa key and compressed format, process fail
     * @tc.desc generateKeyPair by rsa
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2600";
      console.log(testNumber + ": started");
      let algName: string = "RSA512";
      let format: string = "X509|COMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        keyPair.pubKey.getEncodedDer(format);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.INVALID_PARAMS).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2700
     * @tc.name test getEncodedDer with error format, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2700";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "COMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        keyPair.pubKey.getEncodedDer(format);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.INVALID_PARAMS).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2800
     * @tc.name test getEncodedDer with empty format, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2800";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        keyPair.pubKey.getEncodedDer(format);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.INVALID_PARAMS).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2900
     * @tc.name test convertKey unCompressed key with different generator, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_2900";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let errAlgName: AsyAlgName = AsyAlgName.P256t1;
      let format: string = "X509|COMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(errAlgName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(pubData.data.toString()).assertEqual(specUtil.compressedKeyBlob(algName).data.toString());
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
        let preCurveName = keyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_CURVE_NAME_STR);
        let postCurveName = postKeyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_CURVE_NAME_STR);
        expect(preCurveName).not().assertEqual(postCurveName);
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3000
     * @tc.name test convertKey with error compressed key, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3000";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "X509|COMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(pubData.data.toString()).assertEqual(specUtil.compressedKeyBlob(algName).data.toString());
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        pubData.data[0] = 49;
        let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3100
     * @tc.name test convertKey with error compressed key, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3100";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "X509|COMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(pubData.data.toString()).assertEqual(specUtil.compressedKeyBlob(algName).data.toString());
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        pubData.data[27] = 4;
        let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3200
     * @tc.name test convertKey with error compressed key, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3200";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "X509|COMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(pubData.data.toString()).assertEqual(specUtil.compressedKeyBlob(algName).data.toString());
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        pubData.data = pubData.data.slice(0, pubData.data.length - 1);
        let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3300
     * @tc.name test convert unCompressed key with different generator, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3300";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let errAlgName: AsyAlgName = AsyAlgName.P256t1;
      let format: string = "X509|UNCOMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(errAlgName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(pubData.data.toString()).assertEqual(specUtil.unCompressedKeyBlob(algName).data.toString());
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
        let preCurveName = keyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_CURVE_NAME_STR);
        let postCurveName = postKeyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_CURVE_NAME_STR);
        expect(preCurveName).not().assertEqual(postCurveName);
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3400
     * @tc.name test convertKey with error unCompressed brainPoolP256r1 key, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3400";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "X509|UNCOMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(pubData.data.toString()).assertEqual(specUtil.unCompressedKeyBlob(algName).data.toString());
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        pubData.data[0] = 49;
        let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3500
     * @tc.name test convertKey with error unCompressed brainPoolP256r1 key, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3500";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "X509|UNCOMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(pubData.data.toString()).assertEqual(specUtil.unCompressedKeyBlob(algName).data.toString());
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        pubData.data[27] = 2;
        let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3600
     * @tc.name test convertKey with error unCompressed brainPoolP256r1 key, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3600";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "X509|UNCOMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(pubData.data.toString()).assertEqual(specUtil.unCompressedKeyBlob(algName).data.toString());
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        pubData.data = pubData.data.slice(0, pubData.data.length - 1);
        let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3700
     * @tc.name test convertKey with error unCompressed brainPoolP256r1 key, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3700";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "X509|UNCOMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(pubData.data.toString()).assertEqual(specUtil.unCompressedKeyBlob(algName).data.toString());
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        pubData.data[28] = 0;
        let postKeyPair: cryptoFramework.KeyPair = await generator.convertKey(pubData, priData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3800
     * @tc.name test getEncodedPoint with ecc point and compressed format, process success
     * @tc.desc generateKeyPair by ecc
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3800";
      console.log(testNumber + ": started");
      let algNames: AsyAlgName[] = [AsyAlgName.ECC224, AsyAlgName.ECC256, AsyAlgName.ECC384, AsyAlgName.ECC521];
      let format: string = "COMPRESSED";
      try {
        for (let i = 0; i < algNames.length; i++) {
          let point: cryptoFramework.Point = specUtil.pkPoint(algNames[i]);
          let pointData: Uint8Array = cryptoFramework.ECCKeyUtil.getEncodedPoint(specUtil.curveName(algNames[i]), point, format);
          expect(pointData.toString()).assertEqual(specUtil.compressedPointData(algNames[i]).toString());
          console.log(testNumber + `: ${algNames[i]} getEncodedPoint success`);
          let postPoint: cryptoFramework.Point = cryptoFramework.ECCKeyUtil.convertPoint(specUtil.curveName(algNames[i]), pointData);
          console.log(testNumber + `: ${algNames[i]} convertPoint success`);
          expect(postPoint.x).assertEqual(point.x);
          expect(postPoint.y).assertEqual(point.y);
        }
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3900
     * @tc.name test getEncodedPoint with brainPool point and compressed format, process success
     * @tc.desc generateKeyPair by brainPool
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_3900";
      console.log(testNumber + ": started");
      let algNames: AsyAlgName[] = [AsyAlgName.P160r1, AsyAlgName.P160t1, AsyAlgName.P192r1, AsyAlgName.P192t1,
        AsyAlgName.P224r1, AsyAlgName.P224t1, AsyAlgName.P256r1, AsyAlgName.P256t1, AsyAlgName.P320r1,
        AsyAlgName.P320t1, AsyAlgName.P384r1, AsyAlgName.P384t1, AsyAlgName.P512r1, AsyAlgName.P512t1];
      let format: string = "COMPRESSED";
      try {
        for (let i = 0; i < algNames.length; i++) {
          let point: cryptoFramework.Point = specUtil.pkPoint(algNames[i]);
          let pointData: Uint8Array = cryptoFramework.ECCKeyUtil.getEncodedPoint(specUtil.curveName(algNames[i]), point, format);
          expect(pointData.toString()).assertEqual(specUtil.compressedPointData(algNames[i]).toString());
          console.log(testNumber + `: ${algNames[i]} getEncodedPoint success`);
          let postPoint: cryptoFramework.Point = cryptoFramework.ECCKeyUtil.convertPoint(specUtil.curveName(algNames[i]), pointData);
          console.log(testNumber + `: ${algNames[i]} convertPoint success`);
          expect(postPoint.x).assertEqual(point.x);
          expect(postPoint.y).assertEqual(point.y);
        }
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4000
     * @tc.name test getEncodedPoint with sm2 point and compressed format, process success
     * @tc.desc generateKeyPair by sm2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4000";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.SM2;
      let format: string = "COMPRESSED";
      try {
        let point: cryptoFramework.Point = specUtil.pkPoint(algName);
        let pointData: Uint8Array = cryptoFramework.ECCKeyUtil.getEncodedPoint(specUtil.curveName(algName), point, format);
        expect(pointData.toString()).assertEqual(specUtil.compressedPointData(algName).toString());
        console.log(testNumber + `: ${algName} getEncodedPoint success`);
        let postPoint: cryptoFramework.Point = cryptoFramework.ECCKeyUtil.convertPoint(specUtil.curveName(algName), pointData);
        console.log(testNumber + `: ${algName} convertPoint success`);
        expect(postPoint.x).assertEqual(point.x);
        expect(postPoint.y).assertEqual(point.y);
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4100
     * @tc.name test getEncodedPoint with ecc point and unCompressed format, process success
     * @tc.desc generateKeyPair by ecc
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4100";
      console.log(testNumber + ": started");
      let algNames: AsyAlgName[] = [AsyAlgName.ECC224, AsyAlgName.ECC256, AsyAlgName.ECC384, AsyAlgName.ECC521];
      let format: string = "UNCOMPRESSED";
      try {
        for (let i = 0; i < algNames.length; i++) {
          let point: cryptoFramework.Point = specUtil.pkPoint(algNames[i]);
          let pointData: Uint8Array = cryptoFramework.ECCKeyUtil.getEncodedPoint(specUtil.curveName(algNames[i]), point, format);
          expect(pointData.toString()).assertEqual(specUtil.unCompressedPointData(algNames[i]).toString());
          console.log(testNumber + `: ${algNames[i]} getEncodedPoint success`);
          let postPoint: cryptoFramework.Point = cryptoFramework.ECCKeyUtil.convertPoint(specUtil.curveName(algNames[i]), pointData);
          console.log(testNumber + `: ${algNames[i]} convertPoint success`);
          expect(postPoint.x).assertEqual(point.x);
          expect(postPoint.y).assertEqual(point.y);
        }
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4200
     * @tc.name test getEncodedPoint with brainPool point and unCompressed format, process success
     * @tc.desc generateKeyPair by brainPool
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4200";
      console.log(testNumber + ": started");
      let algNames: AsyAlgName[] = [AsyAlgName.P160r1, AsyAlgName.P160t1, AsyAlgName.P192r1, AsyAlgName.P192t1,
        AsyAlgName.P224r1, AsyAlgName.P224t1, AsyAlgName.P256r1, AsyAlgName.P256t1, AsyAlgName.P320r1,
        AsyAlgName.P320t1, AsyAlgName.P384r1, AsyAlgName.P384t1, AsyAlgName.P512r1, AsyAlgName.P512t1];
      let format: string = "UNCOMPRESSED";
      try {
        for (let i = 0; i < algNames.length; i++) {
          let point: cryptoFramework.Point = specUtil.pkPoint(algNames[i]);
          let pointData: Uint8Array = cryptoFramework.ECCKeyUtil.getEncodedPoint(specUtil.curveName(algNames[i]), point, format);
          expect(pointData.toString()).assertEqual(specUtil.unCompressedPointData(algNames[i]).toString());
          console.log(testNumber + `: ${algNames[i]} getEncodedPoint success`);
          let postPoint: cryptoFramework.Point = cryptoFramework.ECCKeyUtil.convertPoint(specUtil.curveName(algNames[i]), pointData);
          console.log(testNumber + `: ${algNames[i]} convertPoint success`);
          expect(postPoint.x).assertEqual(point.x);
          expect(postPoint.y).assertEqual(point.y);
        }
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4300
     * @tc.name test getEncodedPoint with sm2 point and unCompressed format, process success
     * @tc.desc generateKeyPair by sm2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4300";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.SM2;
      let format: string = "UNCOMPRESSED";
      try {
        let point: cryptoFramework.Point = specUtil.pkPoint(algName);
        let pointData: Uint8Array = cryptoFramework.ECCKeyUtil.getEncodedPoint(specUtil.curveName(algName), point, format);
        expect(pointData.toString()).assertEqual(specUtil.unCompressedPointData(algName).toString());
        console.log(testNumber + `: ${algName} getEncodedPoint success`);
        let postPoint: cryptoFramework.Point = cryptoFramework.ECCKeyUtil.convertPoint(specUtil.curveName(algName), pointData);
        console.log(testNumber + `: ${algName} convertPoint success`);
        expect(postPoint.x).assertEqual(point.x);
        expect(postPoint.y).assertEqual(point.y);
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4400
     * @tc.name test getEncodedPoint with unCompressed format and error curveName, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4400";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let errAlgName: string = "RSA512";
      let format: string = "UNCOMPRESSED";
      try {
        let point: cryptoFramework.Point = specUtil.pkPoint(algName);
        cryptoFramework.ECCKeyUtil.getEncodedPoint(errAlgName, point, format);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.INVALID_PARAMS).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4500
     * @tc.name test getEncodedPoint with unCompressed format and different curveName, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4500";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let errAlgName: string = "NID_brainpoolP256t1";
      let format: string = "UNCOMPRESSED";
      try {
        let point: cryptoFramework.Point = specUtil.pkPoint(algName);
        cryptoFramework.ECCKeyUtil.getEncodedPoint(errAlgName, point, format);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4600
     * @tc.name test getEncodedPoint with unCompressed format and empty curveName, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4600";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let errAlgName: string = "";
      let format: string = "UNCOMPRESSED";
      try {
        let point: cryptoFramework.Point = specUtil.pkPoint(algName);
        cryptoFramework.ECCKeyUtil.getEncodedPoint(errAlgName, point, format);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.INVALID_PARAMS).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4700
     * @tc.name test getEncodedPoint with unCompressed format and error curveName, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4700";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let errAlgName: string = "errTest";
      let format: string = "UNCOMPRESSED";
      try {
        let point: cryptoFramework.Point = specUtil.pkPoint(algName);
        cryptoFramework.ECCKeyUtil.getEncodedPoint(errAlgName, point, format);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.INVALID_PARAMS).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4800
     * @tc.name test getEncodedPoint with empty format, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4800";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "";
      try {
        let point: cryptoFramework.Point = specUtil.pkPoint(algName);
        let pointData: Uint8Array = cryptoFramework.ECCKeyUtil.getEncodedPoint(specUtil.curveName(algName), point, format);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.INVALID_PARAMS).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4900
     * @tc.name test getEncodedPoint with error format, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_4900";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "errTest";
      try {
        let point: cryptoFramework.Point = specUtil.pkPoint(algName);
        let pointData: Uint8Array = cryptoFramework.ECCKeyUtil.getEncodedPoint(specUtil.curveName(algName), point, format);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.INVALID_PARAMS).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5000
     * @tc.name test getEncodedPoint with unCompressed format and error x value, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5000";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "UNCOMPRESSED";
      try {
        let point: cryptoFramework.Point = specUtil.pkPoint(algName);
        point.x++;
        cryptoFramework.ECCKeyUtil.getEncodedPoint(specUtil.curveName(algName), point, format);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5100
     * @tc.name test convertPoint with compressed format and different curveName, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5100";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let errAlgName: string = specUtil.curveName(AsyAlgName.P256t1);
      try {
        let pointData: Uint8Array = specUtil.compressedPointData(algName);
        cryptoFramework.ECCKeyUtil.convertPoint(errAlgName, pointData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5200
     * @tc.name test convertPoint with compressed format and empty curveName, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5200";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let errAlgName: string = "";
      try {
        let pointData: Uint8Array = specUtil.compressedPointData(algName);
        cryptoFramework.ECCKeyUtil.convertPoint(errAlgName, pointData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.INVALID_PARAMS).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5300
     * @tc.name test convertPoint with compressed format and error curveName, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5300";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let errAlgName: string = "errTest";
      try {
        let pointData: Uint8Array = specUtil.compressedPointData(algName);
        cryptoFramework.ECCKeyUtil.convertPoint(errAlgName, pointData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.INVALID_PARAMS).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5400
     * @tc.name test convertPoint with error compressed point, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5400";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      try {
        let pointData: Uint8Array = specUtil.compressedPointData(algName);
        pointData[0] = 4;
        cryptoFramework.ECCKeyUtil.convertPoint(specUtil.curveName(algName), pointData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5500
     * @tc.name test convertPoint with error compressed point, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5500";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      try {
        let pointData: Uint8Array = specUtil.compressedPointData(algName);
        pointData = pointData.slice(0, pointData.length - 1);
        cryptoFramework.ECCKeyUtil.convertPoint(specUtil.curveName(algName), pointData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5600
     * @tc.name test convertPoint with unCompressed format and different curveName, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5600";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let errAlgName: string = specUtil.curveName(AsyAlgName.P256t1);
      try {
        let pointData: Uint8Array = specUtil.unCompressedPointData(algName);
        cryptoFramework.ECCKeyUtil.convertPoint(errAlgName, pointData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5700
     * @tc.name test convertPoint with error unCompressed point, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5700";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      try {
        let pointData: Uint8Array = specUtil.unCompressedPointData(algName);
        pointData[1] = 0;
        cryptoFramework.ECCKeyUtil.convertPoint(specUtil.curveName(algName), pointData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5800
     * @tc.name test convertPoint with error unCompressed point, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5800";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      try {
        let pointData: Uint8Array = specUtil.unCompressedPointData(algName);
        pointData[0] = 2;
        cryptoFramework.ECCKeyUtil.convertPoint(specUtil.curveName(algName), pointData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5900
     * @tc.name test convertPoint with error unCompressed point, process fail
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_5900";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      try {
        let pointData: Uint8Array = specUtil.unCompressedPointData(algName);
        let tmpArr = new Uint8Array(pointData.length + 1);
        tmpArr.set(pointData);
        tmpArr[pointData.length] = 0;
        pointData = tmpArr;
        cryptoFramework.ECCKeyUtil.convertPoint(specUtil.curveName(algName), pointData);
        expect(null).assertFail();
      } catch (err) {
        expect(cryptoFramework.Result.ERR_CRYPTO_OPERATION).assertEqual(err.code);
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_6000
     * @tc.name test convertKeySync with unCompressed format,  process success
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_6000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_6000";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "X509|UNCOMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(pubData.data.toString()).assertEqual(specUtil.unCompressedKeyBlob(algName).data.toString());
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        let postKeyPair: cryptoFramework.KeyPair = generator.convertKeySync(pubData, priData);
        let res: boolean = compareSpecFunc.ECCKey(keyPair, postKeyPair);
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_6100
     * @tc.name test convertKeySync with unCompressed format, callback style, process success
     * @tc.desc generateKeyPair by brainPoolP256r1
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_6100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_6100";
      console.log(testNumber + ": started");
      let algName: AsyAlgName = AsyAlgName.P256r1;
      let format: string = "X509|UNCOMPRESSED";
      try {
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let spec: cryptoFramework.AsyKeySpec = specUtil.genAsyKeySpec(algName, cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        let pubData: cryptoFramework.DataBlob = keyPair.pubKey.getEncodedDer(format);
        let priData: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();
        expect(pubData.data.toString()).assertEqual(specUtil.unCompressedKeyBlob(algName).data.toString());
        console.log(testNumber + `: ${algName} getEncodedDer success`);
        generator.convertKey(pubData, priData, (err, data) => {
          if (err) {
            console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
            expect(null).assertFail();
          } else {
            let res: boolean = compareSpecFunc.ECCKey(keyPair, data);
            expect(res).assertEqual(true);
            console.log(testNumber + ": success");
            done();
          }
        });
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

  }
  )
}