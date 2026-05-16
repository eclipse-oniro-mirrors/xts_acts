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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT } from '../commom.ets';

import locationManager from '@ohos.enterprise.locationManager';
import adminManager from '@ohos.enterprise.adminManager';

export default function locationManagerTest() {

  describe('locationManager_test', () => {
    testSetLocationPolicy();
    testGetLocationPolicy();
  })
}

function testSetLocationPolicy() {
  /**
   * @tc.name   test_set_location_policy_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCATION_POLICY_JS_0001
   * @tc.desc   test locationManager setLocationPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_location_policy_0001", Level.LEVEL2, async (done: Function) => {
    try {
      locationManager.setLocationPolicy(SELFWANT, locationManager.LocationPolicy.DEFAULT_LOCATION_SERVICE);
      expect(false).assertTrue();
      let resAfter = locationManager.getLocationPolicy(SELFWANT);
      expect(resAfter == locationManager.LocationPolicy.DEFAULT_LOCATION_SERVICE).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_location_policy_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCATION_POLICY_JS_0002
   * @tc.desc   test locationManager setLocationPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_location_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      locationManager.setLocationPolicy(SELFWANT, locationManager.LocationPolicy.DISALLOW_LOCATION_SERVICE);
      expect(false).assertTrue();
      let resAfter = locationManager.getLocationPolicy(SELFWANT);
      expect(resAfter == locationManager.LocationPolicy.DISALLOW_LOCATION_SERVICE).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_location_policy_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCATION_POLICY_JS_0003
   * @tc.desc   test locationManager setLocationPolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_location_policy_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      locationManager.setLocationPolicy(SELFWANT, locationManager.LocationPolicy.FORCE_OPEN_LOCATION_SERVICE);
      let getPolicy: locationManager.LocationPolicy = locationManager.getLocationPolicy(SELFWANT);
      expect(getPolicy == locationManager.LocationPolicy.FORCE_OPEN_LOCATION_SERVICE).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_location_policy_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCATION_POLICY_JS_0004
   * @tc.desc   test locationManager setLocationPolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_location_policy_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      locationManager.setLocationPolicy(null, locationManager.LocationPolicy.DISALLOW_LOCATION_SERVICE);
      expect(false).assertTrue();
      let resAfter = locationManager.getLocationPolicy(SELFWANT);
      expect(resAfter == locationManager.LocationPolicy.DISALLOW_LOCATION_SERVICE).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetLocationPolicy() {
  /**
   * @tc.name   test_get_location_policy_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_LOCATION_POLICY_JS_0001
   * @tc.desc   test locationManager getLocationPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_location_policy_0001", Level.LEVEL2, async (done: Function) => {
    try {
      locationManager.getLocationPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_location_policy_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_LOCATION_POLICY_JS_0002
   * @tc.desc   test locationManager getLocationPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_location_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      locationManager.getLocationPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_location_policy_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_LOCATION_POLICY_JS_0003
   * @tc.desc   test locationManager getLocationPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_location_policy_0003", Level.LEVEL2, async (done: Function) => {
    try {
      locationManager.getLocationPolicy(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });
}
