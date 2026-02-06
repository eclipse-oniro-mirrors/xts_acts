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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import animatendk from 'libanimatendk.so'

const ARKUI_ERROR_CODE_NO_ERROR = 0
const ARKUI_ERROR_CODE_PARAM_INVALID = 401

export default function KeyframeAnimateTest() {
  describe('KeyframeAnimateTest', () => {

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETDELAY_0100
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetDelay0100
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetDelay0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetDelay0100 start====");

          let result: number = animatendk.KeyframeSetDelay0100();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetDelay0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetDelay0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETDELAY_0200
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetDelay0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetDelay0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetDelay0200 start====");

          let result: number = animatendk.KeyframeSetDelay0200();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetDelay0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetDelay0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETITERATIONS_0100
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetIterations0100
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetIterations0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetIterations0100 start====");

          let result: number = animatendk.KeyframeSetIterations0100();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetIterations0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetIterations0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETITERATIONS_0200
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetIterations0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetIterations0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetIterations0200 start====");

          let result: number = animatendk.KeyframeSetIterations0200();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetIterations0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetIterations0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETITERATIONS_0300
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetIterations0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetIterations0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetIterations0300 start====");

          let result: number = animatendk.KeyframeSetIterations0300();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetIterations0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetIterations0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_REGISTERONFINISHCALLBACK_0100
     * @tc.name    : testOHArkUIKeyframeAnimateOptionRegisterOnFinishCallback0100
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionRegisterOnFinishCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionRegisterOnFinishCallback0100 start====");

          let result: number = animatendk.KeyframeRegisterOnFinishCallback0100();
          console.info(`====>testOHArkUIKeyframeAnimateOptionRegisterOnFinishCallback0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionRegisterOnFinishCallback0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_REGISTERONFINISHCALLBACK_0200
     * @tc.name    : testOHArkUIKeyframeAnimateOptionRegisterOnFinishCallback0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionRegisterOnFinishCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionRegisterOnFinishCallback0200 start====");

          let result: number = animatendk.KeyframeRegisterOnFinishCallback0200();
          console.info(`====>testOHArkUIKeyframeAnimateOptionRegisterOnFinishCallback0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionRegisterOnFinishCallback0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETEXPECTEDFRAMERATE_0100
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0100
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0100 start====");

          let result: number = animatendk.KeyframeSetExpectedFrameRate0100();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETEXPECTEDFRAMERATE_0200
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0200 start====");

          let result: number = animatendk.KeyframeSetExpectedFrameRate0200();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETEXPECTEDFRAMERATE_0300
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0300 start====");

          let result: number = animatendk.KeyframeSetExpectedFrameRate0300();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetExpectedFrameRate0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETDURATION_0100
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetDuration0100
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetDuration0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetDuration0100 start====");

          let result: number = animatendk.KeyframeSetDuration0100();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetDuration0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetDuration0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETDURATION_0200
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetDuration0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetDuration0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetDuration0200 start====");

          let result: number = animatendk.KeyframeSetDuration0200();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetDuration0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetDuration0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETDURATION_0300
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetDuration0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetDuration0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetDuration0300 start====");

          let result: number = animatendk.KeyframeSetDuration0300();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetDuration0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetDuration0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETDURATION_0400
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetDuration0400
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetDuration0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetDuration0400 start====");

          let result: number = animatendk.KeyframeSetDuration0400();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetDuration0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetDuration0400 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETDURATION_0500
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetDuration0500
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetDuration0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetDuration0500 start====");

          let result: number = animatendk.KeyframeSetDuration0500();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetDuration0500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetDuration0500 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETCURVE_0100
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetCurve0100
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetCurve0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetCurve0100 start====");

          let result: number = animatendk.KeyframeSetCurve0100();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetCurve0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetCurve0100 catch err: " + err);
          expect(false).assertEqual(0);
          done()
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETCURVE_0200
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetCurve0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetCurve0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetCurve0200 start====");

          let result: number = animatendk.KeyframeSetCurve0200();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetCurve0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetCurve0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETCURVE_0300
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetCurve0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetCurve0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetCurve0300 start====");

          let result: number = animatendk.KeyframeSetCurve0300();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetCurve0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetCurve0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_SETCURVE_0400
     * @tc.name    : testOHArkUIKeyframeAnimateOptionSetCurve0400
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionSetCurve0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionSetCurve0400 start====");

          let result: number = animatendk.KeyframeSetCurve0400();
          console.info(`====>testOHArkUIKeyframeAnimateOptionSetCurve0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionSetCurve0400 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_REGISTERONEVENTCALLBACK_0100
     * @tc.name    : testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0100
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0100 start====");

          let result: number = animatendk.KeyframeRegisterOnEventCallback0100();
          console.info(`====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_REGISTERONEVENTCALLBACK_0200
     * @tc.name    : testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0200 start====");

          let result: number = animatendk.KeyframeRegisterOnEventCallback0200();
          console.info(`====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_REGISTERONEVENTCALLBACK_0300
     * @tc.name    : testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0300 start====");

          let result: number = animatendk.KeyframeRegisterOnEventCallback0300();
          console.info(`====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_KEYFRAMEANIMATEOPTION_REGISTERONEVENTCALLBACK_0400
     * @tc.name    : testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0400
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0400 start====");

          let result: number = animatendk.KeyframeRegisterOnEventCallback0400();
          console.info(`====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIKeyframeAnimateOptionRegisterOnEventCallback0400 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}