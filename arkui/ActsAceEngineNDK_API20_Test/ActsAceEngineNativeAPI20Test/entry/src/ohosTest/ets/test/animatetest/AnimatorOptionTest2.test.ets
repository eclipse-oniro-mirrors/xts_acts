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

export default function AnimatorOptionTest2() {
  describe('AnimatorOptionTest2', () => {

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETCURVE_0100
     * @tc.name    : testOHArkUIAnimatorOptionSetCurve0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetCurve0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetCurve0100 start====");

          let result: number = animatendk.AnimatorOptionSetCurve0100();
          console.info(`====>testOHArkUIAnimatorOptionSetCurve0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetCurve0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETCURVE_0200
     * @tc.name    : testOHArkUIAnimatorOptionSetCurve0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetCurve0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetCurve0200 start====");

          let result: number = animatendk.AnimatorOptionSetCurve0200();
          console.info(`====>testOHArkUIAnimatorOptionSetCurve0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetCurve0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETBEGIN_0100
     * @tc.name    : testOHArkUIAnimatorOptionSetBegin0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetBegin0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetBegin0100 start====");

          let result: number = animatendk.AnimatorOptionSetBegin0100();
          console.info(`====>testOHArkUIAnimatorOptionSetBegin0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetBegin0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETBEGIN_0200
     * @tc.name    : testOHArkUIAnimatorOptionSetBegin0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetBegin0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetBegin0200 start====");

          let result: number = animatendk.AnimatorOptionSetBegin0200();
          console.info(`====>testOHArkUIAnimatorOptionSetBegin0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetBegin0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETEND_0100
     * @tc.name    : testOHArkUIAnimatorOptionSetEnd0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetEnd0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetEnd0100 start====");

          let result: number = animatendk.AnimatorOptionSetEnd0100();
          console.info(`====>testOHArkUIAnimatorOptionSetEnd0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetEnd0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETEND_0200
     * @tc.name    : testOHArkUIAnimatorOptionSetEnd0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetEnd0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetEnd0200 start====");

          let result: number = animatendk.AnimatorOptionSetEnd0200();
          console.info(`====>testOHArkUIAnimatorOptionSetEnd0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetEnd0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETEXPECTEDFRAMERATERANGE_0100
     * @tc.name    : testOHArkUIAnimatorOptionSetExpectedFrameRateRange0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetExpectedFrameRateRange0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetExpectedFrameRateRange0100 start====");

          let result: number = animatendk.AnimatorOptionSetExpectedFrameRateRange0100();
          console.info(`====>testOHArkUIAnimatorOptionSetExpectedFrameRateRange0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetExpectedFrameRateRange0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETEXPECTEDFRAMERATERANGE_0200
     * @tc.name    : testOHArkUIAnimatorOptionSetExpectedFrameRateRange0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetExpectedFrameRateRange0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetExpectedFrameRateRange0200 start====");

          let result: number = animatendk.AnimatorOptionSetExpectedFrameRateRange0200();
          console.info(`====>testOHArkUIAnimatorOptionSetExpectedFrameRateRange0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetExpectedFrameRateRange0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETEXPECTEDFRAMERATERANGE_0300
     * @tc.name    : testOHArkUIAnimatorOptionSetExpectedFrameRateRange0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetExpectedFrameRateRange0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetExpectedFrameRateRange0300 start====");

          let result: number = animatendk.AnimatorOptionSetExpectedFrameRateRange0300();
          console.info(`====>testOHArkUIAnimatorOptionSetExpectedFrameRateRange0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetExpectedFrameRateRange0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETKEYFRAME_0100
     * @tc.name    : testOHArkUIAnimatorOptionSetKeyframe0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetKeyframe0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetKeyframe0100 start====");

          let result: number = animatendk.AnimatorOptionSetKeyframe0100();
          console.info(`====>testOHArkUIAnimatorOptionSetKeyframe0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetKeyframe0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETKEYFRAME_0200
     * @tc.name    : testOHArkUIAnimatorOptionSetKeyframe0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetKeyframe0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetKeyframe0200 start====");

          let result: number = animatendk.AnimatorOptionSetKeyframe0200();
          console.info(`====>testOHArkUIAnimatorOptionSetKeyframe0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetKeyframe0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETKEYFRAME_0300
     * @tc.name    : testOHArkUIAnimatorOptionSetKeyframe0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetKeyframe0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetKeyframe0300 start====");

          let result: number = animatendk.AnimatorOptionSetKeyframe0300();
          console.info(`====>testOHArkUIAnimatorOptionSetKeyframe0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetKeyframe0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETKEYFRAME_0400
     * @tc.name    : testOHArkUIAnimatorOptionSetKeyframe0400
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetKeyframe0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetKeyframe0400 start====");

          let result: number = animatendk.AnimatorOptionSetKeyframe0400();
          console.info(`====>testOHArkUIAnimatorOptionSetKeyframe0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetKeyframe0400 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

   /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETKEYFRAME_0500
     * @tc.name    : testOHArkUIAnimatorOptionSetKeyframe0500
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetKeyframe0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetKeyframe0500 start====");

          let result: number = animatendk.AnimatorOptionSetKeyframe0500();
          console.info(`====>testOHArkUIAnimatorOptionSetKeyframe0500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetKeyframe0500 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETKEYFRAMECURVE_0100
     * @tc.name    : testOHArkUIAnimatorOptionSetKeyframeCurve0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetKeyframeCurve0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetKeyframeCurve0100 start====");

          let result: number = animatendk.AnimatorOptionSetKeyframeCurve0100();
          console.info(`====>testOHArkUIAnimatorOptionSetKeyframeCurve0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetKeyframeCurve0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETKEYFRAMECURVE_0200
     * @tc.name    : testOHArkUIAnimatorOptionSetKeyframeCurve0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetKeyframeCurve0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetKeyframeCurve0200 start====");

          let result: number = animatendk.AnimatorOptionSetKeyframeCurve0200();
          console.info(`====>testOHArkUIAnimatorOptionSetKeyframeCurve0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetKeyframeCurve0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETKEYFRAMECURVE_0300
     * @tc.name    : testOHArkUIAnimatorOptionSetKeyframeCurve0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetKeyframeCurve0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetKeyframeCurve0300 start====");

          let result: number = animatendk.AnimatorOptionSetKeyframeCurve0300();
          console.info(`====>testOHArkUIAnimatorOptionSetKeyframeCurve0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetKeyframeCurve0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETKEYFRAMECURVE_0400
     * @tc.name    : testOHArkUIAnimatorOptionSetKeyframeCurve0400
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionSetKeyframeCurve0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetKeyframeCurve0400 start====");

          let result: number = animatendk.AnimatorOptionSetKeyframeCurve0400();
          console.info(`====>testOHArkUIAnimatorOptionSetKeyframeCurve0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetKeyframeCurve0400 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONFRAMECALLBACK_0100
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnFrameCallback0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnFrameCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnFrameCallback0100 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnFrameCallback0100();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnFrameCallback0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnFrameCallback0100 catch err: " + err);
          expect(false).assertEqual(0);
          done()
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONFRAMECALLBACK_0200
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnFrameCallback0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnFrameCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnFrameCallback0200 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnFrameCallback0200();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnFrameCallback0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnFrameCallback0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONFRAMECALLBACK_0300
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnFrameCallback0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnFrameCallback0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnFrameCallback0300 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnFrameCallback0300();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnFrameCallback0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnFrameCallback0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONFINISHCALLBACK_0100
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnFinishCallback0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnFinishCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnFinishCallback0100 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnFinishCallback0100();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnFinishCallback0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnFinishCallback0100 catch err: " + err);
          expect(false).assertEqual(0);
          done()
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONFINISHCALLBACK_0200
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnFinishCallback0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnFinishCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnFinishCallback0200 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnFinishCallback0200();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnFinishCallback0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnFinishCallback0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONFINISHCALLBACK_0300
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnFinishCallback0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnFinishCallback0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnFinishCallback0300 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnFinishCallback0300();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnFinishCallback0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnFinishCallback0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONCANCELCALLBACK_0100
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnCancelCallback0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnCancelCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnCancelCallback0100 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnCancelCallback0100();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnCancelCallback0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnCancelCallback0100 catch err: " + err);
          expect(false).assertEqual(0);
          done()
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONCANCELCALLBACK_0200
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnCancelCallback0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnCancelCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnCancelCallback0200 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnCancelCallback0200();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnCancelCallback0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnCancelCallback0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONCANCELCALLBACK_0300
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnCancelCallback0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnCancelCallback0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnCancelCallback0300 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnCancelCallback0300();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnCancelCallback0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnCancelCallback0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONREPEATCALLBACK_0100
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnRepeatCallback0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnRepeatCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnRepeatCallback0100 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnRepeatCallback0100();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnRepeatCallback0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnRepeatCallback0100 catch err: " + err);
          expect(false).assertEqual(0);
          done()
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONREPEATCALLBACK_0200
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnRepeatCallback0200
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnRepeatCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnRepeatCallback0200 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnRepeatCallback0200();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnRepeatCallback0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnRepeatCallback0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_REGISTERONREPEATCALLBACK_0300
     * @tc.name    : testOHArkUIAnimatorOptionRegisterOnRepeatCallback0300
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAnimatorOptionRegisterOnRepeatCallback0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionRegisterOnRepeatCallback0300 start====");

          let result: number = animatendk.AnimatorOptionRegisterOnRepeatCallback0300();
          console.info(`====>testOHArkUIAnimatorOptionRegisterOnRepeatCallback0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionRegisterOnRepeatCallback0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })



  })
}