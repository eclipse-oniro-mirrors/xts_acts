/**
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium";
import settings from '@ohos.settings';
import { BusinessError } from '@ohos.base';
import uitest from '@ohos.UiTest';
import { mContext } from '../testability/TestAbility';
import { deviceInfo } from '@kit.BasicServicesKit';
import CommonFunc from './Common';

interface myObj {
  aa: string
}

interface myObj2 {
  "code": number
}

const SETTINGS_PARAM_INVALID_CODE: number = 16900010;
const deviceType = deviceInfo.deviceType;

function isDevicePhone(): boolean {
  return deviceType === 'phone';
}

function isDeviceTablet(): boolean {
  return deviceType === 'tablet';
}

function isDevicePC(): boolean {
  return deviceType === '2in1';
}

function isDeviceSupportInputMethod(): boolean {
  return isDevicePhone() || isDeviceTablet();
}

function isDeviceSupportOpenNetWork(): boolean {
  return isDevicePhone() || isDeviceTablet() || isDevicePC();
}

export default function settingUiJsunit() {
  beforeAll(() => {
    console.info("settings op beforeAll start");
    console.info("settings op beforeAll end");
  })

  describe('appInfoTest', () => {
    console.log("************* settings op Test start*************");

    /**
     * @tc.name   settings_set_value_sync_no_domain
     * @tc.number settings_set_value_sync_no_domain
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_no_domain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("[settings_set_value_sync_no_domain] start ");
          let result = settings.setValueSync(mContext, 'testkey', 'testvalue');
          console.info("[settings_set_value_sync_no_domain] result= " + result);
          expect(result).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_no_domain] error = " + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_sync_domain_system
     * @tc.number settings_set_value_sync_domain_system
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_domain_system', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("[settings_set_value_sync_domain_system] start ");
          let result =
            settings.setValueSync(mContext, 'testkey', 'testvalue', settings.domainName.USER_PROPERTY);
          console.info("[settings_set_value_sync_domain_system] result= " + result);
          expect(result).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_domain_system] error = " + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_callback_no_domain
     * @tc.number settings_set_value_callback_no_domain
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_callback_no_domain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("[settings_set_value_callback_no_domain] start ");
          settings.setValue(mContext, 'testkey', 'testvalue', (result) => {
            console.info("[settings_set_value_callback_no_domain] result= " + result);
            expect(result === undefined).assertTrue();
            done();
          });
        } catch (err) {
          console.error("[settings_set_value_callback_no_domain] error = " + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_no_domain
     * @tc.number settings_set_value_no_domain
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_no_domain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("[settings_set_value_no_domain] start ");
          let result = await settings.setValue(mContext, 'testkey', 'testvalue');
          console.info("[settings_set_value_no_domain] result= " + result);
          expect(result).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_set_value_no_domain] error = " + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_domain_system
     * @tc.number settings_set_value_domain_system
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_domain_system', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("[settings_set_value_domain_system] start ");
          let result =
            await settings.setValue(mContext, 'testkey', 'testvalue', settings.domainName.USER_PROPERTY);
          console.info("[settings_set_value_domain_system] result= " + result);
          expect(result).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_set_value_domain_system] error = " + err);
          expect().assertFail();
          done();
        }
      });
  })
}
