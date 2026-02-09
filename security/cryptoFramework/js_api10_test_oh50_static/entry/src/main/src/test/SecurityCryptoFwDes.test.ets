/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { convertSymKey, DES64_KEY_SIZE,
  DES64_MODE,
  DES64_PADDING,
  DES64_WEAK_KEYS,
  doCipher,
  doUpdatePromise,
  doUpdateSync,
  generateRandom, generateSymKey,
  parityCheck } from './utils/syncSymKey/syncSymKeyUtils';
import { asyncType, compareDataBlob, createData } from './utils/common/commonUtils';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


async function doGenDes64Stub(mode: string): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:int = 0;
  let intervalTime = 1000;
  let ret: boolean = true;
  timeoutId = setInterval(() => {
    timeFlag = true;
  }, 1000 * 2);
  while (!timeFlag) {
    try {
      let algName: string = "DES64";
      let symKeySync: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_SYNC);
      let keyDataSync: cryptoFramework.DataBlob = symKeySync.getEncoded();
      let symKeyPromise: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
      let keyDataPromise: cryptoFramework.DataBlob = symKeyPromise.getEncoded();
      let symKeyCallback: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_CALLBACK);
      let keyDataCallback: cryptoFramework.DataBlob = symKeyCallback.getEncoded();
      ret = parityCheck(keyDataSync.data);
      ret = ret && parityCheck(keyDataPromise.data);
      ret = ret && parityCheck(keyDataCallback.data);
      if (!ret) {
        timeFlag = true;
      }
      console.info("##################### doGenDes64Stub:" + mode);
      await new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          resolve(undefined)
        }, intervalTime)
      })//.then(undefined, (error: Object) =>{});
    } catch (error: BusinessError) {
      console.error(`doDes64Stub “${error}“, error code: ${error.code}`);
      clearInterval(timeoutId);
      return false;
    }
  }
  clearInterval(timeoutId);

  return ret;
}

async function doEncryptDes64Stub(mode: string, type: asyncType): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:int = 0;
  let intervalTime = 1000;
  let ret: boolean = true;
  let algName: string = "DES64";
  let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
  timeoutId = setInterval(() => {
    timeFlag = true;
  }, 1000 * 2);
  while (!timeFlag) {
    try {
      let msgLen: int = 20;
      let spec: cryptoFramework.IvParamsSpec = {
        iv: {data: new Uint8Array(8)},
        algName: "IvParamsSpec"
      };
      let initSpec: cryptoFramework.IvParamsSpec|null = spec;
      for (let mode of DES64_MODE) {
        initSpec = mode === "ECB" ? null : spec;
        for (let padding of DES64_PADDING) {
          msgLen = padding === "NoPadding" ? 512 : 500;
          let msg: cryptoFramework.DataBlob = await createData(msgLen);
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, type);
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, type);
          ret = compareDataBlob(plainText, msg);
          if (!ret) {
            timeFlag = true;
          }
        }
      }
      console.info("##################### doEncryptDes64Stub:" + mode + ":" + ret);
      await new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          resolve(undefined)
        }, intervalTime)
      })//.then(undefined, (error: Object) =>{});
    } catch (error: BusinessError) {
      console.error(`doDes64Stub “${error}“, error code: ${error.code}`);
      clearInterval(timeoutId);
      return false;
    }
  }
  clearInterval(timeoutId);

  return ret;
}

