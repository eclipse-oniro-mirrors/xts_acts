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

import { describe, it, expect, TestType, Level, Size, beforeAll, beforeEach, afterAll, afterEach } from '@ohos/hypium'
import { Driver, ON, PenKey, PenKeyOperation, PenMode, TouchOptions, } from '@kit.TestKit'
import { display } from '@kit.ArkUI';
import { startAbility, stopApplication } from './Util.test';
import fileIO from '@ohos.fileio';
import { hilog } from '@kit.PerformanceAnalysisKit';

const waitUiReadyMs: number = 1000;
const TestTag = 'UiTest_TAG';
const ErrorCode17000005 = 17000005;

export default function uitestApi26Test() {
  describe('uitestApi26Test', () => {
    let driver: Driver
    beforeAll(async (done: Function) => {
      driver = Driver.create()
      await driver.delayMs(1000)
      done()
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
     * @tc.name   testDriverClickAtDefault
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0100
     * @tc.desc   Test clickAt with point parameter (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtDefault start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.clickAt(center)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index');
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtDefault over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtEmptyOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0200
     * @tc.desc   Test clickAt with options={} (empty object)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtEmptyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtEmptyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = {};
      await driver.clickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverClickAtEmptyOptions end`);
    });

    /**
     * @tc.name   testDriverClickAtBoundaryPressureMin
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_BOUNDARY_0300
     * @tc.desc   Test clickAt with pressure=0 (minimum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtBoundaryPressureMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtBoundaryPressureMin start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0 };
      await driver.clickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverClickAtBoundaryPressureMin end`);
    });


    /**
     * @tc.name   testDriverClickAtPressureMax
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0400
     * @tc.desc   Test clickAt with point and pressure parameter (pressure = 1.0, maximum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtPressureMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtPressureMax start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 1.0 };
      await driver.clickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtPressureMax over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtPressure
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0500
     * @tc.desc   Test clickAt with point and pressure parameter (pressure = 0.5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtPressure start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0.5 };
      await driver.clickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtPressure over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtPressureMin
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0600
     * @tc.desc   Test clickAt with point and pressure parameter (pressure = 0.0, minimum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtPressureMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtPressureMin start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0.0 };
      await driver.clickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtPressureMin over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtNullOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0700
     * @tc.desc   Test clickAt with point parameter (options = null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtNullOptions start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.clickAt(center, null)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtNullOptions over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtUndefinedOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0800
     * @tc.desc   Test clickAt with point parameter (options = undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtUndefinedOptions start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.clickAt(center, undefined)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtUndefinedOptions over');
    });

    /**
     * @tc.name   testDriverLongClickAtDefault
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_0900
     * @tc.desc   Test longClickAt with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtDefault start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.longClickAt(center)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtDefault end`);
    });

    /**
     * @tc.name   testDriverLongClickAtEmptyOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1000
     * @tc.desc   Test longClickAt with empty TouchOptions object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtEmptyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtEmptyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = {};
      await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtEmptyOptions end`);
    });

    /**
     * @tc.name   testDriverLongClickAtDurationMin
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1100
     * @tc.desc   Test longClickAt with duration=1500 (minimum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtDurationMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtDurationMin start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { duration: 1500 };
      await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtDurationMin end`);
    });

    /**
     * @tc.name   testDriverLongClickAtPressure
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1200
     * @tc.desc   Test longClickAt with pressure=0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0.5 };
      await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtPressure end`);
    });

    /**
     * @tc.name   testDriverLongClickAtDurationAndPressure
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1300
     * @tc.desc   Test longClickAt with duration=3000 and pressure=0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtDurationAndPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtDurationAndPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { duration: 3000, pressure: 0.5 };
      await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtDurationAndPressure end`);
    });

    /**
     * @tc.name   testDriverLongClickAtBoundaryPressureMin
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_BOUNDARY_1400
     * @tc.desc   Test longClickAt with pressure=0 (minimum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtBoundaryPressureMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtBoundaryPressureMin start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0 };
      await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtBoundaryPressureMin end`);
    });

    /**
     * @tc.name   testDriverLongClickAtBoundaryPressureMax
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_BOUNDARY_1500
     * @tc.desc   Test longClickAt with pressure=1 (maximum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtBoundaryPressureMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtBoundaryPressureMax start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 1 };
      await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtBoundaryPressureMax end`);
    });

    /**
     * @tc.name   testDriverLongClickAtNullOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1600
     * @tc.desc   Test longClickAt with options=null (undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtNullOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.longClickAt(center, null)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtNullOptions end`);
    });

    /**
     * @tc.name   testDriverLongClickAtUndefinedOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1700
     * @tc.desc   Test longClickAt with options=undefined (undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtUndefinedOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.longClickAt(center, undefined)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtUndefinedOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenDefault
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_1800
     * @tc.desc   Test swipeBetween with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenDefault start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenDefault disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id })
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenDefault end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithSpeed
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_1900
     * @tc.desc   Test swipeBetween with speed option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithSpeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeed start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeed disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 2000 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeed end`);
    });


    /**
     * @tc.name   testDriverSwipeBetweenWithPressure
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2000
     * @tc.desc   Test swipeBetween with pressure option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithPressure disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { pressure: 0.5 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithPressure end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithSpeedAndPressure
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2100
     * @tc.desc   Test swipeBetween with both speed and pressure options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithSpeedAndPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeedAndPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeedAndPressure disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 2000, pressure: 0.5 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeedAndPressure end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenNullOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2300
     * @tc.desc   Test swipeBetween with null options (default TouchOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenNullOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenNullOptions disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, null)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenNullOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenUndefinedOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2400
     * @tc.desc   Test swipeBetween with undefined options (default TouchOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenUndefinedOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenUndefinedOptions disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, undefined)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenUndefinedOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithEmptyObjectOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2500
     * @tc.desc   Test swipeBetween with empty object options {}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithEmptyObjectOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithEmptyObjectOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithEmptyObjectOptions disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = {} as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithEmptyObjectOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedMinBoundary
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2600
     * @tc.desc   Test swipeBetween with speed at minimum boundary (200)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMinBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 200 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMinBoundary end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedMaxBoundary
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2700
     * @tc.desc   Test swipeBetween with speed at maximum boundary (40000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMaxBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMaxBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 40000 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMaxBoundary end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenPressureMinBoundary
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2800
     * @tc.desc   Test swipeBetween with pressure at minimum boundary (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenPressureMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMinBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { pressure: 0 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMinBoundary end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenPressureMaxBoundary
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2900
     * @tc.desc   Test swipeBetween with pressure at maximum boundary (1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenPressureMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMaxBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMaxBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { pressure: 1 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMaxBoundary end`);
    });


    /**
     * @tc.name   testDriverSwipeBetweenWithAllBoundaryValues
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_3000
     * @tc.desc   Test swipeBetween with all properties at boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithAllBoundaryValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithAllBoundaryValues start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithAllBoundaryValues disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 200, pressure: 1 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithAllBoundaryValues end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedOutOfRangeLow
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_BOUNDARY_3100
     * @tc.desc   Test swipeBetween with speed at min boundary (199)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedOutOfRangeLow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedOutOfRangeLow start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedOutOfRangeLow disPlay is: ${JSON.stringify(disPlay)}`);
      let scroll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scroll.getBounds()
      let center = await scroll.getBoundsCenter()
      const options: TouchOptions = { speed: 199 };
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedOutOfRangeLow end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedOutOfRangeHigh
     * @tc.number SUB_testfwk_UITEST_SWIPEBETWEEN_ERROR_0500
     * @tc.desc   Test swipeBetween with speed at maximum boundary (400001)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedOutOfRangeHigh', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedOutOfRangeHigh start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedOutOfRangeHigh disPlay is: ${JSON.stringify(disPlay)}`);
      let scroll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scroll.getBounds()
      let center = await scroll.getBoundsCenter()
      const options: TouchOptions = { speed: 40001 };
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedOutOfRangeHigh end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutDefault
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_PARAM_0100
     * @tc.desc   Test dumpLayout with default displayId parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let savePath = '/data/storage/el2/base/cache/dump_layout_001.json'
      const result: boolean = await driver.dumpLayout(savePath);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   testDriverDumpLayoutWithDisplayId
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_PARAM_0200
     * @tc.desc   Test dumpLayout with displayId from getDefaultDisplay()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutWithDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let savePath = '/data/storage/el2/base/cache/dump_layout_003.json'
      const displayId: number = (await display.getDefaultDisplay()).id;
      const result: boolean = await driver.dumpLayout(savePath, displayId);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   testDriverDumpLayoutVerifyJsonContent
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_RETURN_0300
     * @tc.desc   Test dumpLayout API 26.0 verifies JSON content structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutVerifyJsonContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDumpLayoutVerifyJsonContent start`);
      const savePath = '/data/storage/el2/base/cache/dump_verify_content.json';

      const result: boolean = await driver.dumpLayout(savePath, 0);
      expect(result).assertTrue();

      const fileStat = await fileIO.stat(savePath);

      expect(fileStat.size).assertLarger(0)

      const content = await fileIO.readText(savePath);
      console.info(`${TestTag}, testDriverDumpLayoutVerifyJsonContent content, ${content}`);
      expect(content.length).assertLarger(0)

      await fileIO.unlink(savePath);
      console.info(`${TestTag}, testDriverDumpLayoutVerifyJsonContent end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutZeroDisplayId
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_PARAM_0400
     * @tc.desc   Test dumpLayout API 26.0 with displayId=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutZeroDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDumpLayoutZeroDisplayId start`);
      let savePath = '/data/storage/el2/base/cache/dump_layout_004.json'
      const result: boolean = await driver.dumpLayout(savePath, 0);
      expect(result).assertTrue();
      console.info(`${TestTag}, testDriverDumpLayoutZeroDisplayId end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutDisplayIdNull
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_NULLUNDEFINED_0500
     * @tc.desc   Test dumpLayout API 26.0 with displayId=null, should use default value and execute normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutDisplayIdNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDumpLayoutDisplayIdNull start`);
      const savePath = '/data/storage/el2/base/cache/dump_display_null.json';

      const result: boolean = await driver.dumpLayout(savePath, null);
      expect(result).assertTrue();

      console.info(`${TestTag}, testDriverDumpLayoutDisplayIdNull end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutDisplayIdUndefined
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_NULLUNDEFINED_0600
     * @tc.desc   Test dumpLayout API 26.0 with displayId=undefined, should use default value and execute normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutDisplayIdUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDumpLayoutDisplayIdUndefined start`);
      const savePath = '/data/storage/el2/base/cache/dump_display_undefined.json';
      const result: boolean = await driver.dumpLayout(savePath, undefined);
      expect(result).assertTrue();
      console.info(`${TestTag}, testDriverDumpLayoutDisplayIdUndefined end`);
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0100
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClick start');
      try {
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.CLICK);
        await driver.delayMs(500);
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClick error: ' + error.code);
        expect(error.code).assertEqual(ErrorCode17000005)
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClick over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingWithPointClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0200
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingWithPointClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingWithPointClick start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let nextPageButton = await driver.findComponent(ON.text('next page'));
        expect(nextPageButton != null).assertTrue();
        let clickPoint = await nextPageButton.getBoundsCenter();
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.CLICK,
          { point: clickPoint});
        await driver.delayMs(500);
        let backToIndexComponent = await driver.findComponent(ON.text('back to index'));
        expect(backToIndexComponent != null).assertTrue();
        let componentText: string = await backToIndexComponent.getText();
        expect(componentText).assertEqual('back to index');
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingWithPointClick error: ' + error.code);
        expect(error.code).assertEqual(ErrorCode17000005)
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingWithPointClick over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingDoubleClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0300
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, DOUBLE_CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick start');
      try {
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.DOUBLE_CLICK);
        await driver.delayMs(500);
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick error: ' + error.code);
        expect(error.code).assertEqual(ErrorCode17000005);
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingWithPointDoubleClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0400
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, DOUBLE_CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingWithPointDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let doubleBtn = await driver.findComponent(ON.text('Click twice'))
        if (doubleBtn == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          doubleBtn = await scroll.scrollSearch(ON.text('Click twice'))
        }
        let center = await doubleBtn.getBoundsCenter()
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.DOUBLE_CLICK, {point: center});
        await driver.delayMs(waitUiReadyMs)
        let newButton = await driver.findComponent(ON.text('doubleClick'))
        let text = await newButton.getText()
        expect(text).assertEqual('doubleClick')
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick error: ' + error.code);
        expect(error.code).assertEqual(ErrorCode17000005);
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyAirMouseClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0500
     * @tc.desc   Test Driver.triggerPenKey with AIR_MOUSE mode, AIR_MOUSE key, CLICK operation with point
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyAirMouseClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseClick start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let nextPageButton = await driver.findComponent(ON.text('next page'));
        expect(nextPageButton != null).assertTrue();
        let clickPoint = await nextPageButton.getBoundsCenter();
        await driver.triggerPenKey(PenKey.AIR_MOUSE, PenMode.AIR_MOUSE, PenKeyOperation.CLICK, { point: clickPoint });
        await driver.delayMs(500);
        let backToIndexComponent= await driver.findComponent(ON.text('back to index'));
        expect(backToIndexComponent != null).assertTrue();
        let componentText: string = await backToIndexComponent.getText();
        expect(componentText).assertEqual('back to index');
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseClick error: ' + error.code);
        expect(error.code).assertEqual(ErrorCode17000005);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseClick over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyAirMouseDoubleClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0600
     * @tc.desc   Test Driver.triggerPenKey with AIR_MOUSE mode, AIR_MOUSE key, DOUBLE_CLICK operation with point
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyAirMouseDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseDoubleClick start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let doubleBtn = await driver.findComponent(ON.text('Click twice'))
        if (doubleBtn == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          doubleBtn = await scroll.scrollSearch(ON.text('Click twice'))
        }
        let clickPoint = await doubleBtn.getBoundsCenter();
        await driver.triggerPenKey(PenKey.AIR_MOUSE, PenMode.AIR_MOUSE, PenKeyOperation.DOUBLE_CLICK, { point: clickPoint });
        await driver.delayMs(waitUiReadyMs)
        let newButton = await driver.findComponent(ON.text('doubleClick'))
        let text = await newButton.getText()
        expect(text).assertEqual('doubleClick')
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseDoubleClick error: ' + error.code);
        expect(error.code).assertEqual(ErrorCode17000005);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseDoubleClick over');
    });


  })
}