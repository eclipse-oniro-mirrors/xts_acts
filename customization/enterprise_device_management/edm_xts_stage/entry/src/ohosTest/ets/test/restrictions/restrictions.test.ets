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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT, DEFAULT_USER_ID, APP_IDS_1 } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import restrictions from '@ohos.enterprise.restrictions';

const LABEL_BLUETOOTH = "bluetooth";
const LABEL_MODIFY_DATETIME = "modifyDateTime";
const LABEL_PRINTER = "printer";
const LABEL_HDC = "hdc";
const LABEL_MIC = "microphone";
const LABEL_FINGER_PRINT = "fingerprint";
const LABEL_USB = "usb";
const LABEL_WIFI = "wifi";
const LABEL_CAMERA = "camera";
const LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT = "snapshotSkip";
const LABEL_RESET_FACTORY = "resetFactory";
const LABEL_TETHERING = "tethering";
const LABEL_NEAR_LINK = "nearLink";
const LABEL_MTP_CLIENT = "mtpClient";
const LABEL_MTP_SERVER = "mtpServer";

export default function restrictionsTest() {
  describe('restrictions_test', () => {
    testSetDisallowedPolicy();
    testGetDisallowedPolicy();
    testSetDisallowedForAccountPolicy();
    testGetDisallowedForAccountPolicy();
    testAddDisallowedListForAccountPolicy();
    testRemoveDisallowedListForAccountPolicy();
    testGetDisallowedListForAccountPolicy();
  })
}

function testSetDisallowedPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0100
   * @tc.name      : test_set_disallowed_policy_0100
   * @tc.desc      : test restrictions setDisallowedPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0101
   * @tc.name      : test_set_disallowed_policy_0101
   * @tc.desc      : test restrictions setDisallowedPolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0102
   * @tc.name      : test_set_disallowed_policy_0102
   * @tc.desc      : test restrictions setDisallowedPolicy with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(INVALID_WANT, LABEL_BLUETOOTH, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });


  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0103
   * @tc.name      : test_set_disallowed_policy_0103
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0104
   * @tc.name      : test_set_disallowed_policy_0104
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MODIFY_DATETIME, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MODIFY_DATETIME)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0105
   * @tc.name      : test_set_disallowed_policy_0105
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_PRINTER, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_PRINTER)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0106
   * @tc.name      : test_set_disallowed_policy_0106
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_HDC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_HDC)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0107
   * @tc.name      : test_set_disallowed_policy_0107
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0107", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MIC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MIC)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0108
   * @tc.name      : test_set_disallowed_policy_0108
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0108", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_FINGER_PRINT, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_FINGER_PRINT)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });  

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0109
   * @tc.name      : test_set_disallowed_policy_0109
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0109", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_USB)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  }); 

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0110
   * @tc.name      : test_set_disallowed_policy_0110
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0110", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_WIFI)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0111
   * @tc.name      : test_set_disallowed_policy_0111
   * @tc.desc      : test restrictions setDisallowedPolicy with unsupported label
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0111", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, '123', false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0112
   * @tc.name      : test_set_disallowed_policy_0112
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
   it("test_set_disallowed_policy_0112", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_CAMERA, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_CAMERA)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0113
   * @tc.name      : test_set_disallowed_policy_0113
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0113", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_RESET_FACTORY, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_RESET_FACTORY)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0114
   * @tc.name      : test_set_disallowed_policy_0114
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
   it("test_set_disallowed_policy_0114", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MIC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MIC)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0115
   * @tc.name      : test_set_disallowed_policy_0115
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0115", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_RESET_FACTORY, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_RESET_FACTORY)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0116
   * @tc.name      : test_set_disallowed_policy_0116
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0116", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_WIFI)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0117
   * @tc.name      : test_set_disallowed_policy_0117
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0117", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_USB)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0118
   * @tc.name      : test_set_disallowed_policy_0118
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0118", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_TETHERING, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_TETHERING)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0119
   * @tc.name      : test_set_disallowed_policy_0119
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0119", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_HDC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_HDC)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0120
   * @tc.name      : test_set_disallowed_policy_0120
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0120", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_NEAR_LINK, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_NEAR_LINK)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0121
   * @tc.name      : test_set_disallowed_policy_0121
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0121", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_CAMERA, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_CAMERA)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0122
   * @tc.name      : test_set_disallowed_policy_0122
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0122", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0123
   * @tc.name      : test_set_disallowed_policy_0123
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0123", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MTP_CLIENT, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MTP_CLIENT)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0124
   * @tc.name      : test_set_disallowed_policy_0124
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0123", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MTP_SERVER, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MTP_SERVER)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetDisallowedPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0100
   * @tc.name      : test_get_disallowed_policy_0100
   * @tc.desc      : test restrictions getDisallowedPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0101
   * @tc.name      : test_get_disallowed_policy_0101
   * @tc.desc      : test restrictions getDisallowedPolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0102
   * @tc.name      : test_get_disallowed_policy_0102
   * @tc.desc      : test restrictions getDisallowedPolicy with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicy(INVALID_WANT, LABEL_BLUETOOTH);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0103
   * @tc.name      : test_get_disallowed_policy_0103
   * @tc.desc      : test restrictions getDisallowedPolicy with unsupported label
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, '123');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetDisallowedForAccountPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0100
   * @tc.name      : test_set_disallowed_policy_for_account_0100
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0200
   * @tc.name      : test_set_disallowed_policy_for_account_0200
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0300
   * @tc.name      : test_set_disallowed_policy_for_account_0300
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with empty admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(INVALID_WANT, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0400
   * @tc.name      : test_set_disallowed_policy_for_account_0400
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with empty feature
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, null, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0500
   * @tc.name      : test_set_disallowed_policy_for_account_0500
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with empty disallow
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0600
   * @tc.name      : test_set_disallowed_policy_for_account_0600
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with empty accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0700
   * @tc.name      : test_set_disallowed_policy_for_account_0700
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with empty accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, DEFAULT_USER_ID);
      expect(res).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, false, DEFAULT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0800
   * @tc.name      : test_set_disallowed_policy_for_account_0800
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_FINGER_PRINT, true);
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_FINGER_PRINT, false);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetDisallowedForAccountPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0100
   * @tc.name      : test_get_disallowed_policy_for_account_0100
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0200
   * @tc.name      : test_get_disallowed_policy_for_account_0200
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0300
   * @tc.name      : test_get_disallowed_policy_for_account_0300
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount with empty admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(INVALID_WANT, LABEL_FINGER_PRINT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0400
   * @tc.name      : test_get_disallowed_policy_for_account_0400
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount with empty feature
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0500
   * @tc.name      : test_get_disallowed_policy_for_account_0500
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount with empty accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testAddDisallowedListForAccountPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0100
   * @tc.name      : test_add_disallowed_list_for_account_0100
   * @tc.desc      : test restrictions addDisallowedListForAccount without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_disallowed_list_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0200
   * @tc.name      : test_add_disallowed_list_for_account_0200
   * @tc.desc      : test restrictions addDisallowedListForAccount with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_disallowed_list_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0300
   * @tc.name      : test_add_disallowed_list_for_account_0300
   * @tc.desc      : test restrictions addDisallowedListForAccount with empty admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_disallowed_list_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(INVALID_WANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0400
   * @tc.name      : test_add_disallowed_list_for_account_0400
   * @tc.desc      : test restrictions addDisallowedListForAccount with empty feature
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_disallowed_list_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, null, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0500
   * @tc.name      : test_add_disallowed_list_for_account_0500
   * @tc.desc      : test restrictions addDisallowedListForAccount with empty disallow
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_disallowed_list_for_account_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0600
   * @tc.name      : test_add_disallowed_list_for_account_0600
   * @tc.desc      : test restrictions addDisallowedListForAccount with empty accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_disallowed_list_for_account_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0700
   * @tc.name      : test_add_disallowed_list_for_account_0700
   * @tc.desc      : test restrictions addDisallowedListForAccount add and get success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_disallowed_list_for_account_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      let result: Array<string> = restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(result.length === APP_IDS_1.length).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0800
   * @tc.name      : test_add_disallowed_list_for_account_0800
   * @tc.desc      : test restrictions addDisallowedListForAccount with over max limit
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_disallowed_list_for_account_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nameList:string[] = [];
    for (let index = 0; index < 1001; index++) {
      nameList.push("bundle.name" + index);
    }
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, nameList, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0900
   * @tc.name      : test_add_disallowed_list_for_account_0900
   * @tc.desc      : test restrictions addDisallowedListForAccount with max limit
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_disallowed_list_for_account_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nameList:string[] = [];
    for (let index = 0; index < 1000; index++) {
      nameList.push("bundle.name" + index);
    }
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, nameList, DEFAULT_USER_ID);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testRemoveDisallowedListForAccountPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0100
   * @tc.name      : test_remove_disallowed_list_for_account_0100
   * @tc.desc      : test restrictions removeDisallowedListForAccount without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_disallowed_list_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0200
   * @tc.name      : test_remove_disallowed_list_for_account_0200
   * @tc.desc      : test restrictions removeDisallowedListForAccount with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_disallowed_list_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0300
   * @tc.name      : test_remove_disallowed_list_for_account_0300
   * @tc.desc      : test restrictions removeDisallowedListForAccount with empty admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_disallowed_list_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.removeDisallowedListForAccount(INVALID_WANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0400
   * @tc.name      : test_remove_disallowed_list_for_account_0400
   * @tc.desc      : test restrictions removeDisallowedListForAccount with empty feature
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_disallowed_list_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, null, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0500
   * @tc.name      : test_remove_disallowed_list_for_account_0500
   * @tc.desc      : test restrictions removeDisallowedListForAccount with empty bundleName
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_disallowed_list_for_account_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0600
   * @tc.name      : test_remove_disallowed_list_for_account_0600
   * @tc.desc      : test restrictions removeDisallowedListForAccount with empty accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_disallowed_list_for_account_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0700
   * @tc.name      : test_remove_disallowed_list_for_account_0700
   * @tc.desc      : test restrictions removeDisallowedListForAccount remove success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_disallowed_list_for_account_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      let result: Array<string> = restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(result.length === APP_IDS_1.length).assertTrue();
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      let resultAfterRemove: Array<string> = restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(resultAfterRemove.length === 0).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetDisallowedListForAccountPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0100
   * @tc.name      : test_get_disallowed_list_for_account_0100
   * @tc.desc      : test restrictions getDisallowedListForAccount without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_list_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0200
   * @tc.name      : test_get_disallowed_list_for_account_0200
   * @tc.desc      : test restrictions getDisallowedListForAccount with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_list_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0300
   * @tc.name      : test_get_disallowed_list_for_account_0300
   * @tc.desc      : test restrictions getDisallowedListForAccount with empty admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_list_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedListForAccount(INVALID_WANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0400
   * @tc.name      : test_get_disallowed_list_for_account_0400
   * @tc.desc      : test restrictions getDisallowedListForAccount with empty feature
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_list_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedListForAccount(SELFWANT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0600
   * @tc.name      : test_get_disallowed_list_for_account_0600
   * @tc.desc      : test restrictions getDisallowedListForAccount with empty accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_list_for_account_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}