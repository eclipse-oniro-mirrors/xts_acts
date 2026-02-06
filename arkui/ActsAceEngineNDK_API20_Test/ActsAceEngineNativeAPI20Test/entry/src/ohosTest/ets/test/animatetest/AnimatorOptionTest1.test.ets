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

export default function AnimatorOptionTest1() {
  describe('AnimatorOptionTest1', () => {

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetDuration0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETDURATION_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetDuration0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetDuration0100 start====");

          let result: number = animatendk.AnimatorOptionSetDuration0100();
          console.info(`====>testOHArkUIAnimatorOptionSetDuration0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetDuration0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetDuration0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETDURATION_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetDuration0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetDuration0200 start====");

          let result: number = animatendk.AnimatorOptionSetDuration0200();
          console.info(`====>testOHArkUIAnimatorOptionSetDuration0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetDuration0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetDuration0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETDURATION_0300
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetDuration0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetDuration0300 start====");

          let result: number = animatendk.AnimatorOptionSetDuration0300();
          console.info(`====>testOHArkUIAnimatorOptionSetDuration0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetDuration0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetDelay0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETDELAY_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetDelay0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetDelay0100 start====");

          let result: number = animatendk.AnimatorOptionSetDelay0100();
          console.info(`====>testOHArkUIAnimatorOptionSetDelay0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetDelay0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetDelay0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETDELAY_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetDelay0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetDelay0200 start====");

          let result: number = animatendk.AnimatorOptionSetDelay0200();
          console.info(`====>testOHArkUIAnimatorOptionSetDelay0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetDelay0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetIterations0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETITERATIONS_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetIterations0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetIterations0100 start====");

          let result: number = animatendk.AnimatorOptionSetIterations0100();
          console.info(`====>testOHArkUIAnimatorOptionSetIterations0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetIterations0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetIterations0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETITERATIONS_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetIterations0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetIterations0200 start====");

          let result: number = animatendk.AnimatorOptionSetIterations0200();
          console.info(`====>testOHArkUIAnimatorOptionSetIterations0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetIterations0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetIterations0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETITERATIONS_0300
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetIterations0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetIterations0300 start====");

          let result: number = animatendk.AnimatorOptionSetIterations0300();
          console.info(`====>testOHArkUIAnimatorOptionSetIterations0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetIterations0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetFill0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETFILL_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetFill0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetFill0100 start====");

          let result: number = animatendk.AnimatorOptionSetFill0100();
          console.info(`====>testOHArkUIAnimatorOptionSetFill0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetFill0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetFill0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETFILL_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetFill0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetFill0200 start====");

          let result: number = animatendk.AnimatorOptionSetFill0200();
          console.info(`====>testOHArkUIAnimatorOptionSetFill0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetFill0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetFill0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETFILL_0300
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetFill0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetFill0300 start====");

          let result: number = animatendk.AnimatorOptionSetFill0300();
          console.info(`====>testOHArkUIAnimatorOptionSetFill0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetFill0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetFill0400
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETFILL_0400
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetFill0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetFill0400 start====");

          let result: number = animatendk.AnimatorOptionSetFill0400();
          console.info(`====>testOHArkUIAnimatorOptionSetFill0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetFill0400 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetDirection0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETDIRECTION_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetDirection0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetDirection0100 start====");

          let result: number = animatendk.AnimatorOptionSetDirection0100();
          console.info(`====>testOHArkUIAnimatorOptionSetDirection0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetDirection0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetDirection0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETDIRECTION_0200
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetDirection0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetDirection0200 start====");

          let result: number = animatendk.AnimatorOptionSetDirection0200();
          console.info(`====>testOHArkUIAnimatorOptionSetDirection0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetDirection0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAnimatorOptionSetDirection0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ANIMATOROPTION_SETDIRECTION_0300
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAnimatorOptionSetDirection0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAnimatorOptionSetDirection0300 start====");

          let result: number = animatendk.AnimatorOptionSetDirection0300();
          console.info(`====>testOHArkUIAnimatorOptionSetDirection0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_PARAM_INVALID);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAnimatorOptionSetDirection0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}