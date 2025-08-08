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

export default function textEllipsisModeTest() {

  describe('TextEllipsisModeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0100
     * @tc.name       : testTextEllipsisMode001
     * @tc.desc       : testing ellipsis Mode for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEllipsisMode001', 0, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0200
     * @tc.name       : testTextEllipsisMode002
     * @tc.desc       : testing ellipsis Mode for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEllipsisMode002', 0, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0300
     * @tc.name       : testTextEllipsisMode003
     * @tc.desc       : testing ellipsis Mode for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEllipsisMode003', 0, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0400
     * @tc.name       : testTextEllipsisMode004
     * @tc.desc       : testing ellipsis Mode for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEllipsisMode004', 0, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0500
     * @tc.name       : testTextEllipsisMode005
     * @tc.desc       : testing ellipsis Mode for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEllipsisMode005', 0, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0600
     * @tc.name       : testTextEllipsisMode006
     * @tc.desc       : testing ellipsis Mode for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEllipsisMode006', 0, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0700
     * @tc.name       : testTextEllipsisMode007
     * @tc.desc       : testing ellipsis Mode for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextEllipsisMode007', 0, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode007()).assertEqual(0)
      done()
    })


  })
}