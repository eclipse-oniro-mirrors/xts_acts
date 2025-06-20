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

export default function customComponentOnAppearTest() {

  describe('CustomComponentOnAppearTest', () => {

    let PAGE_TAG = 'CustomComponentOnAppearTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ONAPPEAR_0100
    * @tc.name       : testCustomComponentOnAppear001
    * @tc.desc       : test onAppear event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentOnAppear001', Level.LEVEL1, async (done: Function) => {
      expect(Utils.getComponentInfoByKey('OnAppearTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

  })
}
