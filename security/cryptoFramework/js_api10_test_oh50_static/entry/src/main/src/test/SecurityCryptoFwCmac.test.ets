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
import { cryptoFramework } from '@kit.CryptoArchitectureKit'
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
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


async function doCmacPromiseSplitStub(algName: string, msgLen: int, blockSize: int): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:int = 0;
  timeoutId = setInterval(() => {
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
        setTimeout(() => {
          console.info("################ doCmacPromiseSplitStub:" + algName + ":" + "Running")
          resolve(undefined);
        }, intervalTime)
      })//.then(undefined, (error) => {
      //});
    } catch (error: BusinessError) {
      console.error(`doCmacPromiseSplitStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }
  clearInterval(timeoutId);
  return ret;
}

async function doCmacPromiseStub(algName: string, msgLen: int): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:int = 0;
  timeoutId = setInterval(() => {
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
        setTimeout(() => {
          console.info("################ doCmacPromiseStub:" + algName + ":" + "Running")
          resolve(undefined);
        }, intervalTime)
      })//.then(undefined, (error: Object) => {
      //});
    } catch (error: BusinessError) {
      console.error(`doCmacPromiseStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }
  clearInterval(timeoutId);
  return ret;
}

async function doCmacSyncSplitStub(algName: string, msgLen: int, blockSize: int): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:int = 0;
  timeoutId = setInterval(() => {
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
          resolve(undefined);
        }, intervalTime)
      })//.then(undefined, (error: Object) => {
      //});
    } catch (error: BusinessError) {
      console.error(`doCmacSyncSplitStub “${error}“, error code: ${error.code}`);
      clearInterval(timeoutId);
      return false;
    }
  }
  clearInterval(timeoutId);
  return ret;
}

async function doCmacSyncStub(algName: string, msgLen: int): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:int = 0;
  timeoutId = setInterval(() => {
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
        setTimeout(() => {
          console.info("################ doCmacSyncStub:" + algName + ":" + "Running")
          resolve(undefined);
        }, intervalTime)
      })//.then(undefined, (error: Object) => {
      //});
    } catch (error: BusinessError) {
      console.error(`doCmacSyncStub “${error}“, error code: ${error.code}`);
      clearInterval(timeoutId);
      return false;
    }
  }
  clearInterval(timeoutId);
  return ret;
}

export default function SecurityCryptoFwCmacTestUnit() {
  describe("SecurityCryptoFwCmacTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_Security_CryptoFramework_Cmac_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Cmac_Func_0100
     * @tc.desc   algorithm is hmac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Cmac_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let mdName of H_MAC_SPEC) {
          let spec: cryptoFramework.HmacSpec = {
            algName: "HMAC",
            mdName: mdName
          }
          let symAlg: string = "HMAC" + "|" + mdName;
          let msgLen: int = 30;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let secret: cryptoFramework.DataBlob = await doMacPromise(spec, symKey, msg);
          let macSize: number = getMacSize(mdName);
          expect(secret.data.byteLength).assertEqual(macSize);
        }
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: int = 30;
          let macSize: number = 16;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let secret: cryptoFramework.DataBlob = await doMacPromise(spec, symKey, msg);
          expect(secret.data.byteLength).assertEqual(macSize);
        }
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: int = 30;
          let macSize: number = 16;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let secret: cryptoFramework.DataBlob = doMacSync(spec, symKey, msg);
          expect(secret.data.byteLength).assertEqual(macSize);
        }
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: int = 120;
          let blockSize: int = 25;
          let macSize: number = 16;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let mac: macInfo = doCmacSyncSpilt(spec, msg, symKey, blockSize);
          expect(macSize).assertEqual(mac.macObj.getMacLength());
          expect(mac.dataRes.data.byteLength).assertEqual(macSize);
        }
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: int = 120;
          let blockSize: int = 14;
          let macSize: number = 16;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let mac: macInfo = await doCmacPromiseSpilt(spec, msg, symKey, blockSize);
          expect(macSize).assertEqual(mac.macObj.getMacLength());
          expect(mac.dataRes.data.byteLength).assertEqual(macSize);
        }
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: int = 20;
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
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let cipherName: string = "AES256";
      let spec: cryptoFramework.CmacSpec = {
        algName: "CMAC",
        cipherName: cipherName
      }
      let msgLen: int = 20;
      let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
      let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
      try {
        mac.updateSync(msg);
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
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
    it("SUB_Security_CryptoFramework_Cmac_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let cipherName: string = "AES128";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        let symAlg: string = cipherName;
        let msgLen: int = 20;
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
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let cipherName: string = "AES128";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        let symAlg: string = "HMAC";
        let msgLen: int = 20;
        let macSize: number = 16;
        let keyLen: int = 16;
        let keyBlob: cryptoFramework.DataBlob = await createFullData(keyLen);
        let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
        let symKey: cryptoFramework.SymKey = await convertSymKey(symAlg, keyBlob);
        let secret: cryptoFramework.DataBlob = await doMacPromise(spec, symKey, msg);
        expect(secret.data.byteLength).assertEqual(macSize);
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let cipherName: string = "AES128";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        let symAlg: string = "HMAC";
        let msgLen: int = 20;
        let macSize: number = 16;
        let keyLen: int = 16;
        let keyBlob: cryptoFramework.DataBlob = await createFullData(keyLen);
        let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
        let symKey: cryptoFramework.SymKey = await convertSymKey(symAlg, keyBlob);
        let secret: cryptoFramework.DataBlob = doMacSync(spec, symKey, msg);
        expect(secret.data.byteLength).assertEqual(macSize);
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let cipherName: string = "AES192";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        cryptoFramework.createMac(spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let cipherName: string = "AES128";
        let spec: cryptoFramework.HmacSpec = {
          algName: "HMAC",
          mdName: cipherName
        }
        cryptoFramework.createMac(spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let cipherName: string = "SHA256";
        let spec: cryptoFramework.CmacSpec = {
          algName: "CMAC",
          cipherName: cipherName
        }
        cryptoFramework.createMac(spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_Cmac_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let cipherName of C_MAC_SPEC) {
          let spec: cryptoFramework.CmacSpec = {
            algName: "CMAC",
            cipherName: cipherName
          }
          let symAlg: string = cipherName;
          let msgLen: int = 30;
          let macSize: number = 16;
          let msg: cryptoFramework.DataBlob = await createFullData(msgLen);
          let symKey: cryptoFramework.SymKey = await genSymKey(symAlg);
          let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
          await doInitMacCallback(mac, symKey);
          await doUpdateMacCallback(mac, msg);
          let secret: cryptoFramework.DataBlob = await doFinalMacCallback(mac);
          expect(secret.data.byteLength).assertEqual(macSize);
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}