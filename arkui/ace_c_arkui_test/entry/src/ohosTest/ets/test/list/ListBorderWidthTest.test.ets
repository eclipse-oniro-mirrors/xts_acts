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

export default function listBorderWidthTest() {

  describe('ListBorderWidthTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_BORDERWIDTH_0100
     * @tc.name       : testListBorderWidth001
     * @tc.desc       : testing borderWidth for list with unify the border width of the four edges
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListBorderWidth001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListBorderWidth001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_BORDERWIDTH_0200
     * @tc.name       : testListBorderWidth002
     * @tc.desc       : testing borderWidth for list with set the width of the borders on each side separately
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListBorderWidth002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListBorderWidth002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_BORDERWIDTH_0300
     * @tc.name       : testListBorderWidth003
     * @tc.desc       : testing borderWidth for list with set the width of the borders on each side, with three values of 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListBorderWidth003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListBorderWidth003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_BORDERWIDTH_0400
     * @tc.name       : testListBorderWidth004
     * @tc.desc       : testing borderWidth for list with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListBorderWidth004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListBorderWidth004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_BORDERWIDTH_0500
     * @tc.name       : testListBorderWidth005
     * @tc.desc       : testing borderWidth for list with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListBorderWidth005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListBorderWidth005()).assertEqual(0)
      done()
    })
  })
}
