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

export default function listSpaceTest() {

  describe('ListSpaceTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SPACE_0001
     * @tc.name       : testListSpace001
     * @tc.desc       : testing space for list with 4 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSpace001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSpace001()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SPACE_0002
     * @tc.name       : testListSpace002
     * @tc.desc       : testing space for list with 1000 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSpace002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSpace002()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SPACE_0003
     * @tc.name       : testListSpace003
     * @tc.desc       : testing space for list with -1 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSpace003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSpace003()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SPACE_0004
     * @tc.name       : testListSpace004
     * @tc.desc       : testing space for list with 0 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSpace004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSpace004()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SPACE_0005
     * @tc.name       : testListSpace005
     * @tc.desc       : testing space for list with resetAttribute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSpace005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSpace005()).assertEqual(0)
      done()
    })
  })
}