async function doUpdateEncryptDes64Stub(mode: string, type: asyncType): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:int = 0;
  let intervalTime = 1000;
  let ret: boolean = true;
  let algName: string = "DES64";
  let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
  timeoutId = setInterval(() => {
    timeFlag = true;
  }, 1000 * 2);
  while (!timeFlag) {
    try {
      let msgLen: int = 20;
      let blockSize: int = 21;
      let spec: cryptoFramework.IvParamsSpec = {
        iv: {data: new Uint8Array(8)},
        algName: "IvParamsSpec"
      };
      let initSpec: cryptoFramework.IvParamsSpec|null = spec;
      for (let mode of DES64_MODE) {
        initSpec = mode === "ECB" ? null : spec;
        for (let padding of DES64_PADDING) {
          msgLen = padding === "NoPadding" ? 512 : 500;
          let msg: cryptoFramework.DataBlob = await createData(msgLen);
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName + "|" + mode + "|" + padding);
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName + "|" + mode + "|" + padding);
          if (type == asyncType.TYPE_IS_SYNC) {
            let cipherText: cryptoFramework.DataBlob = doUpdateSync(encCipher, symKey, initSpec, msg, blockSize,
              cryptoFramework.CryptoMode.ENCRYPT_MODE);
            let plainText: cryptoFramework.DataBlob = doUpdateSync(decCipher, symKey, initSpec, cipherText, blockSize,
              cryptoFramework.CryptoMode.DECRYPT_MODE);
            ret = compareDataBlob(plainText, msg);
          } else if (type == asyncType.TYPE_IS_PROMISE) {
            let cipherText: cryptoFramework.DataBlob = await doUpdatePromise(encCipher, symKey, initSpec, msg, blockSize,
              cryptoFramework.CryptoMode.ENCRYPT_MODE);
            let plainText: cryptoFramework.DataBlob = await doUpdatePromise(decCipher, symKey, initSpec, cipherText, blockSize,
              cryptoFramework.CryptoMode.DECRYPT_MODE);
            ret = compareDataBlob(plainText, msg);
          }
          if (!ret) {
            timeFlag = true;
          }
        }
      }
      console.info("##################### doUpdateEncryptDes64Stub:" + mode + ":" + ret);
      await new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          resolve(undefined)
        }, intervalTime)
      })//.then(undefined, (error: Object) =>{});
    } catch (error: BusinessError) {
      console.error(`doDes64Stub “${error}“, error code: ${error.code}`);
      clearInterval(timeoutId);
      return false;
    }
  }
  clearInterval(timeoutId);

  return ret;
}

