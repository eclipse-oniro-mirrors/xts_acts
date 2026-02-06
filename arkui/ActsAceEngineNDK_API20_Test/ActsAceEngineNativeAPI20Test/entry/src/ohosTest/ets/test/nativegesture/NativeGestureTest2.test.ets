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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import nativegesturendk from 'libnativegesturendk.so'
import Utils from '../common/Utils'
import { ON, Component, Point } from '@kit.TestKit'

const ARKUI_ERROR_CODE_NO_ERROR = 0
const ARKUI_ERROR_CODE_PARAM_INVALID = 401
const ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED = 180102
export default function NativeGestureTest2() {
  describe('NativeGestureTest2', () => {
    let Component: Component;
    let ComponentPoint: Point;
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`NativeGestureTest/NativeGestureTest2`);
      Component = await Utils.driver.findComponent(ON.id('Column1'));
      ComponentPoint = await Component.getBoundsCenter();
      console.info(`====>ComponentPoint x====${ComponentPoint.x} y====${ComponentPoint.y}`);
      done();
    });

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_REPEAT_0100
     * @tc.name    : testGetGestureParam_repeat0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_repeat0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_repeat0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureParam_repeat0100();
          console.info(`====>testGetGestureParam_repeat0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_repeat0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_REPEAT_0200
     * @tc.name    : testGetGestureParam_repeat0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_repeat0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_repeat0200 start====");
          await Utils.driver.longClick(ComponentPoint.x, ComponentPoint.y)
          let result: number = nativegesturendk.GetGestureParam_repeat0200();
          console.info(`====>testGetGestureParam_repeat0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_repeat0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_DISTANCE_0100
     * @tc.name    : testGetGestureParam_distance0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_distance0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_distance0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureParam_distance0100();
          console.info(`====>testGetGestureParam_distance0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_distance0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_DISTANCE_0200
     * @tc.name    : testGetGestureParam_distance0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_distance0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_distance0200 start====");
          let component = await Utils.driver.findComponent(ON.id("Column1"));
          await component.pinchOut(1.5);
          let result: number = nativegesturendk.GetGestureParam_distance0200();
          console.info(`====>testGetGestureParam_distance0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_distance0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_SPEED_0100
     * @tc.name    : testGetGestureParam_speed0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_speed0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_speed0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureParam_speed0100();
          console.info(`====>testGetGestureParam_speed0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_speed0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_SPEED_0200
     * @tc.name    : testGetGestureParam_speed0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_speed0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_speed0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureParam_speed0200();
          console.info(`====>testGetGestureParam_speed0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_speed0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

   /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_DURATION_0100
     * @tc.name    : testGetGestureParam_duration0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_duration0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_duration0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureParam_duration0100();
          console.info(`====>testGetGestureParam_duration0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_duration0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_DURATION_0200
     * @tc.name    : testGetGestureParam_duration0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_duration0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_duration0200 start====");
          await Utils.driver.longClick(ComponentPoint.x, ComponentPoint.y)
          let result: number = nativegesturendk.GetGestureParam_duration0200();
          console.info(`====>testGetGestureParam_duration0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_duration0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

   /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_ANGLE_0100
     * @tc.name    : testGetGestureParam_angle0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_angle0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_angle0100 start====");
          await Utils.driver.longClick(ComponentPoint.x, ComponentPoint.y)
          let result: number = nativegesturendk.GetGestureParam_angle0100();
          console.info(`====>testGetGestureParam_angle0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_angle0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_ANGLE_0200
     * @tc.name    : testGetGestureParam_angle0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_angle0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_angle0200 start====");
          await Utils.driver.longClick(ComponentPoint.x, ComponentPoint.y)
          let result: number = nativegesturendk.GetGestureParam_angle0200();
          console.info(`====>testGetGestureParam_angle0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_angle0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

   /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_DISTANCETHRESHOLD_0100
     * @tc.name    : testGetGestureParam_distanceThreshold0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_distanceThreshold0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_distanceThreshold0100 start====");
          let result: number = nativegesturendk.GetGestureParam_distanceThreshold0100();
          console.info(`====>testGetGestureParam_distanceThreshold0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_distanceThreshold0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_DISTANCETHRESHOLD_0200
     * @tc.name    : testGetGestureParam_distanceThreshold0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_distanceThreshold0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_distanceThreshold0200 start====");
          await Utils.driver.click(ComponentPoint.x, ComponentPoint.y)
          let result: number = nativegesturendk.GetGestureParam_distanceThreshold0200();
          console.info(`====>testGetGestureParam_distanceThreshold0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_distanceThreshold0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_PANGESTURE_SETDISTANCEMAP_0100
     * @tc.name    : testPanGesture_SetDistanceMap0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testPanGesture_SetDistanceMap0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testPanGesture_SetDistanceMap0100 start====");
          let result: number = nativegesturendk.PanGesture_SetDistanceMap0100();
          console.info(`====>testPanGesture_SetDistanceMap0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testPanGesture_SetDistanceMap0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_PANGESTURE_SETDISTANCEMAP_0200
     * @tc.name    : testPanGesture_SetDistanceMap0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testPanGesture_SetDistanceMap0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testPanGesture_SetDistanceMap0200 start====");
          let result: number = nativegesturendk.PanGesture_SetDistanceMap0200();
          console.info(`====>testPanGesture_SetDistanceMap0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testPanGesture_SetDistanceMap0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_PANGESTURE_SETDISTANCEMAP_0300
     * @tc.name    : testPanGesture_SetDistanceMap0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testPanGesture_SetDistanceMap0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testPanGesture_SetDistanceMap0300 start====");
          let result: number = nativegesturendk.PanGesture_SetDistanceMap0300();
          console.info(`====>testPanGesture_SetDistanceMap0300 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testPanGesture_SetDistanceMap0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_SETTOUCHTESTDONECALLBACK_0100
     * @tc.name    : testSetTouchTestDoneCallback0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSetTouchTestDoneCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testSetTouchTestDoneCallback0100 start====");
          let result: number = nativegesturendk.SetTouchTestDoneCallback0100();
          console.info(`====>testSetTouchTestDoneCallback0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testSetTouchTestDoneCallback0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_SETTOUCHTESTDONECALLBACK_0200
     * @tc.name    : testSetTouchTestDoneCallback0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSetTouchTestDoneCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testSetTouchTestDoneCallback0200 start====");
          let result: number = nativegesturendk.SetTouchTestDoneCallback0200();
          console.info(`====>testSetTouchTestDoneCallback0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testSetTouchTestDoneCallback0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_VERSION_0100
     * @tc.name    : testVersion0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testVersion0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testSetTouchTestDoneCallback0200 start====");
          let result: number = nativegesturendk.version0100();
          console.info(`====>testSetTouchTestDoneCallback0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testSetTouchTestDoneCallback0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_CREATETAPGESTUREWITHDISTANCETHRESHOLd_0100
     * @tc.name    : testCreateTapGestureWithDistanceThreshold0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testCreateTapGestureWithDistanceThreshold0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testCreateTapGestureWithDistanceThreshold0100 start====");
          let result: number = nativegesturendk.createTapGestureWithDistanceThreshold0100();
          console.info(`====>testCreateTapGestureWithDistanceThreshold0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCreateTapGestureWithDistanceThreshold0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_GESTUREAPI1_0100
     * @tc.name    : testGestureApi10100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGestureApi10100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGestureApi10100 start====");
          let result: number = nativegesturendk.gestureApi10100();
          console.info(`====>testGestureApi10100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGestureApi10100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_PREVENTGESTURERECOGNIZERBEGIN_0100
     * @tc.name    : testPreventGestureRecognizerBegin0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testPreventGestureRecognizerBegin0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testPreventGestureRecognizerBegin0100 start====");
          await Utils.driver.click(ComponentPoint.x, ComponentPoint.y)
          let result: number = nativegesturendk.PreventGestureRecognizerBegin0100();
          console.info(`====>testPreventGestureRecognizerBegin0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testPreventGestureRecognizerBegin0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_PREVENTGESTURERECOGNIZERBEGIN_0200
     * @tc.name    : testPreventGestureRecognizerBegin0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testPreventGestureRecognizerBegin0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testPreventGestureRecognizerBegin0200 start====");
          let result: number = nativegesturendk.PreventGestureRecognizerBegin0200();
          console.info(`====>testPreventGestureRecognizerBegin0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testPreventGestureRecognizerBegin0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}