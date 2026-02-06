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

export default function TextCompressLeadingPunctuationModifier() {
  describe('TextCompressLeadingPunctuationModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("TextCompressLeadingPunctuationModifier beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextCompressLeadingPunctuationModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextCompressLeadingPunctuationModifier state pages:" + JSON.stringify(pages));
        if (!("TextCompressLeadingPunctuationModifier" == pages.name)) {
          console.info("get TextCompressLeadingPunctuationModifier pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextCompressLeadingPunctuationModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextCompressLeadingPunctuationModifier page error:" + err);
      }
      console.info("TextCompressLeadingPunctuationModifier beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextCompressLeadingPunctuationModifier after each called");
    });

    /**
     * @tc.name   TextCompressLeadingPunctuationModifier_0100
     * @tc.number SUB_ACE_TEXT_CompressLeadingPunctuationModifier_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextCompressLeadingPunctuationModifier_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[TextCompressLeadingPunctuationModifier_0100] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('textCompressLeadingPunctuationModifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TextCompressLeadingPunctuationModifier_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[TextCompressLeadingPunctuationModifier_0100] compressLeadingPunctuation : ' + JSON.stringify(obj.$attrs.compressLeadingPunctuation));
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual('false');
      console.info('[TextCompressLeadingPunctuationModifier_0100] END');
      done();
    });

    /**
     * @tc.name   TextCompressLeadingPunctuationModifier_0200
     * @tc.number SUB_ACE_TEXT_CompressLeadingPunctuationModifier_0200
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextCompressLeadingPunctuationModifier_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[TextCompressLeadingPunctuationModifier_0200] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('textSpanModifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TextCompressLeadingPunctuationModifier_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[TextCompressLeadingPunctuationModifier_0200] compressLeadingPunctuation : ' + JSON.stringify(obj.$attrs.compressLeadingPunctuation));
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual('false');
      console.info('[TextCompressLeadingPunctuationModifier_0200] END');
      done();
    });

    /**
     * @tc.name   TextCompressLeadingPunctuationModifier_0300
     * @tc.number SUB_ACE_TEXT_CompressLeadingPunctuationModifier_0300
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextCompressLeadingPunctuationModifier_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[TextCompressLeadingPunctuationModifier_0300] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('textModifierButton'));
      await btn.click()
      await CommonFunc.sleep(4000);
      let strJson: string = getInspectorByKey('textCompressLeadingPunctuationModifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TextCompressLeadingPunctuationModifier_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[TextCompressLeadingPunctuationModifier_0300] compressLeadingPunctuation : ' + JSON.stringify(obj.$attrs.compressLeadingPunctuation));
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual('true');
      console.info('[TextCompressLeadingPunctuationModifier_0300] END');
      done();
    });

    /**
     * @tc.name   TextCompressLeadingPunctuationModifier_0400
     * @tc.number SUB_ACE_TEXT_CompressLeadingPunctuationModifier_0400
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextCompressLeadingPunctuationModifier_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[TextCompressLeadingPunctuationModifier_0400] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('textSpanModifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TextCompressLeadingPunctuationModifier_0400] component obj is: ' + JSON.stringify(obj));
      console.info('[TextCompressLeadingPunctuationModifier_0400] compressLeadingPunctuation : ' + JSON.stringify(obj.$attrs.compressLeadingPunctuation));
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual('true');
      console.info('[TextCompressLeadingPunctuationModifier_0400] END');
      done();
    });
  })
}
