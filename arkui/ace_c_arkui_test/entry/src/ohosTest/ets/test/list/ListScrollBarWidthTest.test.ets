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

export default function listScrollBarWidthTest() {

  describe('ListScrollBarWidthTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLLBAR_WIDTH_0001
     * @tc.name       : testListScrollBarWidth001
     * @tc.desc       : testing scrollbarwidth for list with 10 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBarWidth001', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollBarWidth001()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLLBAR_WIDTH_0002
     * @tc.name       : testListScrollBarWidth002
     * @tc.desc       : testing scrollbarwidth for list with 0 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBarWidth002', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollBarWidth002()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLLBAR_WIDTH_0003
     * @tc.name       : testListScrollBarWidth003
     * @tc.desc       : testing scrollbarwidth for list with -1 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBarWidth003', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollBarWidth003()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLLBAR_WIDTH_0004
     * @tc.name       : testListScrollBarWidth004
     * @tc.desc       : testing scrollbarwidth for list with 1000 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBarWidth004', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollBarWidth004()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLLBAR_WIDTH_0005
     * @tc.name       : testListScrollBarWidth005
     * @tc.desc       : testing scrollbarwidth for list with resetAttribute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBarWidth005', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollBarWidth005()).assertEqual(0)
      done()
    })
  })
}
