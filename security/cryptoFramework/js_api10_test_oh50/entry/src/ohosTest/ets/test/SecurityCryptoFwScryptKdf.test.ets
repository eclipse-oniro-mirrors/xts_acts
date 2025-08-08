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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level, } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { taskpool } from '@kit.ArkTS';
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
import { BusinessError } from '@kit.BasicServicesKit';


@Concurrent
async function doScryptKdfPromiseStub(keySize: number, n: number, r: number, p: number): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  setInterval(() => {
    timeFlag = true;
  }, stressTimeout);
  while (!timeFlag) {
    try {
      let spec: cryptoFramework.ScryptSpec = {
        algName: "SCRYPT",
        passphrase: "password",
        salt: new Uint8Array(16),
        n: n,
        r: r,
        p: p,
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
        timeoutId = setTimeout(() => {
          console.info("################ doScryptKdfPromiseStub:" + keySize + ":" + "Running")
          resolve();
        }, intervalTime)
      }).then(undefined, (error: Object) => {
      });
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doScryptKdfPromiseStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }
  return ret;
}

@Concurrent
async function doScryptKdfSyncStub(keySize: number, n: number, r: number, p: number): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  setInterval(() => {
    timeFlag = true;
  }, stressTimeout);
  while (!timeFlag) {
    try {
      let spec: cryptoFramework.ScryptSpec = {
        algName: "SCRYPT",
        passphrase: "password",
        salt: new Uint8Array(16),
        n: n,
        r: r,
        p: p,
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
        timeoutId = setTimeout(() => {
          console.info("################ doScryptKdfSyncStub:" + keySize + ":" + "Running")
          resolve();
        }, intervalTime)
      }).then(undefined, (error: Object) => {
      });
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doScryptKdfSyncStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }
  return ret;
}

@Concurrent
async function doScryptKdfCallbackStub(keySize: number, n: number, r: number, p: number): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  setInterval(() => {
    timeFlag = true;
  }, stressTimeout);
  while (!timeFlag) {
    try {
      let spec: cryptoFramework.ScryptSpec = {
        algName: "SCRYPT",
        passphrase: "password",
        salt: new Uint8Array(16),
        n: n,
        r: r,
        p: p,
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
        timeoutId = setTimeout(() => {
          console.info("################ doScryptKdfCallbackStub:" + keySize + ":" + "Running")
          resolve();
        }, intervalTime)
      }).then(undefined, (error: Object) => {
      });
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doScryptKdfCallbackStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }
  return ret;
}

