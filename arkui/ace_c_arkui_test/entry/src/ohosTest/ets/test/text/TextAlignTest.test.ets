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

export default function textAlignTest() {

  describe('TextAlignTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_0100
     * @tc.name       : testTextAlign001
     * @tc.desc       : testing align for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlign001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlign001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_0200
     * @tc.name       : testTextAlign002
     * @tc.desc       : testing align for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlign002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlign002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_0300
     * @tc.name       : testTextAlign003
     * @tc.desc       : testing align for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlign003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlign003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_0400
     * @tc.name       : testTextAlign004
     * @tc.desc       : testing align for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlign004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlign004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_0500
     * @tc.name       : testTextAlign005
     * @tc.desc       : testing align for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlign005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlign005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_0600
     * @tc.name       : testTextAlign006
     * @tc.desc       : testing align for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlign006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlign006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_0700
     * @tc.name       : testTextAlign007
     * @tc.desc       : testing align for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlign007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlign007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_0800
     * @tc.name       : testTextAlign008
     * @tc.desc       : testing align for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlign008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlign008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_0900
     * @tc.name       : testTextAlign009
     * @tc.desc       : testing align for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlign009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlign009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_1000
     * @tc.name       : testTextAlign010
     * @tc.desc       : testing align for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAlign010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAlign010()).assertEqual(0)
      done()
    })
  })
}
