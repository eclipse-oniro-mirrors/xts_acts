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

export default function textInputEnterKeyTypeTest() {

  describe('TextInputEnterKeyTypeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextInputEnterKeyType001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0100
     * @tc.desc   testing enterKeyType for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputEnterKeyType001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputEnterKeyType002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0200
     * @tc.desc   testing enterKeyType for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputEnterKeyType002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputEnterKeyType003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0300
     * @tc.desc   testing enterKeyType for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputEnterKeyType003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputEnterKeyType004
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0400
     * @tc.desc   testing enterKeyType for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputEnterKeyType004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputEnterKeyType005
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0500
     * @tc.desc   testing enterKeyType for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputEnterKeyType005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputEnterKeyType006
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0600
     * @tc.desc   testing enterKeyType for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputEnterKeyType006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputEnterKeyType007
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0700
     * @tc.desc   testing enterKeyType for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputEnterKeyType007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextInputEnterKeyType008
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ENTERKEYTYPE_0800
     * @tc.desc   testing enterKeyType for textInput with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputEnterKeyType008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputEnterKeyType008()).assertEqual(0)
      done()
    })

  })
}
