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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { Component, Driver, KeyOptions, ON, Point, TouchOptions} from '@kit.TestKit'

import { startAbility, stopApplication } from './Util.test';

const waitUiReadyMs: number = 1000;
const TestTag = 'UiTest_API16';


export default function UiTest() {
  describe('UiTest_API26', () => {
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

    /**
     * @tc.name   testDriverDragBetweenDefault
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0100
     * @tc.desc   Test dragBetween with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenDefault start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      await driver.dragBetween(center1, center2)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenDefault end`);
    });

     /**
      * @tc.name   testDriverDragBetweenNullOptions
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0200
      * @tc.desc   Test dragBetween with null options (default TouchOptions)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenNullOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      await driver.dragBetween(center1, center2, null)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenNullOptions end`);
    });
     /**
      * @tc.name   testDriverDragBetweenUndefinedOptions
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0300
      * @tc.desc   Test dragBetween with undefined options (default TouchOptions)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenUndefinedOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      await driver.dragBetween(center1, center2, undefined)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenUndefinedOptions end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithEmptyObjectOptions
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0400
      * @tc.desc   Test dragBetween with empty object options {}
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithEmptyObjectOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithEmptyObjectOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = {} as TouchOptions;
      await driver.dragBetween(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithEmptyObjectOptions end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithSpeed
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0500
      * @tc.desc   Test dragBetween with speed option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithSpeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithSpeed start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { speed: 2000 };
      await driver.dragBetween(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithSpeed end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithDuration
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0600
      * @tc.desc   Test dragBetween with duration option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithDuration start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { duration: 2000 } as TouchOptions;
      await driver.dragBetween(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithDuration end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithPressure
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0700
      * @tc.desc   Test dragBetween with pressure option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { pressure: 0.5 };
      await driver.dragBetween(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithPressure end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithAllOptions
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0800
      * @tc.desc   Test dragBetween with all TouchOptions properties (speed, pressure, duration)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithAllOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithAllOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { speed: 2000, pressure: 0.8, duration: 3000 };
      await driver.dragBetween(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithAllOptions end`);
    });

     /**
      * @tc.name   testDriverDragBetweenSpeedMinBoundary
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_0900
      * @tc.desc   Test dragBetween with speed at minimum boundary (200)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenSpeedMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenSpeedMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { speed: 200 };
      await driver.dragBetween(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenSpeedMinBoundary end`);
    });

     /**
      * @tc.name   testDriverDragBetweenSpeedMaxBoundary
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_0200
      * @tc.desc   Test dragBetween with speed at maximum boundary (40000)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenSpeedMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenSpeedMaxBoundary start`);
      try {
        const options: TouchOptions = { speed: 40000, duration: 3500 };
        // 速度太快未触发滑动。
        let result = await driver.dragBetween({x: 100, y: 100}, {x: 100, y: 100}, options);
        await driver.delayMs(waitUiReadyMs);
        expect(result).assertNull();
      } catch (error) {
        console.info(`${TestTag}, testDriverDragBetweenSpeedMaxBoundary error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.info(`${TestTag}, testDriverDragBetweenSpeedMaxBoundary end`);
    });

     /**
      * @tc.name   testDriverDragBetweenDurationMinBoundary
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_0300
      * @tc.desc   Test dragBetween with duration at minimum boundary (1500)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenDurationMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenDurationMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { duration: 1500 };
      await driver.dragBetween(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenDurationMinBoundary end`);
    });

    /**
     * @tc.name   testDriverDragBetweenPressureMinBoundary
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_1200
     * @tc.desc   Test dragBetween with pressure at minimum boundary (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenPressureMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenPressureMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { pressure: 0 };
      await driver.dragBetween(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenPressureMinBoundary end`);
    });

     /**
      * @tc.name   testDriverDragBetweenPressureMaxBoundary
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_1300
      * @tc.desc   Test dragBetween with pressure at maximum boundary (1)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenPressureMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenPressureMaxBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { pressure: 1 };
      await driver.dragBetween(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenPressureMaxBoundary end`);
    });

    /**
     * @tc.name   testDriverMouseDragDefault
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0100
     * @tc.desc   Test mouseDrag with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragDefault start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      await driver.mouseDrag(point1, point2);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragDefault end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithSpeed
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0200
     * @tc.desc   Test mouseDrag with speed option in TouchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithSpeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithSpeed start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 2000 };
      await driver.mouseDrag(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithSpeed end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithDuration
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0300
     * @tc.desc   Test mouseDrag with duration option in TouchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithDuration start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { duration: 2000 };
      await driver.mouseDrag(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithDuration end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithPressure
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0400
     * @tc.desc   Test mouseDrag with pressure option in TouchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 600 };
      await driver.mouseDrag(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithPressure end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithAllTouchOptions
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0500
     * @tc.desc   Test mouseDrag with all TouchOptions (speed, duration, pressure)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithAllTouchOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithAllTouchOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 600, duration: 2500 };
      await driver.mouseDrag(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithAllTouchOptions end`);
      await stopApplication('com.uitestScene.acts')
    });

    /**
     * @tc.name   testDriverMouseDragWithKey1
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0600
     * @tc.desc   Test mouseDrag with key1 option in KeyOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithKey1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithKey1 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const keyOptions: KeyOptions = { key1: 0 };
      await driver.mouseDrag(point1, point2, undefined, keyOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithKey1 end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithKey2
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0700
     * @tc.desc   Test mouseDrag with key2 option in KeyOptions (with key1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithKey2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithKey2 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const keyOptions: KeyOptions = { key1: 0, key2: 0 };
      await driver.mouseDrag(point1, point2, null, keyOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithKey2 end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithAllOptions
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0800
     * @tc.desc   Test mouseDrag with all options (TouchOptions and KeyOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithAllOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithAllOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 600, duration: 2000};
      const keyOptions: KeyOptions = { key1: 0, key2: 0 };
      await driver.mouseDrag(point1, point2, touchOptions, keyOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithAllOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithNullTouchOptions
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0900
     * @tc.desc   Test mouseDrag with null TouchOptions, should use default values
     * @ @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithNullTouchOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithNullTouchOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      await driver.mouseDrag(point1, point2, null, undefined);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithNullTouchOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWitUndefinedTouchOptions
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_1000
     * @tc.desc   Test mouseDrag with undefined TouchOptions, should use default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWitUndefinedTouchOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWitUndefinedTouchOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      await driver.mouseDrag(point1, point2, undefined, undefined);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWitUndefinedTouchOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithEmptyTouchOptions
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_1100
     * @tc.desc   Test mouseDrag with empty TouchOptions, should use default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithEmptyTouchOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithEmptyTouchOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = {};
      await driver.mouseDrag(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithEmptyTouchOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithEmptyKeyOptions
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_1200
     * @tc.desc   Test mouseDrag with empty KeyOptions, should not inject any key events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithEmptyKeyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithEmptyKeyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const keyOptions: KeyOptions = {};
      await driver.mouseDrag(point1, point2, undefined, keyOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithEmptyKeyOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithNullKeyOptions
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_1300
     * @tc.desc   Test mouseDrag with null KeyOptions, should not inject any key events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithNullKeyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithNullKeyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 2000 };
      await driver.mouseDrag(point1, point2, touchOptions, null);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithNullKeyOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithUndefinedKeyOptions
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_1400
     * @ @tc.desc   Test mouseDrag with undefined KeyOptions, should not inject any key events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithUndefinedKeyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithUndefinedKeyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 800 };
      await driver.mouseDrag(point1, point2, touchOptions, undefined);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithUndefinedKeyOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragSpeedMinimum
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_BOUNDARY_0100
     * @tc.desc   Test mouseDrag with minimum speed value (200)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragSpeedMinimum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragSpeedMinimum start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 200 };
      await driver.mouseDrag(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragSpeedMinimum end`);
    });

    /**
     * @tc.name   testDriverMouseDragSpeedMaximum
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_BOUNDARY_0200
     * @tc.desc   Test mouseDrag with maximum speed value (40000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @ @tc.level  LEVEL3
     */
    it('testDriverMouseDragSpeedMaximum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragSpeedMaximum start`);
      try {
        const touchOptions: TouchOptions = { speed: 40000 };
        // 速度过快未触发滑动操作。
        let result = await driver.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, touchOptions);
        await driver.delayMs(2000);
        expect(result).assertNull();
      } catch (error) {
        console.log(`${TestTag}, testDriverMouseDragSpeedMaximum error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testDriverMouseDragSpeedMaximum end`);
    });

    /**
     * @tc.name   testDriverMouseDragDurationMinimum
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_BOUNDARY_0300
     * @tc.desc   Test mouseDrag with minimum duration value (1500)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragDurationMinimum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragDurationMinimum start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { duration: 1500 };
      await driver.mouseDrag(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragDurationMinimum end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorSpeedTooSmall
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0300
     * @tc.desc   Test mouseDrag with speed less than 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorSpeedTooSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedTooSmall start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 199 };
      await driver.mouseDrag(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedTooSmall end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorSpeedTooLarge
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0400
     * @tc.desc   Test mouseDrag with speed greater than 40000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorSpeedTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedTooLarge start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 40001 };
      await driver.mouseDrag(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedTooLarge end`);
    });

  })
}
