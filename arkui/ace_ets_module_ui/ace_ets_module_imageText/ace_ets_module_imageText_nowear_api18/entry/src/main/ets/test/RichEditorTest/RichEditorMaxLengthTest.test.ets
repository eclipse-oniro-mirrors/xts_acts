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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function RichEditorMaxLengthTest() {
  describe('RichEditorMaxLengthTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorMaxLengthTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorMaxLengthTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorMaxLengthTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("RichEditorMaxLengthTest" == pages.name)) {
          console.info("get RichEditorMaxLengthTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push RichEditorMaxLengthTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorMaxLengthTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorMaxLengthTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         RichEditorMaxLengthTest0001
    * @tc.desic        The MaxLength  set -1
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorMaxLengthTest0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorMaxLengthTest0001 START');
      await CommonFunc.sleep(1000);
      let richEditor = await driver.findComponent(ON.id('MaxLengthRichText'))
      await CommonFunc.sleep(500);
      await richEditor.inputText('012345678910')
      await CommonFunc.sleep(500);
      let getRichTextContent = await driver.findComponent(ON.id('getRichTextContent'))
      await CommonFunc.sleep(500);
      await getRichTextContent.click()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorMaxLength')).assertEqual('012345678910');
      AppStorage.delete('RichEditorMaxLength')
      console.info("[RichEditorMaxLengthTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         RichEditorMaxLengthTest0002
    * @tc.desic        The MaxLength  set 5
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorMaxLengthTest0002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorMaxLengthTest0002 START');
      await CommonFunc.sleep(1000);
      let setMaxLength = await driver.findComponent(ON.id('setMaxLength1'))
      await CommonFunc.sleep(500);
      await setMaxLength.click()
      await CommonFunc.sleep(500);
      let richEditor = await driver.findComponent(ON.id('MaxLengthRichText'))
      await CommonFunc.sleep(500);
      await richEditor.inputText('012345678910')
      await CommonFunc.sleep(500);
      let getRichTextContent = await driver.findComponent(ON.id('getRichTextContent'))
      await CommonFunc.sleep(500);
      await getRichTextContent.click()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorMaxLength')).assertEqual('01234');
      AppStorage.delete('RichEditorMaxLength')
      console.info("[RichEditorMaxLengthTest0002] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0003
   * @tc.name         RichEditorMaxLengthTest0003
   * @tc.desic        The MaxLength  set undefined
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('RichEditorMaxLengthTest0003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info(' RichEditorMaxLengthTest0003 START');
      await CommonFunc.sleep(1000);
      let setMaxLength = await driver.findComponent(ON.id('setMaxLength2'))
      await CommonFunc.sleep(500);
      await setMaxLength.click()
      await CommonFunc.sleep(500);
      let richEditor = await driver.findComponent(ON.id('MaxLengthRichText'))
      await CommonFunc.sleep(500);
      await richEditor.inputText('012345678910')
      await CommonFunc.sleep(500);
      let getRichTextContent = await driver.findComponent(ON.id('getRichTextContent'))
      await CommonFunc.sleep(500);
      await getRichTextContent.click()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorMaxLength')).assertEqual('012345678910');
      AppStorage.delete('RichEditorMaxLength')
      console.info("[RichEditorMaxLengthTest0003] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0004
   * @tc.name         RichEditorMaxLengthTest0004
   * @tc.desic        The MaxLength  set 7.2
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('RichEditorMaxLengthTest0004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info(' RichEditorMaxLengthTest0004 START');
      await CommonFunc.sleep(1000);
      let setMaxLength = await driver.findComponent(ON.id('setMaxLength3'))
      await CommonFunc.sleep(500);
      await setMaxLength.click()
      await CommonFunc.sleep(500);
      let richEditor = await driver.findComponent(ON.id('MaxLengthRichText'))
      await CommonFunc.sleep(500);
      await richEditor.inputText('012345678910')
      await CommonFunc.sleep(500);
      let getRichTextContent = await driver.findComponent(ON.id('getRichTextContent'))
      await CommonFunc.sleep(500);
      await getRichTextContent.click()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorMaxLength')).assertEqual('0123456');
      AppStorage.delete('RichEditorMaxLength')
      console.info("[RichEditorMaxLengthTest0004] end");
      done();
    });
  })
}