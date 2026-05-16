/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { CallbackType, intervalTime, stressTimeout, enableHardwareEntropyRandom } from './utils/random/random';


export default function SecurityCryptoFwRandomTestUnit() {
  describe('SecurityCryptoFwRandomTestUnit', (): void => {

    /**
     * @tc.name   SUB_Security_CryptoFramework_Random_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Random_Func_0100
     * @tc.desc   enable hardware entropy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_Random_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let secretLen: int = 16;
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let secretLen: int = 128;
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let secretLen: int = 16;
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let secretLen: int = 0;
          let random: cryptoFramework.Random = cryptoFramework.createRandom();
          random.enableHardwareEntropy();
          await random.generateRandom(secretLen);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Random “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let secretLen: int = -1;
          let random: cryptoFramework.Random = cryptoFramework.createRandom();
          random.enableHardwareEntropy();
          random.generateRandomSync(secretLen);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Random “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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