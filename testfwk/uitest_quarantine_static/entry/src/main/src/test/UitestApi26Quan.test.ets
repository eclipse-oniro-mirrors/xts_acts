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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "../../../hypium/index"
import { Component, Driver, KeyOptions, ON, Point, TouchOptions} from '@kit.TestKit'

import { startAbility, stopApplication } from './Util.test';

const waitUiReadyMs: int = 1000;
const TestTag: string = 'UiTest_API16';


export default function UiTest(): void {
  describe('UiTest_API26', (): void => {
    let driver: Driver | undefined;
    beforeAll(async (): Promise<void> => {
      driver = Driver.create()
      await driver!.delayMs(1000)
    })

    beforeEach(async (): Promise<void> => {
      await stopApplication('com.uitestScene.acts');
    })

    afterEach(async (): Promise<void> => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testDriverDragBetweenDefault_static
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0100
     * @tc.desc   Test dragBetween with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenDefault_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenDefault_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      await button.longClick()
      await driver!.delayMs(waitUiReadyMs)
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      await driver!.dragBetween(center1, center2)
      await driver!.delayMs(waitUiReadyMs)
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenDefault_static end`);
    });

     /**
      * @tc.name   testDriverDragBetweenUndefinedOptions_static
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0300
      * @tc.desc   Test dragBetween with undefined options (default TouchOptions)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenUndefinedOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenUndefinedOptions_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      await button.longClick()
      await driver!.delayMs(waitUiReadyMs)
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      await driver!.dragBetween(center1, center2, undefined)
      await driver!.delayMs(waitUiReadyMs)
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenUndefinedOptions_static end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithEmptyObjectOptions_static
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0400
      * @tc.desc   Test dragBetween with empty object options {}
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithEmptyObjectOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithEmptyObjectOptions_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      await button.longClick()
      await driver!.delayMs(waitUiReadyMs)
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = {};
      await driver!.dragBetween(center1, center2, options)
      await driver!.delayMs(waitUiReadyMs)
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithEmptyObjectOptions_static end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithSpeed_static
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0500
      * @tc.desc   Test dragBetween with speed option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithSpeed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithSpeed_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      await button.longClick()
      await driver!.delayMs(waitUiReadyMs)
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { speed: 2000 };
      await driver!.dragBetween(center1, center2, options)
      await driver!.delayMs(waitUiReadyMs)
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithSpeed_static end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithDuration_static
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0600
      * @tc.desc   Test dragBetween with duration option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithDuration_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithDuration_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      await button.longClick()
      await driver!.delayMs(waitUiReadyMs)
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { duration: 2000 };
      await driver!.dragBetween(center1, center2, options)
      await driver!.delayMs(waitUiReadyMs)
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithDuration_static end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithPressure_static
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0700
      * @tc.desc   Test dragBetween with pressure option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithPressure_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithPressure_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      await button.longClick()
      await driver!.delayMs(waitUiReadyMs)
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { pressure: 0.5 };
      await driver!.dragBetween(center1, center2, options)
      await driver!.delayMs(waitUiReadyMs)
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithPressure_static end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithAllOptions_static
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0800
      * @tc.desc   Test dragBetween with all TouchOptions properties (speed, pressure, duration)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithAllOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithAllOptions_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      await button.longClick()
      await driver!.delayMs(waitUiReadyMs)
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { speed: 2000, pressure: 0.8, duration: 3000 };
      await driver!.dragBetween(center1, center2, options)
      await driver!.delayMs(waitUiReadyMs)
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithAllOptions_static end`);
    });

     /**
      * @tc.name   testDriverDragBetweenSpeedMinBoundary_static
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_0900
      * @tc.desc   Test dragBetween with speed at minimum boundary (200)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenSpeedMinBoundary_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenSpeedMinBoundary_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      await button.longClick()
      await driver!.delayMs(waitUiReadyMs)
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { speed: 200 };
      await driver!.dragBetween(center1, center2, options);
      await driver!.delayMs(waitUiReadyMs)
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenSpeedMinBoundary_static end`);
    });

     /**
      * @tc.name   testDriverDragBetweenSpeedMaxBoundary_static
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_0200
      * @tc.desc   Test dragBetween with speed at maximum boundary (40000)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenSpeedMaxBoundary_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenSpeedMaxBoundary_static start`);
      try {
        const options: TouchOptions = { speed: 40000, duration: 3500 };
        let p1: Point = {x: 100, y: 100};
        let p2: Point = {x: 100, y: 100};
        await driver!.dragBetween(p1, p2, options);
        await driver!.delayMs(waitUiReadyMs);
      } catch (error) {
        console.info(`${TestTag}, testDriverDragBetweenSpeedMaxBoundary_static error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.info(`${TestTag}, testDriverDragBetweenSpeedMaxBoundary_static end`);
    });

     /**
      * @tc.name   testDriverDragBetweenDurationMinBoundary_static
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_0300
      * @tc.desc   Test dragBetween with duration at minimum boundary (1500)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenDurationMinBoundary_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenDurationMinBoundary_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      await button.longClick()
      await driver!.delayMs(waitUiReadyMs)
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { duration: 1500 };
      await driver!.dragBetween(center1, center2, options);
      await driver!.delayMs(waitUiReadyMs)
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenDurationMinBoundary_static end`);
    });

    /**
     * @tc.name   testDriverDragBetweenPressureMinBoundary_static
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_1200
     * @tc.desc   Test dragBetween with pressure at minimum boundary (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenPressureMinBoundary_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenPressureMinBoundary_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      await button.longClick()
      await driver!.delayMs(waitUiReadyMs)
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { pressure: 0 };
      await driver!.dragBetween(center1, center2, options);
      await driver!.delayMs(waitUiReadyMs)
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenPressureMinBoundary_static end`);
    });

     /**
      * @tc.name   testDriverDragBetweenPressureMaxBoundary_static
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_1300
      * @tc.desc   Test dragBetween with pressure at maximum boundary (1)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenPressureMaxBoundary_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenPressureMaxBoundary_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      await button.longClick()
      await driver!.delayMs(waitUiReadyMs)
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { pressure: 1 };
      await driver!.dragBetween(center1, center2, options);
      await driver!.delayMs(waitUiReadyMs)
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenPressureMaxBoundary_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragDefault_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0100
     * @tc.desc   Test mouseDrag with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragDefault_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragDefault_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      await driver!.mouseDrag(point1, point2);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragDefault_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithSpeed_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0200
     * @tc.desc   Test mouseDrag with speed option in TouchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithSpeed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithSpeed_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 2000 };
      await driver!.mouseDrag(point1, point2, touchOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithSpeed_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithDuration_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0300
     * @tc.desc   Test mouseDrag with duration option in TouchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithDuration_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithDuration_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { duration: 2000 };
      await driver!.mouseDrag(point1, point2, touchOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithDuration_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithPressure_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0400
     * @tc.desc   Test mouseDrag with pressure option in TouchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithPressure_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithPressure_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 600 };
      await driver!.mouseDrag(point1, point2, touchOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithPressure_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithAllTouchOptions_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0500
     * @tc.desc   Test mouseDrag with all TouchOptions (speed, duration, pressure)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithAllTouchOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithAllTouchOptions_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 600, duration: 2500 };
      await driver!.mouseDrag(point1, point2, touchOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithAllTouchOptions_static end`);
      await stopApplication('com.uitestScene.acts')
    });

    /**
     * @tc.name   testDriverMouseDragWithKey1_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0600
     * @tc.desc   Test mouseDrag with key1 option in KeyOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithKey1_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithKey1_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const keyOptions: KeyOptions = { key1: 0 };
      await driver!.mouseDrag(point1, point2, undefined, keyOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithKey1_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithAllOptions_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_0800
     * @tc.desc   Test mouseDrag with all options (TouchOptions and KeyOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithAllOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithAllOptions_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 600, duration: 2000};
      const keyOptions: KeyOptions = { key1: 0, key2: 0 };
      await driver!.mouseDrag(point1, point2, touchOptions, keyOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithAllOptions_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragWitUndefinedTouchOptions_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_1000
     * @tc.desc   Test mouseDrag with undefined TouchOptions, should use default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWitUndefinedTouchOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWitUndefinedTouchOptions_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      await driver!.mouseDrag(point1, point2, undefined, undefined);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWitUndefinedTouchOptions_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithEmptyTouchOptions_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_1100
     * @tc.desc   Test mouseDrag with empty TouchOptions, should use default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithEmptyTouchOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithEmptyTouchOptions_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = {};
      await driver!.mouseDrag(point1, point2, touchOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithEmptyTouchOptions_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithEmptyKeyOptions_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_1200
     * @tc.desc   Test mouseDrag with empty KeyOptions, should not inject any key events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithEmptyKeyOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithEmptyKeyOptions_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const keyOptions: KeyOptions = {};
      await driver!.mouseDrag(point1, point2, undefined, keyOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithEmptyKeyOptions_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithUndefinedKeyOptions_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_PARAM_1400
     * @tc.desc   Test mouseDrag with undefined KeyOptions, should not inject any key events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithUndefinedKeyOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithUndefinedKeyOptions_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 800 };
      await driver!.mouseDrag(point1, point2, touchOptions, undefined);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithUndefinedKeyOptions_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragSpeedMinimum_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_BOUNDARY_0100
     * @tc.desc   Test mouseDrag with minimum speed value (200)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragSpeedMinimum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragSpeedMinimum_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 200 };
      await driver!.mouseDrag(point1, point2, touchOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragSpeedMinimum_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragSpeedMaximum_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_BOUNDARY_0200
     * @tc.desc   Test mouseDrag with maximum speed value (40000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragSpeedMaximum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragSpeedMaximum_static start`);
      try {
        const touchOptions: TouchOptions = { speed: 40000 };
        let p1: Point = {x: 100, y: 100};
        let p2: Point = {x: 100, y: 100};
        await driver!.mouseDrag(p1, p2, touchOptions);
        await driver!.delayMs(2000);
      } catch (error) {
        console.log(`${TestTag}, testDriverMouseDragSpeedMaximum_static error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testDriverMouseDragSpeedMaximum_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragDurationMinimum_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_BOUNDARY_0300
     * @tc.desc   Test mouseDrag with minimum duration value (1500)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragDurationMinimum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragDurationMinimum_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { duration: 1500 };
      await driver!.mouseDrag(point1, point2, touchOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragDurationMinimum_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorSpeedTooSmall_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0300
     * @tc.desc   Test mouseDrag with speed less than 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorSpeedTooSmall_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedTooSmall_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 199 };
      await driver!.mouseDrag(point1, point2, touchOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedTooSmall_static end`);
    });

    /**
     * @tc.name   testDriverMouseDragErrorSpeedTooLarge_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_ERROR_0400
     * @tc.desc   Test mouseDrag with speed greater than 40000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragErrorSpeedTooLarge_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedTooLarge_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = (await driver!.findComponent(ON.id('jump'))) as Component;
      let center: Point = await button.getBoundsCenter();
      await driver!.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver!.delayMs(waitUiReadyMs);
      let text1 = (await driver!.findComponent(ON.text('one'))) as Component;
      let text2 = (await driver!.findComponent(ON.text('two'))) as Component;
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 40001 };
      await driver!.mouseDrag(point1, point2, touchOptions);
      await driver!.delayMs(2000);
      let text: Component | null = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragErrorSpeedTooLarge_static end`);
    });

  })
}
