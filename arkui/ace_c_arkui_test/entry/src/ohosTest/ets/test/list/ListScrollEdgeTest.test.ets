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

export default function listScrollEdgeTest() {

  describe('ListScrollEdgeTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_EDGE_0001
     * @tc.name       : testListScrollEdge001
     * @tc.desc       : testing scroll edge for list with ARKUI_SCROLL_EDGE_TOP value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollEdge001', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollEdge001()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_EDGE_0002
     * @tc.name       : testListScrollEdge002
     * @tc.desc       : testing scroll edge for list with ARKUI_SCROLL_EDGE_BOTTOM value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollEdge002', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollEdge002()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_EDGE_0003
     * @tc.name       : testListScrollEdge003
     * @tc.desc       : testing scroll edge for list with ARKUI_SCROLL_EDGE_START value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollEdge003', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollEdge003()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_EDGE_0004
     * @tc.name       : testListScrollEdge004
     * @tc.desc       : testing scroll edge for list with ARKUI_SCROLL_EDGE_END value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollEdge004', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollEdge004()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_EDGE_0005
     * @tc.name       : testListScrollEdge005
     * @tc.desc       : testing scroll edge for list with -1 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollEdge005', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollEdge005()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_EDGE_0006
     * @tc.name       : testListScrollEdge006
     * @tc.desc       : testing scroll edge for list with 4 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollEdge006', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollEdge006()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_EDGE_0007
     * @tc.name       : testListScrollEdge007
     * @tc.desc       : testing scroll edge for list with resetAttribute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollEdge007', 0, async (done: Function) => {
      expect(nativeFunc.testListScrollEdge007()).assertEqual(0)
      done()
    })
  })
}
