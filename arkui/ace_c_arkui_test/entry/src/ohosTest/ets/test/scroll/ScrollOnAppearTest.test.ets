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

export default function scrollOnAppearTest() {

  describe('ScrollOnAppearTest', () => {

    let PAGE_TAG = 'ScrollOnAppearTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`scroll/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testScrollOnAppear001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_ONAPPEAR_0100
     * @tc.desc   test OnAppear event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOnAppear001', Level.LEVEL1, async (done: Function) => {
      expect(Utils.getComponentInfoByKey('OnAppear').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })
  })
}
