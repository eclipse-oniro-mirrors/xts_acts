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

export default function customComponentOnBlurTest() {

  describe('CustomComponentOnBlurTest', () => {

    let PAGE_TAG = 'CustomComponentOnBlurTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ONBLUR_0100
    * @tc.name       : testCustomComponentOnBlur001
    * @tc.desc       : test onBlur event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentOnBlur001', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('OnBlurTestCustomComponentCompare')
      await Utils.sleep(2000)
      focusControl.requestFocus('OnBlurTestCustomComponent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnBlurTestCustomComponentCompare').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ONBLUR_0200
    * @tc.name       : testCustomComponentOnBlur002
    * @tc.desc       : test onBlur event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentOnBlur002', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('OnBlurTestCustomComponentDisable')
      await Utils.sleep(2000)
      focusControl.requestFocus('OnBlurTestCustomComponent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnBlurTestCustomComponentDisable').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      done()
    })
  })
}
