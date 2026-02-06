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
import { CallbackType, intervalTime, stressTimeout, enableHardwareEntropyRandom } from './utils/random/random';


@Concurrent
async function getRandomWithPthread(length: number, type: CallbackType): Promise<boolean> {
  let ret: boolean = true;
  let timeFlag: boolean = false;
  let secret: cryptoFramework.DataBlob = {data: new Uint8Array()};
  let random: cryptoFramework.Random = cryptoFramework.createRandom();
  let timeoutId: number = setInterval(() => {
    timeFlag = true;
  }, stressTimeout);
  while (!timeFlag) {
    try {
      switch (type) {
        case CallbackType.TYPE_IS_PROMISE:
          secret = await random.generateRandom(length);
        case CallbackType.TYPE_IS_CALLBACK:
          secret = await new Promise((resolve, reject) => {
            random.generateRandom(length, (err, secret) => {
              if (err) {
                reject(err);
              } else {
                resolve(secret);
              }
            });
          })
        default:
          secret = random.generateRandomSync(length);
      }
      if (secret.data.length !== length) {
        console.info("################ :" + length + ":" + secret.data.length)
        clearInterval(timeoutId);
        return false;
      }
      console.log("############### :" + secret.data)
      await new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          console.info("################ getRandom:" + length + ":" + "Running")
          resolve();
        }, intervalTime)
      }).then(undefined, (error: Object) => {
      });
    } catch (error) {
      clearInterval(timeoutId);
      console.error(`getRandom “${error}“, error code: ${error.code}`);
      return false;
    }
  }
  clearInterval(timeoutId);
  return ret;
}

export default function SecurityCryptoFwRandomTestUnit() {
  describe('SecurityCryptoFwRandomTestUnit', () => {
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
     * @tc.name   SUB_Security_CryptoFramework_Random_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Random_Func_0100
     * @tc.desc   enable hardware entropy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Random_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let secretLen: number = 16;
        let random: cryptoFramework.Random = cryptoFramework.createRandom();
        random.enableHardwareEntropy();
        let secret: cryptoFramework.DataBlob = await random.generateRandom(secretLen);
        expect(secret.data.length).assertEqual(secretLen);
      } catch (error) {
        console.error(`Random “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Random_Func_0200
     * @tc.number SUB_Security_CryptoFramework_Random_Func_0200
     * @tc.desc   enable hardware entropy, pthread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Random_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let ret: boolean = await enableHardwareEntropyRandom(16, CallbackType.TYPE_IS_CALLBACK);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Random Pthread CallBack “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Random_Func_0300
     * @tc.number SUB_Security_CryptoFramework_Random_Func_0300
     * @tc.desc   enable hardware entropy with seed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Random_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let secretLen: number = 128;
          let seed: number[] = [
            0xb3, 0x84, 0xdc, 0x01, 0x1e, 0xda, 0xeb, 0xda, 0xd6, 0x7d, 0x9a, 0xf2, 0xf3, 0x7a, 0x91, 0x0c
          ];
          let random: cryptoFramework.Random = cryptoFramework.createRandom();
          random.enableHardwareEntropy();
          random.setSeed({data: new Uint8Array(seed)});
          let secret: cryptoFramework.DataBlob = random.generateRandomSync(secretLen);
          expect(secret.data.length).assertEqual(secretLen);
        } catch (error) {
          console.error(`Random “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Random_Func_0400
     * @tc.number SUB_Security_CryptoFramework_Random_Func_0400
     * @tc.desc   enable hardware entropy with seed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Random_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let secretLen: number = 16;
          let seed: number[] = [
            0xb3, 0x84, 0xdc, 0x01, 0x1e, 0xda, 0xeb, 0xda, 0xd6, 0x7d, 0x9a, 0xf2, 0xf3, 0x7a, 0x91, 0x0c
          ];
          let random: cryptoFramework.Random = cryptoFramework.createRandom();
          random.setSeed({data: new Uint8Array(seed)});
          random.enableHardwareEntropy();
          for (let i: number = 0; i < 3; i++) {
            let secret: cryptoFramework.DataBlob = await random.generateRandom(secretLen);
            expect(secret.data.length).assertEqual(secretLen);
          }
        } catch (error) {
          console.error(`Random “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Random_Func_0500
     * @tc.number SUB_Security_CryptoFramework_Random_Func_0500
     * @tc.desc   enable hardware entropy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Random_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let secretLen: number = 0;
          let random: cryptoFramework.Random = cryptoFramework.createRandom();
          random.enableHardwareEntropy();
          await random.generateRandom(secretLen);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Random “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Random_Func_0600
     * @tc.number SUB_Security_CryptoFramework_Random_Func_0600
     * @tc.desc   enable hardware entropy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Random_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let secretLen: number = -1;
          let random: cryptoFramework.Random = cryptoFramework.createRandom();
          random.enableHardwareEntropy();
          random.generateRandomSync(secretLen);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Random “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Random_Func_0700
     * @tc.number SUB_Security_CryptoFramework_Random_Func_0700
     * @tc.desc   enable hardware entropy, pthread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Random_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let ret: boolean = await enableHardwareEntropyRandom(16, CallbackType.TYPE_IS_SYNC);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Random Pthread Sync “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Random_Func_0800
     * @tc.number SUB_Security_CryptoFramework_Random_Func_0800
     * @tc.desc   enable hardware entropy, pthread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Random_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let ret: boolean = await enableHardwareEntropyRandom(16, CallbackType.TYPE_IS_PROMISE);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Random Pthread Promise “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  });
}