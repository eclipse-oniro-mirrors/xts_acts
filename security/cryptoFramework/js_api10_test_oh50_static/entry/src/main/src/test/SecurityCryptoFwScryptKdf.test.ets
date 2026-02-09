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
import {
  CallbackType,
  doScryptKdfCallback,
  doScryptKdfPromise,
  doScryptKdfSync,
  doScryptKdfTaskPool,
  intervalTime, keyLens,
  secretResult,
  stressTimeout,
  vectors
} from './utils/scrypt/scryptUtils';
import { compareDataBlob, stringToUint8Array } from './utils/common/commonUtils';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


async function doScryptKdfPromiseStub(keySize: int, n: int, r: int, p: int): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:int = 0;
  timeoutId = setInterval(() => {
    timeFlag = true;
  }, stressTimeout);
  while (!timeFlag) {
    try {
      let spec: cryptoFramework.ScryptSpec = {
        algName: "SCRYPT",
        passphrase: "password",
        salt: new Uint8Array(16),
        n: n as long,
        r: r as long,
        p: p as long,
        maxMemory: p * 128 * r + 32 * r * (n + 2) * 4 + 1,
        keySize: keySize
      }
      let secret: cryptoFramework.DataBlob = await doScryptKdfPromise(spec);
      if (secret.data.byteLength != keySize) {
        timeFlag = true;
        let error: BusinessError = {code: 401} as BusinessError;
        throw error as Error;
      }
      await new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          console.info("################ doScryptKdfPromiseStub:" + keySize + ":" + "Running")
          resolve(undefined);
        }, intervalTime)
      })//.then(undefined, (error: Object) => {
      // });
    } catch (error) {
      console.error(`doScryptKdfPromiseStub “${error}“, error code: ${error.code}`);
      clearInterval(timeoutId);
      return false;
    }
  }
  clearInterval(timeoutId);

  return ret;
}

async function doScryptKdfSyncStub(keySize: int, n: int, r: int, p: int): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:int = 0;
  timeoutId = setInterval(() => {
    timeFlag = true;
  }, stressTimeout);
  while (!timeFlag) {
    try {
      let spec: cryptoFramework.ScryptSpec = {
        algName: "SCRYPT",
        passphrase: "password",
        salt: new Uint8Array(16),
        n: n as long,
        r: r as long,
        p: p as long,
        maxMemory: p * 128 * r + 32 * r * (n + 2) * 4 + 1,
        keySize: keySize
      }
      let secret: cryptoFramework.DataBlob = doScryptKdfSync(spec);
      if (secret.data.byteLength != keySize) {
        timeFlag = true;
        let error: BusinessError = {code: 401} as BusinessError;
        throw error as Error;
      }
      await new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          console.info("################ doScryptKdfSyncStub:" + keySize + ":" + "Running")
          resolve(undefined);
        }, intervalTime)
      })//.then(undefined, (error: Object) => {});

    } catch (error) {
      console.error(`doScryptKdfSyncStub “${error}“, error code: ${error.code}`);
      clearInterval(timeoutId);
      return false;
    }
  }
  clearInterval(timeoutId);
  return ret;
}

async function doScryptKdfCallbackStub(keySize: int, n: int, r: int, p: int): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:int = 0;
  timeoutId = setInterval(() => {
    timeFlag = true;
  }, stressTimeout);
  while (!timeFlag) {
    try {
      let spec: cryptoFramework.ScryptSpec = {
        algName: "SCRYPT",
        passphrase: "password",
        salt: new Uint8Array(16),
        n: n as long,
        r: r as long,
        p: p as long,
        maxMemory: p * 128 * r + 32 * r * (n + 2) * 4 + 1,
        keySize: keySize
      }
      let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("SCRYPT");
      let secret: cryptoFramework.DataBlob = await doScryptKdfCallback(kdf, spec);
      if (secret.data.byteLength != keySize) {
        timeFlag = true;
        let error: BusinessError = {code: 401} as BusinessError;
        throw error as Error;
      }
      await new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          console.info("################ doScryptKdfCallbackStub:" + keySize + ":" + "Running")
          resolve(undefined);
        }, intervalTime)
      })//.then(undefined, (error: Object) => {});

    } catch (error) {
      console.error(`doScryptKdfCallbackStub “${error}“, error code: ${error.code}`);
      clearInterval(timeoutId);
      return false;
    }
  }
  clearInterval(timeoutId);
  return ret;
}

