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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { taskpool } from '@kit.ArkTS';
import {
  aes256_key,
  C_MAC_SPEC,
  doCmacPromiseSpilt,
  doCmacSyncSpilt,
  doFinalMacCallback,
  doInitMacCallback,
  doMacPromise, doMacSync,
  doUpdateMacCallback,
  genSymKey,
  intervalTime,
  macInfo,
  secret_null,
  stressTimeout,
  vectorInfo,
  vectors} from './utils/cmac/cmacUtils';
import { convertSymKey, getMacSize, H_MAC_SPEC } from './utils/hmac/hmacSyncUtils';
import { compareDataBlob, createFullData } from './utils/common/commonUtils';


@Concurrent
async function doCmacPromiseSplitStub(algName: string, msgLen: number, blockSize: number): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  setInterval(() => {
    timeFlag = true;
  }, stressTimeout);
  let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
  let symKey: cryptoFramework.SymKey = await genSymKey(algName);
  while (!timeFlag) {
    try {
      let spec: cryptoFramework.CmacSpec = {
        algName: "CMAC",
        cipherName: algName
      }
      await doCmacPromiseSpilt(spec, msg, symKey, blockSize);
      await new Promise<void>((resolve, reject) => {
        timeoutId = setTimeout(() => {
          console.info("################ doCmacPromiseSplitStub:" + algName + ":" + "Running")
          resolve();
        }, intervalTime)
      }).then(undefined, (error: Object) => {
      });
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doCmacPromiseSplitStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }
  return ret;
}

@Concurrent
async function doCmacPromiseStub(algName: string, msgLen: number): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  setInterval(() => {
    timeFlag = true;
  }, stressTimeout);
  let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
  let symKey: cryptoFramework.SymKey = await genSymKey(algName);
  while (!timeFlag) {
    try {
      let spec: cryptoFramework.CmacSpec = {
        algName: "CMAC",
        cipherName: algName
      }
      await doMacPromise(spec, symKey, msg);
      await new Promise<void>((resolve, reject) => {
        timeoutId = setTimeout(() => {
          console.info("################ doCmacPromiseStub:" + algName + ":" + "Running")
          resolve();
        }, intervalTime)
      }).then(undefined, (error: Object) => {
      });
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doCmacPromiseStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }
  return ret;
}

@Concurrent
async function doCmacSyncSplitStub(algName: string, msgLen: number, blockSize: number): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  setInterval(() => {
    timeFlag = true;
  }, stressTimeout);
  let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
  let symKey: cryptoFramework.SymKey = await genSymKey(algName);
  while (!timeFlag) {
    try {
      let spec: cryptoFramework.CmacSpec = {
        algName: "CMAC",
        cipherName: algName
      }
      doCmacSyncSpilt(spec, msg, symKey, blockSize);
      await new Promise<void>((resolve, reject) => {
        timeoutId = setTimeout(() => {
          console.info("################ doCmacSyncSplitStub:" + algName + ":" + "Running")
          resolve();
        }, intervalTime)
      }).then(undefined, (error: Object) => {
      });
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doCmacSyncSplitStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }
  return ret;
}

@Concurrent
async function doCmacSyncStub(algName: string, msgLen: number): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  setInterval(() => {
    timeFlag = true;
  }, stressTimeout);
  let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
  let symKey: cryptoFramework.SymKey = await genSymKey(algName);
  while (!timeFlag) {
    try {
      let spec: cryptoFramework.CmacSpec = {
        algName: "CMAC",
        cipherName: algName
      }
      doMacSync(spec, symKey, msg);
      await new Promise<void>((resolve, reject) => {
        timeoutId = setTimeout(() => {
          console.info("################ doCmacSyncStub:" + algName + ":" + "Running")
          resolve();
        }, intervalTime)
      }).then(undefined, (error: Object) => {
      });
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doCmacSyncStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }
  return ret;
}

