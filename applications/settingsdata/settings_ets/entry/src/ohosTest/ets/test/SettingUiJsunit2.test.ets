
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium";
import settings from '@ohos.settings';
import { BusinessError } from '@ohos.base';
import uitest from '@ohos.UiTest';
import { mContext } from '../testability/TestAbility';
import { deviceInfo } from '@kit.BasicServicesKit';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import CommonFunc from './Common';

interface myObj {
  aa: string
}

interface myObj2 {
  "code": number
}

const SETTINGS_PARAM_INVALID_CODE:number = 16900010;
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

function isDevicewearable(): boolean {
  return deviceType === 'wearable';
}

function isDeviceSupportDoubleClick(): boolean {
  return isDevicewearable();
}

function isDeviceSupportInputMethod(): boolean {
  return isDevicePhone() || isDeviceTablet();
}

function isDeviceSupportOpenNetWork(): boolean {
  return isDevicePhone() || isDeviceTablet() || isDevicePC();
}

function getBoolSystemParam(key: string, def: boolean): boolean {
  let defStr = def ? 'true' : 'false';
  try {
    return systemParameterEnhance.getSync(key, defStr) === 'true';
  } catch (err) {
    console.error(`getSystemParam failed, code:${err?.code}, msg:${err?.message}`);
    return def;
  }
}

function isDeviceSupportNfc(): boolean {
  return (isDevicePhone() || isDeviceTablet()) &&
    getBoolSystemParam('const.SystemCapability.Communication.NFC.Core', false) &&
    !getBoolSystemParam('const.nfc.not_support', false);
}

function isDeviceSupportAboutDevice(): boolean {
  return isDevicePhone() || isDeviceTablet() || isDevicePC();
}

function isDeviceSupportAppDetail(): boolean {
  return isDevicePhone() || isDeviceTablet() || isDevicePC();
}

function isDeviceSupportBiometrics(): boolean {
  return isDevicePhone() || isDeviceTablet() || isDevicePC();
}

