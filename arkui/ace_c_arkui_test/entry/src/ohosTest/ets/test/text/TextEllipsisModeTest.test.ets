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

export default function textEllipsisModeTest() {

  describe('TextEllipsisModeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextEllipsisMode001
     * @tc.number SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0100
     * @tc.desc   testing ellipsis Mode for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEllipsisMode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextEllipsisMode002
     * @tc.number SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0200
     * @tc.desc   testing ellipsis Mode for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEllipsisMode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextEllipsisMode003
     * @tc.number SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0300
     * @tc.desc   testing ellipsis Mode for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEllipsisMode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextEllipsisMode004
     * @tc.number SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0400
     * @tc.desc   testing ellipsis Mode for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEllipsisMode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextEllipsisMode005
     * @tc.number SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0500
     * @tc.desc   testing ellipsis Mode for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEllipsisMode005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextEllipsisMode006
     * @tc.number SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0600
     * @tc.desc   testing ellipsis Mode for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEllipsisMode006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextEllipsisMode007
     * @tc.number SUB_ARKUI_CAPI_TEXT_ELLIPSIS_MODE_0700
     * @tc.desc   testing ellipsis Mode for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextEllipsisMode007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextEllipsisMode007()).assertEqual(0)
      done()
    })


  })
}