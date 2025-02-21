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
import { ComponentInfo } from '../common/Interfaces';
import Utils from '../common/Utils';

export default function toggleOnChangeTest() {

  describe('ToggleOnChangeTest', () => {

    let PAGE_TAG = 'ToggleOnChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`toggle/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_ONCHANGE_0100
    * @tc.name       : testToggleOnchange001
    * @tc.desc       : testing onChange event callback for toggle with normal value (IsOn is false)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testToggleOnchange001', 0, async (done: Function) => {
      await Utils.clickComponent('OnChangeToggle')
      await Utils.sleep(5000);
      expect(Utils.getComponentInfoByKey('OnChangeToggle').$attrs.switchPointColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_ONCHANGE_0200
    * @tc.name       : testToggleOnchange002
    * @tc.desc       : testing onChange event callback for toggle with normal value (IsOn is true)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testToggleOnchange002', 0, async (done: Function) => {
      await Utils.clickComponent('OnChangeIsOnToggle')
      await Utils.sleep(5000);
      expect(Utils.getComponentInfoByKey('OnChangeIsOnToggle').$attrs.switchPointColor).assertEqual('#FFFF0000')
      done()
    })



  })
}
