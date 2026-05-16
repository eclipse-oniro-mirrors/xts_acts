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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function updateMenuNullUndefinedTest() {
    describe('updateMenuNullUndefinedTest', () => {
      beforeEach(async (done: Function) => {
        console.info("updateMenuNullUndefinedTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/MenuNullUndefined/updateMenu',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get updateMenuNullUndefinedTest state pages: " + JSON.stringify(pages));
          if (!("updateMenuNullUndefinedTest" == pages.name)) {
            console.info("get updateMenuNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
            let result = await router.push(options);
            await CommonFunc.sleep(2000);
            console.info("push updateMenuNullUndefinedTest success: " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push updateMenuNullUndefinedTest page error: " + err);
          expect().assertFail();
        }
        done();
      });

      /**
        * @tc.name   updateMenuNullContentNode_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_UPDATEMENU_NULL_0100
        * @tc.desc   Test PromptAction.updateMenu with null contentNode parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('updateMenuNullContentNode_0100', Level.LEVEL1, async () => {
            console.info('[updateMenuNullContentNode_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_updatemenu_null_content'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('updatemenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[updateMenuNullContentNode_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[updateMenuNullContentNode_0100] END');
        })

        /**
        * @tc.name   updateMenuUndefinedContentNode_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_UPDATEMENU_UNDEFINED_0100
        * @tc.desc   Test PromptAction.updateMenu with undefined contentNode parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('updateMenuUndefinedContentNode_0100', Level.LEVEL1, async () => {
            console.info('[updateMenuUndefinedContentNode_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_updatemenu_undefined_content'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('updatemenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[updateMenuUndefinedContentNode_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[updateMenuUndefinedContentNode_0100] END');
        })

        /**
        * @tc.name   updateMenuNullOptions_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_UPDATEMENU_NULL_0200
        * @tc.desc   Test PromptAction.updateMenu with null options parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('updateMenuNullOptions_0100', Level.LEVEL1, async () => {
            console.info('[updateMenuNullOptions_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_updatemenu_null_options'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('updatemenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[updateMenuNullOptions_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[updateMenuNullOptions_0100] END');
        })

        /**
        * @tc.name   updateMenuUndefinedOptions_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_UPDATEMENU_UNDEFINED_0200
        * @tc.desc   Test PromptAction.updateMenu with undefined options parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('updateMenuUndefinedOptions_0100', Level.LEVEL1, async () => {
            console.info('[updateMenuUndefinedOptions_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_updatemenu_undefined_options'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('updatemenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[updateMenuUndefinedOptions_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[updateMenuUndefinedOptions_0100] END');
        })

        /**
        * @tc.name   updateMenuTrueTarget_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_UPDATEMENU_TRUE_0100
        * @tc.desc   Test PromptAction.updateMenu with true target parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('updateMenuTrueTarget_0100', Level.LEVEL1, async () => {
            console.info('[updateMenuTrueTarget_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_updatemenu_true_target'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('updatemenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[updateMenuTrueTarget_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[updateMenuTrueTarget_0100] END');
        })

        /**
        * @tc.name   updateMenuFalseTarget_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_UPDATEMENU_FALSE_0100
        * @tc.desc   Test PromptAction.updateMenu with false target parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('updateMenuFalseTarget_0100', Level.LEVEL1, async () => {
            console.info('[updateMenuFalseTarget_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_updatemenu_false_target'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('updatemenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[updateMenuFalseTarget_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[updateMenuFalseTarget_0100] END');
        })

    }) 
}