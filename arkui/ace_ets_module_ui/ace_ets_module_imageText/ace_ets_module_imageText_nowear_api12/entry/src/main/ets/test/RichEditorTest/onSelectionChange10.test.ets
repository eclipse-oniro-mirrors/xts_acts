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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';

export default function onSelectionChange10() {
  describe('onSelectionChange10', () => {
    beforeEach(async (done: Function) => {
      console.info("onSelectionChange10 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange10',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange10 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange10" == pages.name)) {
          console.info("get onSelectionChange10 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange10 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange10 page error:" + err);
      }
      console.info("onSelectionChange10 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange10 after each called");
    });
    /**
     * @tc.number    SUB_ACE_onSelectionChange10_0100
     * @tc.name      testRichEditor
     * @tc.desc      Determine whether the cursor change triggers onSelectionChange
     * @tc.level     Level 2
     * @tc.type      Function
     * @tc.size      MediumTest
     */
    it('onSelectionChange10_0100', 0, async (done: Function) => {
      console.info('[onSelectionChange10_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let richEditor = await driver.findComponent(ON.id('onSelectionChange10_RichEditor'));
      await richEditor.click();
      await CommonFunc.sleep(1000);
      await richEditor.longClick();
      await CommonFunc.sleep(2000);

      let text1 = getInspectorByKey('onSelectionChange10_text1');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('2');

      await driver.triggerKey(2017);
	  await driver.triggerKey(2047)
      await CommonFunc.sleep(1000);
      let text2 = getInspectorByKey('onSelectionChange10_text1');
      let Obj2: ESObject = JSON.parse(text2);
      expect(Obj2.$attrs.content).assertEqual('4');

      console.info('[onSelectionChange10_0100] END');
      done();
    });

  })
}
