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
import { ON, Component, Point } from '@kit.TestKit';

const ARKUI_ERROR_CODE_NO_ERROR = 0
const ARKUI_ERROR_CODE_PARAM_INVALID = 401
const ARKUI_ERROR_CODE_NON_SCROLLABLE_CONTAINER = 180001
const ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH = 180002
export default function NativeGestureTest1() {
  describe('NativeGestureTest1', () => {
    let Component: Component;
    let ComponentPoint: Point;
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`NativeGestureTest/NativeGestureTest1`);
      Component = await Utils.driver.findComponent(ON.id('Column1'));
      ComponentPoint = await Component.getBoundsCenter();
      console.info(`====>ComponentPoint x====${ComponentPoint.x} y====${ComponentPoint.y}`);
      done();
    });
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GESTUREINTERRUPTINFO_GETTOUCHRECOGNIZERS_0200
     * @tc.name    : testGetTouchRecognizers0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetTouchRecognizers0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetTouchRecognizers0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetTouchRecognizers0200();
          console.info(`====>testGetTouchRecognizers0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetTouchRecognizers0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_TOUCHRECOGNIZER_CANCELTOUCH_0200
     * @tc.name    : testCancelTouch0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testCancelTouch0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testCancelTouch0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.CancelTouch0200();
          console.info(`====>testCancelTouch0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCancelTouch0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_GetResponseRecognizersFromInterruptInfo_0200
     * @tc.name    : testGetFromInterruptInfo0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetFromInterruptInfo0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetFromInterruptInfo0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetFromInterruptInfo0200();
          console.info(`====>testGetFromInterruptInfo0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetFromInterruptInfo0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_SetGestureRecognizerEnabled_0100
     * @tc.name    : testSetGestureRecognizerEnabled0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSetGestureRecognizerEnabled0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testSetGestureRecognizerEnabled0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.SetGestureRecognizerEnabled0100();
          console.info(`====>testSetGestureRecognizerEnabled0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testSetGestureRecognizerEnabled0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_SetGestureRecognizerEnabled_0200
     * @tc.name    : testSetGestureRecognizerEnabled0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSetGestureRecognizerEnabled0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testSetGestureRecognizerEnabled0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.SetGestureRecognizerEnabled0200();
          console.info(`====>testSetGestureRecognizerEnabled0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testSetGestureRecognizerEnabled0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_SetGestureRecognizerLimitFingerCount_0100
     * @tc.name    : testSetGestureRecognizerLimitFingerCount0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSetGestureRecognizerLimitFingerCount0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testSetGestureRecognizerLimitFingerCount0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.SetGestureRecognizerLimitFingerCount0100();
          console.info(`====>testSetGestureRecognizerLimitFingerCount0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testSetGestureRecognizerLimitFingerCount0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTURERECOGNIZERSTATE_0100
     * @tc.name    : testGetGestureRecognizerState0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureRecognizerState0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureRecognizerState0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureRecognizerState0100();
          console.info(`====>testGetGestureRecognizerState0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureRecognizerState0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTURERECOGNIZERSTATE_0200
     * @tc.name    : testGetGestureRecognizerState0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureRecognizerState0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureRecognizerState0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureRecognizerState0200();
          console.info(`====>testGetGestureRecognizerState0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureRecognizerState0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREEVENTTARGETINFO_0100
     * @tc.name    : testGetGestureEventTargetInfo0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureEventTargetInfo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureEventTargetInfo0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureEventTargetInfo0100();
          console.info(`====>testGetGestureEventTargetInfo0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureEventTargetInfo0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREEVENTTARGETINFO_0200
     * @tc.name    : testGetGestureEventTargetInfo0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureEventTargetInfo0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureEventTargetInfo0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureEventTargetInfo0200();
          console.info(`====>testGetGestureEventTargetInfo0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureEventTargetInfo0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GESTUREEVENTTARGETINFO_ISSCROLLBEGIN_0200
     * @tc.name    : testGestureEventTargetInfo_IsScrollBegin0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGestureEventTargetInfo_IsScrollBegin0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGestureEventTargetInfo_IsScrollBegin0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GestureEventTargetInfo_IsScrollBegin0200();
          console.info(`====>testGestureEventTargetInfo_IsScrollBegin0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGestureEventTargetInfo_IsScrollBegin0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GESTUREEVENTTARGETINFO_ISSCROLLBEGIN_0300
     * @tc.name    : testGestureEventTargetInfo_IsScrollBegin0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGestureEventTargetInfo_IsScrollBegin0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGestureEventTargetInfo_IsScrollBegin0300 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GestureEventTargetInfo_IsScrollBegin0300();
          console.info(`====>testGestureEventTargetInfo_IsScrollBegin0300 result====${result}`);
          expect(ARKUI_ERROR_CODE_NON_SCROLLABLE_CONTAINER).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGestureEventTargetInfo_IsScrollBegin0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GESTUREEVENTTARGETINFO_ISSCROLLEND_0200
     * @tc.name    : testGestureEventTargetInfo_IsScrollEnd0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGestureEventTargetInfo_IsScrollEnd0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGestureEventTargetInfo_IsScrollEnd0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GestureEventTargetInfo_IsScrollEnd0200();
          console.info(`====>testGestureEventTargetInfo_IsScrollEnd0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGestureEventTargetInfo_IsScrollEnd0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GESTUREEVENTTARGETINFO_ISSCROLLEND_0300
     * @tc.name    : testGestureEventTargetInfo_IsScrollEnd0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGestureEventTargetInfo_IsScrollEnd0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGestureEventTargetInfo_IsScrollEnd0300 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GestureEventTargetInfo_IsScrollEnd0300();
          console.info(`====>testGestureEventTargetInfo_IsScrollEnd0300 result====${result}`);
          expect(ARKUI_ERROR_CODE_NON_SCROLLABLE_CONTAINER).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGestureEventTargetInfo_IsScrollEnd0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_GETPANGESTUREDIRECTIONMASK_0100
     * @tc.name    : testGetPanGestureDirectionMask0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetPanGestureDirectionMask0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetPanGestureDirectionMask0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetPanGestureDirectionMask0100();
          console.info(`====>testGetPanGestureDirectionMask0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetPanGestureDirectionMask0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

   /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_GETPANGESTUREDIRECTIONMASK_0200
     * @tc.name    : testGetPanGestureDirectionMask0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetPanGestureDirectionMask0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetPanGestureDirectionMask0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetPanGestureDirectionMask0200();
          console.info(`====>testGetPanGestureDirectionMask0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetPanGestureDirectionMask0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTURETAG_0200
     * @tc.name    : testGetGestureTag0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureTag0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureTag0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureTag0200();
          console.info(`====>testGetGestureTag0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureTag0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREBINDNODEID_0100
     * @tc.name    : testGetGestureBindNodeId0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureBindNodeId0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureBindNodeId0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureBindNodeId0100();
          console.info(`====>testGetGestureBindNodeId0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureBindNodeId0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREBINDNODEID_0200
     * @tc.name    : testGetGestureBindNodeId0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureBindNodeId0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureBindNodeId0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureBindNodeId0200();
          console.info(`====>testGetGestureBindNodeId0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureBindNodeId0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREBINDNODEID_0300
     * @tc.name    : testGetGestureBindNodeId0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureBindNodeId0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureBindNodeId0300 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureBindNodeId0300();
          console.info(`====>testGetGestureBindNodeId0300 result====${result}`);
          expect(ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureBindNodeId0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_PARALLELINNERGESTUREEVENT_GETCONFLICTRECOGNIZERS_0200
     * @tc.name    : testGetConflictRecognizers0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetConflictRecognizers0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetConflictRecognizers0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetConflictRecognizers0200();
          console.info(`====>testGetConflictRecognizers0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetConflictRecognizers0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_SETARKUIGESTURERECOGNIZERDISPOSENOTIFY_0200
     * @tc.name    : testSetArkUIGestureRecognizerDisposeNotify0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSetArkUIGestureRecognizerDisposeNotify0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testSetArkUIGestureRecognizerDisposeNotify0200 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.SetArkUIGestureRecognizerDisposeNotify0200();
          console.info(`====>testSetArkUIGestureRecognizerDisposeNotify0200 result====${result}`);
          expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testSetArkUIGestureRecognizerDisposeNotify0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_DIRECTMASK_0100
     * @tc.name    : testGetGestureParam_DirectMask0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_DirectMask0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_DirectMask0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureParam_DirectMask0100();
          console.info(`====>testGetGestureParam_DirectMask0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_DirectMask0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_FINGERCOUNT_0100
     * @tc.name    : testGetGestureParam_FingerCount0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_FingerCount0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_FingerCount0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureParam_FingerCount0100();
          console.info(`====>testGetGestureParam_FingerCount0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_FingerCount0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_GETGESTUREPARAM_LIMITFINGERCOUNT_0100
     * @tc.name    : testGetGestureParam_limitFingerCount0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetGestureParam_limitFingerCount0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureParam_limitFingerCount0100 start====");
          await Utils.driver.swipe(ComponentPoint.x, ComponentPoint.y, globalThis.winLeft, globalThis.winTop, 5000);
          let result: number = nativegesturendk.GetGestureParam_limitFingerCount0100();
          console.info(`====>testGetGestureParam_limitFingerCount0100 result====${result}`);
          expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureParam_limitFingerCount0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })
  })
}