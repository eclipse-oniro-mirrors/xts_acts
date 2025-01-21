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

export default function listSaturateTest() {

  describe('ListSaturateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SATURATE_0100
     * @tc.name       : testListSaturate001
     * @tc.desc       : testing saturate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSaturate001', 0, async (done: Function) => {
      expect(nativeFunc.testListSaturate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SATURATE_0200
     * @tc.name       : testListSaturate002
     * @tc.desc       : testing saturate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSaturate002', 0, async (done: Function) => {
      expect(nativeFunc.testListSaturate002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SATURATE_0300
     * @tc.name       : testListSaturate003
     * @tc.desc       : testing saturate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSaturate003', 0, async (done: Function) => {
      expect(nativeFunc.testListSaturate003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SATURATE_0400
     * @tc.name       : testListSaturate004
     * @tc.desc       : testing saturate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSaturate004', 0, async (done: Function) => {
      expect(nativeFunc.testListSaturate004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SATURATE_0500
     * @tc.name       : TestListSaturate005
     * @tc.desc       : Testing saturate for list with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListSaturate005', 0, async (done: Function) => {
      expect(nativeFunc.testListSaturate005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SATURATE_0600
     * @tc.name       : TestListSaturate006
     * @tc.desc       : Testing saturate for list with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListSaturate006', 0, async (done: Function) => {
      expect(nativeFunc.testListSaturate006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SATURATE_0700
     * @tc.name       : TestListSaturate007
     * @tc.desc       : Testing saturate for list with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListSaturate007', 0, async (done: Function) => {
      expect(nativeFunc.testListSaturate007()).assertEqual(0)
      done()
    })
  })
}
