/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import dlpPermission from '@ohos.dlpPermission';
import fs from '@ohos.file.fs';
import account from '@ohos.account.distributedAccount'
import account_osAccount from '@ohos.account.osAccount';
import type Want from '@ohos.app.ability.Want';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base'

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

export class TestDlpFileInfo {
  dlpFile: dlpPermission.DLPFile | null = null;
  plaintextPath: string = '';
  ciphertextPath: string = '';
  plaintextFd: number = -1;
  ciphertextFd: number = -1;
}

const TAG = "DLP_XTS ";
let user1: dlpPermission.AuthUser = {
  authAccount: "123@ohos.com",
  authAccountType: 1,
  dlpFileAccess: 1,
  permExpiryTime: 8888520175,
};
let user2: dlpPermission.AuthUser = {
  authAccount: "456@ohos.com",
  authAccountType: 1,
  dlpFileAccess: 3,
  permExpiryTime: 8888520175,
};

let userList: Array<dlpPermission.AuthUser> = new Array(2);
userList[0] = user1;
userList[1] = user2;

let userId: number;


const accountAbility = account.getDistributedAccountAbility()
const bundleName = "com.ohos.dlp_xts"
const rootDir = "/data/storage/el1/base/"

// 获取帐号信息
async function getOsAccountInfo(): Promise<account_osAccount.OsAccountInfo> {
  try {
    let accountMgr = account_osAccount.getAccountManager();
    return await accountMgr.getCurrentOsAccount();
  } catch (err) {
    console.error(TAG, 'getCurrentOsAccount failed', err.code, err.message);
    expect(false).toBeTruthy(); // 这应该抛出异常，因为 expect(false) 永远不会为真
    throw new Error("Assertion failed"); // 抛出一个错误来匹配返回类型
  }
}

// 帐号登录
async function AccountLogin(accountName: string) {
  await AccountLogout()
  let info: account.DistributedInfo = {
    name: "",
    id: "1234",
    event: "Ohos.account.event.LOGIN",
    nickname: "nickname",
    avatar: "avatar"
  }
  info.name = accountName
  info.event = "Ohos.account.event.LOGIN"
  try {
    await accountAbility.setOsAccountDistributedInfo(info)
  } catch (err) {
    console.error(TAG, "setOsAccountDistributedInfo LOGIN failed", err.code, err.message);
    expect(null).assertFail()
    return
  }
  let user = await accountAbility.getOsAccountDistributedInfo()
  expect(user.name).assertEqual(accountName)
}

// 帐号登出
async function AccountLogout() {
  let accountInfo = await accountAbility.getOsAccountDistributedInfo();
  let info: account.DistributedInfo = {
    name: "",
    id: "1234",
    event: "Ohos.account.event.LOGIN",
    nickname: "nickname",
    avatar: "avatar"
  }
  if (accountInfo.name === "ohosAnonymousName") {
    return
  }
  info.name = accountInfo.name
  info.event = "Ohos.account.event.LOGOUT"
  try {
    await accountAbility.setOsAccountDistributedInfo(info)
  } catch (err) {
    console.error(TAG, "setOsAccountDistributedInfo LOGOUT failed", err.code, err.message);
    expect(null).assertFail()
    return
  }
  let user: account.DistributedInfo = await accountAbility.getOsAccountDistributedInfo()
  expect(user.name).assertEqual("ohosAnonymousName")
}

// 生成文件
function genFile(path: string, content?: ArrayBuffer | string) {
  try {
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    let fd = file.fd;
    if (content !== undefined) {
      fs.writeSync(fd, content);
    }
    return fd;
  } catch (err) {
    console.error(TAG, 'openSync', path, 'failed', err.code, err.message);
    return -1;
  }
}

// 生成可选参数的DLP策略
async function genTestOptionalDlpProperty(): Promise<dlpPermission.DLPProperty> {
  let accountInfo = await getOsAccountInfo();
  let property: dlpPermission.DLPProperty = {
    ownerAccount: accountInfo.distributedInfo.name,
    ownerAccountID: accountInfo.distributedInfo.id,
    ownerAccountType: 1,
    contactAccount: accountInfo.distributedInfo.name,
    offlineAccess: true,
  };
  return property;
}

// 生成DLP策略
async function genTestDlpProperty(): Promise<dlpPermission.DLPProperty> {
  let accountInfo = await getOsAccountInfo();
  let property: dlpPermission.DLPProperty = {
    ownerAccount: accountInfo.distributedInfo.name,
    ownerAccountID: accountInfo.distributedInfo.id,
    ownerAccountType: 1,
    authUserList: userList,
    contactAccount: accountInfo.distributedInfo.name,
    offlineAccess: true,
    everyoneAccessList: [],
  };
  return property;
}

