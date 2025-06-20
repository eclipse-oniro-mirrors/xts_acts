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

export default function listItemGroupSetFooterTest() {

  describe('ListItemGroupSetFooterTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ITEM_GROUP_SET_FOOTER_0001
     * @tc.name       : testListItemGroupSetFooter001
     * @tc.desc       : testing item group set footer for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemGroupSetFooter001', 0, async (done: Function) => {
      expect(nativeFunc.testListItemGroupSetFooter001()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ITEM_GROUP_SET_FOOTER_0002
     * @tc.name       : testListItemGroupSetFooter002
     * @tc.desc       : testing item group set footer for list with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemGroupSetFooter002', 0, async (done: Function) => {
      expect(nativeFunc.testListItemGroupSetFooter002()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ITEM_GROUP_SET_FOOTER_0003
     * @tc.name       : testListItemGroupSetFooter003
     * @tc.desc       : testing item group set footer for list with resetAttribute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemGroupSetFooter003', 0, async (done: Function) => {
      expect(nativeFunc.testListItemGroupSetFooter003()).assertEqual(0)
      done()
    })
  })
}
