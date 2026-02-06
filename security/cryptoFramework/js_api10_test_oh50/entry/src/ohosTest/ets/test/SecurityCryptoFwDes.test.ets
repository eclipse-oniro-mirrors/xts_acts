/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { taskpool } from '@kit.ArkTS';
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


@Concurrent
async function doGenDes64Stub(mode: string): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  let intervalTime = 1000;
  let ret: boolean = true;
  setInterval(() => {
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
        timeoutId = setTimeout(() => {
          resolve()
        }, intervalTime)
      }).then(undefined, (error: Object) =>{});
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doDes64Stub “${error}“, error code: ${error.code}`);
      return false;
    }
  }

  return ret;
}

@Concurrent
async function doEncryptDes64Stub(mode: string, type: asyncType): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  let intervalTime = 1000;
  let ret: boolean = true;
  let algName: string = "DES64";
  let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
  setInterval(() => {
    timeFlag = true;
  }, 1000 * 2);
  while (!timeFlag) {
    try {
      let msgLen: number = 20;
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
        timeoutId = setTimeout(() => {
          resolve()
        }, intervalTime)
      }).then(undefined, (error: Object) =>{});
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doDes64Stub “${error}“, error code: ${error.code}`);
      return false;
    }
  }

  return ret;
}

@Concurrent
async function doUpdateEncryptDes64Stub(mode: string, type: asyncType): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  let intervalTime = 1000;
  let ret: boolean = true;
  let algName: string = "DES64";
  let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
  setInterval(() => {
    timeFlag = true;
  }, 1000 * 2);
  while (!timeFlag) {
    try {
      let msgLen: number = 20;
      let blockSize: number = 21;
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
        timeoutId = setTimeout(() => {
          resolve()
        }, intervalTime)
      }).then(undefined, (error: Object) =>{});
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doDes64Stub “${error}“, error code: ${error.code}`);
      return false;
    }
  }

  return ret;
}

export default function SecurityCryptoFwDESTestUnit() {
  describe('SecurityCryptoFwDESTestUnit', () => {
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
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0100
     * @tc.name Test DES generate key Test, Sync Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_SYNC);
          let keyData: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData.data.byteLength).assertEqual(DES64_KEY_SIZE);
        } catch (error) {
          console.error(`DES_Func_0100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0200
     * @tc.name Test DES generate key Test, Promise Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
          let keyData: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData.data.byteLength).assertEqual(DES64_KEY_SIZE);
        } catch (error) {
          console.error(`DES_Func_0200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0300
     * @tc.name Test DES generate key Test, Callback Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_CALLBACK);
          let keyData: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData.data.byteLength).assertEqual(DES64_KEY_SIZE);
        } catch (error) {
          console.error(`DES_Func_0300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0400
     * @tc.name Test DES convert key Test, Sync Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let keyData1: cryptoFramework.DataBlob = generateRandom(DES64_KEY_SIZE);
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData1, asyncType.TYPE_IS_SYNC);
          let keyData2: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData2.data.byteLength).assertEqual(DES64_KEY_SIZE);
          let ret: boolean = compareDataBlob(keyData1, keyData2);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`DES_Func_0400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0500
     * @tc.name Test DES convert key Test, Promise Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let keyData1: cryptoFramework.DataBlob = generateRandom(DES64_KEY_SIZE);
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData1, asyncType.TYPE_IS_PROMISE);
          let keyData2: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData2.data.byteLength).assertEqual(DES64_KEY_SIZE);
          let ret: boolean = compareDataBlob(keyData1, keyData2);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`DES_Func_0500 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0600
     * @tc.name Test DES convert key Test, Callback Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let keyData1: cryptoFramework.DataBlob = generateRandom(DES64_KEY_SIZE);
          let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData1, asyncType.TYPE_IS_CALLBACK);
          let keyData2: cryptoFramework.DataBlob = symKey.getEncoded();
          expect(keyData2.data.byteLength).assertEqual(DES64_KEY_SIZE);
          let ret: boolean = compareDataBlob(keyData1, keyData2);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`DES_Func_0600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0700
     * @tc.name Test DES convert key parity check Test, Callback Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        } catch (error) {
          console.error(`DES_Func_0700 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0800
     * @tc.name Test DES convert key parity check Test, Promise Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        } catch (error) {
          console.error(`DES_Func_0800 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_0900
     * @tc.name Test DES convert key parity check Test, Sync Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        } catch (error) {
          console.error(`DES_Func_0900 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1000
     * @tc.name Test DES convert key len lt 8 Test, Sync Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_SYNC);
          expect(null).assertTrue();
        } catch (error) {
          console.error(`DES_Func_1000 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1100
     * @tc.name Test DES convert key len gt 8 Test, Sync Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_SYNC);
          expect(null).assertTrue();
        } catch (error) {
          console.error(`DES_Func_1100 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1200
     * @tc.name Test DES convert key len lt 8 Test, Promise Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
          expect(null).assertTrue();
        } catch (error) {
          console.error(`DES_Func_1200 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1300
     * @tc.name Test DES convert key len lt 8 Test, Callback Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_CALLBACK);
          expect(null).assertTrue();
        } catch (error) {
          console.error(`DES_Func_1300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1400
     * @tc.name Test DES convert key len gt 8 Test, Promise Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
          expect(null).assertTrue();
        } catch (error) {
          console.error(`DES_Func_1400 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1500
     * @tc.name Test DES convert key len gt 8 Test, Callback Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001, 0b11101001
          ];
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          await convertSymKey(algName, keyData, asyncType.TYPE_IS_CALLBACK);
          expect(null).assertTrue();
        } catch (error) {
          console.error(`DES_Func_1500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1600
     * @tc.name Test DES convert key weak key Test, Callback Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        for (let data of DES64_WEAK_KEYS) {
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          try {
            let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_CALLBACK);
            let dataTemp: cryptoFramework.DataBlob = symKey.getEncoded();
            let ret: boolean = compareDataBlob(dataTemp, keyData);
            expect(ret).assertTrue();
          } catch (error) {
            console.error(`DES_Func_1600 “${error}“, error code: ${error.code}`);
            expect(null).assertTrue(); // openssl低层未做弱口令校验
          }
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1700
     * @tc.name Test DES convert key weak key Test, Promise Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        for (let data of DES64_WEAK_KEYS) {
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          try {
            let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
            let dataTemp: cryptoFramework.DataBlob = symKey.getEncoded();
            let ret: boolean = compareDataBlob(dataTemp, keyData);
            expect(ret).assertTrue();
          } catch (error) {
            console.error(`DES_Func_1700 “${error}“, error code: ${error.code}`);
            expect(null).assertTrue();
          }
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1800
     * @tc.name Test DES convert key weak key Test, Sync Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        for (let data of DES64_WEAK_KEYS) {
          let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
          try {
            let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_SYNC);
            let dataTemp: cryptoFramework.DataBlob = symKey.getEncoded();
            let ret: boolean = compareDataBlob(dataTemp, keyData);
            expect(ret).assertTrue();
          } catch (error) {
            console.error(`DES_Func_1800 “${error}“, error code: ${error.code}`);
            expect(null).assertTrue();
          }
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_1900
     * @tc.name Test DES encrypt decrypt Test, Sync Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let msgLen: number = 20;
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
        } catch (error) {
          console.error(`DES_Func_1900 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2000
     * @tc.name Test DES encrypt decrypt Test, Promise Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let msgLen: number = 20;
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
        } catch (error) {
          console.error(`DES_Func_2000 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2100
     * @tc.name Test DES encrypt decrypt Test, Callback Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let msgLen: number = 20;
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
        } catch (error) {
          console.error(`DES_Func_2100 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2200
     * @tc.name Test DES Sync encrypt, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let msgLen: number = 20;
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
        } catch (error) {
          console.error(`DES_Func_2200 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2300
     * @tc.name Test DES Promise encrypt, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let data: number[] = [
            0b00000001, 0b10101101, 0b11100101, 0b10111100,
            0b10010010, 0b11000001, 0b11101001, 0b11101001
          ];
          let msgLen: number = 20;
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
        } catch (error) {
          console.error(`DES_Func_2300 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2400
     * @tc.name Test DES Promise encrypt, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let mode: string = "CFB";
          let padding: string = "NoPadding";
          let alg: string = algName + "|" + mode + "|" + padding;
          let msgLen: number = 20;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
          let msg: cryptoFramework.DataBlob = await createData(msgLen);
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
          await encCipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
          let cipherText: cryptoFramework.DataBlob = encCipher.updateSync(msg);
          let decCipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
          decCipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, spec);
          let plainText: cryptoFramework.DataBlob = await decCipher.doFinal(cipherText);
          let ret: boolean = compareDataBlob(plainText, msg);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`DES_Func_2400 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2500
     * @tc.name Test DES64 3DES192 Cross Test, Promise Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName1: string = "DES64";
          let algName2: string = "3DES192";
          let mode: string = "CFB";
          let padding: string = "NoPadding";
          let msgLen: number = 20;
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
        } catch (error) {
          console.error(`DES_Func_2500 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2600
     * @tc.name Test DES64 3DES192 Cross Test, Sync Style
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName1: string = "DES64";
          let algName2: string = "3DES192";
          let mode: string = "CFB";
          let padding: string = "NoPadding";
          let msgLen: number = 20;
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
        } catch (error) {
          console.error(`DES_Func_2600 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2700
     * @tc.name Test DES Promise encrypt, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let msgLen: number = 64;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let blockSize: number = 20;
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
        } catch (error) {
          console.error(`DES_Func_2700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2800
     * @tc.name Test DES Split Test, Promise encrypt, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let msgLen: number = 64;
          let spec: cryptoFramework.IvParamsSpec = {
            iv: {data: new Uint8Array(8)},
            algName: "IvParamsSpec"
          };
          let blockSize: number = 20;
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
        } catch (error) {
          console.error(`DES_Func_2800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_2900
     * @tc.name Test DES IV Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_2900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        } catch (error) {
          console.error(`DES_Func_2900 init “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        try {
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`DES_Func_2900 initSync “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3000
     * @tc.name Test DES IV Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        } catch (error) {
          console.error(`DES_Func_3000 init “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        try {
          cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
          expect(null).assertFail();
        } catch (error) {
          console.error(`DES_Func_3000 initSync “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3100
     * @tc.name Test DES CBC NoPadding Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let alg: string = algName + "|" + "CBC" + "|" + "NoPadding";
        let msgLen: number = 20;
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
        } catch (error) {
          console.error(`DES_Func_3100 doFinal “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        try {
          cipher2.doFinalSync(msg);
          expect(null).assertFail();
        } catch (error) {
          console.error(`DES_Func_3100 doFinalSync “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3200
     * @tc.name Test DES CBC PKCS7 Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: number = 50;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
          cipherText.data[12]++; // block: 7, tampering: 2
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          let ret: boolean = compareDataBlob(plainText, msg);
          expect(ret).assertFalse();
        } catch (error) {
          console.error(`DES_Func_3200 “${error}“, error code: ${error.code}`);
          expect(null).assertFalse();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3300
     * @tc.name Test DES CBC PKCS7 Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: number = 50;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
          cipherText.data[49]++; // block: 7, tampering: 6
          await doCipher(algName, mode, padding, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          expect(null).assertFail();
        } catch (error) {
          console.error(`DES_Func_3300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3400
     * @tc.name Test DES CBC NoPadding Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "NoPadding";
        let msgLen: number = 56;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
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
        } catch (error) {
          console.error(`DES_Func_3400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3500
     * @tc.name Test DES CBC PKCS7 Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: number = 8;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        try {
          let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey,
            msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
          cipherText.data[15]++; // block: 2, tampering: 2
          await doCipher(algName, mode, padding, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          expect(null).assertFail();
        } catch (error) {
          console.error(`DES_Func_3500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3600
     * @tc.name Test DES CFB PKCS7 Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CFB";
        let padding: string = "PKCS7";
        let msgLen: number = 9;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
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
        } catch (error) {
          console.error(`DES_Func_3600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3700
     * @tc.name Test DES CFB PKCS7, msg is empty Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let alg: string = algName + "|" + mode + "|" + padding;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array([])};
        let data: number[] = [
          0b00000001, 0b10101101, 0b11100101, 0b10111100,
          0b10010010, 0b11000001, 0b11101001, 0b11101001
        ];
        let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
        await cipher.update(msg);
        let cipherText: cryptoFramework.DataBlob = await cipher.doFinal(msg);
        let ret = compareDataBlob({data: new Uint8Array([139,176,93,43,125,148,131,111])}, cipherText);
        expect(ret).assertTrue();
        try {
          await cipher.doFinal(null);
          expect(null).assertFail();
        } catch (error) {
          console.error(`DES_Func_3700 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3800
     * @tc.name Test DES CFB PKCS7, msg is empty Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let alg: string = algName + "|" + mode + "|" + padding;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = {data: new Uint8Array([])};
        let data: number[] = [
          0b00000001, 0b10101101, 0b11100101, 0b10111100,
          0b10010010, 0b11000001, 0b11101001, 0b11101001
        ];
        let keyData: cryptoFramework.DataBlob = {data: new Uint8Array(data)};
        let symKey: cryptoFramework.SymKey = await convertSymKey(algName, keyData, asyncType.TYPE_IS_PROMISE);
        let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, spec);
        let cipherText: cryptoFramework.DataBlob = await cipher.doFinal(msg);
        let ret = compareDataBlob({data: new Uint8Array([139,176,93,43,125,148,131,111])}, cipherText);
        expect(ret).assertTrue();
        try {
          await cipher.doFinal(null);
          expect(null).assertFail();
        } catch (error) {
          console.error(`DES_Func_3800 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_3900
     * @tc.name Test DES CBC NoPadding Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_3900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding1: string = "NoPadding";
        let padding2: string = "PKCS7";
        let msgLen: number = 16;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding1, spec, symKey,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
        try {
          await doCipher(algName, mode, padding2, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          expect(null).assertFail();
        } catch (error) {
          console.error(`DES_Func_3900 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4000
     * @tc.name Test DES CBC NoPadding Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding1: string = "NoPadding";
        let padding2: string = "PKCS7";
        let msgLen: number = 16;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding2, spec, symKey,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_PROMISE);
        try {
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding1, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          expect(msgLen).not().assertEqual(plainText.data.byteLength);
          expect(msgLen+8).assertEqual(plainText.data.byteLength);
        } catch (error) {
          console.error(`DES_Func_4000 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4100
     * @tc.name Test DES CBC NoPadding Abnormal Test, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding1: string = "NoPadding";
        let padding2: string = "PKCS7";
        let msgLen: number = 16;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array(8)},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding2, spec, symKey,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
        try {
          let plainText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding1, spec, symKey,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_SYNC);
          expect(msgLen).not().assertEqual(plainText.data.byteLength);
          expect(msgLen+8).assertEqual(plainText.data.byteLength);
        } catch (error) {
          console.error(`DES_Func_4100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4200
     * @tc.name Test DES CBC NoPadding Abnormal Test, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: number = 56;
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
        } catch (error) {
          console.error(`DES_Func_4200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4300
     * @tc.name Test DES CBC NoPadding Abnormal Test, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: number = 56;
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
        } catch (error) {
          console.error(`DES_Func_4300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4400
     * @tc.name Test DES CBC NoPadding Abnormal Test, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "NoPadding";
        let msgLen: number = 56;
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
        } catch (error) {
          console.error(`DES_Func_4400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4500
     * @tc.name Test DES CBC NoPadding Abnormal Test, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: number = 56;
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
          await doCipher(algName, mode, padding, spec, symKey2,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_PROMISE);
          expect(null).assertFail();
        } catch (error) {
          console.error(`DES_Func_4500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4600
     * @tc.name Test DES CBC NoPadding Abnormal Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let algName: string = "DES64";
        let mode: string = "CBC";
        let padding: string = "PKCS7";
        let msgLen: number = 56;
        let spec: cryptoFramework.IvParamsSpec = {
          iv: {data: new Uint8Array([0, 0, 0, 0, 0,  0, 0, 0])},
          algName: "IvParamsSpec"
        };
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let symKey1: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let symKey2: cryptoFramework.SymKey = await generateSymKey(algName, asyncType.TYPE_IS_PROMISE);
        let cipherText: cryptoFramework.DataBlob = await doCipher(algName, mode, padding, spec, symKey1,
          msg, cryptoFramework.CryptoMode.ENCRYPT_MODE, asyncType.TYPE_IS_SYNC);
        try {
          await doCipher(algName, mode, padding, spec, symKey2,
            cipherText, cryptoFramework.CryptoMode.DECRYPT_MODE, asyncType.TYPE_IS_SYNC);
          expect(null).assertFail();
        } catch (error) {
          console.error(`DES_Func_4600 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4700
     * @tc.name Test DES CBC NoPadding KAT Test, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        } catch (error) {
          console.error(`DES_Func_4700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4800
     * @tc.name Test DES CFB NoPadding KAT Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        } catch (error) {
          console.error(`DES_Func_4800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_4900
     * @tc.name Test DES CBC NoPadding KAT Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_4900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        } catch (error) {
          console.error(`DES_Func_4900 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_5000
     * @tc.name Test DES CFB OFB Cross Test and msgLen < 8, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_5000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let mode1: string = "CFB";
          let mode2: string = "OFB";
          let padding: string = "PKCS7";
          let msgLen: number = 5;
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
        } catch (error) {
          console.error(`DES_Func_5000 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_5100
     * @tc.name Test DES CFB OFB Cross Test and msgLen > 8, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_5100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let algName: string = "DES64";
          let mode1: string = "CFB";
          let mode2: string = "OFB";
          let padding: string = "NoPadding";
          let msgLen: number = 9;
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
          expect(ret).assertFalse();
        } catch (error) {
          console.error(`DES_Func_5100 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_5200
     * @tc.name Test DES ECB NoPadding KAT Test, Promise decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_5200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        } catch (error) {
          console.error(`DES_Func_5200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_Security_CryptoFramework_DES_Func_5300
     * @tc.name Test DES CFB OFB Cross Test and msg: 0000, msgLen > 8, Sync decrypt Test
     * @tc.desc algorithm is DES
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_DES_Func_5300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        } catch (error) {
          console.error(`DES_Func_5300 “${error}“, error code: ${error.code}`);
          expect(null).assertTrue();
        }
        done();
      }
    );

  });
}