/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import * as commonUtils from './utils/common/commonUtils';
import { taskpool } from '@kit.ArkTS';
import {
  rsaEncodedBySpecTest,
  passwd_max_string,
  rsaDecodedBySpecPromiseTest,
  rsaDecodedBySpecSyncTest,
  rsa_enc_prikey,
  rsa_enc_prikey_pkcs1,
  rsa_enc_prikey_error,
  rsa_prikey,
  rsa_pubkey,
  cipherSpec,
  rsaSpec
} from './utils/rsa/rsaEncodeDecodeWithPasswdUtils';


@Concurrent
async function doRSAEncodeDecodeByPasswdPromiseSpecStub(format: string): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  let intervalTime = 10000;
  let ret: boolean = true;
  setInterval(() => {
    timeFlag = true;
  }, 3600000 * 6 * 3);
  while (!timeFlag) {
    try {
      let index1: number = Math.floor(Math.random() * 7);
      let index2: number = Math.floor(Math.random() * 4);
      let algName: string = rsaSpec[index1];
      let cipherName: string = cipherSpec[index2];
      ret = await rsaDecodedBySpecPromiseTest(algName, cipherName, format);
      if (!ret) {
        timeFlag = true;
      }
      await new Promise<void>((resolve, reject) => {
        timeoutId = setTimeout(() => {
          resolve()
        }, intervalTime)
      }).then(undefined, (error: Object) =>{});
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doRSAEncodeDecodeByPasswdPromiseSpecStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }

  return ret;
}

