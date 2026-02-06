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

export default function listNestedScrollTest() {

  describe('listNestedScrollTest', () => {

    /**
     * @tc.name   testListNestedScroll001
     * @tc.number SUB_ARKUI_CAPI_LIST_NESTED_SCROLL_0001
     * @tc.desc   testing nested scroll for list with ARKUI_SCROLL_NESTED_MODE_SELF_ONLY value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedScroll001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListNestedScroll001()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListNestedScroll002
     * @tc.number SUB_ARKUI_CAPI_LIST_NESTED_SCROLL_0002
     * @tc.desc   testing nested scroll for list with ARKUI_SCROLL_NESTED_MODE_SELF_FIRST value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedScroll002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListNestedScroll002()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListNestedScroll003
     * @tc.number SUB_ARKUI_CAPI_LIST_NESTED_SCROLL_0003
     * @tc.desc   testing nested scroll for list with ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedScroll003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListNestedScroll003()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListNestedScroll004
     * @tc.number SUB_ARKUI_CAPI_LIST_NESTED_SCROLL_0004
     * @tc.desc   testing nested scroll for list with ARKUI_SCROLL_NESTED_MODE_PARALLEL value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedScroll004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListNestedScroll004()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListNestedScroll005
     * @tc.number SUB_ARKUI_CAPI_LIST_NESTED_SCROLL_0005
     * @tc.desc   testing nested scroll for list with -1 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedScroll005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListNestedScroll005()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListNestedScroll006
     * @tc.number SUB_ARKUI_CAPI_LIST_NESTED_SCROLL_0006
     * @tc.desc   testing nested scroll for list with 4 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedScroll006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListNestedScroll006()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListNestedScroll007
     * @tc.number SUB_ARKUI_CAPI_LIST_NESTED_SCROLL_0007
     * @tc.desc   testing nested scroll for list with resetAttribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedScroll007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListNestedScroll007()).assertEqual(0)
      done()
    })
  })
}
