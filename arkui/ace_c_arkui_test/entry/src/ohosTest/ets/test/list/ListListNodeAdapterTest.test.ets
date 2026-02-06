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

export default function listListNodeAdapterTest() {

  describe('ListListNodeAdapterTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_NODE_ADAPTER_0001
     * @tc.name       : testListListNodeAdapter001
     * @tc.desc       : testing adapter for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListListNodeAdapter001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListListNodeAdapter001()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_NODE_ADAPTER_0002
     * @tc.name       : testListListNodeAdapter002
     * @tc.desc       : testing adapter for list with nullptr value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListListNodeAdapter002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListListNodeAdapter002()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_NODE_ADAPTER_0003
     * @tc.name       : testListListNodeAdapter003
     * @tc.desc       : testing adapter for list with resetAttribute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListListNodeAdapter003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListListNodeAdapter003()).assertEqual(0)
      done()
    })
  })
}
