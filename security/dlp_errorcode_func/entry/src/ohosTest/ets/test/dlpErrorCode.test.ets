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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import dlpPermission from '@ohos.dlpPermission';
import { common, Want } from '@kit.AbilityKit';

const TAG = "DLP_XTS ";
interface ERRCODE{
  DLP_OK: number,
  ERR_JS_PERMISSION_DENY: number,
  ERR_JS_NOT_SYSTEM_APP: number,
  ERR_JS_PARAMETER_ERROR: number,
  ERR_JS_INVALID_PARAMETER: number,
  ERR_JS_BEGIN_CREDENTIAL_FAIL: number,
  ERR_JS_CREDENTIAL_TIMEOUT: number,
  ERR_JS_CREDENTIAL_SERVICE_ERROR: number,
  ERR_JS_CREDENTIAL_SERVER_ERROR: number,
  ERR_JS_API_FOR_SANDBOX_ERROR: number,
  ERR_JS_API_NOT_FOR_SANDBOX_ERROR: number,
  ERR_JS_NOT_DLP_FILE: number,
  ERR_JS_OPERATE_DLP_FILE_FAIL: number,
  ERR_JS_DLP_FILE_READ_ONLY: number,
  ERR_JS_SYSTEM_SERVICE_EXCEPTION: number,
  ERR_JS_OUT_OF_MEMORY: number,
}
let DLPErrCode: ERRCODE = {
  DLP_OK: 0,
  ERR_JS_PERMISSION_DENY: 201,
  ERR_JS_NOT_SYSTEM_APP: 202,
  ERR_JS_PARAMETER_ERROR: 401,
  ERR_JS_INVALID_PARAMETER: 19100001,
  ERR_JS_BEGIN_CREDENTIAL_FAIL: 19100002,
  ERR_JS_CREDENTIAL_TIMEOUT: 19100003,
  ERR_JS_CREDENTIAL_SERVICE_ERROR: 19100004,
  ERR_JS_CREDENTIAL_SERVER_ERROR: 19100005,
  ERR_JS_API_FOR_SANDBOX_ERROR: 19100006,
  ERR_JS_API_NOT_FOR_SANDBOX_ERROR: 19100007,
  ERR_JS_NOT_DLP_FILE: 19100008,
  ERR_JS_OPERATE_DLP_FILE_FAIL: 19100009,
  ERR_JS_DLP_FILE_READ_ONLY: 19100010,
  ERR_JS_SYSTEM_SERVICE_EXCEPTION: 19100011,
  ERR_JS_OUT_OF_MEMORY: 19100012,
};

