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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textInputEnterKeyTypeTest() {

  describe('TextInputEnterKeyTypeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0100
     * @tc.name: testTextInputEnterKeyType001
     * @tc.desc: testing enterKeyType for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnterKeyType001', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0200
     * @tc.name: testTextInputEnterKeyType002
     * @tc.desc: testing enterKeyType for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnterKeyType002', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0300
     * @tc.name: testTextInputEnterKeyType003
     * @tc.desc: testing enterKeyType for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnterKeyType003', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0400
     * @tc.name: testTextInputEnterKeyType004
     * @tc.desc: testing enterKeyType for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnterKeyType004', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0500
     * @tc.name: testTextInputEnterKeyType005
     * @tc.desc: testing enterKeyType for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnterKeyType005', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0600
     * @tc.name: testTextInputEnterKeyType006
     * @tc.desc: testing enterKeyType for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnterKeyType006', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0700
     * @tc.name: testTextInputEnterKeyType007
     * @tc.desc: testing enterKeyType for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextInputEnterKeyType007', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0800
     * @tc.name: testTextInputEnterKeyType008
     * @tc.desc: testing enterKeyType for textInput with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTextInputEnterKeyType008', 0, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType008()).assertEqual(0)
      done()
    })

  })
}
