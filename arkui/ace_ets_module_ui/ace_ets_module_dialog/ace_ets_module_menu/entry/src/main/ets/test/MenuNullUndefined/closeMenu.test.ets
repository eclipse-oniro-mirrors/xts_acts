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

export default function closeMenuNullUndefinedTest() {
    describe('closeMenuNullUndefinedTest', () => {
      beforeEach(async (done: Function) => {
        console.info("closeMenuNullUndefinedTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/MenuNullUndefined/closeMenu',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get closeMenuNullUndefinedTest state pages: " + JSON.stringify(pages));
          if (!("closeMenuNullUndefinedTest" == pages.name)) {
            console.info("get closeMenuNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
            let result = await router.push(options);
            await CommonFunc.sleep(2000);
            console.info("push closeMenuNullUndefinedTest success: " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push closeMenuNullUndefinedTest page error: " + err);
          expect().assertFail();
        }
        done();
      });

      /**
        * @tc.name   closeMenuNullContentNode_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_CLOSEMENU_NULL_0100
        * @tc.desc   Test PromptAction.closeMenu with null contentNode parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('closeMenuNullContentNode_0100', Level.LEVEL1, async () => {
            console.info('[closeMenuNullContentNode_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_closemenu_null_content'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('closemenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            expect(resultText).assertContain("SUCCESS");
            console.info('[closeMenuNullContentNode_0100] END');
        })

        /**
        * @tc.name   closeMenuUndefinedContentNode_0100
        * @tc.number SUB_ARKUI_UIContext_PROMPTACTION_CLOSEMENU_UNDEFINED_0100
        * @tc.desc   Test PromptAction.closeMenu with undefined contentNode parameter
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('closeMenuUndefinedContentNode_0100', Level.LEVEL1, async () => {
            console.info('[closeMenuUndefinedContentNode_0100] START');
            await CommonFunc.sleep(1000);
            let driver: Driver = Driver.create();

            const button = await driver.findComponent(ON.id('btn_closemenu_undefined_content'));
            await button.click();
            await CommonFunc.sleep(5000);

            let strJson: string = getInspectorByKey('closemenu_test_result');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            let resultText: string = JSON.stringify(obj.$attrs.content)
            await CommonFunc.sleep(1000);
            console.info("[closeMenuUndefinedContentNode_0100] result: " + resultText);
            expect(resultText).assertContain("SUCCESS");
            console.info('[closeMenuUndefinedContentNode_0100] END');
        })

    }) 
}