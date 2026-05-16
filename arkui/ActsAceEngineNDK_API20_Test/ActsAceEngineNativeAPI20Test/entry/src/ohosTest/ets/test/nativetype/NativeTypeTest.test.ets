/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from '@ohos/hypium'
import libnativetype from 'libnativetype.so'
import Utils from '../common/Utils';

const OS_ACCOUNT_ERR_INVALID_PARAMETER = 12300002;
const ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH = 180002;

export default function NativeTypeTest() {
  describe('NativeTypeTest', () => {
    /**
     * @tc.name   testArkUIACERotationOption0100
     * @tc.number SUB_ArkUI_ACE_RotationOption_0100
     * @tc.desc   testing ArkUI_RotationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACERotationOption0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_RotationOption_0100 start====");
          let result: number = libnativetype.CheckRotationOptionX();
          console.info("====>SUB_ArkUI_ACE_RotationOption_0100 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_RotationOption_0100 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACERotationOption0200
     * @tc.number SUB_ArkUI_ACE_RotationOption_0200
     * @tc.desc   testing ArkUI_RotationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACERotationOption0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_RotationOption_0200 start====");
          let result: number = libnativetype.CheckRotationOptionY();
          console.info("====>SUB_ArkUI_ACE_RotationOption_0200 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_RotationOption_0200 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACERotationOption0300
     * @tc.number SUB_ArkUI_ACE_RotationOption_0300
     * @tc.desc   testing ArkUI_RotationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACERotationOption0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_RotationOption_0300 start====");
          let result: number = libnativetype.CheckRotationOptionZ();
          console.info("====>SUB_ArkUI_ACE_RotationOption_0300 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_RotationOption_0300 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACERotationOption0400
     * @tc.number SUB_ArkUI_ACE_RotationOption_0400
     * @tc.desc   testing ArkUI_RotationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACERotationOption0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_RotationOption_0400 start====");
          let result: number = libnativetype.CheckRotationOptionAngle();
          console.info("====>SUB_ArkUI_ACE_RotationOption_0400 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_RotationOption_0400 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACERotationOption0500
     * @tc.number SUB_ArkUI_ACE_RotationOption_0500
     * @tc.desc   testing ArkUI_RotationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACERotationOption0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_RotationOption_0500 start====");
          let result: number = libnativetype.CheckRotationOptionCenterX();
          console.info("====>SUB_ArkUI_ACE_RotationOption_0500 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_RotationOption_0500 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACERotationOption0600
     * @tc.number SUB_ArkUI_ACE_RotationOption_0600
     * @tc.desc   testing ArkUI_RotationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACERotationOption0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_RotationOption_0600 start====");
          let result: number = libnativetype.CheckRotationOptionCenterY();
          console.info("====>SUB_ArkUI_ACE_RotationOption_0600 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_RotationOption_0600 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACERotationOption0700
     * @tc.number SUB_ArkUI_ACE_RotationOption_0700
     * @tc.desc   testing ArkUI_RotationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACERotationOption0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_RotationOption_0700 start====");
          let result: number = libnativetype.CheckRotationOptionCenterZ();
          console.info("====>SUB_ArkUI_ACE_RotationOption_0700 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_RotationOption_0700 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACERotationOption0800
     * @tc.number SUB_ArkUI_ACE_RotationOption_0800
     * @tc.desc   testing ArkUI_RotationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACERotationOption0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_RotationOption_0800 start====");
          let result: number = libnativetype.CheckRotationOptionPerspective();
          console.info("====>SUB_ArkUI_ACE_RotationOption_0800 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_RotationOption_0800 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACEScaleOptions0100
     * @tc.number SUB_ArkUI_ACE_ScaleOptions_0100
     * @tc.desc   testing ArkUI_ScaleOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEScaleOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_ScaleOptions_0100 start====");
          let result: number = libnativetype.CheckScaleOptionsX();
          console.info("====>SUB_ArkUI_ACE_ScaleOptions_0100 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_ScaleOptions_0100 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACEScaleOptions0200
     * @tc.number SUB_ArkUI_ACE_ScaleOptions_0200
     * @tc.desc   testing ArkUI_ScaleOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEScaleOptions0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_ScaleOptions_0200 start====");
          let result: number = libnativetype.CheckScaleOptionsY();
          console.info("====>SUB_ArkUI_ACE_ScaleOptions_0200 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_ScaleOptions_0200 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACEScaleOptions0300
     * @tc.number SUB_ArkUI_ACE_ScaleOptions_0300
     * @tc.desc   testing ArkUI_ScaleOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEScaleOptions0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_ScaleOptions_0300 start====");
          let result: number = libnativetype.CheckScaleOptionsZ();
          console.info("====>SUB_ArkUI_ACE_ScaleOptions_0300 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_ScaleOptions_0300 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACEScaleOptions0400
     * @tc.number SUB_ArkUI_ACE_ScaleOptions_0400
     * @tc.desc   testing ArkUI_ScaleOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEScaleOptions0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_ScaleOptions_0400 start====");
          let result: number = libnativetype.CheckScaleOptionsCenterX();
          console.info("====>SUB_ArkUI_ACE_ScaleOptions_0400 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_ScaleOptions_0400 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACEScaleOptions0500
     * @tc.number SUB_ArkUI_ACE_ScaleOptions_0500
     * @tc.desc   testing ArkUI_ScaleOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEScaleOptions0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_ScaleOptions_0500 start====");
          let result: number = libnativetype.CheckScaleOptionsCenterY();
          console.info("====>SUB_ArkUI_ACE_ScaleOptions_0500 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_ScaleOptions_0500 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACETranslationOptions0100
     * @tc.number SUB_ArkUI_ACE_TranslationOptions_0100
     * @tc.desc   testing ArkUI_TranslationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACETranslationOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_TranslationOptions_0100 start====");
          let result: number = libnativetype.CheckTranslationOptionsX();
          console.info("====>SUB_ArkUI_ACE_TranslationOptions_0100 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_TranslationOptions_0100 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACETranslationOptions0200
     * @tc.number SUB_ArkUI_ACE_TranslationOptions_0200
     * @tc.desc   testing ArkUI_TranslationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACETranslationOptions0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_TranslationOptions_0200 start====");
          let result: number = libnativetype.CheckTranslationOptionsY();
          console.info("====>SUB_ArkUI_ACE_TranslationOptions_0200 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_TranslationOptions_0200 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACETranslationOptions0300
     * @tc.number SUB_ArkUI_ACE_TranslationOptions_0300
     * @tc.desc   testing ArkUI_TranslationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACETranslationOptions0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_TranslationOptions_0300 start====");
          let result: number = libnativetype.CheckTranslationOptionsZ();
          console.info("====>SUB_ArkUI_ACE_TranslationOptions_0300 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_TranslationOptions_0300 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.name   testArkUIACEGetCheckedState0100
     * @tc.number SUB_ArkUI_ACE_GetCheckedState_0100
     * @tc.desc   testing ArkUI_TranslationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEGetCheckedState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_GetCheckedState_0100 start====");
          await Utils.sleep(500);
          let result: number = libnativetype.GetCheckedState();
          console.info("====>SUB_ArkUI_ACE_GetCheckedState_0100 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_GetCheckedState_0100 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        }
      })
    /**
     * @tc.name   testArkUIACEGetCheckedState0200
     * @tc.number SUB_ArkUI_ACE_GetCheckedState_0200
     * @tc.desc   testing ArkUI_RotationOptions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEGetCheckedState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_GetCheckedState_0200 start====");
          await Utils.sleep(500);
          let result: number = libnativetype.GetUnCheckedState();
          console.info("====>SUB_ArkUI_ACE_GetCheckedState_0200 result: " + result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_GetCheckedState_0200 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        }
      })
  })
}
