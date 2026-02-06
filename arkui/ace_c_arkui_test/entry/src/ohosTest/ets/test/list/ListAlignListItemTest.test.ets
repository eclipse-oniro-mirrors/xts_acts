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

export default function listAlignListItemTest() {

  describe('ListAlignListItemTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ALIGN_LIST_ITEM_0001
     * @tc.name       : testListAlignListItem001
     * @tc.desc       : testing align list item for list with ARKUI_LIST_ITEM_ALIGNMENT_START value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListAlignListItem001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAlignListItem001()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ALIGN_LIST_ITEM_0002
     * @tc.name       : testListAlignListItem002
     * @tc.desc       : testing align list item for list with ARKUI_LIST_ITEM_ALIGNMENT_CENTER value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListAlignListItem002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAlignListItem002()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ALIGN_LIST_ITEM_0003
     * @tc.name       : testListAlignListItem003
     * @tc.desc       : testing align list item for list with ARKUI_LIST_ITEM_ALIGNMENT_END value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListAlignListItem003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAlignListItem003()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ALIGN_LIST_ITEM_0004
     * @tc.name       : testListAlignListItem004
     * @tc.desc       : testing align list item for list with -1 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListAlignListItem004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAlignListItem004()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ALIGN_LIST_ITEM_0005
     * @tc.name       : testListAlignListItem005
     * @tc.desc       : testing align list item for list with 3 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListAlignListItem005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAlignListItem005()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ALIGN_LIST_ITEM_0006
     * @tc.name       : testListAlignListItem006
     * @tc.desc       : testing align list item for list with resetAttribute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListAlignListItem006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListAlignListItem006()).assertEqual(0)
      done()
    })
  })
}