export default function settingUiJsunit() {
  beforeAll(() => {
    console.info("beforeAll start");
    console.info("beforeAll end");
  })

  describe('appInfoTestAdapt001', ()=> {
    console.log("************* settings Test start*************");
    /**
     * @tc.name   settings_uri_test_001
     * @tc.number settings_uri_test_001
     * @tc.desc   settings_uri_test_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_uri_test_001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,(done: Function) =>  {
      let name = 'settings.screen.test';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_001] uri is: " + uri);
      let uri2 = settings.getUriSync(name);
      console.info("[settings_uri_test_001] uri2 is: " + uri2);
      expect(uri).assertEqual(uri2);
      done();
    });

    /**
     * @tc.name   settings_uri_test_002
     * @tc.number settings_uri_test_002
     * @tc.desc   settings_uri_test_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_uri_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let uri = settings.getUriSync('');
      console.info("[settings_uri_test_002] uri is: " + uri);
      expect(uri).assertEqual('datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=')
      done();
    });

    /**
     * @tc.name   settings_uri_test_003
     * @tc.number settings_uri_test_003
     * @tc.desc   settings_uri_test_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_uri_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '122.00';
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_uri_test_003] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_uri_test_003] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_uri_test_004
     * @tc.number settings_uri_test_004
     * @tc.desc   settings_uri_test_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_uri_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_004] uri is: " + uri);
      expect(uri).assertEqual('datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=settings.screen.brightness')
      done();
    });

    /**
     * @tc.name   settings_get_value_013
     * @tc.number settings_get_value_013
     * @tc.desc   settings_get_value_013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '1322.00';
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_get_value_013] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_get_value_013] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_get_value_014
     * @tc.number settings_get_value_014
     * @tc.desc   settings_get_value_014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = null;
      try {
        let uri = settings.getUriSync(null);
        console.info("[settings_get_value_014] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_get_value_014] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_get_value_0015
     * @tc.number settings_get_value_0015
     * @tc.desc   settings_get_value_0015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '1332';
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_get_value_0015] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_get_value_0015] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_get_value_0016
     * @tc.number settings_get_value_0016
     * @tc.desc   settings_get_value_0016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '1332';
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_get_value_0016] uri is: " + uri);
      } catch (err) {
        let errMsg: myObj = err;
        console.error("[settings_get_value_0016] error = " + errMsg);
        expect(String(errMsg) == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_get_value_0017
     * @tc.number settings_get_value_0017
     * @tc.desc   settings_get_value_0017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '1332';
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_get_value_0017] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_get_value_0017] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_set_value_026
     * @tc.number settings_set_value_026
     * @tc.desc   settings_set_value_026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '1332';
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_set_value_026] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_set_value_026] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_set_value_027
     * @tc.number settings_set_value_027
     * @tc.desc   settings_set_value_027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = null;
      try {
        let uri = settings.getUriSync(null);
        console.info("[settings_set_value_027] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_set_value_027] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_get_uri_sync_undefined
     * @tc.number settings_get_uri_sync_undefined
     * @tc.desc   settings_get_uri_sync_undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_uri_sync_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let uri = settings.getUriSync(undefined);
          console.info("[settings_get_uri_sync_undefined] uri is: " + uri);
          expect().assertFail();
          done();
        } catch (err) {
          let errMsg: string = err;
          console.error("[settings_get_uri_sync_undefined] error = " + errMsg);
          expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_028
     * @tc.number settings_set_value_028
     * @tc.desc   settings_set_value_028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '2323';
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_set_value_028] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_set_value_028] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_set_value_029
     * @tc.number settings_set_value_029
     * @tc.desc   settings_set_value_029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '2323';
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_set_value_029] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_set_value_029] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_set_value_030
     * @tc.number settings_set_value_030
     * @tc.desc   settings_set_value_030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '2323';
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_set_value_030] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_set_value_030] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_set_value_031
     * @tc.number settings_set_value_031
     * @tc.desc   settings_set_value_031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '2323';
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_set_value_031] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_set_value_031] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_set_value_032
     * @tc.number settings_set_value_032
     * @tc.desc   settings_set_value_032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '2323';
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_set_value_032] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_set_value_032] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_get_value_035
     * @tc.number settings_get_value_035
     * @tc.desc   settings_get_value_035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      let name  = 'settings.screen.brightness35';
      let uriPrefix = 'datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key='
      let expectValue = uriPrefix + name;
      try{
        settings.getURI(name).then(data => {
          console.info("[settings_get_uri_035] uri is: " + data);
          expect(data).assertEqual(expectValue);
          done();
        })
      } catch(err){
        console.info("[settings_get_uri_035] error is: " + String(err));
        expect(true).assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_get_value_036
     * @tc.number settings_get_value_036
     * @tc.desc   settings_get_value_036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      let name  = 'settings.screen.brightness36';
      let uriPrefix = 'datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key='
      let expectValue = uriPrefix + name;
      try{
        settings.getURI(name, (data) =>{
          console.info("[settings_get_uri_036] uri is: " + data);
          expect(data).assertEqual(expectValue);
          done();
        })
      }catch(err){
        console.info("[settings_get_uri_036] error is: " + String(err));
        expect(true).assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_get_value_037
     * @tc.number settings_get_value_037
     * @tc.desc   settings_get_value_037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_037',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.date.date_format"
      expect(str).assertEqual(settings.date.DATE_FORMAT);
      done();
    });

    /**
     * @tc.name   settings_get_value_038
     * @tc.number settings_get_value_038
     * @tc.desc   settings_get_value_038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_038',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.date.time_format"
      expect(str).assertEqual(settings.date.TIME_FORMAT);
      done();
    });

    /**
     * @tc.name   settings_get_value_039
     * @tc.number settings_get_value_039
     * @tc.desc   settings_get_value_039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_039',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.date.auto_gain_time"
      expect(str).assertEqual(settings.date.AUTO_GAIN_TIME);
      done();
    });

    /**
     * @tc.name   settings_get_value_040
     * @tc.number settings_get_value_040
     * @tc.desc   settings_get_value_040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_040',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.date.auto_gain_time_zone"
      expect(str).assertEqual(settings.date.AUTO_GAIN_TIME_ZONE);
      done();
    });

    /**
     * @tc.name   settings_get_value_041
     * @tc.number settings_get_value_041
     * @tc.desc   settings_get_value_041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_041',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="font_scale";
      expect(str).assertEqual(settings.display.FONT_SCALE);
      done();
    });

    /**
     * @tc.name   settings_get_value_042
     * @tc.number settings_get_value_042
     * @tc.desc   settings_get_value_042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_042',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.screen_brightness_status"
      expect(str).assertEqual(settings.display.SCREEN_BRIGHTNESS_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_043
     * @tc.number settings_get_value_043
     * @tc.desc   settings_get_value_043
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_043',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.auto_screen_brightness"
      expect(str).assertEqual(settings.display.AUTO_SCREEN_BRIGHTNESS);
      done();
    });

    /**
     * @tc.name   settings_get_value_044
     * @tc.number settings_get_value_044
     * @tc.desc   settings_get_value_044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_044',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let int = 1
      expect(int).assertEqual(settings.display.AUTO_SCREEN_BRIGHTNESS_MODE);
      done();
    });

    /**
     * @tc.name   settings_get_value_045
     * @tc.number settings_get_value_045
     * @tc.desc   settings_get_value_045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_045',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let int = 0
      expect(int).assertEqual(settings.display.MANUAL_SCREEN_BRIGHTNESS_MODE);
      done();
    });

    /**
     * @tc.name   settings_get_value_046
     * @tc.number settings_get_value_046
     * @tc.desc   settings_get_value_046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_046',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.screen_off_timeout"
      expect(str).assertEqual(settings.display.SCREEN_OFF_TIMEOUT);
      done();
    });

    /**
     * @tc.name   settings_get_value_047
     * @tc.number settings_get_value_047
     * @tc.desc   settings_get_value_047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_047',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.default_screen_rotation"
      expect(str).assertEqual(settings.display.DEFAULT_SCREEN_ROTATION);
      done();
    });

    /**
     * @tc.name   settings_get_value_048
     * @tc.number settings_get_value_048
     * @tc.desc   settings_get_value_048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_048',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.animator_duration_scale"
      expect(str).assertEqual(settings.display.ANIMATOR_DURATION_SCALE);
      done();
    });

    /**
     * @tc.name   settings_get_value_049
     * @tc.number settings_get_value_049
     * @tc.desc   settings_get_value_049
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_049',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.transition_animation_scale"
      expect(str).assertEqual(settings.display.TRANSITION_ANIMATION_SCALE);
      done();
    });

    /**
     * @tc.name   settings_get_value_050
     * @tc.number settings_get_value_050
     * @tc.desc   settings_get_value_050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_050',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.window_animation_scale"
      expect(str).assertEqual(settings.display.WINDOW_ANIMATION_SCALE);
      done();
    });

    /**
     * @tc.name   settings_get_value_051
     * @tc.number settings_get_value_051
     * @tc.desc   settings_get_value_051
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_051',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.display.display_inversion_status"
      expect(str).assertEqual(settings.display.DISPLAY_INVERSION_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_052
     * @tc.number settings_get_value_052
     * @tc.desc   settings_get_value_052
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_052',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.setup_wizard_finished"
      expect(str).assertEqual(settings.general.SETUP_WIZARD_FINISHED);
      done();
    });

    /**
     * @tc.name   settings_get_value_053
     * @tc.number settings_get_value_053
     * @tc.desc   settings_get_value_053
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_053',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.end_button_action"
      expect(str).assertEqual(settings.general.END_BUTTON_ACTION);
      done();
    });

    /**
     * @tc.name   settings_get_value_054
     * @tc.number settings_get_value_054
     * @tc.desc   settings_get_value_054
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_054',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.airplane_mode_status"
      expect(str).assertEqual(settings.general.AIRPLANE_MODE_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_055
     * @tc.number settings_get_value_055
     * @tc.desc   settings_get_value_055
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_055',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.accelerometer_rotation_status"
      expect(str).assertEqual(settings.general.ACCELEROMETER_ROTATION_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_056
     * @tc.number settings_get_value_056
     * @tc.desc   settings_get_value_056
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_056',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.device_provision_status"
      expect(str).assertEqual(settings.general.DEVICE_PROVISION_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_057
     * @tc.number settings_get_value_057
     * @tc.desc   settings_get_value_057
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_057',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.hdc_status"
      expect(str).assertEqual(settings.general.HDC_STATUS);
      done();
    });



    /**
     * @tc.name   settings_get_value_058
     * @tc.number settings_get_value_058
     * @tc.desc   settings_get_value_058
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_058',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.boot_counting"
      expect(str).assertEqual(settings.general.BOOT_COUNTING);
      done();
    });

    /**
     * @tc.name   settings_get_value_059
     * @tc.number settings_get_value_059
     * @tc.desc   settings_get_value_059
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_059',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.contact_metadata_sync_status"
      expect(str).assertEqual(settings.general.CONTACT_METADATA_SYNC_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_060
     * @tc.number settings_get_value_060
     * @tc.desc   settings_get_value_060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_060',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.development_settings_status"
      expect(str).assertEqual(settings.general.DEVELOPMENT_SETTINGS_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_061
     * @tc.number settings_get_value_061
     * @tc.desc   settings_get_value_061
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_061',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.device_name"
      expect(str).assertEqual(settings.general.DEVICE_NAME);
      done();
    });

    /**
     * @tc.name   settings_get_value_062
     * @tc.number settings_get_value_062
     * @tc.desc   settings_get_value_062
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_062',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.usb_storage_status"
      expect(str).assertEqual(settings.general.USB_STORAGE_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_063
     * @tc.number settings_get_value_063
     * @tc.desc   settings_get_value_063
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_063',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.debugger_waiting"
      expect(str).assertEqual(settings.general.DEBUGGER_WAITING);
      done();
    });

    /**
     * @tc.name   settings_get_value_064
     * @tc.number settings_get_value_064
     * @tc.desc   settings_get_value_064
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_064',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.debug_app_package"
      expect(str).assertEqual(settings.general.DEBUG_APP_PACKAGE);
      done();
    });

    /**
     * @tc.name   settings_get_value_065
     * @tc.number settings_get_value_065
     * @tc.desc   settings_get_value_065
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_065',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.accessibility_status"
      expect(str).assertEqual(settings.general.ACCESSIBILITY_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_066
     * @tc.number settings_get_value_066
     * @tc.desc   settings_get_value_066
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_066',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.activated_accessibility_services"
      expect(str).assertEqual(settings.general.ACTIVATED_ACCESSIBILITY_SERVICES);
      done();
    });

    /**
     * @tc.name   settings_get_value_067
     * @tc.number settings_get_value_067
     * @tc.desc   settings_get_value_067
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_067',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.geolocation_origins_allowed"
      expect(str).assertEqual(settings.general.GEOLOCATION_ORIGINS_ALLOWED);
      done();
    });

    /**
     * @tc.name   settings_get_value_068
     * @tc.number settings_get_value_068
     * @tc.desc   settings_get_value_068
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_068',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.skip_use_hints"
      expect(str).assertEqual(settings.general.SKIP_USE_HINTS);
      done();
    });

    /**
     * @tc.name   settings_get_value_069
     * @tc.number settings_get_value_069
     * @tc.desc   settings_get_value_069
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_069',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.touch_exploration_status"
      expect(str).assertEqual(settings.general.TOUCH_EXPLORATION_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_070
     * @tc.number settings_get_value_070
     * @tc.desc   settings_get_value_070
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_070',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.input.default_input_method"
      expect(str).assertEqual(settings.input.DEFAULT_INPUT_METHOD);
      done();
    });

    /**
     * @tc.name   settings_get_value_071
     * @tc.number settings_get_value_071
     * @tc.desc   settings_get_value_071
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_071',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.activated_input_method_submode"
      let expectValue:string=settings.input.ACTIVATED_INPUT_METHOD_SUB_MODE;
      expect(str).assertEqual(expectValue);
      done();
    });


    /**
     * @tc.name   settings_get_value_072
     * @tc.number settings_get_value_072
     * @tc.desc   settings_get_value_072
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_072',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.activated_input_methods"
      expect(str).assertEqual(settings.input.ACTIVATED_INPUT_METHODS);
      done();
    });


    /**
     * @tc.name   settings_get_value_073
     * @tc.number settings_get_value_073
     * @tc.desc   settings_get_value_073
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_073',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.selector_visibility_for_input_method"
      expect(str).assertEqual(settings.input.SELECTOR_VISIBILITY_FOR_INPUT_METHOD);
      done();
    });


    /**
     * @tc.name   settings_get_value_074
     * @tc.number settings_get_value_074
     * @tc.desc   settings_get_value_074
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_074',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.auto_caps_text_input"
      expect(str).assertEqual(settings.input.AUTO_CAPS_TEXT_INPUT);
      done();
    });


    /**
     * @tc.name   settings_get_value_075
     * @tc.number settings_get_value_075
     * @tc.desc   settings_get_value_075
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_075',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.auto_punctuate_text_input"
      expect(str).assertEqual(settings.input.AUTO_PUNCTUATE_TEXT_INPUT);
      done();
    });


    /**
     * @tc.name   settings_get_value_076
     * @tc.number settings_get_value_076
     * @tc.desc   settings_get_value_076
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_076',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.auto_replace_text_input"
      expect(str).assertEqual(settings.input.AUTO_REPLACE_TEXT_INPUT);
      done();
    });


    /**
     * @tc.name   settings_get_value_077
     * @tc.number settings_get_value_077
     * @tc.desc   settings_get_value_077
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_077',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.show_password_text_input"
      expect(str).assertEqual(settings.input.SHOW_PASSWORD_TEXT_INPUT);
      done();
    });


    /**
     * @tc.name   settings_get_value_078
     * @tc.number settings_get_value_078
     * @tc.desc   settings_get_value_078
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_078',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.network.data_roaming_status"
      expect(str).assertEqual(settings.network.DATA_ROAMING_STATUS);
      done();
    });


    /**
     * @tc.name   settings_get_value_079
     * @tc.number settings_get_value_079
     * @tc.desc   settings_get_value_079
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_079',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.network.http_proxy_cfg"
      expect(str).assertEqual(settings.network.HTTP_PROXY_CFG);
      done();
    });


    /**
     * @tc.name   settings_get_value_080
     * @tc.number settings_get_value_080
     * @tc.desc   settings_get_value_080
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_080',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.network.network_preference_usage"
      expect(str).assertEqual(settings.network.NETWORK_PREFERENCE_USAGE);
      done();
    });


    /**
     * @tc.name   settings_get_value_081
     * @tc.number settings_get_value_081
     * @tc.desc   settings_get_value_081
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_081',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.phone.rtt_calling_status"
      expect(str).assertEqual(settings.phone.RTT_CALLING_STATUS);
      done();
    });


    /**
     * @tc.name   settings_get_value_082
     * @tc.number settings_get_value_082
     * @tc.desc   settings_get_value_082
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_082',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.vibrate_while_ringing"
      expect(str).assertEqual(settings.sound.VIBRATE_WHILE_RINGING);
      done();
    });


    /**
     * @tc.name   settings_get_value_083
     * @tc.number settings_get_value_083
     * @tc.desc   settings_get_value_083
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_083',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.default_alarm_alert"
      expect(str).assertEqual(settings.sound.DEFAULT_ALARM_ALERT);
      done();
    });


    /**
     * @tc.name   settings_get_value_084
     * @tc.number settings_get_value_084
     * @tc.desc   settings_get_value_084
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_084',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.dtmf_tone_type_while_dialing"
      expect(str).assertEqual(settings.sound.DTMF_TONE_TYPE_WHILE_DIALING);
      done();
    });


    /**
     * @tc.name   settings_get_value_085
     * @tc.number settings_get_value_085
     * @tc.desc   settings_get_value_085
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_085',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.dtmf_tone_while_dialing"
      expect(str).assertEqual(settings.sound.DTMF_TONE_WHILE_DIALING);
      done();
    });


    /**
     * @tc.name   settings_get_value_086
     * @tc.number settings_get_value_086
     * @tc.desc   settings_get_value_086
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_086',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.haptic_feedback_status"
      expect(str).assertEqual(settings.sound.HAPTIC_FEEDBACK_STATUS);
      done();
    });


    /**
     * @tc.name   settings_get_value_087
     * @tc.number settings_get_value_087
     * @tc.desc   settings_get_value_087
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_087',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.affected_mode_ringer_streams"
      expect(str).assertEqual(settings.sound.AFFECTED_MODE_RINGER_STREAMS);
      done();
    });


    /**
     * @tc.name   settings_get_value_088
     * @tc.number settings_get_value_088
     * @tc.desc   settings_get_value_088
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_088',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.affected_mute_streams"
      expect(str).assertEqual(settings.sound.AFFECTED_MUTE_STREAMS);
      done();
    });


    /**
     * @tc.name   settings_get_value_089
     * @tc.number settings_get_value_089
     * @tc.desc   settings_get_value_089
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_089',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.default_notification_sound"
      expect(str).assertEqual(settings.sound.DEFAULT_NOTIFICATION_SOUND);
      done();
    });


    /**
     * @tc.name   settings_get_value_090
     * @tc.number settings_get_value_090
     * @tc.desc   settings_get_value_090
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_090',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.default_ringtone"
      expect(str).assertEqual(settings.sound.DEFAULT_RINGTONE);
      done();
    });

    /**
     * @tc.name   settings_get_value_091
     * @tc.number settings_get_value_091
     * @tc.desc   settings_get_value_091
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_091',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.sound.sound_effects_status"
      expect(str).assertEqual(settings.sound.SOUND_EFFECTS_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_092
     * @tc.number settings_get_value_092
     * @tc.desc   settings_get_value_092
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_092',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.sound.vibrate_status"
      expect(str).assertEqual(settings.sound.VIBRATE_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_097
     * @tc.number settings_get_value_097
     * @tc.desc   settings_get_value_097
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_097',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.bluetooth_radio"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_RADIO);
      done();
    });

    /**
     * @tc.name   settings_get_value_098
     * @tc.number settings_get_value_098
     * @tc.desc   settings_get_value_098
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_098',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.cell_radio"
      expect(str).assertEqual(settings.wireless.CELL_RADIO);
      done();
    });

    /**
     * @tc.name   settings_get_value_099
     * @tc.number settings_get_value_099
     * @tc.desc   settings_get_value_099
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_099',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.nfc_radio"
      expect(str).assertEqual(settings.wireless.NFC_RADIO);
      done();
    });

    /**
     * @tc.name   settings_get_value_100
     * @tc.number settings_get_value_100
     * @tc.desc   settings_get_value_100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.airplane_mode_radios"
      expect(str).assertEqual(settings.wireless.AIRPLANE_MODE_RADIOS);
      done();
    });

    /**
     * @tc.name   settings_get_value_101
     * @tc.number settings_get_value_101
     * @tc.desc   settings_get_value_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_101',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.bluetooth_status"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_102
     * @tc.number settings_get_value_102
     * @tc.desc   settings_get_value_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_102',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.bluetooth_discoverability_status"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_DISCOVER_ABILITY_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_103
     * @tc.number settings_get_value_103
     * @tc.desc   settings_get_value_103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_103',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.bluetooth_discover_timeout"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_DISCOVER_TIMEOUT);
      done();
    });

    /**
     * @tc.name   settings_get_value_104
     * @tc.number settings_get_value_104
     * @tc.desc   settings_get_value_104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_104',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.wifi_dhcp_max_retry_count"
      expect(str).assertEqual(settings.wireless.WIFI_DHCP_MAX_RETRY_COUNT);
      done();
    });

    /**
     * @tc.name   settings_get_value_105
     * @tc.number settings_get_value_105
     * @tc.desc   settings_get_value_105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_105',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.wifi_to_mobile_data_awake_timeout"
      expect(str).assertEqual(settings.wireless.WIFI_TO_MOBILE_DATA_AWAKE_TIMEOUT);
      done();
    });

    /**
     * @tc.name   settings_get_value_106
     * @tc.number settings_get_value_106
     * @tc.desc   settings_get_value_106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_106',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.wifi_status"
      expect(str).assertEqual(settings.wireless.WIFI_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_107
     * @tc.number settings_get_value_107
     * @tc.desc   settings_get_value_107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_107',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.wifi_watchdog_status"
      expect(str).assertEqual(settings.wireless.WIFI_WATCHDOG_STATUS);
      done();
    });

    /**
     * @tc.name   settings_get_value_108
     * @tc.number settings_get_value_108
     * @tc.desc   settings_get_value_108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_108',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.wifi_radio"
      expect(str).assertEqual(settings.wireless.WIFI_RADIO);
      done();
    });

    /**
     * @tc.name   settings_get_value_109
     * @tc.number settings_get_value_109
     * @tc.desc   settings_get_value_109
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_109',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.owner_lockdown_wifi_cfg"
      expect(str).assertEqual(settings.wireless.OWNER_LOCKDOWN_WIFI_CFG);
      done();
    });

    /**
     * @tc.name   settings_get_value_110
     * @tc.number settings_get_value_110
     * @tc.desc   settings_get_value_110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_110',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.owner_lockdown_wifi_cfg"
      expect(str).assertEqual(settings.wireless.OWNER_LOCKDOWN_WIFI_CFG);
      done();
    });

    /**
     * @tc.name   settings_get_value_113
     * @tc.number settings_get_value_113
     * @tc.desc   settings_get_value_113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_113',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function)=>{
      try{console.info('test settings_get_value_113 start');
        settings.enableAirplaneMode(false,(err,data)=>{console.info('settings  test enableAirplaneMode callback ssss');
          console.info('settings test enableAirplaneMode callback err'+JSON.stringify(err.code));
          expect(JSON.stringify(err.code)).assertEqual("801");
          done();
        })
      }catch(err){console.info('settings  test enableAirplaneMode try catch err');
        expect(true).assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_enable_air_plane_mode_true
     * @tc.number settings_enable_air_plane_mode_true
     * @tc.desc   settings_enable_air_plane_mode_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_enable_air_plane_mode_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info('test settings_get_value_113 start');
          settings.enableAirplaneMode(true, (err, data) => {
            console.info('settings test enableAirplaneMode callback err' + JSON.stringify(err.code));
            expect(JSON.stringify(err.code)).assertEqual("801");
            done();
          })
        } catch (err) {
          console.info('settings  test enableAirplaneMode try catch err');
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_114
     * @tc.number settings_get_value_114
     * @tc.desc   settings_get_value_114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_114',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      try{
        settings.enableAirplaneMode(false).then((data)=>{
          console.info('settings test enableAirplaneMode promise data'+JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError)=>{
          console.info('settings test enableAirplaneMode promise err'+JSON.stringify(err.code));
          expect(JSON.stringify(err.code)).assertEqual("801");
          done();
          return;
        })
      }catch(err){
        console.info('settings test enableAirplaneMode try catch err'+JSON.stringify(err));
        expect(true).assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_enable_air_plane_mode_promise_true
     * @tc.number settings_enable_air_plane_mode_promise_true
     * @tc.desc   settings_enable_air_plane_mode_promise_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_enable_air_plane_mode_promise_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = await settings.enableAirplaneMode(true);
          console.info('settings settings_enable_air_plane_mode_promise_true result ' + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info('settings settings_enable_air_plane_mode_promise_true err' + JSON.stringify(err));
          expect(JSON.stringify(err.code)).assertEqual("801");
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_115
     * @tc.number settings_get_value_115
     * @tc.desc   settings_get_value_115
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_115',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      try{
        settings.canShowFloating((err,data)=>{
          console.info('settings test canShowFloating promise err'+JSON.stringify(err.code));
          expect(JSON.stringify(err.code)).assertEqual("801");
          done();
        })
      }catch(err){
        console.info('settings test canShowFloating promise err'+String(err));
        expect(true).assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_get_value_116
     * @tc.number settings_get_value_116
     * @tc.desc   settings_get_value_116
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_116',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      try{
        let str: myObj2 = {"code":801};
        settings.canShowFloating().then((data)=>{
          console.info('settings test canShowFloating promise err'+String(data));
          // expect(String(err)).assertEqual(str);
          done();
        }).catch((err: BusinessError)=>{
          console.info('settings test canShowFloating promise err'+JSON.stringify(err.code));
          expect(JSON.stringify(err.code)).assertEqual("801");
          done();
          return;
        })
        let setTTS1: string = settings.TTS.DEFAULT_TTS_PITCH + ''
        let setTTS2: string = settings.TTS.DEFAULT_TTS_RATE + ''
        let setTTS3: string = settings.TTS.DEFAULT_TTS_SYNTH + ''
        let setTTS4: string = settings.TTS.ENABLED_TTS_PLUGINS + ''
      }catch(err){
        console.info('settings test canShowFloating promise err'+String(err));
        expect(true).assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_get_value_117
     * @tc.number settings_get_value_117
     * @tc.desc   settings_get_value_117
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) =>  {
      let name = 'settings.screen.brightness117';//关键字
      let value = 'brightness117';//值
      let domainName = 'secure';
      try{
        settings.setValue(globalThis.abilityContext, name, value, domainName)
          .then((data)=>{
            console.info("[settings_get_value_117] value is:" + data);
          })
          .catch((err: BusinessError)=>{
            console.info("[settings_get_value_117] error is:" + String(err));
            expect(err.code).assertEqual(201);
            done();
            return;
          })
        let ret = settings.setValueSync(globalThis.abilityContext, name, value, domainName)
      }catch (err) {
        if(err.code == 201) {
          console.info('权限错误')
          expect(err.code == 201).assertTrue();
        }
        console.error("[settings_set_value_117] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_get_value_118
     * @tc.number settings_get_value_118
     * @tc.desc   settings_get_value_118
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness118';//关键字
      let domainName = settings.domainName.USER_PROPERTY;
      try{
        let value = settings.registerKeyObserver(globalThis.abilityContext, name, domainName, (err, ret) => {
          console.info("[settings_get_value_118] error is:" + String(err));
          expect(err.code).assertEqual(201);
          done();
        })
      }catch (err) {
        console.error("[settings_set_value_118] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   open_manager_settings_120
     * @tc.number open_manager_settings_120
     * @tc.desc   open_manager_settings_120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('open_manager_settings_120', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      try{
        let value = await settings.openNetworkManagerSettings(mContext);
        console.info("[open_manager_settings_120] result is:" + value);
        if (!isDeviceSupportOpenNetWork()) {
          console.info("[open_manager_settings_120] sleep 1s");
          await CommonFunc.sleep(1000);
          let driver = await uitest.Driver.create();
          let textComponent = await driver.findComponent(uitest.ON.text('设置网络'));
          console.info("[open_manager_settings_120] text = " + textComponent);
          expect(textComponent === undefined || textComponent === null).assertTrue();
        } else {
          expect(value).assertTrue();
        }
        done();
      }catch (err) {
        console.error("[open_manager_settings_120] error = " + err);
        expect(err.code).assertEqual(14800010);
      }
      done();
    });

    /**
     * @tc.name   settings_set_value_context_null
     * @tc.number settings_set_value_context_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_context_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let name = 'settings.screen.brightness1112'; //关键字
      let value = 'brightness111' //值
      let defaultCode: number = 0;
      try {
        let result = await settings.setValue(null, name, value, settings.domainName.DEVICE_SHARED);
        console.info("[settings_set_value_context_null] result = " + result);
        expect().assertFail();
        done();
      } catch (err) {
        console.error("[settings_set_value_context_null] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_set_value_context_undefined
     * @tc.number settings_set_value_context_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_context_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let name = 'settings.screen.brightness1112'; //关键字
      let value = 'brightness111' //值
      let defaultCode: number = 0;
      try {
        let result = await settings.setValue(undefined, name, value, settings.domainName.DEVICE_SHARED);
        console.info("[settings_set_value_context_undefined] result = " + result);
        expect().assertFail();
        done();
      } catch (err) {
        console.error("[settings_set_value_context_undefined] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_set_value_key_null
     * @tc.number settings_set_value_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let value = 'brightness111'; //值
      let defaultCode: number = 0;
      try {
        await settings.setValue(mContext, null, value, settings.domainName.DEVICE_SHARED);
        console.info("[settings_set_value_key_null]");
        expect().assertFail();
        done();
      } catch (err) {
        console.error("[settings_set_value_key_null] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1], type. String expected")
          .assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_set_value_key_undefined
     * @tc.number settings_set_value_key_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_key_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let value = 'brightness111'; //值
        let defaultCode: number = 0;
        try {
          await settings.setValue(mContext, undefined, value, settings.domainName.DEVICE_SHARED);
          console.info("[settings_set_value_key_undefined]");
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_set_value_key_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1], type. String expected")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_key_empty
     * @tc.number settings_set_value_key_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_key_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let value = 'brightness111'; //值
      try {
        let result =
          await settings.setValue(mContext, '', value, settings.domainName.DEVICE_SHARED);
        console.info("[settings_set_value_key_empty] result = " + result);
        expect().assertFail();
        done();
      } catch (err) {
        console.error("[settings_set_value_key_empty] error = " + err);
        expect(err?.code === 201).assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_set_value_value_null
     * @tc.number settings_set_value_value_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_value_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let result =
          await settings.setValue(mContext, 'setvaluenull', null, settings.domainName.DEVICE_SHARED);
        console.info("[settings_set_value_value_null] result = " + result);
        expect().assertFail();
        done();
      } catch (err) {
        console.error("[settings_set_value_value_null] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2], type. String expected")
          .assertTrue();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_set_value_value_undefined
     * @tc.number settings_set_value_value_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_value_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result =
            await settings.setValue(mContext, 'setvaluenull', undefined, settings.domainName.DEVICE_SHARED);
          console.info("[settings_set_value_value_undefined] result = " + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_set_value_value_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2], type. String expected")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_value_empty
     * @tc.number settings_set_value_value_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_value_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let result =
          await settings.setValue(mContext, 'setvalueempty', '', settings.domainName.DEVICE_SHARED);
        console.info("[settings_set_value_value_undefined] result = " + result);
        expect().assertFail();
        done();
      } catch (err) {
        console.error("[settings_set_value_value_undefined] error = " + err);
        expect(err.code).assertEqual(201);
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_set_value_domain_permission
     * @tc.number settings_set_value_domain_permission
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_domain_permission', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let result =
          await settings.setValue(mContext, 'testkeydomian', 'testvalue', settings.domainName.DEVICE_SHARED);
        console.info("[settings_set_value_domain_permission] result = " + result);
        expect().assertFail();
        done();
      } catch (err) {
        console.error("[settings_set_value_domain_permission] error = " + err);
        expect(err.code).assertEqual(201);
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_set_value_callback_context_null
     * @tc.number settings_set_value_callback_context_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_callback_context_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          settings.setValue(null, 'testkey', 'testvalue', (result) => {
            console.info("[settings_set_value_callback_context_null] result = " + result);
            expect().assertFail();
            done();
          });
        } catch (err) {
          console.error("[settings_set_value_callback_context_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_callback_context_undefined
     * @tc.number settings_set_value_callback_context_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_callback_context_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          settings.setValue(undefined, 'testkey', 'testvalue', (result) => {
            console.info("[settings_set_value_callback_context_undefined] result = " + result);
            expect().assertFail();
            done();
          });
        } catch (err) {
          console.error("[settings_set_value_callback_context_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_callback_key_null
     * @tc.number settings_set_value_callback_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_callback_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          settings.setValue(mContext, null, 'testvalue', (result) => {
            console.info("[settings_set_value_callback_key_null] result = " + result);
            expect().assertFail();
            done();
          });
        } catch (err) {
          console.error("[settings_set_value_callback_key_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1], type. String expected")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_callback_key_undefined
     * @tc.number settings_set_value_callback_key_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_callback_key_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          settings.setValue(mContext, undefined, 'testvalue', (result) => {
            console.info("[settings_set_value_callback_key_undefined] result = " + result);
            expect().assertFail();
            done();
          });
        } catch (err) {
          console.error("[settings_set_value_callback_key_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1], type. String expected")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_callback_value_null
     * @tc.number settings_set_value_callback_value_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_callback_value_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          settings.setValue(mContext, 'testkey', null, (result) => {
            console.info("[settings_set_value_callback_value_null] result = " + result);
            expect().assertFail();
            done();
          });
        } catch (err) {
          console.error("[settings_set_value_callback_value_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2], type. String expected")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_callback_value_undefined
     * @tc.number settings_set_value_callback_value_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_callback_value_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          settings.setValue(mContext, 'testkey', undefined, (result) => {
            console.info("[settings_set_value_callback_value_undefined] result = " + result);
            expect().assertFail();
            done();
          });
        } catch (err) {
          console.error("[settings_set_value_callback_value_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2], type. String expected")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_domain_empty
     * @tc.number settings_set_value_domain_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_domain_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let result =
          await settings.setValue(mContext, 'setvalue1', 'value1', '');
        expect(result === null).assertTrue();
        done();
      } catch (err) {
        console.error("[settings_set_value_domain_empty] error = " + err);
        expect().assertFail();
        done();
        return;
      }
    });

    /**
     * @tc.name   settings_set_value_domain_null
     * @tc.number settings_set_value_domain_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_domain_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result =
            await settings.setValue(mContext, 'setvalue1', 'value1', null);
          expect(result === null).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_set_value_domain_null] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_domain_undefined
     * @tc.number settings_set_value_domain_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_domain_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result =
            await settings.setValue(mContext, 'setvalue1', 'value1', undefined);
          expect(result === null).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_set_value_domain_undefined] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_sync_context_null
     * @tc.number settings_set_value_sync_context_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_context_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: boolean = settings.setValueSync(null, 'name', 'value1', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_context_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_sync_context_undefined
     * @tc.number settings_set_value_sync_context_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_context_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: boolean = settings.setValueSync(undefined, 'name', 'value1', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_context_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_sync_key_null
     * @tc.number settings_set_value_sync_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: boolean =
            settings.setValueSync(mContext, null, 'value1', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_key_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_sync_key_undefined
     * @tc.number settings_set_value_sync_key_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_key_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: boolean =
            settings.setValueSync(mContext, undefined, 'value1', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_key_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_sync_key_empty
     * @tc.number settings_set_value_sync_key_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_key_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: boolean =
            settings.setValueSync(mContext, '', 'value1', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_key_empty] error = " + err);
          expect(err.code).assertEqual(201);
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_sync_value_null
     * @tc.number settings_set_value_sync_value_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_value_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: boolean =
            settings.setValueSync(mContext, 'testkey', null, settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_value_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_sync_value_undefined
     * @tc.number settings_set_value_sync_value_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_value_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: boolean =
            settings.setValueSync(mContext, 'testkey', undefined, settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_value_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_sync_value_empty
     * @tc.number settings_set_value_sync_value_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_value_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: boolean =
            settings.setValueSync(mContext, 'testkey', '', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_value_empty] error = " + err);
          expect(err.code).assertEqual(201);
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_sync_domain_null
     * @tc.number settings_set_value_sync_domain_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_domain_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: boolean =
            settings.setValueSync(mContext, 'testkey', 'testvalue', null);
          expect(result === null).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_domain_null] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_sync_domain_undefined
     * @tc.number settings_set_value_sync_domain_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_domain_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: boolean =
            settings.setValueSync(mContext, 'testkey', 'testvalue', undefined);
          expect(result === null).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_domain_undefined] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_set_value_sync_domain_empty
     * @tc.number settings_set_value_sync_domain_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_domain_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: boolean =
            settings.setValueSync(mContext, 'testkey', 'testvalue', '');
          expect(result === null).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_set_value_sync_domain_empty] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_context_null
     * @tc.number settings_get_value_context_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_context_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result =
            await settings.getValue(null, 'testkey', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_get_value_context_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_callback_key_null
     * @tc.number settings_get_value_callback_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_callback_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          settings.getValue(mContext, null, (err: Error, value: string) => {
            expect().assertFail();
            done();
          });
        } catch (err) {
          console.error("[settings_get_value_context_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1], type. String expected")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_callback_key_undefined
     * @tc.number settings_get_value_callback_key_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_callback_key_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          settings.getValue(mContext, undefined, (err: Error, value: string) => {
            expect().assertFail();
            done();
          });
        } catch (err) {
          console.error("[settings_get_value_context_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1], type. String expected")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_callback_context_undefined
     * @tc.number settings_get_value_callback_context_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_callback_context_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          settings.getValue(undefined, 'testkey', (err: Error, value: string) => {
            expect().assertFail();
            done();
          });
        } catch (err) {
          console.error("[settings_get_value_callback_context_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_callback_context_null
     * @tc.number settings_get_value_callback_context_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_callback_context_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          settings.getValue(null, 'testkey', (err: Error, value: string) => {
            expect().assertFail();
            done();
          });
        } catch (err) {
          console.error("[settings_get_value_callback_context_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_callback_callback_null
     * @tc.number settings_get_value_callback_callback_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_callback_callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.getValue(mContext, 'testkey', null);
          console.info("[settings_get_value_callback_callback_null] result = " + result);
          expect(result === null).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_get_value_callback_callback_null] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_callback_callback_undefined
     * @tc.number settings_get_value_callback_callback_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_callback_callback_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.getValue(mContext, 'testkey', undefined);
          console.info("[settings_get_value_callback_callback_undefined] result = " + result);
          expect(result === null).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_get_value_callback_callback_undefined] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_callback_callback_empty
     * @tc.number settings_get_value_callback_callback_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_callback_callback_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.getValue(mContext, 'testkey', '');
          console.info("[settings_get_value_callback_callback_empty] result = " + result);
          expect(result === null).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_get_value_callback_callback_empty] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_callback_key_empty
     * @tc.number settings_get_value_callback_key_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_callback_key_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let value: string = 'value';
          await settings.setValue(mContext, '', value,  settings.domainName.DEVICE_SHARED);
          settings.getValue(mContext, '', (err: Error, value: string) => {
            expect().assertFail();
            done();
          });
        } catch (err) {
          console.error("[settings_get_value_callback_key_empty] error = " + err);
          expect(err.code).assertEqual(201);
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_promise_key_empty
     * @tc.number settings_get_value_promise_key_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_promise_key_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let value: string = 'value';
          await settings.setValue(mContext, '', value,  settings.domainName.DEVICE_SHARED);
          let result = await settings.getValue(mContext, '');
        } catch (err) {
          console.error("[settings_get_value_promise_key_empty] error = " + err);
          expect(err.code).assertEqual(201);
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_promise_key_null
     * @tc.number settings_get_value_promise_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_promise_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = await settings.getValue(mContext, null);
        } catch (err) {
          console.error("[settings_get_value_promise_key_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1], type. String expected")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_promise_key_undefined
     * @tc.number settings_get_value_promise_key_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_promise_key_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = await settings.getValue(mContext, undefined);
        } catch (err) {
          console.error("[settings_get_value_promise_key_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1], type. String expected")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_key_null
     * @tc.number settings_get_value_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result =
            await settings.getValue(mContext, null, settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_get_value_key_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1], type. String expected")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_key_empty
     * @tc.number settings_get_value_key_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_key_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let value: string = 'value';
          await settings.setValue(mContext, '', value,  settings.domainName.DEVICE_SHARED);
          let result =
            await settings.getValue(globalThis.abilityContext, '', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_get_value_key_empty] error = " + err);
          expect(err.code).assertEqual(201);
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_domain_empty
     * @tc.number settings_get_value_domain_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_domain_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result =
            await settings.getValue(mContext, 'testkey', '');
          expect(result === null).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_get_value_domain_empty] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_sync_context_null
     * @tc.number settings_get_value_sync_context_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_context_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: string =
            await settings.getValueSync(null, 'testkey', 'defValue', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_context_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_sync_context_undefined
     * @tc.number settings_get_value_sync_context_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_context_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: string =
            await settings.getValueSync(undefined, 'testkey', 'defValue', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_context_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_sync_key_null
     * @tc.number settings_get_value_sync_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: string =
            await settings.getValueSync(mContext, null, 'defValue', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_key_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_sync_key_undefined
     * @tc.number settings_get_value_sync_key_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_key_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: string =
            await settings.getValueSync(mContext, undefined, 'defValue', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_key_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_sync_key_empty
     * @tc.number settings_get_value_sync_key_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_key_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let value: string = 'value';
          await settings.setValue(mContext, '', value,  settings.domainName.DEVICE_SHARED);
          let result: string =
            await settings.getValueSync(globalThis.abilityContext, '', 'defValue', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_key_empty] error = " + err);
          expect(err.code).assertEqual(201);
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_sync_defValue_null
     * @tc.number settings_get_value_sync_defValue_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_defValue_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: string =
            await settings.getValueSync(mContext, 'testkey', null, settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_defValue_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_sync_defValue_undefined
     * @tc.number settings_get_value_sync_defValue_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_defValue_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: string =
            await settings.getValueSync(mContext, 'testkey', undefined, settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_defValue_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_sync_domain_null
     * @tc.number settings_get_value_sync_domain_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_domain_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: string =
            await settings.getValueSync(mContext, 'testkeyadfasdf', 'defValue', null);
          console.info("[settings_get_value_sync_domain_null] result = " + result);
          expect(result === null).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_domain_null] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_sync_domain_undefined
     * @tc.number settings_get_value_sync_domain_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_domain_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result: string =
            await settings.getValueSync(mContext, 'testkeyadfasdf', 'defValue', undefined);
          console.info("[settings_get_value_sync_domain_undefined] result = " + result);
          expect(result === null).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_domain_undefined] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_get_value_sync_domain_empty
     * @tc.number settings_get_value_sync_domain_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_domain_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          await settings.setValue(mContext, 'testkeyadfasdf', 'defValue',  settings.domainName.DEVICE_SHARED);
          let result: string =
            await settings.getValueSync(mContext, 'testkeyadfasdfa', 'defValue', '');
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_domain_empty] error = " + err);
          expect(err.code).assertEqual(201);
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_registerKeyObserver_context_null
     * @tc.number settings_registerKeyObserver_context_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_registerKeyObserver_context_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.registerKeyObserver(null, 'testkey', settings.domainName.DEVICE_SHARED, (err, ret) => {
            done();
          })
          expect(result).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_domain_empty] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_registerKeyObserver_context_undefined
     * @tc.number settings_registerKeyObserver_context_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_registerKeyObserver_context_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.registerKeyObserver(undefined, 'testkey', settings.domainName.DEVICE_SHARED, (err, ret) => {
            done();
          })
          expect(result).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_get_value_sync_domain_empty] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_registerKeyObserver_key_null
     * @tc.number settings_registerKeyObserver_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_registerKeyObserver_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let value = settings.registerKeyObserver(mContext, null, settings.domainName.DEVICE_SHARED, (err, ret) => {
          })
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_registerKeyObserver_key_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_registerKeyObserver_key_empty
     * @tc.number settings_registerKeyObserver_key_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_registerKeyObserver_key_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.registerKeyObserver(mContext, '', settings.domainName.DEVICE_SHARED, (err, ret) => {
            done();
          })
          expect(result).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_registerKeyObserver_key_empty] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_registerKeyObserver_key_undefined
     * @tc.number settings_registerKeyObserver_key_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_registerKeyObserver_key_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result =
            settings.registerKeyObserver(mContext, undefined, settings.domainName.DEVICE_SHARED, (err, ret) => {
              done();
            })
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_registerKeyObserver_key_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_registerKeyObserver_domain_empty
     * @tc.number settings_registerKeyObserver_domain_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_registerKeyObserver_domain_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result =
            settings.registerKeyObserver(mContext, 'testkey', '', (err, ret) => {
              done();
            })
          expect(result).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_registerKeyObserver_domain_empty] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_registerKeyObserver_domain_null
     * @tc.number settings_registerKeyObserver_domain_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_registerKeyObserver_domain_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result =
            settings.registerKeyObserver(mContext, 'testkey', null, (err, ret) => {
              done();
            })
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_registerKeyObserver_domain_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_registerKeyObserver_domain_undefined
     * @tc.number settings_registerKeyObserver_domain_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_registerKeyObserver_domain_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result =
            settings.registerKeyObserver(mContext, 'testkey', undefined, (err, ret) => {
              done();
            })
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_registerKeyObserver_domain_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_unregisterKeyObserver_context_null
     * @tc.number settings_unregisterKeyObserver_context_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_unregisterKeyObserver_context_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let value = settings.unregisterKeyObserver(null, 'testkey', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_unregisterKeyObserver_context_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_unregisterKeyObserver_context_undefined
     * @tc.number settings_unregisterKeyObserver_context_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_unregisterKeyObserver_context_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let value = settings.unregisterKeyObserver(undefined, 'testkey', settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_unregisterKeyObserver_context_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_unregisterKeyObserver_key_null
     * @tc.number settings_unregisterKeyObserver_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_unregisterKeyObserver_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let value = settings.unregisterKeyObserver(mContext, null, settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_unregisterKeyObserver_key_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_unregisterKeyObserver_key_undefined
     * @tc.number settings_unregisterKeyObserver_key_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_unregisterKeyObserver_key_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let value = settings.unregisterKeyObserver(mContext, undefined, settings.domainName.DEVICE_SHARED);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_unregisterKeyObserver_key_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_unregisterKeyObserver_key_empty
     * @tc.number settings_unregisterKeyObserver_key_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_unregisterKeyObserver_key_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.unregisterKeyObserver(mContext, '', settings.domainName.DEVICE_SHARED);
          expect(result).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_unregisterKeyObserver_key_empty] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_unregisterKeyObserver_domain_null
     * @tc.number settings_unregisterKeyObserver_domain_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_unregisterKeyObserver_domain_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.unregisterKeyObserver(mContext, 'testkey', null);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_unregisterKeyObserver_domain_null] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_unregisterKeyObserver_domain_undefined
     * @tc.number settings_unregisterKeyObserver_domain_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_unregisterKeyObserver_domain_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.unregisterKeyObserver(mContext, 'testkey', undefined);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_unregisterKeyObserver_domain_undefined] error = " + err);
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_unregisterKeyObserver_domain_empty
     * @tc.number settings_unregisterKeyObserver_domain_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_unregisterKeyObserver_domain_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.unregisterKeyObserver(mContext, 'testkeytet', '');
          expect(result === false).assertTrue();
          done();
        } catch (err) {
          console.error("[settings_unregisterKeyObserver_domain_empty] error = " + err);
          expect().assertFail();
          done();
          return;
        }
      });

    /**
     * @tc.name   settings_openNetworkManagerSettings_context_null
     * @tc.number settings_openNetworkManagerSettings_context_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_openNetworkManagerSettings_context_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let value = await settings.openNetworkManagerSettings(null);
          expect().assertFail();
          done();
        } catch (err) {
          console.error("[settings_openNetworkManagerSettings_context_null] error = " + err);
          expect(err?.message == "Parameter error.")
            .assertTrue();
          done();
          return;
        }
      });

    /**
     * @tc.name   openInputMethodSettings_invalid_context
     * @tc.number openInputMethodSettings_invalid_context
     * @tc.desc   openInputMethodSettings_invalid_context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodSettings_invalid_context', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodSettings(null);
      } catch (err) {
        console.error("[openInputMethodSettings_invalid_context] error = " + err);
        code = err.code;
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });

    /**
     * @tc.name   openInputMethodSettings_invalid_context_undefined
     * @tc.number openInputMethodSettings_invalid_context_undefined
     * @tc.desc   openInputMethodSettings_invalid_context_undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodSettings_invalid_context_undefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodSettings(undefined);
      } catch (err) {
        console.error("[openInputMethodSettings_invalid_context_undefined] error = " + err);
        code = err.code;
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });
    
    /**
     * @tc.name   openInputMethodSettings_valid_param
     * @tc.number openInputMethodSettings_valid_param
     * @tc.desc   openInputMethodSettings_valid_param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodSettings_valid_param', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      let code = 0;
      try {
        settings.openInputMethodSettings(mContext);
      } catch (err) {
        console.error("[openInputMethodSettings_valid_param] error = " + err);
        code = err?.code;
      }
      console.info("[openInputMethodSettings_valid_param] sleep 1s");
      await CommonFunc.sleep(1000);
      let driver = await uitest.Driver.create();
      console.info("[openInputMethodSettings_valid_param] code = " + code);
      let textComponent = await driver.findComponent(uitest.ON.text('输入法管理'));
      console.info("[openInputMethodSettings_valid_param] text = " + textComponent);
      if (!isDeviceSupportInputMethod()) {
        expect(textComponent === undefined || textComponent === null).assertTrue();
      } else {
        expect(code).assertEqual(0);
      }
      done();
    });

    /**
     * @tc.name   openInputMethodDetail_invalid_context
     * @tc.number openInputMethodDetail_invalid_context
     * @tc.desc   openInputMethodDetail_invalid_context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodDetail_invalid_context', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let context = null;
      let code = 0;
      try {
        settings.openInputMethodDetail(null, 'bundleName', 'inputMethodId');
      } catch (err) {
        console.error("[openInputMethodDetail_invalid_context] error = " + err);
        code = err.code;
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });

    /**
     * @tc.name   openInputMethodDetail_invalid_context_undefined
     * @tc.number openInputMethodDetail_invalid_context_undefined
     * @tc.desc   openInputMethodDetail_invalid_context_undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodDetail_invalid_context_undefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let context = null;
      let code = 0;
      try {
        settings.openInputMethodDetail(undefined, 'bundleName', 'inputMethodId');
      } catch (err) {
        console.error("[openInputMethodDetail_invalid_context_undefined] error = " + err);
        code = err.code;
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
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
    it('openInputMethodDetail_invalid_bundleName', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodDetail(mContext, null, 'inputMethodId');
      } catch (err) {
        console.error("[openInputMethodDetail_invalid_bundleName] error = " + err);
        code = err.code;
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });

    /**
     * @tc.name   openInputMethodDetail_invalid_bundleName_empty
     * @tc.number openInputMethodDetail_invalid_bundleName_empty
     * @tc.desc   openInputMethodDetail_invalid_bundleName_empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodDetail_invalid_bundleName_empty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodDetail(mContext, '', 'inputMethodId');
      } catch (err) {
        console.error("[openInputMethodDetail_invalid_bundleName_empty] error = " + err);
        code = err.code;
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });

    /**
     * @tc.name   openInputMethodDetail_invalid_bundleName_undefined
     * @tc.number openInputMethodDetail_invalid_bundleName_undefined
     * @tc.desc   openInputMethodDetail_invalid_bundleName_undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodDetail_invalid_bundleName_undefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodDetail(mContext, undefined, 'inputMethodId');
      } catch (err) {
        console.error("[openInputMethodDetail_invalid_bundleName_undefined] error = " + err);
        code = err.code;
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
    it('openInputMethodDetail_invalid_method', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodDetail(mContext, 'bundleName', null);
      } catch (err) {
        console.error("[openInputMethodDetail_invalid_method] error = " + err);
        code = err.code;
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });

    /**
     * @tc.name   openInputMethodDetail_invalid_method_undefined
     * @tc.number openInputMethodDetail_invalid_method_undefined
     * @tc.desc   openInputMethodDetail_invalid_method_undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodDetail_invalid_method_undefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodDetail(mContext, 'bundleName', undefined);
      } catch (err) {
        console.error("[openInputMethodDetail_invalid_method_undefined] error = " + err);
        code = err.code;
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });

    /**
     * @tc.name   openInputMethodDetail_invalid_method_empty
     * @tc.number openInputMethodDetail_invalid_method_empty
     * @tc.desc   openInputMethodDetail_invalid_method_empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openInputMethodDetail_invalid_method_empty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      if (!isDeviceSupportInputMethod()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openInputMethodDetail(mContext, 'bundleName', '');
      } catch (err) {
        console.error("[openInputMethodDetail_invalid_method_empty] error = " + err);
        code = err.code;
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
    it('openInputMethodDetail_valid_param', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      let code = 0;
      try {
        settings.openInputMethodDetail(mContext, 'bundleName', 'inputMethodId');
      } catch (err) {
        console.error("[openInputMethodDetail_valid_param] error = " + err);
        code = err.code;
      }
      console.info("[openInputMethodDetail_valid_param] sleep 1s");
      await CommonFunc.sleep(1000);
      let driver = await uitest.Driver.create();
      let textComponent = await driver.findComponent(uitest.ON.text('输入法'));
      console.info("[openInputMethodSettings_valid_param] text = " + textComponent);
      if (!isDeviceSupportInputMethod()) {
        expect(textComponent === undefined || textComponent === null).assertTrue();
      } else {
        expect(code).assertEqual(0);
      }
      done();
    });

    /**
     * @tc.name   settings_get_uri_promise_empty
     * @tc.number settings_get_uri_promise_empty
     * @tc.desc   settings_get_uri_promise_empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_uri_promise_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let uri = await settings.getURI('');
        console.info("[settings_get_uri_promise_empty] uri is: " + uri);
        expect(uri).assertEqual('datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=')
        done();
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_get_uri_promise_empty] error = " + errMsg);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   settings_get_uri_promise_null
     * @tc.number settings_get_uri_promise_null
     * @tc.desc   settings_get_uri_promise_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_uri_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let uri = await settings.getURI(null);
        console.info("[settings_get_uri_promise_null] uri is: " + uri);
        expect().assertFail();
        done();
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_get_uri_promise_null] error = " + errMsg);
        expect(errMsg ==
          "Error: assertion (valueType == napi_string) failed: uri Wrong argument type. String expected.")
          .assertTrue();
        done();
      }
    });

    /**
     * @tc.name   settings_get_uri_promise_undefined
     * @tc.number settings_get_uri_promise_undefined
     * @tc.desc   settings_get_uri_promise_undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_uri_promise_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let uri = await settings.getURI(undefined);
        console.info("[settings_get_uri_promise_undefined] uri is: " + uri);
        expect().assertFail();
        done();
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_get_uri_promise_undefined] error = " + errMsg);
        expect(errMsg ==
          "Error: assertion (valueType == napi_string) failed: uri Wrong argument type. String expected.")
          .assertTrue();
        done();
      }
    });

    /**
     * @tc.name   settings_get_uri_callback_null
     * @tc.number settings_get_uri_callback_null
     * @tc.desc   settings_get_uri_callback_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_uri_callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let uri = settings.getURI(null, (value) => {
          console.info("[settings_get_uri_callback_null] value is: " + value);
          expect().assertFail();
          done();
        });
        console.info("[settings_get_uri_callback_null] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_get_uri_callback_null] error = " + errMsg);
        expect(errMsg ==
          "Error: assertion (valueType == napi_string) failed: uri Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    /**
     * @tc.name   settings_get_uri_callback_undefined
     * @tc.number settings_get_uri_callback_undefined
     * @tc.desc   settings_get_uri_callback_undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_uri_callback_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let uri = settings.getURI(undefined, (value) => {
          console.info("[settings_get_uri_callback_undefined] value is: " + value);
          expect().assertFail();
          done();
        });
        console.info("[settings_get_uri_callback_undefined] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_get_uri_callback_undefined] error = " + errMsg);
        expect(errMsg ==
          "Error: assertion (valueType == napi_string) failed: uri Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

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
          let result = settings.setValueSync(mContext, 'testkey', 'testvalue');
          console.info("[settings_set_value_sync_no_domain] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_sync_no_domain] error is:" + String(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_sync_no_domain_key_empty
     * @tc.number settings_set_value_sync_no_domain_key_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_no_domain_key_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.setValueSync(mContext, '', 'testvalue');
          console.info("[settings_set_value_sync_no_domain_key_empty] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_sync_no_domain_key_empty] error is:" + String(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_sync_no_domain_key_null
     * @tc.number settings_set_value_sync_no_domain_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_no_domain_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.setValueSync(mContext, null, 'testvalue');
          console.info("[settings_set_value_sync_no_domain_key_null] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_sync_no_domain_key_null] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_sync_no_domain_key_undefined
     * @tc.number settings_set_value_sync_no_domain_key_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_no_domain_key_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.setValueSync(mContext, undefined, 'testvalue');
          console.info("[settings_set_value_sync_no_domain_key_undefined] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_sync_no_domain_key_undefined] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_sync_no_domain_value_empty
     * @tc.number settings_set_value_sync_no_domain_value_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_no_domain_value_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.setValueSync(mContext, 'testkey', '');
          console.info("[settings_set_value_sync_no_domain_value_empty] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_sync_no_domain_value_empty] error is:" + String(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_sync_no_domain_value_null
     * @tc.number settings_set_value_sync_no_domain_value_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_no_domain_value_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.setValueSync(mContext, 'testkey', null);
          console.info("[settings_set_value_sync_no_domain_value_empty] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_sync_no_domain_value_null] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_sync_no_domain_value_undefined
     * @tc.number settings_set_value_sync_no_domain_value_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_sync_no_domain_value_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.setValueSync(mContext, 'testkey', undefined);
          console.info("[settings_set_value_sync_no_domain_value_undefined] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_sync_no_domain_value_undefined] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_get_value_sync_no_domain
     * @tc.number settings_get_value_sync_no_domain
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_no_domain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let defValue: string = 'defValue';
          let result = settings.getValueSync(mContext, 'testkeydef', defValue);
          console.info("[settings_get_value_sync_no_domain] result:" + result);
          expect(result === defValue).assertTrue();
          done();
        } catch (err) {
          console.info("[settings_get_value_sync_no_domain] error is:" + String(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   settings_get_value_sync_no_domain_key_empty
     * @tc.number settings_get_value_sync_no_domain_key_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_no_domain_key_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let defValue: string = 'defValue';
          let result = settings.getValueSync(mContext, '', defValue);
          console.info("[settings_get_value_sync_no_domain_key_empty] result:" + result);
          expect(result === defValue).assertTrue();
          done();
        } catch (err) {
          console.info("[settings_get_value_sync_no_domain_key_empty] error is:" + String(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   settings_get_value_sync_no_domain_key_null
     * @tc.number settings_get_value_sync_no_domain_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_no_domain_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let defValue: string = 'defValue';
          let result = settings.getValueSync(mContext, null, defValue);
          console.info("[settings_get_value_sync_no_domain_key_null] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_get_value_sync_no_domain_key_null] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_get_value_sync_no_domain_key_undefined
     * @tc.number settings_get_value_sync_no_domain_key_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_no_domain_key_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let defValue: string = 'defValue';
          let result = settings.getValueSync(mContext, undefined, defValue);
          console.info("[settings_get_value_sync_no_domain_key_undefined] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_get_value_sync_no_domain_key_undefined] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1] type. String expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_get_value_sync_no_domain_value_empty
     * @tc.number settings_get_value_sync_no_domain_value_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_no_domain_value_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let defValue: string = '';
          let result = settings.getValueSync(mContext, 'getValueSynckey1', '');
          console.info("[settings_get_value_sync_no_domain_value_empty] result:" + result);
          expect(result === defValue).assertTrue();
          done();
        } catch (err) {
          console.info("[settings_get_value_sync_no_domain_value_empty] error is:" + String(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   settings_get_value_sync_no_domain_value_null
     * @tc.number settings_get_value_sync_no_domain_value_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_no_domain_value_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.getValueSync(mContext, 'getValueSynckey1', null);
          console.info("[settings_get_value_sync_no_domain_value_null] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_get_value_sync_no_domain_value_null] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_get_value_sync_no_domain_value_undefined
     * @tc.number settings_get_value_sync_no_domain_value_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_get_value_sync_no_domain_value_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = settings.getValueSync(mContext, 'getValueSynckey1', undefined);
          console.info("[settings_get_value_sync_no_domain_value_undefined] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_get_value_sync_no_domain_value_undefined] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
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
          let result = await settings.setValue(mContext, 'setVlauekey1', 'value1');
          console.info("[settings_set_value_no_domain] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_no_domain] error is:" + String(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_no_domain_context_null
     * @tc.number settings_set_value_no_domain_context_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_no_domain_context_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = await settings.setValue(null, 'setVlauekey1', 'value1');
          console.info("[settings_set_value_no_domain_context_null] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_no_domain_context_null] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_no_domain_context_undefined
     * @tc.number settings_set_value_no_domain_context_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_no_domain_context_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = await settings.setValue(undefined, 'setVlauekey1', 'value1');
          console.info("[settings_set_value_no_domain_context_undefined] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_no_domain_context_undefined] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_no_domain_key_empty
     * @tc.number settings_set_value_no_domain_key_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_no_domain_key_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = await settings.setValue(mContext, '', 'value1');
          console.info("[settings_set_value_no_domain_key_empty] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_no_domain_key_empty] error is:" + String(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_no_domain_key_null
     * @tc.number settings_set_value_no_domain_key_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_no_domain_key_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = await settings.setValue(mContext, null, 'value1');
          console.info("[settings_set_value_no_domain_key_null] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_no_domain_key_null] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1], type. String expected")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_no_domain_key_undefined
     * @tc.number settings_set_value_no_domain_key_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_no_domain_key_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = await settings.setValue(mContext, undefined, 'value1');
          console.info("[settings_set_value_no_domain_key_undefined] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_no_domain_key_undefined] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[1], type. String expected")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_no_domain_value_empty
     * @tc.number settings_set_value_no_domain_value_empty
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_no_domain_value_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = await settings.setValue(mContext, 'setvaluekey212', '');
          console.info("[settings_set_value_no_domain_value_empty] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_no_domain_value_empty] error is:" + String(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_no_domain_value_null
     * @tc.number settings_set_value_no_domain_value_null
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_no_domain_value_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = await settings.setValue(mContext, 'setvaluekey212', null);
          console.info("[settings_set_value_no_domain_value_null] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_no_domain_value_null] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2], type. String expected")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   settings_set_value_no_domain_value_undefined
     * @tc.number settings_set_value_no_domain_value_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('settings_set_value_no_domain_value_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = await settings.setValue(mContext, 'setvaluekey212', undefined);
          console.info("[settings_set_value_no_domain_value_undefined] result:" + result);
          expect().assertFail();
          done();
        } catch (err) {
          console.info("[settings_set_value_no_domain_value_undefined] error is:" + String(err));
          expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2], type. String expected")
            .assertTrue();
          done();
        }
      });

    /**
     * @tc.name   openNfcSettingsPage_invalid_context
     * @tc.number openNfcSettingsPage_invalid_context
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openNfcSettingsPage_invalid_context', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function) => {
        if (!isDeviceSupportNfc()) {
          done();
          return;
        }
        let code = 0;
        try {
          settings.openNfcSettingsPage(null);
        } catch (err) {
          console.error("[openNfcSettingsPage_invalid_context] error = " + err);
          code = err?.code;
        }
        expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
        done();
      });

    /**
     * @tc.name   openNfcSettingsPage_invalid_context_undefined
     * @tc.number openNfcSettingsPage_invalid_context_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openNfcSettingsPage_invalid_context_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function) => {
        if (!isDeviceSupportNfc()) {
          done();
          return;
        }
        let code = 0;
        try {
          settings.openNfcSettingsPage(undefined);
        } catch (err) {
          console.error("[openNfcSettingsPage_invalid_context_undefined] error = " + err);
          code = err?.code;
        }
        expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
        done();
      });

    /**
     * @tc.name   openNfcSettingsPage_invalid_context_applicationContext
     * @tc.number openNfcSettingsPage_invalid_context_applicationContext
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openNfcSettingsPage_invalid_context_applicationContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function) => {
        if (!isDeviceSupportNfc()) {
          done();
          return;
        }
        let code = 0;
        try {
          settings.openNfcSettingsPage(mContext?.getApplicationContext());
        } catch (err) {
          console.error("[openNfcSettingsPage_invalid_context_applicationContext] error = " + err);
          code = err?.code;
        }
        expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
        done();
      });

    /**
     * @tc.name   openNfcSettingsPage_valid_param
     * @tc.number openNfcSettingsPage_valid_param
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openNfcSettingsPage_valid_param', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function) => {
        if (!isDeviceSupportNfc()) {
          done();
          return;
        }
        let code = 0;
        try {
          settings.openNfcSettingsPage(mContext);
        } catch (err) {
          console.error("[openNfcSettingsPage_valid_param] error = " + err);
          code = err?.code;
        }
        expect(code).assertEqual(0);
        done();
      });

    /**
      * @tc.name   openBiometricsSettingsPage_invalid_context
      * @tc.number openBiometricsSettingsPage_invalid_context
      * @tc.desc   MediumTest
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('openBiometricsSettingsPage_invalid_context', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function) => {
        if (!isDeviceSupportBiometrics()) {
          done();
          return;
        }
        let code = 0;
        try {
          settings.openBiometricsSettingsPage(null);
        } catch (err) {
          console.error("[openBiometricsSettingsPage_invalid_context] error = " + err);
          code = err?.code;
        }
        expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
        done();
      });

    /**
     * @tc.name   openBiometricsSettingsPage_invalid_context_undefined
     * @tc.number openBiometricsSettingsPage_invalid_context_undefined
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openBiometricsSettingsPage_invalid_context_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function) => {
        if (!isDeviceSupportBiometrics()) {
          done();
          return;
        }
        let code = 0;
        try {
          settings.openBiometricsSettingsPage(undefined);
        } catch (err) {
          console.error("[openBiometricsSettingsPage_invalid_context_undefined] error = " + err);
          code = err?.code;
        }
        expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
        done();
      });

    /**
     * @tc.name   openBiometricsSettingsPage_invalid_context_applicationContext
     * @tc.number openBiometricsSettingsPage_invalid_context_applicationContext
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openBiometricsSettingsPage_invalid_context_applicationContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function) => {
        if (!isDeviceSupportBiometrics()) {
          done();
          return;
        }
        let code = 0;
        try {
          settings.openBiometricsSettingsPage(mContext?.getApplicationContext());
        } catch (err) {
          console.error("[openBiometricsSettingsPage_invalid_context_applicationContext] error = " + err);
          code = err?.code;
        }
        expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
        done();
      });

    /**
     * @tc.name   openBiometricsSettingsPage_valid_param
     * @tc.number openBiometricsSettingsPage_valid_param
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openBiometricsSettingsPage_valid_param', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function) => {
        if (!isDeviceSupportBiometrics()) {
          done();
          return;
        }
        let code = 0;
        try {
          settings.openBiometricsSettingsPage(mContext);
        } catch (err) {
          console.error("[openBiometricsSettingsPage_valid_param] error = " + err);
          code = err?.code;
        }
        expect(code).assertEqual(0);
        done();
      });

      /**
     * @tc.name   SUB_Applications_Settings_openAboutDeviceSettingsPage_invalid_context_0100
     * @tc.number SUB_Applications_Settings_openAboutDeviceSettingsPage_invalid_context_0100
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Applications_Settings_openAboutDeviceSettingsPage_invalid_context_0100',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAboutDevice()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAboutDeviceSettingsPage(null);
      } catch (err) {
        console.error("[openAboutDeviceSettingsPage_invalid_context] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(16900010);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAboutDeviceSettingsPage_invalid_context_undefined_0200
   * @tc.number SUB_Applications_Settings_openAboutDeviceSettingsPage_invalid_context_undefined_0200
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAboutDeviceSettingsPage_invalid_context_undefined_0200',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAboutDevice()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAboutDeviceSettingsPage(undefined);
      } catch (err) {
        console.error("[openAboutDeviceSettingsPage_invalid_context_undefined] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(16900010);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAboutDeviceSettingsPage_invalid_context_applicationContext_0300
   * @tc.number SUB_Applications_Settings_openAboutDeviceSettingsPage_invalid_context_applicationContext_0300
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAboutDeviceSettingsPage_invalid_context_applicationContext_0300',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAboutDevice()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAboutDeviceSettingsPage(mContext?.getApplicationContext());
      } catch (err) {
        console.error("[openAboutDeviceSettingsPage_invalid_context_applicationContext] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(16900010);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAboutDeviceSettingsPage_valid_param_0400
   * @tc.number SUB_Applications_Settings_openAboutDeviceSettingsPage_valid_param_0400
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAboutDeviceSettingsPage_valid_param_0400',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAboutDevice()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAboutDeviceSettingsPage(mContext);
        expect(code).assertEqual(0);
      } catch (err) {
        console.error("[openAboutDeviceSettingsPage_valid_param] error = " + err);
        code = err?.code;
        expect(code).assertEqual(16900020);
      }
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAppDetailSettingsPage_invalid_context_0100
   * @tc.number SUB_Applications_Settings_openAppDetailSettingsPage_invalid_context_0100
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAppDetailSettingsPage_invalid_context_0100',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAppDetail()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAppDetailSettingsPage(null, 'com.example', 0);
      } catch (err) {
        console.error("[openAppDetailSettingsPage_invalid_context] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(16900010);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAppDetailSettingsPage_invalid_context_undefined_0200
   * @tc.number SUB_Applications_Settings_openAppDetailSettingsPage_invalid_context_undefined_0200
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAppDetailSettingsPage_invalid_context_undefined_0200',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAppDetail()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAppDetailSettingsPage(undefined, 'com.example', 0);
      } catch (err) {
        console.error("[openAppDetailSettingsPage_invalid_context_undefined] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(16900010);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAppDetailSettingsPage_invalid_context_applicationContext_0300
   * @tc.number SUB_Applications_Settings_openAppDetailSettingsPage_invalid_context_applicationContext_0300
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAppDetailSettingsPage_invalid_context_applicationContext_0300',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAppDetail()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAppDetailSettingsPage(mContext?.getApplicationContext(), 'com.example', 0);
      } catch (err) {
        console.error("[openAppDetailSettingsPage_invalid_context_applicationContext] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(16900010);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAppDetailSettingsPage_invalid_bundleName_0400
   * @tc.number SUB_Applications_Settings_openAppDetailSettingsPage_invalid_bundleName_0400
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAppDetailSettingsPage_invalid_bundleName_0400',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAppDetail()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAppDetailSettingsPage(mContext, null, 0);
      } catch (err) {
        console.error("[openAppDetailSettingsPage_invalid_bundleName] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(16900010);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAppDetailSettingsPage_invalid_bundleName_empty_0500
   * @tc.number SUB_Applications_Settings_openAppDetailSettingsPage_invalid_bundleName_empty_0500
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAppDetailSettingsPage_invalid_bundleName_empty_0500',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAppDetail()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAppDetailSettingsPage(mContext, '', 0);
      } catch (err) {
        console.error("[openAppDetailSettingsPage_invalid_bundleName_empty] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(16900010);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAppDetailSettingsPage_invalid_bundleName_undefined_0600
   * @tc.number SUB_Applications_Settings_openAppDetailSettingsPage_invalid_bundleName_undefined_0600
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAppDetailSettingsPage_invalid_bundleName_undefined_0600',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAppDetail()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAppDetailSettingsPage(mContext, undefined, 0);
      } catch (err) {
        console.error("[openAppDetailSettingsPage_invalid_bundleName_undefined] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(16900010);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAppDetailSettingsPage_valid_appIndex_0700
   * @tc.number SUB_Applications_Settings_openAppDetailSettingsPage_valid_appIndex_0700
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAppDetailSettingsPage_valid_appIndex_0700',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAppDetail()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAppDetailSettingsPage(mContext, 'com.example', null);
        expect(code).assertEqual(0);
      } catch (err) {
        console.error("[openAppDetailSettingsPage_valid_appIndex] error = " + err);
        code = err?.code;
        expect(code).assertEqual(16900020);
      }
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAppDetailSettingsPage_valid_appIndex_undefined_0800
   * @tc.number SUB_Applications_Settings_openAppDetailSettingsPage_valid_appIndex_undefined_0800
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAppDetailSettingsPage_valid_appIndex_undefined_0800',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAppDetail()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAppDetailSettingsPage(mContext, 'com.example', undefined);
        expect(code).assertEqual(0);
      } catch (err) {
        console.error("[openAppDetailSettingsPage_valid_appIndex_undefined] error = " + err);
        code = err?.code;
        expect(code).assertEqual(16900020);
      }
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAppDetailSettingsPage_valid_param_0900
   * @tc.number SUB_Applications_Settings_openAppDetailSettingsPage_valid_param_0900
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAppDetailSettingsPage_valid_param_0900',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAppDetail()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAppDetailSettingsPage(mContext, 'com.example');
        expect(code).assertEqual(0);
      } catch (err) {
        console.error("[openAppDetailSettingsPage_valid_param] error = " + err);
        code = err?.code;
        expect(code).assertEqual(16900020);
      }
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openAppDetailSettingsPage_valid_param_1000
   * @tc.number SUB_Applications_Settings_openAppDetailSettingsPage_valid_param_1000
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openAppDetailSettingsPage_valid_param_1000',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportAppDetail()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openAppDetailSettingsPage(mContext, 'com.example', 0);
        expect(code).assertEqual(0);
      } catch (err) {
        console.error("[openAppDetailSettingsPage_valid_param] error = " + err);
        code = err?.code;
        expect(code).assertEqual(16900020);
      }
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openDoubleClickSettingsPage_invalid_context_0100
   * @tc.number SUB_Applications_Settings_openDoubleClickSettingsPage_invalid_context_0100
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openDoubleClickSettingsPage_invalid_context_0100',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportDoubleClick()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openDoubleClickSettingsPage(null);
      } catch (err) {
        console.error("[openDoubleClickSettingsPage_invalid_context] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openDoubleClickSettingsPage_invalid_context_undefined_0200
   * @tc.number SUB_Applications_Settings_openDoubleClickSettingsPage_invalid_context_undefined_0200
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openDoubleClickSettingsPage_invalid_context_undefined_0200',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportDoubleClick()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openDoubleClickSettingsPage(undefined);
      } catch (err) {
        console.error("[openDoubleClickSettingsPage_invalid_context_undefined] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openDoubleClickSettingsPage_invalid_context_applicationContext_0300
   * @tc.number SUB_Applications_Settings_openDoubleClickSettingsPage_invalid_context_applicationContext_0300
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openDoubleClickSettingsPage_invalid_context_applicationContext_0300',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportDoubleClick()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openDoubleClickSettingsPage(mContext?.getApplicationContext());
      } catch (err) {
        console.error("[openDoubleClickSettingsPage_invalid_context_applicationContext] error = " + err);
        code = err?.code;
      }
      expect(code).assertEqual(SETTINGS_PARAM_INVALID_CODE);
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_openDoubleClickSettingsPage_valid_param_0400
   * @tc.number SUB_Applications_Settings_openDoubleClickSettingsPage_valid_param_0400
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_openDoubleClickSettingsPage_valid_param_0400',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportDoubleClick()) {
        done();
        return;
      }
      let code = 0;
      try {
        settings.openDoubleClickSettingsPage(mContext);
        expect(code).assertEqual(0);
      } catch (err) {
        console.error("[openDoubleClickSettingsPage_valid_param] error = " + err);
        code = err?.code;
        expect(code).assertEqual(16900020);
      }
      done();
    });

  /**
   * @tc.name   SUB_Applications_Settings_isDoubleClickAppForSelf_false_return_0100
   * @tc.number SUB_Applications_Settings_isDoubleClickAppForSelf_false_return_0100
   * @tc.desc   MediumTest
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Applications_Settings_isDoubleClickAppForSelf_false_return_0100',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: Function) => {
      if (!isDeviceSupportDoubleClick()) {
        done();
        return;
      }
      let re = false;
      let code = 0;
      try {
        re = await settings.isDoubleClickAppForSelf();
        expect(re).assertEqual(false);
      } catch (err) {
        console.error("[isDoubleClickAppForSelf_false_return] error = " + err);
        expect(code).assertEqual(0);
      }
      done();
    });

  })
}
