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

export default function gridRowsGapTest() {

  describe('GridRowsGapTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_ROWSGAP_0100
     * @tc.name       : testGridRowsGap001
     * @tc.desc       : testing RowsGap for Grid with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridRowsGap001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridRowsGap001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_ROWSGAP_0200
     * @tc.name       : testGridRowsGap002
     * @tc.desc       : testing RowsGap for Grid with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridRowsGap002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridRowsGap002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_ROWSGAP_0300
     * @tc.name       : testGridRowsGap003
     * @tc.desc       : testing RowsGap for Grid with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridRowsGap003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridRowsGap003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_ROWSGAP_0400
     * @tc.name       : testGridRowsGap004
     * @tc.desc       : testing RowsGap for Grid with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridRowsGap004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridRowsGap004()).assertEqual(0)
      done();
    })

  })
}
