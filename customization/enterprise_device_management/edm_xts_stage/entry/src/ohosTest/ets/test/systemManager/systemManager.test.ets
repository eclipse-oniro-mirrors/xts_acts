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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT, UPDATE_VERSION, INVALID_UPDATE_VERSION, DEFAULT_USER_ID } from '../commom';
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
    testGetUpdateAuthData();
    testSetAutoUnlockAfterReboot();
    testGetAutoUnlockAfterReboot();
    testGetDisallowedNearLinkProtocols();
    testAddDisallowedNearLinkProtocols();
    testRemoveDisallowedNearLinkProtocols();
    testSetInstallLocalEnterpriseAppEnabled();
    testGetInstallLocalEnterpriseAppEnabled();
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

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0010
   * @tc.name      : test_set_ota_update_policy_0010
   * @tc.desc      : test systemManager setOtaUpdatePolicy with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ota_update_policy_0010", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.DEFAULT,
      "version": UPDATE_VERSION,
      "disableSystemOtaUpdate": true
    }

    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      let getPolicy: systemManager.OtaUpdatePolicy = systemManager.getOtaUpdatePolicy(SELFWANT);
      expect(getPolicy.disableSystemOtaUpdate).assertTrue();
      policy.disableSystemOtaUpdate = false;
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      let getPolicy2: systemManager.OtaUpdatePolicy = systemManager.getOtaUpdatePolicy(SELFWANT);
      expect(getPolicy2.disableSystemOtaUpdate).assertFalse();
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
   * @tc.name      : test_get_ota_update_policy_0001
   * @tc.desc      : test systemManager getOtaUpdatePolicy without admin
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
   * @tc.desc      : test systemManager getOtaUpdatePolicy with normal admin
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

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_OTA_UPDATE_POLICY_JS_0003
   * @tc.name      : test_get_ota_update_policy_0003
   * @tc.desc      : test systemManager getOtaUpdatePolicy with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ota_update_policy_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.getOtaUpdatePolicy(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
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
      "fd": -1,
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

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_NOTIFY_UPDATE_PACKAGES_JS_0002
   * @tc.name      : test_notify_update_packages_0002
   * @tc.desc      : test systemManager notifyUpdatePackages without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_notify_update_packages_0004", Level.LEVEL2, async (done: Function) => {
    let updatePaskageInfo: Array<systemManager.Package> = [{
      "type": systemManager.PackageType.FIRMWARE,
      "path": "path"
    }]
    let updatePackageInfo: systemManager.UpdatePackageInfo = {
      "version" : UPDATE_VERSION,
      "packages" : updatePaskageInfo,
    };
    try {
      await systemManager.notifyUpdatePackages(INVALID_WANT, updatePackageInfo).then(()=>{
        expect(false).assertTrue();
      })
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_NOTIFY_UPDATE_PACKAGES_JS_0005
   * @tc.name      : test_notify_update_packages_0005
   * @tc.desc      : test systemManager notifyUpdatePackages with invalid authinfo
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_notify_update_packages_0005", Level.LEVEL2, async (done: Function) => {
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
      "authInfo" : "invalid authinfo",
    };
    await systemManager.notifyUpdatePackages(SELFWANT, updatePackageInfo).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      expect(error.code == 9201004).assertTrue();
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

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0002
   * @tc.name      : test_get_update_result_0002
   * @tc.desc      : test systemManager getOtaUpdatePolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_update_result_0004", Level.LEVEL2, async (done: Function) => {
    try {
      await systemManager.getUpdateResult(INVALID_WANT, UPDATE_VERSION).then((data: systemManager.UpdateResult) => {
        expect(false).assertTrue();
      })
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });
}

