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

import { describe, beforeEach, it, expect, Level, TestType, Size } from '@ohos/hypium'
import nativeTest from 'libentry.so'
import { GlobalContext } from '../test/global';

const SUCCESS = 0 // 成功
const ERROR_CODE_INVALID_INPUT_PARAMETER = 401 // 参数无效
const ERROR_CODE_RES_ID_NOT_FOUND = 9001001 // 无效的资源ID
const ERROR_CODE_RES_NOT_FOUND_BY_ID  = 9001002 // 没有根据资源ID找到匹配的资源
const ERROR_CODE_RES_NAME_NOT_FOUND = 9001003 // 无效的资源名称
const ERROR_CODE_RES_NOT_FOUND_BY_NAME = 9001004 // 没有根据资源名称找到匹配的资源
const ERROR_CODE_RES_REF_TOO_MUCH = 9001006 // 资源被循环引用
const ERROR_CODE_OVERLAY_RES_PATH_INVALID = 9001010 // 无效的资源路径.

export default function NativeApiString2Test() {
  describe('NativeApiString2Test', () => {
    let resManager: Context;
    beforeEach(() => {
      resManager = (GlobalContext.getContext().getObject('yq') as Context);
      nativeTest.GetResourceManager2(resManager.resourceManager);
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTPLURALSTRING_0100
    * @tc.name      TestGetIntPluralString0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntPluralString0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntPluralString0100 start====");
        let result: number = nativeTest.GetIntPluralString0100($r('app.plural.p_str7').id);
        console.info(`====>TestGetIntPluralString0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetIntPluralString0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTPLURALSTRING_0200
    * @tc.name      TestGetIntPluralString0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntPluralString0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntPluralString0200 start====");
        let result: number = nativeTest.GetIntPluralString0200($r('app.plural.p_str7').id);
        console.info(`====>TestGetIntPluralString0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetIntPluralString0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTPLURALSTRING_0300
    * @tc.name      TestGetIntPluralString0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntPluralString0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntPluralString0300 start====");
        let result: number = nativeTest.GetIntPluralString0300(0);
        console.info(`====>TestGetIntPluralString0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetIntPluralString0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTPLURALSTRING_0400
    * @tc.name      TestGetIntPluralString0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntPluralString0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntPluralString0400 start====");
        let result: number = nativeTest.GetIntPluralString0400($r('app.media.icon').id);
        console.info(`====>TestGetIntPluralString0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetIntPluralString0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTPLURALSTRING_0500
    * @tc.name      TestGetIntPluralString0500
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntPluralString0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntPluralString0500 start====");
        let result: number = nativeTest.GetIntPluralString0500($r('app.plural.test_cyc').id);
        console.info(`====>TestGetIntPluralString0500 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetIntPluralString0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDOUBLEPLURALSTRING_0100
    * @tc.name      TestGetDoublePluralString0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDoublePluralString0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDoublePluralString0100 start====");
        let result: number = nativeTest.GetDoublePluralString0100($r('app.plural.p_str7').id);
        console.info(`====>TestGetDoublePluralString0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetDoublePluralString0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDOUBLEPLURALSTRING_0200
    * @tc.name      TestGetDoublePluralString0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDoublePluralString0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDoublePluralString0200 start====");
        let result: number = nativeTest.GetDoublePluralString0200($r('app.plural.p_str7').id);
        console.info(`====>TestGetDoublePluralString0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetDoublePluralString0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDOUBLEPLURALSTRING_0300
    * @tc.name      TestGetDoublePluralString0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDoublePluralString0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDoublePluralString0300 start====");
        let result: number = nativeTest.GetDoublePluralString0300(0);
        console.info(`====>TestGetDoublePluralString0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetDoublePluralString0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDOUBLEPLURALSTRING_0400
    * @tc.name      TestGetDoublePluralString0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDoublePluralString0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDoublePluralString0400 start====");
        let result: number = nativeTest.GetDoublePluralString0400($r('app.media.icon').id);
        console.info(`====>TestGetDoublePluralString0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetDoublePluralString0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDOUBLEPLURALSTRING_0500
    * @tc.name      TestGetDoublePluralString0500
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDoublePluralString0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDoublePluralString0500 start====");
        let result: number = nativeTest.GetDoublePluralString0500($r('app.plural.test_cyc').id);
        console.info(`====>TestGetDoublePluralString0500 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetDoublePluralString0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTPLURALSTRINGBYNAME_0100
    * @tc.name      TestGetIntPluralStringByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntPluralStringByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntPluralStringByName0100 start====");
        let result: number = nativeTest.GetIntPluralStringByName0100('p_str7');
        console.info(`====>TestGetIntPluralStringByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetIntPluralStringByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTPLURALSTRINGBYNAME_0200
    * @tc.name      TestGetIntPluralStringByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntPluralStringByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntPluralStringByName0200 start====");
        let result: number = nativeTest.GetIntPluralStringByName0200('p_str7');
        console.info(`====>TestGetIntPluralStringByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetIntPluralStringByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTPLURALSTRINGBYNAME_0300
    * @tc.name      TestGetIntPluralStringByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntPluralStringByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntPluralStringByName0300 start====");
        let result: number = nativeTest.GetIntPluralStringByName0300('');
        console.info(`====>TestGetIntPluralStringByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetIntPluralStringByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTPLURALSTRINGBYNAME_0400
    * @tc.name      TestGetIntPluralStringByName0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntPluralStringByName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntPluralStringByName0400 start====");
        let result: number = nativeTest.GetIntPluralStringByName0400('test_cyc');
        console.info(`====>TestGetIntPluralStringByName0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetIntPluralStringByName0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDOUBLEPLURALSTRINGBYNAME_0100
    * @tc.name      TestGetDoublePluralStringByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDoublePluralStringByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDoublePluralStringByName0100 start====");
        let result: number = nativeTest.GetDoublePluralStringByName0100('p_str7');
        console.info(`====>TestGetDoublePluralStringByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetDoublePluralStringByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDOUBLEPLURALSTRINGBYNAME_0200
    * @tc.name      TestGetDoublePluralStringByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDoublePluralStringByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDoublePluralStringByName0200 start====");
        let result: number = nativeTest.GetDoublePluralStringByName0200('p_str7');
        console.info(`====>TestGetDoublePluralStringByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetDoublePluralStringByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDOUBLEPLURALSTRINGBYNAME_0300
    * @tc.name      TestGetDoublePluralStringByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDoublePluralStringByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDoublePluralStringByName0300 start====");
        let result: number = nativeTest.GetDoublePluralStringByName0300('');
        console.info(`====>TestGetDoublePluralStringByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetDoublePluralStringByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDOUBLEPLURALSTRINGBYNAME_0400
    * @tc.name      TestGetDoublePluralStringByName0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDoublePluralStringByName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDoublePluralStringByName0400 start====");
        let result: number = nativeTest.GetDoublePluralStringByName0400('test_cyc');
        console.info(`====>TestGetDoublePluralStringByName0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetDoublePluralStringByName0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetColor_0100
    * @tc.name      TestGetColor0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetColor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetColor0100 start====");
        let result: number = nativeTest.GetColor0100($r('app.color.start_window_background_test').id);
        console.info(`====>TestGetColor0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetColor0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetColor_0200
    * @tc.name      TestGetColor0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetColor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetColor0200 start====");
        let result: number = nativeTest.GetColor0200($r('app.color.start_window_background_test').id);
        console.info(`====>TestGetColor0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetColor0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetColor_0300
    * @tc.name      TestGetColor0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetColor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetColor0300 start====");
        let result: number = nativeTest.GetColor0300(0);
        console.info(`====>TestGetColor0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetColor0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetColor_0400
    * @tc.name      TestGetColor0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetColor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetColor0400 start====");
        let result: number = nativeTest.GetColor0400($r('app.media.icon').id);
        console.info(`====>TestGetColor0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetColor0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetColor_0500
    * @tc.name      TestGetColor0500
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetColor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetColor0500 start====");
        let result: number = nativeTest.GetColor0500($r('app.color.start_window_background_testA').id);
        console.info(`====>TestGetColor0500 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetColor0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetColorByName_0100
    * @tc.name      TestGetColorByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetColorByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetColorByName0100 start====");
        let result: number = nativeTest.GetColorByName0100('start_window_background_test');
        console.info(`====>TestGetColorByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetColorByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetColorByName_0200
    * @tc.name      TestGetColorByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetColorByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetColorByName0200 start====");
        let result: number = nativeTest.GetColorByName0200('start_window_background_test');
        console.info(`====>TestGetColorByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetColorByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetColorByName_0300
    * @tc.name      TestGetColorByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetColorByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetColorByName0300 start====");
        let result: number = nativeTest.GetColorByName0300('');
        console.info(`====>TestGetColorByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetColorByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetColorByName_0400
    * @tc.name      TestGetColorByName0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetColorByName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetColorByName0400 start====");
        let result: number = nativeTest.GetColorByName0400('start_window_background_testA');
        console.info(`====>TestGetColorByName0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetColorByName0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINT_0100
    * @tc.name      TestGetInt0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetInt0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetInt0100 start====");
        let result: number = nativeTest.GetInt0100($r('app.integer.integer_one').id);
        console.info(`====>TestGetInt0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetInt0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINT_0200
    * @tc.name      TestGetInt0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetInt0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetInt0200 start====");
        let result: number = nativeTest.GetInt0200($r('app.integer.integer_one').id);
        console.info(`====>TestGetInt0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetInt0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINT_0300
    * @tc.name      TestGetInt0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetInt0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetInt0300 start====");
        let result: number = nativeTest.GetInt0300(0);
        console.info(`====>TestGetInt0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetInt0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINT_0400
    * @tc.name      TestGetInt0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetInt0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetInt0400 start====");
        let result: number = nativeTest.GetInt0400($r('app.media.icon').id);
        console.info(`====>TestGetInt0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetInt0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINT_0500
    * @tc.name      TestGetInt0500
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetInt0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetInt0500 start====");
        let result: number = nativeTest.GetInt0500($r('app.integer.integer_oneA').id);
        console.info(`====>TestGetInt0500 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetInt0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTBYNAME_0100
    * @tc.name      TestGetIntByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntByName0100 start====");
        let result: number = nativeTest.GetIntByName0100('integer_one');
        console.info(`====>TestGetIntByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetIntByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTBYNAME_0200
    * @tc.name      TestGetIntByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntByName0200 start====");
        let result: number = nativeTest.GetIntByName0200('integer_one');
        console.info(`====>TestGetIntByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetIntByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTBYNAME_0300
    * @tc.name      TestGetIntByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntByName0300 start====");
        let result: number = nativeTest.GetIntByName0300('');
        console.info(`====>TestGetIntByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetIntByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETINTBYNAME_0400
    * @tc.name      TestGetIntByName0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetIntByName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetIntByName0400 start====");
        let result: number = nativeTest.GetIntByName0400('integer_oneA');
        console.info(`====>TestGetIntByName0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetIntByName0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETFLOAT_0100
    * @tc.name      TestGetFloat0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetFloat0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetFloat0100 start====");
        let result: number = nativeTest.GetFloat0100($r('app.float.float_one').id);
        console.info(`====>TestGetFloat0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetFloat0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETFLOAT_0200
    * @tc.name      TestGetFloat0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetFloat0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetFloat0200 start====");
        let result: number = nativeTest.GetFloat0200($r('app.float.float_one').id);
        console.info(`====>TestGetFloat0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetFloat0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETFLOAT_0300
    * @tc.name      TestGetFloat0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetFloat0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetFloat0300 start====");
        let result: number = nativeTest.GetFloat0300(0);
        console.info(`====>TestGetFloat0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetFloat0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETFLOAT_0400
    * @tc.name      TestGetFloat0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetFloat0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetFloat0400 start====");
        let result: number = nativeTest.GetFloat0400($r('app.media.icon').id);
        console.info(`====>TestGetFloat0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetFloat0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETFLOAT_0500
    * @tc.name      TestGetFloat0500
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetFloat0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetFloat0500 start====");
        let result: number = nativeTest.GetFloat0500($r('app.float.float_oneA').id);
        console.info(`====>TestGetFloat0500 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetFloat0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETFLOATBYNAME_0100
    * @tc.name      TestGetFloatByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetFloatByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetFloatByName0100 start====");
        let result: number = nativeTest.GetFloatByName0100('float_one');
        console.info(`====>TestGetFloatByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetFloatByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETFLOATBYNAME_0200
    * @tc.name      TestGetFloatByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetFloatByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetFloatByName0200 start====");
        let result: number = nativeTest.GetFloatByName0200('float_oneA');
        console.info(`====>TestGetFloatByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetFloatByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETFLOATBYNAME_0300
    * @tc.name      TestGetFloatByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetFloatByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetFloatByName0300 start====");
        let result: number = nativeTest.GetFloatByName0300('');
        console.info(`====>TestGetFloatByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetFloatByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETFLOATBYNAME_0400
    * @tc.name      TestGetFloatByName0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetFloatByName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetFloatByName0300 start====");
        let result: number = nativeTest.GetFloatByName0400('float_oneA');
        console.info(`====>TestGetFloatByName0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetFloatByName0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETBOOL_0100
    * @tc.name      TestGetBool0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetBool0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetBool0100 start====");
        let result: number = nativeTest.GetBool0100($r('app.boolean.boolean_one').id);
        console.info(`====>TestGetBool0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetBool0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETBOOL_0200
    * @tc.name      TestGetBool0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetBool0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetBool0200 start====");
        let result: number = nativeTest.GetBool0200($r('app.boolean.boolean_one').id);
        console.info(`====>TestGetBool0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetBool0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETBOOL_0300
    * @tc.name      TestGetBool0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetBool0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetBool0300 start====");
        let result: number = nativeTest.GetBool0300(0);
        console.info(`====>TestGetBool0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetBool0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETBOOL_0400
    * @tc.name      TestGetBool0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetBool0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetBool0400 start====");
        let result: number = nativeTest.GetBool0400($r('app.media.icon').id);
        console.info(`====>TestGetBool0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetBool0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETBOOL_0500
    * @tc.name      TestGetBool0500
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetBool0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetBool0500 start====");
        let result: number = nativeTest.GetBool0500($r('app.boolean.boolean_oneA').id);
        console.info(`====>TestGetBool0500 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetBool0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETBOOLBYNAME_0100
    * @tc.name      TestGetBoolByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetBoolByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetBoolByName0100 start====");
        let result: number = nativeTest.GetBoolByName0100('boolean_one');
        console.info(`====>TestGetBoolByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetBoolByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETBOOLBYNAME_0200
    * @tc.name      TestGetBoolByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetBoolByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetBoolByName0200 start====");
        let result: number = nativeTest.GetBoolByName0200('boolean_one');
        console.info(`====>TestGetBoolByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetBoolByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETBOOLBYNAME_0300
    * @tc.name      TestGetBoolByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetBoolByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetBoolByName0300 start====");
        let result: number = nativeTest.GetBoolByName0300('');
        console.info(`====>TestGetBoolByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetBoolByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETBOOLBYNAME_0400
    * @tc.name      TestGetBoolByName0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetBoolByName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetBoolByName0400 start====");
        let result: number = nativeTest.GetBoolByName0400('boolean_oneA');
        console.info(`====>TestGetBoolByName0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetBoolByName0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_ADDRESOURCE_0200
    * @tc.name      TestAddResource0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestAddResource0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestAddResource0200 start====");
        let result: number = nativeTest.AddResource0200();
        console.info(`====>TestAddResource0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestAddResource0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_ADDRESOURCE_0300
    * @tc.name      TestAddResource0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestAddResource0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestAddResource0300 start====");
        let result: number = nativeTest.AddResource0300();
        console.info(`====>TestAddResource0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_OVERLAY_RES_PATH_INVALID);
        done()
      } catch (err) {
        console.error("====>TestAddResource0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_REMOVERESOURCE_0200
    * @tc.name      TestRemoveResource0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestRemoveResource0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestRemoveResource0200 start====");
        let result: number = nativeTest.RemoveResource0200();
        console.info(`====>TestRemoveResource0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestRemoveResource0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

   /* *
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_REMOVERESOURCE_0300
    * @tc.name      TestRemoveResource0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestRemoveResource0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestRemoveResource0300 start====");
        let result: number = nativeTest.RemoveResource0300();
        console.info(`====>TestRemoveResource0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_OVERLAY_RES_PATH_INVALID);
        done()
      } catch (err) {
        console.error("====>TestRemoveResource0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

  })
}