// 生成测试DLP文件
async function genTestDlpFile(): Promise<TestDlpFileInfo> {
  let dlpInfo: TestDlpFileInfo = new TestDlpFileInfo();
  dlpInfo.plaintextPath = rootDir + "test_dlp.txt";
  dlpInfo.ciphertextPath = rootDir + "test_dlp.txt.dlp";
  let writeContent = "123456";
  dlpInfo.plaintextFd = genFile(dlpInfo.plaintextPath, writeContent);
  expect(dlpInfo.plaintextFd >= 0).assertTrue();
  dlpInfo.ciphertextFd = genFile(dlpInfo.ciphertextPath);
  expect(dlpInfo.ciphertextFd >= 0).assertTrue();

  let property = await genTestDlpProperty();

  try {
    let dlpFile: dlpPermission.DLPFile = await dlpPermission.generateDLPFile(dlpInfo.plaintextFd, dlpInfo.ciphertextFd, property);
    dlpInfo.dlpFile = dlpFile;
    return dlpInfo;
  } catch (err) {
    console.error(TAG, "generateDLPFile failed", err.code, err.message);
    fs.closeSync(dlpInfo.plaintextFd);
    fs.closeSync(dlpInfo.ciphertextFd);
    fs.unlinkSync(dlpInfo.ciphertextPath);
    fs.unlinkSync(dlpInfo.plaintextPath);
    //expect(false).assertTrue()
    return dlpInfo;
  }
}

// 关闭测试DLP文件
async function closeTestDlpFile(dlpInfo: TestDlpFileInfo) {
  try {
    await dlpInfo.dlpFile!.closeDLPFile();
  } catch (err) {
    console.error(TAG, "closeDLPFile failed", err.code, err.message);
  }
  fs.closeSync(dlpInfo.plaintextFd);
  fs.closeSync(dlpInfo.ciphertextFd);
  fs.unlinkSync(dlpInfo.ciphertextPath);
  fs.unlinkSync(dlpInfo.plaintextPath);
}

