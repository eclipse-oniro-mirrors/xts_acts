/**
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
import { beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@kit.TestKit'
import { BusinessError } from '@ohos.base';
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const waitUiReadyMs : int = 1000;
const TestTag = 'UitestDriverErrorTest';
const AsyncErrorCode = 17000002;
const ParameterErrorCode = 17000007;
const CapabilityCode = 801;
const ErrorCode = 401;

function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
  setTimeout(() => {
  resolve(0)
}, count)
})
}

export default function uitestDriverErrorTest() {
  describe('uitestDriverErrorTest', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestDriverErrorTest loadup start!!!!!")
      await Utils.msSleep(1000)
      hilog.info(domain, tag, "uitestDriverErrorTest loadup over!!!!!")
    })

    /**
     * @tc.name   test_assertComponentExist_17000003_static
     * @tc.number uitestDriverErrorTest_001
     * @tc.desc   assertComponentExist 17000003 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_assertComponentExist_17000003_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_assertComponentExist_17000003_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        await driver.assertComponentExist(ON.text('NotTest'));
        await driver.delayMs(waitUiReadyMs);
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_assertComponentExist_17000003_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(17000003);
      }
      await sleep(1000);
      console.log(`${TestTag}, test_assertComponentExist_17000003_static end`);
    })

    /**
     * @tc.name   test_driver_inputTextMode_801_static
     * @tc.number uitestDriverErrorTest_002
     * @tc.desc   inputText 801 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_driver_inputTextMode_801_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_inputTextMode_801_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.inputText({x:100, y:100}, '123456', {
          paste: false
        });
      }catch (e: BusinessError) {
        hilog.info(domain, tag, `test_driver_inputTextMode_801_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(CapabilityCode);
      }
      hilog.info(domain, tag, `test_driver_inputTextMode_801_static end`);
    })

    /**
     * @tc.name   test_driver_pressBackWithId_17000007_static
     * @tc.number uitestDriverErrorTest_003
     * @tc.desc   mouseDrag 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_pressBackWithId_17000007_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_pressBackWithId_17000007 start`);
      try {
        let driver: Driver = Driver.create();
        await driver.pressBack(-1);
        expect().assertFail();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, `test_driver_pressBackWithId_17000007 error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      hilog.info(domain, tag, `test_driver_pressBackWithId_17000007 end`);
    })

    /**
     * @tc.name   test_driver_getDisplaySizeWithId_17000007_static
     * @tc.number uitestDriverErrorTest_004
     * @tc.desc   getDisplayRotation 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_getDisplaySizeWithId_17000007_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_getDisplaySizeWithId_17000007_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.getDisplaySize(-1);
        expect().assertFail();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, `test_driver_getDisplaySizeWithId_17000007_static error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      hilog.info(domain, tag, `test_driver_getDisplaySizeWithId_17000007_static end`);
    })

    /**
     * @tc.name   test_driver_pressHome_static
     * @tc.number uitestDriverErrorTest_005
     * @tc.desc   pressHome 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_pressHome_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_pressHome_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.pressHome(-1);
        expect().assertFail();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, `test_driver_pressHome_static error is, ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      hilog.info(domain, tag, `test_driver_pressHome_static end`);
    })
  })
}