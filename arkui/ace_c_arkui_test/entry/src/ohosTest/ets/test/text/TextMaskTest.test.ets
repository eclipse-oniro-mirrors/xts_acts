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

export default function textMaskTest() {

  describe('TextMaskTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_MASK_0100
     * @tc.name       : testTextMask001
     * @tc.desc       : testing mask for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextMask001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextMask001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_MASK_0200
     * @tc.name       : testTextMask002
     * @tc.desc       : testing mask for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextMask002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextMask002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_MASK_0300
     * @tc.name       : testTextMask003
     * @tc.desc       : testing mask for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextMask003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextMask003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_MASK_0400
     * @tc.name       : testTextMask004
     * @tc.desc       : testing mask for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextMask004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextMask004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_MASK_0500
     * @tc.name       : testTextMask005
     * @tc.desc       : testing mask for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextMask005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextMask005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_MASK_0600
     * @tc.name       : testTextMask006
     * @tc.desc       : testing mask for text with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextMask006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextMask006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_MASK_0700
     * @tc.name       : testTextMask007
     * @tc.desc       : testing mask for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextMask007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextMask007()).assertEqual(0)
      done()
    })
  })
}
