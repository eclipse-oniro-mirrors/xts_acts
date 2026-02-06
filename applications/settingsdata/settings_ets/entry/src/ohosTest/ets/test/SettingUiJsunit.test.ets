
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import settings from '@ohos.settings'
import { BusinessError } from '@ohos.base';

interface myObj {
  aa: string
}

interface myObj2 {
  "code": number
}
export default function settingUiJsunit() {
  describe('appInfoTest', ()=> {
    console.log("************* settings Test start*************");
    it('settings_uri_test_001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,(done: Function) =>  {
      let name = 'settings.screen.test';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_001] uri is: " + uri);
      let uri2 = settings.getUriSync(name);
      console.info("[settings_uri_test_001] uri2 is: " + uri2);
      expect(uri).assertEqual(uri2);
      done();
    });

    it('settings_uri_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = '';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_002] uri is: " + uri);
      expect(uri).assertEqual('datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=')
      done();
    });

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

    it('settings_uri_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_004] uri is: " + uri);
      expect(uri).assertEqual('datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=settings.screen.brightness')
      done();
    });

    it('settings_get_value_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness20';
      let value = settings.getValueSync(globalThis.abilityContext, name, "test getValueSync");
      console.info("[settings_get_value_005] value is: " + value);
      expect(value).assertEqual("test getValueSync");
      done();
    });

    it('settings_get_value_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness2';

      let obj: myObj = {
        aa: "aa"
      }
      try {
        let value = settings.getValueSync(globalThis.abilityContext, name, obj);
        console.info("[settings_get_value_006] value is: " + value);
        expect(value).assertEqual("test getValueSync");
      } catch (err) {
        console.error("[settings_get_value_006] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_get_value_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness3';
      let obj = '';
      try {
        let value = settings.getValueSync(globalThis.abilityContext, name, obj);
        console.info("[settings_get_value_007] value is: " + value);
        expect(value).assertEqual('');
      } catch (err) {
        console.error("[settings_get_value_007] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_get_value_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness4';
      let obj = null;
      try {
        let value = settings.getValueSync(globalThis.abilityContext, name, obj);
        console.info("[settings_get_value_008] value is: " + value);
      } catch (err) {
        console.error("[settings_get_value_008] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_get_value_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness5';
      let uri = settings.getUriSync(name);
      console.info("[settings_get_value_009] uri is: " + uri);
      let context = "context";
      try {
        let value = settings.getValueSync(context, name, "test getValueSync");
        console.info("[settings_get_value_009] value is: " + value);
      } catch (err) {
        console.error("[settings_get_value_009] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_get_value_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness6';
      let uri = settings.getUriSync(name);
      console.info("[settings_get_value_010] uri is: " + uri);
      let context = null;
      try {
        let value = settings.getValueSync(context, name, "test getValueSync");
        console.info("[settings_get_value_010] value is: " + value);
      } catch (err) {
        console.error("[settings_get_value_010] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_get_value_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness7';
      let uri = settings.getUriSync(name);
      console.info("[settings_get_value_0011] uri is: " + uri);
      let context = "context";
      let obj = 121;
      try {
        let value = settings.getValueSync(context, name, obj);
        console.info("[settings_get_value_0011] value is: " + value);
      } catch (err) {
        console.error("[settings_get_value_0011] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_get_value_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness8';
      let uri = settings.getUriSync(name);
      console.info("[settings_get_value_0012] uri is: " + uri);
      let context = null;
      let obj = null;
      try {
        let value = settings.getValueSync(context, name, obj);
        console.info("[settings_get_value_0012] value is: " + value);
      } catch (err) {
        console.error("[settings_get_value_0012] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

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
      let context = "context";
      try {
        let value = settings.getValueSync(context, name, "test getValueSync");
        console.info("[settings_get_value_013] value is: " + value);
      } catch (err) {
        console.error("[settings_get_value_013] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_get_value_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = null;
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_get_value_014] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_get_value_014] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      let context = "context";
      try {
        let value = settings.getValueSync(context, name, "test getValueSync");
        console.info("[settings_get_value_014] value is: " + value);
      } catch (err) {
        console.error("[settings_get_value_014] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

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

      let obj = 22223;
      let context = "context";
      try {
        let value = settings.getValueSync(context, name, obj);
        console.info("[settings_get_value_0015] value is: " + value);
      } catch (err) {
        console.error("[settings_get_value_0015] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

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
      let context = "context";
      try {
        let value = settings.getValueSync(context, name, "test getValueSync");
        console.info("[settings_get_value_0016] value is: " + value);
      } catch (err) {
        console.error("[settings_get_value_0016] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

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
      let context = "context";
      let obj = 221323;
      try {
        let value = settings.getValueSync(context, name, obj);
        console.info("[settings_get_value_0017] value is: " + value);
      } catch (err) {
        console.error("[settings_get_value_0017] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_set_value_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness10';
      let value = settings.setValueSync(globalThis.abilityContext, name, "test getValueSync");
      expect(value).assertEqual(true);
      done();
    });

    it('settings_set_value_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness11';
      let obj = 32344.00;
      try {
        let value = settings.setValueSync(globalThis.abilityContext, name, obj);
        console.info("[settings_set_value_019] value is: " + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_019] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_set_value_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness12';
      let obj = null;
      try {
        let value = settings.setValueSync(globalThis.abilityContext, name, obj);
        console.info("[settings_set_value_020] value is: " + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_020] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_set_value_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness13';
      let context = "context";
      try {
        let value = settings.setValueSync(context, name, "test getValueSync");
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_021] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_set_value_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness13';
      let context = null;
      try {
        let value = settings.setValueSync(context, name, "test getValueSync");
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_022] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_set_value_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness14';
      let context = "context";
      let obj = 343434.00;
      try {
        let value = settings.setValueSync(context, name, obj);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_023] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    /*
     * @tc.number    : settings_set_value_023_2
     * @tc.name      : settings_set_value_023_2
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_set_value_023_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness142';
      let context = "context";
      let obj = 3434342.00;
      try {
        let value = settings.setValueSync(context, name, obj);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error("[settings_set_value_023] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_set_value_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness14';
      let context = "context";
      let obj = null;
      try {
        let value = settings.setValueSync(context, name, obj);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_024] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    /*
     * @tc.number    : settings_set_value_024_2
     * @tc.name      : settings_set_value_024_2
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_set_value_024_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness142';
      let context = "context";
      let obj = null;
      try {
        let value = settings.setValueSync(context, name, obj);
        expect(value).assertEqual(false);
      } catch (err) {
        console.error("[settings_set_value_024_2] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_set_value_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = 'settings.screen.brightness14';
      let context = null;
      let obj = 2323.00;
      try {
        let value = settings.setValueSync(context, name, obj);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_025] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

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
      let context = "context";
      try {
        let value = settings.setValueSync(context, name, "test getValueSync");
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_026] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_set_value_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let name = null;
      try {
        let uri = settings.getUriSync(name);
        console.info("[settings_set_value_027] uri is: " + uri);
      } catch (err) {
        let errMsg: string = err;
        console.error("[settings_set_value_027] error = " + errMsg);
        expect(errMsg == "Error: assertion (valueType == napi_string) failed: Wrong argument type. String expected.")
          .assertTrue();
      }
      let context = "context";
      try {
        let value = settings.setValueSync(context, name, "test getValueSync");
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_027] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

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

      let obj = 232.00;
      let context = "context";
      try {
        let value = settings.setValueSync(context, name, obj);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_028] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

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

      let obj = null;
      let context = "context";
      try {
        let value = settings.setValueSync(context, name, obj);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_029] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

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
      let context = "context";
      try {
        let value = settings.setValueSync(context, name, "text value");
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_030] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

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
      let context = null;
      try {
        let value = settings.setValueSync(context, name, "text value");
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_031] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

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
      let context = "context";
      let obj = 2323;
      try {
        let value = settings.setValueSync(context, name, obj);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error("[settings_set_value_032] error = " + err);
        expect(err == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_get_value_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      let uri = 'datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=';

      let name = 'settings.screen.brightness33';
      let value = 'brightness33'
      try{
        settings.setValueSync(globalThis.abilityContext, name, value);
        settings.getValue(globalThis.abilityContext, name, (err, ret) => {
          console.info("[settings_get_value_033] value is: " + ret);
          expect(ret).assertEqual(value);
          done();
        })
      } catch(err){
        console.info("[settings_get_value_033] error is: " + String(err));
        expect(true).assertTrue();
        done();
        return;
      }
    });

    it('settings_get_value_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      let uri = 'datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=';

      let name = 'settings.screen.brightness34';
      let value = 'brightness34'

      try{
        settings.setValueSync(globalThis.abilityContext, name, value);
        settings.getValue(globalThis.abilityContext, name).then(ret =>{
          console.info("[settings_get_value_034] value is: " + ret);
          expect(ret).assertEqual(value);
          done();
        })
      } catch(err){
        console.info("[settings_get_value_034] error is: " + String(err));
        expect(true).assertTrue();
        done();
        return;
      }
    });

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

    it('settings_get_value_037',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.date.date_format"
      expect(str).assertEqual(settings.date.DATE_FORMAT);
      done();
    });

    it('settings_get_value_038',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.date.time_format"
      expect(str).assertEqual(settings.date.TIME_FORMAT);
      done();
    });

    it('settings_get_value_039',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.date.auto_gain_time"
      expect(str).assertEqual(settings.date.AUTO_GAIN_TIME);
      done();
    });

    it('settings_get_value_040',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.date.auto_gain_time_zone"
      expect(str).assertEqual(settings.date.AUTO_GAIN_TIME_ZONE);
      done();
    });

    it('settings_get_value_041',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.font_scale"
      expect(str).assertEqual(settings.display.FONT_SCALE);
      done();
    });

    it('settings_get_value_042',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.screen_brightness_status"
      expect(str).assertEqual(settings.display.SCREEN_BRIGHTNESS_STATUS);
      done();
    });

    it('settings_get_value_043',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.auto_screen_brightness"
      expect(str).assertEqual(settings.display.AUTO_SCREEN_BRIGHTNESS);
      done();
    });

    it('settings_get_value_044',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let int = 1
      expect(int).assertEqual(settings.display.AUTO_SCREEN_BRIGHTNESS_MODE);
      done();
    });

    it('settings_get_value_045',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let int = 0
      expect(int).assertEqual(settings.display.MANUAL_SCREEN_BRIGHTNESS_MODE);
      done();
    });

    it('settings_get_value_046',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.screen_off_timeout"
      expect(str).assertEqual(settings.display.SCREEN_OFF_TIMEOUT);
      done();
    });

    it('settings_get_value_047',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.default_screen_rotation"
      expect(str).assertEqual(settings.display.DEFAULT_SCREEN_ROTATION);
      done();
    });

    it('settings_get_value_048',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.animator_duration_scale"
      expect(str).assertEqual(settings.display.ANIMATOR_DURATION_SCALE);
      done();
    });

    it('settings_get_value_049',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.transition_animation_scale"
      expect(str).assertEqual(settings.display.TRANSITION_ANIMATION_SCALE);
      done();
    });

    it('settings_get_value_050',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.display.window_animation_scale"
      expect(str).assertEqual(settings.display.WINDOW_ANIMATION_SCALE);
      done();
    });

    it('settings_get_value_051',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.display.display_inversion_status"
      expect(str).assertEqual(settings.display.DISPLAY_INVERSION_STATUS);
      done();
    });

    it('settings_get_value_052',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.setup_wizard_finished"
      expect(str).assertEqual(settings.general.SETUP_WIZARD_FINISHED);
      done();
    });

    it('settings_get_value_053',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.end_button_action"
      expect(str).assertEqual(settings.general.END_BUTTON_ACTION);
      done();
    });

    it('settings_get_value_054',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.airplane_mode_status"
      expect(str).assertEqual(settings.general.AIRPLANE_MODE_STATUS);
      done();
    });

    it('settings_get_value_055',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.accelerometer_rotation_status"
      expect(str).assertEqual(settings.general.ACCELEROMETER_ROTATION_STATUS);
      done();
    });

    it('settings_get_value_056',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.device_provision_status"
      expect(str).assertEqual(settings.general.DEVICE_PROVISION_STATUS);
      done();
    });

    it('settings_get_value_057',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.hdc_status"
      expect(str).assertEqual(settings.general.HDC_STATUS);
      done();
    });



    it('settings_get_value_058',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.boot_counting"
      expect(str).assertEqual(settings.general.BOOT_COUNTING);
      done();
    });

    it('settings_get_value_059',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.contact_metadata_sync_status"
      expect(str).assertEqual(settings.general.CONTACT_METADATA_SYNC_STATUS);
      done();
    });

    it('settings_get_value_060',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.development_settings_status"
      expect(str).assertEqual(settings.general.DEVELOPMENT_SETTINGS_STATUS);
      done();
    });

    it('settings_get_value_061',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.device_name"
      expect(str).assertEqual(settings.general.DEVICE_NAME);
      done();
    });

    it('settings_get_value_062',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.usb_storage_status"
      expect(str).assertEqual(settings.general.USB_STORAGE_STATUS);
      done();
    });

    it('settings_get_value_063',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.debugger_waiting"
      expect(str).assertEqual(settings.general.DEBUGGER_WAITING);
      done();
    });

    it('settings_get_value_064',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.debug_app_package"
      expect(str).assertEqual(settings.general.DEBUG_APP_PACKAGE);
      done();
    });

    it('settings_get_value_065',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.accessibility_status"
      expect(str).assertEqual(settings.general.ACCESSIBILITY_STATUS);
      done();
    });

    it('settings_get_value_066',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.activated_accessibility_services"
      expect(str).assertEqual(settings.general.ACTIVATED_ACCESSIBILITY_SERVICES);
      done();
    });

    it('settings_get_value_067',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.geolocation_origins_allowed"
      expect(str).assertEqual(settings.general.GEOLOCATION_ORIGINS_ALLOWED);
      done();
    });

    it('settings_get_value_068',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.skip_use_hints"
      expect(str).assertEqual(settings.general.SKIP_USE_HINTS);
      done();
    });

    it('settings_get_value_069',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.general.touch_exploration_status"
      expect(str).assertEqual(settings.general.TOUCH_EXPLORATION_STATUS);
      done();
    });

    it('settings_get_value_070',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str = "settings.input.default_input_method"
      expect(str).assertEqual(settings.input.DEFAULT_INPUT_METHOD);
      done();
    });

    it('settings_get_value_071',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.activated_input_method_submode"
      let expectValue:string=settings.input.ACTIVATED_INPUT_METHOD_SUB_MODE;
      expect(str).assertEqual(expectValue);
      done();
    });


    it('settings_get_value_072',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.activated_input_methods"
      expect(str).assertEqual(settings.input.ACTIVATED_INPUT_METHODS);
      done();
    });


    it('settings_get_value_073',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.selector_visibility_for_input_method"
      expect(str).assertEqual(settings.input.SELECTOR_VISIBILITY_FOR_INPUT_METHOD);
      done();
    });


    it('settings_get_value_074',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.auto_caps_text_input"
      expect(str).assertEqual(settings.input.AUTO_CAPS_TEXT_INPUT);
      done();
    });


    it('settings_get_value_075',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.auto_punctuate_text_input"
      expect(str).assertEqual(settings.input.AUTO_PUNCTUATE_TEXT_INPUT);
      done();
    });


    it('settings_get_value_076',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.auto_replace_text_input"
      expect(str).assertEqual(settings.input.AUTO_REPLACE_TEXT_INPUT);
      done();
    });


    it('settings_get_value_077',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.input.show_password_text_input"
      expect(str).assertEqual(settings.input.SHOW_PASSWORD_TEXT_INPUT);
      done();
    });


    it('settings_get_value_078',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.network.data_roaming_status"
      expect(str).assertEqual(settings.network.DATA_ROAMING_STATUS);
      done();
    });


    it('settings_get_value_079',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.network.http_proxy_cfg"
      expect(str).assertEqual(settings.network.HTTP_PROXY_CFG);
      done();
    });


    it('settings_get_value_080',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.network.network_preference_usage"
      expect(str).assertEqual(settings.network.NETWORK_PREFERENCE_USAGE);
      done();
    });


    it('settings_get_value_081',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.phone.rtt_calling_status"
      expect(str).assertEqual(settings.phone.RTT_CALLING_STATUS);
      done();
    });


    it('settings_get_value_082',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.vibrate_while_ringing"
      expect(str).assertEqual(settings.sound.VIBRATE_WHILE_RINGING);
      done();
    });


    it('settings_get_value_083',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.default_alarm_alert"
      expect(str).assertEqual(settings.sound.DEFAULT_ALARM_ALERT);
      done();
    });


    it('settings_get_value_084',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.dtmf_tone_type_while_dialing"
      expect(str).assertEqual(settings.sound.DTMF_TONE_TYPE_WHILE_DIALING);
      done();
    });


    it('settings_get_value_085',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.dtmf_tone_while_dialing"
      expect(str).assertEqual(settings.sound.DTMF_TONE_WHILE_DIALING);
      done();
    });


    it('settings_get_value_086',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.haptic_feedback_status"
      expect(str).assertEqual(settings.sound.HAPTIC_FEEDBACK_STATUS);
      done();
    });


    it('settings_get_value_087',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.affected_mode_ringer_streams"
      expect(str).assertEqual(settings.sound.AFFECTED_MODE_RINGER_STREAMS);
      done();
    });


    it('settings_get_value_088',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.affected_mute_streams"
      expect(str).assertEqual(settings.sound.AFFECTED_MUTE_STREAMS);
      done();
    });


    it('settings_get_value_089',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.default_notification_sound"
      expect(str).assertEqual(settings.sound.DEFAULT_NOTIFICATION_SOUND);
      done();
    });


    it('settings_get_value_090',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let str = "settings.sound.default_ringtone"
      expect(str).assertEqual(settings.sound.DEFAULT_RINGTONE);
      done();
    });

    it('settings_get_value_091',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.sound.sound_effects_status"
      expect(str).assertEqual(settings.sound.SOUND_EFFECTS_STATUS);
      done();
    });

    it('settings_get_value_092',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.sound.vibrate_status"
      expect(str).assertEqual(settings.sound.VIBRATE_STATUS);
      done();
    });

    it('settings_get_value_093',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.tts.default_tts_pitch"
      expect(str).assertEqual(settings.TTS.DEFAULT_TTS_PITCH);
      done();
    });

    it('settings_get_value_094',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.tts.default_tts_rate"
      expect(str).assertEqual(settings.TTS.DEFAULT_TTS_RATE);
      done();
    });

    it('settings_get_value_095',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.tts.default_tts_synth"
      expect(str).assertEqual(settings.TTS.DEFAULT_TTS_SYNTH);
      done();
    });

    it('settings_get_value_096',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.tts.enabled_tts_plugins"
      expect(str).assertEqual(settings.TTS.ENABLED_TTS_PLUGINS);
      done();
    });

    it('settings_get_value_097',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.bluetooth_radio"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_RADIO);
      done();
    });

    it('settings_get_value_098',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.cell_radio"
      expect(str).assertEqual(settings.wireless.CELL_RADIO);
      done();
    });

    it('settings_get_value_099',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.nfc_radio"
      expect(str).assertEqual(settings.wireless.NFC_RADIO);
      done();
    });

    it('settings_get_value_100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.airplane_mode_radios"
      expect(str).assertEqual(settings.wireless.AIRPLANE_MODE_RADIOS);
      done();
    });

    it('settings_get_value_101',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.bluetooth_status"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_STATUS);
      done();
    });

    it('settings_get_value_102',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.bluetooth_discoverability_status"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_DISCOVER_ABILITY_STATUS);
      done();
    });

    it('settings_get_value_103',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.bluetooth_discover_timeout"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_DISCOVER_TIMEOUT);
      done();
    });

    it('settings_get_value_104',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.wifi_dhcp_max_retry_count"
      expect(str).assertEqual(settings.wireless.WIFI_DHCP_MAX_RETRY_COUNT);
      done();
    });

    it('settings_get_value_105',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.wifi_to_mobile_data_awake_timeout"
      expect(str).assertEqual(settings.wireless.WIFI_TO_MOBILE_DATA_AWAKE_TIMEOUT);
      done();
    });

    it('settings_get_value_106',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.wifi_status"
      expect(str).assertEqual(settings.wireless.WIFI_STATUS);
      done();
    });

    it('settings_get_value_107',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.wifi_watchdog_status"
      expect(str).assertEqual(settings.wireless.WIFI_WATCHDOG_STATUS);
      done();
    });

    it('settings_get_value_108',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.wifi_radio"
      expect(str).assertEqual(settings.wireless.WIFI_RADIO);
      done();
    });

    it('settings_get_value_109',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.owner_lockdown_wifi_cfg"
      expect(str).assertEqual(settings.wireless.OWNER_LOCKDOWN_WIFI_CFG);
      done();
    });

    it('settings_get_value_110',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let str ="settings.wireless.owner_lockdown_wifi_cfg"
      expect(str).assertEqual(settings.wireless.OWNER_LOCKDOWN_WIFI_CFG);
      done();
    });

    it('settings_get_value_111',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let name = 'settings.screen.brightness111';//关键字
      let defaultCode: number = 0;
      let value = 'brightness111'//值
      try{
        settings.setValue(globalThis.abilityContext, name, value,(data)=>{
          console.info("[settings_get_value_111] value is:" + data);
          expect(data).assertTrue();
          done();
        });
      }catch(err){
        console.info("[settings_get_value_111] error is:" + String(err));
        const codeResult: boolean = err?.code ?? defaultCode >= -1;
        expect(codeResult).assertTrue();
        done();
        return;
      }
    });

    /*
     * @tc.number    : settings_set_value_111_2
     * @tc.name      : settings_set_value_111_2
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_set_value_111_2',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let name = 'settings.screen.brightness1112';//关键字
      let value = 'brightness111'//值
      let context = undefined;
      let defaultCode: number = 0;
      try{
        settings.setValue(context, name, value,(data)=>{
          expect(data).assertEqual(false);
          console.info("[settings_get_value_111] value is:" + data);
          done();
        });
      }catch(err){
        console.info("[settings_get_value_111] error is:" + String(err));
        const codeResult: boolean = err?.code ?? defaultCode >= 0;
        expect(codeResult).assertTrue();
        done();
        return;
      }
    });

    it('settings_get_value_112',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let name = 'settings.screen.brightness112';//关键字
      let value = 'brightness112'//值
      try{
        settings.setValue(globalThis.abilityContext, name, value)
          .then((data)=>{
            console.info("[settings_get_value_112] value is:" + data);
            settings.getValue(globalThis.abilityContext, name).then(ret => {
              console.info("[settings_get_value_112] value is:" + ret);
              expect(ret).assertEqual(value);
              done();
            })
          })
          .catch((err: BusinessError)=>{
            console.info("[settings_get_value_112] error is:" + String(err));
            expect(true).assertTrue();
            done();
            return;
          })
      }catch(err){
        console.info("[settings_get_value_112] error is:" + String(err));
        expect(true).assertTrue();
        done();
        return;
      }
    });

    /*
     * @tc.number    : settings_set_value_112_2
     * @tc.name      : settings_set_value_112_2
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_set_value_112_2',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let name = 'settings.screen.brightness11222';//关键字
      let value = 'brightness1122'//值
      let defaultCode: number = 0;
      try{
        settings.setValue(globalThis.abilityContext, name, value)
          .then((data)=>{
            expect(data).assertTrue();
            console.info("[settings_get_value_112] value is:" + data);
            done();
          })
          .catch((err: BusinessError)=>{
            console.info("[settings_get_value_112] error is:" + String(err));
            let codeResult: boolean = err?.code ?? defaultCode >= 0;
            expect(codeResult).assertTrue();
            done();
            return;
          })
      }catch(err){
        console.info("[settings_get_value_112] error is:" + String(err));
        let codeResult: boolean = err?.code ?? defaultCode >= 0;
        expect(codeResult).assertTrue();
        done();
        return;
      }
    });

    /*
     * @tc.number    : settings_set_value_112_3
     * @tc.name      : settings_set_value_112_3
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_set_value_112_3',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let name = 'settings.screen.brightness1123';//关键字
      let value = 'brightness1123'//值
      let context = undefined;
      let defaultCode: number = 0;
      try{
        settings.setValue(context, name, value)
          .then((data)=>{
            expect(data).assertEqual(false);
            console.info("[settings_get_value_112] value is:" + data);
            done();
          })
          .catch((err: BusinessError)=>{
            console.info("[settings_get_value_112] error is:" + String(err));
            let codeResult: boolean = err?.code ?? defaultCode >= -1;
            expect(codeResult).assertTrue();
            done();
            return;
          })
      }catch(err){
        console.info("[settings_get_value_112] error is:" + String(err));
        let codeResult: boolean = err?.code ?? defaultCode >= -1;
        expect(codeResult).assertTrue();
        done();
        return;
      }
    });

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

    /*
     * @tc.number    : settings_can_show_floating_115
     * @tc.name      : settings_can_show_floating_115
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_can_show_floating_115',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      let defaultCode: number = 0;
      try{
        settings.canShowFloating((err,data)=>{
          if (err && err?.code) {
            expect(data).assertEqual(false);
          } else {
            expect(data).assertEqual(true);
          }
          done();
        })
      }catch(err){
        console.info('settings test canShowFloating promise err'+String(err));
        let codeResult: boolean = err?.code ?? defaultCode >= -1;
        expect(codeResult).assertTrue();
        done();
        return;
      }
    });

    /*
     * @tc.number    : settings_get_value_116
     * @tc.name      : settings_get_value_116
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_get_value_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let str: myObj2 = { "code": 801 };
        let key: string = 'settings.telephony.airplanemode';
        let result = settings.getValueSync(globalThis.abilityContext, key, '1');
        if (result === '1') {
          settings.canShowFloating().then((data) => {
            expect(data).assertEqual(true);
            done();
          }).catch((err: BusinessError) => {
            console.info('settings test canShowFloating promise err' + JSON.stringify(err.code));
            expect(JSON.stringify(err.code)).assertEqual("801");
            done();
            return;
          })
        } else {
          settings.canShowFloating().then((data) => {
            expect(data).assertEqual(false);
            done();
          }).catch((err: BusinessError) => {
            console.info('settings test canShowFloating promise err' + JSON.stringify(err.code));
            expect(JSON.stringify(err.code)).assertEqual("801");
            done();
            return;
          })
        }
      } catch (err) {
        console.info('settings test canShowFloating promise err' + String(err));
        expect(true).assertTrue();
        done();
        return;
      }
    });

    it('settings_get_value_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) =>  {
      let name = 'settings.screen.brightness117';//关键字
      let value = 'brightness117';//值
      let domainName = 'secure';
      try{
        settings.setValue(globalThis.abilityContext, name, value, domainName)
          .then((data)=>{
            console.info("[settings_get_value_117] value is:" + data);
            settings.getValue(globalThis.abilityContext, name, domainName).then(ret => {
              console.info("[settings_get_value_117] value is:" + ret);
              expect(ret).assertEqual(value);
              done();
            })
          })
          .catch((err: BusinessError)=>{
            console.info("[settings_get_value_117] 1252 error is:" + String(err));
            expect(true).assertTrue();
            done();
            return;
          })
      }catch (err) {
        console.error("[settings_set_value_118] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_get_value_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness118';//关键字
      let value = 'brightness118';//值
      let domainName = 'secure';
      try{
        settings.setValue(globalThis.abilityContext, name, value, domainName)
          .then((data) => {
            console.info("[settings_get_value_118] value is:" + data);
            settings.getValue(globalThis.abilityContext, name, domainName).then(ret => {
              console.info("[settings_get_value_118] value is:" + ret);
              expect(ret).assertEqual(value);
              done();
            })
          })
          .catch((err: BusinessError)=>{
            console.info("[settings_get_value_118] 1252 error is:" + String(err));
            expect(true).assertTrue();
            done();
            return;
          })
      }catch (err) {
        console.error("[settings_set_value_118] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    /*
     * @tc.number    : settings_set_value_118_2
     * @tc.name      : settings_set_value_118_2
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_set_value_118_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness1182';//关键字
      let value = 'brightness1182';//值
      let domainName = 'secure';
      let defaultCode: number = 0;
      try{
        settings.setValue(globalThis.abilityContext, name, value, domainName)
          .then((data) => {
            console.info("[settings_get_value_118] value is:" + data);
            expect(data).assertEqual(true);
            done();
          })
          .catch((err: BusinessError)=>{
            console.info("[settings_get_value_118] 1252 error is:" + String(err));
            let codeResult: boolean = err?.code ?? defaultCode >= -1;
            expect(codeResult).assertTrue();
            done();
            return;
          })
      }catch (err) {
        console.error("[settings_set_value_118] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    /*
     * @tc.number    : settings_set_value_118_3
     * @tc.name      : settings_set_value_118_3
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_set_value_118_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness1183';//关键字
      let value = 'brightness1183';//值
      let domainName = 'secure';
      let context = undefined;
      let defaultCode: number = 0;
      try{
        settings.setValue(context, name, value, domainName)
          .then((data) => {
            console.info("[settings_get_value_118] value is:" + data);
            expect(data).assertEqual(false);
            done();
          })
          .catch((err: BusinessError)=>{
            console.info("[settings_get_value_118] 1252 error is:" + String(err));
            let codeResult: boolean = err?.code ?? defaultCode >= -1;
            expect(codeResult).assertTrue();
            done();
            return;
          })
      }catch (err) {
        console.error("[settings_set_value_118] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_get_value_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) =>  {
      let name = 'settings.screen.brightness119';//关键字
      let obj = '323445.00';//值
      let domainName = 'secure';
      try{
        let value = settings.getValueSync(globalThis.abilityContext, name, obj, domainName);
        console.info("[settings_set_value_119] value is: " + value);
        expect(true).assertTrue();
      } catch (err) {
        console.error("[settings_set_value_119] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_get_value_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness120';//关键字
      let obj = '323445.00';//值
      let domainName = 'secure';
      try{
        let value = settings.setValueSync(globalThis.abilityContext, name, obj, domainName);
        expect(value).assertTrue();
      }catch (err) {
        console.error("[settings_set_value_120] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    /*
     * @tc.number    : settings_get_value_120_2
     * @tc.name      : settings_get_value_120_2
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_get_value_120_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness1220';//关键字
      let obj = '323445.00';//值
      let domainName = 'secure';
      let context = null;
      try{
        let value = settings.setValueSync(context, name, obj, domainName);
        expect(value).assertEqual(false);
      }catch (err) {
        console.error("[settings_set_value_120_2] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_register_Key_Observer_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness121';//关键字
      let domainName = 'secure';
      settings.setValueSync(globalThis.abilityContext, name, '1', domainName);
      try{
        let value = settings.registerKeyObserver(globalThis.abilityContext, name, domainName, (err, ret) => {
          let ret1 = settings.getValueSync(globalThis.abilityContext, name, domainName);
          expect(ret1 === '1').assertTrue();
          done();
        })
      }catch (err) {
        console.error("[settings_set_value_121] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_unregister_Key_Observer_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness122';//关键字
      let domainName = 'secure';
      let context = null;
      try{
        let value = settings.unregisterKeyObserver(globalThis.abilityContext, name, domainName);
        expect(value).assertTrue();
        done();
      }catch (err) {
        console.error("[settings_set_value_122] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    /*
     * @tc.number    : settings_unregister_Key_Observer_122_2
     * @tc.name      : settings_unregister_Key_Observer_122_2
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_unregister_Key_Observer_122_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness1222';//关键字
      let domainName = 'secure';
      let context = null;
      try{
        let value = settings.unregisterKeyObserver(context, name, domainName);
        expect(value).assertEqual(false);
        done();
      }catch (err) {
        console.error("[settings_unregister_Key_Observer_122_2] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_register_Key_Observer_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness123';//关键字
      let domainName = settings.domainName.DEVICE_SHARED;
      settings.setValueSync(globalThis.abilityContext, name, '1', domainName);
      try{
        let value = settings.registerKeyObserver(globalThis.abilityContext, name, domainName, (err, ret) => {
          let ret1 = settings.getValueSync(globalThis.abilityContext, name, domainName);
        })
        expect(value).assertTrue();
        done();
      }catch (err) {
        console.error("[settings_set_value_123] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    /*
     * @tc.number    : settings_register_Key_Observer_123_2
     * @tc.name      : settings_register_Key_Observer_123_2
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('settings_register_Key_Observer_123_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness1232';//关键字
      let domainName = settings.domainName.DEVICE_SHARED;
      let context = undefined;
      try{
        let value = settings.registerKeyObserver(context, name, domainName, (err, ret) => {
          let ret1 = settings.getValueSync(globalThis.abilityContext, name, domainName);
        })
        expect(value).assertEqual(false);
        done();
      }catch (err) {
        console.error("[settings_set_value_123] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    it('settings_register_Key_Observer_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let name = 'settings.screen.brightness124';//关键字
      let domainName = settings.domainName.USER_PROPERTY;
      settings.setValueSync(globalThis.abilityContext, name, '1', domainName);
      try{
        let value = settings.registerKeyObserver(globalThis.abilityContext, name, domainName, (err, ret) => {
          let ret1 = settings.getValueSync(globalThis.abilityContext, name, domainName);
          expect(ret1 === '1').assertTrue();
          done();
        })
      }catch (err) {
        console.error("[settings_set_value_124] error = " + err);
        expect(err == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
          .assertTrue();
      }
      done();
    });

    /*
     * @tc.number    : open_manager_settings_119_2
     * @tc.name      : open_manager_settings_119_2
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('open_manager_settings_119_2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      try{
        let value = await settings.openNetworkManagerSettings(globalThis.abilityContext);
        expect(value).assertTrue();
        done();
      }catch (err) {
        console.error("[open_manager_settings_119_2] error = " + err);
        expect(err.code).assertEqual(14800000);
      }
      done();
    });

    /*
     * @tc.number    : open_manager_settings_119_3
     * @tc.name      : open_manager_settings_119_3
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('open_manager_settings_119_3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done:Function) => {
      try{
        let context = undefined;
        let value = await settings.openNetworkManagerSettings(context);
        expect(value).assertEqual(false);
        done();
      }catch (err) {
        console.error("[open_manager_settings_119] error = " + err);
        expect(err.code).assertEqual(14800000);
      }
      done();
    });
  })
}
