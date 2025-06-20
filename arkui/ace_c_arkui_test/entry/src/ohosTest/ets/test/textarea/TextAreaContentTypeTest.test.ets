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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textAreaContentTypeTest() {

  describe('textAreaContentTypeTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0001
     * @tc.name: testTextAreaContentType001
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType001', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0002
     * @tc.name: testTextAreaContentType002
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType002', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType002()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0003
     * @tc.name: testTextAreaContentType003
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType003', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType003()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0004
     * @tc.name: testTextAreaContentType004
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType004', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType004()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0005
     * @tc.name: testTextAreaContentType005
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType005', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType005()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0006
     * @tc.name: testTextAreaContentType006
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType006', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType006()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0007
     * @tc.name: testTextAreaContentType007
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType007', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType007()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0008
     * @tc.name: testTextAreaContentType008
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType008', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType008()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0009
     * @tc.name: testTextAreaContentType009
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType009', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType009()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0010
     * @tc.name: testTextAreaContentType010
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType010', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType010()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0011
     * @tc.name: testTextAreaContentType011
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType011', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType011()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0012
     * @tc.name: testTextAreaContentType012
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType012', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType012()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0013
     * @tc.name: testTextAreaContentType013
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType013', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType013()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0014
     * @tc.name: testTextAreaContentType014
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType014', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType014()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0015
     * @tc.name: testTextAreaContentType015
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType015', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType015()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0016
     * @tc.name: testTextAreaContentType016
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType016', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType016()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0017
     * @tc.name: testTextAreaContentType017
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType017', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType017()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0018
     * @tc.name: testTextAreaContentType018
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType018', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType018()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0019
     * @tc.name: testTextAreaContentType019
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType019', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType019()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0020
     * @tc.name: testTextAreaContentType020
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType020', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType020()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0021
     * @tc.name: testTextAreaContentType021
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType021', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType021()).assertEqual(0)
      done();
    });   
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0022
     * @tc.name: testTextAreaContentType022
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType022', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType022()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0023
     * @tc.name: testTextAreaContentType023
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType023', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType023()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_CONTENT_TYPE_0024
     * @tc.name: testTextAreaContentType024
     * @tc.desc: testing text for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaContentType024', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaContentType024()).assertEqual(0)
      done();
    });
  })
}
