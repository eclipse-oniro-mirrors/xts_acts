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

export default function openMenuNullUndefinedTest() {
    describe('openMenuNullUndefinedTest', () => {
      beforeEach(async (done: Function) => {
        console.info("openMenuNullUndefinedTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/MenuNullUndefined/openMenu',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get openMenuNullUndefinedTest state pages: " + JSON.stringify(pages));
          if (!("openMenuNullUndefinedTest" == pages.name)) {
            console.info("get openMenuNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
            let result = await router.push(options);
            await CommonFunc.sleep(2000);
            console.info("push openMenuNullUndefinedTest success: " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push openMenuNullUndefinedTest page error: " + err);
          expect().assertFail();
        }
        done();
      });

      /**
        * @tc.name   openMenuNullContentNode_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENMENU_NULL_0100
        * @tc.desc   Test PromptAction.openMenu with null contentNode parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('openMenuNullContentNode_0100', Level.LEVEL1, async () => {
            console.info('[openMenuNullContentNode_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_openmenu_null_content'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('openmenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[openMenuNullContentNode_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            // .assertEqual('Test Result: openMenu null contentNode: SUCCESS');
            console.info('[openMenuNullContentNode_0100] END');
        })

        /**
        * @tc.name   openMenuUndefinedContentNode_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENMENU_UNDEFINED_0100
        * @tc.desc   Test PromptAction.openMenu with undefined contentNode parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('openMenuUndefinedContentNode_0100', Level.LEVEL1, async () => {
            console.info('[openMenuUndefinedContentNode_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_openmenu_undefined_content'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('openmenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[openMenuUndefinedContentNode_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[openMenuUndefinedContentNode_0100] END');
        })

        /**
        * @tc.name   openMenuNullTarget_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENMENU_NULL_0200
        * @tc.desc   Test PromptAction.openMenu with null target parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('openMenuNullTarget_0100', Level.LEVEL1, async () => {
            console.info('[openMenuNullTarget_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_openmenu_null_target'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('openmenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[openMenuNullTarget_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[openMenuNullTarget_0100] END');
        })

        /**
        * @tc.name   openMenuUndefinedTarget_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENMENU_UNDEFINED_0200
        * @tc.desc   Test PromptAction.openMenu with undefined target parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('openMenuUndefinedTarget_0100', Level.LEVEL1, async () => {
            console.info('[openMenuUndefinedTarget_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_openmenu_undefined_target'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('openmenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[openMenuUndefinedTarget_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[openMenuUndefinedTarget_0100] END');
        })

        /**
        * @tc.name   openMenuNullOptions_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENMENU_NULL_0300
        * @tc.desc   Test PromptAction.openMenu with null options parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('openMenuNullOptions_0100', Level.LEVEL1, async () => {
            console.info('[openMenuNullOptions_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_openmenu_null_options'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('openmenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[openMenuNullOptions_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[openMenuNullOptions_0100] END');
        })

        /**
        * @tc.name   openMenuUndefinedOptions_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_OPENMENU_UNDEFINED_0300
        * @tc.desc   Test PromptAction.openMenu with undefined options parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('openMenuUndefinedOptions_0100', Level.LEVEL1, async () => {
            console.info('[openMenuUndefinedOptions_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_openmenu_undefined_options'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('openmenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[openMenuUndefinedOptions_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[openMenuUndefinedOptions_0100] END');
        })
    }) 
}