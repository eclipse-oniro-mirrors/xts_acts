
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import settings from '@ohos.settings'
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { BusinessError } from '@ohos.base';
import deviceInfo from '@ohos.deviceInfo';

let abilityContext: common.UIAbilityContext | undefined;

const SETTINGS_PARAM_INVALID_CODE:number = 16900010;
const deviceType = deviceInfo.deviceType;

function isDevicePhone(): boolean {
  return deviceType === 'phone';
}

function isDeviceTablet(): boolean {
  return deviceType === 'tablet';
}

function isDeviceSupportInputMethod(): boolean {
  return isDevicePhone() || isDeviceTablet();
}

export default function settingUiJsunit() {
  beforeAll(() => {
    console.info("beforeAll start");
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    console.info("beforeAll end abilityDelegator");
    abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.settings.static")
    await Utils.msSleep(2000);
    abilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
    console.info("beforeAll end");
  })

  describe('appInfoTest', ()=> {
    console.log("************* settings Test start*************");

    /**
     * @tc.name   settings_uri_test_static_static_001
     * @tc.number settings_uri_test_static_static_001
     * @tc.desc   check settings uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_uri_test_static_static_001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name = 'settings.screen.test';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_static_001] uri is: " + uri);
      let uri2 = settings.getUriSync(name);
      console.info("[settings_uri_test_static_001] uri2 is: " + uri2);
      expect(uri).assertEqual(uri2);
      done();
    });

    /**
     * @tc.name   settings_uri_test_static_static_002
     * @tc.number ssettings_uri_test_static_static_002
     * @tc.desc   check settings uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_uri_test_static_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name = '';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_static_002] uri is: " + uri);
      expect(uri).assertEqual('datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=')
      done();
    });

    /**
     * @tc.name   settings_uri_test_static_static_004
     * @tc.number settings_uri_test_static_static_004
     * @tc.desc   check settings value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_uri_test_static_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name = 'settings.screen.brightness';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_static_static_004] uri is: " + uri);
      expect(uri).assertEqual('datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=settings.screen.brightness')
      done();
    });

    /**
     * @tc.name   settings_get_value_static_005
     * @tc.number settings_get_value_static_005
     * @tc.desc   check getValueSync value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let name = 'settings.screen.brightness20';
      let value = settings.getValueSync(abilityContext!, name, "test getValueSync");
      console.info("[settings_get_value_005] value is: " + value);
      expect(value).assertEqual("test getValueSync");
      done();
    });

    /**
     * @tc.name   settings_get_value_static_119
     * @tc.number settings_get_value_static_119
     * @tc.desc   check getValueSync value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_119',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let name = 'settings.screen.brightness119';//关键字
      let defaultValue = '323445.00';//值
      let domainName = 'system';
      try{
        let value = settings.getValueSync(abilityContext!, name, defaultValue, domainName);
        console.info("[settings_set_value_119] value is: " + value);
        expect(value).assertEqual(defaultValue);
        done();
      } catch (err) {
        console.error("[settings_set_value_119] error = " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   settings_get_value_static_033
     * @tc.number settings_get_value_static_033
     * @tc.desc   check getValue value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_033',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let uri = 'datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=';
      let name = 'settings.screen.brightness33';
      let value = 'brightness33'
      try{
        settings.setValueSync(abilityContext!, name, value);
        settings.getValue(abilityContext!, name, (err, ret) => {
          console.info("[settings_get_value_033] value is: " + ret);
          expect().assertFail();
        })
        done();
      } catch(err){
        console.info("[settings_get_value_033] error is: " + String(err));
        expect(err.message).assertEqual("Permission denied");
        done();
      }
    });

    /**
     * @tc.name   settings_get_value_static_034
     * @tc.number settings_get_value_static_034
     * @tc.desc   check getValue value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_034',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let uri = 'datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=';
      let name = 'settings.screen.brightness34';
      let value = 'brightness34'

      try{
        settings.setValueSync(abilityContext!, name, value);
        settings.getValue(abilityContext!, name).then(ret =>{
          console.info("[settings_get_value_034] value is: " + ret);
          expect().assertFail();
        })
        done();
      } catch(err){
        console.info("[settings_get_value_034] error is: " + String(err));
        expect(err.message).assertEqual("Permission denied");
        done();
      }
    });

    /**
     * @tc.name   settings_set_value_127
     * @tc.number settings_set_value_127
     * @tc.desc   check set value sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name = 'settings.screen.brightness127';//关键字
      let defaultValue = '323445.00';//值
      let domainName = settings.domainName.DEVICE_SHARED;
      try{
        let value = settings.setValueSync(abilityContext!, name, defaultValue, domainName);
        expect().assertFail();
        done();
      }catch (err) {
        console.error("[settings_set_value_127] error = " + err);
        expect(err.message).assertEqual("Permission denied");
        done();
      }
    });

    /**
     * @tc.name   settings_get_value_static_035
     * @tc.number settings_get_value_static_035
     * @tc.desc   check getValue value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_035',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let name = 'settings.screen.brightness35';//关键字
      let value = 'brightness35';//值
      let domainName = 'secure';
      try{
        settings.setValue(abilityContext!, name, value, domainName)
          .then((data)=>{
            console.info("[settings_get_value_35] value is:" + data);
            settings.getValue(abilityContext!, name, domainName).then(ret => {
              console.info("[settings_get_value_35] value is:" + ret);
              expect().assertFail();
              done();
            })
          })
          .catch((err: Error)=>{
            console.info("[settings_get_value_35] 1252 error is:" + err);
            expect(err.message).assertEqual("Permission denied");
            done();
          })
        done();
      }catch (err) {
        console.error("[settings_set_value_35] error = " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   settings_set_value_113
     * @tc.number settings_set_value_113
     * @tc.desc   check setValueSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_113',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let name = 'settings.screen.brightness113';//关键字
      let value = 'brightness113'//值
      try{
        settings.setValue(abilityContext!, name, value)
          .then((data)=>{
            expect().assertFail();
            done();
          })
          .catch((err: Error)=>{
            console.info("[settings_set_value_113] error is:" + err);
            expect(err.message).assertEqual("Permission denied");
            done();
          })
      }catch(err){
        console.info("[settings_set_value_113] error is:" + err);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   settings_get_value_static_037
     * @tc.number settings_get_value_static_037
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_037',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.date.date_format"
      expect(str).assertEqual(settings.date.DATE_FORMAT);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_038
     * @tc.number settings_get_value_static_038
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_038',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.date.time_format"
      expect(str).assertEqual(settings.date.TIME_FORMAT);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_039
     * @tc.number settings_get_value_static_039
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_039',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.date.auto_gain_time"
      expect(str).assertEqual(settings.date.AUTO_GAIN_TIME);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_040
     * @tc.number settings_get_value_static_040
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_040',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.date.auto_gain_time_zone"
      expect(str).assertEqual(settings.date.AUTO_GAIN_TIME_ZONE);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_041
     * @tc.number settings_get_value_static_041
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_041',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="font_scale"
      expect(str).assertEqual(settings.display.FONT_SCALE);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_042
     * @tc.number settings_get_value_static_042
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_042',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.display.screen_brightness_status"
      expect(str).assertEqual(settings.display.SCREEN_BRIGHTNESS_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_043
     * @tc.number settings_get_value_static_043
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_043',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.display.auto_screen_brightness"
      expect(str).assertEqual(settings.display.AUTO_SCREEN_BRIGHTNESS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_044
     * @tc.number settings_get_value_static_044
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_044',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let mode = 1
      expect(mode).assertEqual(settings.display.AUTO_SCREEN_BRIGHTNESS_MODE);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_045
     * @tc.number settings_get_value_static_045
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_045',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let mode = 0
      expect(mode).assertEqual(settings.display.MANUAL_SCREEN_BRIGHTNESS_MODE);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_046
     * @tc.number settings_get_value_static_046
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_046',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.display.screen_off_timeout"
      expect(str).assertEqual(settings.display.SCREEN_OFF_TIMEOUT);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_047
     * @tc.number settings_get_value_static_047
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_047',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.display.default_screen_rotation"
      expect(str).assertEqual(settings.display.DEFAULT_SCREEN_ROTATION);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_048
     * @tc.number settings_get_value_static_048
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_048',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.display.animator_duration_scale"
      expect(str).assertEqual(settings.display.ANIMATOR_DURATION_SCALE);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_049
     * @tc.number settings_get_value_static_049
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_049',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.display.transition_animation_scale"
      expect(str).assertEqual(settings.display.TRANSITION_ANIMATION_SCALE);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_050
     * @tc.number settings_get_value_static_050
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_050',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.display.window_animation_scale"
      expect(str).assertEqual(settings.display.WINDOW_ANIMATION_SCALE);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_051
     * @tc.number settings_get_value_static_051
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_051',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.display.display_inversion_status"
      expect(str).assertEqual(settings.display.DISPLAY_INVERSION_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_052
     * @tc.number settings_get_value_static_052
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_052',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.setup_wizard_finished"
      expect(str).assertEqual(settings.general.SETUP_WIZARD_FINISHED);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_053
     * @tc.number settings_get_value_static_053
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_053',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.end_button_action"
      expect(str).assertEqual(settings.general.END_BUTTON_ACTION);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_054
     * @tc.number settings_get_value_static_054
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_054',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.airplane_mode_status"
      expect(str).assertEqual(settings.general.AIRPLANE_MODE_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_055
     * @tc.number settings_get_value_static_055
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_055',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.accelerometer_rotation_status"
      expect(str).assertEqual(settings.general.ACCELEROMETER_ROTATION_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_056
     * @tc.number settings_get_value_static_056
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_056',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.device_provision_status"
      expect(str).assertEqual(settings.general.DEVICE_PROVISION_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_057
     * @tc.number settings_get_value_static_057
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_057',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.hdc_status"
      expect(str).assertEqual(settings.general.HDC_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_058
     * @tc.number settings_get_value_static_058
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_058',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.boot_counting"
      expect(str).assertEqual(settings.general.BOOT_COUNTING);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_059
     * @tc.number settings_get_value_static_059
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_059',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.contact_metadata_sync_status"
      expect(str).assertEqual(settings.general.CONTACT_METADATA_SYNC_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_060
     * @tc.number settings_get_value_static_060
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_060',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.development_settings_status"
      expect(str).assertEqual(settings.general.DEVELOPMENT_SETTINGS_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_061
     * @tc.number settings_get_value_static_061
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_061',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.device_name"
      expect(str).assertEqual(settings.general.DEVICE_NAME);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_062
     * @tc.number settings_get_value_static_062
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_062',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.usb_storage_status"
      expect(str).assertEqual(settings.general.USB_STORAGE_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_063
     * @tc.number settings_get_value_static_063
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_063',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.debugger_waiting"
      expect(str).assertEqual(settings.general.DEBUGGER_WAITING);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_064
     * @tc.number settings_get_value_static_064
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_064',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.debug_app_package"
      expect(str).assertEqual(settings.general.DEBUG_APP_PACKAGE);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_065
     * @tc.number settings_get_value_static_065
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_065',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.accessibility_status"
      expect(str).assertEqual(settings.general.ACCESSIBILITY_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_066
     * @tc.number settings_get_value_static_066
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_066',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.activated_accessibility_services"
      expect(str).assertEqual(settings.general.ACTIVATED_ACCESSIBILITY_SERVICES);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_067
     * @tc.number settings_get_value_static_067
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_067',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.geolocation_origins_allowed"
      expect(str).assertEqual(settings.general.GEOLOCATION_ORIGINS_ALLOWED);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_068
     * @tc.number settings_get_value_static_068
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_068',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.skip_use_hints"
      expect(str).assertEqual(settings.general.SKIP_USE_HINTS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_069
     * @tc.number settings_get_value_static_069
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_069',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.touch_exploration_status"
      expect(str).assertEqual(settings.general.TOUCH_EXPLORATION_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_070
     * @tc.number settings_get_value_static_070
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_070',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.input.default_input_method"
      expect(str).assertEqual(settings.input.DEFAULT_INPUT_METHOD);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_071
     * @tc.number settings_get_value_static_071
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_071',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.input.activated_input_method_submode"
      let expectValue:string=settings.input.ACTIVATED_INPUT_METHOD_SUB_MODE;
      expect(str).assertEqual(expectValue);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_072
     * @tc.number settings_get_value_static_072
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_072',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.input.activated_input_methods"
      expect(str).assertEqual(settings.input.ACTIVATED_INPUT_METHODS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_073
     * @tc.number settings_get_value_static_073
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_073',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.input.selector_visibility_for_input_method"
      expect(str).assertEqual(settings.input.SELECTOR_VISIBILITY_FOR_INPUT_METHOD);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_074
     * @tc.number settings_get_value_static_074
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_074',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.input.auto_caps_text_input"
      expect(str).assertEqual(settings.input.AUTO_CAPS_TEXT_INPUT);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_075
     * @tc.number settings_get_value_static_075
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_075',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.input.auto_punctuate_text_input"
      expect(str).assertEqual(settings.input.AUTO_PUNCTUATE_TEXT_INPUT);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_076
     * @tc.number settings_get_value_static_076
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_076',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.input.auto_replace_text_input"
      expect(str).assertEqual(settings.input.AUTO_REPLACE_TEXT_INPUT);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_077
     * @tc.number settings_get_value_static_077
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_077',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.input.show_password_text_input"
      expect(str).assertEqual(settings.input.SHOW_PASSWORD_TEXT_INPUT);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_078
     * @tc.number settings_get_value_static_078
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_078',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.network.data_roaming_status"
      expect(str).assertEqual(settings.network.DATA_ROAMING_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_079
     * @tc.number settings_get_value_static_079
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_079',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.network.http_proxy_cfg"
      expect(str).assertEqual(settings.network.HTTP_PROXY_CFG);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_080
     * @tc.number settings_get_value_static_080
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_080',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.network.network_preference_usage"
      expect(str).assertEqual(settings.network.NETWORK_PREFERENCE_USAGE);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_081
     * @tc.number settings_get_value_static_081
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_081',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.phone.rtt_calling_status"
      expect(str).assertEqual(settings.phone.RTT_CALLING_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_082
     * @tc.number settings_get_value_static_082
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_082',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.sound.vibrate_while_ringing"
      expect(str).assertEqual(settings.sound.VIBRATE_WHILE_RINGING);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_083
     * @tc.number settings_get_value_static_083
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_083',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.sound.default_alarm_alert"
      expect(str).assertEqual(settings.sound.DEFAULT_ALARM_ALERT);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_084
     * @tc.number settings_get_value_static_084
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_084',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.sound.dtmf_tone_type_while_dialing"
      expect(str).assertEqual(settings.sound.DTMF_TONE_TYPE_WHILE_DIALING);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_085
     * @tc.number settings_get_value_static_085
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_085',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.sound.dtmf_tone_while_dialing"
      expect(str).assertEqual(settings.sound.DTMF_TONE_WHILE_DIALING);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_086
     * @tc.number settings_get_value_static_086
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_086',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.sound.haptic_feedback_status"
      expect(str).assertEqual(settings.sound.HAPTIC_FEEDBACK_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_087
     * @tc.number settings_get_value_static_087
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_087',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.sound.affected_mode_ringer_streams"
      expect(str).assertEqual(settings.sound.AFFECTED_MODE_RINGER_STREAMS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_088
     * @tc.number settings_get_value_static_088
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_088',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.sound.affected_mute_streams"
      expect(str).assertEqual(settings.sound.AFFECTED_MUTE_STREAMS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_089
     * @tc.number settings_get_value_static_089
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_089',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.sound.default_notification_sound"
      expect(str).assertEqual(settings.sound.DEFAULT_NOTIFICATION_SOUND);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_090
     * @tc.number settings_get_value_static_090
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_090',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      let str = "settings.sound.default_ringtone"
      expect(str).assertEqual(settings.sound.DEFAULT_RINGTONE);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_091
     * @tc.number settings_get_value_static_091
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_091',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.sound.sound_effects_status"
      expect(str).assertEqual(settings.sound.SOUND_EFFECTS_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_092
     * @tc.number settings_get_value_static_092
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_092',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.sound.vibrate_status"
      expect(str).assertEqual(settings.sound.VIBRATE_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_093
     * @tc.number settings_get_value_static_093
     * @tc.desc   check settings.TTS.DEFAULT_TTS_PITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_093',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.tts.default_tts_pitch"
      expect(str).assertEqual(settings.TTS.DEFAULT_TTS_PITCH);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_094
     * @tc.number settings_get_value_static_094
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_094',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.tts.default_tts_rate"
      expect(str).assertEqual(settings.TTS.DEFAULT_TTS_RATE);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_095
     * @tc.number settings_get_value_static_095
     * @tc.desc   check settings.TTS.DEFAULT_TTS_SYNTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_095',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.tts.default_tts_synth"
      expect(str).assertEqual(settings.TTS.DEFAULT_TTS_SYNTH);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_096
     * @tc.number settings_get_value_static_096
     * @tc.desc   check settings.TTS.ENABLED_TTS_PLUGINS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_096',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.tts.enabled_tts_plugins"
      expect(str).assertEqual(settings.TTS.ENABLED_TTS_PLUGINS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_097
     * @tc.number settings_get_value_static_097
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_097',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.bluetooth_radio"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_RADIO);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_098
     * @tc.number settings_get_value_static_098
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_098',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.cell_radio"
      expect(str).assertEqual(settings.wireless.CELL_RADIO);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_099
     * @tc.number settings_get_value_static_099
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_099',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.nfc_radio"
      expect(str).assertEqual(settings.wireless.NFC_RADIO);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_100
     * @tc.number settings_get_value_static_100
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.airplane_mode_radios"
      expect(str).assertEqual(settings.wireless.AIRPLANE_MODE_RADIOS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_101
     * @tc.number settings_get_value_static_101
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_101',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.bluetooth_status"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_102
     * @tc.number settings_get_value_static_102
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_102',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.bluetooth_discoverability_status"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_DISCOVER_ABILITY_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_103
     * @tc.number settings_get_value_static_103
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_103',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.bluetooth_discover_timeout"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_DISCOVER_TIMEOUT);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_104
     * @tc.number settings_get_value_static_104
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_104',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.wifi_dhcp_max_retry_count"
      expect(str).assertEqual(settings.wireless.WIFI_DHCP_MAX_RETRY_COUNT);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_105
     * @tc.number settings_get_value_static_105
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_105',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.wifi_to_mobile_data_awake_timeout"
      expect(str).assertEqual(settings.wireless.WIFI_TO_MOBILE_DATA_AWAKE_TIMEOUT);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_106
     * @tc.number settings_get_value_static_106
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_106',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.wifi_status"
      expect(str).assertEqual(settings.wireless.WIFI_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_107
     * @tc.number settings_get_value_static_107
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_107',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.wifi_watchdog_status"
      expect(str).assertEqual(settings.wireless.WIFI_WATCHDOG_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_108
     * @tc.number settings_get_value_static_108
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_108',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.wifi_radio"
      expect(str).assertEqual(settings.wireless.WIFI_RADIO);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_109
     * @tc.number settings_get_value_static_109
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_109',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.owner_lockdown_wifi_cfg"
      expect(str).assertEqual(settings.wireless.OWNER_LOCKDOWN_WIFI_CFG);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_110
     * @tc.number settings_get_value_static_110
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_110',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.owner_lockdown_wifi_cfg"
      expect(str).assertEqual(settings.wireless.OWNER_LOCKDOWN_WIFI_CFG);
      done();
    });

    /**
     * @tc.name   settings_get_value_static_113
     * @tc.number settings_get_value_static_113
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_113',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      try{console.info('test settings_get_value_static_113 start');
        settings.enableAirplaneMode(false,(err,data)=>{
          console.info('settings  test enableAirplaneMode callback ssss');
          if (err) {
            console.info('settings test enableAirplaneMode callback err'+err.code);
            expect(err.code).assertEqual(801);
          }
          done();
        })
      }catch(err) {
        console.info('settings  test enableAirplaneMode try catch err');
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   settings_get_value_static_114
     * @tc.number settings_get_value_static_114
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_114',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
      try{
        settings.enableAirplaneMode(false).then((data)=>{
          if (data) {
            console.info('settings test enableAirplaneMode promise data' + data);
          }
          done();
        }).catch((err: Error)=>{
          console.info('settings test enableAirplaneMode promise err' + err);
          if ((err as BusinessError).code) {
            expect(err.code).assertEqual(801);
          }
          done();
        })
      }catch(err){
        console.info('settings test enableAirplaneMode try catch err' + String(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   settings_get_value_static_115
     * @tc.number settings_get_value_static_115
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_115',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        settings.canShowFloating((err,data)=>{
          if (err) {
            console.info('settings test canShowFloating promise err'+String(err));
            expect(err.code).assertEqual(801);
          }
          done();
        })
      }catch(err){
        console.info('settings test canShowFloating promise err' + String(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   settings_get_value_static_116
     * @tc.number settings_get_value_static_116
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_116',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      try{
        settings.canShowFloating().then((data)=>{
          console.info('settings test canShowFloating promise err' + data);
          done();
        }).catch((err: Error)=>{
          console.info('settings test canShowFloating promise err' + err);
          if ((err as BusinessError).code) {
            expect(err.code).assertEqual(801);
          }
          done();
        })
      }catch(err){
        console.info('settings test canShowFloating promise err'+String(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   settings_get_value_static_117
     * @tc.number settings_get_value_static_117
     * @tc.desc   check settings get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      let name = 'settings.screen.brightness117';//关键字
      let value = 'brightness117';//值
      let domainName = 'secure';
      try{
        settings.setValue(abilityContext!, name, value, domainName)
          .then((data)=>{
            console.info("[settings_get_value_static_117] value is:" + data);
            done();
          })
          .catch((err: Error)=>{
            console.info("[settings_get_value_static_117] error is:" + err);
            if ((err as BusinessError).code) {
              expect(err.code).assertEqual(201);
            }
            done();
          })
      }catch (err) {
        console.error("[settings_set_value_static_117] error = " + String(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   settings_get_value_static_118
     * @tc.number settings_get_value_static_118
     * @tc.desc   check registerKeyObserver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name = 'settings.screen.brightness118';//关键字
      let domainName = settings.domainName.USER_PROPERTY;
      try{
        let value = settings.registerKeyObserver(abilityContext!, name, domainName, (err, ret) => {
          if (err) {
            console.info("[settings_get_value_static_118] error is:" + String(err));
            expect(err.code).assertEqual(201);
          }
          done();
        })
        expect(value).assertTrue();
        done();
      }catch (err) {
        err = err as Error;
        console.error("[settings_set_value_static_118] error = " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   settings_get_value_static_122
     * @tc.number settings_get_value_static_122
     * @tc.desc   check unregisterKeyObserver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_static_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name = 'settings.screen.brightness122';//关键字
      let domainName = settings.domainName.DEVICE_SHARED;
      try{
        let value = settings.registerKeyObserver(abilityContext!, name, domainName, (err, ret) => {
          if (err) {
            console.info("[settings_get_value_static_118] error is:" + String(err));
            expect(err.code).assertEqual(201);
          }
          done();
        })
        let value2 = settings.unregisterKeyObserver(abilityContext!, name, domainName);
        expect(value2).assertTrue();
        done();
      }catch (err) {
        console.error("[settings_set_value_122] error = " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   open_manager_settings_static_119
     * @tc.number open_manager_settings_static_119
     * @tc.desc   check open manager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('open_manager_settings_static_119', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = settings.openNetworkManagerSettings(abilityContext!)
        .then((status)=>{
          console.info("[open_manager_settings_static_119] value is:" + status);
          expect(status).assertTrue();
          done();
        })
        .catch((err: Error)=>{
          console.error("[open_manager_settings_static_119] error = " + err);
          if ((err as BusinessError).code) {
            expect(err.code).assertEqual(14800000);
          }
          done();
        })
    });

    /**
     * @tc.name   open_manager_settings_static_120
     * @tc.number open_manager_settings_static_120
     * @tc.desc   check open manager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('open_manager_settings_static_120', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
        let value = settings.openNetworkManagerSettings(abilityContext!)
          .then((status)=>{
            console.info("[open_manager_settings_static_120] value is:" + status);
            expect(status).assertTrue();
            done();
          })
          .catch((err)=>{
            console.error("[open_manager_settings_static_120] error = " + err);
            if ((err as BusinessError).code) {
              expect(err.code).assertEqual(14800010);
            }
            done();
          })
    });

    /**
     * @tc.name   openInputMethodSettings_valid_param
     * @tc.number openInputMethodSettings_valid_param
     * @tc.desc   openInputMethodSettings_valid_param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodSettings_valid_param', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodSettings(abilityContext!);
      } catch (err) {
        console.error("[openInputMethodSettings_valid_param] error = " + err);
        if ((err as BusinessError).code) {
          code = (err as BusinessError).code;
        }
      }
      expect(code).assertEqual(0);
      done();
    });

    /**
     * @tc.name   openInputMethodDetail_invalid_bundleName
     * @tc.number openInputMethodDetail_invalid_bundleName
     * @tc.desc   openInputMethodDetail_invalid_bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodDetail_invalid_bundleName', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodDetail(abilityContext!, '', 'inputMethodId');
      } catch (err) {
        console.error("[openInputMethodDetail_invalid_bundleName] error = " + err);
        if ((err as BusinessError).code) {
          code = (err as BusinessError).code;
        }
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });

    /**
     * @tc.name   openInputMethodDetail_invalid_method
     * @tc.number openInputMethodDetail_invalid_method
     * @tc.desc   openInputMethodDetail_invalid_method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodDetail_invalid_method', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodDetail(abilityContext!, 'bundleName', '');
      } catch (err) {
        console.error("[openInputMethodDetail_invalid_method] error = " + err);
        if ((err as BusinessError).code) {
          code = (err as BusinessError).code;
        }
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });

    /**
     * @tc.name   openInputMethodDetail_valid_param
     * @tc.number openInputMethodDetail_valid_param
     * @tc.desc   openInputMethodDetail_valid_param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodDetail_valid_param', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodDetail(abilityContext!, 'bundleName', 'inputMethodId');
      } catch (err) {
        console.error("[openInputMethodDetail_valid_param] error = " + err);
        if ((err as BusinessError).code) {
          code = (err as BusinessError).code;
        }
      }
      expect(code).assertEqual(0);
      done();
    });
  })
}