@Concurrent
async function doRSAEncodeDecodeByPasswdSyncSpecStub(format: string): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  let intervalTime = 10000;
  let ret: boolean = true;
  setInterval(() => {
    timeFlag = true;
  }, 3600000 * 6 * 3);
  while (!timeFlag) {
    try {
      let index1: number = Math.floor(Math.random() * 7);
      let index2: number = Math.floor(Math.random() * 4);
      let algName: string = rsaSpec[index1];
      let cipherName: string = cipherSpec[index2];
      ret = await rsaDecodedBySpecSyncTest(algName, cipherName, format);
      if (!ret) {
        timeFlag = true;
      }
      await new Promise<void>((resolve, reject) => {
        timeoutId = setTimeout(() => {
          resolve()
        }, intervalTime)
      }).then(undefined, (error: Object) =>{});
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doRSAEncodeDecodeByPasswdSyncSpecStub “${error}“, error code: ${error.code}`);
      return false;
    }
  }

  return ret;
}

export default function SecurityCryptoFwRSAEncodeDecodeWithSecretTestUnit() {
  describe('SecurityCryptoFwRSAEncodeDecodeWithSecretTestUnit', () => {
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
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0100
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0100
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA512";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_0100 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0200
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0200
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA768";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_0200 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0300
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0300
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_0300 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0400
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0400
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA2048";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_0400 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0500
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0500
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA3072";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_0500 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0600
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0600
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA4096";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_0600 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0700
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0700
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA8192";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaEncodedBySpecTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_0700 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0800
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0800
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA1024";
      let passWd: string = "";
      let cipherName: string = "AES-128-CBC";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      try {
        keyPair.priKey.getEncodedPem("PKCS1", {password: passWd, cipherName: cipherName})
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_0800 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0900
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0900
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA1024";
      let passWd: string = passwd_max_string;
      let cipherName: string = "AES-128-CBC";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      try {
        keyPair.priKey.getEncodedPem("PKCS8", {password: passWd, cipherName: cipherName})
        expect(null).assertNull();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_0900 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1000
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1000
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA1024";
      let passWd: string = passwd_max_string + 'a';
      let cipherName: string = "AES-128-CBC";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      try {
        keyPair.priKey.getEncodedPem("PKCS8", {password: passWd, cipherName: cipherName})
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_1000 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1100
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1100
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA1024";
      let passWd: string = '嗨，嗨';
      let cipherName: string = "AES-128-CBC";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      try {
        keyPair.priKey.getEncodedPem("PKCS8", {password: passWd, cipherName: cipherName})
        expect(null).assertNull();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_1100 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1200
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1200
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA1024";
      let passWd: string = 'a';
      let cipherName: string = "AES-128-CBC";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      try {
        keyPair.priKey.getEncodedPem("PKCS8", {password: passWd, cipherName: cipherName})
        expect(null).assertNull();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_1200 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1300
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1300
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let passWd: string = "123456";
      let cipherName: string = "AES-192-CBC";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      try {
        keyPair.priKey.getEncodedPem("PKCS8", {password: passWd, cipherName: cipherName})
        expect(null).assertNull();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_1300 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1400
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1400
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let passWd: string = " ";
      let cipherName: string = "AES-192-CBC";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      try {
        keyPair.priKey.getEncodedPem("PKCS8", {password: passWd, cipherName: cipherName})
        expect(null).assertNull();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_1400 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1500
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1500
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let passWd: string = "abc";
      let cipherName: string = "RC5-CBC";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      try {
        keyPair.priKey.getEncodedPem("PKCS8", {password: passWd, cipherName: cipherName})
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_1500 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1600
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1600
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA512";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS8");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_1600 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1700
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1700
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA768";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS8");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_1700 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1800
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1800
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA1024";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS8");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_1600 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1900
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1900
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA2048";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS8");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_1900 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2000
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2000
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA3072";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS8");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_2000 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2100
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2100
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA4096";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS8");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_2100 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2200
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2200
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "RSA8192";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecPromiseTest, algName, "DES-EDE3-CBC", "PKCS8");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS1");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS1");

        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-128-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-192-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "AES-256-CBC", "PKCS8");
        taskGroup.addTask(rsaDecodedBySpecSyncTest, algName, "DES-EDE3-CBC", "PKCS8");

        await taskpool.execute(taskGroup).then((res: Array<Object>) => {
          for (let ret of res) {
            expect(ret).assertTrue();
          }
        });
        taskpool.cancel(taskGroup);
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_2200 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2300
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2300
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let passWd: string = "";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      try {
        await generator.convertPemKey(null, rsa_enc_prikey, passWd);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_2300 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2400
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2400
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let passWd: string = "";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      try {
        passWd = 'aBc123';
        let keyPair1: cryptoFramework.KeyPair = await generator.convertPemKey(null, rsa_enc_prikey_pkcs1, passWd);
        let keyPair2: cryptoFramework.KeyPair = await generator.convertPemKey(null, rsa_enc_prikey, passWd);
        let ret: boolean = commonUtils.compareDataBlob(keyPair1.priKey.getEncoded(), keyPair2.priKey.getEncoded())
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_2400 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2500
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2500
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let passWd: string = "abc123";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      try {
        await generator.convertPemKey(null, rsa_enc_prikey_pkcs1, passWd);
        expect(null).assertTrue();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_2500 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2600
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2600
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let passWd: string = passwd_max_string + 'a';
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      try {
        await generator.convertPemKey(null, rsa_enc_prikey, passWd);
        expect(null).assertTrue();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_2600 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2700
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2700
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let passWd: string = "aBc123";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      try {
        await generator.convertPemKey(null, rsa_enc_prikey_error, passWd);
        expect(null).assertTrue();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_2700 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2800
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2800
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let passWd: string = "aBc123";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      try {
        await generator.convertPemKey(null, rsa_prikey, passWd);
        expect(null).assertNull();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_2800 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2900
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2900
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let passWd: string = "aBc123";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      try {
        await generator.convertPemKey(rsa_enc_prikey, rsa_pubkey, passWd);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_2900 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_3000
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_3000
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      try {
        await generator.convertPemKey(rsa_enc_prikey, rsa_pubkey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_3000 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_3100
     * @tc.number SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_3100
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_RSAEncodeDecodeWithPasswd_Func_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let algName: string = "RSA768";
      let passWd: string = "";
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
      try {
        passWd = 'aBc123';
        await generator.convertPemKey(null, rsa_pubkey, passWd);
        expect(null).assertFail();
      } catch (error) {
        console.error(`RSAEncodeDecodeWithPasswd_Func_3100 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

  });
}