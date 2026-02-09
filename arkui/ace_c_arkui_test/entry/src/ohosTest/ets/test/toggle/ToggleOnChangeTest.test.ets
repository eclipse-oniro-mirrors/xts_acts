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
import { Driver, ON} from '@ohos.UiTest';

export default function toggleOnChangeTest() {

  describe('ToggleOnChangeTest', () => {

    let PAGE_TAG = 'ToggleOnChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`toggle/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testToggleOnchange001
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_ONCHANGE_0100
     * @tc.desc   testing onChange event callback for toggle with normal value (IsOn is false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleOnchange001', Level.LEVEL1, async (done: Function) => {
     let driver = Driver.create();
      await Utils.sleep(500)
      let OnChangeToggle = await driver.findComponent(ON.id('OnChangeToggle'));
      await Utils.sleep(500)
      await OnChangeToggle.click();
      await Utils.sleep(5000);
      expect(Utils.getComponentInfoByKey('OnChangeToggle').$attrs.switchPointColor).assertContain('#')
      done()
    })

    /**
     * @tc.name   testToggleOnchange002
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_ONCHANGE_0200
     * @tc.desc   testing onChange event callback for toggle with normal value (IsOn is true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleOnchange002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      await Utils.sleep(500)
      let OnChangeIsOnToggle = await driver.findComponent(ON.id('OnChangeIsOnToggle'));
      await Utils.sleep(500)
      await OnChangeIsOnToggle.click();
      await Utils.sleep(5000);
      expect(Utils.getComponentInfoByKey('OnChangeIsOnToggle').$attrs.switchPointColor).assertEqual('#FFFF0000')
      done()
    })



  })
}
