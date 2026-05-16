/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import fileShare from '@ohos.fileshare';
import bundleManager from '@ohos.bundle.bundleManager'
import { BusinessError } from '@kit.BasicServicesKit';

let tokenID = 0;

export default function FileShareTest() {
  describe('FileShareTest', () => {
    beforeAll(async (done: Function) => {
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      console.info('FileShareJsTest bundleFlags is: ' + bundleFlags);
      try {
        bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
          console.info('FileShareJsTest data is: ' + JSON.stringify(data));
          tokenID = data.appInfo.accessTokenId;
          console.info('FileShareJsTest tokenID is: ' + data.appInfo.accessTokenId);
          done();
        }).catch((err: BusinessError) => {
          console.info('FileShareJsTest getBundleInfoForSelf err is: ' + err.code);
        })
      } catch (error) {
        console.info('FileShareJsTest getBundleInfoForSelf error is: ' + error.code)
      }
    })

    afterAll(async () => {
      /*
       * @tc.teardown: teardown invoked after all testcases
       */
      console.info('afterAll called')
    })

    beforeEach(async () => {
      /*
       * @tc.setup: setup invoked before each testcases
       */
      console.info('beforeEach called')
    })

    afterEach(async () => {
      /*
       * @tc.teardown: teardown invoked after each testcases
       */
      console.info('afterEach called')
    })

    /**
     * @tc.name   SUB_Security_FileShare_CheckPath_Abnormal_0100
     * @tc.number SUB_Security_FileShare_CheckPath_Abnormal_0100
     * @tc.desc   Test checkPathPermission no system 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_FileShare_CheckPath_Abnormal_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('----------------------SUB_Security_FileShare_CheckPath_Abnormal_0100---------------------------');
        try {
          let PathPolicyInfo: fileShare.PathPolicyInfo = {
            path: "/storage/Users/currentUser/Documents/1.txt",
            operationMode: fileShare.OperationMode.READ_MODE,
          }

          let policies = [PathPolicyInfo];
          let policyType = fileShare.PolicyType.PERSISTENT_TYPE;
          fileShare.checkPathPermission(tokenID, policies, policyType).then((result) => {
            for (let x of result) {
              console.info('SUB_Security_FileShare_CheckPath_Abnormal_0100 permission result is', x);
            }
          })
        } catch (error) {
          console.error('SUB_Security_FileShare_CheckPath_Abnormal_0100 error ' + error.message + ' error.code ' +
          error.code);
          expect(error.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   SUB_Security_FileShare_CheckPath_Const_0100
     * @tc.number SUB_Security_FileShare_CheckPath_Const_0100
     * @tc.desc   Test fileShare PolicyType const TEMPORARY_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_FileShare_CheckPath_Const_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('----------------------SUB_Security_FileShare_CheckPath_Const_0100---------------------------');
        let value = fileShare.PolicyType.TEMPORARY_TYPE;
        console.info('SUB_Security_FileShare_CheckPath_Const_0100 value is: ' + value);
        expect(value).assertEqual(0);
        done();
      })

    /**
     * @tc.name   SUB_Security_FileShare_CheckPath_Const_0200
     * @tc.number SUB_Security_FileShare_CheckPath_Const_0200
     * @tc.desc   Test fileShare PolicyType const PERSISTENT_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_FileShare_CheckPath_Const_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info('----------------------SUB_Security_FileShare_CheckPath_Const_0200---------------------------');
        let value = fileShare.PolicyType.PERSISTENT_TYPE;
        console.info('SUB_Security_FileShare_CheckPath_Const_0200 value is: ' + value);
        expect(value).assertEqual(1);
        done();
      })
      
    /**
     * @tc.name   SUB_Security_FileShare_OperationMode_0100
     * @tc.number SUB_Security_FileShare_OperationMode_0100
     * @tc.desc   Test fileShare OperationMode CREATE_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_FileShare_OperationMode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('----------------------SUB_Security_FileShare_OperationMode_0100---------------------------');
        let value = fileShare.OperationMode.CREATE_MODE;
        console.info('SUB_Security_FileShare_OperationMode_0100 value is: ' + value);
        expect(value).assertEqual(0b100);
        done();
      })

    /**
     * @tc.name   SUB_Security_FileShare_OperationMode_0200
     * @tc.number SUB_Security_FileShare_OperationMode_0200
     * @tc.desc   Test fileShare OperationMode DELETE_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_FileShare_OperationMode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('----------------------SUB_Security_FileShare_OperationMode_0200---------------------------');
        let value = fileShare.OperationMode.DELETE_MODE;
        console.info('SUB_Security_FileShare_OperationMode_0200 value is: ' + value);
        expect(value).assertEqual(0b1000);
        done();
      })

    /**
     * @tc.name   SUB_Security_FileShare_OperationMode_0300
     * @tc.number SUB_Security_FileShare_OperationMode_0300
     * @tc.desc   Test fileShare OperationMode RENAME_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_FileShare_OperationMode_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('----------------------SUB_Security_FileShare_OperationMode_0300---------------------------');
        let value = fileShare.OperationMode.RENAME_MODE;
        console.info('SUB_Security_FileShare_OperationMode_0300 value is: ' + value);
        expect(value).assertEqual(0b10000);
        done();
      })

    /**
     * @tc.name   SUB_Security_FileShare_OperationMode_0400
     * @tc.number SUB_Security_FileShare_OperationMode_0400
     * @tc.desc   Test fileShare OperationMode READ_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_FileShare_OperationMode_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('----------------------SUB_Security_FileShare_OperationMode_0400---------------------------');
        let value = fileShare.OperationMode.READ_MODE;
        console.info('SUB_Security_FileShare_OperationMode_0400 value is: ' + value);
        expect(value).assertEqual(0b1);
        done();
      })
    
    /**
     * @tc.name   SUB_Security_FileShare_OperationMode_0500
     * @tc.number SUB_Security_FileShare_OperationMode_0500
     * @tc.desc   Test fileShare OperationMode WRITE_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_FileShare_OperationMode_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('----------------------SUB_Security_FileShare_OperationMode_0500---------------------------');
        let value = fileShare.OperationMode.WRITE_MODE;
        console.info('SUB_Security_FileShare_OperationMode_0500 value is: ' + value);
        expect(value).assertEqual(0b10);
        done();
      })
  })
}