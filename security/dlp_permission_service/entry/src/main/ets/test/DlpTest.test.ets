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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium'

var DLPErrCode = {
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
  dlpFile: dlpPermission.DLPFile = null;
  plaintextPath: string = '';
  ciphertextPath: string = '';
  plaintextFd: number = -1;
  ciphertextFd: number = -1;
}

const TAG = "DLP_XTS ";
let user1: dlpPermission.AuthUser = {
  authAccount: "123@ohos.com",
  authAccountType: dlpPermission.AccountType.CLOUD_ACCOUNT,
  dlpFileAccess: dlpPermission.DLPFileAccess.READ_ONLY,
  permExpiryTime: 8888520175,
};
let user2: dlpPermission.AuthUser = {
  authAccount: "456@ohos.com",
  authAccountType: dlpPermission.AccountType.CLOUD_ACCOUNT,
  dlpFileAccess: dlpPermission.DLPFileAccess.FULL_CONTROL,
  permExpiryTime: 8888520175,
};

var userList = new Array(2);
userList[0] = user1;
userList[1] = user2;

var userId;


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
    expect(false).assertTrue();
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
function genFile(path: string, content?) {
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
    ownerAccountType: dlpPermission.AccountType.CLOUD_ACCOUNT,
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
    ownerAccountType: dlpPermission.AccountType.CLOUD_ACCOUNT,
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
    expect(true).assertTrue()
    dlpInfo.dlpFile = dlpFile;
    return dlpInfo;
  } catch (err) {
    console.error(TAG, "generateDLPFile failed", err.code, err.message);
    fs.closeSync(dlpInfo.plaintextFd);
    fs.closeSync(dlpInfo.ciphertextFd);
    fs.unlinkSync(dlpInfo.ciphertextPath);
    fs.unlinkSync(dlpInfo.plaintextPath);
    expect(false).assertTrue()
    return null;
  }
}

