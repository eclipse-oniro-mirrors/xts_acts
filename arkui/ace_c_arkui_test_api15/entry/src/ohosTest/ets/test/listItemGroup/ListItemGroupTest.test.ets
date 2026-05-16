/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level} from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function listItemGroupNodeAdapterTest() {

  describe('listItemGroupNodeAdapterTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testListItemGroupNodeAdapter001
     * @tc.number SUB_ARKUI_CAPI_LIST_ITEM_GROUP_NODE_ADAPTER_0001
     * @tc.desc   testing width for listItemGroup with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemGroupNodeAdapter001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemGroupNodeAdapter001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemGroupNodeAdapter002
     * @tc.number SUB_ARKUI_CAPI_LIST_ITEM_GROUP_NODE_ADAPTER_0002
     * @tc.desc   testing width for listItemGroup with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemGroupNodeAdapter002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemGroupNodeAdapter002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListItemGroupNodeAdapter003
     * @tc.number SUB_ARKUI_CAPI_LIST_ITEM_GROUP_NODE_ADAPTER_0003
     * @tc.desc   testing width for listItemGroup with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemGroupNodeAdapter003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemGroupNodeAdapter003()).assertEqual(0)
      done()
    })
  })
}