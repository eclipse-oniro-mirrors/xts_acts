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
import * as digestSyncUtils from './utils/digest/digestSyncUtils';


export default function SecurityCryptoFwDigestSyncTestUnit() {
  describe('SecurityCryptoFwDigestSyncTestUnit', () => {
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
     * @tc.name   SUB_Security_CryptoFramework_DigestSync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_DigestSync_Func_0100
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DigestSync_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let messageLen: number = 128;
        let message: cryptoFramework.DataBlob = await commonUtils.createData(messageLen);
        for(let algName of digestSyncUtils.DIGEST_SPEC) {
          let dataRes: digestSyncUtils.mdInfo = digestSyncUtils.doMdSync(algName, message);
          let mdSize: number = digestSyncUtils.getMdSize(algName);
          expect(dataRes.mdObj.getMdLength()).assertEqual(mdSize);
        }
      } catch (error) {
        console.error(`Digest “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DigestSync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_DigestSync_Func_0200
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DigestSync_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let messageLen: number = 128;
        let blockSize: number = 20;
        let message: cryptoFramework.DataBlob = await commonUtils.createData(messageLen);
        for(let algName of digestSyncUtils.DIGEST_SPEC) {
          let dataResSpilt: digestSyncUtils.mdInfo = digestSyncUtils.doMdSyncSplit(algName, message, blockSize);
          let dataRes: digestSyncUtils.mdInfo = digestSyncUtils.doMdSync(algName, message);
          let ret: boolean = commonUtils.compareDataBlob(dataRes.dataRes, dataResSpilt.dataRes);
          let mdSize: number = digestSyncUtils.getMdSize(algName);
          expect(ret).assertTrue();
          expect(dataResSpilt.mdObj.getMdLength()).assertEqual(mdSize);
          expect(dataRes.mdObj.getMdLength()).assertEqual(mdSize);
        }
      } catch (error) {
        console.error(`Digest “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DigestSync_Func_0300
     * @tc.number SUB_Security_CryptoFramework_DigestSync_Func_0300
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DigestSync_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        for(let algName of digestSyncUtils.DIGEST_SPEC) {
          let dataRes: digestSyncUtils.mdInfo = digestSyncUtils.doMdWithNoUpdateSync(algName);
          let mdSize: number = digestSyncUtils.getMdSize(algName);
          expect(dataRes.mdObj.getMdLength()).assertEqual(mdSize);
        }
      } catch (error) {
        console.error(`Digest “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DigestSync_Func_0400
     * @tc.number SUB_Security_CryptoFramework_DigestSync_Func_0400
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DigestSync_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let data: string = '';
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let message: cryptoFramework.DataBlob = {
          data: dataArray
        }
        for(let algName of digestSyncUtils.DIGEST_SPEC) {
          let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
          try {
            md.updateSync(message);
          } catch (error) {
            console.error(`Digest Update “${error}“, error code: ${error.code}`);
            expect(error.code).assertEqual(17630001);
          }
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`Digest “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DigestSync_Func_0500
     * @tc.number SUB_Security_CryptoFramework_DigestSync_Func_0500
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DigestSync_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "SHA3-224";
        cryptoFramework.createMd(algName);
        expect(null).assertTrue();
      } catch (error) {
        console.error(`Digest “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DigestSync_Func_0600
     * @tc.number SUB_Security_CryptoFramework_DigestSync_Func_0600
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DigestSync_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let md: cryptoFramework.Md = {} as cryptoFramework.Md;
        md.digestSync()
      } catch (error) {
        console.error(`Digest “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(undefined);
      }
      done();
    });


  });
}