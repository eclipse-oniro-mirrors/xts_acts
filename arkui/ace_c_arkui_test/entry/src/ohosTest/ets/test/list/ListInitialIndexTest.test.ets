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

export default function listInitialIndexTest() {

  describe('ListInitialIndexTest', () => {

    /**
     * @tc.name   testListInitialIndex001
     * @tc.number SUB_ARKUI_CAPI_LIST_INITIAL_INDEX_0001
     * @tc.desc   testing index for list with 0 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListInitialIndex001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListInitialIndex001()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListInitialIndex002
     * @tc.number SUB_ARKUI_CAPI_LIST_INITIAL_INDEX_0002
     * @tc.desc   testing index for list with -1 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListInitialIndex002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListInitialIndex002()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListInitialIndex003
     * @tc.number SUB_ARKUI_CAPI_LIST_INITIAL_INDEX_0003
     * @tc.desc   testing index for list with 5 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListInitialIndex003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListInitialIndex003()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListInitialIndex004
     * @tc.number SUB_ARKUI_CAPI_LIST_INITIAL_INDEX_0004
     * @tc.desc   testing index for list with 1000 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListInitialIndex004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListInitialIndex004()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListInitialIndex005
     * @tc.number SUB_ARKUI_CAPI_LIST_INITIAL_INDEX_0005
     * @tc.desc   testing index for list with resetAttribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListInitialIndex005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListInitialIndex005()).assertEqual(0)
      done()
    })

  })
}
