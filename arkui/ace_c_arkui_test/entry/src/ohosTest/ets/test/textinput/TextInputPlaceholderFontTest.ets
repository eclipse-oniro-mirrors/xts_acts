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

export default function textInputPlaceholderFontTest() {

  describe('TextInputPlaceholderFontTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_0100
     * @tc.name: testTextInputPlaceholderFont001
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_0200
     * @tc.name: testTextInputPlaceholderFont002
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_0300
     * @tc.name: testTextInputPlaceholderFont003
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont003()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_0400
     * @tc.name: testTextInputPlaceholderFont004
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont004()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_0500
     * @tc.name: testTextInputPlaceholderFont005
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont005()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_0600
     * @tc.name: testTextInputPlaceholderFont006
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont006()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_0700
     * @tc.name: testTextInputPlaceholderFont007
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont007()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_0800
     * @tc.name: testTextInputPlaceholderFont008
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont008()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_0900
     * @tc.name: testTextInputPlaceholderFont009
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont009()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_1000
     * @tc.name: testTextInputPlaceholderFont010
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont010()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_1100
     * @tc.name: testTextInputPlaceholderFont011
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont011()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_1200
     * @tc.name: testTextInputPlaceholderFont012
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont012()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_1300
     * @tc.name: testTextInputPlaceholderFont013
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont013()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_1400
     * @tc.name: testTextInputPlaceholderFont014
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont014()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_1500
     * @tc.name: testTextInputPlaceholderFont015
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont015()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_1600
     * @tc.name: testTextInputPlaceholderFont016
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont016()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_1700
     * @tc.name: testTextInputPlaceholderFont017
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont017()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_1800
     * @tc.name: testTextInputPlaceholderFont018
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont018()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_1900
     * @tc.name: testTextInputPlaceholderFont019
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont019()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_PLACEHOLDERFONT_2000
     * @tc.name: testTextInputPlaceholderFont020
     * @tc.desc: testing PlaceHolderFont for textInput with enum value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputPlaceholderFont020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputPlaceholderFont020()).assertEqual(0)
      done();
    });
  })
}
