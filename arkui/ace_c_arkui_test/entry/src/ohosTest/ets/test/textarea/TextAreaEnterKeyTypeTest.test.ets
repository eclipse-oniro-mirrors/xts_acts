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

export default function textAreaEnterKeyTypeTest() {

  describe('textAreaEnterKeyTypeTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENTER_KEY_TYPE_0001
     * @tc.name: testTextAreaEnterKeyType001
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnterKeyType001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnterKeyType001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENTER_KEY_TYPE_0002
     * @tc.name: testTextAreaEnterKeyType002
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnterKeyType002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnterKeyType002()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENTER_KEY_TYPE_0003
     * @tc.name: testTextAreaEnterKeyType003
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnterKeyType003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnterKeyType003()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENTER_KEY_TYPE_0004
     * @tc.name: testTextAreaEnterKeyType004
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnterKeyType004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnterKeyType004()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENTER_KEY_TYPE_0005
     * @tc.name: testTextAreaEnterKeyType005
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnterKeyType005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnterKeyType005()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENTER_KEY_TYPE_0006
     * @tc.name: testTextAreaEnterKeyType006
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnterKeyType006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnterKeyType006()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENTER_KEY_TYPE_0007
     * @tc.name: testTextAreaEnterKeyType007
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnterKeyType007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnterKeyType007()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENTER_KEY_TYPE_0008
     * @tc.name: testTextAreaEnterKeyType008
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnterKeyType008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnterKeyType008()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENTER_KEY_TYPE_0009
     * @tc.name: testTextAreaEnterKeyType009
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnterKeyType009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnterKeyType009()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ENTER_KEY_TYPE_0010
     * @tc.name: testTextAreaEnterKeyType010
     * @tc.desc: testing text for textInput with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaEnterKeyType010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaEnterKeyType010()).assertEqual(0)
      done();
    });
  })
}
