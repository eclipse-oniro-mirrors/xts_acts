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
import animatendk from 'libanimatendk.so'
import Utils from '../common/Utils'

const ARKUI_ERROR_CODE_NO_ERROR = 0
const ARKUI_ERROR_CODE_PARAM_INVALID = 401

export default function AnimatorTest() {
  describe('AnimatorTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`AnimatorTest/AnimatorTest`, done);
    });
    /**
     * @tc.name   testOHArkUIAnimatorResetAnimatorOption0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_RESETANIMATOROPTION_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorResetAnimatorOption0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorResetAnimatorOption0100 start====");

          let result: number = animatendk.AnimatorResetAnimatorOption0100();
          console.info(`====>testOHArkUIAnimatorResetAnimatorOption0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorResetAnimatorOption0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorResetAnimatorOption0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_RESETANIMATOROPTION_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorResetAnimatorOption0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorResetAnimatorOption0200 start====");

          let result: number = animatendk.AnimatorResetAnimatorOption0200();
          console.info(`====>testOHArkUIAnimatorResetAnimatorOption0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorResetAnimatorOption0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorResetAnimatorOption0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_RESETANIMATOROPTION_0300
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorResetAnimatorOption0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorResetAnimatorOption0300 start====");

          let result: number = animatendk.AnimatorResetAnimatorOption0300();
          console.info(`====>testOHArkUIAnimatorResetAnimatorOption0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorResetAnimatorOption0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorPlay0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_PLAY_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorPlay0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorPlay0100 start====");

          let result: number = animatendk.AnimatorPlay0100();
          console.info(`====>testOHArkUIAnimatorPlay0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorPlay0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorPlay0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_PLAY_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorPlay0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorPlay0200 start====");

          let result: number = animatendk.AnimatorResetAnimatorOption0200();
          console.info(`====>testOHArkUIAnimatorPlay0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorPlay0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorFinish0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_FINISH_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorFinish0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorFinish0100 start====");

          let result: number = animatendk.AnimatorFinish0100();
          console.info(`====>testOHArkUIAnimatorFinish0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorFinish0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorFinish0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_FINISH_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorFinish0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorFinish0200 start====");

          let result: number = animatendk.AnimatorFinish0200();
          console.info(`====>testOHArkUIAnimatorFinish0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorFinish0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorPause0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_PAUSE_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorPause0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorPause0100 start====");

          let result: number = animatendk.AnimatorPause0100();
          console.info(`====>testOHArkUIAnimatorPause0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorPause0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorPause0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_PAUSE_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorPause0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorPause0200 start====");

          let result: number = animatendk.AnimatorPause0200();
          console.info(`====>testOHArkUIAnimatorPause0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorPause0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorCancel0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_CANCEL_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorCancel0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorCancel0100 start====");

          let result: number = animatendk.AnimatorCancel0100();
          console.info(`====>testOHArkUIAnimatorCancel0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorCancel0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorCancel0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_CANCEL_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorCancel0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorCancel0200 start====");

          let result: number = animatendk.AnimatorCancel0200();
          console.info(`====>testOHArkUIAnimatorCancel0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorCancel0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorReverse0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_REVERSE_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorReverse0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorReverse0100 start====");

          let result: number = animatendk.AnimatorReverse0100();
          console.info(`====>testOHArkUIAnimatorReverse0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorReverse0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorReverse0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOR_REVERSE_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorReverse0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorReverse0200 start====");

          let result: number = animatendk.AnimatorReverse0200();
          console.info(`====>testOHArkUIAnimatorReverse0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorReverse0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUITransitionEffectCombine0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_TRANSITIONEFFECT_COMBINE_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUITransitionEffectCombine0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUITransitionEffectCombine0100 start====");

          let result: number = animatendk.TransitionEffectCombine0100();
          console.info(`====>testOHArkUITransitionEffectCombine0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUITransitionEffectCombine0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUITransitionEffectCombine0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_TRANSITIONEFFECT_COMBINE_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUITransitionEffectCombine0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUITransitionEffectCombine0200 start====");

          let result: number = animatendk.TransitionEffectCombine0200();
          console.info(`====>testOHArkUITransitionEffectCombine0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUITransitionEffectCombine0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUITransitionEffectSetAnimation0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_TRANSITIONEFFECT_SETANIMATION_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUITransitionEffectSetAnimation0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUITransitionEffectSetAnimation0100 start====");

          let result: number = animatendk.TransitionEffectSetAnimation0100();
          console.info(`====>testOHArkUITransitionEffectSetAnimation0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUITransitionEffectSetAnimation0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUITransitionEffectSetAnimation0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_TRANSITIONEFFECT_SETANIMATION_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUITransitionEffectSetAnimation0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUITransitionEffectSetAnimation0200 start====");

          let result: number = animatendk.TransitionEffectSetAnimation0200();
          console.info(`====>testOHArkUITransitionEffectSetAnimation0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUITransitionEffectSetAnimation0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testDisposeAnimator0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPOSEANIMATOR_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDisposeAnimator0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testDisposeAnimator0100 start====");
          let result: number = animatendk.disposeAnimator0100();
          console.info(`====>testDisposeAnimator0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testDisposeAnimator0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}