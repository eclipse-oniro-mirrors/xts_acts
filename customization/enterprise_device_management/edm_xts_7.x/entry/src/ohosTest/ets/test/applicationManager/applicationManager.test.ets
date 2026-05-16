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

import { describe, beforeAll, expect, it, Level } from '@ohos/hypium';
import {
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  APP_IDS_200,
  APP_IDS_201,
  APP_IDS_AND_IDENTIFIER_1,
  DEFAULT_APP_INDEX,
  INVALID_APP_INDEX,
  INVALID_WANT,
  DEFAULT_USER_ID,
  INVALID_USER_ID,
  AUTOSTARTAPP1,
  AUTOSTARTAPP2,
  TEST_BUNDLENAME,
  bundleNamesInit,
  BUNDLE_NAME_200,
  BUNDLE_NAME_201
} from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import applicationManager from '@ohos.enterprise.applicationManager';
import Want from '@ohos.app.ability.Want';
import sysDeviceInfo from '@ohos.deviceInfo';
import common from '@ohos.enterprise.common';
import { connection, statistics } from '@kit.NetworkKit';
import restrictions from '@ohos.enterprise.restrictions';

const APP_IDS_1: Array<string> = [
  "test_appid_1",
  "test_appid_2",
  "test_appid_3",
];
const LABEL_NOTIFICATION = "notification";

let BUNDLE_NAME_500: Array<string> = new Array<string>(500);
let BUNDLE_NAME_501: Array<string> = new Array<string>(501);

for (let i = 0; i < BUNDLE_NAME_501.length; i++) {
  BUNDLE_NAME_501[i] = String(i);
  if (i < BUNDLE_NAME_500.length) {
    BUNDLE_NAME_500[i] = String(i);
  }
}

