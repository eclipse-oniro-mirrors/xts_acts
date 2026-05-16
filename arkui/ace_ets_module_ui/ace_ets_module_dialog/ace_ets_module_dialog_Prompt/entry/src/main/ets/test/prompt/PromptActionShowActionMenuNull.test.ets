/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import promptAction from '@ohos.promptAction';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function PromptActionShowActionMenuNullTest() {

  beforeEach(async (done: Function) => {
    console.info('PromptActionShowActionMenuNullTest beforeEach start');
    let options: router.RouterOptions = {
      url: 'MainAbility/pages/promptAction/PromptActionShowActionMenuNullTest',
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info('get PromptActionShowActionMenuNullTest state pages:' + JSON.stringify(pages));
      if (!('PromptActionShowActionMenuNullTest' == pages.name)) {
        console.info('get PromptActionShowActionMenuNullTest pages.name:' + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2500);
        console.info('push PromptActionShowActionMenuNullTest page result:' + JSON.stringify(result));
      }
    } catch (err) {
      console.error('push PromptActionShowActionMenuNullTest page error:' + err);
    }
    console.info('PromptActionShowActionMenuNullTest beforeEach end');
    done();
  });

  /**
   * @tc.name   showActionMenuNullOptions_0100
   * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_NULL_0100
   * @tc.desc   Test promptAction.showActionMenu with null options parameter
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('showActionMenuNullOptions_0100', Level.LEVEL1, async () => {
    console.info('[showActionMenuNullOptions_0100] START');
    await CommonFunc.sleep(1000);
    let driver = await Driver.create()

    const button = await driver.findComponent(ON.id('btn_actionmenu_null'));
    await button.click();
    await CommonFunc.sleep(1000);

    let strJson: string = getInspectorByKey('actionmenu_test_result');
    let obj: Record<string, ESObject> = JSON.parse(strJson);
    let resultText: string = JSON.stringify(obj.$attrs.content)

    console.info("[showActionMenuNullOptions_0100] result: " + resultText);
    expect(resultText).assertEqual('Test Result: showActionMenu null: FAILED');
    console.info('[showActionMenuNullOptions_0100] END');
  })

  /**
   * @tc.name   showActionMenuUndefinedOptions_0100
   * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_UNDEFINED_0100
   * @tc.desc   Test promptAction.showActionMenu with undefined options parameter
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('showActionMenuUndefinedOptions_0100', Level.LEVEL1, async () => {
    console.info('[showActionMenuUndefinedOptions_0100] START');
    await CommonFunc.sleep(1000);
    let driver: Driver = Driver.create();

    const button = await driver.findComponent(ON.id('btn_actionmenu_undefined'));
    await button.click();
    await CommonFunc.sleep(1000);

    let strJson: string = getInspectorByKey('actionmenu_test_result');
    let obj: Record<string, ESObject> = JSON.parse(strJson);
    let resultText: string = JSON.stringify(obj.$attrs.content)

    console.info("[showActionMenuUndefinedOptions_0100] result: " + resultText);
    expect(resultText).assertEqual('Test Result: showActionMenu undefined: FAILED');
    console.info('[showActionMenuUndefinedOptions_0100] END');
  })

}
