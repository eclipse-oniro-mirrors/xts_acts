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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function openPopupNullUndefinedTest() {
  describe('openPopupNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("openPopupNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popupNullUndefined/openPopup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get openPopupNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("openPopupNullUndefinedTest" == pages.name)) {
          console.info("get openPopupNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push openPopupNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push openPopupNullUndefinedTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("openPopupNullUndefinedTest after each called");
    });

    /**
    * @tc.name   openPopupNullContentNode_0100
    * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENPOPUP_NULL_0100
    * @tc.desc   Test PromptAction.openPopup with null contentNode parameter
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('openPopupNullContentNode_0100', Level.LEVEL1, async () => {
        console.info('[openPopupNullContentNode_0100] START');
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();

        const button = await driver.findComponent(ON.id('btn_openpopup_null_content'));
        await button.click();
        await CommonFunc.sleep(5000);
        let strJson: string = getInspectorByKey('openpopup_test_result');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let resultText: string = JSON.stringify(obj.$attrs.content)
        await CommonFunc.sleep(1000);
        console.info("[openPopupNullContentNode_0100] result: " + resultText);
        expect(resultText).assertContain("SUCCESS");
        console.info('[openPopupNullContentNode_0100] END');
    })

    /**
    * @tc.name   openPopupUndefinedContentNode_0100
    * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENPOPUP_UNDEFINED_0100
    * @tc.desc   Test PromptAction.openPopup with undefined contentNode parameter
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('openPopupUndefinedContentNode_0100', Level.LEVEL1, async () => {
        console.info('[openPopupUndefinedContentNode_0100] START');
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();

        const button = await driver.findComponent(ON.id('btn_openpopup_undefined_content'));
        await button.click();
        await CommonFunc.sleep(5000);

        let strJson: string = getInspectorByKey('openpopup_test_result');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let resultText: string = JSON.stringify(obj.$attrs.content)
        await CommonFunc.sleep(1000);
        console.info("[openPopupUndefinedContentNode_0100] result: " + resultText);
        expect(resultText).assertContain("SUCCESS");
        console.info('[openPopupUndefinedContentNode_0100] END');
    })

    /**
    * @tc.name   openPopupNullTarget_0100
    * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENPOPUP_NULL_0200
    * @tc.desc   Test PromptAction.openPopup with null target parameter
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('openPopupNullTarget_0100', Level.LEVEL1, async () => {
        console.info('[openPopupNullTarget_0100] START');
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();

        const button = await driver.findComponent(ON.id('btn_openpopup_null_target'));
        await button.click();
        await CommonFunc.sleep(5000);

        let strJson: string = getInspectorByKey('openpopup_test_result');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let resultText: string = JSON.stringify(obj.$attrs.content)
        await CommonFunc.sleep(1000);
        console.info("[openPopupNullTarget_0100] result: " + resultText);
        expect(resultText).assertContain("SUCCESS");
        console.info('[openPopupNullTarget_0100] END');
    })

    /**
    * @tc.name   openPopupUndefinedTarget_0100
    * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENPOPUP_UNDEFINED_0200
    * @tc.desc   Test PromptAction.openPopup with undefined target parameter
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('openPopupUndefinedTarget_0100', Level.LEVEL1, async () => {
        console.info('[openPopupUndefinedTarget_0100] START');
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();

        const button = await driver.findComponent(ON.id('btn_openpopup_undefined_target'));
        await button.click();
        await CommonFunc.sleep(5000);

        let strJson: string = getInspectorByKey('openpopup_test_result');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let resultText: string = JSON.stringify(obj.$attrs.content)
        await CommonFunc.sleep(1000);
        console.info("[openPopupUndefinedTarget_0100] result: " + resultText);
        expect(resultText).assertContain("SUCCESS");
        console.info('[openPopupUndefinedTarget_0100] END');
    })

    /**
    * @tc.name   openPopupNullOptions_0100
    * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENPOPUP_NULL_0300
    * @tc.desc   Test PromptAction.openPopup with null options parameter
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('openPopupNullOptions_0100', Level.LEVEL1, async () => {
        console.info('[openPopupNullOptions_0100] START');
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();

        const button = await driver.findComponent(ON.id('btn_openpopup_null_options'));
        await button.click();
        await CommonFunc.sleep(5000);

        let strJson: string = getInspectorByKey('openpopup_test_result');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let resultText: string = JSON.stringify(obj.$attrs.content)
        await button.click();
        await CommonFunc.sleep(1000);
        console.info("[openPopupNullOptions_0100] result: " + resultText);
        expect(resultText).assertContain("SUCCESS");
        console.info('[openPopupNullOptions_0100] END');
    })

    /**
    * @tc.name   openPopupUndefinedOptions_0100
    * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENPOPUP_UNDEFINED_0300
    * @tc.desc   Test PromptAction.openPopup with undefined options parameter
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('openPopupUndefinedOptions_0100', Level.LEVEL1, async () => {
        console.info('[openPopupUndefinedOptions_0100] START');
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();

        const button = await driver.findComponent(ON.id('btn_openpopup_undefined_options'));
        await button.click();
        await CommonFunc.sleep(5000);

        let strJson: string = getInspectorByKey('openpopup_test_result');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let resultText: string = JSON.stringify(obj.$attrs.content)
        await button.click();
        await CommonFunc.sleep(1000);
        console.info("[openPopupUndefinedOptions_0100] result: " + resultText);
        expect(resultText).assertContain("SUCCESS");
        console.info('[openPopupUndefinedOptions_0100] END');
    })

  })
}
