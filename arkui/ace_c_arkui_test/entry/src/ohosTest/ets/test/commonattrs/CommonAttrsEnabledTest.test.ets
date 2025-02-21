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

export default function commonAttrsEnabledTest() {

  describe('CommonAttrsEnabledTest', () => {

    let PAGE_TAG = 'CommonAttrsEnabledTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`commonattrs/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ENABLED_0100
    * @tc.name       : testCommonAttrsEnabled001
    * @tc.desc       : test onClick event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonAttrsEnabled001', 0, async (done: Function) => {
      await Utils.clickComponent('EnabledTestButton')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestButton').$attrs.backgroundColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('EnabledTestButtonCompare')
      await Utils.sleep(2000)
      focusControl.requestFocus('EnabledTestButton')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestButton').$attrs.backgroundColor).assertEqual('#FF0000FF')

      focusControl.requestFocus('EnabledTestButtonCompare')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestButton').$attrs.backgroundColor).assertEqual('#FFFFFF00')

      expect(Utils.getComponentInfoByKey('EnabledTestButton').$attrs.enabled).assertTrue()
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ENABLED_0200
    * @tc.name       : testCommonAttrsEnabled002
    * @tc.desc       : test onClick event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonAttrsEnabled002', 0, async (done: Function) => {
      await Utils.clickComponent('EnabledTestButtonDisable')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestButtonDisable').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('EnabledTestButton')
      await Utils.sleep(2000)
      focusControl.requestFocus('EnabledTestButtonDisable')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestButtonDisable').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('EnabledTestButton')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestButtonDisable').$attrs.backgroundColor).assertEqual('#FFFF0000')

      expect(Utils.getComponentInfoByKey('EnabledTestButtonDisable').$attrs.enabled).assertFalse()
      done()
    })

  })
}
