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
import Want from '@ohos.app.ability.Want'
import { ENTINFO1, SELFWANT, SELFHAPNAME, SUBSCRIBE_EVENTS, SUBSCRIBE_INVALID_EVENTS,
  BUNDLENAME1, INVALID_WANT, PARAMETERS_LOWER_BOUND, INVALID_PARAMETERS, INVALID_PARAMETERS_LOWER_THAN_UPPER_BOUND,
  OTHER_WANT, NOT_EXIST_WANT, DEFAULT_USER_ID, TEST_BUNDLENAME
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import sysDeviceInfo from '@ohos.deviceInfo';

const DELEGATED_POLICIES: Array<string> = [ "set_browser_policies" ];

export default function adminManagerTest() {
  describe('adminManager_test', () => {
    /**
     * @tc.name   test_subscribeManagedEventSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_001
     * @tc.desc   test subscribeManagedEventSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_subscribeManagedEventSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        adminManager.subscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_subscribeManagedEventSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_002
     * @tc.desc   test subscribeManagedEventSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_subscribeManagedEventSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.subscribeManagedEventSync(SELFWANT, SUBSCRIBE_INVALID_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200008).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_subscribeManagedEventSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_003
     * @tc.desc   test subscribeManagedEventSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_subscribeManagedEventSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.subscribeManagedEventSync(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_subscribeManagedEventSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_004
     * @tc.desc   test subscribeManagedEventSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_subscribeManagedEventSync_004", Level.LEVEL0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let ret = adminManager.subscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
        expect(ret == null).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_subscribeManagedEventSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_005
     * @tc.desc   test subscribeManagedEventSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_subscribeManagedEventSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let events: Array<adminManager.ManagedEvent> = [];
        adminManager.subscribeManagedEventSync(SELFWANT, events);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' ---test_subscribeManagedEventSync_005 error 9200008 is expected, actually catch: ' + error.code);
        expect(error.code == 9200008).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_unsubscribeManagedEventSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_001
     * @tc.desc   test unsubscribeManagedEventSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_unsubscribeManagedEventSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        adminManager.unsubscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_unsubscribeManagedEventSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_002
     * @tc.desc   test unsubscribeManagedEventSync method with Active admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_unsubscribeManagedEventSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.unsubscribeManagedEventSync(SELFWANT, SUBSCRIBE_INVALID_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200008).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_unsubscribeManagedEventSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_003
     * @tc.desc   test unsubscribeManagedEventSync method with Active admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_unsubscribeManagedEventSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.unsubscribeManagedEventSync(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_unsubscribeManagedEventSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_004
     * @tc.desc   test unsubscribeManagedEventSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_unsubscribeManagedEventSync_004", Level.LEVEL0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let ret = adminManager.unsubscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
        expect(ret == null).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_unsubscribeManagedEventSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_005
     * @tc.desc   test unsubscribeManagedEventSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_unsubscribeManagedEventSync_005", Level.LEVEL0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let events: Array<adminManager.ManagedEvent> = [];
        adminManager.unsubscribeManagedEventSync(SELFWANT, events);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' ---test_unsubscribeManagedEventSync_005 error 9200008 is expected, actually catch: ' + error.code);
        expect(error.code == 9200008).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_setDelegatedPolicies_001
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_001
     * @tc.desc   test setDelegatedPolicies method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDelegatedPolicies_001", Level.LEVEL2, async (done: Function) => {
      try {
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, DELEGATED_POLICIES);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_setDelegatedPolicies_002
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_002
     * @tc.desc   test setDelegatedPolicies method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDelegatedPolicies_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, DELEGATED_POLICIES);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_setDelegatedPolicies_003
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_003
     * @tc.desc   test setDelegatedPolicies method with invalid bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDelegatedPolicies_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.setDelegatedPolicies(SELFWANT, "invalid", DELEGATED_POLICIES);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200009).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_setDelegatedPolicies_004
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_004
     * @tc.desc   test setDelegatedPolicies method with invalid policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDelegatedPolicies_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let invalidPolicy: Array<string> = ["invalid_policy"];
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, invalidPolicy);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_setDelegatedPolicies_005
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_005
     * @tc.desc   test setDelegatedPolicies method with invalid bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_setDelegatedPolicies_005", Level.LEVEL0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let emptyBundles: Array<string> = adminManager.getDelegatedBundleNames(SELFWANT, DELEGATED_POLICIES[0]);
        expect(emptyBundles.length == 0).assertTrue();
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, DELEGATED_POLICIES);
        let policies: Array<string> = adminManager.getDelegatedPolicies(SELFWANT, BUNDLENAME1);
        expect(policies.length == 1).assertTrue();
        expect(policies[0] == DELEGATED_POLICIES[0]).assertTrue();
        let bundles: Array<string> = adminManager.getDelegatedBundleNames(SELFWANT, DELEGATED_POLICIES[0]);
        expect(bundles.length == 1).assertTrue();
        expect(bundles[0] == BUNDLENAME1).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_setDelegatedPolicies_006
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_006
     * @tc.desc   test setDelegatedPolicies method with invalid policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDelegatedPolicies_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let policies: Array<string> = [];
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, policies);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_isByodAdmin_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ISBYODADMIN_001
     * @tc.desc   test isByodAdmin method without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isByodAdmin_001", Level.LEVEL2, async (done: Function) => {
      try {
        adminManager.isByodAdmin(null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_isByodAdmin_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ISBYODADMIN_002
     * @tc.desc   test isByodAdmin method result is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isByodAdmin_002", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let ret: boolean = adminManager.isByodAdmin(SELFWANT);
        expect(ret).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      }finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_isByodAdmin_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ISBYODADMIN_003
     * @tc.desc   test isByodAdmin method result is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isByodAdmin_003", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret: boolean = adminManager.isByodAdmin(SELFWANT);
        expect(ret).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
      }finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_isByodAdmin_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ISBYODADMIN_004
     * @tc.desc   test isByodAdmin parameter verification failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isByodAdmin_004", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let adminTest: Want = {
        bundleName: "com.edm.test",
        abilityName: "com.example.myapplication.EnterpriseAdminAbility"
      };
      try {
        let ret: boolean = adminManager.isByodAdmin(adminTest);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012).assertTrue();
      }finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getDelegatedPolicies_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDELEGATEDPOLICIES_001
     * @tc.desc   test getDelegatedPolicies method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDelegatedPolicies_001", Level.LEVEL2, async (done: Function) => {
      try {
        adminManager.getDelegatedPolicies(SELFWANT, BUNDLENAME1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getDelegatedPolicies_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDELEGATEDPOLICIES_002
     * @tc.desc   test getDelegatedPolicies method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDelegatedPolicies_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        adminManager.getDelegatedPolicies(SELFWANT, BUNDLENAME1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getDelegatedPolicies_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDELEGATEDPOLICIES_003
     * @tc.desc   test getDelegatedPolicies method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDelegatedPolicies_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.getDelegatedPolicies(SELFWANT, "invalid");
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getDelegatedBundleNames_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDELEGATEDBUNDLENAMES_001
     * @tc.desc   test getDelegatedBundleNames method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDelegatedBundleNames_001", Level.LEVEL2, async (done: Function) => {
      try {
        adminManager.getDelegatedBundleNames(SELFWANT, DELEGATED_POLICIES[0]);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getDelegatedBundleNames_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDELEGATEDBUNDLENAMES_002
     * @tc.desc   test getDelegatedBundleNames method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDelegatedBundleNames_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        adminManager.getDelegatedBundleNames(SELFWANT, DELEGATED_POLICIES[0]);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getDelegatedBundleNames_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDELEGATEDBUNDLENAMES_002
     * @tc.desc   test getDelegatedBundleNames method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDelegatedBundleNames_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.getDelegatedBundleNames(SELFWANT, "invalid");
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_startAdminProvision_001
     * @tc.number SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_001
     * @tc.desc   test startAdminProvision method with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_001", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType === '2in1') {
        done();
        return;
      }
      try {
        adminManager.startAdminProvision(INVALID_WANT, adminManager.AdminType.ADMIN_TYPE_BYOD, AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_startAdminProvision_002
     * @tc.number SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_002
     * @tc.desc   test startAdminProvision method with invalid adminType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_002", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType === '2in1') {
        done();
        return;
      }
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_NORMAL, AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_startAdminProvision_003
     * @tc.number SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_003
     * @tc.desc   test startAdminProvision method with invalid context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_003", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType === '2in1') {
        done();
        return;
      }
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD, null, PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_startAdminProvision_004
     * @tc.number SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_004
     * @tc.desc   test startAdminProvision method with invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_004", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType === '2in1') {
        done();
        return;
      }
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD, AppStorage.get("test"), INVALID_PARAMETERS);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_startAdminProvision_005
     * @tc.number SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_005
     * @tc.desc   test startAdminProvision method with invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_005", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType === '2in1') {
        done();
        return;
      }
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), INVALID_PARAMETERS_LOWER_THAN_UPPER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_startAdminProvision_006
     * @tc.number SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_006
     * @tc.desc   test startAdminProvision method with invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_006", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType === '2in1') {
        done();
        return;
      }
      let invalidActivateId: string = '';
      for (let i = 0; i < 257; i++) {
        invalidActivateId = invalidActivateId.concat('1');
      }
      let invalidParameterOverUpperBound: Record<string, string> = {
        "activateId" : invalidActivateId
      }
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), invalidParameterOverUpperBound);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_startAdminProvision_007
     * @tc.number SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_007
     * @tc.desc   test startAdminProvision method with invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_007", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType === '2in1') {
        done();
        return;
      }
      let invalidCustomizedInfo: string = '';
      for (let i = 0; i < 10241; i++) {
        invalidCustomizedInfo = invalidCustomizedInfo.concat('1');
      }
      let invalidParameterOverUpperBound: Record<string, string> = {
        "activateId" : "12345678901234567890123456789012",
        "customizedInfo" : invalidCustomizedInfo
      }
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), invalidParameterOverUpperBound);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })    

    /**
     * @tc.name   test_startAdminProvision_008
     * @tc.number SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_008
     * @tc.desc   test startAdminProvision method with invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_008", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType === '2in1') {
        done();
        return;
      }
      const otherWant: Want = {
        bundleName: "com.example.extensionzerotest",
        abilityName: "com.example.extensionzerotest.EnterpriseAdminAbility"
      };
      try {
        adminManager.startAdminProvision(otherWant, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_startAdminProvision_009
     * @tc.number SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_009
     * @tc.desc   test startAdminProvision method with invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_009", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType === '2in1') {
        done();
        return;
      }
      let parameter: Record<string, string> = {
        "activateId" : "12345678901234567890123456789012",
        "activateId2" : "12345678901234567890123456789012",
        "activateId3" : "12345678901234567890123456789012",
        "activateId4" : "12345678901234567890123456789012",
        "activateId5" : "12345678901234567890123456789012",
        "activateId6" : "12345678901234567890123456789012",
        "activateId7" : "12345678901234567890123456789012",
        "activateId8" : "12345678901234567890123456789012",
        "activateId9" : "12345678901234567890123456789012",
        "activateId10" : "12345678901234567890123456789012",
        "activateId11" : "12345678901234567890123456789012"
      }
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), parameter);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_startAdminProvision_010
     * @tc.number SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_010
     * @tc.desc   test startAdminProvision method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_010", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType === '2in1') {
        done();
        return;
      }
      const otherWant: Want = {
        bundleName: "com.example.extensionzerotest",
        abilityName: "com.example.extensionzerotest.MainAbility"
      };
      try {
        adminManager.startAdminProvision(otherWant, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_startAdminProvision_011
     * @tc.number SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_011
     * @tc.desc   test startAdminProvision method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_011", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType === '2in1') {
        done();
        return;
      }
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAdmins_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETADMINS_001
     * @tc.desc   test getadmins method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getAdmins_001", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let res: Array<Want> = await adminManager.getAdmins();
        expect(res.length == 1).assertTrue();
        expect(res[0].bundleName == SELFWANT.bundleName);
        expect(res[0].abilityName == SELFWANT.abilityName);
        expect(res[0].parameters?.adminType == 0);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getAdmins_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETADMINS_002
     * @tc.desc   test getadmins method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getAdmins_002", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let res: Array<Want> = await adminManager.getAdmins();
        expect(res.length == 1).assertTrue();
        expect(res[0].bundleName == SELFWANT.bundleName);
        expect(res[0].abilityName == SELFWANT.abilityName);
        expect(res[0].parameters?.adminType == 1);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAdmins_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETADMINS_003
     * @tc.desc   test getadmins method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getAdmins_003", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let res: Array<Want> = await adminManager.getAdmins();
        expect(res.length == 1).assertTrue();
        expect(res[0].bundleName == SELFWANT.bundleName);
        expect(res[0].abilityName == SELFWANT.abilityName);
        expect(res[0].parameters?.adminType == 2);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getAdmins_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETADMINS_004
     * @tc.desc   test getadmins method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getAdmins_004", Level.LEVEL0, async (done: Function) => {
      try {
        let res: Array<Want> = await adminManager.getAdmins();
        expect(res.length == 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_disableAdmin_001
     * @tc.number SUB_CUSTOMIZATION_EDM_DISABLEADMIN_001
     * @tc.desc   test disableAdmin method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_disableAdmin_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.disableAdmin(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200005).assertTrue();
      } 
      done();
    })

    /**
     * @tc.name   test_disableAdmin_002
     * @tc.number SUB_CUSTOMIZATION_EDM_DISABLEADMIN_002
     * @tc.desc   test disableAdmin method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_disableAdmin_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.disableAdmin(null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } 
      done();

    /**
     * @tc.name   test_disableAdmin_003
     * @tc.number SUB_CUSTOMIZATION_EDM_DISABLEADMIN_003
     * @tc.desc   test disableAdmin method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_disableAdmin_003", Level.LEVEL2, async (done: Function) => {
      try {
        let userId: number = 100;
        await adminManager.disableAdmin(SELFWANT, userId);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200005).assertTrue();
      } 
      done();
    })

    /**
     * @tc.name   test_disableAdmin_004
     * @tc.number SUB_CUSTOMIZATION_EDM_DISABLEADMIN_004
     * @tc.desc   test disableAdmin method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_disableAdmin_004", Level.LEVEL2, async (done: Function) => {
      try {
        let userId: number = 100;
        await adminManager.disableAdmin(null, userId);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } 
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ENABLEDEVICEADMIN_001
     * @tc.name      : test_enableDeviceAdmin_001
     * @tc.desc      : test enableDeviceAdmin method with a normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_enableDeviceAdmin_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        await adminManager.enableDeviceAdmin(OTHER_WANT);
        expect(false).assertTrue();
      } catch (error) {
        console.log('test_enableDeviceAdmin_001 error code: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ENABLEDEVICEADMIN_002
     * @tc.name      : test_enableDeviceAdmin_002
     * @tc.desc      : test enableDeviceAdmin method with enable a not exist admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_enableDeviceAdmin_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await adminManager.enableDeviceAdmin(NOT_EXIST_WANT);
        expect(false).assertTrue();
      } catch (error) {
        console.log('test_enableDeviceAdmin_002 error code: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200003).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ENABLEDEVICEADMIN_003
     * @tc.name      : test_enableDeviceAdmin_003
     * @tc.desc      : test enableDeviceAdmin method with enable a byod admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_enableDeviceAdmin_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await adminManager.enableAdmin(OTHER_WANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD)
        await adminManager.enableDeviceAdmin(OTHER_WANT);
        expect(false).assertTrue();
      } catch (error) {
        console.log('test_enableDeviceAdmin_003 error code: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200004).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(OTHER_WANT);
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ENABLEDEVICEADMIN_004
     * @tc.name      : test_enableDeviceAdmin_004
     * @tc.desc      : test enableDeviceAdmin method success
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_enableDeviceAdmin_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await adminManager.enableDeviceAdmin(OTHER_WANT);
        let isEnabled = await adminManager.isAdminEnabled(OTHER_WANT);
        expect(isEnabled).assertTrue();
        await adminManager.disableDeviceAdmin(OTHER_WANT);
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ENABLEDEVICEADMIN_005
     * @tc.name      : test_enableDeviceAdmin_005
     * @tc.desc      : test enableDeviceAdmin method with a not active admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_enableDeviceAdmin_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        await adminManager.disableAdmin(SELFWANT);
        await adminManager.enableDeviceAdmin(OTHER_WANT);
        expect(false).assertTrue();
      } catch (error) {
        console.log('test_enableDeviceAdmin_005 error code: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DISABLEDEVICEADMIN_001
     * @tc.name      : test_disableDeviceAdmin_001
     * @tc.desc      : test disableDeviceAdmin method with a normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_disableDeviceAdmin_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(OTHER_WANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        await adminManager.disableDeviceAdmin(OTHER_WANT);
        expect(false).assertTrue();
      } catch (error) {
        console.log('test_disableDeviceAdmin_001 error code: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(OTHER_WANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DISABLEDEVICEADMIN_002
     * @tc.name      : test_disableDeviceAdmin_002
     * @tc.desc      : test disableDeviceAdmin method with disable a super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_disableDeviceAdmin_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await adminManager.disableDeviceAdmin(NOT_EXIST_WANT);
        expect(false).assertTrue();
      } catch (error) {
        console.log('test_disableDeviceAdmin_002 error code: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200005).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DISABLEDEVICEADMIN_003
     * @tc.name      : test_disableDeviceAdmin_003
     * @tc.desc      : test disableDeviceAdmin method success
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_disableDeviceAdmin_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await adminManager.enableDeviceAdmin(OTHER_WANT);
        await adminManager.disableDeviceAdmin(OTHER_WANT);
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DISABLEDEVICEADMIN_004
     * @tc.name      : test_disableDeviceAdmin_004
     * @tc.desc      : test disableDeviceAdmin method with a not active admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_disableDeviceAdmin_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        await adminManager.enableAdmin(OTHER_WANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        await adminManager.disableDeviceAdmin(OTHER_WANT);
        expect(false).assertTrue();
      } catch (error) {
        console.log('test_disableDeviceAdmin_004 error code: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
        await adminManager.disableAdmin(OTHER_WANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DELEGATED_POLICIES_001
     * @tc.name      : test_set_delegated_policies_001
     * @tc.desc      : test set delegated policies method without admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_set_delegated_policies_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.setDelegatedPolicies(TEST_BUNDLENAME, DEFAULT_USER_ID, DELEGATED_POLICIES);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200009).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DELEGATED_POLICIES_002
     * @tc.name      : test_set_delegated_policies_002
     * @tc.desc      : test set delegated policies method when bundle is admin.
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_set_delegated_policies_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await adminManager.setDelegatedPolicies(SELFWANT.bundleName, DEFAULT_USER_ID, DELEGATED_POLICIES);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200009).assertTrue();
      }  finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
    })

    /**
     * @tc.name   enableDeviceAdmin_test_001
     * @tc.number enableDeviceAdmin_test_001
     * @tc.desc   enableDeviceAdmin with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("enableDeviceAdmin_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- enableDeviceAdmin_test_001  -------- START --------');
      try {
        adminManager.enableDeviceAdmin(null);
        console.info(' --- enableDeviceAdmin_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- enableDeviceAdmin_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- enableDeviceAdmin_test_001  -------- END --------');
    })


    /**
     * @tc.name   enableDeviceAdmin_test_002
     * @tc.number enableDeviceAdmin_test_002
     * @tc.desc   enableDeviceAdmin with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("enableDeviceAdmin_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- enableDeviceAdmin_test_002  -------- START --------');
      try {
        adminManager.enableDeviceAdmin(undefined);
        console.info(' --- enableDeviceAdmin_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- enableDeviceAdmin_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- enableDeviceAdmin_test_002  -------- END --------');
    })


    /**
     * @tc.name   disableDeviceAdmin_test_001
     * @tc.number disableDeviceAdmin_test_001
     * @tc.desc   disableDeviceAdmin with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disableDeviceAdmin_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disableDeviceAdmin_test_001  -------- START --------');
      try {
        adminManager.disableDeviceAdmin(null);
        console.info(' --- disableDeviceAdmin_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disableDeviceAdmin_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disableDeviceAdmin_test_001  -------- END --------');
    })


    /**
     * @tc.name   disableDeviceAdmin_test_002
     * @tc.number disableDeviceAdmin_test_002
     * @tc.desc   disableDeviceAdmin with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disableDeviceAdmin_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disableDeviceAdmin_test_002  -------- START --------');
      try {
        adminManager.disableDeviceAdmin(undefined);
        console.info(' --- disableDeviceAdmin_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disableDeviceAdmin_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disableDeviceAdmin_test_002  -------- END --------');
    })


    /**
     * @tc.name   disableAdmin_test_001
     * @tc.number disableAdmin_test_001
     * @tc.desc   disableAdmin with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disableAdmin_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disableAdmin_test_001  -------- START --------');
      try {
        adminManager.disableAdmin(null, 100);
        console.info(' --- disableAdmin_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disableAdmin_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disableAdmin_test_001  -------- END --------');
    })


    /**
     * @tc.name   disableAdmin_test_002
     * @tc.number disableAdmin_test_002
     * @tc.desc   disableAdmin with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disableAdmin_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disableAdmin_test_002  -------- START --------');
      try {
        adminManager.disableAdmin(undefined, 100);
        console.info(' --- disableAdmin_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disableAdmin_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disableAdmin_test_002  -------- END --------');
    })


    /**
     * @tc.name   disableAdmin_test_003
     * @tc.number disableAdmin_test_003
     * @tc.desc   disableAdmin with null parameter callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disableAdmin_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disableAdmin_test_003  -------- START --------');
      try {
        adminManager.disableAdmin(SELFWANT, null);
        console.info(' --- disableAdmin_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disableAdmin_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disableAdmin_test_003  -------- END --------');
    })


    /**
     * @tc.name   disableAdmin_test_004
     * @tc.number disableAdmin_test_004
     * @tc.desc   disableAdmin with undefined parameter callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disableAdmin_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disableAdmin_test_004  -------- START --------');
      try {
        adminManager.disableAdmin(SELFWANT, undefined);
        console.info(' --- disableAdmin_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disableAdmin_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disableAdmin_test_004  -------- END --------');
    })


    /**
     * @tc.name   subscribeManagedEventSync_test_001
     * @tc.number subscribeManagedEventSync_test_001
     * @tc.desc   subscribeManagedEventSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("subscribeManagedEventSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- subscribeManagedEventSync_test_001  -------- START --------');
      try {
        adminManager.subscribeManagedEventSync(null, SUBSCRIBE_EVENTS);
        console.info(' --- subscribeManagedEventSync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- subscribeManagedEventSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- subscribeManagedEventSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   subscribeManagedEventSync_test_002
     * @tc.number subscribeManagedEventSync_test_002
     * @tc.desc   subscribeManagedEventSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("subscribeManagedEventSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- subscribeManagedEventSync_test_002  -------- START --------');
      try {
        adminManager.subscribeManagedEventSync(undefined, SUBSCRIBE_EVENTS);
        console.info(' --- subscribeManagedEventSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- subscribeManagedEventSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- subscribeManagedEventSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   subscribeManagedEventSync_test_003
     * @tc.number subscribeManagedEventSync_test_003
     * @tc.desc   subscribeManagedEventSync with null parameter managedEvents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("subscribeManagedEventSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- subscribeManagedEventSync_test_003  -------- START --------');
      try {
        adminManager.subscribeManagedEventSync(SELFWANT, null);
        console.info(' --- subscribeManagedEventSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- subscribeManagedEventSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- subscribeManagedEventSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   subscribeManagedEventSync_test_004
     * @tc.number subscribeManagedEventSync_test_004
     * @tc.desc   subscribeManagedEventSync with undefined parameter managedEvents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("subscribeManagedEventSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- subscribeManagedEventSync_test_004  -------- START --------');
      try {
        adminManager.subscribeManagedEventSync(SELFWANT, undefined);
        console.info(' --- subscribeManagedEventSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- subscribeManagedEventSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- subscribeManagedEventSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   unsubscribeManagedEventSync_test_001
     * @tc.number unsubscribeManagedEventSync_test_001
     * @tc.desc   unsubscribeManagedEventSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("unsubscribeManagedEventSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- unsubscribeManagedEventSync_test_001  -------- START --------');
      try {
        adminManager.unsubscribeManagedEventSync(null, SUBSCRIBE_EVENTS);
        console.info(' --- unsubscribeManagedEventSync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- unsubscribeManagedEventSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- unsubscribeManagedEventSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   unsubscribeManagedEventSync_test_002
     * @tc.number unsubscribeManagedEventSync_test_002
     * @tc.desc   unsubscribeManagedEventSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("unsubscribeManagedEventSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- unsubscribeManagedEventSync_test_002  -------- START --------');
      try {
        adminManager.unsubscribeManagedEventSync(undefined, SUBSCRIBE_EVENTS);
        console.info(' --- unsubscribeManagedEventSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- unsubscribeManagedEventSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- unsubscribeManagedEventSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   unsubscribeManagedEventSync_test_003
     * @tc.number unsubscribeManagedEventSync_test_003
     * @tc.desc   unsubscribeManagedEventSync with null parameter managedEvents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("unsubscribeManagedEventSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- unsubscribeManagedEventSync_test_003  -------- START --------');
      try {
        adminManager.unsubscribeManagedEventSync(SELFWANT, null);
        console.info(' --- unsubscribeManagedEventSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- unsubscribeManagedEventSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- unsubscribeManagedEventSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   unsubscribeManagedEventSync_test_004
     * @tc.number unsubscribeManagedEventSync_test_004
     * @tc.desc   unsubscribeManagedEventSync with undefined parameter managedEvents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("unsubscribeManagedEventSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- unsubscribeManagedEventSync_test_004  -------- START --------');
      try {
        adminManager.unsubscribeManagedEventSync(SELFWANT, undefined);
        console.info(' --- unsubscribeManagedEventSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- unsubscribeManagedEventSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- unsubscribeManagedEventSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   setDelegatedPolicies_test_001
     * @tc.number setDelegatedPolicies_test_001
     * @tc.desc   setDelegatedPolicies with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDelegatedPolicies_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDelegatedPolicies_test_001  -------- START --------');
      try {
        adminManager.setDelegatedPolicies(null, BUNDLENAME1, DELEGATED_POLICIES);
        console.info(' --- setDelegatedPolicies_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDelegatedPolicies_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDelegatedPolicies_test_001  -------- END --------');
    })


    /**
     * @tc.name   setDelegatedPolicies_test_002
     * @tc.number setDelegatedPolicies_test_002
     * @tc.desc   setDelegatedPolicies with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDelegatedPolicies_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDelegatedPolicies_test_002  -------- START --------');
      try {
        adminManager.setDelegatedPolicies(undefined, BUNDLENAME1, DELEGATED_POLICIES);
        console.info(' --- setDelegatedPolicies_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDelegatedPolicies_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDelegatedPolicies_test_002  -------- END --------');
    })


    /**
     * @tc.name   setDelegatedPolicies_test_003
     * @tc.number setDelegatedPolicies_test_003
     * @tc.desc   setDelegatedPolicies with null parameter policies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDelegatedPolicies_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDelegatedPolicies_test_003  -------- START --------');
      try {
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, null);
        console.info(' --- setDelegatedPolicies_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDelegatedPolicies_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDelegatedPolicies_test_003  -------- END --------');
    })


    /**
     * @tc.name   setDelegatedPolicies_test_004
     * @tc.number setDelegatedPolicies_test_004
     * @tc.desc   setDelegatedPolicies with undefined parameter policies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDelegatedPolicies_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDelegatedPolicies_test_004  -------- START --------');
      try {
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, undefined);
        console.info(' --- setDelegatedPolicies_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDelegatedPolicies_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDelegatedPolicies_test_004  -------- END --------');
    })


    /**
     * @tc.name   getDelegatedPolicies_test_001
     * @tc.number getDelegatedPolicies_test_001
     * @tc.desc   getDelegatedPolicies with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDelegatedPolicies_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDelegatedPolicies_test_001  -------- START --------');
      try {
        adminManager.getDelegatedPolicies(null, "invalid");
        console.info(' --- getDelegatedPolicies_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDelegatedPolicies_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDelegatedPolicies_test_001  -------- END --------');
    })


    /**
     * @tc.name   getDelegatedPolicies_test_002
     * @tc.number getDelegatedPolicies_test_002
     * @tc.desc   getDelegatedPolicies with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDelegatedPolicies_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDelegatedPolicies_test_002  -------- START --------');
      try {
        adminManager.getDelegatedPolicies(undefined, "invalid");
        console.info(' --- getDelegatedPolicies_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDelegatedPolicies_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDelegatedPolicies_test_002  -------- END --------');
    })


    /**
     * @tc.name   isByodAdmin_test_001
     * @tc.number isByodAdmin_test_001
     * @tc.desc   isByodAdmin with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isByodAdmin_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isByodAdmin_test_001  -------- START --------');
      try {
        adminManager.isByodAdmin(null);
        console.info(' --- isByodAdmin_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isByodAdmin_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isByodAdmin_test_001  -------- END --------');
    })


    /**
     * @tc.name   isByodAdmin_test_002
     * @tc.number isByodAdmin_test_002
     * @tc.desc   isByodAdmin with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isByodAdmin_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isByodAdmin_test_002  -------- START --------');
      try {
        adminManager.isByodAdmin(undefined);
        console.info(' --- isByodAdmin_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isByodAdmin_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isByodAdmin_test_002  -------- END --------');
    })


    /**
     * @tc.name   getDelegatedBundleNames_test_001
     * @tc.number getDelegatedBundleNames_test_001
     * @tc.desc   getDelegatedBundleNames with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDelegatedBundleNames_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDelegatedBundleNames_test_001  -------- START --------');
      try {
        adminManager.getDelegatedBundleNames(null, DELEGATED_POLICIES[0]);
        console.info(' --- getDelegatedBundleNames_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDelegatedBundleNames_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDelegatedBundleNames_test_001  -------- END --------');
    })


    /**
     * @tc.name   getDelegatedBundleNames_test_002
     * @tc.number getDelegatedBundleNames_test_002
     * @tc.desc   getDelegatedBundleNames with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDelegatedBundleNames_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDelegatedBundleNames_test_002  -------- START --------');
      try {
        adminManager.getDelegatedBundleNames(undefined, DELEGATED_POLICIES[0]);
        console.info(' --- getDelegatedBundleNames_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDelegatedBundleNames_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDelegatedBundleNames_test_002  -------- END --------');
    })

    /**
     * @tc.name   enableDeviceAdmin_test_015
     * @tc.number enableDeviceAdmin_test_015
     * @tc.desc   enableDeviceAdmin with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("enableDeviceAdmin_test_015", Level.LEVEL2, async (done: Function) => {
      console.info(' --- enableDeviceAdmin_test_015  -------- START --------');
      try {
        adminManager.enableDeviceAdmin(null);
        console.info(' --- enableDeviceAdmin_test_015 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- enableDeviceAdmin_test_015 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- enableDeviceAdmin_test_015  -------- END --------');
    })


    /**
     * @tc.name   enableDeviceAdmin_test_016
     * @tc.number enableDeviceAdmin_test_016
     * @tc.desc   enableDeviceAdmin with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("enableDeviceAdmin_test_016", Level.LEVEL2, async (done: Function) => {
      console.info(' --- enableDeviceAdmin_test_016  -------- START --------');
      try {
        adminManager.enableDeviceAdmin(undefined);
        console.info(' --- enableDeviceAdmin_test_016 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- enableDeviceAdmin_test_016 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- enableDeviceAdmin_test_016  -------- END --------');
    })


    /**
     * @tc.name   disableDeviceAdmin_test_015
     * @tc.number disableDeviceAdmin_test_015
     * @tc.desc   disableDeviceAdmin with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disableDeviceAdmin_test_015", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disableDeviceAdmin_test_015  -------- START --------');
      try {
        adminManager.disableDeviceAdmin(null);
        console.info(' --- disableDeviceAdmin_test_015 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disableDeviceAdmin_test_015 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disableDeviceAdmin_test_015  -------- END --------');
    })


    /**
     * @tc.name   disableDeviceAdmin_test_016
     * @tc.number disableDeviceAdmin_test_016
     * @tc.desc   disableDeviceAdmin with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disableDeviceAdmin_test_016", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disableDeviceAdmin_test_016  -------- START --------');
      try {
        adminManager.disableDeviceAdmin(undefined);
        console.info(' --- disableDeviceAdmin_test_016 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disableDeviceAdmin_test_016 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disableDeviceAdmin_test_016  -------- END --------');
    })

    /**
     * @tc.name   isByodAdmin_test_015
     * @tc.number isByodAdmin_test_015
     * @tc.desc   isByodAdmin with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isByodAdmin_test_015", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isByodAdmin_test_015  -------- START --------');
      try {
        adminManager.isByodAdmin(null);
        console.info(' --- isByodAdmin_test_015 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isByodAdmin_test_015 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isByodAdmin_test_015  -------- END --------');
    })


    /**
     * @tc.name   isByodAdmin_test_016
     * @tc.number isByodAdmin_test_016
     * @tc.desc   isByodAdmin with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isByodAdmin_test_016", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isByodAdmin_test_016  -------- START --------');
      try {
        adminManager.isByodAdmin(undefined);
        console.info(' --- isByodAdmin_test_016 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isByodAdmin_test_016 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isByodAdmin_test_016  -------- END --------');
    })

    /**
     * @tc.name   subscribeManagedEventSync_test_004_1
     * @tc.number subscribeManagedEventSync_test_004_1
     * @tc.desc   subscribeManagedEventSync with [] parameter managedEvents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("subscribeManagedEventSync_test_004_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- subscribeManagedEventSync_test_004_1  -------- START --------');
      try {
        adminManager.subscribeManagedEventSync(SELFWANT, []);
        console.info(' --- subscribeManagedEventSync_test_004_1 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- subscribeManagedEventSync_test_004_1 error 9200001 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- subscribeManagedEventSync_test_004_1  -------- END --------');
    })


    /**
     * @tc.name   unsubscribeManagedEventSync_test_004_1
     * @tc.number unsubscribeManagedEventSync_test_004_1
     * @tc.desc   unsubscribeManagedEventSync with [] parameter managedEvents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("unsubscribeManagedEventSync_test_004_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- unsubscribeManagedEventSync_test_004_1  -------- START --------');
      try {
        adminManager.unsubscribeManagedEventSync(SELFWANT, []);
        console.info(' --- unsubscribeManagedEventSync_test_004_1 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- unsubscribeManagedEventSync_test_004_1 error 9200001 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- unsubscribeManagedEventSync_test_004_1  -------- END --------');
    })


    /**
     * @tc.name   test_setDelegatedPolicies_005_1
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_005_1
     * @tc.desc   test setDelegatedPolicies method with "" bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_setDelegatedPolicies_005_1", Level.LEVEL0, async (done: Function) => {
      console.info(' --- test_setDelegatedPolicies_005_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        adminManager.setDelegatedPolicies(SELFWANT, "", DELEGATED_POLICIES);
        console.info(' --- test_setDelegatedPolicies_005_1 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_setDelegatedPolicies_005_1 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200009).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      console.info(' --- test_setDelegatedPolicies_005_1  -------- END --------');
      done();
    })


    /**
     * @tc.name   test_setDelegatedPolicies_005_2
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_005_2
     * @tc.desc   test setDelegatedPolicies method with null bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_setDelegatedPolicies_005_2", Level.LEVEL0, async (done: Function) => {
      console.info(' --- test_setDelegatedPolicies_005_2  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        adminManager.setDelegatedPolicies(SELFWANT, null, DELEGATED_POLICIES);
        console.info(' --- test_setDelegatedPolicies_005_2 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_setDelegatedPolicies_005_2 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      console.info(' --- test_setDelegatedPolicies_005_2  -------- END --------');
      done();
    })


    /**
     * @tc.name   test_setDelegatedPolicies_005_3
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_005_3
     * @tc.desc   test setDelegatedPolicies method with null bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_setDelegatedPolicies_005_3", Level.LEVEL0, async (done: Function) => {
      console.info(' --- test_setDelegatedPolicies_005_3  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        adminManager.setDelegatedPolicies(SELFWANT, undefined, DELEGATED_POLICIES);
        console.info(' --- test_setDelegatedPolicies_005_3 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_setDelegatedPolicies_005_3 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      console.info(' --- test_setDelegatedPolicies_005_3  -------- END --------');
      done();
    })

    /**
     * @tc.name   getDelegatedPolicies_test_002_1
     * @tc.number getDelegatedPolicies_test_002_1
     * @tc.desc   getDelegatedPolicies with "" parameter bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDelegatedPolicies_test_002_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDelegatedPolicies_test_002_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        adminManager.getDelegatedPolicies(SELFWANT, '');
        console.info(' --- getDelegatedPolicies_test_002_1 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDelegatedPolicies_test_002_1 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDelegatedPolicies_test_002_1  -------- END --------');
    })


    /**
     * @tc.name   getDelegatedPolicies_test_002_2
     * @tc.number getDelegatedPolicies_test_002_2
     * @tc.desc   getDelegatedPolicies with null parameter bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDelegatedPolicies_test_002_2", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDelegatedPolicies_test_002_2  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        adminManager.getDelegatedPolicies(SELFWANT, null);
        console.info(' --- getDelegatedPolicies_test_002_2 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDelegatedPolicies_test_002_2 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDelegatedPolicies_test_002_2  -------- END --------');
    })


    /**
     * @tc.name   getDelegatedPolicies_test_002_3
     * @tc.number getDelegatedPolicies_test_002_3
     * @tc.desc   getDelegatedPolicies with undefined parameter bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDelegatedPolicies_test_002_3", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDelegatedPolicies_test_002_3  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        adminManager.getDelegatedPolicies(SELFWANT, undefined);
        console.info(' --- getDelegatedPolicies_test_002_3 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDelegatedPolicies_test_002_3 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDelegatedPolicies_test_002_3  -------- END --------');
    })


    /**
     * @tc.name   getDelegatedBundleNames_test_002_1
     * @tc.number getDelegatedBundleNames_test_002_1
     * @tc.desc   getDelegatedBundleNames with "" parameter policies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDelegatedBundleNames_test_002_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDelegatedBundleNames_test_002_1  -------- START --------');
      try {
        adminManager.getDelegatedBundleNames(SELFWANT, "");
        console.info(' --- getDelegatedBundleNames_test_002_1 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDelegatedBundleNames_test_002_1 error 9200001 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- getDelegatedBundleNames_test_002_1  -------- END --------');
    })


    /**
     * @tc.name   getDelegatedBundleNames_test_002_2
     * @tc.number getDelegatedBundleNames_test_002_2
     * @tc.desc   getDelegatedBundleNames with null parameter policies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDelegatedBundleNames_test_002_2", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDelegatedBundleNames_test_002_2  -------- START --------');
      try {
        adminManager.getDelegatedBundleNames(SELFWANT, null);
        console.info(' --- getDelegatedBundleNames_test_002_2 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDelegatedBundleNames_test_002_2 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDelegatedBundleNames_test_002_2  -------- END --------');
    })


    /**
     * @tc.name   getDelegatedBundleNames_test_002_3
     * @tc.number getDelegatedBundleNames_test_002_3
     * @tc.desc   getDelegatedBundleNames with undefined parameter policies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDelegatedBundleNames_test_002_3", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDelegatedBundleNames_test_002_3  -------- START --------');
      try {
        adminManager.getDelegatedBundleNames(SELFWANT, undefined);
        console.info(' --- getDelegatedBundleNames_test_002_3 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDelegatedBundleNames_test_002_3 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDelegatedBundleNames_test_002_3  -------- END --------');
    })


    /**
     * @tc.name   test_startAdminProvision_011_1
     * @tc.number test_startAdminProvision_011_1
     * @tc.desc   startAdminProvision with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_011_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_startAdminProvision_011_1  -------- START --------');
      try {
        let ret = adminManager.startAdminProvision(null, adminManager.AdminType.ADMIN_TYPE_BYOD,
          AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        console.info(' --- test_startAdminProvision_011_1 error is expected, but it done.');
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- test_startAdminProvision_011_1 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_startAdminProvision_011_1  -------- END --------');
    })


    /**
     * @tc.name   test_startAdminProvision_011_2
     * @tc.number test_startAdminProvision_011_2
     * @tc.desc   startAdminProvision with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_011_2", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_startAdminProvision_011_2  -------- START --------');
      try {
        let ret = adminManager.startAdminProvision(undefined, adminManager.AdminType.ADMIN_TYPE_BYOD,
          AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        console.info(' --- test_startAdminProvision_011_2 error is expected, but it done.');
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- test_startAdminProvision_011_2 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_startAdminProvision_011_2  -------- END --------');
    })


    /**
     * @tc.name   test_startAdminProvision_011_3
     * @tc.number test_startAdminProvision_011_3
     * @tc.desc   startAdminProvision with undefined parameter Context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_011_3", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_startAdminProvision_011_3  -------- START --------');
      try {
        let ret = adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
          undefined, PARAMETERS_LOWER_BOUND);
        console.info(' --- test_startAdminProvision_011_3 error is expected, but it done.');
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- test_startAdminProvision_011_3 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_startAdminProvision_011_3  -------- END --------');
    })


    /**
     * @tc.name   test_startAdminProvision_011_4
     * @tc.number test_startAdminProvision_011_4
     * @tc.desc   startAdminProvision with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_011_4", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_startAdminProvision_011_4  -------- START --------');
      try {
        let ret = adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
          AppStorage.get("test"), null);
        console.info(' --- test_startAdminProvision_011_4 error is expected, but it done.');
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- test_startAdminProvision_011_4 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_startAdminProvision_011_4  -------- END --------');
    })


    /**
     * @tc.name   test_startAdminProvision_011_5
     * @tc.number test_startAdminProvision_011_5
     * @tc.desc   startAdminProvision with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_startAdminProvision_011_5", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_startAdminProvision_011_5  -------- START --------');
      try {
        let ret = adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
          AppStorage.get("test"), undefined);
        console.info(' --- test_startAdminProvision_011_5 error is expected, but it done.');
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- test_startAdminProvision_011_5 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_startAdminProvision_011_5  -------- END --------');
    })

    /**
     * @tc.name   test_enableSelfDeviceAdmin_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ENABLESELFDEVICEADMIN_0100
     * @tc.desc   test enableSelfDeviceAdmin method with null admin parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_enableSelfDeviceAdmin_0100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_enableSelfDeviceAdmin_0100  -------- START --------');
      try {
        await adminManager.enableSelfDeviceAdmin(null, "testCredential");
        console.info(' --- test_enableSelfDeviceAdmin_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_enableSelfDeviceAdmin_0100 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
      console.info(' --- test_enableSelfDeviceAdmin_0100  -------- END --------');
    })

    /**
     * @tc.name   test_enableSelfDeviceAdmin_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ENABLESELFDEVICEADMIN_0200
     * @tc.desc   test enableSelfDeviceAdmin method with undefined admin parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_enableSelfDeviceAdmin_0200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_enableSelfDeviceAdmin_0200  -------- START --------');
      try {
        await adminManager.enableSelfDeviceAdmin(undefined, "testCredential");
        console.info(' --- test_enableSelfDeviceAdmin_0200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_enableSelfDeviceAdmin_0200 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
      console.info(' --- test_enableSelfDeviceAdmin_0200  -------- END --------');
    })

    /**
     * @tc.name   test_enableSelfDeviceAdmin_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ENABLESELFDEVICEADMIN_0300
     * @tc.desc   test enableSelfDeviceAdmin method with null credential parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_enableSelfDeviceAdmin_0300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_enableSelfDeviceAdmin_0300  -------- START --------');
      try {
        await adminManager.enableSelfDeviceAdmin(SELFWANT, null);
        console.info(' --- test_enableSelfDeviceAdmin_0300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_enableSelfDeviceAdmin_0300 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
      console.info(' --- test_enableSelfDeviceAdmin_0300  -------- END --------');
    })

    /**
     * @tc.name   test_enableSelfDeviceAdmin_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ENABLESELFDEVICEADMIN_0400
     * @tc.desc   test enableSelfDeviceAdmin method with undefined credential parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_enableSelfDeviceAdmin_0400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_enableSelfDeviceAdmin_0400  -------- START --------');
      try {
        await adminManager.enableSelfDeviceAdmin(SELFWANT, undefined);
        console.info(' --- test_enableSelfDeviceAdmin_0400 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_enableSelfDeviceAdmin_0400 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
      console.info(' --- test_enableSelfDeviceAdmin_0400  -------- END --------');
    })

    /**
     * @tc.name   test_enableSelfDeviceAdmin_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ENABLESELFDEVICEADMIN_0500
     * @tc.desc   test enableSelfDeviceAdmin method with expired credential
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_enableSelfDeviceAdmin_0500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_enableSelfDeviceAdmin_0500  -------- START --------');
      try {
        await adminManager.enableSelfDeviceAdmin(SELFWANT, "expiredCredential");
        console.info(' --- test_enableSelfDeviceAdmin_0500 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_enableSelfDeviceAdmin_0500 error code: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200018).assertTrue();
        }
      }
      done();
      console.info(' --- test_enableSelfDeviceAdmin_0500  -------- END --------');
    })
  })
}