export default function applicationManagerTest() {
  describe('applicationManager_test', () => {
    beforeAll((done: Function) => {
      bundleNamesInit();
      done();
    })

    /**
     * @tc.name   test_addHideLauncherIcon_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0100
     * @tc.desc   test addHideLauncherIcon without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200001).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0200
     * @tc.desc   test addHideLauncherIcon with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0300
     * @tc.desc   test addHideLauncherIcon with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(null, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0400
     * @tc.desc   test addHideLauncherIcon with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(undefined, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0500
     * @tc.desc   test addHideLauncherIcon with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(INVALID_WANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0600
     * @tc.desc   test addHideLauncherIcon with null bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0700
     * @tc.desc   test addHideLauncherIcon with undefined bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, undefined);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0800
     * @tc.desc   test addHideLauncherIcon with empty bundleNames array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, []);
        let bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 0).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0900
     * @tc.desc   test addHideLauncherIcon with bundleNames exceed limit(501 elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, BUNDLE_NAME_501);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200012).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_1000
     * @tc.desc   test addHideLauncherIcon success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_addHideLauncherIcon_1000", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        let bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 1).assertTrue();
        applicationManager.removeHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 0).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_1100
     * @tc.desc   test addHideLauncherIcon with bundleNames within limit(500 elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_1100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, BUNDLE_NAME_500);
        let bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 500).assertTrue();
        applicationManager.removeHideLauncherIcon(SELFWANT, BUNDLE_NAME_500);
        bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 0).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0100
     * @tc.desc   test removeHideLauncherIcon without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200001).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0200
     * @tc.desc   test removeHideLauncherIcon with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0300
     * @tc.desc   test removeHideLauncherIcon with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(null, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0400
     * @tc.desc   test removeHideLauncherIcon with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(undefined, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0500
     * @tc.desc   test removeHideLauncherIcon with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(INVALID_WANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0600
     * @tc.desc   test removeHideLauncherIcon with null bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0700
     * @tc.desc   test removeHideLauncherIcon with undefined bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, undefined);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0800
     * @tc.desc   test removeHideLauncherIcon with empty bundleNames array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, []);
        let bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 0).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0900
     * @tc.desc   test removeHideLauncherIcon with bundleNames exceed limit(501 elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, BUNDLE_NAME_501);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200012).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0100
     * @tc.desc   test getHideLauncherIcon without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getHideLauncherIcon_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.getHideLauncherIcon(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200001).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0200
     * @tc.desc   test getHideLauncherIcon with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getHideLauncherIcon_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        applicationManager.getHideLauncherIcon(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0300
     * @tc.desc   test getHideLauncherIcon with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getHideLauncherIcon_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getHideLauncherIcon(undefined);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0400
     * @tc.desc   test getHideLauncherIcon with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getHideLauncherIcon_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getHideLauncherIcon(INVALID_WANT);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0500
     * @tc.desc   test getHideLauncherIcon success with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getHideLauncherIcon_0500", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: Array<string> = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(Array.isArray(result)).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0600
     * @tc.desc   test getHideLauncherIcon success with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getHideLauncherIcon_0600", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: Array<string> = applicationManager.getHideLauncherIcon(null);
        expect(Array.isArray(result)).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_0100
     * @tc.desc   test getApplicationWindowStates without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.getApplicationWindowStates(SELFWANT, TEST_BUNDLENAME, DEFAULT_APP_INDEX);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200001).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_0200
     * @tc.desc   test getApplicationWindowStates with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        applicationManager.getApplicationWindowStates(SELFWANT, TEST_BUNDLENAME, DEFAULT_APP_INDEX);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_0300
     * @tc.desc   test getApplicationWindowStates with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getApplicationWindowStates(null, TEST_BUNDLENAME, DEFAULT_APP_INDEX);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_0400
     * @tc.desc   test getApplicationWindowStates with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getApplicationWindowStates(undefined, TEST_BUNDLENAME, DEFAULT_APP_INDEX);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_0500
     * @tc.desc   test getApplicationWindowStates with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getApplicationWindowStates(INVALID_WANT, TEST_BUNDLENAME, DEFAULT_APP_INDEX);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_0600
     * @tc.desc   test getApplicationWindowStates with null bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getApplicationWindowStates(SELFWANT, null, DEFAULT_APP_INDEX);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_0700
     * @tc.desc   test getApplicationWindowStates with undefined bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getApplicationWindowStates(SELFWANT, undefined, DEFAULT_APP_INDEX);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_0800
     * @tc.desc   test getApplicationWindowStates with empty bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getApplicationWindowStates(SELFWANT, '', DEFAULT_APP_INDEX);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_0900
     * @tc.desc   test getApplicationWindowStates with null appIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getApplicationWindowStates(SELFWANT, TEST_BUNDLENAME, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_1000
     * @tc.desc   test getApplicationWindowStates with undefined appIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_1000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getApplicationWindowStates(SELFWANT, TEST_BUNDLENAME, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_1100
     * @tc.desc   test getApplicationWindowStates with invalid appIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_1100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: Array<applicationManager.WindowStateInfo> =
          applicationManager.getApplicationWindowStates(SELFWANT, TEST_BUNDLENAME, INVALID_APP_INDEX);
        expect(result.length).assertEqual(0);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getApplicationWindowStates_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_JS_1200
     * @tc.desc   test getApplicationWindowStates success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getApplicationWindowStates_1200", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: Array<applicationManager.WindowStateInfo> =
          applicationManager.getApplicationWindowStates(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX);
        expect(result.length).assertEqual(1);
        let windowStateInfo: applicationManager.WindowStateInfo = result[0];
        let state: applicationManager.WindowState = windowStateInfo.state;
        expect(windowStateInfo.windowId > 0).assertTrue();
        expect(windowStateInfo.isOnDock).assertFalse();
        expect(windowStateInfo.name.length > 0).assertTrue();
        if (state === applicationManager.WindowState.DISCONNECT) {
          expect(Number(state)).assertEqual(0);
        } else if (state === applicationManager.WindowState.CONNECT) {
          expect(Number(state)).assertEqual(1);
        } else if (state === applicationManager.WindowState.FOREGROUND) {
          expect(Number(state)).assertEqual(2);
        } else if (state === applicationManager.WindowState.ACTIVE) {
          expect(Number(state)).assertEqual(3);
        } else if (state === applicationManager.WindowState.INACTIVE) {
          expect(Number(state)).assertEqual(4);
        } else if (state === applicationManager.WindowState.BACKGROUND) {
          expect(Number(state)).assertEqual(5);
        } else {
          expect(false).assertTrue();
        }
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });


    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_0100
     * @tc.desc   test addAllowedDistributeAbilityConnBundles without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200001).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_0200
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_0300
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(null, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_0400
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(undefined, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_0500
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(INVALID_WANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_0600
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with null appIdentifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, null, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_0700
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with undefined appIdentifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, undefined, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_0800
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with appIdentifiers exceed limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_201, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_1000
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with appIdentifiers empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_1000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, [], applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        let result: Array<string> = applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(result.length === 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_1100
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with appIdentifiers element null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_1100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, [null], applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_1200
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with null serviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_1200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, null, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_1300
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with undefined serviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_1300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, undefined, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_1400
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with invalid serviceType enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_1400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, 1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_1500
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_1500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_1600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_1600
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_1600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_1700
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_1700
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with invalid accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_1700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, -1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_1800
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_1800
     * @tc.desc   test addAllowedDistributeAbilityConnBundles without disabling distributedTransmissionOutgoing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_1800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9201043).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_1900
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_JS_1900
     * @tc.desc   test addAllowedDistributeAbilityConnBundles success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_addAllowedDistributeAbilityConnBundles_1900", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicyForAccount(SELFWANT, 'distributedTransmissionOutgoing', true, DEFAULT_USER_ID);
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        let result: Array<string> = applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(result.length === APP_IDS_1.length).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });


    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_0100
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200001).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_0200
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_0300
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(null, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_0400
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(undefined, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_0500
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(INVALID_WANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_0600
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with null appIdentifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, null, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_0700
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with undefined appIdentifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, undefined, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_0800
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with appIdentifiers element null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, [null], applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_0900
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with null serviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, null, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_1000
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with undefined serviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_1000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, undefined, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_1100
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with invalid serviceType enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_1100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, 1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_1200
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_1200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_1300
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_1300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_1400
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with invalid accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_1400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, -1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_1500
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_removeAllowedDistributeAbilityConnBundles_1500", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicyForAccount(SELFWANT, 'distributedTransmissionOutgoing', true, DEFAULT_USER_ID);
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        let result: Array<string> = applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(result.length === 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_1600
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_JS_1600
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with appIdentifiers empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_1600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, [], applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        let result: Array<string> = applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(result.length === 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_0100
     * @tc.desc   test getAllowedDistributeAbilityConnBundles without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedDistributeAbilityConnBundles_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200001).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_0200
     * @tc.desc   test getAllowedDistributeAbilityConnBundles with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedDistributeAbilityConnBundles_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_0300
     * @tc.desc   test getAllowedDistributeAbilityConnBundles with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedDistributeAbilityConnBundles_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getAllowedDistributeAbilityConnBundles(undefined, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_0400
     * @tc.desc   test getAllowedDistributeAbilityConnBundles with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedDistributeAbilityConnBundles_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getAllowedDistributeAbilityConnBundles(INVALID_WANT, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_0500
     * @tc.desc   test getAllowedDistributeAbilityConnBundles with null serviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedDistributeAbilityConnBundles_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, null, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_0600
     * @tc.desc   test getAllowedDistributeAbilityConnBundles with undefined serviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedDistributeAbilityConnBundles_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, undefined, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_0700
     * @tc.desc   test getAllowedDistributeAbilityConnBundles with invalid serviceType enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedDistributeAbilityConnBundles_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, 1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_0800
     * @tc.desc   test getAllowedDistributeAbilityConnBundles with null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedDistributeAbilityConnBundles_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_0900
     * @tc.desc   test getAllowedDistributeAbilityConnBundles with undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedDistributeAbilityConnBundles_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_1000
     * @tc.desc   test getAllowedDistributeAbilityConnBundles with invalid accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedDistributeAbilityConnBundles_1000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, -1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_1100
     * @tc.desc   test getAllowedDistributeAbilityConnBundles success with admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getAllowedDistributeAbilityConnBundles_1100", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: Array<string> = applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(Array.isArray(result)).assertTrue();
        expect(result.length ===0).assertTrue();
        restrictions.setDisallowedPolicyForAccount(SELFWANT, 'distributedTransmissionOutgoing', true, DEFAULT_USER_ID);
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        result = applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(result.length === APP_IDS_1.length).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_JS_1200
     * @tc.desc   test getAllowedDistributeAbilityConnBundles success with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getAllowedDistributeAbilityConnBundles_1200", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: Array<string> = applicationManager.getAllowedDistributeAbilityConnBundles(null, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(Array.isArray(result)).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

  });
}
