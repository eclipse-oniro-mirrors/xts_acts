/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import  buffer  from '@ohos.buffer';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as rsaTest from './utils/rsa/rsaSignRecoverUtils'
import * as commonUtil from './utils/common/commonUtils';
import * as rsa from './utils/pkcs1Topkcs8/pkcs1topkcs8';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwSignRecoverRSARecoverTestUnit() {
  describe("SecurityCryptoFwSignRecoverRSARecoverTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_0100
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0100
     * @tc.desc   digest is RSA2048|NoPadding|NoHash|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "RSA2048";
      let paddingName: string = "NoPadding";
      let isOnlySign: boolean = true;
      let mdName: string = "NoHash";
      let dataLen: int = 256;
      let isSync: boolean = false;
      let isPadding: boolean = true;
      try {
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_0200
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0200
     * @tc.desc   digest is RSA4096|NoPadding|NoHash|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "RSA8192";
      let paddingName: string = "NoPadding";
      let isOnlySign: boolean = true;
      let mdName: string = "NoHash";
      let dataLen: int = 1024;
      let isSync: boolean = true;
      let isPadding: boolean = true;
      try {
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_0300
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0300
     * @tc.desc   digest is RSA1024|PKCS1|NoHash|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let mdName: string = "NoHash";
        let RSA_PKCS1_PADDING_SIZE: int = 11;
        let dataLen: int = 128 - RSA_PKCS1_PADDING_SIZE;
        let isSync: boolean = false;
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_0400
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0400
     * @tc.desc   digest is RSA2048|PKCS1|NoHash|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let mdName: string = "NoHash";
        let RSA_PKCS1_PADDING_SIZE: int = 11;
        let dataLen: int = 256 - RSA_PKCS1_PADDING_SIZE;
        let isSync: boolean = true;
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_0500
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0500
     * @tc.desc   digest is RSA2048|PKCS1|SHA512|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 64;
        let isSync: boolean = false;
        let mdName: string = "SHA512";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });
	
    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_0600
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0600
     * @tc.desc   digest is RSA512|PKCS1|MD5|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA512";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 16;
        let isSync: boolean = false;
        let mdName: string = "MD5";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_0700
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0700
     * @tc.desc   digest is RSA768|PKCS1|SHA1|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA768";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 20;
        let isSync: boolean = true;
        let mdName: string = "SHA1";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_0800
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0800
     * @tc.desc   digest is RSA1024|PKCS1|SHA224|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 28;
        let isSync: boolean = false;
        let mdName: string = "SHA224";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_0900
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0900
     * @tc.desc   digest is RSA4096|PKCS1|SHA256|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA4096";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 32;
        let isSync: boolean = true;
        let mdName: string = "SHA256";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_1000
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1000
     * @tc.desc   digest is RSA4096|PKCS1|SHA256|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA4096";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 32;
        let isSync: boolean = false;
        let mdName: string = "SHA256";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_1100
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1100
     * @tc.desc   digest is RSA8192|PKCS1|SHA512|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA8192";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 64;
        let isSync: boolean = false;
        let mdName: string = "SHA512";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_1200
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1200
     * @tc.desc   digest is RSA3072|PKCS1|SHA384|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA3072";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 48;
        let isSync: boolean = true;
        let mdName: string = "SHA384";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_1300
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1300
     * @tc.desc   digest is RSA2048|PKCS1|SHA512|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 65;
        let isSync: boolean = true;
        let mdName: string = "SHA512";
        let isPadding: boolean = true;
        await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(null).assertFail();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_1400
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1400
     * @tc.desc   digest is RSA3072|PKCS1|SHA384|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA3072";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 47;
        let isSync: boolean = false;
        let mdName: string = "SHA384";
        let isPadding: boolean = true;
        await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(null).assertFail();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_1500
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1500
     * @tc.desc   digest is RSA1024|PSS|SHA256|MGF1_SHA256|OnlySign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let paddingName = "PSS";
        let isOnlySign: boolean = true;
        let dataLen: int = 32;
        let isSync: boolean = true;
        let mdName: string = "SHA256|MGF1_SHA256";
        let isPadding: boolean = true;
        await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(null).assertFail();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_1600
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1600
     * @tc.desc   digest is SM3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 32;
      let algName: string = "SM2_256";
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      try {
        let signAlg: string = algName + "|SM3|OnlySign";
        await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_1700
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1700
     * @tc.desc   digest is NoPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "RSA1024"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|NoPadding|NoHash|OnlySign";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|NoPadding|Recover";
      try {
        await rsaTest.verifyRSARecoverWithUpdate(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_1800
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1800
     * @tc.desc   digest is NoPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "RSA1024";
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|NoPadding|NoHash|OnlySign";
      try {
        await rsaTest.signPromiseWithUpdate(signAlg, keyPair.priKey, rawData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_1900
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1900
     * @tc.desc   digest is DSA2048|NoPadding|SHA256|Recover
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "DSA2048";
        let paddingName: string = "";
        let isPadding: boolean = false;
        let isOnlySign: boolean = false;
        let dataLen: int = 32;
        let isSync: boolean = false;
        let mdName: string = "SHA256";
        await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(null).assertFail();
      } catch (err) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_2000
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2000
     * @tc.desc   digest is NoPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "ECC_BrainPoolP256t1"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|SHA384";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|SHA384";
      try {
        await rsaTest.verifyRSARecover(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_2100
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2100
     * @tc.desc   digest is NoPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "ECC_BrainPoolP256t1"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|SHA384";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|SHA384";
      try {
        await rsaTest.verifyRSARecoverWithUpdate(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_2200
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2200
     * @tc.desc   digest is NoPadding/Recover
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "ECC_BrainPoolP256t1"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|SHA384";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|SHA384|Recover";
      try {
        await rsaTest.verifyRSARecover(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_2300
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2300
     * @tc.desc   digest is NoPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "RSA4096"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str4096, rsa.priKeyPkcs1Str4096);
      let signAlg: string = algName + "|PSS|MD5|MGF1_MD5";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromiseWithUpdate(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|PSS|MD5|MGF1_MD5|Recover";
      try {
        await rsaTest.verifyRSARecoverWithUpdate(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_2400
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2400
     * @tc.desc   digest is SHA512
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048"
        let data: string = "";
        let dataArray: Uint8Array = commonUtil.stringToUint8Array(data);
        let rawData: cryptoFramework.DataBlob = {
          data: dataArray
        };
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        let signAlg: string = algName + "|PKCS1|SHA512";
        let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
        let verifyAlg: string = algName + "|PKCS1|SHA512|Recover";
        let verifyData: cryptoFramework.DataBlob | null = await rsaTest.verifyRSARecover(verifyAlg, keyPair.pubKey, signData);
        let mdData = await rsaTest.doMd("SHA512", rawData);
        if (verifyData != null) {
          let ret: boolean = commonUtil.compareDataBlob(verifyData, mdData);
          expect(ret).assertTrue();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_2500
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2500
     * @tc.desc   digest is NoPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "ECC_BrainPoolP256t1"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|SHA256";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|SHA256";
      try {
        await rsaTest.verifyRSARecover(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_2600
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2600
     * @tc.desc   digest is NoPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "ECC_BrainPoolP256t1"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|SHA256|OnlySign";
      try {
        await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_2700
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2700
     * @tc.desc   digest is NoPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "Ed25519"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName;
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName;
      try {
        await rsaTest.verifyRSARecover(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSASignRecover_Func_2800
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2800
     * @tc.desc   digest is NoPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024"
        let data: number[] = [
          0x57, 0x0d, 0x63, 0x63, 0x4e, 0x86, 0xee, 0xf9, 0x55, 0x4f, 0x81, 0x18, 0x55, 0xba, 0x68, 0xa8,
          0x55, 0xff, 0xf6, 0x30, 0x62, 0x9a, 0x73, 0xf5, 0x9e, 0x61, 0xd4, 0xe9, 0x6c, 0xf2, 0xc8, 0x1c,
          0x00, 0x1e, 0x1d, 0xbf, 0x2b, 0x4d, 0x0c, 0x08, 0xd0, 0x38, 0xc8, 0xf0, 0x47, 0x05, 0xd6, 0x5b,
          0xce, 0x22, 0xaa, 0xe7, 0xbb, 0x73, 0xb1, 0x0c, 0xbe, 0xf0, 0x71, 0xb2, 0x46, 0x94, 0xca, 0x35,
          0xfa, 0xd1, 0x86, 0x22, 0x2d, 0x31, 0x8c, 0x2b, 0xb9, 0xfc, 0x89, 0x62, 0x45, 0x66, 0xa8, 0x7b,
          0x06, 0x13, 0x7f, 0x9d, 0x69, 0xb4, 0x70, 0x4b, 0x66, 0xa0, 0x12, 0x70, 0xcc, 0x71, 0x9d, 0x9c,
          0x8f, 0x55, 0x63, 0x95, 0x1f, 0x46, 0xd0, 0x4f, 0x6c, 0xf7, 0x76, 0xc4, 0xb0, 0x4d, 0x13, 0x63,
          0xfe, 0x9a, 0xb5, 0x31, 0x62, 0x87, 0xc7, 0xe3, 0x6e, 0x94, 0x58, 0x7f, 0xae, 0xae, 0xdc, 0xd7
        ];
        let pubKey: string = "-----BEGIN PUBLIC KEY-----\n" +
          "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDi9zW7r2rXcswcK8KEkOAil2Fc\n" +
          "D5y2f2SFcPj+WmxphLkICcpnMArvgin+LRZwjBjC5USmCCSjQMOmWKgKdiNT84S2\n" +
          "fQ6nG3V/iafXse9R941kM3Rfed4XjckXlrFM28gkO4d2ItahZQwrQm199JQxDsXH\n" +
          "cxbIBZqEMH02yW2SkwIDAQAB\n" +
          "-----END PUBLIC KEY-----";
        let signData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let verifyAlg: string = "RSA1024|PKCS1|NoHash|Recover";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(pubKey, null);
        let verifier1: cryptoFramework.Verify = cryptoFramework.createVerify(verifyAlg);
        await verifier1.init(keyPair.pubKey);
        let rawSignData: cryptoFramework.DataBlob|null = await verifier1.recover(signData);
        expect(rawSignData).assertNull();
        let verifier2: cryptoFramework.Verify = cryptoFramework.createVerify(verifyAlg);
        await verifier2.init(keyPair.pubKey);
        rawSignData = verifier2.recoverSync(signData);
        expect(rawSignData).assertNull();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  })
}