// 关闭测试DLP文件
async function closeTestDlpFile(dlpInfo: TestDlpFileInfo) {
  try {
    await dlpInfo.dlpFile.closeDLPFile();
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
    afterEach(async (done) => {
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
     * @tc.name Test dlpPermission.getDLPSupportedFileTypes.
     * @tc.desc generateDLPFile success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPSupportedFileTypes_001', 0, async () => {
      let curTag = TAG + "Test_getDLPSupportedFileTypes_001";
      console.info(curTag, "start");

      try {
        var fileTypes = await dlpPermission.getDLPSupportedFileTypes();
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
     * @tc.name Test dlpPermission.getDLPSupportedFileTypes.
     * @tc.desc generateDLPFile success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPSupportedFileTypes_002', 0, async () => {
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
     * @tc.name Test dlpPermission.setRetentionState.
     * @tc.desc setRetentionState not from sandbox fail with code 19100006 (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_setRetentionState_001', 0, async () => {
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
     * @tc.name Test dlpPermission.setRetentionState.
     * @tc.desc setRetentionState not from sandbox fail with code 19100006 (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_setRetentionState_002', 0, async () => {
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
     * @tc.name Test dlpPermission.setRetentionState.
     * @tc.desc setRetentionState sandbox  call success  (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_setRetentionState_003', 0, async () => {
      let curTag = TAG + "Test_setRetentionState_003";
      console.info(curTag, "start");
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStateCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      }
      let result;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      var uriArray = ['uri'];
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
     * @tc.name Test dlpPermission.setRetentionState.
     * @tc.desc setRetentionState sandbox call success  (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_setRetentionState_004', 0, async () => {
      let curTag = TAG + "Test_setRetentionState_004";
      console.info(curTag, "start", bundleName);
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result;
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
     * @tc.name Test dlpPermission.setRetentionState.
     * @tc.desc setRetentionState sandbox  call parameter error  (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_setRetentionState_005', 0, async () => {
      let curTag = TAG + "Test_setRetentionState_005";
      console.info(curTag, "start");
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStateCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': false
        }
      }
      let result;
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
     * @tc.name Test dlpPermission.setRetentionState.
     * @tc.desc setRetentionState sandbox call parameter error  (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_setRetentionState_006', 0, async () => {
      let curTag = TAG + "Test_setRetentionState_006";
      console.info(curTag, "start", bundleName);
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': false
        }
      };
      let result;
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
     * @tc.name Test dlpPermission.cancelRetentionState.
     * @tc.desc cancelRetentionState success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_cancelRetentionState_001', 0, async () => {
      let curTag = TAG + "Test_cancelRetentionState_001";
      console.info(curTag, "start");

      try {
        var uriArray = ['uri'];
        await dlpPermission.cancelRetentionState(uriArray);
        expect(true).assertTrue();
      } catch (err) {
        console.error(curTag, "cancelRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_cancelRetentionState_002
     * @tc.name Test dlpPermission.cancelRetentionState.
     * @tc.desc cancelRetentionState success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_cancelRetentionState_002', 0, async () => {
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
     * @tc.name Test dlpPermission.cancelRetentionState.
     * @tc.desc cancelRetentionState invalid docUris  (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_cancelRetentionState_003', 0, async () => {
      let curTag = TAG + "Test_cancelRetentionState_003";
      console.info(curTag, "start");

      try {
        var docUris = [];
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
     * @tc.name Test dlpPermission.cancelRetentionState.
     * @tc.desc cancelRetentionState invalid docUris  (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_cancelRetentionState_004', 0, async () => {
      let curTag = TAG + "Test_cancelRetentionState_004";
      console.info(curTag, "start");

      var docUris = [];
      dlpPermission.cancelRetentionState(docUris, async (err) => {
        expect(err.code === DLPErrCode.ERR_JS_INVALID_PARAMETER).assertTrue();

        console.info(curTag, "end");
      });
    })

    /**
     * @tc.number Test_getRetentionSandboxList_001
     * @tc.name Test dlpPermission.getRetentionSandboxList
     * @tc.desc getRetentionSandboxList with bundle name success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getRetentionSandboxList_001', 0, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_001";
      console.info(curTag, "start");
      let uri = 'uri';
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.number': 2,
          'ohos.dlp.params.success': true
        }
      };
      let result;
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
        var uriArray = await dlpPermission.getRetentionSandboxList(bundleName);
        expect(typeof (uriArray)).assertEqual("object");
      } catch (err) {
        console.error(curTag, "setRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      try {
        await dlpPermission.cancelRetentionState([uri, "uri2"]);
        expect(true).assertTrue();
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
     * @tc.name Test dlpPermission.getRetentionSandboxList.
     * @tc.desc getRetentionSandboxList with bundleName success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getRetentionSandboxList_002', 0, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_002";
      console.info(curTag, "start");

      let uri = 'uri';
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result;
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
          expect(true).assertTrue();
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
     * @tc.name Test dlpPermission.getRetentionSandboxList
     * @tc.desc getRetentionSandboxList without bundle name success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getRetentionSandboxList_003', 0, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_003";
      console.info(curTag, "start");
      let uri = 'uri';
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result;
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
        var uriArray = await dlpPermission.getRetentionSandboxList();
        expect(typeof (uriArray)).assertEqual("object");
      } catch (err) {
        console.error(curTag, "getRetentionSandboxList failed", err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        await dlpPermission.cancelRetentionState([uri]);
        expect(true).assertTrue();
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
     * @tc.name Test dlpPermission.getRetentionSandboxList.
     * @tc.desc getRetentionSandboxList without bundleName success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getRetentionSandboxList_004', 0, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_004";
      console.info(curTag, "start");
      let uri = 'uri';
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result;
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
        expect(true).assertTrue();
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
     * @tc.name Test dlpPermission.getRetentionSandboxList.
     * @tc.desc getRetentionSandboxList sandbox not allow call error  (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getRetentionSandboxList_005', 0, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_005";
      console.info(curTag, "start");
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetRetentionSandboxListCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }

      try {
        let result = await globalThis.context.startAbilityForResult(want);
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
     * @tc.name Test dlpPermission.getRetentionSandboxList.
     * @tc.desc getRetentionSandboxList sandbox not allow call error  (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getRetentionSandboxList_006', 0, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_006";
      console.info(curTag, "start");
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetRetentionSandboxListPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result;
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
     * @tc.name Test dlpPermission.getRetentionSandboxList
     * @tc.desc getRetentionSandboxList  invalid parameter (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getRetentionSandboxList_007', 0, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_007";
      console.info(curTag, "start");
      try {
        // @ts-ignore
        var uriArray = await dlpPermission.getRetentionSandboxList(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        expect(true).assertTrue();
      }
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_getRetentionSandboxList_008
     * @tc.name Test dlpPermission.getRetentionSandboxList.
     * @tc.desc getRetentionSandboxList without bundleName success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getRetentionSandboxList_008', 0, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_008";
      console.info(curTag, "start");
      try {
        // @ts-ignore
        dlpPermission.getRetentionSandboxList(-1, async (err, data) => {
          expect(false).assertTrue();
          console.info(curTag, "end");

        });
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
        console.info(curTag, "end");

        return;
      }
      expect(false).assertTrue();
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_getDLPFileAccessRecords_001
     * @tc.name Test dlpPermission.getDLPFileAccessRecords
     * @tc.desc getDLPFileAccessRecords success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPFileAccessRecords_001', 0, async () => {
      let curTag = TAG + "Test_getDLPFileAccessRecords_001";
      console.info(curTag, "start");
      try {
        await dlpPermission.getDLPFileAccessRecords();
      } catch (err) {
        console.error(curTag, "getDLPFileAccessRecords failed", err.code, err.message);
        expect(false).assertTrue();
      }
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      try {
        var accessRecords = await dlpPermission.getDLPFileAccessRecords();
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
     * @tc.name Test dlpPermission.getDLPFileAccessRecords.
     * @tc.desc getDLPFileAccessRecords success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPFileAccessRecords_002', 0, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_002";
      console.info(curTag, "start");
      try {
        await dlpPermission.getDLPFileAccessRecords();
      } catch (err) {
        console.error(curTag, "getDLPFileAccessRecords failed", err.code, err.message);
        expect(false).assertTrue();
      }
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
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
     * @tc.name Test dlpPermission.getDLPFileAccessRecords.
     * @tc.desc getDLPFileAccessRecords sandbox not allow call error  (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPFileAccessRecords_003', 0, async () => {
      let curTag = TAG + "Test_getDLPFileAccessRecords_003";
      console.info(curTag, "start");
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPFileAccessRecordsCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result;
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
     * @tc.name Test dlpPermission.getDLPFileAccessRecords.
     * @tc.desc getDLPFileAccessRecords sandbox not allow call error  (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPFileAccessRecords_004', 0, async () => {
      let curTag = TAG + "Test_getDLPFileAccessRecords_004";
      console.info(curTag, "start");
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPFileAccessRecordsPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result;
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
     * @tc.name Test dlpPermission.isDLPFile.
     * @tc.desc isDLPFile success (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_isDLPFile_001', 0, async () => {
      let curTag = TAG + "Test_isDLPFile_001";
      console.info(curTag, "start");

      let dlpInfo = await genTestDlpFile();

      try {
        await dlpPermission.isDLPFile(dlpInfo.ciphertextFd);
        expect(true).assertTrue();
      } catch (err) {
        console.error(curTag, "isDLPFile failed", err.code, err.message);
        expect(false).assertTrue();
        return;
      }

      await closeTestDlpFile(dlpInfo);
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_isDLPFile_002
     * @tc.name Test dlpPermission.isDLPFile.
     * @tc.desc isDLPFile success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_isDLPFile_002', 0, async () => {
      let curTag = TAG + "Test_isDLPFile_002";
      console.info(curTag, "start");
      let dlpInfo = await genTestDlpFile();

      dlpPermission.isDLPFile(dlpInfo.ciphertextFd, async (err, data) => {
        expect(err).assertEqual(null);
        await closeTestDlpFile(dlpInfo);
        console.info(curTag, "end");
      });
    })

    /*
     * @tc.number Test_isDLPFile_003
     * @tc.name Test dlpPermission.isDLPFile.
     * @tc.desc isDLPFile invalid fd (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_isDLPFile_003', 0, async () => {
      var curTag = TAG + "Test_isDLPFile_003";
      console.info(curTag, "start");

      try {
        await dlpPermission.isDLPFile(-1);
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
        expect(true).assertTrue();
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number Test_isDLPFile_004
     * @tc.name Test dlpPermission.isDLPFile.
     * @tc.desc isDLPFile success (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_isDLPFile_004', 0, async () => {
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
     * @tc.name Test dlpPermission.getDLPPermissionInfo.
     * @tc.desc test getDLPPermissionInfo in sandbox (Promise).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPPermissionInfo_001', 0, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_001";
      console.info(curTag, "start");

      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPPermissionInfoPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result;
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
     * @tc.name Test dlpPermission.getDLPPermissionInfo.
     * @tc.desc test getDLPPermissionInfo in sandbox (Callback).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPPermissionInfo_002', 0, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_002";
      console.info(curTag, "start");

      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPPermissionInfoCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result;
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
     * @tc.name Test dlpPermission.getDLPPermissionInfo.
     * @tc.desc test getDLPPermissionInfo in not sandbox (Promise)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPPermissionInfo_003', 0, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_003";
      console.info(curTag, "start");

      try {
        var dlpPermInfo = await dlpPermission.getDLPPermissionInfo();
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_API_FOR_SANDBOX_ERROR);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_004
     * @tc.name Test dlpPermission.getDLPPermissionInfo.
     * @tc.desc test getDLPPermissionInfo in not sandbox (Callback)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPPermissionInfo_004', 0, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_004";
      console.info(curTag, "start");

      dlpPermission.getDLPPermissionInfo(async (err, dlpPermInfo) => {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_API_FOR_SANDBOX_ERROR);
      });

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_005
     * @tc.name Test dlpPermission.getDLPPermissionInfo.
     * @tc.desc test getDLPPermissionInfo in read only sandbox (Promise)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPPermissionInfo_005', 0, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_005";
      console.info(curTag, "start");

      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPPermissionInfoPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_VIEW)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_VIEW);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SAVE).assertEqual(0);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SAVE_AS).assertEqual(0);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_EDIT).assertEqual(0);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SCREEN_CAPTURE).assertEqual(0);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SCREEN_SHARE).assertEqual(0);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SCREEN_RECORD).assertEqual(0);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_COPY).assertEqual(0);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_PRINT).assertEqual(0);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_EXPORT).assertEqual(0);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_PERMISSION_CHANGE).assertEqual(0);
      expect(result.want.parameters.info.dlpFileAccess).assertEqual(dlpPermission.DLPFileAccess.READ_ONLY);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_006
     * @tc.name Test dlpPermission.getDLPPermissionInfo.
     * @tc.desc test getDLPPermissionInfo in content edit sandbox (Promise)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPPermissionInfo_006', 0, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_006";
      console.info(curTag, "start");

      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.CONTENT_EDIT, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPPermissionInfoPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_VIEW)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_VIEW);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SAVE)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_SAVE);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SAVE_AS)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_SAVE_AS);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_EDIT)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_EDIT);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SCREEN_CAPTURE)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_SCREEN_CAPTURE);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SCREEN_SHARE)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_SCREEN_SHARE);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SCREEN_RECORD)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_SCREEN_RECORD);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_COPY)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_COPY);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_PRINT).assertEqual(0);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_EXPORT).assertEqual(0);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_PERMISSION_CHANGE).assertEqual(0);
      expect(result.want.parameters.info.dlpFileAccess).assertEqual(dlpPermission.DLPFileAccess.CONTENT_EDIT);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_007
     * @tc.name Test dlpPermission.getDLPPermissionInfo.
     * @tc.desc test getDLPPermissionInfo in read only sandbox (Promise)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPPermissionInfo_007', 0, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_007";
      console.info(curTag, "start");

      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPPermissionInfoPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      expect(result.want.parameters.info.dlpFileAccess).not().assertEqual(dlpPermission.DLPFileAccess.NO_PERMISSION);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPPermissionInfo_008
     * @tc.name Test dlpPermission.getDLPPermissionInfo.
     * @tc.desc test getDLPPermissionInfo in content fullcontrol sandbox (Promise)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPPermissionInfo_008', 0, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_008";
      console.info(curTag, "start");

      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.FULL_CONTROL, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPPermissionInfoPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_VIEW)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_VIEW);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SAVE)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_SAVE);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SAVE_AS)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_SAVE_AS);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_EDIT)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_EDIT);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SCREEN_CAPTURE)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_SCREEN_CAPTURE);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SCREEN_SHARE)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_SCREEN_SHARE);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_SCREEN_RECORD)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_SCREEN_RECORD);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_COPY)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_COPY);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_PRINT)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_PRINT);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_EXPORT)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_EXPORT);
      expect(result.want.parameters.info.flags & dlpPermission.ActionFlagType.ACTION_PERMISSION_CHANGE)
        .assertEqual(dlpPermission.ActionFlagType.ACTION_PERMISSION_CHANGE);
      expect(result.want.parameters.info.dlpFileAccess).assertEqual(dlpPermission.DLPFileAccess.FULL_CONTROL);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getOriginalFileName_001
     * @tc.name Test dlpPermission.getOriginalFileName.
     * @tc.desc test getOriginalFileName
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getOriginalFileName_001', 0, async () => {
      let curTag = TAG + "Test_getOriginalFileName_001";
      console.info(curTag, "start");

      try {
        var name = dlpPermission.getOriginalFileName('1.txt.dlp');
        expect(name).assertEqual('1.txt');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getOriginalFileName_002
     * @tc.name Test dlpPermission.getOriginalFileName.
     * @tc.desc test getOriginalFileName invalid fileName
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getOriginalFileName_002', 0, async () => {
      let curTag = TAG + "Test_getOriginalFileName_002";
      console.info(curTag, "start");

      try {
        var name = dlpPermission.getOriginalFileName('');
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
        expect(true).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.number Test_getDLPSuffix_001
     * @tc.name Test dlpPermission.getDLPSuffix.
     * @tc.desc test getDLPSuffix
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_getDLPSuffix_001', 0, async () => {
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
     * @tc.name Test dlpPermission.on('openDLPFile').
     * @tc.desc test on('openDLPFile') success.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_on_openDLPFile_001', 0, async () => {
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
        var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, '123456');
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
     * @tc.name Test dlpPermission.on('openDLPFile').
     * @tc.desc test on('openDLPFile') in sandbox.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_on_openDLPFile_002', 0, async () => {
      let curTag = TAG + "Test_on_openDLPFile_002";
      console.info(curTag, "start");

      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "OnOpenDlpFile",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result;
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
     * @tc.name Test dlpPermission.on('openDLPFile').
     * @tc.desc test on('openDLPFile') invalid param.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_on_openDLPFile_003', 0, async () => {
      let curTag = TAG + "Test_on_openDLPFile_003";
      console.info(curTag, "start");

      try {
        // @ts-ignore
        dlpPermission.on('openDLPFile1', (dlpFileInfo) => {
        });
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
    })


    /**
     * @tc.number Test_off_openDLPFile_001
     * @tc.name Test dlpPermission.off('openDLPFile').
     * @tc.desc test off('openDLPFile') success.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_off_openDLPFile_001', 0, async () => {
      let curTag = TAG + "Test_off_openDLPFile_001";
      console.info(curTag, "start");

      let called1 = 0;
      let func1 = (dlpFileInfo) => {
        expect(dlpFileInfo.uri).assertEqual(srcUri);
        called1++;
      }
      let called2 = 0;
      let func2 = (dlpFileInfo) => {
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
     * @tc.name Test dlpPermission.off('openDLPFile').
     * @tc.desc test off('openDLPFile') all callback success.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_off_openDLPFile_002', 0, async () => {
      let curTag = TAG + "Test_off_openDLPFile_002";
      console.info(curTag, "start");

      let called1 = 0;
      let func1 = (dlpFileInfo) => {
        expect(dlpFileInfo.uri).assertEqual(srcUri);
        called1++;
      }
      let called2 = 0;
      let func2 = (dlpFileInfo) => {
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
     * @tc.name Test dlpPermission.off('openDLPFile').
     * @tc.desc test off('openDLPFile') invalid param.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Test_off_openDLPFile_003', 0, async () => {
      let curTag = TAG + "Test_off_openDLPFile_003";
      console.info(curTag, "start");

      try {
        // @ts-ignore
        dlpPermission.off('openDLPFile1', (dlpFileInfo) => {
        });
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0100
     * @tc.name Test dlpPermission.setSandboxAppConfig
     * @tc.desc test setSandboxAppConfig success promise.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_SECURITY_DLP_setSandboxAppConfig_0100', 0, async () => {
      var curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0100";
      console.info(curTag, "start");

      try {
        await dlpPermission.setSandboxAppConfig('configInfo');
      } catch (err) {
        expect(false).assertTrue();
      }
      expect(true).assertTrue();
      console.info(curTag, "end");
    })

    /**
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0200
     * @tc.name Test dlpPermission.setSandboxAppConfig
     * @tc.desc test setSandboxAppConfig invalid param.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_SECURITY_DLP_setSandboxAppConfig_0200', 0, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0200";
      console.info(curTag, "start");

      try {
        // @ts-ignore
        await dlpPermission.setSandboxAppConfig(111);
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0300
     * @tc.name Test dlpPermission.setSandboxAppConfig
     * @tc.desc test setSandboxAppConfig cannot be called by DLP sandbox application
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_SECURITY_DLP_setSandboxAppConfig_0300', 0, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0300";
      console.info(curTag, "start");
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SandboxConfigPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.method': 'set'
        }
      }
      let result;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number SUB_SECURITY_DLP_getSandboxAppConfig_0100
     * @tc.name Test dlpPermission.getSandboxAppConfig
     * @tc.desc test getSandboxAppConfig success promise.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_SECURITY_DLP_getSandboxAppConfig_0100', 0, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_getSandboxAppConfig_0100";
      console.info(curTag, "start");

      try {
        await dlpPermission.getSandboxAppConfig();
      } catch (err) {
        expect(false).assertTrue();
      }
      expect(true).assertTrue();
      console.info(curTag, "end");
    })

    /**
     * @tc.number SUB_SECURITY_DLP_cleanSandboxAppConfig_0100
     * @tc.name Test dlpPermission.cleanSandboxAppConfig
     * @tc.desc test cleanSandboxAppConfig success promise.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_SECURITY_DLP_cleanSandboxAppConfig_0100', 0, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_cleanSandboxAppConfig_0100";
      console.info(curTag, "start");

      try {
        await dlpPermission.cleanSandboxAppConfig();
      } catch (err) {
        expect(false).assertTrue();
        return;
      }
      expect(true).assertTrue();
      console.info(curTag, "end");
    })

    /**
     * @tc.number SUB_SECURITY_DLP_cleanSandboxAppConfig_0200
     * @tc.name Test dlpPermission.cleanSandboxAppConfig
     * @tc.desc test cleanSandboxAppConfig cannot be called by DLP sandbox application
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_SECURITY_DLP_cleanSandboxAppConfig_0200', 0, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_cleanSandboxAppConfig_0200";
      console.info(curTag, "start");
      var sandboxInfo = await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SandboxConfigPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.method': 'clean'
        }
      }
      let result;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.number SUB_SECURITY_DLP_startDLPManagerForResult_0100
     * @tc.name Test dlpPermission.startDLPManagerForResult
     * @tc.desc test startDLPManagerForResult cannot be called by DLP sandbox application
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_SECURITY_DLP_startDLPManagerForResult_0100', 0, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_startDLPManagerForResult_0100";
      console.info(curTag, "SUB_SECURITY_DLP_startDLPManagerForResult_0100 start");
      try {
        let context = globalThis.context; // 获取当前UIAbilityContext
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

  })
}
