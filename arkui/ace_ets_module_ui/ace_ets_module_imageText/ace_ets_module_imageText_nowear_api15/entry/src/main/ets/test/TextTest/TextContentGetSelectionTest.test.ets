/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TextContentGetSelectionTest() {
  describe('TextContentGetSelectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextContentGetSelectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextContentGetSelectionTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextContentGetSelectionTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("TextContentGetSelectionTest" == pages.name)) {
          console.info("get TextContentGetSelectionTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextContentGetSelectionTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextContentGetSelectionTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextContentGetSelectionTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         TextContentGetSelectionTest0001
    * @tc.desic        The TextArea get Selection
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('TextContentGetSelectionTest0001', 0, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextContentGetSelectionTest0001 START');
      await CommonFunc.sleep(1000);
      let TextArea = await driver.findComponent(ON.id('TextArea'))
      await CommonFunc.sleep(500);
      await TextArea.longClick();
      await CommonFunc.sleep(500);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await CommonFunc.sleep(500);
      await allSelect.click();
      await CommonFunc.sleep(500);
      let getTextArea = await driver.findComponent(ON.id('getTextArea'))
      await CommonFunc.sleep(500);
      await getTextArea.click();
      await CommonFunc.sleep(500);
      let TextAreaSelectionStart:number = AppStorage.get('TextAreaSelectionStart') as number
      let TextAreaSelectionEnd:number = AppStorage.get('TextAreaSelectionEnd') as number
      expect(TextAreaSelectionStart).assertEqual(0);
      expect(TextAreaSelectionEnd).assertEqual(7);
      AppStorage.delete('TextAreaSelectionStart');
      AppStorage.delete('TextAreaSelectionEnd');
      console.info("[TextContentGetSelectionTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         TextContentGetSelectionTest0002
    * @tc.desic        The Search get Selection
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('TextContentGetSelectionTest0002', 0, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextContentGetSelectionTest0002 START');
      await CommonFunc.sleep(1000);
      let Search = await driver.findComponent(ON.id('Search'))
      await CommonFunc.sleep(500);
      await Search.longClick();
      await CommonFunc.sleep(500);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await CommonFunc.sleep(500);
      await allSelect.click();
      await CommonFunc.sleep(500);
      let getSearch = await driver.findComponent(ON.id('getSearch'))
      await CommonFunc.sleep(500);
      await getSearch.click();
      await CommonFunc.sleep(500);
      let SearchSelectionStart:number = AppStorage.get('SearchSelectionStart') as number
      let SearchSelectionEnd:number = AppStorage.get('SearchSelectionEnd') as number
      expect(SearchSelectionStart).assertEqual(0);
      expect(SearchSelectionEnd).assertEqual(6);
      AppStorage.delete('SearchSelectionStart');
      AppStorage.delete('SearchSelectionEnd');
      console.info("[TextContentGetSelectionTest0002] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0003
    * @tc.name         TextContentGetSelectionTest0003
    * @tc.desic        The TextInput get Selection
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('TextContentGetSelectionTest0003', 0, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextContentGetSelectionTest0003 START');
      await CommonFunc.sleep(1000);
      let TextInput = await driver.findComponent(ON.id('TextInput'))
      await CommonFunc.sleep(500);
      await TextInput.longClick();
      await CommonFunc.sleep(500);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await CommonFunc.sleep(500);
      await allSelect.click();
      await CommonFunc.sleep(500);
      let getTextInput = await driver.findComponent(ON.id('getTextInput'))
      await CommonFunc.sleep(500);
      await getTextInput.click();
      await CommonFunc.sleep(500);
      let TextInputSelectionStart:number = AppStorage.get('TextInputSelectionStart') as number
      let TextInputSelectionEnd:number = AppStorage.get('TextInputSelectionEnd') as number
      expect(TextInputSelectionStart).assertEqual(0);
      expect(TextInputSelectionEnd).assertEqual(8);
      AppStorage.delete('TextInputSelectionStart');
      AppStorage.delete('TextInputSelectionEnd');
      console.info("[TextContentGetSelectionTest0003] end");
      done();
    });
  })
}