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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function hybirdGetNodeHandleTest() {

  describe('HybirdGetNodeHandleTest', () => {

    let PAGE_TAG = 'HybirdGetNodeHandleTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`hybird/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testHybirdGetNodeHandle001
     * @tc.number SUB_ARKUI_CAPI_HYBIRD_GET_NODE_HANDLE_0001
     * @tc.desc   test hybirdGetNodeHandle event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHybirdGetNodeHandle001', Level.LEVEL1, async (done: Function) => {
      expect(Utils.getComponentInfoByKey('row').$attrs.backgroundColor).assertEqual('#FF008000')
      done()
    })

  })
}
