/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT, UPDATE_VERSION, INVALID_UPDATE_VERSION } from '../commom';
import { BusinessError } from '@ohos.base';

import adminManager from '@ohos.enterprise.adminManager';
import systemManager from '@ohos.enterprise.systemManager';

export default function systemManagerTest() {
  describe('systemManager_test', () => {
    testSetNTPSever();
    testGetNTPSever();
    testSetOtaUpdatePolicy();
    testGetOtaUpdatePolicy();
    testNotifyUpdatePackages();
    testGetUpdateResult();
  })
}

function testSetNTPSever() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0100
   * @tc.name      : test_set_ntp_sever_0100
   * @tc.desc      : test systemManager setNTPServer without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ntp_sever_0100", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setNTPServer(SELFWANT, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0101
   * @tc.name      : test_set_ntp_sever_0101
   * @tc.desc      : test systemManager setNTPServer with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ntp_sever_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.setNTPServer(SELFWANT, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0102
   * @tc.name      : test_set_ntp_sever_0102
   * @tc.desc      : test systemManager setNTPServer with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ntp_sever_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setNTPServer(INVALID_WANT, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0103
   * @tc.name      : test_set_ntp_sever_0103
   * @tc.desc      : test systemManager setNTPServer with invalid server
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ntp_sever_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setNTPServer(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0104
   * @tc.name      : test_set_ntp_sever_0104
   * @tc.desc      : test systemManager setNTPServer
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ntp_sever_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let value: string = 'aliyun.com';
      systemManager.setNTPServer(SELFWANT, value);
      let result: string = systemManager.getNTPServer(SELFWANT);
      expect(result === value).assertTrue();

      value = '';
      systemManager.setNTPServer(SELFWANT, value);
      result = systemManager.getNTPServer(SELFWANT);
      expect(result === value).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetNTPSever() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_NTP_SERVER_JS_0100
   * @tc.name      : test_get_ntp_sever_0100
   * @tc.desc      : test systemManager getNTPServer without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ntp_sever_0100", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.getNTPServer(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_NTP_SERVER_JS_0101
   * @tc.name      : test_get_ntp_sever_0101
   * @tc.desc      : test systemManager getNTPServer with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ntp_sever_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.getNTPServer(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_NTP_SERVER_JS_0102
   * @tc.name      : test_get_ntp_sever_0102
   * @tc.desc      : test systemManager getNTPServer with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ntp_sever_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.getNTPServer(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetOtaUpdatePolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0001
   * @tc.name      : test_set_ota_update_policy_0001
   * @tc.desc      : test systemManager setOtaUpdatePolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ota_update_policy_0001", Level.LEVEL2, async (done: Function) => {
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.DEFAULT,
      "version": UPDATE_VERSION,
    }
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0002
   * @tc.name      : test_set_ota_update_policy_0002
   * @tc.desc      : test systemManager setOtaUpdatePolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ota_update_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.PROHIBIT,
      "version": UPDATE_VERSION,
    }
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0003
   * @tc.name      : test_set_ota_update_policy_0003
   * @tc.desc      : test systemManager setOtaUpdatePolicy with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ota_update_policy_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.UPDATE_TO_SPECIFIC_VERSION,
      "version": UPDATE_VERSION,
      "latestUpdateTime": 110000000,
    }
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      let getPolicy: systemManager.OtaUpdatePolicy = systemManager.getOtaUpdatePolicy(SELFWANT);
      expect(getPolicy.policyType == systemManager.PolicyType.UPDATE_TO_SPECIFIC_VERSION).assertTrue();
      expect(getPolicy.version == policy.version).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0004
   * @tc.name      : test_set_ota_update_policy_0004
   * @tc.desc      : test systemManager setOtaUpdatePolicy with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ota_update_policy_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.UPDATE_TO_SPECIFIC_VERSION,
      "version": INVALID_UPDATE_VERSION,
    }
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(true).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0005
   * @tc.name      : test_set_ota_update_policy_0005
   * @tc.desc      : test systemManager setOtaUpdatePolicy with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ota_update_policy_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.WINDOWS,
      "version": UPDATE_VERSION,
    }
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0006
   * @tc.name      : test_set_ota_update_policy_0006
   * @tc.desc      : test systemManager setOtaUpdatePolicy with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ota_update_policy_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.WINDOWS,
      "version": UPDATE_VERSION,
      "installStartTime": 110000000,
      "installEndTime": 110000001, 
    }
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(true).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0007
   * @tc.name      : test_set_ota_update_policy_0007
   * @tc.desc      : test systemManager setOtaUpdatePolicy with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ota_update_policy_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.POSTPONE,
      "version": UPDATE_VERSION,
    }
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0008
   * @tc.name      : test_set_ota_update_policy_0008
   * @tc.desc      : test systemManager setOtaUpdatePolicy with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ota_update_policy_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.POSTPONE,
      "version": UPDATE_VERSION,
      "delayUpdateTime": 110000000, 
    }
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(true).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0009
   * @tc.name      : test_set_ota_update_policy_0009
   * @tc.desc      : test systemManager setOtaUpdatePolicy with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ota_update_policy_0009", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.DEFAULT,
      "version": UPDATE_VERSION,
    }
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      let getPolicy: systemManager.OtaUpdatePolicy = systemManager.getOtaUpdatePolicy(SELFWANT);
      expect(getPolicy.policyType == systemManager.PolicyType.DEFAULT).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetOtaUpdatePolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_OTA_UPDATE_POLICY_JS_0001
   * @tc.name      : test_set_ota_update_policy_0001
   * @tc.desc      : test systemManager setOtaUpdatePolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ota_update_policy_0001", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.getOtaUpdatePolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_OTA_UPDATE_POLICY_JS_0002
   * @tc.name      : test_get_ota_update_policy_0002
   * @tc.desc      : test systemManager setOtaUpdatePolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ota_update_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.getOtaUpdatePolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testNotifyUpdatePackages() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_NOTIFY_UPDATE_PACKAGES_JS_0001
   * @tc.name      : test_notify_update_packages_0001
   * @tc.desc      : test systemManager notifyUpdatePackages without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_notify_update_packages_0001", Level.LEVEL2, async (done: Function) => {
    let updatePaskageInfo: Array<systemManager.Package> = [{
      "type": systemManager.PackageType.FIRMWARE,
      "path": "path",
      "fd": 60,
    }]
    let updatePackageInfo: systemManager.UpdatePackageInfo = {
      "version" : UPDATE_VERSION,
      "packages" : updatePaskageInfo,
    };
    await systemManager.notifyUpdatePackages(SELFWANT, updatePackageInfo).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      expect(error.code == 9200001).assertTrue();
    });
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_NOTIFY_UPDATE_PACKAGES_JS_0002
   * @tc.name      : test_notify_update_packages_0002
   * @tc.desc      : test systemManager notifyUpdatePackages without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_notify_update_packages_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    let updatePaskageInfo: Array<systemManager.Package> = [{
      "type": systemManager.PackageType.FIRMWARE,
      "path": "path"
    }]
    let updatePackageInfo: systemManager.UpdatePackageInfo = {
      "version" : UPDATE_VERSION,
      "packages" : updatePaskageInfo,
    };
    await systemManager.notifyUpdatePackages(SELFWANT, updatePackageInfo).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      expect(error.code == 9200002).assertTrue();
    });
    await adminManager.disableAdmin(SELFWANT);
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_NOTIFY_UPDATE_PACKAGES_JS_0003
   * @tc.name      : test_notify_update_packages_0003
   * @tc.desc      : test systemManager notifyUpdatePackages without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_notify_update_packages_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let notify: systemManager.NotifyDescription = {
      "installTips": "installTips",
      "installTipsDetail": "installTips detail"
    }
    let description: systemManager.PackageDescription = {
      "notify": notify,
    }
    let updatePaskageInfo: Array<systemManager.Package> = [{
      "type": systemManager.PackageType.FIRMWARE,
      "path": "path"
    }]
    let updatePackageInfo: systemManager.UpdatePackageInfo = {
      "version" : UPDATE_VERSION,
      "packages" : updatePaskageInfo,
      "description" : description,
    };
    await systemManager.notifyUpdatePackages(SELFWANT, updatePackageInfo).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      expect(error.code == 9201004 || error.code == 801).assertTrue();
    }).finally(async () => {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    });
    done();
  });
}

