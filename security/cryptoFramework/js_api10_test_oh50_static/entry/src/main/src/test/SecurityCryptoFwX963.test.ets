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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { digestSpec, JsX963KdfCallback, JsX963KdfPromise, JsX963KdfSync, JsX963Spec } from './utils/x963/x963';
import { getMdSize } from './utils/digest/digestSyncUtils';


export default function SecurityCryptoFwX963TestUnit() {
  describe('SecurityCryptoFwX963TestUnit', (): void => {

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_0100
     * @tc.number SUB_Security_CryptoFramework_X963_Func_0100
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "33f781afd506a4206b9b3af2371a67a4";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName) - 1;
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
            let secret: cryptoFramework.DataBlob = JsX963KdfSync(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_0200
     * @tc.number SUB_Security_CryptoFramework_X963_Func_0200
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "33f781afd506a4206b9b3af2371a67a4";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName);
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
            let secret: cryptoFramework.DataBlob = JsX963KdfSync(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_0300
     * @tc.number SUB_Security_CryptoFramework_X963_Func_0300
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "33f781afd506a4206b9b3af2371a67a4";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName) + 1;
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize, true);
            let secret: cryptoFramework.DataBlob = JsX963KdfSync(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_0400
     * @tc.number SUB_Security_CryptoFramework_X963_Func_0400
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName) + 1;
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
            let secret: cryptoFramework.DataBlob = JsX963KdfSync(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_0500
     * @tc.number SUB_Security_CryptoFramework_X963_Func_0500
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "33f781afd506a4206b9b3af2371a67a4";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName) - 1;
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
            let secret: cryptoFramework.DataBlob = await JsX963KdfPromise(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_0600
     * @tc.number SUB_Security_CryptoFramework_X963_Func_0600
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "33f781afd506a4206b9b3af2371a67a4";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName);
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
            let secret: cryptoFramework.DataBlob = await JsX963KdfPromise(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_0700
     * @tc.number SUB_Security_CryptoFramework_X963_Func_0700
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "33f781afd506a4206b9b3af2371a67a4";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName) + 1;
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize, true);
            let secret: cryptoFramework.DataBlob = await JsX963KdfPromise(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_0800
     * @tc.number SUB_Security_CryptoFramework_X963_Func_0800
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName) + 1;
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
            let secret: cryptoFramework.DataBlob = await JsX963KdfPromise(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_0900
     * @tc.number SUB_Security_CryptoFramework_X963_Func_0900
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "33f781afd506a4206b9b3af2371a67a4";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName) - 1;
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
            let secret: cryptoFramework.DataBlob = await JsX963KdfCallback(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_1000
     * @tc.number SUB_Security_CryptoFramework_X963_Func_1000
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "33f781afd506a4206b9b3af2371a67a4";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName);
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
            let secret: cryptoFramework.DataBlob = await JsX963KdfCallback(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_1100
     * @tc.number SUB_Security_CryptoFramework_X963_Func_1100
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "33f781afd506a4206b9b3af2371a67a4";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName) + 1;
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize, true);
            let secret: cryptoFramework.DataBlob = await JsX963KdfCallback(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_1200
     * @tc.number SUB_Security_CryptoFramework_X963_Func_1200
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "";
          for (let index = 0; index < digestSpec.length; index++) {
            let digestAlgName: string = digestSpec[index];
            let keySize: int = getMdSize(digestAlgName) + 1;
            let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
            let secret: cryptoFramework.DataBlob = await JsX963KdfCallback(digestAlgName, kdfSpec);
            expect(secret.data.length).assertEqual(keySize);
          }
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_1300
     * @tc.number SUB_Security_CryptoFramework_X963_Func_1300
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "5ed096510e3fcf782ceea98e9737993e2b21370f6cda2ab1";
          let info: string = "00000000";
          let digestAlgName: string = "SHA256";
          let keySize: int = 0;
          let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
          await JsX963KdfCallback(digestAlgName, kdfSpec);
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_1500
     * @tc.number SUB_Security_CryptoFramework_X963_Func_1500
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "";
          let info: string = "00000000";
          let digestAlgName: string = "SHA256";
          let keySize: int = 16;
          let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
          await JsX963KdfCallback(digestAlgName, kdfSpec);
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(17620003);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_1600
     * @tc.number SUB_Security_CryptoFramework_X963_Func_1600
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "";
          let info: string = "00000000";
          let digestAlgName: string = "SHA256";
          let keySize: int = 16;
          let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize, true);
          await JsX963KdfCallback(digestAlgName, kdfSpec);
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(17620003);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_X963_Func_1700
     * @tc.number SUB_Security_CryptoFramework_X963_Func_1700
     * @tc.desc   algorithm is kdf X963
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_X963_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let z: string = "0000000000000000";
          let info: string = "00000000";
          let digestAlgName: string = "SHA256";
          let keySize: int = -1;
          let kdfSpec: cryptoFramework.X963KdfSpec = JsX963Spec(z, info, keySize);
          await JsX963KdfCallback(digestAlgName, kdfSpec);
        } catch (error: BusinessError) {
          console.error(`X963 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
        }
        done();
      });

  });
}