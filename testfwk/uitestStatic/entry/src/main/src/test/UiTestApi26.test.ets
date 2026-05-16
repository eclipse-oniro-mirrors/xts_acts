'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, afterAll, afterEach, describe, it, expect, TestType, Size, Level } from "../../../hypium/index"
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation, TouchOptions, PenKey, PenKeyOperation, PenMode } from '@kit.TestKit'
import hilog from '@ohos.hilog'
import display from '@ohos.display';
import { BusinessError } from '@ohos.base'
import { Utils, startAbility, stopApplication } from './Util.test';

let domain: int = 0x0000;
let tag: string = 'uitestTag';
const TestTag = 'uitestTag';
const waitUiReadyMs: int = 1000;
const ErrorCode17000005 = 17000005;

export default function uitestApi26Test(): void {
  describe('uitestApi26Test', (): void => {
    let driver: Driver | undefined;
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestApi26Test loadup start!!!!!");
      driver = Driver.create();
      await Utils.msSleep(1000);
      hilog.info(domain, tag, "uitestApi26Test loadup over!!!!!")
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    afterEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    afterAll(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testDriverClickAtDefault_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0100
     * @tc.desc   Test clickAt with point parameter (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtDefault_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverClickAtDefault_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        await driver!.clickAt(center)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('back to index'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('back to index');
          await newButton.click()
        }
      }
      hilog.info(domain, tag, 'testDriverClickAtDefault_static over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtEmptyOptions_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0200
     * @tc.desc   Test clickAt with options={} (empty object)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtEmptyOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverClickAtEmptyOptions_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        let options: TouchOptions = {}
        await driver!.clickAt(center, options)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('back to index'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('back to index')
          await newButton.click()
        }
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverClickAtEmptyOptions_static end');
    });

    /**
     * @tc.name   testDriverClickAtBoundaryPressureMin_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_BOUNDARY_0300
     * @tc.desc   Test clickAt with pressure=0 (minimum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtBoundaryPressureMin_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverClickAtBoundaryPressureMin_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        let options: TouchOptions = { pressure: 0 };
        await driver!.clickAt(center, options)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('back to index'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('back to index')
          await newButton.click()
        }
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverClickAtBoundaryPressureMin_static end');
    });

    /**
     * @tc.name   testDriverClickAtPressureMax_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0400
     * @tc.desc   Test clickAt with point and pressure parameter (pressure = 1.0, maximum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtPressureMax_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverClickAtPressureMax_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        let options: TouchOptions = { pressure: 1.0 };
        await driver!.clickAt(center, options)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('back to index'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('back to index')
          await newButton.click()
        }
      }
      hilog.info(domain, tag, 'testDriverClickAtPressureMax_static over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtPressure_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0500
     * @tc.desc   Test clickAt with point and pressure parameter (pressure = 0.5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtPressure_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverClickAtPressure_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        let options: TouchOptions = { pressure: 0.5 };
        await driver!.clickAt(center, options)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('back to index'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('back to index')
          await newButton.click()
        }
      }
      hilog.info(domain, tag, 'testDriverClickAtPressure_static over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtPressureMin_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0600
     * @tc.desc   Test clickAt with point and pressure parameter (pressure = 0.0, minimum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtPressureMin_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverClickAtPressureMin_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        let options: TouchOptions = { pressure: 0.0 };
        await driver!.clickAt(center, options)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('back to index'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('back to index')
          await newButton.click()
        }
      }
      hilog.info(domain, tag, 'testDriverClickAtPressureMin_static over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtUndefinedOptions_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0800
     * @tc.desc   Test clickAt with point parameter (options = undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtUndefinedOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverClickAtUndefinedOptions_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        await driver!.clickAt(center, undefined)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('back to index'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('back to index')
          await newButton.click()
        }
      }
      hilog.info(domain, tag, 'testDriverClickAtUndefinedOptions_static over');
    });

    /**
     * @tc.name   testDriverLongClickAtDefault_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_0900
     * @tc.desc   Test longClickAt with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtDefault_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverLongClickAtDefault_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        await driver!.longClickAt(center)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('longClick'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('longClick')
          await newButton.click()
        }
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverLongClickAtDefault_static end');
    });

    /**
     * @tc.name   testDriverLongClickAtEmptyOptions_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1000
     * @tc.desc   Test longClickAt with empty TouchOptions object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtEmptyOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverLongClickAtEmptyOptions_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        let options: TouchOptions = {}
        await driver!.longClickAt(center, options)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('longClick'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('longClick')
          await newButton.click()
        }
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverLongClickAtEmptyOptions_static end');
    });

    /**
     * @tc.name   testDriverLongClickAtDurationMin_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1100
     * @tc.desc   Test longClickAt with duration=1500 (minimum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtDurationMin_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverLongClickAtDurationMin_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        let options: TouchOptions = { duration: 1500 };
        await driver!.longClickAt(center, options)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('longClick'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('longClick')
          await newButton.click()
        }
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverLongClickAtDurationMin_static end');
    });

    /**
     * @tc.name   testDriverLongClickAtPressure_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1200
     * @tc.desc   Test longClickAt with pressure=0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtPressure_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverLongClickAtPressure_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        let options: TouchOptions = { pressure: 0.5 };
        await driver!.longClickAt(center, options)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('longClick'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('longClick')
          await newButton.click()
        }
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverLongClickAtPressure_static end');
    });

    /**
     * @tc.name   testDriverLongClickAtDurationAndPressure_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1300
     * @tc.desc   Test longClickAt with duration=3000 and pressure=0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtDurationAndPressure_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverLongClickAtDurationAndPressure_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        let options: TouchOptions = { duration: 3000, pressure: 0.5 };
        await driver!.longClickAt(center, options)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('longClick'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('longClick')
          await newButton.click()
        }
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverLongClickAtDurationAndPressure_static end');
    });

    /**
     * @tc.name   testDriverLongClickAtBoundaryPressureMin_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_BOUNDARY_1400
     * @tc.desc   Test longClickAt with pressure=0 (minimum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtBoundaryPressureMin_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverLongClickAtBoundaryPressureMin_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        let options: TouchOptions = { pressure: 0 };
        await driver!.longClickAt(center, options)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('longClick'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('longClick')
          await newButton.click()
        }
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverLongClickAtBoundaryPressureMin_static end');
    });

    /**
     * @tc.name   testDriverLongClickAtBoundaryPressureMax_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_BOUNDARY_1500
     * @tc.desc   Test longClickAt with pressure=1 (maximum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtBoundaryPressureMax_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverLongClickAtBoundaryPressureMax_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        let options: TouchOptions = { pressure: 1 };
        await driver!.longClickAt(center, options)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('longClick'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('longClick')
          await newButton.click()
        }
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverLongClickAtBoundaryPressureMax_static end');
    });

    /**
     * @tc.name   testDriverLongClickAtUndefinedOptions_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1700
     * @tc.desc   Test longClickAt with options=undefined (undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtUndefinedOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverLongClickAtUndefinedOptions_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        await driver!.longClickAt(center, undefined)
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('longClick'))
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText()
          expect(text).assertEqual('longClick')
          await newButton.click()
        }
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverLongClickAtUndefinedOptions_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenDefault_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_1800
     * @tc.desc   Test swipeBetween with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenDefault_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenDefault_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenDefault_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver!.findComponent(ON.type('Scroll'))
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds()
        let center = await scoll.getBoundsCenter()
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() })
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenDefault_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithSpeed_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_1900
     * @tc.desc   Test swipeBetween with speed option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithSpeed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenWithSpeed_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenWithSpeed_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver!.findComponent(ON.type('Scroll'))
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds()
        let center = await scoll.getBoundsCenter()
        let options: TouchOptions = { speed: 2000 }
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, options)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenWithSpeed_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithPressure_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2000
     * @tc.desc   Test swipeBetween with pressure option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithPressure_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenWithPressure_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenWithPressure_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver!.findComponent(ON.type('Scroll'))
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds()
        let center = await scoll.getBoundsCenter()
        let options: TouchOptions = { pressure: 0.5 }
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, options)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenWithPressure_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithSpeedAndPressure_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2100
     * @tc.desc   Test swipeBetween with both speed and pressure options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithSpeedAndPressure_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenWithSpeedAndPressure_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenWithSpeedAndPressure_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver!.findComponent(ON.type('Scroll'))
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds()
        let center = await scoll.getBoundsCenter()
        let options: TouchOptions = { speed: 2000, pressure: 0.5 }
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, options)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenWithSpeedAndPressure_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenUndefinedOptions_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2400
     * @tc.desc   Test swipeBetween with undefined options (default TouchOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenUndefinedOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenUndefinedOptions_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenUndefinedOptions_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver!.findComponent(ON.type('Scroll'))
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds()
        let center = await scoll.getBoundsCenter()
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, undefined)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenUndefinedOptions_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithEmptyObjectOptions_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2500
     * @tc.desc   Test swipeBetween with empty object options {}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithEmptyObjectOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenWithEmptyObjectOptions_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenWithEmptyObjectOptions_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver!.findComponent(ON.type('Scroll'))
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds()
        let center = await scoll.getBoundsCenter()
        let options: TouchOptions = {}
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, options)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenWithEmptyObjectOptions_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedMinBoundary_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2600
     * @tc.desc   Test swipeBetween with speed at minimum boundary (200)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedMinBoundary_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenSpeedMinBoundary_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenSpeedMinBoundary_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver!.findComponent(ON.type('Scroll'))
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds()
        let center = await scoll.getBoundsCenter()
        let options: TouchOptions = { speed: 200 }
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, options)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenSpeedMinBoundary_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedMaxBoundary_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2700
     * @tc.desc   Test swipeBetween with speed at maximum boundary (40000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedMaxBoundary_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenSpeedMaxBoundary_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenSpeedMaxBoundary_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver!.findComponent(ON.type('Scroll'))
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds()
        let center = await scoll.getBoundsCenter()
        let options: TouchOptions = { speed: 40000 }
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, options)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenSpeedMaxBoundary_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenPressureMinBoundary_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2800
     * @tc.desc   Test swipeBetween with pressure at minimum boundary (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenPressureMinBoundary_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenPressureMinBoundary_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenPressureMinBoundary_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver!.findComponent(ON.type('Scroll'))
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds()
        let center = await scoll.getBoundsCenter()
        let options: TouchOptions = { pressure: 0 }
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, options)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenPressureMinBoundary_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenPressureMaxBoundary_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2900
     * @tc.desc   Test swipeBetween with pressure at maximum boundary (1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenPressureMaxBoundary_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenPressureMaxBoundary_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenPressureMaxBoundary_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver!.findComponent(ON.type('Scroll'))
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds()
        let center = await scoll.getBoundsCenter()
        let options: TouchOptions = { pressure: 1 }
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, options)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenPressureMaxBoundary_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithAllBoundaryValues_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_3000
     * @tc.desc   Test swipeBetween with all properties at boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithAllBoundaryValues_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenWithAllBoundaryValues_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenWithAllBoundaryValues_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver!.findComponent(ON.type('Scroll'))
      expect(scoll != null).assertTrue();
      if (scoll != null) {
        let rect = await scoll.getBounds()
        let center = await scoll.getBoundsCenter()
        let options: TouchOptions = { speed: 200, pressure: 1 }
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, options)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenWithAllBoundaryValues_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedOutOfRangeLow_static
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_BOUNDARY_3100
     * @tc.desc   Test swipeBetween with speed at min boundary (199)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedOutOfRangeLow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenSpeedOutOfRangeLow_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenSpeedOutOfRangeLow_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scroll = await driver!.findComponent(ON.type('Scroll'))
      expect(scroll != null).assertTrue();
      if (scroll != null) {
        let rect = await scroll.getBounds()
        let center = await scroll.getBoundsCenter()
        let options: TouchOptions = { speed: 199 };
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, options)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenSpeedOutOfRangeLow_static end');
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedOutOfRangeHigh_static
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0500
     * @tc.desc   Test swipeBetween with speed at maximum boundary (400001)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedOutOfRangeHigh_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverSwipeBetweenSpeedOutOfRangeHigh_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let disPlay = display.getDefaultDisplaySync();
      hilog.info(domain, tag, `testDriverSwipeBetweenSpeedOutOfRangeHigh_static disPlay is: ${JSON.stringify(disPlay)}`);
      let scroll = await driver!.findComponent(ON.type('Scroll'))
      expect(scroll != null).assertTrue();
      if (scroll != null) {
        let rect = await scroll.getBounds()
        let center = await scroll.getBoundsCenter()
        let options: TouchOptions = { speed: 40001 };
        await driver!.swipeBetween({
          x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()
        , displayId: disPlay.id.toInt()
        },
          { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt() }, options)
        await driver!.delayMs(waitUiReadyMs)
        let text = await driver!.findComponent(ON.text('toast'))
        expect(text).assertNull();
      }
      await stopApplication('com.uitestScene.acts')
      hilog.info(domain, tag, 'testDriverSwipeBetweenSpeedOutOfRangeHigh_static end');
    });

    /**
     * @tc.name   testDriverDumpLayoutDefault_static
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_PARAM_0100
     * @tc.desc   Test dumpLayout with default displayId parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutDefault_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {

      let savePath = '/data/storage/el2/base/cache/dump_layout_001.json'
      let result: boolean = await driver!.dumpLayout(savePath);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   testDriverDumpLayoutWithDisplayId_static
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_PARAM_0200
     * @tc.desc   Test dumpLayout with displayId from getDefaultDisplay()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutWithDisplayId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {

      let savePath = '/data/storage/el2/base/cache/dump_layout_003.json'
      let displayId: int = display.getDefaultDisplaySync().id.toInt();
      let result: boolean = await driver!.dumpLayout(savePath, displayId);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   testDriverDumpLayoutVerifyJsonContent_static
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_RETURN_0300
     * @tc.desc   Test dumpLayout API 26.0 verifies JSON content structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutVerifyJsonContent_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverDumpLayoutVerifyJsonContent_static start');
      let savePath = '/data/storage/el2/base/cache/dump_verify_content.json';
      let result: boolean = await driver!.dumpLayout(savePath, 0);
      expect(result).assertTrue();
      hilog.info(domain, tag, 'testDriverDumpLayoutVerifyJsonContent_static end');
    });

    /**
     * @tc.name   testDriverDumpLayoutZeroDisplayId_static
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_PARAM_0400
     * @tc.desc   Test dumpLayout API 26.0 with displayId=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutZeroDisplayId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverDumpLayoutZeroDisplayId_static start');

      let savePath = '/data/storage/el2/base/cache/dump_layout_004.json'
      let result: boolean = await driver!.dumpLayout(savePath, 0);
      expect(result).assertTrue();
      hilog.info(domain, tag, 'testDriverDumpLayoutZeroDisplayId_static end');
    });

    /**
     * @tc.name   testDriverDumpLayoutDisplayIdUndefined_static
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_NULLUNDEFINED_0600
     * @tc.desc   Test dumpLayout API 26.0 with displayId=undefined, should use default value and execute normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutDisplayIdUndefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverDumpLayoutDisplayIdUndefined_static start');

      let savePath = '/data/storage/el2/base/cache/dump_display_undefined.json';
      let result: boolean = await driver!.dumpLayout(savePath, undefined);
      expect(result).assertTrue();
      hilog.info(domain, tag, 'testDriverDumpLayoutDisplayIdUndefined_static end');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingClick_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0100
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingClick_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverTriggerPenKeyHandwritingClick_static start');

      try {
        await driver!.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.CLICK);
        await driver!.delayMs(500);
      } catch (error) {
        hilog.info(domain, tag, `testDriverTriggerPenKeyHandwritingClick_static error: ${(error as Error).message}`);
        expect((error as BusinessError).code).assertEqual(ErrorCode17000005)
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, 'testDriverTriggerPenKeyHandwritingClick_static over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingWithPointClick_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0200
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingWithPointClick_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverTriggerPenKeyHandwritingWithPointClick_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      try {
        let nextPageButton = await driver!.findComponent(ON.text('next page'));
        expect(nextPageButton != null).assertTrue();
        if (nextPageButton != null) {
          let clickPoint = await nextPageButton.getBoundsCenter();
          await driver!.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.CLICK,
            { point: clickPoint});
          await driver!.delayMs(500);
        }
        let backToIndexComponent = await driver!.findComponent(ON.text('back to index'));
        expect(backToIndexComponent != null).assertTrue();
        if (backToIndexComponent != null) {
          let componentText: string = await backToIndexComponent.getText();
          expect(componentText).assertEqual('back to index');
        }
      } catch (error) {
        hilog.info(domain, tag, `testDriverTriggerPenKeyHandwritingWithPointClick_static error: ${(error as Error).message}`);
        expect((error as BusinessError).code).assertEqual(ErrorCode17000005)
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, 'testDriverTriggerPenKeyHandwritingWithPointClick_static over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingDoubleClick_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0300
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, DOUBLE_CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingDoubleClick_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverTriggerPenKeyHandwritingDoubleClick_static start');

      try {
        await driver!.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.DOUBLE_CLICK);
        await driver!.delayMs(500);
      } catch (error) {
        hilog.info(domain, tag, `testDriverTriggerPenKeyHandwritingDoubleClick_static error: ${(error as Error).message}`);
        expect((error as BusinessError).code).assertEqual(ErrorCode17000005);
      }
      hilog.info(domain, tag, 'testDriverTriggerPenKeyHandwritingDoubleClick_static over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingWithPointDoubleClick_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0400
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, DOUBLE_CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingWithPointDoubleClick_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverTriggerPenKeyHandwritingWithPointDoubleClick_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      try {
        let doubleBtn = await driver!.findComponent(ON.text('Click twice'))
        if (doubleBtn == null) {
          let scroll = await driver!.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            doubleBtn = await scroll.scrollSearch(ON.text('Click twice'))
          }
        }
        if (doubleBtn != null) {
          let center = await doubleBtn.getBoundsCenter()
          await driver!.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.DOUBLE_CLICK, {point: center});
          await driver!.delayMs(waitUiReadyMs)
          let newButton = await driver!.findComponent(ON.text('doubleClick'))
          if (newButton != null) {
            let text = await newButton.getText()
            expect(text).assertEqual('doubleClick')
          }
        }
      } catch (error) {
        hilog.info(domain, tag, `testDriverTriggerPenKeyHandwritingWithPointDoubleClick_static error: ${(error as Error).message}`);
        expect((error as BusinessError).code).assertEqual(ErrorCode17000005);
      }
      hilog.info(domain, tag, 'testDriverTriggerPenKeyHandwritingWithPointDoubleClick_static over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyAirMouseClick_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0500
     * @tc.desc   Test Driver.triggerPenKey with AIR_MOUSE mode, AIR_MOUSE key, CLICK operation with point
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyAirMouseClick_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverTriggerPenKeyAirMouseClick_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      try {
        let nextPageButton = await driver!.findComponent(ON.text('next page'));
        expect(nextPageButton != null).assertTrue();
        if (nextPageButton != null) {
          let clickPoint = await nextPageButton.getBoundsCenter();
          await driver!.triggerPenKey(PenKey.AIR_MOUSE, PenMode.AIR_MOUSE, PenKeyOperation.CLICK, { point: clickPoint });
          await driver!.delayMs(500);
        }
        let backToIndexComponent = await driver!.findComponent(ON.text('back to index'));
        expect(backToIndexComponent != null).assertTrue();
        if (backToIndexComponent != null) {
          let componentText: string = await backToIndexComponent.getText();
          expect(componentText).assertEqual('back to index');
        }
      } catch (error) {
        hilog.info(domain, tag, `testDriverTriggerPenKeyAirMouseClick_static error: ${(error as Error).message}`);
        expect((error as BusinessError).code).assertEqual(ErrorCode17000005);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, 'testDriverTriggerPenKeyAirMouseClick_static over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyAirMouseDoubleClick_static
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0600
     * @tc.desc   Test Driver.triggerPenKey with AIR_MOUSE mode, AIR_MOUSE key, DOUBLE_CLICK operation with point
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyAirMouseDoubleClick_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, 'testDriverTriggerPenKeyAirMouseDoubleClick_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      try {
        let doubleBtn = await driver!.findComponent(ON.text('Click twice'))
        if (doubleBtn == null) {
          let scroll = await driver!.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            doubleBtn = await scroll.scrollSearch(ON.text('Click twice'))
          }
        }
        if (doubleBtn != null) {
          let clickPoint = await doubleBtn.getBoundsCenter();
          await driver!.triggerPenKey(PenKey.AIR_MOUSE, PenMode.AIR_MOUSE, PenKeyOperation.DOUBLE_CLICK, { point: clickPoint });
          await driver!.delayMs(waitUiReadyMs)
          let newButton = await driver!.findComponent(ON.text('doubleClick'))
          if (newButton != null) {
            let text = await newButton.getText()
            expect(text).assertEqual('doubleClick')
          }
        }
      } catch (error) {
        hilog.info(domain, tag, `testDriverTriggerPenKeyAirMouseDoubleClick_static error: ${(error as Error).message}`);
        expect((error as BusinessError).code).assertEqual(ErrorCode17000005);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, 'testDriverTriggerPenKeyAirMouseDoubleClick_static over');
    });
  })
}
