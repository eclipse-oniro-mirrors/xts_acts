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
     * @tc.desc      : test deviceSettings getValue with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_get_value_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.getValue(SELFWANT, ITEM_SCREEN_OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0100
     * @tc.name      : test_device_settings_set_value_0100
     * @tc.desc      : test deviceSettings setValue with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_device_settings_set_value_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_SCREEN_OFF, '30000');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_HOME_WALL_PAPER_JS_0200
     * @tc.name      : test_device_settings_set_home_wall_paper_0200
     * @tc.desc      : test deviceSettings set home wall paper
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
        expect(error.code == 201).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_UNLOCK_WALL_PAPER_JS_0200
     * @tc.name      : test_device_settings_set_unlock_wall_paper_0200
     * @tc.desc      : test deviceSettings set unlock wall paper
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
        expect(error.code == 201).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });
  })
}