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

export default function customComponentOnFocusTest() {

  describe('CustomComponentOnFocusTest', () => {

    let PAGE_TAG = 'CustomComponentOnFocusTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ONFOCUS_0100
    * @tc.name       : testCustomComponentOnFocus001
    * @tc.desc       : test onFocus event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentOnFocus001', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('OnFocusTestCustomComponentCompare')
      await Utils.sleep(2000)
      focusControl.requestFocus('OnFocusTestCustomComponent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnFocusTestCustomComponent').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ONFOCUS_0200
    * @tc.name       : testCustomComponentOnFocus002
    * @tc.desc       : test onFocus event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentOnFocus002', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('OnFocusTestCustomComponent')
      await Utils.sleep(2000)
      focusControl.requestFocus('OnFocusTestCustomComponentDisable')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnFocusTestCustomComponentDisable').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      done()
    })

  })
}
