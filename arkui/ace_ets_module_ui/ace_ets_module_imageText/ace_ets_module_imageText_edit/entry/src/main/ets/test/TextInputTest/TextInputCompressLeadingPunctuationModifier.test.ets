/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from "../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextInputCompressLeadingPunctuationModifier() {
  describe('TextInputCompressLeadingPunctuationModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputCompressLeadingPunctuationModifier beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputCompressLeadingPunctuationModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputCompressLeadingPunctuationModifier state pages:" + JSON.stringify(pages));
        if (!("TextInputCompressLeadingPunctuationModifier" == pages.name)) {
          console.info("get TextInputCompressLeadingPunctuationModifier pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputCompressLeadingPunctuationModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputCompressLeadingPunctuationModifier page error:" + err);
      }
      console.info("TextInputCompressLeadingPunctuationModifier beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputCompressLeadingPunctuationModifier after each called");
    });

    /**
     * @tc.name   TextInputCompressLeadingPunctuationModifier_0100
     * @tc.number SUB_ACE_TEXTINPUT_CompressLeadingPunctuationModifier_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputCompressLeadingPunctuationModifier_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputCompressLeadingPunctuationModifier_0100] START');
      await CommonFunc.sleep(2000);
      // let driver = Driver.create();
      // await CommonFunc.sleep(300);
      let strJson: string = getInspectorByKey('textInputCompressLeadingPunctuationModifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TextInputCompressLeadingPunctuationModifier_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[TextInputCompressLeadingPunctuationModifier_0100] compressLeadingPunctuation : ' + JSON.stringify(obj.$attrs.compressLeadingPunctuation));
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual('0');
      console.info('[TextInputCompressLeadingPunctuationModifier_0100] END');
      done();
    });

    /**
     * @tc.name   TextInputCompressLeadingPunctuationModifier_0200
     * @tc.number SUB_ACE_TEXTINPUT_CompressLeadingPunctuationModifier_0200
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputCompressLeadingPunctuationModifier_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputCompressLeadingPunctuationModifier_0200] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('textInputCompressLeadingPunctuationModifierButton'));
      await btn.click()
      await CommonFunc.sleep(4000);
      let strJson: string = getInspectorByKey('textInputCompressLeadingPunctuationModifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TextInputCompressLeadingPunctuationModifier_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[TextInputCompressLeadingPunctuationModifier_0200] compressLeadingPunctuation : ' + JSON.stringify(obj.$attrs.compressLeadingPunctuation));
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual('1');
      console.info('[TextInputCompressLeadingPunctuationModifier_0200] END');
      done();
    });
  })
}