function testGetUpdateAuthData() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0001
   * @tc.name      : test_get_update_auth_data_0001
   * @tc.desc      : test systemManager getUpdateAuthData without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_update_auth_data_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let authData: string = await systemManager.getUpdateAuthData(SELFWANT);
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0002
   * @tc.name      : test_get_update_auth_data_0002
   * @tc.desc      : test systemManager getUpdateAuthData without invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_update_auth_data_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let authData: string = await systemManager.getUpdateAuthData(INVALID_WANT);
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0003
   * @tc.name      : test_get_update_auth_data_0003
   * @tc.desc      : test systemManager getUpdateAuthData with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_update_auth_data_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let authData: string = await systemManager.getUpdateAuthData(SELFWANT);
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0003
   * @tc.name      : test_get_update_auth_data_0004
   * @tc.desc      : test systemManager getUpdateAuthData success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_update_auth_data_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let authData: string = await systemManager.getUpdateAuthData(SELFWANT);
      expect(authData).not().assertNull();
      expect(authData.length).not().assertEqual(0);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetAutoUnlockAfterReboot() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0001
   * @tc.name      : test_set_auto_unlock_after_reboot_0001
   * @tc.desc      : test systemManager setAutoUnlockAfterReboot without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_auto_unlock_after_reboot_0001", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setAutoUnlockAfterReboot(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0002
   * @tc.name      : test_set_auto_unlock_after_reboot_0002
   * @tc.desc      : test systemManager setAutoUnlockAfterReboot with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_auto_unlock_after_reboot_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.setAutoUnlockAfterReboot(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0003
   * @tc.name      : test_set_auto_unlock_after_reboot_0003
   * @tc.desc      : test systemManager setAutoUnlockAfterReboot true
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_auto_unlock_after_reboot_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let errorCode: number = 0;
    try {
      systemManager.setAutoUnlockAfterReboot(SELFWANT, true);
      let rel: boolean = systemManager.getAutoUnlockAfterReboot(SELFWANT)
      expect(rel).assertTrue();
    } catch (error) {
      errorCode = error.code;
      expect(error.code == 801).assertTrue();
    } finally {
      if (errorCode == 0){
        systemManager.setAutoUnlockAfterReboot(SELFWANT, false);
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
  
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0004
   * @tc.name      : test_set_auto_unlock_after_reboot_0004
   * @tc.desc      : test systemManager setAutoUnlockAfterReboot false
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_auto_unlock_after_reboot_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setAutoUnlockAfterReboot(SELFWANT, false);
      let rel: boolean = systemManager.getAutoUnlockAfterReboot(SELFWANT)
      expect(rel).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0005
   * @tc.name      : test_set_auto_unlock_after_reboot_0005
   * @tc.desc      : test systemManager setAutoUnlockAfterReboot with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_auto_unlock_after_reboot_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setAutoUnlockAfterReboot(INVALID_WANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetAutoUnlockAfterReboot() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_AUTO_UNLOCK_AFTER_REBOOT_JS_0001
   * @tc.name      : test_get_auto_unlock_after_reboot_0001
   * @tc.desc      : test systemManager getAutoUnlockAfterReboot without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_auto_unlock_after_reboot_0001", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.getAutoUnlockAfterReboot(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_AUTO_UNLOCK_AFTER_REBOOT_JS_0002
   * @tc.name      : test_get_auto_unlock_after_reboot_0002
   * @tc.desc      : test systemManager getAutoUnlockAfterReboot with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_auto_unlock_after_reboot_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.getAutoUnlockAfterReboot(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_AUTO_UNLOCK_AFTER_REBOOT_JS_0003
   * @tc.name      : test_get_auto_unlock_after_reboot_0003
   * @tc.desc      : test systemManager getAutoUnlockAfterReboot with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_auto_unlock_after_reboot_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.getAutoUnlockAfterReboot(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetDisallowedNearLinkProtocols() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0001
   * @tc.name      : test_get_disallowed_near_link_protocols_0001
   * @tc.desc      : test systemManager getDisallowedNearLinkProtocols without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_get_disallowed_near_link_protocols_0001', Level.LEVEL2, async (done: Function) => {
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(SELFWANT,
        DEFAULT_USER_ID);
    } catch (error) {
      expect(error.code == 801 || error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0002
   * @tc.name      : test_get_disallowed_near_link_protocols_0002
   * @tc.desc      : test systemManager getDisallowedNearLinkProtocols without invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_get_disallowed_near_link_protocols_0002', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(
        INVALID_WANT, DEFAULT_USER_ID);
    } catch (error) {
      expect(error.code == 801 || error.code == 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0003
   * @tc.name      : test_get_disallowed_near_link_protocols_0003
   * @tc.desc      : test systemManager getDisallowedNearLinkProtocols with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_get_disallowed_near_link_protocols_0003', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(SELFWANT,
        DEFAULT_USER_ID);
    } catch (error) {
      expect(error.code == 801 || error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0004
   * @tc.name      : test_get_disallowed_near_link_protocols_0004
   * @tc.desc      : test systemManager getDisallowedNearLinkProtocols success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_get_disallowed_near_link_protocols_0004', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(SELFWANT,
        DEFAULT_USER_ID);
      expect(protocols).not().assertNull();
      expect(protocols.length).assertEqual(0);
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddDisallowedNearLinkProtocols() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0001
   * @tc.name      : test_add_disallowed_nearlink_protocols_0001
   * @tc.desc      : test systemManager addDisallowedNearLinkProtocols without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_add_disallowed_nearlink_protocols_0001', Level.LEVEL2, async (done: Function) => {
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0002
   * @tc.name      : test_add_disallowed_nearlink_protocols_0002
   * @tc.desc      : test systemManager addDisallowedNearLinkProtocols with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_add_disallowed_nearlink_protocols_0002', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0003
   * @tc.name      : test_add_disallowed_nearlink_protocols_0003
   * @tc.desc      : test systemManager addDisallowedNearLinkProtocols with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_add_disallowed_nearlink_protocols_0003', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
      let protocols: Array<systemManager.NearLinkProtocol> =
        systemManager.getDisallowedNearLinkProtocols(SELFWANT, DEFAULT_USER_ID);
      expect(protocols.length == nearlinkProtocols.length).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });


  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0004
   * @tc.name      : test_add_disallowed_nearlink_protocols_0004
   * @tc.desc      : test systemManager addDisallowedNearLinkProtocols with empty param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_add_disallowed_nearlink_protocols_0004', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      expect(error.code == 801 || error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0005
   * @tc.name      : test_add_disallowed_nearlink_protocols_0005
   * @tc.desc      : test systemManager addDisallowedNearLinkProtocols with over length param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_add_disallowed_nearlink_protocols_0005', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      expect(error.code == 801 || error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testRemoveDisallowedNearLinkProtocols() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0001
   * @tc.name      : test_remove_disallowed_nearlink_protocols_0001
   * @tc.desc      : test systemManager removeDisallowedNearLinkProtocols without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_remove_disallowed_nearlink_protocols_0001', Level.LEVEL2, async (done: Function) => {
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0002
   * @tc.name      : test_remove_disallowed_nearlink_protocols_0002
   * @tc.desc      : test systemManager removeDisallowedNearLinkProtocols with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_remove_disallowed_nearlink_protocols_0002', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0003
   * @tc.name      : test_remove_disallowed_nearlink_protocols_0003
   * @tc.desc      : test systemManager removeDisallowedNearLinkProtocols with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_remove_disallowed_nearlink_protocols_0003', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
      let protocols: Array<systemManager.NearLinkProtocol> =
        systemManager.getDisallowedNearLinkProtocols(SELFWANT, DEFAULT_USER_ID);
      expect(protocols.length == 0).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0004
   * @tc.name      : test_remove_disallowed_nearlink_protocols_0004
   * @tc.desc      : test systemManager removeDisallowedNearLinkProtocols with empty param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_remove_disallowed_nearlink_protocols_0004', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      expect(error.code == 801 || error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0005
   * @tc.name      : test_remove_disallowed_nearlink_protocols_0005
   * @tc.desc      : test systemManager removeDisallowedNearLinkProtocols with over length param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it('test_remove_disallowed_nearlink_protocols_0005', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      expect(error.code == 801 || error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetInstallLocalEnterpriseAppEnabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_001
   * @tc.name      : test_set_install_local_enterprise_app_enabled_001
   * @tc.desc      : test systemManager setInstallLocalEnterpriseAppEnabled without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_install_local_enterprise_app_enabled_001", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setInstallLocalEnterpriseAppEnabled(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_002
   * @tc.name      : test_set_install_local_enterprise_app_enabled_002
   * @tc.desc      : test systemManager setInstallLocalEnterpriseAppEnabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_install_local_enterprise_app_enabled_002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabled(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_003
   * @tc.name      : test_set_install_local_enterprise_app_enabled_003
   * @tc.desc      : test systemManager setInstallLocalEnterpriseAppEnabled with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_install_local_enterprise_app_enabled_003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabled(INVALID_WANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_004
   * @tc.name      : test_set_install_local_enterprise_app_enabled_004
   * @tc.desc      : test systemManager setInstallLocalEnterpriseAppEnabled
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_install_local_enterprise_app_enabled_004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let value: boolean = true;
      systemManager.setInstallLocalEnterpriseAppEnabled(SELFWANT, value);
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabled(SELFWANT);
      expect(result === value).assertTrue();

      value = false;
      systemManager.setInstallLocalEnterpriseAppEnabled(SELFWANT, value);
      result = systemManager.getInstallLocalEnterpriseAppEnabled(SELFWANT);
      expect(result === value).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetInstallLocalEnterpriseAppEnabled() {
   /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_0001
   * @tc.name      : test_is_install_local_enterprise_app_enable_0001
   * @tc.desc      : test systemManager getInstallLocalEnterpriseAppEnabled without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_install_local_enterprise_app_enable_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let isDisallow: boolean = await systemManager.getInstallLocalEnterpriseAppEnabled(SELFWANT);
    } catch (error) {
      expect(error.code == 801 || error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_0002
   * @tc.name      : test_is_install_local_enterprise_app_enable_0002
   * @tc.desc      : test systemManager getInstallLocalEnterpriseAppEnabled without invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_install_local_enterprise_app_enable_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let isDisallow: boolean = await systemManager.getInstallLocalEnterpriseAppEnabled(INVALID_WANT);
    } catch (error) {
      expect(error.code == 801 || error.code == 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_0003
   * @tc.name      : test_is_install_local_enterprise_app_enable_0003
   * @tc.desc      : test systemManager getInstallLocalEnterpriseAppEnabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_install_local_enterprise_app_enable_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let isDisallow: boolean = await systemManager.getInstallLocalEnterpriseAppEnabled(SELFWANT);
    } catch (error) {
      expect(error.code == 801 || error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_0004
   * @tc.name      : test_is_install_local_enterprise_app_enable_0004
   * @tc.desc      : test systemManager getInstallLocalEnterpriseAppEnabled success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_install_local_enterprise_app_enable_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let isDisallow: boolean = await systemManager.getInstallLocalEnterpriseAppEnabled(SELFWANT);
      expect(isDisallow).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}