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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function customComponentEnabledTest() {

  describe('CustomComponentEnabledTest', () => {

    let PAGE_TAG = 'CustomComponentEnabledTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ENABLED_0100
    * @tc.name       : testCustomComponentEnabled001
    * @tc.desc       : test onClick event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentEnabled001', 0, async (done: Function) => {
      await Utils.clickComponent('EnabledTestCustomComponent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestCustomComponent').$attrs.backgroundColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('EnabledTestCustomComponentCompare')
      await Utils.sleep(2000)
      focusControl.requestFocus('EnabledTestCustomComponent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestCustomComponent').$attrs.backgroundColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('EnabledTestCustomComponentCompare')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestCustomComponent').$attrs.backgroundColor).assertEqual('#FF00FF00')

      expect(Utils.getComponentInfoByKey('EnabledTestCustomComponent').$attrs.enabled).assertTrue()
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ENABLED_0200
    * @tc.name       : testCustomComponentEnabled002
    * @tc.desc       : test onClick event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentEnabled002', 0, async (done: Function) => {
      await Utils.clickComponent('EnabledTestCustomComponentDisable')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestCustomComponentDisable').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('EnabledTestCustomComponent')
      await Utils.sleep(2000)
      focusControl.requestFocus('EnabledTestCustomComponentDisable')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestCustomComponentDisable').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('EnabledTestCustomComponent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestCustomComponentDisable').$attrs.backgroundColor).assertEqual('#FFFF0000')

      expect(Utils.getComponentInfoByKey('EnabledTestCustomComponentDisable').$attrs.enabled).assertFalse()
      done()
    })

  })
}
