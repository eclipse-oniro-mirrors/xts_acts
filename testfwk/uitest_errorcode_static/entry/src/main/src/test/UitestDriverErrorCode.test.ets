/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

export default function uitestDriverErrorTest(): void {
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
      }catch (e) {
        console.log(`${TestTag}, test_assertComponentExist_17000003_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(17000003);
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
      }catch (e) {
        hilog.info(domain, tag, `test_driver_inputTextMode_801_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(CapabilityCode);
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
      } catch (e) {
        hilog.info(domain, tag, `test_driver_pressBackWithId_17000007 error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
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
      } catch (e) {
        hilog.info(domain, tag, `test_driver_getDisplaySizeWithId_17000007_static error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
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
      } catch (e) {
        hilog.info(domain, tag, `test_driver_pressHome_static error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      hilog.info(domain, tag, `test_driver_pressHome_static end`);
    })

    /**
     * @tc.name   test_driver_delayMs_401_static
     * @tc.number uitestDriverErrorTest_006
     * @tc.desc   pressHome 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_delayMs_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_delayMs_401_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.delayMs(-1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_delayMs_401_static error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_delayMs_401_static end`);
    })

    /**
     * @tc.name   test_driver_waitForComponent_401_static
     * @tc.number uitestDriverErrorTest_007
     * @tc.desc   waitForComponent 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_waitForComponent_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_waitForComponent_401_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.waitForComponent(ON.text('next page'), -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_waitForComponent_401_static error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_waitForComponent_401_static end`);
    })

    /**
     * @tc.name   test_driver_triggerKey_401_static
     * @tc.number uitestDriverErrorTest_008
     * @tc.desc   triggerKey 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_triggerKey_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_triggerKey_401_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.triggerKey(-1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerKey_401_static error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_triggerKey_401_static end`);
    })

    /**
     * @tc.name   test_driver_triggerKeyWithId_401_static
     * @tc.number uitestDriverErrorTest_009
     * @tc.desc   triggerKey 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_triggerKeyWithId_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_triggerKeyWithId_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.triggerKey(-1, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerKeyWithId_401_static keycode = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerKey(0, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerKeyWithId_401_static id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_triggerKeyWithId_401_static end`);
    })


    /**
     * @tc.name   test_driver_triggerCombineKeys_401_static
     * @tc.number uitestDriverErrorTest_010
     * @tc.desc   triggerCombineKeys 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_triggerCombineKeys_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_triggerCombineKeys_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.triggerCombineKeys(-1, 0, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerCombineKeys_401_static keycode1 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, -1, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerCombineKeys_401_static keycode2 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, 0, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerCombineKeys_401_static id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_triggerCombineKeys_401_static end`);
    })

    /**
     * @tc.name   test_driver_click_401_static
     * @tc.number uitestDriverErrorTest_011
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_click_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_click_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.click(-1, 100);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_click_401_static x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.click(100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_click_401_static y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_click_401_static end`);
    })

    /**
     * @tc.name   test_driver_doubleClick_401_static
     * @tc.number uitestDriverErrorTest_012
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_doubleClick_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_doubleClick_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.doubleClick(-1, 100);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_doubleClick_401_static x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.doubleClick(100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_doubleClick_401_static y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_doubleClick_401_static end`);
    })

    /**
     * @tc.name   test_driver_longClick_401_static
     * @tc.number uitestDriverErrorTest_0121
     * @tc.desc   longClick 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_longClick_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_longClick_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.longClick(-1, 100);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_longClick_401_static x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.longClick(100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_longClick_401_static y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_longClick_401_static end`);
    })


    /**
     * @tc.name   test_driver_swipe_401_static
     * @tc.number uitestDriverErrorTest_013
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_swipe_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_swipe_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.swipe(-1, 100, 100, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static startx = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, -1, 100, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static starty = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, -1, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static endx = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, -1, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static endy = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, 100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, 100, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.swipe(100, 100, 100, 100, 41000);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_swipe_401_static end`);
    })

    /**
     * @tc.name   test_driver_drag_401_static
     * @tc.number uitestDriverErrorTest_014
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_drag_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_drag_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.drag(-1, 100, 100, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static startx = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(100, -1, 100, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static starty = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(100, 100, -1, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static endx = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(100, 100, 100, -1, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static endy = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(100, 100, 100, 100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(100, 100, 100, 100, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.drag(100, 100, 100, 100, 41000);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_drag_401_static end`);
    })

    /**
     * @tc.name   test_driver_waitForIdle_401_static
     * @tc.number uitestDriverErrorTest_015
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_waitForIdle_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_waitForIdle_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.waitForIdle(-1, 100);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_waitForIdle_401_static idleTime = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.waitForIdle(100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_waitForIdle_401_static timeout = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_waitForIdle_401_static end`);
    })

    /**
     * @tc.name   test_driver_fling_401_static
     * @tc.number uitestDriverErrorTest_016
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_fling_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_fling_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.fling({x: -1, y: 100}, {x: 500, y: 500}, 5, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static from.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: -1}, {x: 500, y: 500}, 5, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static from.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: -1}, {x: 500, y: 500}, 5, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static from.id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: -1, y: 100}, 5, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static to.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: -1}, 5, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static to.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: -1}, 5, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static to.id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 1}, 5, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static diff.id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, -1, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static stepLen = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, 100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 500, y: 500, displayId: 0}, 5, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 500, y: 500, displayId: 0}, 5, 41000);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_fling_401_static end`);
    })

    /**
     * @tc.name   test_driver_injectMultiPointerAction_401_static
     * @tc.number uitestDriverErrorTest_017
     * @tc.desc   injectMultiPointerAction 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_injectMultiPointerAction_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_injectMultiPointerAction_401_static start`);
      let driver: Driver = Driver.create();
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectMultiPointerAction(pointer, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_injectMultiPointerAction_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectMultiPointerAction(pointer, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_injectMultiPointerAction_401_static 199 = -1 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectMultiPointerAction(pointer, 41000);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_injectMultiPointerAction_401_static 41000 = -1 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_injectMultiPointerAction_401_static end`);
    })

    /**
     * @tc.name   test_driver_flingWithId_401_static
     * @tc.number uitestDriverErrorTest_018
     * @tc.desc   fling 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_flingWithId_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_flingWithId_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.fling(UiDirection.DOWN, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithId_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(UiDirection.DOWN, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithId_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 41000);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithId_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_flingWithId_401_static end`);
    })

    /**
     * @tc.name   test_driver_flingWithIdSpeed_401_static
     * @tc.number uitestDriverErrorTest_019
     * @tc.desc   fling 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_flingWithIdSpeed_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.fling(UiDirection.DOWN, -1, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(UiDirection.DOWN, 199, 0);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 41000, 0);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 200, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static end`);
    })

    /**
     * @tc.name   test_driver_mouseClick_401_static
     * @tc.number uitestDriverErrorTest_020
     * @tc.desc   mouseClick 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_mouseClick_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_mouseClick_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.mouseClick({x: -1, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseClick_401_static point.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseClick({x: 100, y: -1}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseClick_401_static point.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseClick({x: 100, y: 100, displayId: -1}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseClick_401_static point.id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseClick({x: 100, y: 100, displayId: 0}, MouseButton.MOUSE_BUTTON_RIGHT, -1, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseClick_401_static key1 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseClick({x: 100, y: 100, displayId: 0}, MouseButton.MOUSE_BUTTON_RIGHT, 0, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseClick_401_static key2 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_mouseClick_401_static end`);
    })

    /**
     * @tc.name   test_driver_mouseScroll_401_static
     * @tc.number uitestDriverErrorTest_021
     * @tc.desc   mouseClick 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_mouseScroll_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_mouseScroll_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.mouseScroll({x: -1, y: 100}, true, 10, 0, 0, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseScroll_401_static point.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll({x: 100, y: -1}, true, 10, 0, 0, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseScroll_401_static point.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll({x: 100, y: 100,displayId: -1}, true, 10, 0, 0, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseScroll_401_static point.id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll({x: 100, y: 100,displayId: 0}, true, -1, 0, 0, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseScroll_401_static d = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll({x: 100, y: 100,displayId: 0}, true, 10, -1, 0, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseScroll_401_static key1 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll({x: 100, y: 100,displayId: 0}, true, 10, 0, -1, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseScroll_401_static key2 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll({x: 100, y: 100,displayId: 0}, true, 10, 0, 0, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseScroll_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll({x: 100, y: 100,displayId: 0}, true, 10, 0, 0, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseScroll_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll({x: 100, y: 100,displayId: 0}, true, 10, 0, 0, 501);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseScroll_401_static speed = 501 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_mouseScroll_401_static end`);
    })

    /**
     * @tc.name   test_driver_screenCapture_401_static
     * @tc.number uitestDriverErrorTest_0421
     * @tc.desc   mouseClick 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_screenCapture_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_screenCapture_401_static start`);
      let driver: Driver = Driver.create();
      try {
        let savePath = '/data/storage/el2/base/cache/test_driver_screenCapture_401_static.png'
        let success = await driver!.screenCapture(savePath, {left: -1, top: 0, right: 100, bottom: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_screenCapture_401_static rect.left = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let savePath = '/data/storage/el2/base/cache/test_driver_screenCapture_401_static.png'
        let success = await driver!.screenCapture(savePath, {left: 0, top: -1, right: 100, bottom: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_screenCapture_401_static rect.top = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let savePath = '/data/storage/el2/base/cache/test_driver_screenCapture_401_static.png'
        let success = await driver!.screenCapture(savePath, {left: 0, top: 0, right: -1, bottom: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_screenCapture_401_static rect.right = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let savePath = '/data/storage/el2/base/cache/test_driver_screenCapture_401_static.png'
        let success = await driver!.screenCapture(savePath, {left: 0, top: 0, right: 100, bottom: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_screenCapture_401_static rect.bottom = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let savePath = '/data/storage/el2/base/cache/test_driver_screenCapture_401_static.png'
        let success = await driver!.screenCapture(savePath, {left: 0, top: 0, right: 100, bottom: 100, displayId: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_screenCapture_401_static rect.displayId = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let savePath = '/data/storage/el2/base/cache/test_driver_screenCapture_401_static.png'
        let success = await driver!.screenCap(savePath, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_screenCapture_401_static displayId = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_screenCapture_401_static end`);
    })

    /**
     * @tc.name   test_driver_mouseDoubleClick_401_static
     * @tc.number uitestDriverErrorTest_022
     * @tc.desc   mouseDoubleClick 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_mouseDoubleClick_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_mouseDoubleClick_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.mouseDoubleClick({x: -1, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDoubleClick_401_static point.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDoubleClick({x: 100, y: -1}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDoubleClick_401_static point.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDoubleClick({x: 100, y: 100, displayId: -1}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDoubleClick_401_static point.id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDoubleClick({x: 100, y: 100, displayId: 0}, MouseButton.MOUSE_BUTTON_RIGHT, -1, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDoubleClick_401_static key1 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDoubleClick({x: 100, y: 100, displayId: 0}, MouseButton.MOUSE_BUTTON_RIGHT, 0, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDoubleClick_401_static key2 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_mouseDoubleClick_401_static end`);
    })

    /**
     * @tc.name   test_driver_mouseLongClick_401_static
     * @tc.number uitestDriverErrorTest_023
     * @tc.desc   mouseDoubleClick 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_mouseLongClick_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_mouseLongClick_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.mouseLongClick({x: -1, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseLongClick_401_static point.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick({x: 100, y: -1}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseLongClick_401_static point.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick({x: 100, y: 100, displayId: -1}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseLongClick_401_static point.id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick({x: 100, y: 100, displayId: 0}, MouseButton.MOUSE_BUTTON_RIGHT, -1, 0, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseLongClick_401_static key1 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick({x: 100, y: 100, displayId: 0}, MouseButton.MOUSE_BUTTON_RIGHT, 0, -1, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseLongClick_401_static key2 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick({x: 100, y: 100, displayId: 0}, MouseButton.MOUSE_BUTTON_RIGHT, 0, -1, 1499);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseLongClick_401_static dur = 1499 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_mouseLongClick_401_static end`);
    })

    /**
     * @tc.name   test_driver_mouseMoveWithTrack_401_static
     * @tc.number uitestDriverErrorTest_024
     * @tc.desc   mouseMoveWithTrack 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_mouseMoveWithTrack_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.mouseMoveWithTrack({x: -1, y: 100}, {x: 100, y: 100}, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static from.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack({x: 100, y: -1}, {x: 100, y: 100}, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static from.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack({x: 100, y: 100, displayId: -1}, {x: 100, y: 100}, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static from.displayId = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack({x: 100, y: 100}, {x: -1, y: 100}, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static to.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack({x: 100, y: 100}, {x: 100, y: -1}, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static to.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack({x: 100, y: 100}, {x: 100, y: 100, displayId: -1}, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static to.displayId = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 1}, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static displayId diff is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseMoveWithTrack({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, 400001);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static speed = 400001 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_mouseMoveWithTrack_401_static end`);
    })

    /**
     * @tc.name   test_driver_mouseDrag_401_static
     * @tc.number uitestDriverErrorTest_025
     * @tc.desc   mouseDrag 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_mouseDrag_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_mouseDrag_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.mouseDrag({x: -1, y: 100}, {x: 100, y: 100}, 600, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDrag_401_static from.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x: 100, y: -1}, {x: 100, y: 100}, 600, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDrag_401_static from.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x: 100, y: 100,displayId: -1}, {x: 100, y: 100}, 600, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDrag_401_static from.displayId = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x: 100, y: 100,displayId: 0}, {x: -1, y: 100}, 600, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDrag_401_static to.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x: 100, y: 100,displayId: 0}, {x: 100, y: -1}, 600, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDrag_401_static to.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x: 100, y: 100,displayId: 0}, {x: 100, y: 100, displayId: -1}, 600, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDrag_401_static to.displayId = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x: 100, y: 100,displayId: 0}, {x: 100, y: 100, displayId: 1}, 600, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDrag_401_static diff.displayId is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x: 100, y: 100,displayId: 0}, {x: 100, y: 100, displayId: 0}, -1, 1500);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDrag_401_static speed=-1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag({x: 100, y: 100,displayId: 0}, {x: 100, y: 100, displayId: 0}, 600, 1499);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseDrag_401_static dur=1499 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_mouseDrag_401_static end`);
    })

    /**
     * @tc.name   test_driver_inputText_401_static
     * @tc.number uitestDriverErrorTest_026
     * @tc.desc   mouseDrag 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_inputText_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_inputText_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.inputText({x: -1, y: 100}, 'hello');
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_inputText_401_static p.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText({x: 100, y: -1}, 'hello');
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_inputText_401_static p.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText({x: 100, y: 100, displayId: -1}, 'hello');
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_inputText_401_static p.id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText({x: -1, y: 100, displayId: 0}, 'hello', {paste:false, addition:false});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_inputText_401_static p.x model = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText({x: 100, y: -1, displayId: 0}, 'hello', {paste:false, addition:false});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_inputText_401_static p.y model = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText({x: 100, y: 100, displayId: -1}, 'hello', {paste:false, addition:false});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_inputText_401_static p.id model = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_inputText_401_static end`);
    })

    /**
     * @tc.name   test_driver_touchPadMultiFingerSwipe_static
     * @tc.number uitestDriverErrorTest_027
     * @tc.desc   mouseDrag 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_touchPadMultiFingerSwipe_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_touchPadMultiFingerSwipe_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.touchPadMultiFingerSwipe(-1, UiDirection.UP);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_touchPadMultiFingerSwipe_static fingers = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.touchPadMultiFingerSwipe(2, UiDirection.UP);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_touchPadMultiFingerSwipe_static fingers = 2 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.touchPadMultiFingerSwipe(5, UiDirection.UP);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_touchPadMultiFingerSwipe_static fingers = 5 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_touchPadMultiFingerSwipe_static end`);
    })

    /**
     * @tc.name   test_driver_penClick_static
     * @tc.number uitestDriverErrorTest_028
     * @tc.desc   mouseDrag 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_penClick_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_penClick_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.penClick({x: -1, y: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penClick_static p.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penClick({x: 100, y: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penClick_static p.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penClick({x: 100, y: 100, displayId: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penClick_static p.displayId = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_penClick_static end`);
    })

    /**
     * @tc.name   test_driver_penLongClick_static
     * @tc.number uitestDriverErrorTest_029
     * @tc.desc   penLongClick 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_penLongClick_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_penLongClick_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.penLongClick({x: -1, y: 100}, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penLongClick_static p.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penLongClick({x: 100, y: -1}, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penLongClick_static p.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penLongClick({x: 100, y: 100, displayId: -1}, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penLongClick_static p.displayId = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penLongClick({x: 100, y: 100, displayId: 0}, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penLongClick_static presure = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penLongClick({x: 100, y: 100, displayId: 0}, 2);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penLongClick_static presure = 2 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_penLongClick_static end`);
    })

    /**
     * @tc.name   test_driver_penDoubleClick_static
     * @tc.number uitestDriverErrorTest_030
     * @tc.desc   penDoubleClick 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_penDoubleClick_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_penDoubleClick_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.penDoubleClick({x: -1, y: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penDoubleClick_static p.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penDoubleClick({x: 100, y: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penDoubleClick_static p.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penDoubleClick({x: 100, y: 100, displayId: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penDoubleClick_static p.displayId = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_penDoubleClick_static end`);
    })

    /**
     * @tc.name   test_driver_penSwipe_static
     * @tc.number uitestDriverErrorTest_031
     * @tc.desc   penSwipe 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_penSwipe_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_penSwipe_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.penSwipe({x: -1, y: 100}, {x: 100, y: 100}, 200, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static start.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: -1}, {x: 100, y: 100}, 200, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static start.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: 100, displayId: -1}, {x: 100, y: 100}, 200, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static start.displayId = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: 100, displayId: 0}, {x: -1, y: 100}, 200, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static endPoint.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: 100, displayId: 0}, {x: 100, y: -1}, 200, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static endPoint.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: -1}, 200, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static endPoint.displayId = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 1}, 200, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static displayId.diff is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, -1, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, 199, 1);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.penSwipe({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, 40001, 1);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static speed = 40001 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.penSwipe({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, 200, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static pressure = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, 200, 2);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_penSwipe_static pressure = 2 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_penSwipe_static end`);
    })

    /**
     * @tc.name   test_driver_injectPenPointerAction_401_static
     * @tc.number uitestDriverErrorTest_032
     * @tc.desc   injectPenPointerAction 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_injectPenPointerAction_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_injectPenPointerAction_401_static start`);
      let driver: Driver = Driver.create();
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectPenPointerAction(pointer, -1, 1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_injectPenPointerAction_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectPenPointerAction(pointer, 199, 1);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_injectPenPointerAction_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectPenPointerAction(pointer, 41000, 1);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_injectPenPointerAction_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectPenPointerAction(pointer, 200, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_injectPenPointerAction_401_static presure = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectPenPointerAction(pointer, 200, 2);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_injectPenPointerAction_401_static presure = 2 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_injectPenPointerAction_401_static end`);
    })

    /**
     * @tc.name   test_PointerMatrix_create_401_static
     * @tc.number uitestDriverErrorTest_033
     * @tc.desc   create 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_PointerMatrix_create_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_PointerMatrix_create_401_static start`);
      try {
        let pointer = PointerMatrix.create(0,1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_PointerMatrix_create_401_static fingers = 0 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let pointer = PointerMatrix.create(11,1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_PointerMatrix_create_401_static fingers = 11 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let pointer = PointerMatrix.create(2, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_PointerMatrix_create_401_static steps = 0 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let pointer = PointerMatrix.create(2, 1001);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_PointerMatrix_create_401_static steps = 1001 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_PointerMatrix_create_401_static end`);
    })

    /**
     * @tc.name   test_PointerMatrix_setPoint_401_static
     * @tc.number uitestDriverErrorTest_034
     * @tc.desc   create 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_PointerMatrix_setPoint_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_PointerMatrix_setPoint_401_static start`);
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(-1, 0, {x: 100, y: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_PointerMatrix_setPoint_401_static fingers = 0 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(1, 0, {x: 100, y: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_PointerMatrix_setPoint_401_static fingers = 1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, -1, {x: 100, y: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_PointerMatrix_setPoint_401_static step = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 1, {x: 100, y: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_PointerMatrix_setPoint_401_static step = 1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_PointerMatrix_setPoint_401_static end`);
    })

    /**
     * @tc.name   test_driver_clickAt_static
     * @tc.number uitestDriverErrorTest_035
     * @tc.desc   clickAt 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_clickAt_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_clickAt_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.clickAt({x: -1, y: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_clickAt_static p.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.clickAt({x: 100, y: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_clickAt_static p.y= -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.clickAt({x: 100, y: 100, displayId: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_clickAt_static p.displayId= -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      hilog.info(domain, tag, `test_driver_clickAt_static end`);
    })

    /**
     * @tc.name   test_driver_doubleClickAt_static
     * @tc.number uitestDriverErrorTest_0411
     * @tc.desc   doubleClickAt 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_doubleClickAt_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_doubleClickAt_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.doubleClickAt({x: -1, y: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_doubleClickAt_static p.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.doubleClickAt({x: 100, y: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_doubleClickAt_static p.y= -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.doubleClickAt({x: 100, y: 100, displayId: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_doubleClickAt_static p.displayId= -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      hilog.info(domain, tag, `test_driver_doubleClickAt_static end`);
    })

    /**
     * @tc.name   test_driver_mouseMoveTo_static
     * @tc.number uitestDriverErrorTest_036
     * @tc.desc   mouseMoveTo 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_mouseMoveTo_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_mouseMoveTo_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.mouseMoveTo({x: -1, y: 100});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveTo_static p.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveTo({x: 100, y: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveTo_static p.y= -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveTo({x: 100, y: 100, displayId: -1});
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_mouseMoveTo_static p.displayId= -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_mouseMoveTo_static end`);
    })
  })
}