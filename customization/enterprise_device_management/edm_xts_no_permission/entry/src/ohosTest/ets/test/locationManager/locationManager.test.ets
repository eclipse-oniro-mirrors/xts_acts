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
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE } from '../commom.ets';

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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_LOCATION_POLICY_JS_0001
   * @tc.name      : test_set_location_policy_0001
   * @tc.desc      : test locationManager setLocationPolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_location_policy_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      locationManager.setLocationPolicy(SELFWANT, locationManager.LocationPolicy.DISALLOW_LOCATION_SERVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetLocationPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_LOCATION_POLICY_JS_0001
   * @tc.name      : test_get_location_policy_0001
   * @tc.desc      : test locationManager getLocationPolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_location_policy_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      locationManager.getLocationPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}
