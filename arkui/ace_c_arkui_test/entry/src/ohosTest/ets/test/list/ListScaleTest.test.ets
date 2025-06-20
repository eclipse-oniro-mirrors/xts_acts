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

export default function listScaleTest() {

  describe('ListScaleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCALE_0100
     * @tc.name       : testListScale001
     * @tc.desc       : testing scale for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScale001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListScale001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCALE_0200
     * @tc.name       : testListScale002
     * @tc.desc       : testing scale for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScale002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListScale002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCALE_0300
     * @tc.name       : testListScale003
     * @tc.desc       : testing scale for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScale003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListScale003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCALE_0400
     * @tc.name       : testListScale004
     * @tc.desc       : testing scale for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScale004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListScale004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCALE_0500
     * @tc.name       : testListScale005
     * @tc.desc       : testing scale for list with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScale005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListScale005()).assertEqual(0)
      done()
    })
  })
}
