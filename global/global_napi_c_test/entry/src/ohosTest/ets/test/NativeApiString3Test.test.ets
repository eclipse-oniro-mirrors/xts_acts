/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, Level, TestType, Size, beforeAll } from '@ohos/hypium'
import nativeTest from 'libentry.so'
import { GlobalContext } from '../test/global';
import { ConfigurationConstant } from '@kit.AbilityKit';
import { display } from '@kit.ArkUI';
import { deviceInfo } from '@kit.BasicServicesKit';
import Utils from './common/Utils';

const SUCCESS = 0 // 成功
const ERROR_CODE_INVALID_INPUT_PARAMETER = 401 // 参数无效
const ERROR_CODE_RES_ID_NOT_FOUND = 9001001 // 无效的资源ID
const ERROR_CODE_RES_NOT_FOUND_BY_ID  = 9001002 // 没有根据资源ID找到匹配的资源
const ERROR_CODE_RES_NAME_NOT_FOUND = 9001003 // 无效的资源名称
const ERROR_CODE_RES_REF_TOO_MUCH = 9001006 // 资源被循环引用
const ERROR_CODE_OVERLAY_RES_PATH_INVALID = 9001010 // 无效的资源路径.


export default function NativeApiString3Test() {
  describe('NativeApiString3Test', () => {
    let resManager: Context;
    beforeEach(() => {
      resManager = (GlobalContext.getContext().getObject('yq') as Context);
      nativeTest.GetResourceManager3(resManager.resourceManager);
    })

    /**
    * @tc.number    SUB_GLOBAL_SUCCESS_0100
    * @tc.name      TestGetSuccess0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetSuccess0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetSuccess0100 start====");
        let result: number = nativeTest.GetSuccess0100($r('app.color.start_window_background_test').id);
        console.info(`====>TestGetSuccess0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetSuccess0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_ERROR_CODE_INVALID_INPUT_PARAMETER_0100
    * @tc.name      TestGetInvalidInputParameter0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetInvalidInputParameter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetSuccess0100 start====");
        let result: number = nativeTest.GetInvalidInputParameter0100($r('app.color.start_window_background_test').id);
        console.info(`====>TestGetInvalidInputParameter0100 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetInvalidInputParameter0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_ERROR_CODE_RES_ID_NOT_FOUND_0100
    * @tc.name      TestGetIdNotFound0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIdNotFound0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIdNotFound0100 start====");
        let result: number = nativeTest.GetIdNotFound0100(0);
        console.info(`====>TestGetIdNotFound0100 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetIdNotFound0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_ERROR_CODE_RES_NOT_FOUND_BY_ID_0100
    * @tc.name      TestGetNotFoundById0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetNotFoundById0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetNotFoundById0100 start====");
        let result: number = nativeTest.GetNotFoundById0100($r('app.media.icon').id);
        console.info(`====>TestGetNotFoundById0100 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetNotFoundById0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_ERROR_CODE_RES_NAME_NOT_FOUND_0100
    * @tc.name      TestGetNameNotFound0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetNameNotFound0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetNameNotFound0100 start====");
        let result: number = nativeTest.GetNameNotFound0100('');
        console.info(`====>TestGetNameNotFound0100 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetNameNotFound0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.number    SUB_GLOBAL_ERROR_CODE_RES_REF_TOO_MUCH_0100
     * @tc.name      TestGetRefTooMuch0100
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetRefTooMuch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetRefTooMuch0100 start====");
        let result: number = nativeTest.GetRefTooMuch0100($r('app.boolean.boolean_oneA').id);
        console.info(`====>TestGetRefTooMuch0100 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetRefTooMuch0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.number    SUB_GLOBAL_ERROR_CODE_OVERLAY_RES_PATH_INVALID_0100
     * @tc.name      TestGetResPathInvalid0100
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetResPathInvalid0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetResPathInvalid0100 start====");
        let result: number = nativeTest.GetResPathInvalid0100();
        console.info(`====>TestGetResPathInvalid0100 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_OVERLAY_RES_PATH_INVALID);
        done()
      } catch (err) {
        console.error("====>TestGetResPathInvalid0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.number    SUB_GLOBAL_DIRECTION_VERTICAL_0100
     * @tc.name      TestGetDirectionVertical0100
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetDirectionVertical0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDirectionVertical0100 start====");
        let result: number = nativeTest.GetDirectionVertical0100();
        console.info(`====>TestGetDirectionVertical0100 result====${result}`);
        let num: number = display.getDefaultDisplaySync().orientation;
        expect(result).assertEqual(num % 2);
        done()
      } catch (err) {
        console.error("====>TestGetDirectionVertical0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.number    SUB_GLOBAL_COLOR_MODE_LIGHT_0100
     * @tc.name      TestGetColorModeLight0100
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetColorModeLight0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetColorModeLight0100 start====");
        let result: number = nativeTest.GetColorModeLight0100();
        console.info(`====>TestGetColorModeLight0100 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetColorModeLight0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.number    SUB_GLOBAL_DEVICE_TYPE_PHONE_0100
     * @tc.name      TestGetDeviceType0100
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetDeviceType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDeviceType0100 start====");
        let result: number = nativeTest.GetDeviceType0100();
        console.info(`====>TestGetDeviceType0100 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetDeviceType0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.number    SUB_GLOBAL_DEVICE_TYPE_TABLET_0200
     * @tc.name      TestGetDeviceType0200
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetDeviceType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDeviceType0200 start====");
        let result: number = nativeTest.GetDeviceType0100();
        console.info(`====>TestGetDeviceType0200 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetDeviceType0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_DEVICE_TYPE_CAR_0300
     * @tc.name      TestGetDeviceType0300
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetDeviceType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDeviceType0300 start====");
        let result: number = nativeTest.GetDeviceType0100();
        console.info(`====>TestGetDeviceType0300 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetDeviceType0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_DEVICE_TYPE_PC_0400
     * @tc.name      TestGetDeviceType0400
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetDeviceType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDeviceType0400 start====");
        let result: number = nativeTest.GetDeviceType0100();
        console.info(`====>TestGetDeviceType0400 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetDeviceType0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_DEVICE_TYPE_TV_0500
     * @tc.name      TestGetDeviceType0500
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetDeviceType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDeviceType0500 start====");
        let result: number = nativeTest.GetDeviceType0100();
        console.info(`====>TestGetDeviceType0500 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetDeviceType0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_DEVICE_TYPE_WEARABLE_0600
     * @tc.name      TestGetDeviceType0600
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetDeviceType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDeviceType0600 start====");
        let result: number = nativeTest.GetDeviceType0100();
        console.info(`====>TestGetDeviceType0600 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetDeviceType0600 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_DEVICE_TYPE_2IN1_0700
     * @tc.name      TestGetDeviceType0700
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetDeviceType0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDeviceType0700 start====");
        let result: number = nativeTest.GetDeviceType0100();
        console.info(`====>TestGetDeviceType0700 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetDeviceType0700 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_SCREEN_MDPI_0100
     * @tc.name      TestGetScreenDensity0100
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetScreenDensity0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetScreenDensity0100 start====");
        let result: number = nativeTest.GetScreenDensity0100();
        console.info(`====>TestGetScreenDensity0100 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetScreenDensity0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_SCREEN_SDPI_0200
     * @tc.name      TestGetScreenDensity0200
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetScreenDensity0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetScreenDensity0200 start====");
        let result: number = nativeTest.GetScreenDensity0100();
        console.info(`====>TestGetScreenDensity0200 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetScreenDensity0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_SCREEN_LDPI_0300
     * @tc.name      TestGetScreenDensity0300
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetScreenDensity0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetScreenDensity0300 start====");
        let result: number = nativeTest.GetScreenDensity0100();
        console.info(`====>TestGetScreenDensity0300 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetScreenDensity0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_SCREEN_XLDPI_0400
     * @tc.name      TestGetScreenDensity0400
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetScreenDensity0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetScreenDensity0400 start====");
        let result: number = nativeTest.GetScreenDensity0100();
        console.info(`====>TestGetScreenDensity0400 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetScreenDensity0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_SCREEN_XXLDPI_0500
     * @tc.name      TestGetScreenDensity0500
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetScreenDensity0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetScreenDensity0500 start====");
        let result: number = nativeTest.GetScreenDensity0100();
        console.info(`====>TestGetScreenDensity0500 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetScreenDensity0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_SCREEN_XXXLDPI_0600
     * @tc.name      TestGetScreenDensity0600
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetScreenDensity0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetScreenDensity0600 start====");
        let result: number = nativeTest.GetScreenDensity0100();
        console.info(`====>TestGetScreenDensity0600 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetScreenDensity0600 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_DIRECTION_0100
     * @tc.name      TestGetConfigurations0100
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetConfigurations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetConfigurations0100 start====");
        let result: number = nativeTest.GetConfigurations0100();
        console.info(`====>TestGetConfigurations0100 result====${result}`);
        let num: number = display.getDefaultDisplaySync().orientation;
        expect(result).assertEqual(num % 2);
        done()
      } catch (err) {
        console.error("====>TestGetConfigurations0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_DEVICETYPE_0200
     * @tc.name      TestGetConfigurations0200
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetConfigurations0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetConfigurations0200 start====");
        let result: number = nativeTest.GetConfigurations0200();
        console.info(`====>TestGetConfigurations0200 result====${result}`);
        let testString: number = Utils.str2DeviceType(deviceInfo.deviceType);
        expect(result).assertEqual(testString);
        done()
      } catch (err) {
        console.error("====>TestGetConfigurations0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_SCREENDENSITY_0300
     * @tc.name      TestGetConfigurations0300
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetConfigurations0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetConfigurations0300 start====");
        let result: number = nativeTest.GetConfigurations0300();
        console.info(`====>TestGetConfigurations0300 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetConfigurations0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_COLORMODE_0400
     * @tc.name      TestGetConfigurations0400
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetConfigurations0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetConfigurations0400 start====");
        let result: number = nativeTest.GetConfigurations0400();
        console.info(`====>TestGetConfigurations0400 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetConfigurations0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_MCC_0500
     * @tc.name      TestGetConfigurations0500
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetConfigurations0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetConfigurations0500 start====");
        let result: number = nativeTest.GetConfigurations0500();
        console.info(`====>TestGetConfigurations0500 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetConfigurations0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_MNC_0600
     * @tc.name      TestGetConfigurations0600
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetConfigurations0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetConfigurations0600 start====");
        let result: number = nativeTest.GetConfigurations0600();
        console.info(`====>TestGetConfigurations0600 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetConfigurations0600 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /**
     * @tc.number    SUB_GLOBAL_RESERVED_0700
     * @tc.name      TestGetConfigurations0700
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetConfigurations0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetConfigurations0700 start====");
        let result: number = nativeTest.GetConfigurations0700();
        console.info(`====>TestGetConfigurations0700 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetConfigurations0700 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.number    SUB_GLOBAL_DIRECTION_HORIZONTAL_0100
     * @tc.name      TestGetDirectionHorizontal0100
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetDirectionHorizontal0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDirectionHorizontal0100 start====");
        let result: number = nativeTest.GetDirectionHorizontal0100();
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error("====>TestGetDirectionHorizontal0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.number    SUB_GLOBAL_COLOR_MODE_DARK_0100
     * @tc.name      TestGetColorModeDark0100
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestGetColorModeDark0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetColorModeDark0100 start====");
        // globalThis.uiAbilityContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        let res = resManager.getApplicationContext()
        res.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK)
        let result: number = nativeTest.GetColorModeDark0100(res.resourceManager);
        console.info(`====>TestGetColorModeDark0100 result====${result}`);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error("====>TestGetColorModeDark0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /* *
     * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_ADDRESOURCE_0100
     * @tc.name      TestAddResource0100
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestAddResource0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestAddResource0100 start====");
        let path = resManager.bundleCodeDir + "/entry.hap";
        console.info(`====>TestAddResource0100 result====${path}`);
        let result: number = nativeTest.AddResource0100(path);
        console.info(`====>TestAddResource0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestAddResource0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /* *
     * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_REMOVERESOURCE_0100
     * @tc.name      TestRemoveResource0100
     * @tc.desc      overriding error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('TestRemoveResource0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestRemoveResource0100 start====");
        let path = resManager.bundleCodeDir + "/entry.hap";
        console.info(`====>TestRemoveResource0100 result====${path}`);
        let result: number = nativeTest.RemoveResource0100(path);
        console.info(`====>TestRemoveResource0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestRemoveResource0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

  })
}
