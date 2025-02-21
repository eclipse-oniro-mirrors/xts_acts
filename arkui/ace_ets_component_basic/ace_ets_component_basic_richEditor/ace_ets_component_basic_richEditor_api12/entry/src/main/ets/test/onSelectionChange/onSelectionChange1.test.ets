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
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function onSelectionChange1() {
  describe('onSelectionChange1', function () {
    beforeEach(async function (done) {
      console.info("onSelectionChange1 beforeEach start");
      let options = {
        url: 'MainAbility/pages/onSelectionChange/onSelectionChange1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange1 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange1" == pages.name)) {
          console.info("get onSelectionChange1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange1 page error:" + err);
      }
      console.info("onSelectionChange1 beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange1 after each called");
    });
    /**
     * @tc.number    SUB_ACE_ONSELECTIONCHANGE1_0100
     * @tc.name      testRichEditor
     * @tc.desc      Determine whether the cursor change triggers onSelectionChange
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onSelectionChange1_0100', 0, async function (done) {
      console.info('[onSelectionChange1_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let richEditor = await driver.findComponent(ON.id('onSelectionChange_RichEditor'));
      await richEditor.click();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('onSelectionChange1_btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('onSelectionChange1_text1');
      let Obj1 = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('2');

      let btn2 = await driver.findComponent(ON.id('onSelectionChange1_btn2'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let text2 = getInspectorByKey('onSelectionChange1_text1');
      let Obj2 = JSON.parse(text2);
      expect(Obj2.$attrs.content).assertEqual('3');

      let btn3 = await driver.findComponent(ON.id('onSelectionChange1_btn3'));
      await btn3.click();
      await CommonFunc.sleep(1000);
      let text3 = getInspectorByKey('onSelectionChange1_text1');
      let Obj3 = JSON.parse(text3);
      expect(Obj3.$attrs.content).assertEqual('4');

      console.info('[onSelectionChange1_0100] END');
      done();
    });

  })
}
