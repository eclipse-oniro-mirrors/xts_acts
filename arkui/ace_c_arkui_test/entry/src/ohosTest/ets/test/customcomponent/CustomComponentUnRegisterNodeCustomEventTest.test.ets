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

export default function customComponentUnRegisterNodeCustomEventTest() {

  describe('CustomComponentUnRegisterNodeCustomEventTest', () => {

    let PAGE_TAG = 'CustomComponentUnRegisterNodeCustomEventTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testCustomComponentUnRegisterNodeCustomEvent001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_UNREGISTER_NODE_CUSTOM_EVENT_001
     * @tc.desc   test custom event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentUnRegisterNodeCustomEvent001', Level.LEVEL1, async (done: Function) => {
      expect(Utils.getComponentInfoByKey('button1').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button2').$attrs.backgroundColor).assertEqual('#FF0000FF')
      done()
    })
  })
}
