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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as specUtil from './utils/common/keyGenSpecUtil';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc';
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc';
import * as compareSpecFunc from './utils/keyGenerate/compareSpecFunc';


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
     * @tc.name Test convertKey with ECC, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName X25519, getEncoded by keyPair, then convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0100", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0100";
      console.log(testNumber + ": started.");
      let param: string = "X25519";
      try {
        let res: boolean = await asyKeyGenPromiseFunc.convertX25519Key(param);
        expect(res).assertTrue();
        console.log(testNumber + ": convertKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0200
     * @tc.name Test convertKey with ECC, Callback style, process success
     * @tc.desc AsyKeyGenerator with algName X25519, getEncoded by keyPair, then convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0200", 0, async (done: Function) => {
      let testNumber: string = "Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0200";
      console.log(testNumber + ": started.");
      let param: string = "X25519";
      try {
        let res: boolean = await asyKeyGenCallbackFunc.convertX25519Key(param);
        expect(res).assertTrue();
        console.log(testNumber + ": convertKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0300
     * @tc.name Test key generate with ECC, Promise style, process success
     * @tc.desc AsyKeyGeneratorBySpec with X25519Spec, generatePubKey by DHCommonParamsSpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0300", 0, async (done: Function) => {
      let testNumber: string = "Security_CryptoFramework_AsyKeyGenerator_DH_Func_0300";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        console.log(testNumber + ": genX25519KeySpec succeed");
        let pubKey: cryptoFramework.PubKey = await asyKeyGenPromiseFunc.genPubKey(spec);
        expect(pubKey != null).assertTrue();
        console.log(testNumber + ": genPubKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0400
     * @tc.name Test key generate bySpec with ECC, Promise style, process success
     * @tc.desc generatePriKey by X25519Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0400", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0400";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        console.log(testNumber + ": genX25519KeySpec succeed");
        let priKey: cryptoFramework.PriKey = await asyKeyGenPromiseFunc.genPriKey(spec);
        expect(priKey != null).assertTrue();
        console.log(testNumber + ": genPriKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0500
     * @tc.name Test key generate with ECC, Callback style, process success
     * @tc.desc AsyKeyGeneratorBySpec with X25519Spec, generatePubKey by DHCommonParamsSpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0500", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0500";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        console.log(testNumber + ": genX25519KeySpec succeed");
        let pubKey: cryptoFramework.PubKey = await asyKeyGenCallbackFunc.genPubKey(spec);
        expect(pubKey != null).assertTrue();
        console.log(testNumber + ": genPubKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0600
     * @tc.name Test key generate bySpec with ECC, Callback style, process success
     * @tc.desc generatePriKey by X25519spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0600", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0600";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        console.log(testNumber + ": genX25519KeySpec succeed");
        let priKey: cryptoFramework.PriKey = await asyKeyGenCallbackFunc.genPriKey(spec);
        expect(priKey != null).assertTrue();
        console.log(testNumber + ": genPriKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0700
     * @tc.name Test key generate bySpec with ECC, Promise style, process success
     * @tc.desc generateKeyPair by X25519spec, getAsyKeySpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0700", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0700";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(testNumber + ": genX25519KeySpec succeed");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log(testNumber + ": genKeyPair succeed");
        let res: boolean = compareSpecFunc.X25519KeyPair(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0800
     * @tc.name Test key generate bySpec with ECC, Callback style, process success
     * @tc.desc generateKeyPair by X25519, getAsyKeySpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0800", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0800";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genX25519KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(testNumber + ": genX25519KeySpec succeed");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(spec);
        console.log(testNumber + ": genKeyPair succeed");
        let res: boolean = compareSpecFunc.X25519KeyPair(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0900
     * @tc.name Test convertKey with ECC, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName Ed25519, getEncoded by keyPair, then convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0900", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0900";
      console.log(testNumber + ": started.");
      let param: string = "Ed25519";
      try {
        let res: boolean = await asyKeyGenPromiseFunc.convertEd25519Key(param);
        expect(res).assertTrue();
        console.log(testNumber + ": convertKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1000
     * @tc.name Test convertKey with ECC, Callback style, process success
     * @tc.desc AsyKeyGenerator with algName Ed25519, getEncoded by keyPair, then convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1000", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1000";
      console.log(testNumber + ": started.");
      let param: string = "Ed25519";
      try {
        let res: boolean = await asyKeyGenCallbackFunc.convertEd25519Key(param);
        expect(res).assertTrue();
        console.log(testNumber + ": convertKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1100
     * @tc.name Test key generate with ECC, Promise style, process success
     * @tc.desc AsyKeyGeneratorBySpec with Ed25519Spec, generatePubKey by DHCommonParamsSpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1100", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1100";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        console.log(testNumber + ": genEd25519KeySpec succeed");
        let pubKey: cryptoFramework.PubKey = await asyKeyGenPromiseFunc.genPubKey(spec);
        expect(pubKey != null).assertTrue();
        console.log(testNumber + ": genPubKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1200
     * @tc.name Test key generate bySpec with ECC, Promise style, process success
     * @tc.desc generatePriKey by Ed25519spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1200", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1200";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        console.log(testNumber + ": genEd25519KeySpec succeed");
        let priKey: cryptoFramework.PriKey = await asyKeyGenPromiseFunc.genPriKey(spec);
        expect(priKey != null).assertTrue();
        console.log(testNumber + ": genPriKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1300
     * @tc.name Test key generate with ECC, Callback style, process success
     * @tc.desc AsyKeyGeneratorBySpec with Ed25519Spec, generatePubKey by DHCommonParamsSpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1300", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1300";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        console.log(testNumber + ": genEd25519KeySpec succeed");
        let pubKey: cryptoFramework.PubKey = await asyKeyGenCallbackFunc.genPubKey(spec);
        expect(pubKey != null).assertTrue();
        console.log(testNumber + ": genPubKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1400
     * @tc.name Test key generate bySpec with ECC, Callback style, process success
     * @tc.desc generatePriKey by Ed25519Spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1400", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_0600";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        console.log(testNumber + ": genEd25519KeySpec succeed");
        let priKey: cryptoFramework.PriKey = await asyKeyGenCallbackFunc.genPriKey(spec);
        expect(priKey != null).assertTrue();
        console.log(testNumber + ": genPriKey succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1500
     * @tc.name Test key generate bySpec with ECC, Promise style, process success
     * @tc.desc generateKeyPair by Ed25519Spec, getAsyKeySpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1500", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1500";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(testNumber + ": genEd25519KeySpec succeed");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(spec);
        console.log(testNumber + ": genKeyPair succeed");
        let res: boolean = compareSpecFunc.Ed25519KeyPair(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1600
     * @tc.name Test key generate bySpec with ECC, Callback style, process success
     * @tc.desc generateKeyPair by Ed25519Spec, getAsyKeySpec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1600", 0, async (done: Function) => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1600";
      console.log(testNumber + ": started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genEd25519KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(testNumber + ": genEd25519KeySpec succeed");
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenCallbackFunc.genKeyPair(spec);
        console.log(testNumber + ": genKeyPair succeed");
        let res: boolean = compareSpecFunc.Ed25519KeyPair(keyPair.priKey, keyPair.pubKey);
        expect(res).assertTrue();
        console.log(testNumber + ": compareSpec succeed");
      } catch (err) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1700
     * @tc.name Test key format/algName with ecc. Promise style. Process success
     * @tc.desc generateKeyPair by X25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1700", 0, async (done: Function) => {
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
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1800
     * @tc.name Test key format/algName with ecc. Promise style. Process success
     * @tc.desc generateKeyPair by X25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_ECC_Func_1800", 0, async (done: Function) => {
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
      console.log(testNumber + ": succeed");
      done();
    });

  })
}