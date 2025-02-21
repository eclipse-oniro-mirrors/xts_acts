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
import { describe, expect, it } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME, SUBSCRIBE_EVENTS, SUBSCRIBE_INVALID_EVENTS,
  BUNDLENAME1 } from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';

const DELEGATED_POLICIES: Array<string> = [ "set_browser_policies" ];

export default function adminManagerTest() {
  describe('adminManager_test', function () {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_001
     * @tc.name      : test_subscribeManagedEventSync_001
     * @tc.desc      : test subscribeManagedEventSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_subscribeManagedEventSync_001", 0, async function (done) {
      try {
        adminManager.subscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_002
     * @tc.name      : test_subscribeManagedEventSync_002
     * @tc.desc      : test subscribeManagedEventSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_subscribeManagedEventSync_002", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_003
     * @tc.name      : test_subscribeManagedEventSync_003
     * @tc.desc      : test subscribeManagedEventSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_subscribeManagedEventSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.subscribeManagedEventSync(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_004
     * @tc.name      : test_subscribeManagedEventSync_004
     * @tc.desc      : test subscribeManagedEventSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_subscribeManagedEventSync_004", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.subscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_001
     * @tc.name      : test_unsubscribeManagedEventSync_001
     * @tc.desc      : test unsubscribeManagedEventSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_001", 0, async function (done) {
      try {
        adminManager.unsubscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_002
     * @tc.name      : test_subscribeManagedEventSync_002
     * @tc.desc      : test subscribeManagedEventSync method with Active admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_002", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_003
     * @tc.name      : test_subscribeManagedEventSync_003
     * @tc.desc      : test subscribeManagedEventSync method with Active admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.unsubscribeManagedEventSync(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_004
     * @tc.name      : test_subscribeManagedEventSync_004
     * @tc.desc      : test subscribeManagedEventSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_004", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.unsubscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_001
     * @tc.name      : test_setDelegatedPolicies_001
     * @tc.desc      : test setDelegatedPolicies method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setDelegatedPolicies_001", 0, async (done: Function) => {
      try {
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, DELEGATED_POLICIES);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_002
     * @tc.name      : test_setDelegatedPolicies_002
     * @tc.desc      : test setDelegatedPolicies method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setDelegatedPolicies_002", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_003
     * @tc.name      : test_setDelegatedPolicies_003
     * @tc.desc      : test setDelegatedPolicies method with invalid bundleName
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setDelegatedPolicies_003", 0, async (done: Function) => {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_004
     * @tc.name      : test_setDelegatedPolicies_004
     * @tc.desc      : test setDelegatedPolicies method with invalid policy
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setDelegatedPolicies_004", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let invalidPolicy: Array<string> = ["invalid_policy"];
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, invalidPolicy);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_005
     * @tc.name      : test_setDelegatedPolicies_005
     * @tc.desc      : test setDelegatedPolicies method with invalid bundleName
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setDelegatedPolicies_005", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, DELEGATED_POLICIES);
        let policies: Array<string> = adminManager.getDelegatedPolicies(SELFWANT, BUNDLENAME1);
        expect(policies.length == 1 && policies[0] == DELEGATED_POLICIES[0]).assertTrue();
        let bundles: Array<string> = adminManager.getDelegatedBundleNames(SELFWANT, DELEGATED_POLICIES[0]);
        expect(bundles.length == 1 && bundles[0] == BUNDLENAME1).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDPOLICIES_001
     * @tc.name      : test_getDelegatedPolicies_001
     * @tc.desc      : test getDelegatedPolicies method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedPolicies_001", 0, async (done: Function) => {
      try {
        adminManager.getDelegatedPolicies(SELFWANT, BUNDLENAME1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDPOLICIES_002
     * @tc.name      : test_getDelegatedPolicies_002
     * @tc.desc      : test getDelegatedPolicies method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedPolicies_002", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDPOLICIES_003
     * @tc.name      : test_getDelegatedPolicies_003
     * @tc.desc      : test getDelegatedPolicies method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedPolicies_003", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.getDelegatedPolicies(SELFWANT, "invalid");
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDBUNDLENAMES_001
     * @tc.name      : test_getDelegatedBundleNames_001
     * @tc.desc      : test getDelegatedBundleNames method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedBundleNames_001", 0, async (done: Function) => {
      try {
        adminManager.getDelegatedBundleNames(SELFWANT, DELEGATED_POLICIES[0]);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDBUNDLENAMES_002
     * @tc.name      : test_getDelegatedBundleNames_002
     * @tc.desc      : test getDelegatedBundleNames method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedBundleNames_002", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDBUNDLENAMES_002
     * @tc.name      : test_getDelegatedBundleNames_002
     * @tc.desc      : test getDelegatedBundleNames method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedBundleNames_003", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.getDelegatedBundleNames(SELFWANT, "invalid");
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
  })
}