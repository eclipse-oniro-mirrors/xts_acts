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

export default function listStickyTest() {

  describe('ListStickyTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_STICKY_0100
     * @tc.name       : testListSticky001
     * @tc.desc       : testing sticky for list with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSticky001', 0, async (done: Function) => {
      expect(nativeFunc.testListSticky001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_STICKY_0200
     * @tc.name       : testListSticky002
     * @tc.desc       : testing sticky for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSticky002', 0, async (done: Function) => {
      expect(nativeFunc.testListSticky002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_STICKY_0300
     * @tc.name       : testListSticky003
     * @tc.desc       : testing sticky for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSticky003', 0, async (done: Function) => {
      expect(nativeFunc.testListSticky003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_STICKY_0400
     * @tc.name       : testListSticky004
     * @tc.desc       : testing sticky for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSticky004', 0, async (done: Function) => {
      expect(nativeFunc.testListSticky004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_STICKY_0500
     * @tc.name       : testListSticky005
     * @tc.desc       : testing sticky for list with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListSticky005', 0, async (done: Function) => {
      expect(nativeFunc.testListSticky005()).assertEqual(0)
      done()
    })
  })
}
