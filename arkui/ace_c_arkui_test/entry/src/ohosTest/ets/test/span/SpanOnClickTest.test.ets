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
import { ComponentInfo } from '../common/Interfaces';
import Utils from '../common/Utils';

export default function spanOnClickTest() {

  describe('SpanOnClickTest', () => {

    let PAGE_TAG = 'SpanOnClickTest';

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_SPAN_ON_CLICK_0100
     * @tc.name       : testSpanOnClick001
     * @tc.desc       : test span onClick with event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanOnClick001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`span/${PAGE_TAG}`);
      focusControl.requestFocus('SpanClickText')
      await Utils.sleep(2000);
      await Utils.clickComponent('SpanClickText');
      await Utils.sleep(4000);
      expect(Utils.getComponentInfoByKey('SpanClickText').$attrs.backgroundColor).assertEqual('#FFFF0000')

      done();
    })

  })
}