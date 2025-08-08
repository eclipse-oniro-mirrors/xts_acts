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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textInputTypeTest() {

  describe('TextInputTypeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TYPE_0100
     * @tc.name: testTextInputType001
     * @tc.desc: testing type for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputType001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputType001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TYPE_0200
     * @tc.name: testTextInputType002
     * @tc.desc: testing type for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputType002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputType002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TYPE_0300
     * @tc.name: testTextInputType003
     * @tc.desc: testing type for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputType003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputType003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TYPE_0400
     * @tc.name: testTextInputType004
     * @tc.desc: testing type for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputType004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputType004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TYPE_0500
     * @tc.name: testTextInputType005
     * @tc.desc: testing type for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputType005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputType005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TYPE_0600
     * @tc.name: testTextInputType006
     * @tc.desc: testing type for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputType006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputType006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TYPE_0700
     * @tc.name: testTextInputType007
     * @tc.desc: testing type for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputType007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputType007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TYPE_0800
     * @tc.name: testTextInputType008
     * @tc.desc: testing type for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputType008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputType008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TYPE_0900
     * @tc.name: testTextInputType009
     * @tc.desc: testing type for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputType009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputType009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TYPE_1000
     * @tc.name: testTextInputType010
     * @tc.desc: testing type for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputType010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputType010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_TYPE_1100
     * @tc.name: testTextInputType011
     * @tc.desc: testing type for textInput with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTextInputType011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputType011()).assertEqual(0)
      done()
    })

  })
}