export default function dlpErrorCodeTest() {
  describe('dlpErrorCodeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_Security_DataSecurity_DLP_setSandboxAppConfig_0100
     * @tc.number SUB_Security_DataSecurity_DLP_setSandboxAppConfig_0100
     * @tc.desc   普通应用调用setSandboxAppConfig接口，不传入参数，返回19100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_DataSecurity_DLP_setSandboxAppConfig_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await dlpPermission.setSandboxAppConfig('');
        console.info(`SUB_Security_DataSecurity_DLP_setSandboxAppConfig_0100 setSandboxAppConfig SUCCESS`);
        expect(null).assertFail();
      } catch (err) {
        console.error(`SUB_Security_DataSecurity_DLP_setSandboxAppConfig_0100 failed to setSandboxAppConfig code is : ${err.code} `)
        expect(err.code).assertEqual(19100001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_DataSecurity_DLP_isInSandbox_0100
     * @tc.number SUB_Security_DataSecurity_DLP_isInSandbox_0100
     * @tc.desc   isInSandbox false, promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_DataSecurity_DLP_isInSandbox_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let inSandbox = await dlpPermission.isInSandbox();
        expect(inSandbox).assertEqual(false);
      } catch (err) {
        console.error(`SUB_Security_DataSecurity_DLP_isInSandbox_0100 failed to isInSandbox code is : ${err.code} `)
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_DataSecurity_DLP_isInSandbox_0200
     * @tc.number SUB_Security_DataSecurity_DLP_isInSandbox_0200
     * @tc.desc   isInSandbox false, callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_DataSecurity_DLP_isInSandbox_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        dlpPermission.isInSandbox((err, data) => {
          expect(data).assertEqual(false);
        });
      } catch (err) {
        console.error(`SUB_Security_DataSecurity_DLP_isInSandbox_0200 failed to isInSandbox code is : ${err.code} `)
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsDLPFile005
     * @tc.number Test_isDLPFile_005
     * @tc.desc   isDLPFile 401 (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let curTag = TAG + "Test_isDLPFile_005";
      console.info(curTag, "start");

      try {
        await dlpPermission.isDLPFile(null);
        expect(null).assertFail();
      } catch (err) {
        console.error(curTag, `isDLPFile null. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      try {
        await dlpPermission.isDLPFile(undefined);
        expect(null).assertFail();
      } catch (err) {
        console.error(curTag, `isDLPFile undefined. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
      done();
    })

    /**
     * @tc.name   testIsDLPFile006
     * @tc.number Test_isDLPFile_006
     * @tc.desc   isDLPFile success (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let curTag = TAG + "Test_isDLPFile_006";
      console.info(curTag, "start");

      try {
        dlpPermission.isDLPFile(null, (err, data) => {
        });
      } catch (err) {
        console.error(curTag, `isDLPFile null. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      try {
        dlpPermission.isDLPFile(undefined, (err, data) => {
        });
      } catch (err) {
        console.error(curTag, `isDLPFile undefined. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
      done();
    })

    /**
     * @tc.name   testGetOriginalFileName003
     * @tc.number Test_getOriginalFileName_003
     * @tc.desc   test getOriginalFileName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let curTag = TAG + "Test_getOriginalFileName_003";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName(null);
        expect(null).assertFail();
      } catch (err) {
        console.error(curTag, `getOriginalFileName.null Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      try {
        let name = dlpPermission.getOriginalFileName(undefined);
        expect(null).assertFail();
      } catch (err) {
        console.error(curTag, `getOriginalFileName.undefined Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
      done();
    })

    /**
     * @tc.name   testOnOpenDLPFile004
     * @tc.number Test_on_openDLPFile_004
     * @tc.desc   test on('openDLPFile') invalid param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnOpenDLPFile004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let curTag = TAG + "Test_on_openDLPFile_004";
      console.info(curTag, "start");

      try {
        dlpPermission.on(null, (info: dlpPermission.AccessedDLPFileInfo) => {
          expect(null).assertFail();
        });
      } catch (err) {
        console.error(curTag, `on.null Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      try {
        dlpPermission.on(undefined, (info: dlpPermission.AccessedDLPFileInfo) => {
          expect(null).assertFail();
        });
      } catch (err) {
        console.error(curTag, `on.undefined Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
      done();
    })

    /**
     * @tc.name   testOffOpenDLPFile004
     * @tc.number Test_off_openDLPFile_004
     * @tc.desc   test off('openDLPFile') invalid param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffOpenDLPFile004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let curTag = TAG + "Test_off_openDLPFile_004";
      console.info(curTag, "start");

      try {
        dlpPermission.off(null, (info: dlpPermission.AccessedDLPFileInfo) => {
          expect(null).assertFail();
        });
      } catch (err) {
        console.error(curTag, `off.null Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      try {
        dlpPermission.off(undefined, (info: dlpPermission.AccessedDLPFileInfo) => {
          expect(null).assertFail();
        });
      } catch (err) {
        console.error(curTag, `off.undefined Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
      done();
    })

    /**
     * @tc.name   testSetRetentionState008
     * @tc.number Test_setRetentionState_008
     * @tc.desc   setRetentionState 401 (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRetentionState008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let curTag = TAG + "Test_setRetentionState_008";
      console.info(curTag, "start");

      try {
        dlpPermission.setRetentionState(null, (err, res) => {
          expect(null).assertFail();
        });
      } catch (err) {
        console.error(curTag, `setRetentionState.null Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      try {
        dlpPermission.setRetentionState(undefined, (err, res) => {
          expect(null).assertFail();
        });
      } catch (err) {
        console.error(curTag, `setRetentionState.undefined Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
      done();
    });

    /**
     * @tc.name   testCancelRetentionState006
     * @tc.number Test_cancelRetentionState_006
     * @tc.desc   cancelRetentionState fail (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCancelRetentionState006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let curTag = TAG + "Test_cancelRetentionState_006";
      console.info(curTag, "start");

      try {
        dlpPermission.cancelRetentionState(null, (err, res) => {
          expect(null).assertFail();
        }); // 取消沙箱保留。
      } catch (err) {
        console.error(curTag, `cancelRetentionState.null Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      try {
        dlpPermission.cancelRetentionState(undefined, (err, res) => {
          expect(null).assertFail();
        }); // 取消沙箱保留。
      } catch (err) {
        console.error(curTag, `cancelRetentionState.undefined Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
      done();
    })

    /**
     * @tc.name   testGetRetentionSandboxList009
     * @tc.number Test_getRetentionSandboxList_009
     * @tc.desc   getRetentionSandboxList 401 (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let curTag = TAG + "Test_getRetentionSandboxList_009";
      console.info(curTag, "start");
      try {
        dlpPermission.getRetentionSandboxList(null, async (err, data) => {
          expect(null).assertFail();
        });
      } catch (err) {
        console.error(curTag, 'getRetentionSandboxList null err:' + err.code + err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      try {
        dlpPermission.getRetentionSandboxList(undefined, async (err, data) => {
          expect(null).assertFail();
        });
      } catch (err) {
        console.error(curTag, 'getRetentionSandboxList undefined err:' + err.code + err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      try {
        dlpPermission.getRetentionSandboxList("", async (err, data) => {
          expect(null).assertFail();
        });
      } catch (err) {
        console.error(curTag, 'getRetentionSandboxList "" err:' + err.code + err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
      done();
    })

    /**
     * @tc.name   testSetSandboxAppConfig0400
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0400
     * @tc.desc   test setSandboxAppConfig false promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0400";
      console.info(curTag, "start");

      try {
        await dlpPermission.setSandboxAppConfig("");
        expect(null).assertFail();
      } catch (err) {
        console.error(curTag, `setSandboxAppConfig "". Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      try {
        await dlpPermission.setSandboxAppConfig(null);
        expect(null).assertFail();
      } catch (err) {
        console.error(curTag, `setSandboxAppConfig null. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      try {
        await dlpPermission.setSandboxAppConfig(undefined);
        expect(null).assertFail();
      } catch (err) {
        console.error(curTag, `setSandboxAppConfig undefined. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
      done();
    })

    /**
     * @tc.name   testCancelRetentionState005
     * @tc.number Test_cancelRetentionState_005
     * @tc.desc   cancelRetentionState fail (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCancelRetentionState005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_cancelRetentionState_005";
      console.info(curTag, "start");

      try {
        await dlpPermission.cancelRetentionState(null);
        expect(null).assertFail();
      } catch (err) {
        console.error(curTag, `cancelRetentionState.null Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      try {
        await dlpPermission.cancelRetentionState(undefined);
        expect(null).assertFail();
      } catch (err) {
        console.error(curTag, `cancelRetentionState.undefined Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testStartDLPManagerForResult0200
     * @tc.number SUB_SECURITY_DLP_startDLPManagerForResult_0200
     * @tc.desc   test startDLPManagerForResult 19100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStartDLPManagerForResult0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_startDLPManagerForResult_0200";
      console.info(curTag, "start");
      let context: common.UIAbilityContext = globalThis.context; // 获取当前UIAbilityContext
      let want: Want = {
        "uri": "file://docs/storage/Users/currentUser/Desktop/1.txt",
        "parameters": {
          "displayName": "1.txt"
        }
      }; // 请求参数

      let dlpProperty: dlpPermission.DLPProperty = {
        ownerAccount: 'zhangsan',
        ownerAccountType: dlpPermission.AccountType.DOMAIN_ACCOUNT,
        authUserList: [],
        contactAccount: 'zhangsan',
        offlineAccess: true,
        ownerAccountID: 'xxxxxxx',
        everyoneAccessList: [],
        extensionFields:{
          'nickNameMask': '666'
        }
      };

      try {
        dlpPermission.startDLPManagerForResult(null, want).then((res) => {
          expect(null).assertFail();
        }); // 打开DLP权限管理应用。
      } catch (err) {
        console.error(curTag, 'startDLPManagerForResult 1null err:' + err.code + err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      try {
        dlpPermission.startDLPManagerForResult(undefined, want).then((res) => {
          expect(null).assertFail();
        }); // 打开DLP权限管理应用。
      } catch (err) {
        console.error(curTag, 'startDLPManagerForResult 1undefined err:' + err.code + err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      try {
        dlpPermission.startDLPManagerForResult(context, null).then((res) => {
          expect(null).assertFail();
        }); // 打开DLP权限管理应用。
      } catch (err) {
        console.error(curTag, 'startDLPManagerForResult 2null err:' + err.code + err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      try {
        dlpPermission.startDLPManagerForResult(context, undefined).then((res) => {
          expect(null).assertFail();
        }); // 打开DLP权限管理应用。
      } catch (err) {
        console.error(curTag, 'startDLPManagerForResult 2undefined err:' + err.code + err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   SUB_Security_DLP_generateDlpFileForEnterprise_0100
     * @tc.number SUB_Security_DLP_generateDlpFileForEnterprise_0100
     * @tc.desc   test generateDlpFileForEnterprise 19100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_DLP_generateDlpFileForEnterprise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_Security_DLP_generateDlpFileForEnterprise_0100";
      console.info(curTag, "start");
      let dlpProperty: dlpPermission.DLPProperty = {
        ownerAccount: 'accountInfo.domainInfo.accountName',
        ownerAccountType: dlpPermission.AccountType.ENTERPRISE_ACCOUNT,
        authUserList: [{
          authAccount: 'zhangsan',
          authAccountType: 4,
          dlpFileAccess: 3,
          permExpiryTime: 666666666666666,
        }],
        contactAccount: 'zhangsan',
        offlineAccess: false,
        ownerAccountID: 'zhangsan',
        everyoneAccessList: [],
        expireTime: 666666666666666,
        actionUponExpiry: dlpPermission.ActionType.NOT_OPEN,
        fileId: 'xx123456789123456789',
      };

      let customProperty: dlpPermission.CustomProperty = {
        enterprise: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        options: {
          classificationLabel: 'label1'
        }
      };

      try {
        await dlpPermission.generateDlpFileForEnterprise(0, 0, dlpProperty, customProperty);
        expect(null).assertFail();
      } catch (err) {
        console.error(curTag, `generateDlpFileForEnterprise failed Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
    })

  })
}