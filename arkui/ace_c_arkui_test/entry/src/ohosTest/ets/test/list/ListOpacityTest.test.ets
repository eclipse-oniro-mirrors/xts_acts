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

export default function listOpacityTest() {

  describe('ListOpacityTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_OPACITY_0100
     * @tc.name       : testListOpacity001
     * @tc.desc       : testing opacity for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListOpacity001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListOpacity001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_OPACITY_0200
     * @tc.name       : testListOpacity002
     * @tc.desc       : testing opacity for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListOpacity002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListOpacity002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_OPACITY_0300
     * @tc.name       : testListOpacity003
     * @tc.desc       : testing opacity for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListOpacity003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListOpacity003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_OPACITY_0400
     * @tc.name       : testListOpacity004
     * @tc.desc       : testing opacity for list with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListOpacity004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListOpacity004()).assertEqual(0)
      done()
    })
  })
}
