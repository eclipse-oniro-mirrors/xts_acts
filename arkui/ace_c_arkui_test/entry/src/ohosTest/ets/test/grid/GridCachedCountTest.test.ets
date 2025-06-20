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

export default function gridCachedCountTest() {

  describe('GridCachedCountTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_CACHEDCOUNT_0100
     * @tc.name       : testGridCachedCount001
     * @tc.desc       : testing cachedCount for grid with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridCachedCount001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridCachedCount001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_CACHEDCOUNT_0200
     * @tc.name       : testGridCachedCount002
     * @tc.desc       : testing cachedCount for grid with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridCachedCount002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridCachedCount002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_CACHEDCOUNT_0300
     * @tc.name       : testGridCachedCount003
     * @tc.desc       : testing cachedCount for grid with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridCachedCount003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridCachedCount003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_CACHEDCOUNT_0400
     * @tc.name       : testGridCachedCount004
     * @tc.desc       : testing cachedCount for grid with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridCachedCount004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridCachedCount004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_CACHEDCOUNT_0500
     * @tc.name       : testGridCachedCount005
     * @tc.desc       : testing cachedCount for grid with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridCachedCount005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridCachedCount005()).assertEqual(0)
      done()
    })
  })
}
