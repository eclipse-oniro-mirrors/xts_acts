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

import { beforeEach, expect, describe, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function gridColumnGapTest() {

  describe('GridColumnGapTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testGridColumnsGap001
     * @tc.number SUB_ARKUI_CAPI_GRID_COLUMNSGAP_0100
     * @tc.desc   testing ColumnGap for Grid with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGridColumnsGap001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridColumnsGap001()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testGridColumnsGap002
     * @tc.number SUB_ARKUI_CAPI_GRID_COLUMNSGAP_0200
     * @tc.desc   testing ColumnGap for Grid with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGridColumnsGap002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridColumnsGap002()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testGridColumnsGap003
     * @tc.number SUB_ARKUI_CAPI_GRID_COLUMNSGAP_0300
     * @tc.desc   testing ColumnGap for Grid with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGridColumnsGap003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridColumnsGap003()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testGridColumnsGap004
     * @tc.number SUB_ARKUI_CAPI_GRID_COLUMNSGAP_0400
     * @tc.desc   testing ColumnGap for Grid with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGridColumnsGap004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridColumnsGap004()).assertEqual(0)
      done();
    })

  })
}