export default function SecurityCryptoFwDESTestUnit() {
  describe("SecurityCryptoFwDESTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_0100
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0100
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_SYNC);
          let keyData: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData.data.byteLength).assertEqual(DES64_KEY_SIZE);
        } catch (error: BusinessError) {
          console.error(`DES_Func_0100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_0200
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0200
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
          let keyData: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData.data.byteLength).assertEqual(DES64_KEY_SIZE);
        } catch (error: BusinessError) {
          console.error(`DES_Func_0200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_0300
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0300
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_CALLBACK);
          let keyData: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData.data.byteLength).assertEqual(DES64_KEY_SIZE);
        } catch (error: BusinessError) {
          console.error(`DES_Func_0300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_0400
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0400
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let keyData1: cryptoFramework.DataBlob = generateRandom(DES64_KEY_SIZE);
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData1, asyncType.TYPE_IS_SYNC);
          let keyData2: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData2.data.byteLength).assertEqual(DES64_KEY_SIZE);
          let ret: boolean = compareDataBlob(keyData1, keyData2);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_0400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_0500
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0500
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let keyData1: cryptoFramework.DataBlob = generateRandom(DES64_KEY_SIZE);
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData1, asyncType.TYPE_IS_PROMISE);
          let keyData2: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData2.data.byteLength).assertEqual(DES64_KEY_SIZE);
          let ret: boolean = compareDataBlob(keyData1, keyData2);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_0500 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_0600
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0600
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let keyData1: cryptoFramework.DataBlob = generateRandom(DES64_KEY_SIZE);
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData1, asyncType.TYPE_IS_CALLBACK);
          let keyData2: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData2.data.byteLength).assertEqual(DES64_KEY_SIZE);
          let ret: boolean = compareDataBlob(keyData1, keyData2);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_0600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_0700
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0700
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000000, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b10100100
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_CALLBACK);
          let dataTemp: cryptoFramework.DataBlob = symKey.getEncoded();
          let ret: boolean = compareDataBlob(keyData, dataTemp);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_0700 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_0800
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0800
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000000, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b10100100
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
          let dataTemp: cryptoFramework.DataBlob = symKey.getEncoded();
          let ret: boolean = compareDataBlob(keyData, dataTemp);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_0800 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_0900
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0900
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000000, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b10100100
          ]; // openssl 低层未做校验-奇偶校验
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_SYNC);
          let dataTemp: cryptoFramework.DataBlob = symKey.getEncoded();
          let ret: boolean = compareDataBlob(keyData, dataTemp);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_0900 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_1000
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1000
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_SYNC);
          expect(null).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_1000 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_1100
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1100
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_SYNC);
          expect(null).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_1100 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_1200
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1200
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
          expect(null).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_1200 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_1300
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1300
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_CALLBACK);
          expect(null).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_1300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_1400
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1400
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
          expect(null).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_1400 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_1500
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1500
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_CALLBACK);
          expect(null).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_1500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_1600
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1600
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        for (let data of DES64_WEAK_KEYS) {
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          try {
            let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_CALLBACK);
            let dataTemp: cryptoFramework.DataBlob = symKey.getEncoded();
            let ret: boolean = compareDataBlob(dataTemp, keyData);
            expect(ret).assertTrue();
          } catch (error: BusinessError) {
            console.error(`DES_Func_1600 “${error}“, error code: ${error.code}`);
            expect(null).assertTrue(); // openssl低层未做弱口令校验
          }
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_1700
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1700
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        for (let data of DES64_WEAK_KEYS) {
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          try {
            let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
            let dataTemp: cryptoFramework.DataBlob = symKey.getEncoded();
            let ret: boolean = compareDataBlob(dataTemp, keyData);
            expect(ret).assertTrue();
          } catch (error: BusinessError) {
            console.error(`DES_Func_1700 “${error}“, error code: ${error.code}`);
            expect(null).assertTrue();
          }
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_1800
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1800
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        for (let data of DES64_WEAK_KEYS) {
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          try {
            let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_SYNC);
            let dataTemp: cryptoFramework.DataBlob = symKey.getEncoded();
            let ret: boolean = compareDataBlob(dataTemp, keyData);
            expect(ret).assertTrue();
          } catch (error: BusinessError) {
            console.error(`DES_Func_1800 “${error}“, error code: ${error.code}`);
            expect(null).assertTrue();
          }
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_1900
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1900
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let msgLen: int = 20;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let initSpec: cryptoFramework.IvParamsSpec|null = spec;
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
          for (let mode of DES64_MODE) {
            initSpec = mode === "ECB" ? null : spec;
            for (let padding of DES64_PADDING) {
              msgLen = padding === "NoPadding" ? 16 : 20;
              let msg: cryptoFramework.DataBlob = await createData(msgLen);
              let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
                msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
              let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
                cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_SYNC);
              let ret: boolean = compareDataBlob(plainText, msg);
              expect(ret).assertTrue();
            }
          }
        } catch (error: BusinessError) {
          console.error(`DES_Func_1900 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_2000
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2000
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let msgLen: int = 20;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let initSpec: cryptoFramework.IvParamsSpec|null = spec;
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
          for (let mode of DES64_MODE) {
            initSpec = mode === "ECB" ? null : spec;
            for (let padding of DES64_PADDING) {
              msgLen = padding === "NoPadding" ? 16 : 20;
              let msg: cryptoFramework.DataBlob = await createData(msgLen);
              let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
                msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
              let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
                cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
              let ret: boolean = compareDataBlob(plainText, msg);
              expect(ret).assertTrue();
            }
          }
        } catch (error: BusinessError) {
          console.error(`DES_Func_2000 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_2100
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2100
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let msgLen: int = 20;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let initSpec: cryptoFramework.IvParamsSpec|null = spec;
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
          for (let mode of DES64_MODE) {
            initSpec = mode === "ECB" ? null : spec;
            for (let padding of DES64_PADDING) {
              msgLen = padding === "NoPadding" ? 16 : 20;
              let msg: cryptoFramework.DataBlob = await createData(msgLen);
              let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
                msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_CALLBACK);
              let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
                cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_CALLBACK);
              let ret: boolean = compareDataBlob(plainText, msg);
              expect(ret).assertTrue();
            }
          }
        } catch (error: BusinessError) {
          console.error(`DES_Func_2100 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_2200
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2200
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let msgLen: int = 20;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let initSpec: cryptoFramework.IvParamsSpec|null = spec;
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
          for (let mode of DES64_MODE) {
            initSpec = mode === "ECB" ? null : spec;
            for (let padding of DES64_PADDING) {
              msgLen = padding === "NoPadding" ? 16 : 20;
              let msg: cryptoFramework.DataBlob = await createData(msgLen);
              let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
                msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
              let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
                cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
              let ret: boolean = compareDataBlob(plainText, msg);
              expect(ret).assertTrue();
            }
          }
        } catch (error: BusinessError) {
          console.error(`DES_Func_2200 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_2300
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2300
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let msgLen: int = 20;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let initSpec: cryptoFramework.IvParamsSpec|null = spec;
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
          for (let mode of DES64_MODE) {
            initSpec = mode === "ECB" ? null : spec;
            for (let padding of DES64_PADDING) {
              msgLen = padding === "NoPadding" ? 16 : 20;
              let msg: cryptoFramework.DataBlob = await createData(msgLen);
              let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
                msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
              let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, initSpec, symKey,
                cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_SYNC);
              let ret: boolean = compareDataBlob(plainText, msg);
              expect(ret).assertTrue();
            }
          }
        } catch (error: BusinessError) {
          console.error(`DES_Func_2300 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_2400
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2400
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let mode: string = "CFB";
          let padding: string = "NoPadding";
          let alg: string = algName + "|" + mode + "|" + padding;
          let msgLen: int = 20;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
          let msg: cryptoFramework.DataBlob = await createData(msgLen);
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
          let cipherText: cryptoFramework.DataBlob|null = encCipher.updateSync(msg);
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
          decCipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, spec);
          let plainText: cryptoFramework.DataBlob|null = await decCipher.doFinal(cipherText);
          let ret: boolean = compareDataBlob(plainText, msg);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_2400 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_2500
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2500
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName1: string = "DES64";
          let algName2: string = "3DES192";
          let mode: string = "CFB";
          let padding: string = "NoPadding";
          let msgLen: int = 20;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let data1: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100, 0b10010010, 0b11000001, 0b11101001, 0b11101001,
          ];
          let data2: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100, 0b10010010, 0b11000001, 0b11101001, 0b11101001,
            0b00000001, 0b10101101, 0b11100101, 0b10111100, 0b10010010, 0b11000001, 0b11101001, 0b11101001,
            0b00000001, 0b10101101, 0b11100101, 0b10111100, 0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let keyData1: cryptoFramework.DataBlob = {data: new Uint8Array(data1)};
          let symKey1: cryptoFramework.SymKey = await convertSymKey(algName1, keyData1, asyncType.TYPE_IS_PROMISE);
          let keyData2: cryptoFramework.DataBlob = {data: new Uint8Array(data2)};
          let symKey2: cryptoFramework.SymKey = await convertSymKey(algName2, keyData2, asyncType.TYPE_IS_PROMISE);
          let msg: cryptoFramework.DataBlob = await createData(msgLen);
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName1, mode, padding, spec, symKey1,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let plainText: cryptoFramework.DataBlob = await doCipher(algName2, mode, padding, spec, symKey2,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_SYNC);
          let ret: boolean = compareDataBlob(plainText, msg);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_2500 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_2600
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2600
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName1: string = "DES64";
          let algName2: string = "3DES192";
          let mode: string = "CFB";
          let padding: string = "NoPadding";
          let msgLen: int = 20;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let data1: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100, 0b10010010, 0b11000001, 0b11101001, 0b11101001,
          ];
          let data2: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100, 0b10010010, 0b11000001, 0b11101001, 0b11101001,
            0b00000001, 0b10101101, 0b11100101, 0b10111100, 0b10010010, 0b11000001, 0b11101001, 0b11101001,
            0b00000001, 0b10101101, 0b11100101, 0b10111100, 0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let keyData1: cryptoFramework.DataBlob = {data: new Uint8Array(data1)};
          let symKey1: cryptoFramework.SymKey = await convertSymKey(algName1, keyData1, asyncType.TYPE_IS_PROMISE);
          let keyData2: cryptoFramework.DataBlob = {data: new Uint8Array(data2)};
          let symKey2: cryptoFramework.SymKey = await convertSymKey(algName2, keyData2, asyncType.TYPE_IS_PROMISE);
          let msg: cryptoFramework.DataBlob = await createData(msgLen);
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName1, mode, padding, spec, symKey1,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
          let plainText: cryptoFramework.DataBlob = await doCipher(algName2, mode, padding, spec, symKey2,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret: boolean = compareDataBlob(plainText, msg);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_2600 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_2700
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2700
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let msgLen: int = 64;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let blockSize: int = 20;
          let initSpec: cryptoFramework.IvParamsSpec|null = spec;
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
          for (let mode of DES64_MODE) {
            initSpec = mode === "ECB" ? null : spec;
            for (let padding of DES64_PADDING) {
              let alg:string = algName + "|" + mode + "|" + padding;
              let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
              let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
              let msg: cryptoFramework.DataBlob = await createData(msgLen);
              let cipherText: cryptoFramework.DataBlob = await doUpdatePromise(encCipher, symKey, initSpec, msg, blockSize,
                cryptoFramework.CryptoMode.ENCRYPT_MODE);
              let plainText: cryptoFramework.DataBlob = doUpdateSync(decCipher, symKey, initSpec, cipherText, blockSize,
                cryptoFramework.CryptoMode.DECRYPT_MODE);
              let ret: boolean = compareDataBlob(plainText, msg);
              expect(ret).assertTrue();
            }
          }
        } catch (error: BusinessError) {
          console.error(`DES_Func_2700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_2800
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2800
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let msgLen: int = 64;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let blockSize: int = 20;
          let initSpec: cryptoFramework.IvParamsSpec|null = spec;
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
          for (let mode of DES64_MODE) {
            initSpec = mode === "ECB" ? null : spec;
            for (let padding of DES64_PADDING) {
              let alg:string = algName + "|" + mode + "|" + padding;
              let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
              let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
              let msg: cryptoFramework.DataBlob = await createData(msgLen);
              let cipherText: cryptoFramework.DataBlob = doUpdateSync(encCipher, symKey, initSpec, msg, blockSize,
                cryptoFramework.CryptoMode.ENCRYPT_MODE);
              let plainText: cryptoFramework.DataBlob = await doUpdatePromise(decCipher, symKey, initSpec, cipherText, blockSize,
                cryptoFramework.CryptoMode.DECRYPT_MODE);
              let ret: boolean = compareDataBlob(plainText, msg);
              expect(ret).assertTrue();
            }
          }
        } catch (error: BusinessError) {
          console.error(`DES_Func_2800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_2900
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2900
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let alg: string = algName + "|" + "CBC" + "|" + "PKCS7";
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(7)},
          algName: "IvParamsSpec"
        };
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
        try {
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_2900 init “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        try {
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_2900 initSync “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_3000
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3000
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let alg: string = algName + "|" + "CBC" + "|" + "PKCS7";
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(9)},
          algName: "IvParamsSpec"
        };
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
        try {
          await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3000 init “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        try {
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3000 initSync “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_3100
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3100
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let alg: string = algName + "|" + "CBC" + "|" + "NoPadding";
        let msgLen: int = 20;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
        let cipher2: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
        await cipher2.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
        try {
          await cipher.doFinal(msg);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3100 doFinal “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        try {
          cipher2.doFinalSync(msg);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3100 doFinalSync “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_3200
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3200
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: int = 50;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let data: number[] = [
          0x00, 0xdb, 0x43, 0x2a, 0xa3, 0x72, 0xb2, 0x46, 0xf0, 0x56, 0x2d, 0xfb, 0xfe, 0x30, 0xbb, 0x72,
          0x83, 0x5e, 0x9b, 0x69, 0x76, 0x9c, 0xdf, 0x3c, 0x6f, 0x23, 0xd2, 0x7e, 0xf8, 0x04, 0x5f, 0x96,
          0x37, 0xd3, 0x36, 0x82, 0xbd, 0x49, 0x4d, 0x56, 0xf3, 0xec, 0x61, 0xe2, 0xbb, 0xc1, 0xe1, 0x5f,
          0x2a, 0xba
        ];
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let key_data: number[] = [
          0x86, 0x04, 0x0e, 0xf2, 0x89, 0x94, 0x15, 0x08
        ];
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data)}, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
          cipherText.data[12]++; // block: 7, tampering: 2
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret: boolean = compareDataBlob(plainText, msg);
          expect(ret).assertFalse();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3200 “${error}“, error code: ${error.code}`);
          expect(null).assertFalse();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_3300
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3300
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: int = 50;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let data: number[] = [
          0x00, 0xfe, 0x23, 0x95, 0x2b, 0x0f, 0x68, 0xfe, 0x06, 0x2b, 0x95, 0x06, 0x52, 0x55, 0x9c, 0x72,
          0xdb, 0x6e, 0x0f, 0x7e, 0x19, 0x3e, 0xf8, 0xcf, 0xeb, 0x29, 0x9b, 0x0e, 0x5b, 0xd9, 0xcc, 0xed,
          0x08, 0xfe, 0xb7, 0x17, 0xe3, 0x79, 0x60, 0x04, 0x5a, 0x1f, 0xa4, 0x8b, 0x8b, 0x7f, 0xb5, 0xf4,
          0x3d, 0x30
        ];
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let key_data: number[] = [
          0xc4, 0x5e, 0x13, 0xba, 0xb3, 0x7c, 0xd0, 0x73
        ];
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data)}, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
          cipherText.data[49]++; // block: 7, tampering: 6
          await doCipher(algName, mode, padding, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_3400
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3400
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "NoPadding";
        let msgLen: int = 56;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let data: number[] = [
          0x00, 0xf4, 0x60, 0xd1, 0x99, 0x86, 0x99, 0x22, 0x51, 0x71, 0x2e, 0xd8, 0xec, 0xb3, 0xb4, 0x5d,
          0xda, 0xe0, 0x77, 0x1b, 0x34, 0x95, 0xba, 0xd8, 0xd3, 0x94, 0xcf, 0xf3, 0xc0, 0x50, 0xa3, 0x84,
          0x06, 0xb6, 0x59, 0xfc, 0x6b, 0xdc, 0x5a, 0xb7, 0xab, 0x3f, 0x32, 0x5f, 0x7f, 0x77, 0xff, 0x1f,
          0x9b, 0x65, 0x9a, 0x94, 0x28, 0xe4, 0x51, 0x38
        ];
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let key_data: number[] = [
          0x70, 0xb9, 0x92, 0x0e, 0xf4, 0xef, 0xd0, 0x31
        ];
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data)}, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          cipherText.data[49]++; // block: 7, tampering: 6
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret1: boolean = compareDataBlob(plainText, msg);
          expect(ret1).assertFalse();
          cipherText.data[49]--;
          cipherText.data[12]++; // block: 7, tampering: 2
          plainText = await doCipher(algName, mode, padding, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret2: boolean = compareDataBlob(plainText, msg);
          expect(ret2).assertFalse();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_3500
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3500
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let data: number[] = [
          0x00, 0x13, 0x23, 0xb9, 0x38, 0xf7, 0x65, 0x1e
        ];
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let key_data: number[] = [
          0x0d, 0x70, 0x04, 0xb6, 0x23, 0x97, 0xea, 0xad
        ];
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data)}, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
          cipherText.data[15]++; // block: 2, tampering: 2
          await doCipher(algName, mode, padding, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_3600
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3600
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CFB";
        let padding: string = "PKCS7";
        let msgLen: int = 9;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let data: number[] = [
          0x00, 0xd7, 0xbc, 0x5f, 0x54, 0x94, 0x37, 0xf2, 0x43
        ];
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let key_data: number[] = [
          0x1f, 0x16, 0x5b, 0x15, 0xf7, 0xcb, 0x7f, 0x1f
        ];
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data)}, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
          cipherText.data[8]++;
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret: boolean = compareDataBlob(plainText, msg);
          expect(ret).assertFalse();
          let tmp1 = plainText.data.subarray(0, plainText.data.byteLength - 1);
          let text1: cryptoFramework.DataBlob = { data:tmp1 };
          let tmp2 = msg.data.subarray(0, msgLen - 1);
          let text2: cryptoFramework.DataBlob = { data:tmp2 };
          ret = compareDataBlob(text1, text2);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_3700
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3700
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let alg: string = algName + "|" + mode + "|" + padding;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array()};
        let data: number[] = [
          0b00000001, 0b10101101, 0b11100101, 0b10111100,
          0b10010010, 0b11000001, 0b11101001, 0b11101001
        ];
        let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
        await cipher.update(msg);
        let cipherText: cryptoFramework.DataBlob|null = await cipher.doFinal(msg);
        let ret = compareDataBlob({data: new Uint8Array([139,176,93,43,125,148,131,111])}, cipherText);
        expect(ret).assertTrue();
        try {
          await cipher.doFinal(null);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3700 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_3800
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3800
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let alg: string = algName + "|" + mode + "|" + padding;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array()};
        let data: number[] = [
          0b00000001, 0b10101101, 0b11100101, 0b10111100,
          0b10010010, 0b11000001, 0b11101001, 0b11101001
        ];
        let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
        let cipherText: cryptoFramework.DataBlob|null = await cipher.doFinal(msg);
        let ret = compareDataBlob({data: new Uint8Array([139,176,93,43,125,148,131,111])}, cipherText);
        expect(ret).assertTrue();
        try {
          await cipher.doFinal(null);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3800 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_3900
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3900
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding1: string = "NoPadding";
        let padding2: string = "PKCS7";
        let msgLen: int = 16;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let data: number[] = [
          0x00, 0x73, 0xfb, 0x92, 0xa7, 0x40, 0x6e, 0xc3, 0xc2, 0x7f, 0xad, 0x87, 0x41, 0xcf, 0x52, 0x68
        ];
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let key_data: number[] = [
          0xa2, 0x7a, 0xa7, 0xb3, 0x64, 0x73, 0x97, 0x3d
        ];
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data)}, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding1, spec, symKey,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
        try {
          await doCipher(algName, mode, padding2, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_3900 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_4000
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4000
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding1: string = "NoPadding";
        let padding2: string = "PKCS7";
        let msgLen: int = 16;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let data: number[] = [
          0x00, 0xff, 0x57, 0x15, 0x8c, 0x12, 0xb9, 0xa3, 0x9a, 0x3d, 0x36, 0xd4, 0xdd, 0x68, 0xa9, 0x89
        ];
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let key_data: number[] = [
          0x89, 0x37, 0x01, 0xb0, 0x20, 0x31, 0xfb, 0x31
        ];
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data)}, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding2, spec, symKey,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
        try {
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding1, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          expect(msgLen).not().assertEqual(plainText.data.byteLength);
          expect(msgLen+8).assertEqual(plainText.data.byteLength);
        } catch (error: BusinessError) {
          console.error(`DES_Func_4000 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_4100
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4100
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding1: string = "NoPadding";
        let padding2: string = "PKCS7";
        let msgLen: int = 16;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let data: number[] = [
          0x00, 0xee, 0x96, 0x12, 0xd2, 0xb7, 0x8c, 0x54, 0xd4, 0xdf, 0xae, 0xf1, 0x17, 0x1c, 0x7c, 0x9d
        ];
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let key_data: number[] = [
          0xe5, 0x13, 0xc4, 0x57, 0x3b, 0x51, 0xe5, 0x2f
        ];
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data)}, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding2, spec, symKey,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
        try {
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding1, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_SYNC);
          expect(msgLen).not().assertEqual(plainText.data.byteLength);
          expect(msgLen+8).assertEqual(plainText.data.byteLength);
        } catch (error: BusinessError) {
          console.error(`DES_Func_4100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_4200
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4200
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: int = 56;
        let spec1: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let spec2: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([1, 1, 1, 1, 1,  1, 1, 1])},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec1, symKey,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
        try {
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec2, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_SYNC);
          let ret = compareDataBlob(plainText, msg);
          expect(ret).assertFalse();
          let tmp1 = plainText.data.subarray(8, plainText.data.length);
          let Text1: cryptoFramework.DataBlob = { data:tmp1 };
          let tmp2 = plainText.data.subarray(8, msg.data.length);
          let Text2: cryptoFramework.DataBlob = { data:tmp2 };
          ret = compareDataBlob(Text1, Text2);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_4200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_4300
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4300
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: int = 56;
        let spec1: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let spec2: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([1, 1, 1, 1, 1,  1, 1, 1])},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec1, symKey,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
        try {
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec2, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret = compareDataBlob(plainText, msg);
          expect(ret).assertFalse();
          let tmp1 = plainText.data.subarray(8, plainText.data.length);
          let Text1: cryptoFramework.DataBlob = { data:tmp1 };
          let tmp2 = plainText.data.subarray(8, msg.data.length);
          let Text2: cryptoFramework.DataBlob = { data:tmp2 };
          ret = compareDataBlob(Text1, Text2);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_4300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_4400
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4400
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "NoPadding";
        let msgLen: int = 56;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey1: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let symKey2: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey1,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
        try {
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey2,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret = compareDataBlob(plainText, msg);
          expect(ret).assertFalse();
        } catch (error: BusinessError) {
          console.error(`DES_Func_4400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_4500
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4500
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: int = 56;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let data: number[] = [
          0x00, 0x4c, 0xbf, 0x71, 0xa3, 0xed, 0x01, 0xd7, 0x20, 0x86, 0x99, 0x7d, 0x70, 0x07, 0x38, 0xa2,
          0x90, 0x4d, 0xb3, 0x1e, 0x44, 0x84, 0xff, 0x94, 0x68, 0x06, 0xb5, 0x77, 0xe8, 0xa1, 0xc7, 0x26,
          0xbb, 0xfb, 0x45, 0x4b, 0x23, 0x66, 0x41, 0x26, 0x67, 0xff, 0x4c, 0x4b, 0x5c, 0x2b, 0x76, 0x9f,
          0x62, 0x1a, 0x24, 0x3e, 0xbf, 0x60, 0x04, 0x03
        ];
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let key_data1: number[] = [
          0x20, 0xc1, 0x8a, 0x37, 0xcd, 0x64, 0x7c, 0xcb
        ];
        let symKey1: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data1)}, asyncType.TYPE_IS_PROMISE);
        let key_data2: number[] = [
          0x23, 0xa2, 0x23, 0x0e, 0xe5, 0x0e, 0x38, 0xef
        ];
        let symKey2: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data2)}, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey1,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
        try {
          await doCipher(algName, mode, padding, spec, symKey2,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_4500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_4600
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4600
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: int = 56;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let data: number[] = [
          0x00, 0x9d, 0x85, 0x99, 0xa0, 0x8d, 0x09, 0x80, 0xd7, 0xc1, 0x62, 0x7f, 0xf4, 0x52, 0x3d, 0x8b,
          0x04, 0x19, 0x90, 0x36, 0x8e, 0xb1, 0x1e, 0x45, 0x9a, 0x1b, 0x5c, 0x5c, 0x80, 0x25, 0x0a, 0x77,
          0x10, 0xbc, 0x65, 0x69, 0x81, 0xe5, 0xb4, 0xec, 0x19, 0x06, 0x54, 0xa1, 0x12, 0x56, 0x49, 0x45,
          0xbd, 0xd3, 0xdc, 0xd6, 0x56, 0xaf, 0x13, 0xdc
        ];
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let key_data1: number[] = [
          0x0e, 0xe0, 0x1a, 0x4a, 0x1f, 0x4a, 0x40, 0xb6
        ];
        let symKey1: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data1)}, asyncType.TYPE_IS_PROMISE);
        let key_data2: number[] = [
          0xbf, 0x5d, 0xae, 0x83, 0x98, 0xbc, 0x94, 0xfd
        ];
        let symKey2: cryptoFramework.SymKey = await convertSymKey(algName, {data: new Uint8Array(key_data2)}, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey1,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
        try {
          await doCipher(algName, mode, padding, spec, symKey2,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_SYNC);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DES_Func_4600 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_4700
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4700
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "NoPadding";
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let key: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x7c, 0xa1, 0x10, 0x45, 0x4a, 0x1a, 0x6e, 0x57])
        };
        let msg: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x01, 0xa1, 0xd6, 0xd0, 0x39, 0x77, 0x67, 0x42])
        };
        let cipherExpect: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x69, 0x0f, 0x5b, 0x0d, 0x9a, 0x26, 0x93, 0x9b])
        };
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, key, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey, msg,
            cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
          let ret: boolean = compareDataBlob(cipherText, cipherExpect);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_4700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_4800
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4800
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "CFB";
        let padding: string = "NoPadding";
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let key: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x80, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01])
        };
        let msg: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
        };
        let cipherExpect: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x95, 0xa8, 0xd7, 0x28, 0x13, 0xda, 0xa9, 0x4d])
        };
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, key, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey, msg,
            cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret: boolean = compareDataBlob(cipherText, cipherExpect);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_4800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_4900
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4900
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "OFB";
        let padding: string = "NoPadding";
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let key: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x80, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01])
        };
        let msg: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
        };
        let cipherExpect: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x95, 0xa8, 0xd7, 0x28, 0x13, 0xda, 0xa9, 0x4d])
        };
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, key, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey, msg,
            cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret: boolean = compareDataBlob(cipherText, cipherExpect);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_4900 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_5000
     * @tc.number SUB_Security_CryptoFramework_DES_Func_5000
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_5000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let mode1: string = "CFB";
          let mode2: string = "OFB";
          let padding: string = "PKCS7";
          let msgLen: int = 5;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
          let msg: cryptoFramework.DataBlob = await createData(msgLen);
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode1, padding, spec, symKey,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode2, padding, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_SYNC);
          let ret: boolean = compareDataBlob(plainText, msg);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_5000 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_5200
     * @tc.number SUB_Security_CryptoFramework_DES_Func_5200
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_5200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let algName: string = "DES64";
        let mode: string = "ECB";
        let padding: string = "NoPadding";
        let key: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01])
        };
        let msg: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
        };
        let cipherExpect: cryptoFramework.DataBlob = {
          data: new Uint8Array([0x95, 0xf8, 0xa5, 0xe5, 0xdd, 0x31, 0xd9, 0x00])
        };
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, key, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, null, symKey, msg,
            cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret: boolean = compareDataBlob(cipherText, cipherExpect);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_5200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   SUB_Security_CryptoFramework_DES_Func_5300
     * @tc.number SUB_Security_CryptoFramework_DES_Func_5300
     * @tc.desc   algorithm is DES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_DES_Func_5300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "DES64";
          let mode1: string = "CFB";
          let mode2: string = "OFB";
          let padding: string = "NoPadding";
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
          let msg: cryptoFramework.DataBlob = {
            data: new Uint8Array([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
          }
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode1, padding, spec, symKey,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode2, padding, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret: boolean = compareDataBlob(plainText, msg);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`DES_Func_5300 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

  });
}