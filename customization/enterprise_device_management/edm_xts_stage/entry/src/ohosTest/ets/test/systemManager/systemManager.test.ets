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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT, UPDATE_VERSION, INVALID_UPDATE_VERSION, DEFAULT_USER_ID, INVALID_USER_ID } from '../commom';
import { BusinessError } from '@ohos.base';

import adminManager from '@ohos.enterprise.adminManager';
import systemManager from '@ohos.enterprise.systemManager';
import systemParameterEnhance from "@ohos.systemParameterEnhance";

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
    testAddKeyEventPolicies();
    testRemoveKeyEventPolicies();
    testGetKeyEventPolicies();
    testStartCollectLog();
    testFinishLogCollected();
    testSetActivationLockDisabled();
    testIsActivationLockDisabled();
    testSetInstallLocalEnterpriseAppEnabledForAccount();
    testGetInstallLocalEnterpriseAppEnabledForAccount();
  })
}

function testSetNTPSever() {
  /**
   * @tc.name   test_set_ntp_sever_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0100
   * @tc.desc   test systemManager setNTPServer without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_ntp_sever_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0101
   * @tc.desc   test systemManager setNTPServer with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ntp_sever_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_set_ntp_sever_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0102
   * @tc.desc   test systemManager setNTPServer with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ntp_sever_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setNTPServer(INVALID_WANT, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_ntp_sever_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0103
   * @tc.desc   test systemManager setNTPServer with invalid server
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ntp_sever_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setNTPServer(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_ntp_sever_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0104
   * @tc.desc   test systemManager setNTPServer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_ntp_sever_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_NTP_SERVER_JS_0100
   * @tc.desc   test systemManager getNTPServer without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_ntp_sever_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_NTP_SERVER_JS_0101
   * @tc.desc   test systemManager getNTPServer with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_ntp_sever_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_get_ntp_sever_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_NTP_SERVER_JS_0102
   * @tc.desc   test systemManager getNTPServer with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_ntp_sever_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.getNTPServer(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetOtaUpdatePolicy() {
  /**
   * @tc.name   test_set_ota_update_policy_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0001
   * @tc.desc   test systemManager setOtaUpdatePolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_ota_update_policy_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0002
   * @tc.desc   test systemManager setOtaUpdatePolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ota_update_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_set_ota_update_policy_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0003
   * @tc.desc   test systemManager setOtaUpdatePolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_ota_update_policy_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0004
   * @tc.desc   test systemManager setOtaUpdatePolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ota_update_policy_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.UPDATE_TO_SPECIFIC_VERSION,
      "version": INVALID_UPDATE_VERSION,
    }
    try {
      let ret = systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(ret == null).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_ota_update_policy_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0005
   * @tc.desc   test systemManager setOtaUpdatePolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_ota_update_policy_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0006
   * @tc.desc   test systemManager setOtaUpdatePolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
      let ret = systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(ret == null).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_ota_update_policy_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0007
   * @tc.desc   test systemManager setOtaUpdatePolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ota_update_policy_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.POSTPONE,
      "version": "",
    }
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_ota_update_policy_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0008
   * @tc.desc   test systemManager setOtaUpdatePolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ota_update_policy_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.POSTPONE,
      "version": UPDATE_VERSION,
      "delayUpdateTime": 110000000, 
    }
    try {
      let ret = systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(ret == null).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_ota_update_policy_0009
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0009
   * @tc.desc   test systemManager setOtaUpdatePolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_ota_update_policy_0010
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0010
   * @tc.desc   test systemManager setOtaUpdatePolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_ota_update_policy_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_OTA_UPDATE_POLICY_JS_0001
   * @tc.desc   test systemManager getOtaUpdatePolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_ota_update_policy_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_OTA_UPDATE_POLICY_JS_0002
   * @tc.desc   test systemManager getOtaUpdatePolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_ota_update_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_get_ota_update_policy_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_OTA_UPDATE_POLICY_JS_0003
   * @tc.desc   test systemManager getOtaUpdatePolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_ota_update_policy_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.getOtaUpdatePolicy(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testNotifyUpdatePackages() {
  /**
   * @tc.name   test_notify_update_packages_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_NOTIFY_UPDATE_PACKAGES_JS_0001
   * @tc.desc   test systemManager notifyUpdatePackages without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_notify_update_packages_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_NOTIFY_UPDATE_PACKAGES_JS_0002
   * @tc.desc   test systemManager notifyUpdatePackages without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_notify_update_packages_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_notify_update_packages_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_NOTIFY_UPDATE_PACKAGES_JS_0003
   * @tc.desc   test systemManager notifyUpdatePackages without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9201004).assertTrue();
      }
    }).finally(async () => {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    });
    done();
  });

  /**
   * @tc.name   test_notify_update_packages_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_NOTIFY_UPDATE_PACKAGES_JS_0002
   * @tc.desc   test systemManager notifyUpdatePackages without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_notify_update_packages_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_NOTIFY_UPDATE_PACKAGES_JS_0005
   * @tc.desc   test systemManager notifyUpdatePackages with invalid authinfo
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9201004).assertTrue();
      }
    }).finally(async () => {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    });
    done();
  });
}

function testGetUpdateResult() {
  /**
   * @tc.name   test_get_update_result_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0001
   * @tc.desc   test systemManager getOtaUpdatePolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_update_result_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0002
   * @tc.desc   test systemManager getOtaUpdatePolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_update_result_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    await systemManager.getUpdateResult(SELFWANT, UPDATE_VERSION).then((data: systemManager.UpdateResult) => {
      expect(false).assertTrue();
    }).catch((error: BusinessError) => {
      expect(error.code == 9200002).assertTrue();
    });
    await adminManager.disableAdmin(SELFWANT);
    done();
  });

  /**
   * @tc.name   test_get_update_result_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0003
   * @tc.desc   test systemManager getOtaUpdatePolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_update_result_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    await systemManager.getUpdateResult(SELFWANT, UPDATE_VERSION).then((data: systemManager.UpdateResult) => {
      expect(data != null).assertTrue();
      if (data.status === systemManager.UpdateStatus.NO_UPDATE_PACKAGE) {
        expect(data.status == systemManager.UpdateStatus.NO_UPDATE_PACKAGE).assertTrue();
      } else if (data.status === systemManager.UpdateStatus.UPDATE_WAITING) {
        expect(data.status == systemManager.UpdateStatus.UPDATE_WAITING).assertTrue();
      } else if (data.status === systemManager.UpdateStatus.UPDATING) {
        expect(data.status == systemManager.UpdateStatus.UPDATING).assertTrue();
      } else if (data.status === systemManager.UpdateStatus.UPDATE_FAILURE) {
        expect(data.status == systemManager.UpdateStatus.UPDATE_FAILURE).assertTrue();
      } else if (data.status === systemManager.UpdateStatus.UPDATE_SUCCESS) {
        expect(data.status == systemManager.UpdateStatus.UPDATE_SUCCESS).assertTrue();
      }
      expect(data.version != null).assertTrue();
      if (data.errorInfo) {
        expect(data.errorInfo.code != null).assertTrue();
        expect(data.errorInfo.message != null).assertTrue();
      }
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
   * @tc.name   test_get_update_result_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0002
   * @tc.desc   test systemManager getOtaUpdatePolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_update_result_0004", Level.LEVEL2, async (done: Function) => {
    try {
      await systemManager.getUpdateResult(INVALID_WANT, UPDATE_VERSION).then((data: systemManager.UpdateResult) => {
        expect(false).assertTrue();
      })
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_update_result_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0005
   * @tc.desc   test systemManager getOtaUpdatePolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_update_result_0005", Level.LEVEL2, async (done: Function) => {
    try {
      await systemManager.getUpdateResult(SELFWANT, undefined).then((data: systemManager.UpdateResult) => {
        expect(false).assertTrue();
      })
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_update_result_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0006
   * @tc.desc   test systemManager getOtaUpdatePolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_update_result_0006", Level.LEVEL2, async (done: Function) => {
    try {
      await systemManager.getUpdateResult(SELFWANT, "").then((data: systemManager.UpdateResult) => {
        expect(false).assertTrue();
      })
    } catch (error) {
      expect(Number(error.code) === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_update_result_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0007
   * @tc.desc   test systemManager getOtaUpdatePolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_update_result_0007", Level.LEVEL2, async (done: Function) => {
    try {
      await systemManager.getUpdateResult(INVALID_WANT, null).then((data: systemManager.UpdateResult) => {
        expect(false).assertTrue();
      })
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
  });
}

function testGetUpdateAuthData() {
  /**
   * @tc.name   test_get_update_auth_data_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0001
   * @tc.desc   test systemManager getUpdateAuthData without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_update_auth_data_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0002
   * @tc.desc   test systemManager getUpdateAuthData without invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_update_auth_data_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let authData: string = await systemManager.getUpdateAuthData(INVALID_WANT);
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_update_auth_data_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0003
   * @tc.desc   test systemManager getUpdateAuthData with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_update_auth_data_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_get_update_auth_data_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0003
   * @tc.desc   test systemManager getUpdateAuthData success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_update_auth_data_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let authData: string = await systemManager.getUpdateAuthData(SELFWANT);
      expect(authData).not().assertNull();
      expect(authData.length).not().assertEqual(0);
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetAutoUnlockAfterReboot() {
  /**
   * @tc.name   test_set_auto_unlock_after_reboot_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0001
   * @tc.desc   test systemManager setAutoUnlockAfterReboot without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_auto_unlock_after_reboot_0001", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setAutoUnlockAfterReboot(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_auto_unlock_after_reboot_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0002
   * @tc.desc   test systemManager setAutoUnlockAfterReboot with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_auto_unlock_after_reboot_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.setAutoUnlockAfterReboot(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_auto_unlock_after_reboot_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0003
   * @tc.desc   test systemManager setAutoUnlockAfterReboot true
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_auto_unlock_after_reboot_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0004
   * @tc.desc   test systemManager setAutoUnlockAfterReboot false
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_auto_unlock_after_reboot_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0005
   * @tc.desc   test systemManager setAutoUnlockAfterReboot with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_auto_unlock_after_reboot_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setAutoUnlockAfterReboot(INVALID_WANT, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_auto_unlock_after_reboot_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0006
   * @tc.desc   test systemManager setAutoUnlockAfterReboot with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_auto_unlock_after_reboot_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setAutoUnlockAfterReboot(null, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_auto_unlock_after_reboot_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0007
   * @tc.desc   test systemManager setAutoUnlockAfterReboot with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_auto_unlock_after_reboot_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setAutoUnlockAfterReboot(undefined, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetAutoUnlockAfterReboot() {
  /**
   * @tc.name   test_get_auto_unlock_after_reboot_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_AUTO_UNLOCK_AFTER_REBOOT_JS_0001
   * @tc.desc   test systemManager getAutoUnlockAfterReboot without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_auto_unlock_after_reboot_0001", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.getAutoUnlockAfterReboot(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_auto_unlock_after_reboot_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_AUTO_UNLOCK_AFTER_REBOOT_JS_0002
   * @tc.desc   test systemManager getAutoUnlockAfterReboot with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_auto_unlock_after_reboot_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.getAutoUnlockAfterReboot(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_auto_unlock_after_reboot_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_AUTO_UNLOCK_AFTER_REBOOT_JS_0003
   * @tc.desc   test systemManager getAutoUnlockAfterReboot with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_auto_unlock_after_reboot_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.getAutoUnlockAfterReboot(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_auto_unlock_after_reboot_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_AUTO_UNLOCK_AFTER_REBOOT_JS_0004
   * @tc.desc   test systemManager getAutoUnlockAfterReboot with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_auto_unlock_after_reboot_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let ret = systemManager.getAutoUnlockAfterReboot(null);
      expect(ret).assertFalse();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(false).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_auto_unlock_after_reboot_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_AUTO_UNLOCK_AFTER_REBOOT_JS_0005
   * @tc.desc   test systemManager getAutoUnlockAfterReboot with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_auto_unlock_after_reboot_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.getAutoUnlockAfterReboot(undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetDisallowedNearLinkProtocols() {
  /**
   * @tc.name   test_get_disallowed_near_link_protocols_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0001
   * @tc.desc   test systemManager getDisallowedNearLinkProtocols without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_get_disallowed_near_link_protocols_0001', Level.LEVEL2, async (done: Function) => {
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(SELFWANT,
        DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_near_link_protocols_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0002
   * @tc.desc   test systemManager getDisallowedNearLinkProtocols without invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_get_disallowed_near_link_protocols_0002', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(
        INVALID_WANT, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_near_link_protocols_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0003
   * @tc.desc   test systemManager getDisallowedNearLinkProtocols with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_get_disallowed_near_link_protocols_0003', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(SELFWANT,
        DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_near_link_protocols_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0004
   * @tc.desc   test systemManager getDisallowedNearLinkProtocols success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_get_disallowed_near_link_protocols_0004', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(SELFWANT,
        DEFAULT_USER_ID);
      expect(protocols).not().assertNull();
      expect(protocols.length).assertEqual(0);
      let nearlinkProtocols: Array<number> = new Array();
      nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
      nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
      let protocols1: Array<systemManager.NearLinkProtocol> =
        systemManager.getDisallowedNearLinkProtocols(SELFWANT, DEFAULT_USER_ID);
      expect(protocols1.length > 0).assertTrue();
      expect(protocols1.length == nearlinkProtocols.length).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_near_link_protocols_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0005
   * @tc.desc   test systemManager getDisallowedNearLinkProtocols without invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_get_disallowed_near_link_protocols_0005', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(
        null, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_near_link_protocols_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0006
   * @tc.desc   test systemManager getDisallowedNearLinkProtocols without invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_get_disallowed_near_link_protocols_0006', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(
        undefined, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_near_link_protocols_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0007
   * @tc.desc   test systemManager getDisallowedNearLinkProtocols without invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_get_disallowed_near_link_protocols_0007', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(
        SELFWANT, null);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_near_link_protocols_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0008
   * @tc.desc   test systemManager getDisallowedNearLinkProtocols without invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_get_disallowed_near_link_protocols_0008', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let protocols: Array<systemManager.NearLinkProtocol> = systemManager.getDisallowedNearLinkProtocols(
        SELFWANT, undefined);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddDisallowedNearLinkProtocols() {
  /**
   * @tc.name   test_add_disallowed_nearlink_protocols_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0001
   * @tc.desc   test systemManager addDisallowedNearLinkProtocols without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_add_disallowed_nearlink_protocols_0001', Level.LEVEL2, async (done: Function) => {
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_nearlink_protocols_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0002
   * @tc.desc   test systemManager addDisallowedNearLinkProtocols with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_add_disallowed_nearlink_protocols_0002', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_nearlink_protocols_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0003
   * @tc.desc   test systemManager addDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_disallowed_nearlink_protocols_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0004
   * @tc.desc   test systemManager addDisallowedNearLinkProtocols with empty param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_add_disallowed_nearlink_protocols_0004', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_nearlink_protocols_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0005
   * @tc.desc   test systemManager addDisallowedNearLinkProtocols with over length param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_add_disallowed_nearlink_protocols_0005', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_nearlink_protocols_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0006
   * @tc.desc   test systemManager addDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_add_disallowed_nearlink_protocols_0006', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.addDisallowedNearLinkProtocols(null, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_nearlink_protocols_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0007
   * @tc.desc   test systemManager addDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_add_disallowed_nearlink_protocols_0007', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.addDisallowedNearLinkProtocols(undefined, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_nearlink_protocols_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0008
   * @tc.desc   test systemManager addDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_add_disallowed_nearlink_protocols_0008', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, null, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_nearlink_protocols_0009
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0009
   * @tc.desc   test systemManager addDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_add_disallowed_nearlink_protocols_0009', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, undefined, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_nearlink_protocols_0010
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0010
   * @tc.desc   test systemManager addDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_add_disallowed_nearlink_protocols_0010', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, null);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_nearlink_protocols_0011
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0011
   * @tc.desc   test systemManager addDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_add_disallowed_nearlink_protocols_0011', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, undefined);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testRemoveDisallowedNearLinkProtocols() {
  /**
   * @tc.name   test_remove_disallowed_nearlink_protocols_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0001
   * @tc.desc   test systemManager removeDisallowedNearLinkProtocols without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_remove_disallowed_nearlink_protocols_0001', Level.LEVEL2, async (done: Function) => {
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_nearlink_protocols_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0002
   * @tc.desc   test systemManager removeDisallowedNearLinkProtocols with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_remove_disallowed_nearlink_protocols_0002', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_nearlink_protocols_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0003
   * @tc.desc   test systemManager removeDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_remove_disallowed_nearlink_protocols_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0004
   * @tc.desc   test systemManager removeDisallowedNearLinkProtocols with empty param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_remove_disallowed_nearlink_protocols_0004', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_nearlink_protocols_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0005
   * @tc.desc   test systemManager removeDisallowedNearLinkProtocols with over length param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_remove_disallowed_nearlink_protocols_0005', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_nearlink_protocols_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0006
   * @tc.desc   test systemManager removeDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_remove_disallowed_nearlink_protocols_0006', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.removeDisallowedNearLinkProtocols(null, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_nearlink_protocols_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0007
   * @tc.desc   test systemManager removeDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_remove_disallowed_nearlink_protocols_0007', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.removeDisallowedNearLinkProtocols(undefined, nearlinkProtocols, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_nearlink_protocols_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0008
   * @tc.desc   test systemManager removeDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_remove_disallowed_nearlink_protocols_0008', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, null, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_nearlink_protocols_0009
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0009
   * @tc.desc   test systemManager removeDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_remove_disallowed_nearlink_protocols_0009', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, undefined, DEFAULT_USER_ID);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_nearlink_protocols_0010
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0010
   * @tc.desc   test systemManager removeDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_remove_disallowed_nearlink_protocols_0010', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, null);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_nearlink_protocols_0011
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0011
   * @tc.desc   test systemManager removeDisallowedNearLinkProtocols with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('test_remove_disallowed_nearlink_protocols_0011', Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nearlinkProtocols: Array<number> = new Array();
    nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
    nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
    try {
      systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, undefined);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetInstallLocalEnterpriseAppEnabled() {
  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_001
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabled without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_001", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setInstallLocalEnterpriseAppEnabled(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_002
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_002
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabled with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabled(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_003
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_003
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabled with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabled(INVALID_WANT, true);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_004
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_004
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabled
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabled(SELFWANT, true);
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabled(SELFWANT);
      expect(result).assertTrue();

      systemManager.setInstallLocalEnterpriseAppEnabled(SELFWANT, false);
      result = systemManager.getInstallLocalEnterpriseAppEnabled(SELFWANT);
      expect(result).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_005
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_005
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabled with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabled(null, true);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_006
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_006
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabled with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabled(undefined, true);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetInstallLocalEnterpriseAppEnabled() {
  /**
   * @tc.name   test_is_install_local_enterprise_app_enable_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_0001
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabled without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_is_install_local_enterprise_app_enable_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let isDisallow: boolean = await systemManager.getInstallLocalEnterpriseAppEnabled(SELFWANT);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_is_install_local_enterprise_app_enable_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_0002
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabled without invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_is_install_local_enterprise_app_enable_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let isDisallow: boolean = await systemManager.getInstallLocalEnterpriseAppEnabled(INVALID_WANT);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_is_install_local_enterprise_app_enable_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_0003
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabled with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_is_install_local_enterprise_app_enable_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let isDisallow: boolean = await systemManager.getInstallLocalEnterpriseAppEnabled(SELFWANT);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_is_install_local_enterprise_app_enable_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_0004
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabled success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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

  /**
   * @tc.name   test_is_install_local_enterprise_app_enable_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_JS_0005
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabled with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_is_install_local_enterprise_app_enable_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let isDisallow: boolean = await systemManager.getInstallLocalEnterpriseAppEnabled(null);
      expect(isDisallow).assertFalse();
    } catch (error) {
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddKeyEventPolicies() {
  /**
   * @tc.name   test_add_key_event_policies_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_KEY_EVENT_POLICIES_JS_0001
   * @tc.desc   test systemManager addKeyEventPolicies without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_key_event_policies_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let keyEventPolicies: Array<systemManager.KeyEventPolicy> = [
        {keyCode: systemManager.KeyCode.VOLUME_UP, keyPolicy: systemManager.KeyPolicy.CUSTOM},
        {keyCode: systemManager.KeyCode.POWER, keyPolicy: systemManager.KeyPolicy.CUSTOM}
      ]
      systemManager.addKeyEventPolicies(SELFWANT, keyEventPolicies);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_add_key_event_policies_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_KEY_EVENT_POLICIES_JS_0002
   * @tc.desc   test systemManager addKeyEventPolicies with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_key_event_policies_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let keyEventPolicies: Array<systemManager.KeyEventPolicy> = [
        {keyCode: systemManager.KeyCode.VOLUME_UP, keyPolicy: systemManager.KeyPolicy.CUSTOM},
        {keyCode: systemManager.KeyCode.POWER, keyPolicy: systemManager.KeyPolicy.CUSTOM}
      ]
      systemManager.addKeyEventPolicies(SELFWANT, keyEventPolicies);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_key_event_policies_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_KEY_EVENT_POLICIES_JS_0003
   * @tc.desc   test systemManager addKeyEventPolicies with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_key_event_policies_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let keyEventPolicies: Array<systemManager.KeyEventPolicy> = [
        {keyCode: systemManager.KeyCode.VOLUME_UP, keyPolicy: systemManager.KeyPolicy.CUSTOM},
        {keyCode: systemManager.KeyCode.POWER, keyPolicy: systemManager.KeyPolicy.CUSTOM}
      ]
      systemManager.addKeyEventPolicies(INVALID_WANT, keyEventPolicies);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_key_event_policies_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_KEY_EVENT_POLICIES_JS_0004
   * @tc.desc   test systemManager addKeyEventPolicies with parameter is incorrect
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_key_event_policies_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let keyEventPolicies: Array<systemManager.KeyEventPolicy> = [
        {keyCode: 10, keyPolicy: systemManager.KeyPolicy.CUSTOM},
      ]
      systemManager.addKeyEventPolicies(SELFWANT, keyEventPolicies);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_key_event_policies_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_KEY_EVENT_POLICIES_JS_0005
   * @tc.desc   test systemManager addKeyEventPolicies with parameter conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_key_event_policies_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let keyEventPolicies: Array<systemManager.KeyEventPolicy> = [
        {keyCode: systemManager.KeyCode.VOLUME_UP, keyPolicy: systemManager.KeyPolicy.INTERCEPTION},
        {keyCode: systemManager.KeyCode.VOLUME_UP, keyPolicy: systemManager.KeyPolicy.CUSTOM}
      ]
      systemManager.addKeyEventPolicies(SELFWANT, keyEventPolicies);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveKeyEventPolicies() {
  /**
   * @tc.name   test_remove_key_event_policies_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_KEY_EVENT_POLICIES_JS_0001
   * @tc.desc   test systemManager removeKeyEventPolicies without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_key_event_policies_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let keyCodes: Array<number> = [systemManager.KeyCode.VOLUME_UP]
      systemManager.removeKeyEventPolicies(SELFWANT, keyCodes);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_remove_key_event_policies_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_KEY_EVENT_POLICIES_JS_0002
   * @tc.desc   test systemManager removeKeyEventPolicies with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_key_event_policies_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let keyCodes: Array<number> = [systemManager.KeyCode.VOLUME_UP]
      systemManager.removeKeyEventPolicies(SELFWANT, keyCodes);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_key_event_policies_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_KEY_EVENT_POLICIES_JS_0003
   * @tc.desc   test systemManager removeKeyEventPolicies with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_key_event_policies_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let keyCodes: Array<number> = [systemManager.KeyCode.VOLUME_UP]
      systemManager.removeKeyEventPolicies(INVALID_WANT, keyCodes);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_key_event_policies_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_KEY_EVENT_POLICIES_JS_0004
   * @tc.desc   test systemManager removeKeyEventPolicies with parameter is incorrect
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_key_event_policies_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let keyCodes: Array<number> = [10]
      systemManager.removeKeyEventPolicies(SELFWANT, keyCodes);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetKeyEventPolicies() {
  /**
   * @tc.name   test_get_key_event_policies_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_KEY_EVENT_POLICIES_JS_0001
   * @tc.desc   test systemManager getKeyEventPolicies without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_key_event_policies_0001", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.getKeyEventPolicies(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_key_event_policies_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_KEY_EVENT_POLICIES_JS_0002
   * @tc.desc   test systemManager getKeyEventPolicies with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_key_event_policies_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.getKeyEventPolicies(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_key_event_policies_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_KEY_EVENT_POLICIES_JS_0003
   * @tc.desc   test systemManager getKeyEventPolicies with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_key_event_policies_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.getKeyEventPolicies(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_key_event_policies_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_KEY_EVENT_POLICIES_JS_0004
   * @tc.desc   test systemManager getKeyEventPolicies with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_key_event_policies_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let keyEventPolicies: Array<systemManager.KeyEventPolicy> = [
        {keyCode: systemManager.KeyCode.POWER, keyPolicy: systemManager.KeyPolicy.INTERCEPTION},
        {keyCode: systemManager.KeyCode.VOLUME_UP, keyPolicy: systemManager.KeyPolicy.CUSTOM}
      ]
      let keyInstances: Array<systemManager.KeyEventPolicy> = []
      let keyCodes: Array<number> = [systemManager.KeyCode.VOLUME_UP]
      let keyInstances0: Array<systemManager.KeyEventPolicy> = systemManager.getKeyEventPolicies(SELFWANT);
      expect(keyInstances0.length == 0).assertTrue();
      systemManager.addKeyEventPolicies(SELFWANT, keyEventPolicies);
      let keyInstances1: Array<systemManager.KeyEventPolicy> = systemManager.getKeyEventPolicies(SELFWANT);
      expect(keyInstances1.length == 2).assertTrue();
      systemManager.removeKeyEventPolicies(SELFWANT, keyCodes);
      let keyInstances2: Array<systemManager.KeyEventPolicy> = systemManager.getKeyEventPolicies(SELFWANT);
      expect(keyInstances2.length == 1).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_key_event_policies_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_KEY_EVENT_POLICIES_JS_0005
   * @tc.desc   test systemManager getKeyEventPolicies with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_key_event_policies_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let keyEventPolicies: Array<systemManager.KeyEventPolicy> = [
        {keyCode: systemManager.KeyCode.VOLUME_DOWN, keyPolicy: systemManager.KeyPolicy.INTERCEPTION},
        {keyCode: systemManager.KeyCode.BACK, keyPolicy: systemManager.KeyPolicy.CUSTOM}
      ]
      let keyInstances: Array<systemManager.KeyEventPolicy> = []
      let keyCodes: Array<number> = [systemManager.KeyCode.BACK, systemManager.KeyCode.VOLUME_DOWN]
      let keyInstances0: Array<systemManager.KeyEventPolicy> = systemManager.getKeyEventPolicies(SELFWANT);
      expect(keyInstances0.length == 0).assertTrue();
      systemManager.addKeyEventPolicies(SELFWANT, keyEventPolicies);
      let keyInstances1: Array<systemManager.KeyEventPolicy> = systemManager.getKeyEventPolicies(SELFWANT);
      expect(keyInstances1.length == 2).assertTrue();
      systemManager.removeKeyEventPolicies(SELFWANT, keyCodes);
      let keyInstances2: Array<systemManager.KeyEventPolicy> = systemManager.getKeyEventPolicies(SELFWANT);
      expect(keyInstances2.length == 0).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_key_event_policies_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_KEY_EVENT_POLICIES_JS_0006
   * @tc.desc   test systemManager getKeyEventPolicies with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_key_event_policies_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let keyEventPolicies: Array<systemManager.KeyEventPolicy> = [
        {keyCode: systemManager.KeyCode.HOME, keyPolicy: systemManager.KeyPolicy.INTERCEPTION},
        {keyCode: systemManager.KeyCode.RECENT, keyPolicy: systemManager.KeyPolicy.CUSTOM}
      ]
      let keyInstances: Array<systemManager.KeyEventPolicy> = []
      let keyCodes: Array<number> = [systemManager.KeyCode.HOME, systemManager.KeyCode.RECENT]
      systemManager.addKeyEventPolicies(SELFWANT, keyEventPolicies);
      let keyInstances0: Array<systemManager.KeyEventPolicy> = systemManager.getKeyEventPolicies(SELFWANT);
      expect(keyInstances0.length == 2).assertTrue();
      systemManager.removeKeyEventPolicies(SELFWANT, keyCodes);
      let keyInstances1: Array<systemManager.KeyEventPolicy> = systemManager.getKeyEventPolicies(SELFWANT);
      expect(keyInstances1.length == 0).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testStartCollectLog() {
  /**
   * @tc.name   test_start_collect_log_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_START_COLLECT_LOG_JS_0001
   * @tc.desc   test systemManager startCollectLog without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_collect_log_0001", Level.LEVEL2, async (done: Function) => {
    await systemManager.startCollectLog(SELFWANT).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    });
    done();
  });

  /**
   * @tc.name   test_start_collect_log_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_START_COLLECT_LOG_JS_0002
   * @tc.desc   test systemManager startCollectLog with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_collect_log_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    await systemManager.startCollectLog(SELFWANT).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    }).finally(async () => {
      await adminManager.disableAdmin(SELFWANT);
    });
    done();
  });

  /**
   * @tc.name   test_start_collect_log_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_START_COLLECT_LOG_JS_0003
   * @tc.desc   test systemManager startCollectLog success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_collect_log_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.startCollectLog(SELFWANT).then(result=>{
        expect(result == null).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(error.code == 801).assertTrue();
      });
      systemManager.finishLogCollected(SELFWANT);
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_start_collect_log_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_START_COLLECT_LOG_JS_0004
   * @tc.desc   test systemManager startCollectLog success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_collect_log_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.startCollectLog(null).then(result=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      });
      systemManager.finishLogCollected(SELFWANT);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_start_collect_log_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_START_COLLECT_LOG_JS_0005
   * @tc.desc   test systemManager startCollectLog success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_collect_log_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.startCollectLog(undefined).then(result=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      });
      systemManager.finishLogCollected(SELFWANT);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   setNTPServer_test_001
   * @tc.number setNTPServer_test_001
   * @tc.desc   setNTPServer with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("setNTPServer_test_001", Level.LEVEL2, async (done: Function) => {
    console.info(' --- setNTPServer_test_001  -------- START --------');
    try {
      systemManager.setNTPServer(null, 'aliyun.com');
      console.info(' --- setNTPServer_test_001 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- setNTPServer_test_001 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- setNTPServer_test_001  -------- END --------');
  })


  /**
   * @tc.name   setNTPServer_test_002
   * @tc.number setNTPServer_test_002
   * @tc.desc   setNTPServer with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("setNTPServer_test_002", Level.LEVEL2, async (done: Function) => {
    console.info(' --- setNTPServer_test_002  -------- START --------');
    try {
      systemManager.setNTPServer(undefined, 'aliyun.com');
      console.info(' --- setNTPServer_test_002 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- setNTPServer_test_002 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- setNTPServer_test_002  -------- END --------');
  })

  /**
   * @tc.name   setNTPServer_test_003
   * @tc.number setNTPServer_test_003
   * @tc.desc   setNTPServer with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("setNTPServer_test_003", Level.LEVEL2, async (done: Function) => {
    console.info(' --- setNTPServer_test_003  -------- START --------');
    try {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let ret = systemManager.setNTPServer(SELFWANT, '');
      console.info(' --- setNTPServer_test_003 error is expected, but it done.');
      expect(ret === undefined).assertTrue();
    } catch (error) {
      console.info(' --- setNTPServer_test_003 error 401 is expected, actually catch: ' + error.code);
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
    console.info(' --- setNTPServer_test_003  -------- END --------');
  })


  /**
   * @tc.name   setNTPServer_test_004
   * @tc.number setNTPServer_test_004
   * @tc.desc   setNTPServer with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("setNTPServer_test_004", Level.LEVEL2, async (done: Function) => {
    console.info(' --- setNTPServer_test_004  -------- START --------');
    try {
      systemManager.setNTPServer(SELFWANT, null);
      console.info(' --- setNTPServer_test_004 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- setNTPServer_test_004 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- setNTPServer_test_004  -------- END --------');
  })

  /**
   * @tc.name   setNTPServer_test_005
   * @tc.number setNTPServer_test_005
   * @tc.desc   setNTPServer with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("setNTPServer_test_005", Level.LEVEL2, async (done: Function) => {
    console.info(' --- setNTPServer_test_005  -------- START --------');
    try {
      systemManager.setNTPServer(SELFWANT, undefined);
      console.info(' --- setNTPServer_test_005 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- setNTPServer_test_005 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- setNTPServer_test_005  -------- END --------');
  })

  /**
   * @tc.name   getNTPServer_test_001
   * @tc.number getNTPServer_test_001
   * @tc.desc   getNTPServer with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getNTPServer_test_001", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getNTPServer_test_001  -------- START --------');
    try {
      systemManager.getNTPServer(null);
      console.info(' --- getNTPServer_test_001 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getNTPServer_test_001 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getNTPServer_test_001  -------- END --------');
  })


  /**
   * @tc.name   getNTPServer_test_002
   * @tc.number getNTPServer_test_002
   * @tc.desc   getNTPServer with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getNTPServer_test_002", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getNTPServer_test_002  -------- START --------');
    try {
      systemManager.getNTPServer(undefined);
      console.info(' --- getNTPServer_test_002 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getNTPServer_test_002 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getNTPServer_test_002  -------- END --------');
  })


  /**
   * @tc.name   setOtaUpdatePolicy_test_001
   * @tc.number setOtaUpdatePolicy_test_001
   * @tc.desc   setOtaUpdatePolicy with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("setOtaUpdatePolicy_test_001", Level.LEVEL2, async (done: Function) => {
    console.info(' --- setOtaUpdatePolicy_test_001  -------- START --------');
    try {
      let policy: systemManager.OtaUpdatePolicy = {
        "policyType": systemManager.PolicyType.DEFAULT,
        "version": UPDATE_VERSION,
        "disableSystemOtaUpdate": true
      }
      systemManager.setOtaUpdatePolicy(null, policy);
      console.info(' --- setOtaUpdatePolicy_test_001 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- setOtaUpdatePolicy_test_001 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- setOtaUpdatePolicy_test_001  -------- END --------');
  })


  /**
   * @tc.name   setOtaUpdatePolicy_test_002
   * @tc.number setOtaUpdatePolicy_test_002
   * @tc.desc   setOtaUpdatePolicy with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("setOtaUpdatePolicy_test_002", Level.LEVEL2, async (done: Function) => {
    console.info(' --- setOtaUpdatePolicy_test_002  -------- START --------');
    try {
      let policy: systemManager.OtaUpdatePolicy = {
        "policyType": systemManager.PolicyType.DEFAULT,
        "version": UPDATE_VERSION,
        "disableSystemOtaUpdate": true
      }
      systemManager.setOtaUpdatePolicy(undefined, policy);
      console.info(' --- setOtaUpdatePolicy_test_002 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- setOtaUpdatePolicy_test_002 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- setOtaUpdatePolicy_test_002  -------- END --------');
  })


  /**
   * @tc.name   setOtaUpdatePolicy_test_003
   * @tc.number setOtaUpdatePolicy_test_003
   * @tc.desc   setOtaUpdatePolicy with null parameter policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("setOtaUpdatePolicy_test_003", Level.LEVEL2, async (done: Function) => {
    console.info(' --- setOtaUpdatePolicy_test_003  -------- START --------');
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, null);
      console.info(' --- setOtaUpdatePolicy_test_003 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- setOtaUpdatePolicy_test_003 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- setOtaUpdatePolicy_test_003  -------- END --------');
  })


  /**
   * @tc.name   setOtaUpdatePolicy_test_004
   * @tc.number setOtaUpdatePolicy_test_004
   * @tc.desc   setOtaUpdatePolicy with undefined parameter policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("setOtaUpdatePolicy_test_004", Level.LEVEL2, async (done: Function) => {
    console.info(' --- setOtaUpdatePolicy_test_004  -------- START --------');
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, undefined);
      console.info(' --- setOtaUpdatePolicy_test_004 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- setOtaUpdatePolicy_test_004 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- setOtaUpdatePolicy_test_004  -------- END --------');
  })


  /**
   * @tc.name   getOtaUpdatePolicy_test_001
   * @tc.number getOtaUpdatePolicy_test_001
   * @tc.desc   getOtaUpdatePolicy with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getOtaUpdatePolicy_test_001", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getOtaUpdatePolicy_test_001  -------- START --------');
    try {
      systemManager.getOtaUpdatePolicy(null);
      console.info(' --- getOtaUpdatePolicy_test_001 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getOtaUpdatePolicy_test_001 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getOtaUpdatePolicy_test_001  -------- END --------');
  })


  /**
   * @tc.name   getOtaUpdatePolicy_test_002
   * @tc.number getOtaUpdatePolicy_test_002
   * @tc.desc   getOtaUpdatePolicy with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getOtaUpdatePolicy_test_002", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getOtaUpdatePolicy_test_002  -------- START --------');
    try {
      systemManager.getOtaUpdatePolicy(undefined);
      console.info(' --- getOtaUpdatePolicy_test_002 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getOtaUpdatePolicy_test_002 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getOtaUpdatePolicy_test_002  -------- END --------');
  })


  /**
   * @tc.name   notifyUpdatePackages_test_001
   * @tc.number notifyUpdatePackages_test_001
   * @tc.desc   notifyUpdatePackages with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("notifyUpdatePackages_test_001", Level.LEVEL2, async (done: Function) => {
    console.info(' --- notifyUpdatePackages_test_001  -------- START --------');
    try {
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
        "version" : "",
        "packages" : [],
        "description" : description,
        "authInfo" : "invalid authinfo",
      };
      systemManager.notifyUpdatePackages(null, updatePackageInfo);
      console.info(' --- notifyUpdatePackages_test_001 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- notifyUpdatePackages_test_001 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- notifyUpdatePackages_test_001  -------- END --------');
  })


  /**
   * @tc.name   notifyUpdatePackages_test_002
   * @tc.number notifyUpdatePackages_test_002
   * @tc.desc   notifyUpdatePackages with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("notifyUpdatePackages_test_002", Level.LEVEL2, async (done: Function) => {
    console.info(' --- notifyUpdatePackages_test_002  -------- START --------');
    try {
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
      systemManager.notifyUpdatePackages(undefined, updatePackageInfo);
      console.info(' --- notifyUpdatePackages_test_002 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- notifyUpdatePackages_test_002 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- notifyUpdatePackages_test_002  -------- END --------');
  })


  /**
   * @tc.name   notifyUpdatePackages_test_003
   * @tc.number notifyUpdatePackages_test_003
   * @tc.desc   notifyUpdatePackages with null parameter packageInfo
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("notifyUpdatePackages_test_003", Level.LEVEL2, async (done: Function) => {
    console.info(' --- notifyUpdatePackages_test_003  -------- START --------');
    try {
      systemManager.notifyUpdatePackages(SELFWANT, null);
      console.info(' --- notifyUpdatePackages_test_003 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- notifyUpdatePackages_test_003 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- notifyUpdatePackages_test_003  -------- END --------');
  })


  /**
   * @tc.name   notifyUpdatePackages_test_004
   * @tc.number notifyUpdatePackages_test_004
   * @tc.desc   notifyUpdatePackages with undefined parameter packageInfo
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("notifyUpdatePackages_test_004", Level.LEVEL2, async (done: Function) => {
    console.info(' --- notifyUpdatePackages_test_004  -------- START --------');
    try {
      systemManager.notifyUpdatePackages(SELFWANT, undefined);
      console.info(' --- notifyUpdatePackages_test_004 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- notifyUpdatePackages_test_004 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- notifyUpdatePackages_test_004  -------- END --------');
  })


  /**
   * @tc.name   getUpdateResult_test_001
   * @tc.number getUpdateResult_test_001
   * @tc.desc   getUpdateResult with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getUpdateResult_test_001", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getUpdateResult_test_001  -------- START --------');
    try {
      systemManager.getUpdateResult(null, UPDATE_VERSION);
      console.info(' --- getUpdateResult_test_001 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getUpdateResult_test_001 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getUpdateResult_test_001  -------- END --------');
  })


  /**
   * @tc.name   getUpdateResult_test_002
   * @tc.number getUpdateResult_test_002
   * @tc.desc   getUpdateResult with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getUpdateResult_test_002", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getUpdateResult_test_002  -------- START --------');
    try {
      systemManager.getUpdateResult(undefined, UPDATE_VERSION);
      console.info(' --- getUpdateResult_test_002 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getUpdateResult_test_002 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getUpdateResult_test_002  -------- END --------');
  })


  /**
   * @tc.name   getUpdateAuthData_test_001
   * @tc.number getUpdateAuthData_test_001
   * @tc.desc   getUpdateAuthData with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getUpdateAuthData_test_001", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getUpdateAuthData_test_001  -------- START --------');
    try {
      systemManager.getUpdateAuthData(null);
      console.info(' --- getUpdateAuthData_test_001 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getUpdateAuthData_test_001 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getUpdateAuthData_test_001  -------- END --------');
  })


  /**
   * @tc.name   getUpdateAuthData_test_002
   * @tc.number getUpdateAuthData_test_002
   * @tc.desc   getUpdateAuthData with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getUpdateAuthData_test_002", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getUpdateAuthData_test_002  -------- START --------');
    try {
      systemManager.getUpdateAuthData(undefined);
      console.info(' --- getUpdateAuthData_test_002 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getUpdateAuthData_test_002 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getUpdateAuthData_test_002  -------- END --------');
  })


  /**
   * @tc.name   addKeyEventPolicies_test_001
   * @tc.number addKeyEventPolicies_test_001
   * @tc.desc   addKeyEventPolicies with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("addKeyEventPolicies_test_001", Level.LEVEL2, async (done: Function) => {
    console.info(' --- addKeyEventPolicies_test_001  -------- START --------');
    try {
      let keyEventPolicies: Array<systemManager.KeyEventPolicy> = [
        {keyCode: systemManager.KeyCode.HOME, keyPolicy: systemManager.KeyPolicy.INTERCEPTION},
        {keyCode: systemManager.KeyCode.RECENT, keyPolicy: systemManager.KeyPolicy.CUSTOM}
      ]
      systemManager.addKeyEventPolicies(null, keyEventPolicies);
      console.info(' --- addKeyEventPolicies_test_001 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- addKeyEventPolicies_test_001 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- addKeyEventPolicies_test_001  -------- END --------');
  })


  /**
   * @tc.name   addKeyEventPolicies_test_002
   * @tc.number addKeyEventPolicies_test_002
   * @tc.desc   addKeyEventPolicies with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("addKeyEventPolicies_test_002", Level.LEVEL2, async (done: Function) => {
    console.info(' --- addKeyEventPolicies_test_002  -------- START --------');
    try {
      let keyEventPolicies: Array<systemManager.KeyEventPolicy> = [
        {keyCode: systemManager.KeyCode.HOME, keyPolicy: systemManager.KeyPolicy.INTERCEPTION},
        {keyCode: systemManager.KeyCode.RECENT, keyPolicy: systemManager.KeyPolicy.CUSTOM}
      ]
      systemManager.addKeyEventPolicies(undefined, keyEventPolicies);
      console.info(' --- addKeyEventPolicies_test_002 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- addKeyEventPolicies_test_002 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- addKeyEventPolicies_test_002  -------- END --------');
  })


  /**
   * @tc.name   addKeyEventPolicies_test_003
   * @tc.number addKeyEventPolicies_test_003
   * @tc.desc   addKeyEventPolicies with null parameter keyPolicies
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("addKeyEventPolicies_test_003", Level.LEVEL2, async (done: Function) => {
    console.info(' --- addKeyEventPolicies_test_003  -------- START --------');
    try {
      systemManager.addKeyEventPolicies(SELFWANT, null);
      console.info(' --- addKeyEventPolicies_test_003 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- addKeyEventPolicies_test_003 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- addKeyEventPolicies_test_003  -------- END --------');
  })


  /**
   * @tc.name   addKeyEventPolicies_test_004
   * @tc.number addKeyEventPolicies_test_004
   * @tc.desc   addKeyEventPolicies with undefined parameter keyPolicies
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("addKeyEventPolicies_test_004", Level.LEVEL2, async (done: Function) => {
    console.info(' --- addKeyEventPolicies_test_004  -------- START --------');
    try {
      systemManager.addKeyEventPolicies(SELFWANT, undefined);
      console.info(' --- addKeyEventPolicies_test_004 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- addKeyEventPolicies_test_004 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- addKeyEventPolicies_test_004  -------- END --------');
  })


  /**
   * @tc.name   removeKeyEventPolicies_test_001
   * @tc.number removeKeyEventPolicies_test_001
   * @tc.desc   removeKeyEventPolicies with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("removeKeyEventPolicies_test_001", Level.LEVEL2, async (done: Function) => {
    console.info(' --- removeKeyEventPolicies_test_001  -------- START --------');
    try {
      systemManager.removeKeyEventPolicies(null, [systemManager.KeyCode.HOME, systemManager.KeyCode.RECENT]);
      console.info(' --- removeKeyEventPolicies_test_001 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- removeKeyEventPolicies_test_001 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- removeKeyEventPolicies_test_001  -------- END --------');
  })


  /**
   * @tc.name   removeKeyEventPolicies_test_002
   * @tc.number removeKeyEventPolicies_test_002
   * @tc.desc   removeKeyEventPolicies with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("removeKeyEventPolicies_test_002", Level.LEVEL2, async (done: Function) => {
    console.info(' --- removeKeyEventPolicies_test_002  -------- START --------');
    try {
      systemManager.removeKeyEventPolicies(undefined, [systemManager.KeyCode.HOME, systemManager.KeyCode.RECENT]);
      console.info(' --- removeKeyEventPolicies_test_002 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- removeKeyEventPolicies_test_002 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- removeKeyEventPolicies_test_002  -------- END --------');
  })


  /**
   * @tc.name   removeKeyEventPolicies_test_003
   * @tc.number removeKeyEventPolicies_test_003
   * @tc.desc   removeKeyEventPolicies with null parameter keyCodes
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("removeKeyEventPolicies_test_003", Level.LEVEL2, async (done: Function) => {
    console.info(' --- removeKeyEventPolicies_test_003  -------- START --------');
    try {
      systemManager.removeKeyEventPolicies(SELFWANT, null);
      console.info(' --- removeKeyEventPolicies_test_003 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- removeKeyEventPolicies_test_003 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- removeKeyEventPolicies_test_003  -------- END --------');
  })


  /**
   * @tc.name   removeKeyEventPolicies_test_004
   * @tc.number removeKeyEventPolicies_test_004
   * @tc.desc   removeKeyEventPolicies with undefined parameter keyCodes
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("removeKeyEventPolicies_test_004", Level.LEVEL2, async (done: Function) => {
    console.info(' --- removeKeyEventPolicies_test_004  -------- START --------');
    try {
      systemManager.removeKeyEventPolicies(SELFWANT, undefined);
      console.info(' --- removeKeyEventPolicies_test_004 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- removeKeyEventPolicies_test_004 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- removeKeyEventPolicies_test_004  -------- END --------');
  })


  /**
   * @tc.name   getKeyEventPolicies_test_001
   * @tc.number getKeyEventPolicies_test_001
   * @tc.desc   getKeyEventPolicies with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getKeyEventPolicies_test_001", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getKeyEventPolicies_test_001  -------- START --------');
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let policies = systemManager.getKeyEventPolicies(null);
      console.info(' --- getKeyEventPolicies_test_001 error is expected, but it done.');
      expect(policies.length === 0).assertTrue();
    } catch (error) {
      console.info(' --- getKeyEventPolicies_test_001 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
    console.info(' --- getKeyEventPolicies_test_001  -------- END --------');
  })


  /**
   * @tc.name   getKeyEventPolicies_test_002
   * @tc.number getKeyEventPolicies_test_002
   * @tc.desc   getKeyEventPolicies with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getKeyEventPolicies_test_002", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getKeyEventPolicies_test_002  -------- START --------');
    try {
      systemManager.getKeyEventPolicies(undefined);
      console.info(' --- getKeyEventPolicies_test_002 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getKeyEventPolicies_test_002 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getKeyEventPolicies_test_002  -------- END --------');
  })

  /**
   * @tc.name   getNTPServer_test_015
   * @tc.number getNTPServer_test_015
   * @tc.desc   getNTPServer with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getNTPServer_test_015", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getNTPServer_test_015  -------- START --------');
    try {
      systemManager.getNTPServer(null);
      console.info(' --- getNTPServer_test_015 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getNTPServer_test_015 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getNTPServer_test_015  -------- END --------');
  })


  /**
   * @tc.name   getNTPServer_test_016
   * @tc.number getNTPServer_test_016
   * @tc.desc   getNTPServer with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getNTPServer_test_016", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getNTPServer_test_016  -------- START --------');
    try {
      systemManager.getNTPServer(undefined);
      console.info(' --- getNTPServer_test_016 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getNTPServer_test_016 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getNTPServer_test_016  -------- END --------');
  })

  /**
   * @tc.name   getOtaUpdatePolicy_test_015
   * @tc.number getOtaUpdatePolicy_test_015
   * @tc.desc   getOtaUpdatePolicy with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getOtaUpdatePolicy_test_015", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getOtaUpdatePolicy_test_015  -------- START --------');
    try {
      systemManager.getOtaUpdatePolicy(null);
      console.info(' --- getOtaUpdatePolicy_test_015 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getOtaUpdatePolicy_test_015 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getOtaUpdatePolicy_test_015  -------- END --------');
  })


  /**
   * @tc.name   getOtaUpdatePolicy_test_016
   * @tc.number getOtaUpdatePolicy_test_016
   * @tc.desc   getOtaUpdatePolicy with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getOtaUpdatePolicy_test_016", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getOtaUpdatePolicy_test_016  -------- START --------');
    try {
      systemManager.getOtaUpdatePolicy(undefined);
      console.info(' --- getOtaUpdatePolicy_test_016 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getOtaUpdatePolicy_test_016 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getOtaUpdatePolicy_test_016  -------- END --------');
  })

  /**
   * @tc.name   getUpdateAuthData_test_015
   * @tc.number getUpdateAuthData_test_015
   * @tc.desc   getUpdateAuthData with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getUpdateAuthData_test_015", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getUpdateAuthData_test_015  -------- START --------');
    try {
      systemManager.getUpdateAuthData(null);
      console.info(' --- getUpdateAuthData_test_015 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getUpdateAuthData_test_015 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getUpdateAuthData_test_015  -------- END --------');
  })


  /**
   * @tc.name   getUpdateAuthData_test_016
   * @tc.number getUpdateAuthData_test_016
   * @tc.desc   getUpdateAuthData with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getUpdateAuthData_test_016", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getUpdateAuthData_test_016  -------- START --------');
    try {
      systemManager.getUpdateAuthData(undefined);
      console.info(' --- getUpdateAuthData_test_016 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getUpdateAuthData_test_016 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getUpdateAuthData_test_016  -------- END --------');
  })

  /**
   * @tc.name   getKeyEventPolicies_test_015
   * @tc.number getKeyEventPolicies_test_015
   * @tc.desc   getKeyEventPolicies with null parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getKeyEventPolicies_test_015", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getKeyEventPolicies_test_015  -------- START --------');
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let policies = systemManager.getKeyEventPolicies(null);
      console.info(' --- getKeyEventPolicies_test_015 error is expected, but it done.');
      expect(policies.length === 0).assertTrue();
    } catch (error) {
      console.info(' --- getKeyEventPolicies_test_015 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
    console.info(' --- getKeyEventPolicies_test_015  -------- END --------');
  })


  /**
   * @tc.name   getKeyEventPolicies_test_016
   * @tc.number getKeyEventPolicies_test_016
   * @tc.desc   getKeyEventPolicies with undefined parameter admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("getKeyEventPolicies_test_016", Level.LEVEL2, async (done: Function) => {
    console.info(' --- getKeyEventPolicies_test_016  -------- START --------');
    try {
      systemManager.getKeyEventPolicies(undefined);
      console.info(' --- getKeyEventPolicies_test_016 error is expected, but it done.');
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- getKeyEventPolicies_test_016 error 401 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
    console.info(' --- getKeyEventPolicies_test_016  -------- END --------');
  })
}

function testFinishLogCollected() {
  /**
   * @tc.name   test_finish_log_collected_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_FINISH_LOG_COLLECTED_JS_0001
   * @tc.desc   test systemManager finishLogCollected without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_finish_log_collected_0001", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.finishLogCollected(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_finish_log_collected_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_FINISH_LOG_COLLECTED_JS_0002
   * @tc.desc   test systemManager finishLogCollected with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_finish_log_collected_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.finishLogCollected(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_finish_log_collected_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_FINISH_LOG_COLLECTED_JS_0003
   * @tc.desc   test systemManager finishLogCollected with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_finish_log_collected_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.finishLogCollected(null);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_finish_log_collected_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_FINISH_LOG_COLLECTED_JS_0004
   * @tc.desc   test systemManager finishLogCollected with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_finish_log_collected_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.finishLogCollected(undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   setOtaUpdatePolicy_test_004_1
   * @tc.number setOtaUpdatePolicy_test_004_1
   * @tc.desc   setOtaUpdatePolicy with disableSystemOtaUpdate is false policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("setOtaUpdatePolicy_test_004_1", Level.LEVEL2, async (done: Function) => {
    console.info(' --- setOtaUpdatePolicy_test_004_1  -------- START --------');
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.DEFAULT,
      "version": UPDATE_VERSION,
      "disableSystemOtaUpdate": false
    }
    try {
      let ret = systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(ret === undefined).assertTrue();
    } catch (error) {
      console.info(' --- setOtaUpdatePolicy_test_004_1 error 801 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
    console.info(' --- setOtaUpdatePolicy_test_004_1  -------- END --------');
  })

  /**
   * @tc.name   notifyUpdatePackages_test_004_1
   * @tc.number notifyUpdatePackages_test_004_1
   * @tc.desc   notifyUpdatePackages with [] parameter packages
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("notifyUpdatePackages_test_004_1", Level.LEVEL2, async (done: Function) => {
    console.info(' --- notifyUpdatePackages_test_004_1  -------- START --------');
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let notify: systemManager.NotifyDescription = {
      "installTips": "installTips",
      "installTipsDetail": "installTips detail"
    }
    let description: systemManager.PackageDescription = {
      "notify": notify,
    }
    let updatePackageInfo: systemManager.UpdatePackageInfo = {
      "version": UPDATE_VERSION,
      "packages": [],
      "description": description,
      "authInfo": "invalid authinfo",
    };
    await systemManager.notifyUpdatePackages(SELFWANT, updatePackageInfo).then(() => {
      expect(false).assertTrue();
    }).catch((error: BusinessError) => {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9201004).assertTrue();
      }
    }).finally(async () => {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    });
    done();
    console.info(' --- notifyUpdatePackages_test_004_1  -------- END --------');
  })

  /**
   * @tc.name   addKeyEventPolicies_test_004_1
   * @tc.number addKeyEventPolicies_test_004_1
   * @tc.desc   addKeyEventPolicies with [] parameter keyPolicies
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("addKeyEventPolicies_test_004_1", Level.LEVEL2, async (done: Function) => {
    console.info(' --- addKeyEventPolicies_test_004_1  -------- START --------');
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = systemManager.addKeyEventPolicies(SELFWANT, []);
      expect(ret === undefined).assertTrue();
    } catch (error) {
      console.info(' --- addKeyEventPolicies_test_004_1 error 801 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
    console.info(' --- addKeyEventPolicies_test_004_1  -------- END --------');
  })

  /**
   * @tc.name   removeKeyEventPolicies_test_004_1
   * @tc.number removeKeyEventPolicies_test_004_1
   * @tc.desc   removeKeyEventPolicies with [] parameter keyCodes
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("removeKeyEventPolicies_test_004_1", Level.LEVEL2, async (done: Function) => {
    console.info(' --- removeKeyEventPolicies_test_004  -------- START --------');
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = systemManager.removeKeyEventPolicies(SELFWANT, []);
      expect(ret === undefined).assertTrue();
    } catch (error) {
      console.info(' --- removeKeyEventPolicies_test_004_1 error 801 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
    console.info(' --- removeKeyEventPolicies_test_004_1  -------- END --------');
  })

}

function testSetActivationLockDisabled() {
  /**
  * @tc.name   test_set_activation_lock_disabled_0001
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_ACTIVATION_LOCK_DISABLED_JS_0001
  * @tc.desc   test systemManager setActivationLockDisabled without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_activation_lock_disabled_0001", Level.LEVEL2, async (done: Function) => {
    let credential: string = "test";
    await systemManager.setActivationLockDisabled(SELFWANT, true, credential).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    });
    done();
  });

  /**
  * @tc.name   test_set_activation_lock_disabled_0002
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_ACTIVATION_LOCK_DISABLED_JS_0002
  * @tc.desc   test systemManager setActivationLockDisabled with normal admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_activation_lock_disabled_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    let credential: string = "test";
    await systemManager.setActivationLockDisabled(SELFWANT, true, credential).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    }).finally(async () => {
      await adminManager.disableAdmin(SELFWANT);
    });
    done();
  });

  /**
  * @tc.name   test_set_activation_lock_disabled_0003
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_ACTIVATION_LOCK_DISABLED_JS_0003
  * @tc.desc   test systemManager setActivationLockDisabled true with credential is null
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_activation_lock_disabled_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let credential: string = "";
    await systemManager.setActivationLockDisabled(SELFWANT, true, credential).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }   
    }).finally(async () => {
      await adminManager.disableAdmin(SELFWANT);
    });
    done();
  });

  /**
  * @tc.name   test_set_activation_lock_disabled_0004
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_ACTIVATION_LOCK_DISABLED_JS_0004
  * @tc.desc   test systemManager setActivationLockDisabled true with Whether the CCM parameter is enabled
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_activation_lock_disabled_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let credential: string = "test";
    let info: string = systemParameterEnhance.getSync("const.pc_security.activation_lock_allow_disable", "");
    await systemManager.setActivationLockDisabled(SELFWANT, true, credential).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
        if (info == "true") {
          if (Number(error.code) === 801) {
            expect(Number(error.code) === 801).assertTrue();
          } else {
            expect(Number(error.code) === 9201011).assertTrue();
          }
        } else {
          if (Number(error.code) === 801) {
            expect(Number(error.code) === 801).assertTrue();
          } else {
            expect(Number(error.code) === 9201012).assertTrue();
          }
        }
    }).finally(async () => {
      await adminManager.disableAdmin(SELFWANT);
    });
    done();
  });

  /**
  * @tc.name   test_set_activation_lock_disabled_0005
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_ACTIVATION_LOCK_DISABLED_JS_0005
  * @tc.desc   test systemManager setActivationLockDisabled false with Whether the CCM parameter is enabled
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_activation_lock_disabled_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: string = systemParameterEnhance.getSync("const.pc_security.activation_lock_allow_disable", "");
    await systemManager.setActivationLockDisabled(SELFWANT, false, "").then(()=>{
      if (info == "true") {
        expect(info === "true").assertTrue();
      } else {
        expect(info === "false").assertTrue();
      }
    }).catch ((error: BusinessError)=> {
      if (info == "true") {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201012).assertTrue();
        }
      }
    }).finally(async () => {
      await adminManager.disableAdmin(SELFWANT);
    });
    done();
  });

  /**
  * @tc.name   test_set_activation_lock_disabled_0006
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_ACTIVATION_LOCK_DISABLED_JS_0006
  * @tc.desc   test systemManager setActivationLockDisabled with null admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_activation_lock_disabled_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let credential: string = "test";
      await systemManager.setActivationLockDisabled(null, true, credential).then(()=>{
        expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      expect(Number(error.code) === 801).assertTrue();
    });
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_set_activation_lock_disabled_0007
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_ACTIVATION_LOCK_DISABLED_JS_0007
  * @tc.desc   test systemManager setActivationLockDisabled with null credential
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_activation_lock_disabled_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.setActivationLockDisabled(SELFWANT, true, null).then(()=>{
        expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      expect(Number(error.code) === 801).assertTrue();
    });
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_set_activation_lock_disabled_0008
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_ACTIVATION_LOCK_DISABLED_JS_0008
  * @tc.desc   test systemManager setActivationLockDisabled with undefined credential
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_activation_lock_disabled_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.setActivationLockDisabled(SELFWANT, true, undefined).then(()=>{
        expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      expect(Number(error.code) === 801).assertTrue();
    });
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_set_activation_lock_disabled_0009
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_ACTIVATION_LOCK_DISABLED_JS_0009
  * @tc.desc   test systemManager setActivationLockDisabled with undefined admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_activation_lock_disabled_0009", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let credential: string = "test";
      await systemManager.setActivationLockDisabled(undefined, true, credential).then(()=>{
        expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      expect(Number(error.code) === 801).assertTrue();
    });
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_set_activation_lock_disabled_00010
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_ACTIVATION_LOCK_DISABLED_JS_00010
  * @tc.desc   test systemManager setActivationLockDisabled with undefined isdisable
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_activation_lock_disabled_00010", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let credential: string = "test";
      systemManager.setActivationLockDisabled(SELFWANT, undefined, credential).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 801).assertTrue();
      });
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testIsActivationLockDisabled() {
  /**
  * @tc.name   test_is_activation_lock_disabled_0001
  * @tc.number SUB_CUSTOMIZATION_EDM_IS_ACTIVATION_LOCK_DISABLED_JS_0001
  * @tc.desc   test systemManager IsActivationLockDisabled without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_is_activation_lock_disabled_0001", Level.LEVEL2, async (done: Function) => {
    await systemManager.isActivationLockDisabled(SELFWANT).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    });
    done();
  });

  /**
  * @tc.name   test_is_activation_lock_disabled_0002
  * @tc.number SUB_CUSTOMIZATION_EDM_IS_ACTIVATION_LOCK_DISABLED_JS_0002
  * @tc.desc   test systemManager IsActivationLockDisabled with normal admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_is_activation_lock_disabled_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    await systemManager.isActivationLockDisabled(SELFWANT).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    }).finally(async () => {
      await adminManager.disableAdmin(SELFWANT);
    });
    done();
  });

  /**
  * @tc.name   test_is_activation_lock_disabled_0003
  * @tc.number SUB_CUSTOMIZATION_EDM_IS_ACTIVATION_LOCK_DISABLED_JS_0003
  * @tc.desc   test systemManager IsActivationLockDisabled with null admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_is_activation_lock_disabled_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.isActivationLockDisabled(null).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      expect(Number(error.code) === 801).assertTrue();
    });
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_is_activation_lock_disabled_0004
  * @tc.number SUB_CUSTOMIZATION_EDM_IS_ACTIVATION_LOCK_DISABLED_JS_0004
  * @tc.desc   test systemManager IsActivationLockDisabled with null undefined
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_is_activation_lock_disabled_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.isActivationLockDisabled(undefined).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      expect(Number(error.code) === 801).assertTrue();
    });
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetInstallLocalEnterpriseAppEnabledForAccount() {
  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_for_account_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0001
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabledForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_for_account_0001", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_for_account_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0002
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabledForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_for_account_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_for_account_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0003
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabledForAccount with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_for_account_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(INVALID_WANT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_for_account_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0004
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabledForAccount with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_for_account_0004", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(null, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_for_account_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0005
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabledForAccount with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_for_account_0005", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(undefined, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_for_account_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0006
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabledForAccount with null isEnable
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_for_account_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_for_account_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0007
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabledForAccount with undefined isEnable
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_for_account_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, undefined, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_for_account_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0008
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabledForAccount with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_for_account_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, true, null);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_for_account_0009
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0009
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabledForAccount with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_for_account_0009", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, true, undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_for_account_0010
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0010
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabledForAccount success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_for_account_0010", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, true, DEFAULT_USER_ID);
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, DEFAULT_USER_ID);
      expect(result).assertTrue();

      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, false, DEFAULT_USER_ID);
      result = systemManager.getInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, DEFAULT_USER_ID);
      expect(result).assertFalse();
    } catch (error) {
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_install_local_enterprise_app_enabled_for_account_0011
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0011
   * @tc.desc   test systemManager setInstallLocalEnterpriseAppEnabledForAccount with invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_install_local_enterprise_app_enabled_for_account_0011", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, true, INVALID_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetInstallLocalEnterpriseAppEnabledForAccount() {
  /**
   * @tc.name   test_get_install_local_enterprise_app_enabled_for_account_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0001
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabledForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_install_local_enterprise_app_enabled_for_account_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_install_local_enterprise_app_enabled_for_account_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0002
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabledForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_install_local_enterprise_app_enabled_for_account_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_install_local_enterprise_app_enabled_for_account_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0003
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabledForAccount with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_install_local_enterprise_app_enabled_for_account_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabledForAccount(INVALID_WANT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_install_local_enterprise_app_enabled_for_account_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0004
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabledForAccount with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_install_local_enterprise_app_enabled_for_account_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabledForAccount(null, DEFAULT_USER_ID);
      expect(result).assertFalse();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
    done();
  });

  /**
   * @tc.name   test_get_install_local_enterprise_app_enabled_for_account_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0005
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabledForAccount with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_install_local_enterprise_app_enabled_for_account_0005", Level.LEVEL2, async (done: Function) => {
    try {
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabledForAccount(undefined, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_install_local_enterprise_app_enabled_for_account_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0006
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabledForAccount with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_install_local_enterprise_app_enabled_for_account_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_install_local_enterprise_app_enabled_for_account_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0007
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabledForAccount with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_install_local_enterprise_app_enabled_for_account_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_install_local_enterprise_app_enabled_for_account_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0008
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabledForAccount success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_install_local_enterprise_app_enabled_for_account_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, DEFAULT_USER_ID);
      expect(result).assertFalse();
    } catch (error) {
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_install_local_enterprise_app_enabled_for_account_0009
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALL_LOCAL_ENTERPRISE_APP_ENABLED_FOR_ACCOUNT_JS_0009
   * @tc.desc   test systemManager getInstallLocalEnterpriseAppEnabledForAccount with invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_install_local_enterprise_app_enabled_for_account_0009", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = systemManager.getInstallLocalEnterpriseAppEnabledForAccount(SELFWANT, INVALID_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}