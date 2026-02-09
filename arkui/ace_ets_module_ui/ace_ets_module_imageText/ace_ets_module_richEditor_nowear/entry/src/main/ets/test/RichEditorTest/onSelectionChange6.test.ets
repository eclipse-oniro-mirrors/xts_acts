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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function onSelectionChange6() {
  describe('onSelectionChange6', () => {
    beforeEach(async (done: Function) => {
      console.info("onSelectionChange6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange6 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange6" == pages.name)) {
          console.info("get onSelectionChange6 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange6 page error:" + err);
      }
      console.info("onSelectionChange6 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange6 after each called");
    });
    /**
     * @tc.name   onSelectionChange6_0100
     * @tc.number SUB_ACE_onSelectionChange6_0100
     * @tc.desc   Determine whether the cursor change triggers onSelectionChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('onSelectionChange6_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[onSelectionChange6_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let richEditor = await driver.findComponent(ON.id('onSelectionChange6_RichEditor'));
      await richEditor.click();
      await CommonFunc.sleep(1000);

      let text0 = getInspectorByKey('onSelectionChange6_text1');
      let Obj0: ESObject = JSON.parse(text0);
      expect(Obj0.$attrs.content).assertEqual('1');

      let btn1 = await driver.findComponent(ON.id('onSelectionChange6_btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('onSelectionChange6_text1');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('1');

      let btn2 = await driver.findComponent(ON.id('onSelectionChange6_btn2'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let text2 = getInspectorByKey('onSelectionChange6_text1');
      let Obj2: ESObject = JSON.parse(text2);
      expect(Obj2.$attrs.content).assertEqual('2');

      let btn3 = await driver.findComponent(ON.id('onSelectionChange6_btn3'));
      await btn3.click();
      await CommonFunc.sleep(1000);
      let text3 = getInspectorByKey('onSelectionChange6_text1');
      let Obj3: ESObject = JSON.parse(text3);
      expect(Obj3.$attrs.content).assertEqual('3');

      let btn4 = await driver.findComponent(ON.id('onSelectionChange6_btn4'));
      await btn4.click();
      await CommonFunc.sleep(1000);
      let text4 = getInspectorByKey('onSelectionChange6_text1');
      let Obj4: ESObject = JSON.parse(text4);
      expect(Obj4.$attrs.content).assertEqual('4');

      let btn5 = await driver.findComponent(ON.id('onSelectionChange6_btn5'));
      await btn5.click();
      await CommonFunc.sleep(1000);
      let text5 = getInspectorByKey('onSelectionChange6_text1');
      let Obj5: ESObject = JSON.parse(text5);
      expect(Obj5.$attrs.content).assertEqual('4');

      console.info('[onSelectionChange6_0100] END');
      done();
    });

  })
}
