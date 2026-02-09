/**
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function TextAreaGetTextTest() {
  describe('TextAreaGetTextTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaGetTextTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi18/TextAreaGetText',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaGetTextTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaGetText" == pages.name)) {
          console.info("get TextAreaGetTextTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaGetTextTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaGetTextTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextAreaGetTextTest_0010
     * @tc.number SUB_ACE_TextAreaGetTextTest_0010
     * @tc.desc   test TextArea getText: set start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaGetTextTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('TextAreaGetTextTest_0010 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextArea_getText_1'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0010] getText1:" + JSON.stringify(AppStorage.get('getText_1')));
      expect(AppStorage.get('getText_1')).assertEqual('cd');
      AppStorage.delete('getText_1')
      console.info('[TextAreaGetTextTest_0010] END');
      done();
    });

    /**
     * @tc.name   TextAreaGetTextTest_0020
     * @tc.number SUB_ACE_TextAreaGetTextTest_0020
     * @tc.desc   test TextArea getText: only set start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaGetTextTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaGetTextTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextArea_getText_2'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0010] getText2:" + JSON.stringify(AppStorage.get('getText_2')));
      expect(AppStorage.get('getText_2')).assertEqual('bcdef');
      AppStorage.delete('getText_2')
      console.info('[TextAreaGetTextTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextAreaGetTextTest_0030
     * @tc.number SUB_ACE_TextAreaGetTextTest_0030
     * @tc.desc   test TextArea getText: only set end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaGetTextTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaGetTextTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextArea_getText_3'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0030] getText3:" + JSON.stringify(AppStorage.get('getText_3')));
      expect(AppStorage.get('getText_3')).assertEqual('abc');
      AppStorage.delete('getText_3')
      console.info('[TextAreaGetTextTest_0030] END');
      done();
    });

    /**
     * @tc.name   TextAreaGetTextTest_0040
     * @tc.number SUB_ACE_TextAreaGetTextTest_0040
     * @tc.desc   test TextArea getText: set start undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaGetTextTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaGetTextTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextArea_getText_4'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0040] getText4:" + JSON.stringify(AppStorage.get('getText_4')));
      expect(AppStorage.get('getText_4')).assertEqual('abcdef');
      AppStorage.delete('getText_4')
      console.info('[TextAreaGetTextTest_0040] END');
      done();
    });

    /**
     * @tc.name   TextAreaGetTextTest_0050
     * @tc.number SUB_ACE_TextAreaGetTextTest_0050
     * @tc.desc   test TextArea getText: set end undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaGetTextTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaGetTextTest_0050] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextArea_getText_5'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0050] getText5:" + JSON.stringify(AppStorage.get('getText_5')));
      expect(AppStorage.get('getText_5')).assertEqual('abcdef');
      AppStorage.delete('getText_5')
      console.info('[TextAreaGetTextTest_0050] END');
      done();
    });

    /**
     * @tc.name   TextAreaGetTextTest_0060
     * @tc.number SUB_ACE_TextAreaGetTextTest_0060
     * @tc.desc   test TextArea getText: set start and end: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaGetTextTest_0060', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaGetTextTest_0060] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextArea_getText_6'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0060] getText6:" + JSON.stringify(AppStorage.get('getText_6')));
      expect(AppStorage.get('getText_6')).assertEqual('abcdef');
      AppStorage.delete('getText_6')
      console.info('[TextAreaGetTextTest_0060] END');
      done();
    });

    /**
     * @tc.name   TextAreaGetTextTest_0070
     * @tc.number SUB_ACE_TextAreaGetTextTest_0070
     * @tc.desc   test TextArea getText: not set TextRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaGetTextTest_0070', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaGetTextTest_0070] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextArea_getText_7'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0070] getText7:" + JSON.stringify(AppStorage.get('getText_7')));
      expect(AppStorage.get('getText_7')).assertEqual('abcdef');
      AppStorage.delete('getText_7')
      console.info('[TextAreaGetTextTest_0070] END');
      done();
    });

    /**
     * @tc.name   TextAreaGetTextTest_0080
     * @tc.number SUB_ACE_TextAreaGetTextTest_0080
     * @tc.desc   test TextArea: clearPreviewText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaGetTextTest_0080', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaGetTextTest_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextArea_clearPreViewText'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0080] TextArea:" + JSON.stringify(AppStorage.get('clearPreViewText_TextArea')));
      expect(AppStorage.get('clearPreViewText_TextArea')).assertEqual('succ');
      AppStorage.delete('clearPreViewText_TextArea')
      console.info('[TextAreaGetTextTest_0080] END');
      done();
    });
  })
}
