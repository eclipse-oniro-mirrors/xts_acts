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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textAreaPlaceholderFontTest() {

  describe('TextAreaPlaceholderFontTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextAreaPlaceholderFont001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_0100
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont002
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_0200
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont003
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_0300
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont004
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_0400
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont004()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont005
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_0500
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont005()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont006
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_0600
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont006()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont007
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_0700
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont007()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont008
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_0800
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont008()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont009
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_0900
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont009()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont010
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_1000
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont010()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont011
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_1100
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont011()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont012
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_1200
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont012()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont013
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_1300
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont013()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont014
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_1400
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont014()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont015
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_1500
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont015()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont016
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_1600
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont016()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont017
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_1700
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont017()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont018
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_1800
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont018()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont019
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_1900
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont019()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextAreaPlaceholderFont020
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_PLACEHOLDERFONT_2000
     * @tc.desc   testing PlaceHolderFont for textArea with enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaPlaceholderFont020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPlaceholderFont020()).assertEqual(0)
      done();
    });
  })
}