export default function SecurityCryptoFwScryptKdfTestUnit() {
  describe('SecurityCryptoFwScryptKdfTestUnit', () => {
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
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0000
     * @tc.name Test scrypt kdf algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is scrypt stub test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            console.info("#################### ret:" + ret)
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0000 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0100
     * @tc.name Test scrypt kdf algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is scrypt test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;
        let start_time = new Date().getTime()
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            "password", new Uint8Array(16), CallbackType.TYPE_IS_PROMISE);
        }
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
        let end_time = new Date().getTime() // 毫秒
        console.info("#################### time:" + (end_time - start_time))
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0100 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0200
     * @tc.name Test scrypt kdf algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is scrypt test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            "password", new Uint8Array(16), CallbackType.TYPE_IS_SYNC);
        }
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0200 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0300
     * @tc.name Test scrypt kdf algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is scrypt salt is empty test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            "password", new Uint8Array(), CallbackType.TYPE_IS_PROMISE);
        }
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0300 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0400
     * @tc.name Test scrypt kdf algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is scrypt salt is empty test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            "password", new Uint8Array(), CallbackType.TYPE_IS_SYNC);
        }
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0400 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0500
     * @tc.name Test scrypt kdf algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is scrypt passphrase is Uint8Array test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            new Uint8Array(8), new Uint8Array(), CallbackType.TYPE_IS_PROMISE);
        }
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0500 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0600
     * @tc.name Test scrypt kdf algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is scrypt passphrase is Uint8Array test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            new Uint8Array(8), new Uint8Array(), CallbackType.TYPE_IS_PROMISE);
        }
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0600 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0700
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt passphrase is Uint8Array test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            new Uint8Array(8), new Uint8Array(), CallbackType.TYPE_IS_CALLBACK);
        }
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0700 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0800
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt passphrase is string test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        for (let keySize of keyLens) {
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
            "password", new Uint8Array(12), CallbackType.TYPE_IS_CALLBACK);
        }
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0800 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0900
     * @tc.name Test scrypt kdf algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is scrypt keySize is zero test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let keySize: number = 0;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_0900 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1000
     * @tc.name Test scrypt kdf algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is scrypt keySize is zero test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 - 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1000 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1100
     * @tc.name Test scrypt kdf algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is scrypt p is zero test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 0;
        let r: number = 8;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1100 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1200
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt n is zero test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 0;
        let p: number = 1;
        let r: number = 8;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1200 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1300
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt n is 1 test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1;
        let p: number = 1;
        let r: number = 8;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1300 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1400
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt n is not power of 2 test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 7;
        let p: number = 1;
        let r: number = 8;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1400 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1500
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt n is negative number test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = -2;
        let p: number = 1;
        let r: number = 8;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1500 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1600
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt r is zero test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 0;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1600 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1700
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt r is negative number test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = -1;
        let keySize: number = 16;
        let maxMemory: number = p * 128;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1700 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1800
     * @tc.name Test scrypt kdf algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is scrypt n >= 2^(128 * r/8) test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 65536;
        let p: number = 1;
        let r: number = 1;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1800 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1900
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt n >= ((UINT32_MAX/128)/r) test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 514;
        let p: number = 1;
        let r: number = 65536;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_CALLBACK);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_1900 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2000
     * @tc.name Test scrypt kdf algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is scrypt p > ((2^32 -1) * 32)/(128 * r) test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 16;
        let p: number = 65536;
        let r: number = 65536;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2000 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2100
     * @tc.name Test scrypt kdf algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is scrypt r * p > 2^30 - 1 test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 16;
        let p: number = 16384;
        let r: number = 65536;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2100 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2200
     * @tc.name Test scrypt kdf algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is scrypt r * p * 128 >= UINT32_MAX test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 16;
        let p: number = 512;
        let r: number = 65536;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2200 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2300
     * @tc.name Test scrypt kdf algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is scrypt r * p > 2^30 - 1 test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 16;
        let p: number = 4194304; // 2^22
        let r: number = 256;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "password", new Uint8Array(12), CallbackType.TYPE_IS_PROMISE);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2300 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2400
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt r * p > 2^30 - 1 test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 16;
        let p: number = 67108864; // 2^26
        let r: number = 16;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          new Uint8Array(64), new Uint8Array(12), CallbackType.TYPE_IS_CALLBACK);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2400 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2500
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt r * p * 128 > UINT32_MAX test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 16;
        let p: number = 2097152;
        let r: number = 16;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          new Uint8Array(64), new Uint8Array(12), CallbackType.TYPE_IS_CALLBACK);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2500 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2600
     * @tc.name Test scrypt kdf algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is scrypt passphrase is empty, type string test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          "", new Uint8Array(12), CallbackType.TYPE_IS_CALLBACK);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2600 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2700
     * @tc.name Test scrypt kdf algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is scrypt passphrase is empty, type string test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let keySize: number = 16;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          new Uint8Array(), new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2700 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2800
     * @tc.name Test scrypt kdf algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is scrypt vector test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let expectSecret: cryptoFramework.DataBlob = {} as cryptoFramework.DataBlob;
      try {
        for (let vector of vectors) {
          let n: number = vector.n;
          let p: number = vector.p;
          let r: number = vector.r;
          let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;
          let salt: Uint8Array = stringToUint8Array(vector.salt);
          expectSecret = {data: new Uint8Array(vector.secret)};
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, vector.keySize,
            vector.passphrase, salt, CallbackType.TYPE_IS_PROMISE);
          await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
            for (let secret of secrets) {
              let res: secretResult = secret as secretResult;
              let ret: boolean = compareDataBlob(res.secret, expectSecret);
              expect(res.ret).assertTrue();
              expect(ret).assertTrue();
            }
          });
          taskpool.cancel(taskGroup);
        }
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2800 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2900
     * @tc.name Test scrypt kdf algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is scrypt passphrase is empty, type string test
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let n: number = 1024;
        let p: number = 1;
        let r: number = 8;
        let keySize: number = 16.3;
        let maxMemory: number = p * 128 * r + 32 * r * (n + 2) * 4 + 1;

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(doScryptKdfTaskPool, maxMemory, n, r, p, keySize,
          new Uint8Array(16), new Uint8Array(12), CallbackType.TYPE_IS_SYNC);
        await taskpool.execute(taskGroup).then((secrets: Array<Object>) => {
          for (let secret of secrets) {
            let res: secretResult = secret as secretResult;
            expect(res.ret).assertFalse();
            expect(res.code).assertEqual(0);
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_Scrypt_Kdf_Func_2900 “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

  });
}