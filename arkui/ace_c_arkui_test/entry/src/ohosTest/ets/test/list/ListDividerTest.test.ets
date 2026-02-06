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

export default function listDividerTest() {

  describe('ListDividerTest', () => {

    /**
     * @tc.name   testListDivider001
     * @tc.number SUB_ARKUI_CAPI_LIST_DIVIDER_0001
     * @tc.desc   testing divider for list with {COLOR_YELLOW 1 1 1}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListDivider001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListDivider001()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListDivider002
     * @tc.number SUB_ARKUI_CAPI_LIST_DIVIDER_0002
     * @tc.desc   testing divider for list with {COLOR_YELLOW 0 0 0}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListDivider002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListDivider002()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListDivider003
     * @tc.number SUB_ARKUI_CAPI_LIST_DIVIDER_0003
     * @tc.desc   testing divider for list with {COLOR_YELLOW -1 -1 -1}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListDivider003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListDivider003()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListDivider004
     * @tc.number SUB_ARKUI_CAPI_LIST_DIVIDER_0004
     * @tc.desc   testing divider for list with {COLOR_YELLOW 1000 1000 1000}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListDivider004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListDivider004()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testListDivider005
     * @tc.number SUB_ARKUI_CAPI_LIST_DIVIDER_0005
     * @tc.desc   testing divider for list with resetAttribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListDivider005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListDivider005()).assertEqual(0)
      done()
    })
  })
}
