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

export default function textInputContentTypeTest() {

  describe('textInputContentTypeTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testTextInputContentType001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0001
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType001()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType002
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0002
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType002()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType003
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0003
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType003()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType004
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0004
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType004()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType005
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0005
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType005()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType006
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0006
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType006()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType007
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0007
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType007()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType008
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0008
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType008()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType009
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0009
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType009()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType010
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0010
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType010()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType011
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0011
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType011()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType012
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0012
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType012()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType013
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0013
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType013()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType014
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0014
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType014()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType015
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0015
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType015()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType016
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0016
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType016()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType017
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0017
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType017()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType018
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0018
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType018()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType019
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0019
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType019()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType020
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0020
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType020()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType021
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0021
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType021()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType022
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0022
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType022()).assertEqual(0)
      done();
    });
    /**
     * @tc.name   testTextInputContentType023
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_CONTENT_TYPE_0023
     * @tc.desc   testing text for textInput with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputContentType023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextInputContentType023()).assertEqual(0)
      done();
    });
  })
}
