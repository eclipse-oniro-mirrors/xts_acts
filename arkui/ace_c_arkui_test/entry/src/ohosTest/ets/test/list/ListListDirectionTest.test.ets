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

export default function listListDirectionTest() {

  describe('ListListDirectionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testListListDirection001
     * @tc.number SUB_ARKUI_CAPI_LIST_LISTDIRECTION_0100
     * @tc.desc   testing listDirection for list with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListListDirection001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListListDirection001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListListDirection002
     * @tc.number SUB_ARKUI_CAPI_LIST_LISTDIRECTION_0200
     * @tc.desc   testing listDirection for list with ARKUI_AXIS_HORIZONTAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListListDirection002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListListDirection002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListListDirection003
     * @tc.number SUB_ARKUI_CAPI_LIST_LISTDIRECTION_0300
     * @tc.desc   testing listDirection for list with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListListDirection003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListListDirection003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListListDirection004
     * @tc.number SUB_ARKUI_CAPI_LIST_LISTDIRECTION_0400
     * @tc.desc   testing listDirection for list with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListListDirection004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListListDirection004()).assertEqual(0)
      done()
    })
  })
}