export default function SecurityCryptoFwCmacTestUnit() {
  describe('SecurityCryptoFwCmacTestUnit', () => {
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
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_0000
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_0000
     * @tc.desc   SUB_Security_CryptoFramework_Cmac_Func_0000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_0000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let msgLen: number = 1024;
        let blockSize: number = 25;
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        // Promise
        taskGroup.addTask(doCmacPromiseSplitStub, "AES128", msgLen, blockSize);
        taskGroup.addTask(doCmacPromiseSplitStub, "AES256", msgLen, blockSize);
        taskGroup.addTask(doCmacPromiseStub, "AES128", msgLen);
        taskGroup.addTask(doCmacPromiseStub, "AES256", msgLen);
        // Sync
        taskGroup.addTask(doCmacSyncSplitStub, "AES128", msgLen, blockSize);
        taskGroup.addTask(doCmacSyncSplitStub, "AES256", msgLen, blockSize);
        taskGroup.addTask(doCmacSyncStub, "AES128", msgLen);
        taskGroup.addTask(doCmacSyncStub, "AES256", msgLen);
        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            console.info("#################### ret:" + ret)
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Cmac_Func_0000 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_0100
     * @tc.desc   algorithm is hmac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        for (let mdName of H_MAC_SPEC) {
          let spec: cryptoFramework.HmacSpec = {
            algName: "HMAC",
            mdName: mdName
          }
          let symAlg: string = "HMAC" + "|" + mdName;
          let msgLen: number = 30;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let secret: cryptoFramework.DataBlob = await doMacPromise(spec, symKey, msg);
          let macSize: number = getMacSize(mdName);
          expect(secret.data.byteLength).assertEqual(macSize);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_0200
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_0200
     * @tc.desc   algorithm is cmac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: number = 30;
          let macSize: number = 16;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let secret: cryptoFramework.DataBlob = await doMacPromise(spec, symKey, msg);
          expect(secret.data.byteLength).assertEqual(macSize);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_0300
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_0300
     * @tc.desc   algorithm is cmac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: number = 30;
          let macSize: number = 16;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let secret: cryptoFramework.DataBlob = doMacSync(spec, symKey, msg);
          expect(secret.data.byteLength).assertEqual(macSize);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_0400
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_0400
     * @tc.desc   algorithm is cmac, msg split test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: number = 120;
          let blockSize: number = 25;
          let macSize: number = 16;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let mac: macInfo = doCmacSyncSpilt(spec, msg, symKey, blockSize);
          expect(macSize).assertEqual(mac.macObj.getMacLength());
          expect(mac.dataRes.data.byteLength).assertEqual(macSize);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_0500
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_0500
     * @tc.desc   algorithm is cmac, msg split test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: number = 120;
          let blockSize: number = 14;
          let macSize: number = 16;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let mac: macInfo = await doCmacPromiseSpilt(spec, msg, symKey, blockSize);
          expect(macSize).assertEqual(mac.macObj.getMacLength());
          expect(mac.dataRes.data.byteLength).assertEqual(macSize);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_0600
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_0600
     * @tc.desc   algorithm is cmac, msg is empty test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipherName: string = "AES256";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        let symAlg: string = cipherName;
        let macSize: number = 16;
        let keyBlob: cryptoFramework.DataBlob = {data: new Uint8Array(aes256_key)}
        let symKey: cryptoFramework.SymKey = await convertSymKey(symAlg, keyBlob);
        let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
        await mac.init(symKey);
        let secret: cryptoFramework.DataBlob = await mac.doFinal();
        expect(macSize).assertEqual(mac.getMacLength());
        expect(secret.data.byteLength).assertEqual(macSize);
        let ret: boolean = compareDataBlob({data: new Uint8Array(secret_null)}, secret);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_0700
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_0700
     * @tc.desc   algorithm is cmac, msg is empty test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipherName: string = "AES256";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        let symAlg: string = cipherName;
        let macSize: number = 16;
        let keyBlob: cryptoFramework.DataBlob = {data: new Uint8Array(aes256_key)}
        let symKey: cryptoFramework.SymKey = await convertSymKey(symAlg, keyBlob);
        let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
        mac.initSync(symKey);
        let secret: cryptoFramework.DataBlob = mac.doFinalSync();
        expect(macSize).assertEqual(mac.getMacLength());
        expect(secret.data.byteLength).assertEqual(macSize);
        let ret: boolean = compareDataBlob({data: new Uint8Array(secret_null)}, secret);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_0800
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_0800
     * @tc.desc   algorithm is cmac, msg split test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: number = 20;
          let macSize: number = 16;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
          mac.initSync(symKey);
          await mac.update(msg);
          let secret: cryptoFramework.DataBlob = mac.doFinalSync();
          expect(macSize).assertEqual(mac.getMacLength());
          expect(secret.data.byteLength).assertEqual(macSize);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_0900
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_0900
     * @tc.desc   algorithm is cmac, update msg is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipherName: string = "AES128";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        let symAlg: string = cipherName;
        let msg: cryptoFramework.DataBlob = {data:new Uint8Array()};
        let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
        let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
        await mac.init(symKey);
        await mac.update(msg);
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_1100
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_1100
     * @tc.desc   algorithm is cmac, update msg is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let cipherName: string = "AES256";
      let spec: cryptoFramework.CmacSpec = {
        algName: "CMAC",
        cipherName: cipherName
      }
      let msgLen: number = 20;
      let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
      let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
      try {
        mac.updateSync(msg);
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_1200
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_1200
     * @tc.desc   algorithm is cmac, updateSync msg is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipherName: string = "AES128";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        let symAlg: string = cipherName;
        let msg: cryptoFramework.DataBlob = {data:new Uint8Array()};
        let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
        let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
        mac.initSync(symKey);
        mac.updateSync(msg);
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_1300
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_1300
     * @tc.desc   algorithm is cmac, msg split test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipherName: string = "AES128";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        let symAlg: string = cipherName;
        let msgLen: number = 20;
        let macSize: number = 16;
        let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
        let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);

        let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
        mac.initSync(symKey);
        let secret: cryptoFramework.DataBlob = await mac.doFinal();
        await mac.update(msg);
        await mac.doFinal();
        expect(macSize).assertEqual(mac.getMacLength());
        expect(secret.data.byteLength).assertEqual(macSize);
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_1400
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_1400
     * @tc.desc   algorithm is cmac, key convert with hmac test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipherName: string = "AES128";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        let symAlg: string = "HMAC";
        let msgLen: number = 20;
        let macSize: number = 16;
        let keyLen: number = 16;
        let keyBlob: cryptoFramework.DataBlob = await createFullData(keyLen);
        let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
        let symKey: cryptoFramework.SymKey = await convertSymKey(symAlg, keyBlob);
        let secret: cryptoFramework.DataBlob = await doMacPromise(spec, symKey, msg);
        expect(secret.data.byteLength).assertEqual(macSize);
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_1500
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_1500
     * @tc.desc   algorithm is cmac, key convert with hmac test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipherName: string = "AES128";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        let symAlg: string = "HMAC";
        let msgLen: number = 20;
        let macSize: number = 16;
        let keyLen: number = 16;
        let keyBlob: cryptoFramework.DataBlob = await createFullData(keyLen);
        let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
        let symKey: cryptoFramework.SymKey = await convertSymKey(symAlg, keyBlob);
        let secret: cryptoFramework.DataBlob = doMacSync(spec, symKey, msg);
        expect(secret.data.byteLength).assertEqual(macSize);
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_1600
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_1600
     * @tc.desc   algorithm is cmac, not support cipher test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipherName: string = "AES192";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        cryptoFramework.createMac(spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_1700
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_1700
     * @tc.desc   algorithm is cmac, not support cipher test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipherName: string = "AES128";
        let spec: cryptoFramework.HmacSpec = {
          algName: "HMAC",
          mdName: cipherName
        }
        cryptoFramework.createMac(spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_1800
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_1800
     * @tc.desc   algorithm is cmac, not support cipher test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let cipherName: string = "SHA256";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        cryptoFramework.createMac(spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_1900
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_1900
     * @tc.desc   algorithm is cmac, rfc 4493 vector test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let v: vectorInfo[] = vectors;
        for (let vector of v) {
          let cipherName: string = vector.cipherName;
          let msg: cryptoFramework.DataBlob = {data: new Uint8Array(vector.msg)}
          let keyBlob: cryptoFramework.DataBlob = {data: new Uint8Array(vector.key)}
          let expect_secret: cryptoFramework.DataBlob = {data: new Uint8Array(vector.secret)}
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symKey: cryptoFramework.SymKey = await convertSymKey(cipherName, keyBlob);
          let secret: cryptoFramework.DataBlob = await doMacPromise(spec, symKey, msg);
          let ret: boolean = compareDataBlob(secret, expect_secret);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_2000
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_2000
     * @tc.desc   algorithm is cmac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: number = 30;
          let macSize: number = 16;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
          await doInitMacCallback(mac, symKey);
          await doUpdateMacCallback(mac, msg);
          let secret: cryptoFramework.DataBlob = await doFinalMacCallback(mac);
          expect(secret.data.byteLength).assertEqual(macSize);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}