export default function SecurityCryptoFwScryptKdfTestUnit() {
  describe("SecurityCryptoFwScryptKdfTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0000
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0000
     * @tc.desc   algorithm is scrypt stub test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        // Promise
        taskGroup.addTask(doScryptKdfPromiseStub, 64, 1024, 8, 2);
        taskGroup.addTask(doScryptKdfPromiseStub, 256, 1024, 8, 16);
        taskGroup.addTask(doScryptKdfPromiseStub, 512, 1024, 8, 16);
        taskGroup.addTask(doScryptKdfPromiseStub, 1024, 1024, 8, 16);
        // Sync
        taskGroup.addTask(doScryptKdfSyncStub, 64, 1024, 8, 2);
        taskGroup.addTask(doScryptKdfSyncStub, 256, 1024, 8, 16);
        taskGroup.addTask(doScryptKdfSyncStub, 512, 1024, 8, 16);
        taskGroup.addTask(doScryptKdfSyncStub, 1024, 1024, 8, 16);
        // Callback
        taskGroup.addTask(doScryptKdfCallbackStub, 64, 1024, 8, 2);
        taskGroup.addTask(doScryptKdfCallbackStub, 256, 1024, 8, 16);
        taskGroup.addTask(doScryptKdfCallbackStub, 512, 1024, 8, 16);
        taskGroup.addTask(doScryptKdfCallbackStub, 1024, 1024, 8, 16);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<boolean> = res?(res as Array<boolean>) : new Array<Boolean>();
          for (let i = 0; i< tmp.length; i++) {
            let ret: boolean = tmp[i] as boolean;
            console.info("#################### ret:" + ret)
            expect(ret).assertTrue();
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0000 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0100
     * @tc.desc   algorithm is scrypt test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;
        let start_time = new Date().getTime()
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            "password", new Uint8Array(16), CallbackType.TYPE_IS_PROMISE);
        }
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let ret: boolean = tmp[i].ret as boolean;
            console.info("#################### ret:" + ret)
            expect(ret).assertTrue();
          }
        });
        // taskpool.cancel(taskGroup);
        let end_time = new Date().getTime() // 毫秒
        console.info("#################### time:" + (end_time - start_time))
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0100 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0200
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0200
     * @tc.desc   algorithm is scrypt test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            "password", new Uint8Array(16), CallbackType.TYPE_IS_SYNC);
        }
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let ret: boolean = tmp[i].ret as boolean;
            console.info("#################### ret:" + ret)
            expect(ret).assertTrue();
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0200 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0300
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0300
     * @tc.desc   algorithm is scrypt salt is empty test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            "password", new Uint8Array(), CallbackType.TYPE_IS_PROMISE);
        }
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let ret: boolean = tmp[i].ret as boolean;
            console.info("#################### ret:" + ret)
            expect(ret).assertTrue();
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0300 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0400
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0400
     * @tc.desc   algorithm is scrypt salt is empty test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            "password", new Uint8Array(), CallbackType.TYPE_IS_SYNC);
        }
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let ret: boolean = tmp[i].ret as boolean;
            console.info("#################### ret:" + ret)
            expect(ret).assertTrue();
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0400 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0500
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0500
     * @tc.desc   algorithm is scrypt passphrase is Uint8Array test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            new Uint8Array(8), new Uint8Array(), CallbackType.TYPE_IS_PROMISE);
        }
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let ret: boolean = tmp[i].ret as boolean;
            console.info("#################### ret:" + ret)
            expect(ret).assertTrue();
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0500 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0600
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0600
     * @tc.desc   algorithm is scrypt passphrase is Uint8Array test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            new Uint8Array(8), new Uint8Array(), CallbackType.TYPE_IS_PROMISE);
        }
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let ret: boolean = tmp[i].ret as boolean;
            console.info("#################### ret:" + ret)
            expect(ret).assertTrue();
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0600 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0700
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0700
     * @tc.desc   algorithm is scrypt passphrase is Uint8Array test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            new Uint8Array(8), new Uint8Array(), CallbackType.TYPE_IS_CALLBACK);
        }
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let ret: boolean = tmp[i].ret as boolean;
            console.info("#################### ret:" + ret)
            expect(ret).assertTrue();
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0700 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0800
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0800
     * @tc.desc   algorithm is scrypt passphrase is string test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            "password", new Uint8Array(12), CallbackType.TYPE_IS_CALLBACK);
        }
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let ret: boolean = tmp[i].ret as boolean;
            console.info("#################### ret:" + ret)
            expect(ret).assertTrue();
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0800 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0900
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0900
     * @tc.desc   algorithm is scrypt keySize is zero test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let keySize: int = 0;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0900 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1000
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1000
     * @tc.desc   algorithm is scrypt keySize is zero test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 - 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1000 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1100
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1100
     * @tc.desc   algorithm is scrypt p is zero test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 0;
        let r: long = 8;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1100 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1200
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1200
     * @tc.desc   algorithm is scrypt n is zero test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 0;
        let p: long = 1;
        let r: long = 8;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1200 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1300
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1300
     * @tc.desc   algorithm is scrypt n is 1 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1;
        let p: long = 1;
        let r: long = 8;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1300 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1400
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1400
     * @tc.desc   algorithm is scrypt n is not power of 2 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 7;
        let p: long = 1;
        let r: long = 8;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1400 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1500
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1500
     * @tc.desc   algorithm is scrypt n is negative number test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = -2;
        let p: long = 1;
        let r: long = 8;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1500 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1600
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1600
     * @tc.desc   algorithm is scrypt r is zero test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 0;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1600 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1700
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1700
     * @tc.desc   algorithm is scrypt r is negative number test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = -1;
        let keySize: int = 16;
        let maxMemory: long = p * 128;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1700 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1800
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1800
     * @tc.desc   algorithm is scrypt n >= 2^(128 * r/8) test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 65536;
        let p: long = 1;
        let r: long = 1;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1800 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1900
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1900
     * @tc.desc   algorithm is scrypt n >= ((UINT32_MAX/128)/r) test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 514;
        let p: long = 1;
        let r: long = 65536;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_CALLBACK);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1900 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2000
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2000
     * @tc.desc   algorithm is scrypt p > ((2^32 -1) * 32)/(128 * r) test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 16;
        let p: long = 65536;
        let r: long = 65536;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2000 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2100
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2100
     * @tc.desc   algorithm is scrypt r * p > 2^30 - 1 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 16;
        let p: long = 16384;
        let r: long = 65536;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2100 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2200
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2200
     * @tc.desc   algorithm is scrypt r * p * 128 >= UINT32_MAX test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 16;
        let p: long = 512;
        let r: long = 65536;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2200 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2300
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2300
     * @tc.desc   algorithm is scrypt r * p > 2^30 - 1 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 16;
        let p: long = 4194304; // 2^22
        let r: long = 256;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2300 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2400
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2400
     * @tc.desc   algorithm is scrypt r * p > 2^30 - 1 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 16;
        let p: long = 67108864; // 2^26
        let r: long = 16;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          new Uint8Array(64), new Uint8Array(12), CallbackType.TYPE_IS_CALLBACK);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2400 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2500
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2500
     * @tc.desc   algorithm is scrypt r * p * 128 > UINT32_MAX test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 16;
        let p: long = 2097152;
        let r: long = 16;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          new Uint8Array(64), new Uint8Array(12), CallbackType.TYPE_IS_CALLBACK);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2500 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2600
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2600
     * @tc.desc   algorithm is scrypt passphrase is empty, type string test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "", new Uint8Array(12), CallbackType.TYPE_IS_CALLBACK);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2600 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2700
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2700
     * @tc.desc   algorithm is scrypt passphrase is empty, type string test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let n: long = 1024;
        let p: long = 1;
        let r: long = 8;
        let keySize: int = 16;
        let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          new Uint8Array(), new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((res: Any) => {
          let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
          for (let i = 0; i< tmp.length; i++) {
            let res: secretResult = tmp[i] as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
        // taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2700 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2800
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2800
     * @tc.desc   algorithm is scrypt vector test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let expectSecret: cryptoFramework.DataBlob;
      try {
        for (let vector of vectors) {
          let n: long = vector.n;
          let p: long = vector.p;
          let r: long = vector.r;
          let maxMemory: long = p * 128 * r + 32 * r * (n + 2) * 4 + 1;
          let salt: Uint8Array = stringToUint8Array(vector.salt);
          expectSecret = {data: new Uint8Array(vector.secret)};
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, vector.keySize,
            vector.passphrase, salt, CallbackType.TYPE_IS_PROMISE);
          await taskpool.execute(taskGroup).then((res: Any) => {
            let tmp: Array<secretResult> = res?(res as Array<secretResult>) : new Array<secretResult>();
            for (let i = 0; i< tmp.length; i++) {
              let res: secretResult = tmp[i] as secretResult;
              let ret: boolean = compareDataBlob(res.secret, expectSecret);
              expect(res.ret).assertTrue();
              expect(ret).assertTrue();
            }
          });
          // taskpool.cancel(taskGroup);
        }
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2800 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}