export default function dlpTest() {
  describe('dlpTest', () => {

    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      await AccountLogin("owner@ohos.com");
      const accountMgr = account_osAccount.getAccountManager();
      userId = await accountMgr.getOsAccountLocalId();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (done: Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      let files = fs.listFileSync(rootDir);
      if (files.length != 0) {
        console.error(TAG, "tmp file need delete", files);
      }
      setTimeout(async () => {
        await done();
      }, 3000);
    })
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      await AccountLogout();
    })

    /**
     * @tc.number Test_getDLPSupportedFileTypes_001
     * @tc.name testGetDLPSupportedFileTypes001
     * @tc.desc generateDLPFile success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGetDLPSupportedFileTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let curTag = TAG + "Test_getDLPSupportedFileTypes_001";
      console.info(curTag, "start");

      try {
        let fileTypes = await dlpPermission.getDLPSupportedFileTypes();
        expect(typeof (fileTypes)).assertEqual("object");
      } catch (err) {
        console.error(TAG, "getDLPSupportedFileTypes failed", err.code, err.message);

        console.info(curTag, "end");
        expect(false).assertTrue();
        return;
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_getDLPSupportedFileTypes_002
     * @tc.name testGetDLPSupportedFileTypes002
     * @tc.desc generateDLPFile success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDLPSupportedFileTypes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_generateDLPFile_002";
      console.info(curTag, "start");

      dlpPermission.getDLPSupportedFileTypes(async (err, fileTypes) => {
        expect(err).assertEqual(null);
        expect(typeof (fileTypes)).assertEqual("object");

        console.info(curTag, "end");
      });
    })

    /**
     * @tc.number Test_setRetentionState_001
     * @tc.name testSetRetentionState001
     * @tc.desc setRetentionState not from sandbox fail with code 19100006 (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetRetentionState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_001";
      console.info(curTag, "start");

      try {
        let uriArray = ['uri'];
        await dlpPermission.setRetentionState(uriArray);
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_API_FOR_SANDBOX_ERROR);
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_setRetentionState_002
     * @tc.name testSetRetentionState002
     * @tc.desc setRetentionState not from sandbox fail with code 19100006 (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetRetentionState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_002";
      console.info(curTag, "start");

      let uriArray = ['uri'];
      dlpPermission.setRetentionState(uriArray, async (err) => {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_API_FOR_SANDBOX_ERROR);
        console.info(curTag, "end");
      });
    });

    /**
     * @tc.number Test_setRetentionState_003
     * @tc.name testSetRetentionState003
     * @tc.desc setRetentionState sandbox  call success  (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetRetentionState003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_003";
      console.info(curTag, "start");
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStateCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      let uriArray = ['uri'];
      await dlpPermission.cancelRetentionState(uriArray);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);
      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_setRetentionState_004
     * @tc.name testSetRetentionState004
     * @tc.desc setRetentionState sandbox call success  (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetRetentionState004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_004";
      console.info(curTag, "start", bundleName);
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      let uriArray = ['uri'];
      await dlpPermission.cancelRetentionState(uriArray);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);
      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_setRetentionState_005
     * @tc.name testSetRetentionState005
     * @tc.desc setRetentionState sandbox  call parameter error  (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetRetentionState005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_005";
      console.info(curTag, "start");
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStateCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': false
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_setRetentionState_006
     * @tc.name testSetRetentionState006
     * @tc.desc setRetentionState sandbox call parameter error  (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetRetentionState006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_006";
      console.info(curTag, "start", bundleName);
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': false
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_cancelRetentionState_001
     * @tc.name testCancelRetentionState001
     * @tc.desc cancelRetentionState success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCancelRetentionState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_cancelRetentionState_001";
      console.info(curTag, "start");

      try {
        let uriArray = ['uri'];
        await dlpPermission.cancelRetentionState(uriArray);
      } catch (err) {
        console.error(curTag, "cancelRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_cancelRetentionState_002
     * @tc.name testCancelRetentionState002
     * @tc.desc cancelRetentionState success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCancelRetentionState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_cancelRetentionState_002";
      console.info(curTag, "start");

      let uriArray = ['uri'];
      dlpPermission.cancelRetentionState(uriArray, async (err) => {
        expect(err).assertEqual(null);
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.number Test_cancelRetentionState_003
     * @tc.name testCancelRetentionState003
     * @tc.desc cancelRetentionState invalid docUris  (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCancelRetentionState003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_cancelRetentionState_003";
      console.info(curTag, "start");

      try {
        let docUris = [];
        await dlpPermission.cancelRetentionState(docUris);
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code === DLPErrCode.ERR_JS_INVALID_PARAMETER).assertTrue();
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_cancelRetentionState_004
     * @tc.name testCancelRetentionState004
     * @tc.desc cancelRetentionState invalid docUris  (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCancelRetentionState004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_cancelRetentionState_004";
      console.info(curTag, "start");

      let docUris = [];
      dlpPermission.cancelRetentionState(docUris, async (err) => {
        expect(err.code === DLPErrCode.ERR_JS_INVALID_PARAMETER).assertTrue();

        console.info(curTag, "end");
      });
    })

    /**
     * @tc.number Test_getRetentionSandboxList_001
     * @tc.name testGetRetentionSandboxList001
     * @tc.desc getRetentionSandboxList with bundle name success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetRetentionSandboxList001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_001";
      console.info(curTag, "start");
      let uri = 'uri';
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.number': 2,
          'ohos.dlp.params.success': true
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
        expect(result.resultCode).assertEqual(0);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }

      try {
        let uriArray = await dlpPermission.getRetentionSandboxList(bundleName);
        expect(typeof (uriArray)).assertEqual("object");
      } catch (err) {
        console.error(curTag, "setRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      try {
        await dlpPermission.cancelRetentionState([uri, "uri2"]);
      } catch (err) {
        console.error(curTag, "cancelRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_getRetentionSandboxList_002
     * @tc.name testGetRetentionSandboxList002
     * @tc.desc getRetentionSandboxList with bundleName success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetRetentionSandboxList002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_002";
      console.info(curTag, "start");

      let uri = 'uri';
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
        expect(result.resultCode).assertEqual(0);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }

      dlpPermission.getRetentionSandboxList(bundleName, async (err, data) => {
        expect(err).assertEqual(null);
        try {
          await dlpPermission.cancelRetentionState([uri, "uri2"]);
        } catch (err) {
          console.error(curTag, "cancelRetentionState failed", err.code, err.message);
          expect(false).assertTrue();
        }

        try {
          await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        } catch (err) {
          console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
        }
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.number Test_getRetentionSandboxList_003
     * @tc.name testGetRetentionSandboxList003
     * @tc.desc getRetentionSandboxList without bundle name success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetRetentionSandboxList003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_003";
      console.info(curTag, "start");
      let uri = 'uri';
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
        expect(result.resultCode).assertEqual(0);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        let uriArray = await dlpPermission.getRetentionSandboxList();
        expect(typeof (uriArray)).assertEqual("object");
      } catch (err) {
        console.error(curTag, "getRetentionSandboxList failed", err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        await dlpPermission.cancelRetentionState([uri]);
      } catch (err) {
        console.error(curTag, "cancelRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_getRetentionSandboxList_004
     * @tc.name testGetRetentionSandboxList004
     * @tc.desc getRetentionSandboxList without bundleName success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetRetentionSandboxList004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_004";
      console.info(curTag, "start");
      let uri = 'uri';
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
        expect(result.resultCode).assertEqual(0);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      dlpPermission.getRetentionSandboxList(async (err, data) => {
        expect(err).assertEqual(null);

        console.info(curTag, "end");
      });
      try {
        await dlpPermission.cancelRetentionState([uri]);
      } catch (err) {
        console.error(curTag, "cancelRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_getRetentionSandboxList_005
     * @tc.name testGetRetentionSandboxList005
     * @tc.desc getRetentionSandboxList sandbox not allow call error  (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetRetentionSandboxList005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_005";
      console.info(curTag, "start");
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetRetentionSandboxListCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }

      try {
        let result: common.AbilityResult = await globalThis.context.startAbilityForResult(want);
        expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getRetentionSandboxList_006
     * @tc.name testGetRetentionSandboxList006
     * @tc.desc getRetentionSandboxList sandbox not allow call error  (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetRetentionSandboxList006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_006";
      console.info(curTag, "start");
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetRetentionSandboxListPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);
      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getRetentionSandboxList_007
     * @tc.name testGetRetentionSandboxList007
     * @tc.desc getRetentionSandboxList  invalid parameter (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetRetentionSandboxList007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_007";
      console.info(curTag, "start");
      try {
        let uriArray:ESObject = -1;
        await dlpPermission.getRetentionSandboxList(uriArray);
        console.info('testGetRetentionSandboxList007 success:');
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      } catch (err) {
        console.info('testGetRetentionSandboxList007 err:' + err.code);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
        console.info(curTag, "end");
        return;
      }
    })

    /**
     * @tc.number Test_getRetentionSandboxList_008
     * @tc.name testGetRetentionSandboxList008
     * @tc.desc getRetentionSandboxList without bundleName success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetRetentionSandboxList008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_008";
      console.info(curTag, "start");
      try {
        dlpPermission.getRetentionSandboxList(null!, async (err, data) => {
          expect(false).assertTrue();
          console.info(curTag, "end");
          return;
        });
      } catch (err) {
        console.info('testGetRetentionSandboxList008 err:' + err.code);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
        console.info(curTag, "end");
        return;
      }
    })

    /**
     * @tc.number Test_getDLPFileAccessRecords_001
     * @tc.name testGetDLPFileAccessRecords001
     * @tc.desc getDLPFileAccessRecords success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDLPFileAccessRecords001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPFileAccessRecords_001";
      console.info(curTag, "start");
      try {
        await dlpPermission.getDLPFileAccessRecords();
      } catch (err) {
        console.error(curTag, "getDLPFileAccessRecords failed", err.code, err.message);
        expect(false).assertTrue();
      }
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      try {
        let accessRecords = await dlpPermission.getDLPFileAccessRecords();
        expect(typeof (accessRecords)).assertEqual("object");
        expect(accessRecords.length).assertLarger(0);
        expect(accessRecords[0].lastOpenTime).assertLarger(0);
        expect(accessRecords[0].uri).assertEqual('uri');
      } catch (err) {
        console.error(curTag, "getDLPFileAccessRecords failed", err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_getDLPFileAccessRecords_002
     * @tc.name testGetDLPFileAccessRecords002
     * @tc.desc getDLPFileAccessRecords success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDLPFileAccessRecords002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_002";
      console.info(curTag, "start");
      try {
        await dlpPermission.getDLPFileAccessRecords();
      } catch (err) {
        console.error(curTag, "getDLPFileAccessRecords failed", err.code, err.message);
        expect(false).assertTrue();
      }
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      dlpPermission.getDLPFileAccessRecords(async (err, accessRecords) => {
        expect(err).assertEqual(null);
        expect(accessRecords.length).assertLarger(0);
        expect(accessRecords[0].lastOpenTime).assertLarger(0);
        expect(accessRecords[0].uri).assertEqual('uri');
        try {
          await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        } catch (err) {
          console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
        }
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.number Test_getDLPFileAccessRecords_003
     * @tc.name testGetDLPFileAccessRecords003
     * @tc.desc getDLPFileAccessRecords sandbox not allow call error  (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDLPFileAccessRecords003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPFileAccessRecords_003";
      console.info(curTag, "start");
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPFileAccessRecordsCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);
      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPFileAccessRecords_004
     * @tc.name testGetDLPFileAccessRecords004
     * @tc.desc getDLPFileAccessRecords sandbox not allow call error  (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDLPFileAccessRecords004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPFileAccessRecords_004";
      console.info(curTag, "start");
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPFileAccessRecordsPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);
      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_isDLPFile_001
     * @tc.name testIsDLPFile001
     * @tc.desc isDLPFile success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsDLPFile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_001";
      console.info(curTag, "start");
      let dlpInfo: TestDlpFileInfo;
      dlpInfo = await genTestDlpFile();

      if(dlpInfo == null){
        return;
      }else{
        try {
          await dlpPermission.isDLPFile(dlpInfo.ciphertextFd);
          console.info(curTag, "end");
          return;
        } catch (err) {
          console.error(curTag, "isDLPFile failed", err.code, err.message);
          expect(false).assertTrue();
          console.info(curTag, "end");
          return;
        }
      }
    })

    /**
     * @tc.number Test_isDLPFile_002
     * @tc.name testIsDLPFile002
     * @tc.desc isDLPFile success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsDLPFile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_002";
      console.info(curTag, "start");
      let dlpInfo: TestDlpFileInfo;
      dlpInfo = await genTestDlpFile();

      if(dlpInfo == null){
        return;
      }else{
        dlpPermission.isDLPFile(dlpInfo.ciphertextFd, async (err, data) => {
          expect(err).assertEqual(null);
          await closeTestDlpFile(dlpInfo);
          console.info(curTag, "end");
        });
        return;
      }
    })

    /*
     * @tc.number Test_isDLPFile_003
     * @tc.name testIsDLPFile003
     * @tc.desc isDLPFile invalid fd (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsDLPFile003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_003";
      console.info(curTag, "start");

      try {
        await dlpPermission.isDLPFile(-1);
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_isDLPFile_004
     * @tc.name testIsDLPFile004
     * @tc.desc isDLPFile success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsDLPFile004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_004";
      console.info(curTag, "start");
      try {
        dlpPermission.isDLPFile(-1, (err, data) => {
        });
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
        console.info(curTag, "end");
      }
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_001
     * @tc.name testGetDLPPermissionInfo001
     * @tc.desc test getDLPPermissionInfo in sandbox (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDLPPermissionInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_001";
      console.info(curTag, "start");

      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPPermissionInfoPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_002
     * @tc.name testGetDLPPermissionInfo002
     * @tc.desc test getDLPPermissionInfo in sandbox (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDLPPermissionInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_002";
      console.info(curTag, "start");

      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPPermissionInfoCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.error(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_003
     * @tc.name testGetDLPPermissionInfo003
     * @tc.desc test getDLPPermissionInfo in not sandbox (Promise)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDLPPermissionInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_003";
      console.info(curTag, "start");

      try {
        let dlpPermInfo = await dlpPermission.getDLPPermissionInfo();
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_API_FOR_SANDBOX_ERROR);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_004
     * @tc.name testGetDLPPermissionInfo004
     * @tc.desc test getDLPPermissionInfo in not sandbox (Callback)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDLPPermissionInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_004";
      console.info(curTag, "start");

      dlpPermission.getDLPPermissionInfo(async (err, dlpPermInfo) => {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_API_FOR_SANDBOX_ERROR);
      });

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_005
     * @tc.name testGetDLPPermissionInfo005
     * @tc.desc test getDLPPermissionInfo ActionFlagType ACTION_VIEW
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo005---------------------------');
      let value:number = dlpPermission.ActionFlagType.ACTION_VIEW;
      console.log("testGetDLPPermissionInfo005 value is:" + value);
      expect(value).assertEqual(1);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_006
     * @tc.name testGetDLPPermissionInfo006
     * @tc.desc test getDLPPermissionInfo ActionFlagType ACTION_SAVE
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo006---------------------------');
      let value:number = dlpPermission.ActionFlagType.ACTION_SAVE;
      console.log("testGetDLPPermissionInfo006 value is:" + value);
      expect(value).assertEqual(2);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_007
     * @tc.name testGetDLPPermissionInfo007
     * @tc.desc test getDLPPermissionInfo ActionFlagType ACTION_SAVE_AS
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo007---------------------------');
      let value:number = dlpPermission.ActionFlagType.ACTION_SAVE_AS;
      console.log("testGetDLPPermissionInfo007 value is:" + value);
      expect(value).assertEqual(4);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_008
     * @tc.name testGetDLPPermissionInfo008
     * @tc.desc test getDLPPermissionInfo ActionFlagType ACTION_EDIT
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo008---------------------------');
      let value:number = dlpPermission.ActionFlagType.ACTION_EDIT;
      console.log("testGetDLPPermissionInfo008 value is:" + value);
      expect(value).assertEqual(8);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_009
     * @tc.name testGetDLPPermissionInfo009
     * @tc.desc test getDLPPermissionInfo ActionFlagType ACTION_SCREEN_CAPTURE
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo009---------------------------');
      let value:number = dlpPermission.ActionFlagType.ACTION_SCREEN_CAPTURE;
      console.log("testGetDLPPermissionInfo009 value is:" + value);
      expect(value).assertEqual(16);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_010
     * @tc.name testGetDLPPermissionInfo010
     * @tc.desc test getDLPPermissionInfo ActionFlagType ACTION_SCREEN_SHARE
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo010---------------------------');
      let value:number = dlpPermission.ActionFlagType.ACTION_SCREEN_SHARE;
      console.log("testGetDLPPermissionInfo010 value is:" + value);
      expect(value).assertEqual(32);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_011
     * @tc.name testGetDLPPermissionInfo011
     * @tc.desc test getDLPPermissionInfo ActionFlagType ACTION_SCREEN_RECORD
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo011---------------------------');
      let value:number = dlpPermission.ActionFlagType.ACTION_SCREEN_RECORD;
      console.log("testGetDLPPermissionInfo011 value is:" + value);
      expect(value).assertEqual(64);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_012
     * @tc.name testGetDLPPermissionInfo012
     * @tc.desc test getDLPPermissionInfo ActionFlagType ACTION_COPY
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo012---------------------------');
      let value:number = dlpPermission.ActionFlagType.ACTION_COPY;
      console.log("testGetDLPPermissionInfo012 value is:" + value);
      expect(value).assertEqual(128);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_013
     * @tc.name testGetDLPPermissionInfo013
     * @tc.desc test getDLPPermissionInfo ActionFlagType ACTION_PRINT
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo013---------------------------');
      let value:number = dlpPermission.ActionFlagType.ACTION_PRINT;
      console.log("testGetDLPPermissionInfo013 value is:" + value);
      expect(value).assertEqual(256);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_014
     * @tc.name testGetDLPPermissionInfo014
     * @tc.desc test getDLPPermissionInfo ActionFlagType ACTION_EXPORT
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo014---------------------------');
      let value:number = dlpPermission.ActionFlagType.ACTION_EXPORT;
      console.log("testGetDLPPermissionInfo014 value is:" + value);
      expect(value).assertEqual(512);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_015
     * @tc.name testGetDLPPermissionInfo015
     * @tc.desc test getDLPPermissionInfo ActionFlagType ACTION_PERMISSION_CHANGE
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo015---------------------------');
      let value:number = dlpPermission.ActionFlagType.ACTION_PERMISSION_CHANGE;
      console.log("testGetDLPPermissionInfo015 value is:" + value);
      expect(value).assertEqual(1024);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_016
     * @tc.name testGetDLPPermissionInfo016
     * @tc.desc test getDLPPermissionInfo DLPFileAccess NO_PERMISSION
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo016---------------------------');
      let value:number = dlpPermission.DLPFileAccess.NO_PERMISSION;
      console.log("testGetDLPPermissionInfo016 value is:" + value);
      expect(value).assertEqual(0);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_017
     * @tc.name testGetDLPPermissionInfo017
     * @tc.desc test getDLPPermissionInfo DLPFileAccess READ_ONLY
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo017---------------------------');
      let value:number = dlpPermission.DLPFileAccess.READ_ONLY;
      console.log("testGetDLPPermissionInfo017 value is:" + value);
      expect(value).assertEqual(1);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_018
     * @tc.name testGetDLPPermissionInfo018
     * @tc.desc test getDLPPermissionInfo DLPFileAccess CONTENT_EDIT
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo018---------------------------');
      let value:number = dlpPermission.DLPFileAccess.CONTENT_EDIT;
      console.log("testGetDLPPermissionInfo018 value is:" + value);
      expect(value).assertEqual(2);
      return;
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_019
     * @tc.name testGetDLPPermissionInfo019
     * @tc.desc test getDLPPermissionInfo DLPFileAccess FULL_CONTROL
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testGetDLPPermissionInfo019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo019---------------------------');
      let value:number = dlpPermission.DLPFileAccess.FULL_CONTROL;
      console.log("testGetDLPPermissionInfo019 value is:" + value);
      expect(value).assertEqual(3);
      return;
    })

    /**
     * @tc.number Test_getOriginalFileName_001
     * @tc.name testGetOriginalFileName001
     * @tc.desc test getOriginalFileName
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOriginalFileName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_001";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('1.txt.dlp');
        expect(name).assertEqual('1.txt');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getOriginalFileName_002
     * @tc.name testGetOriginalFileName002
     * @tc.desc test getOriginalFileName invalid fileName
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOriginalFileName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_002";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('');
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPSuffix_001
     * @tc.name testGetDLPSuffix001
     * @tc.desc test getDLPSuffix
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDLPSuffix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPSuffix_001";
      console.info(curTag, "start");

      try {
        let name: string = dlpPermission.getDLPSuffix();
        expect(name).assertEqual('.dlp');
      } catch (err) {
        console.error(curTag, "getDLPSuffix failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_on_openDLPFile_001
     * @tc.name testOnOpenDLPFile001
     * @tc.desc test on('openDLPFile') success.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOnOpenDLPFile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_on_openDLPFile_001";
      console.info(curTag, "start");

      let called = false;
      let srcUri = '123456'
      try {
        dlpPermission.on('openDLPFile', (dlpFileInfo) => {
          expect(dlpFileInfo.uri).assertEqual(srcUri);
          called = true;
        });
      } catch (err) {
        console.error(curTag, 'on openDLPFile failed', err.code, err.message);
        expect(false).assertTrue();
      }

      try {
        let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, '123456');
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.error(curTag, 'installDLPSandbox failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }

      expect(called).assertEqual(true);
      dlpPermission.off('openDLPFile');
      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_on_openDLPFile_002
     * @tc.name testOnOpenDLPFile002
     * @tc.desc test on('openDLPFile') in sandbox.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOnOpenDLPFile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_on_openDLPFile_002";
      console.info(curTag, "start");

      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "OnOpenDlpFile",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.error(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_on_openDLPFile_003
     * @tc.name testOnOpenDLPFile003
     * @tc.desc test on('openDLPFile') invalid param.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOnOpenDLPFile003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_on_openDLPFile_003";
      console.info(curTag, "start");

      try {
         
        dlpPermission.on('openDLPFile', (dlpFileInfo) => {
        });
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
    })


    /**
     * @tc.number Test_off_openDLPFile_001
     * @tc.name testOffOpenDLPFile001
     * @tc.desc test off('openDLPFile') success.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOffOpenDLPFile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_off_openDLPFile_001";
      console.info(curTag, "start");

      let called1 = 0;
      let func1 = (dlpFileInfo: dlpPermission.AccessedDLPFileInfo) => {
        expect(dlpFileInfo.uri).assertEqual(srcUri);
        called1++;
      }
      let called2 = 0;
      let func2 = (dlpFileInfo: dlpPermission.AccessedDLPFileInfo) => {
        expect(dlpFileInfo.uri).assertEqual(srcUri);
        called2++;
      }

      let srcUri = '123456'
      try {
        dlpPermission.on('openDLPFile', func1);
      } catch (err) {
        console.error(curTag, 'on openDLPFile failed', err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        dlpPermission.on('openDLPFile', func2);
      } catch (err) {
        console.error(curTag, 'on openDLPFile failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }

      try {
        let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, '123456');
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.error(curTag, 'installDLPSandbox failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }
      expect(called1).assertEqual(1);
      expect(called2).assertEqual(1);

      try {
        dlpPermission.off('openDLPFile', func1);
      } catch (err) {
        console.error(curTag, 'off openDLPFile failed', err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, '123456');
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.error(curTag, 'installDLPSandbox failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }
      dlpPermission.off('openDLPFile');
      expect(called1).assertEqual(1);
      expect(called2).assertEqual(2);
      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_off_openDLPFile_002
     * @tc.name testOffOpenDLPFile002
     * @tc.desc test off('openDLPFile') all callback success.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOffOpenDLPFile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_off_openDLPFile_002";
      console.info(curTag, "start");

      let called1 = 0;
      let func1 = (dlpFileInfo: dlpPermission.AccessedDLPFileInfo) => {
        expect(dlpFileInfo.uri).assertEqual(srcUri);
        called1++;
      }
      let called2 = 0;
      let func2 = (dlpFileInfo: dlpPermission.AccessedDLPFileInfo) => {
        expect(dlpFileInfo.uri).assertEqual(srcUri);
        called2++;
      }

      let srcUri = '123456'
      try {
        dlpPermission.on('openDLPFile', func1);
      } catch (err) {
        console.error(curTag, 'on openDLPFile failed', err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        dlpPermission.on('openDLPFile', func2);
      } catch (err) {
        console.error(curTag, 'on openDLPFile failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }

      try {
        let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, '123456');
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.error(curTag, 'installDLPSandbox failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }
      expect(called1).assertEqual(1);
      expect(called2).assertEqual(1);

      try {
        dlpPermission.off('openDLPFile');
      } catch (err) {
        console.error(curTag, 'off openDLPFile failed', err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, '123456');
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.error(curTag, 'installDLPSandbox failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }
      expect(called1).assertEqual(1);
      expect(called2).assertEqual(1);
      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_off_openDLPFile_003
     * @tc.name testOffOpenDLPFile003
     * @tc.desc test off('openDLPFile') invalid param.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOffOpenDLPFile003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_off_openDLPFile_003";
      console.info(curTag, "start");

      try {
         
        dlpPermission.off('openDLPFile', (dlpFileInfo) => {
        });
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0100
     * @tc.name testSetSandboxAppConfig0100
     * @tc.desc test setSandboxAppConfig success promise.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetSandboxAppConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0100";
      console.info(curTag, "start");

      try {
        await dlpPermission.setSandboxAppConfig('configInfo');
      } catch (err) {
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0200
     * @tc.name testSetSandboxAppConfig0200
     * @tc.desc test setSandboxAppConfig invalid param.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetSandboxAppConfig0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0200";
      console.info(curTag, "start");

      try {
         
        await dlpPermission.setSandboxAppConfig('111');
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0300
     * @tc.name testSetSandboxAppConfig0300
     * @tc.desc test setSandboxAppConfig cannot be called by DLP sandbox application
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetSandboxAppConfig0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0300";
      console.info(curTag, "start");
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SandboxConfigPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.method': 'set'
        }
      }
      try {
        let result: common.AbilityResult = await globalThis.context.startAbilityForResult(want);
        console.log("SUB_SECURITY_DLP_setSandboxAppConfig_0300 result is: ", JSON.stringify(result));
        expect(result.resultCode).assertEqual(0);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number SUB_SECURITY_DLP_getSandboxAppConfig_0100
     * @tc.name testGetSandboxAppConfig0100
     * @tc.desc test getSandboxAppConfig success promise.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetSandboxAppConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_getSandboxAppConfig_0100";
      console.info(curTag, "start");

      try {
        await dlpPermission.getSandboxAppConfig();
      } catch (err) {
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.number SUB_SECURITY_DLP_cleanSandboxAppConfig_0100
     * @tc.name testCleanSandboxAppConfig0100
     * @tc.desc test cleanSandboxAppConfig success promise.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCleanSandboxAppConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_cleanSandboxAppConfig_0100";
      console.info(curTag, "start");

      try {
        await dlpPermission.cleanSandboxAppConfig();
      } catch (err) {
        expect(false).assertTrue();
        return;
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.number SUB_SECURITY_DLP_cleanSandboxAppConfig_0200
     * @tc.name testCleanSandboxAppConfig0200
     * @tc.desc test cleanSandboxAppConfig cannot be called by DLP sandbox application
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCleanSandboxAppConfig0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_cleanSandboxAppConfig_0200";
      console.info(curTag, "start");
      let sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SandboxConfigPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.method': 'clean'
        }
      }
      try {
        let result: common.AbilityResult = await globalThis.context.startAbilityForResult(want);
        console.log("SUB_SECURITY_DLP_cleanSandboxAppConfig_0200 result is: ", JSON.stringify(result));
        expect(result.resultCode).assertEqual(19100007);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number SUB_SECURITY_DLP_isDLPFeatureProvided_0100
     * @tc.name testIsDLPFeatureProvided
     * @tc.desc test isDLPFeatureProvided success promise.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsDLPFeatureProvided', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_isDLPFeatureProvided_0100";
      console.info(curTag, "start");
      await dlpPermission.isDLPFeatureProvided().then((res) => {
        console.info(curTag, JSON.stringify(res));
      }).catch((err: BusinessError) => {
        console.info(curTag, 'isDLPFeatureProvided: ' + JSON.stringify(err));
        expect(false).assertTrue();
        return;
      });
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number SUB_SECURITY_DLP_startDLPManagerForResult_0100
     * @tc.name testStartDLPManagerForResult0100
     * @tc.desc test startDLPManagerForResult cannot be called by DLP sandbox application
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartDLPManagerForResult0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_startDLPManagerForResult_0100";
      console.info(curTag, "SUB_SECURITY_DLP_startDLPManagerForResult_0100 start");
      try {
        let context: common.UIAbilityContext = globalThis.context; // 获取当前UIAbilityContext
        let want: Want = {
          "uri": "file://docs/storage/Users/currentUser/Desktop/1.txt",
          "parameters": {
            "displayName": ""
          }
        }; // 请求参数
        // await dlpPermission.startDLPManagerForResult(context, want); // 打开DLP权限管理应用
        dlpPermission.startDLPManagerForResult(context, want).then((res) => {
          console.info('SUB_SECURITY_DLP_startDLPManagerForResult_0100 res.resultCode', res.resultCode);
          console.info('SUB_SECURITY_DLP_startDLPManagerForResult_0100 res.want', JSON.stringify(res.want));
        })
      } catch (err) {
        console.info(curTag, "SUB_SECURITY_DLP_startDLPManagerForResult_0100 startDLPManagerForResult failed", err.code, err.message);
        expect(err.code == 19100017 && err.message == "displayName not exist in want parameters").assertTrue();
      }
      console.info(curTag, "SUB_SECURITY_DLP_startDLPManagerForResult_0100 end");
      return;
    })

    /**
     * @tc.number SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100
     * @tc.name test startDLPManagerForResult
     * @tc.desc test 调用startDLPManagerForResult接口，不传入uri参数，返回19100016错误码
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100: started.");
      try {
        let context: common.UIAbilityContext = globalThis.context; // 获取当前UIAbilityContext
        let want: Want = {
          "uri": "",
          "parameters": {
            "displayName": ""
          }
        }; // 请求参数
        dlpPermission.startDLPManagerForResult(context, want).then((res) => {
          console.info('SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100 res.resultCode', res.resultCode);
          console.info('SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100 res.want', JSON.stringify(res.want));
        })
        expect(null).assertFail();
      } catch (err) {
        console.info("SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100 startDLPManagerForResult failed", err.code, err.message);
        expect(err.code).assertEqual(19100016);
      }
      console.info("SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100 end");
      done();
    })

  })
}