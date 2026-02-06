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
import { ENTINFO1, SELFHAPNAME, SELFWANT } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import deviceSettings from '@ohos.enterprise.deviceSettings';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

const ITEM_SCREEN_OFF: string = 'screenOff';
const ITEM_POWER_POLICY: string = 'powerPolicy';
const ITEM_DATE_TIME: string = 'dateTime';

export default function deviceSettingsTest() {
  describe('deviceSettings_test', () => {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0100
     * @tc.name      : test_device_settings_get_value_0100
     * @tc.desc      : test deviceSettings getValue without admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_get_value_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.getValue(SELFWANT, ITEM_SCREEN_OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0200
     * @tc.name      : test_device_settings_get_value_0200
     * @tc.desc      : test deviceSettings getValue with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_get_value_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.getValue(SELFWANT, ITEM_SCREEN_OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0300
     * @tc.name      : test_device_settings_get_value_0300
     * @tc.desc      : test deviceSettings getValue unsupported item
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_get_value_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.getValue(SELFWANT, '123');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0400
     * @tc.name      : test_device_settings_get_value_0400
     * @tc.desc      : test deviceSettings getValue, item = screenOff
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_get_value_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: string = deviceSettings.getValue(SELFWANT, ITEM_SCREEN_OFF);
        expect(result).not().assertUndefined();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0500
     * @tc.name      : test_device_settings_get_value_0500
     * @tc.desc      : test deviceSettings getValue, item = powerPolicy
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_get_value_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: string = deviceSettings.getValue(SELFWANT, ITEM_POWER_POLICY);
        expect(JSON.parse(result)).not().assertUndefined();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0600
     * @tc.name      : test_device_settings_get_value_0600
     * @tc.desc      : test deviceSettings getValue with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_get_value_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.getValue(null, ITEM_SCREEN_OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0100
     * @tc.name      : test_device_settings_set_value_0100
     * @tc.desc      : test deviceSettings setValue without admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.setValue(SELFWANT, ITEM_SCREEN_OFF, '30000');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0200
     * @tc.name      : test_device_settings_set_value_0200
     * @tc.desc      : test deviceSettings setValue with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_SCREEN_OFF, '30000');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0300
     * @tc.name      : test_device_settings_set_value_0300
     * @tc.desc      : test deviceSettings setValue unsupported item
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, '123', '30000');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0400
     * @tc.name      : test_device_settings_set_value_0400
     * @tc.desc      : test deviceSettings setValue, item = screenOff
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_SCREEN_OFF, '30000');
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0500
     * @tc.name      : test_device_settings_set_value_0500
     * @tc.desc      : test deviceSettings setValue, item = screenOff, time overflow
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_SCREEN_OFF, '1234567891023687999710');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0600
     * @tc.name      : test_device_settings_set_value_0600
     * @tc.desc      : test deviceSettings setValue, item = dateTime
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_DATE_TIME, new Date().getTime().toString());
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0700
     * @tc.name      : test_device_settings_set_value_0700
     * @tc.desc      : test deviceSettings setValue, item = dateTime, time overflow
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_DATE_TIME, '12345678910236879997100');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0800
     * @tc.name      : test_device_settings_set_value_0800
     * @tc.desc      : test deviceSettings setValue, item = powerPolicy
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let powerPolicy: deviceSettings.PowerPolicy = {
          powerPolicyAction: deviceSettings.PowerPolicyAction.AUTO_SUSPEND,
          delayTime: 30000
        }
        let powerScene: deviceSettings.PowerScene = deviceSettings.PowerScene.TIME_OUT;
        let value: string = JSON.stringify({
          powerScene: powerScene,
          powerPolicy: powerPolicy
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0900
     * @tc.name      : test_device_settings_set_value_0900
     * @tc.desc      : test deviceSettings setValue, item = powerPolicy, error powerPolicy undefined
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let powerScene: deviceSettings.PowerScene = deviceSettings.PowerScene.TIME_OUT;
        let value: string = JSON.stringify({
          powerScene: powerScene,
          powerPolicy: undefined
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1000
     * @tc.name      : test_device_settings_set_value_1000
     * @tc.desc      : test deviceSettings setValue, item = powerPolicy, empty value
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_1000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, '');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1100
     * @tc.name      : test_device_settings_set_value_1100
     * @tc.desc      : test deviceSettings setValue, item = powerPolicy, error value
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_1100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, JSON.stringify({
          test: 1,
          testKey: '123'
        }));
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1200
     * @tc.name      : test_device_settings_set_value_1200
     * @tc.desc      : test deviceSettings setValue, item = powerPolicy, lost powerScene
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_1200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let powerPolicy: deviceSettings.PowerPolicy = {
          powerPolicyAction: deviceSettings.PowerPolicyAction.AUTO_SUSPEND,
          delayTime: 30000
        }
        let value: string = JSON.stringify({
          powerPolicy: powerPolicy
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1300
     * @tc.name      : test_device_settings_set_value_1300
     * @tc.desc      : test deviceSettings setValue, item = powerPolicy, lost powerPolicy
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_1300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let powerScene: deviceSettings.PowerScene = deviceSettings.PowerScene.TIME_OUT;
        let value: string = JSON.stringify({
          powerScene: powerScene,
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1400
     * @tc.name      : test_device_settings_set_value_1400
     * @tc.desc      : test deviceSettings setValue, item = powerPolicy, error powerScene
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_1400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let value: string = JSON.stringify({
          powerScene: '0',
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1500
     * @tc.name      : test_device_settings_set_value_1500
     * @tc.desc      : test deviceSettings setValue, item = powerPolicy, error powerPolicy
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_1500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let value: string = JSON.stringify({
          powerPolicy: '123456'
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1600
     * @tc.name      : test_device_settings_set_value_1600
     * @tc.desc      : test deviceSettings setValue, item = powerPolicy, error powerPolicy and powerScene
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_1600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let value: string = JSON.stringify({
          powerPolicy: '123456',
          powerScene: '0'
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_HOME_WALL_PAPER_JS_0100
     * @tc.name      : test_device_settings_set_home_wall_paper_0100
     * @tc.desc      : test deviceSettings set home wall paper with out admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_home_wall_paper_0100", Level.LEVEL2, async (done: Function) => {
      let filePath: string = getContext().resourceDir + '/wallpaper.png';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setHomeWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 9200001).assertTrue();
      });
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_HOME_WALL_PAPER_JS_0200
     * @tc.name      : test_device_settings_set_home_wall_paper_0200
     * @tc.desc      : test deviceSettings set home wall paper with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_home_wall_paper_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      let filePath: string = getContext().resourceDir + '/wallpaper.png';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setHomeWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 9200002).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_HOME_WALL_PAPER_JS_0300
     * @tc.name      : test_device_settings_set_home_wall_paper_0300
     * @tc.desc      : test deviceSettings set home wall paper with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_home_wall_paper_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let filePath: string = getContext().resourceDir + '/101mb.bmp';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setHomeWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 9200012).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_UNLOCK_WALL_PAPER_JS_0100
     * @tc.name      : test_device_settings_set_unlock_wall_paper_0100
     * @tc.desc      : test deviceSettings set unlock wall paper with out admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_unlock_wall_paper_0100", Level.LEVEL2, async (done: Function) => {
      let filePath: string = getContext().resourceDir + '/wallpaper.png';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setUnlockWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 9200001).assertTrue();
      });
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_UNLOCK_WALL_PAPER_JS_0200
     * @tc.name      : test_device_settings_set_unlock_wall_paper_0200
     * @tc.desc      : test deviceSettings set unlock wall paper with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_unlock_wall_paper_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      let filePath: string = getContext().resourceDir + '/wallpaper.png';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setUnlockWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 9200002).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_UNLOCK_WALL_PAPER_JS_0300
     * @tc.name      : test_device_settings_set_unlock_wall_paper_0300
     * @tc.desc      : test deviceSettings set unlock wall paper with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_unlock_wall_paper_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let filePath: string = getContext().resourceDir + '/101mb.bmp';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setUnlockWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 9200012).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });
  })
}