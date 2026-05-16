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
import { Driver, ON} from '@ohos.UiTest';

export default function textAreaOnPasteTest() {

  describe('TextAreaOnPasteTest', () => {

    let PAGE_TAG = 'TextAreaOnPasteTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textarea/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testTextAreaOnPaste001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_ONPASTE_0100
     * @tc.desc   test onPaste event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaOnPaste001', Level.LEVEL1, async  (done: Function) => {
      let driver = Driver.create();
      focusControl.requestFocus('OnPasteTestTextArea')
      await Utils.sleep(500)
      let component = await driver.findComponent(ON.id('OnPasteTestTextArea'));
      await Utils.sleep(500)
      await component.longClick(); 
      await Utils.sleep(500)
      let component4 = await driver.findComponent(ON.text('全选'));
      await Utils.sleep(500)
      await component4.click();
      await Utils.sleep(500)
      let component1 = await driver.findComponent(ON.text('剪切'));
      await Utils.sleep(500)
      await component1.click();
      await Utils.sleep(500)
      focusControl.requestFocus('OnPasteTestTextAreaCompare')
      await Utils.sleep(500)
      let component2 = await driver.findComponent(ON.id('OnPasteTestTextAreaCompare'));
      await Utils.sleep(500)
      await component2.longClick(); 
      await Utils.sleep(500)
      let component3 = await driver.findComponent(ON.text('粘贴'));
      await Utils.sleep(500)
      await component3.click();
      await Utils.sleep(500)
      expect(Utils.getComponentInfoByKey('OnPasteTestTextAreaCompare').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

  })
}