function testGetUpdateResult() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0001
   * @tc.name      : test_get_update_result_0001
   * @tc.desc      : test systemManager getOtaUpdatePolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_update_result_0001", Level.LEVEL2, async (done: Function) => {
    await systemManager.getUpdateResult(SELFWANT, UPDATE_VERSION).then((data: systemManager.UpdateResult) => {
      expect(false).assertTrue();
    }).catch((error: BusinessError) => {
      expect(error.code == 9200001).assertTrue();
    });
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0002
   * @tc.name      : test_get_update_result_0002
   * @tc.desc      : test systemManager getOtaUpdatePolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_update_result_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    await systemManager.getUpdateResult(SELFWANT, UPDATE_VERSION).then((data: systemManager.UpdateResult) => {
      expect(false).assertTrue();
    }).catch((error: BusinessError) => {
      expect(error.code == 9200002).assertTrue();
    });
    await adminManager.disableAdmin(SELFWANT);
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0003
   * @tc.name      : test_get_update_result_0003
   * @tc.desc      : test systemManager getOtaUpdatePolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_update_result_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    await systemManager.getUpdateResult(SELFWANT, UPDATE_VERSION).then((data: systemManager.UpdateResult) => {
      expect(data != null).assertTrue();
      expect(data.status == systemManager.UpdateStatus.NO_UPDATE_PACKAGE ||
        data.status == systemManager.UpdateStatus.UPDATE_WAITING ||
        data.status == systemManager.UpdateStatus.UPDATING ||
        data.status == systemManager.UpdateStatus.UPDATE_FAILURE ||
        data.status == systemManager.UpdateStatus.UPDATE_SUCCESS).assertTrue();
      console.log(`get update result success. version: ${data.version}, status: ${data.status},
        errorCode: ${data.errorInfo.code}, errorMsg: ${data.errorInfo.message}`)
    }).catch((error: BusinessError) => {
      expect(error.code == 801).assertTrue();
    }).finally(async () => {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    });
    done();
  });
}