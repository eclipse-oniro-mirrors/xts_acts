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

export default function onSelectionChange7() {
  describe('onSelectionChange7', function () {
    beforeEach(async function (done) {
      console.info("onSelectionChange7 beforeEach start");
      let options = {
        url: 'MainAbility/pages/onSelectionChange/onSelectionChange7',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange7 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange7" == pages.name)) {
          console.info("get onSelectionChange7 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange7 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange7 page error:" + err);
      }
      console.info("onSelectionChange7 beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange7 after each called");
    });
    /**
     * @tc.number    SUB_ACE_onSelectionChange7_0100
     * @tc.name      testRichEditor
     * @tc.desc      Determine whether the cursor change triggers onSelectionChange
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onSelectionChange7_0100', 0, async function (done) {
      console.info('[onSelectionChange7_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);

      let richEditor = await driver.findComponent(ON.id('onSelectionChange7_RichEditor'));
      await richEditor.click();
      await CommonFunc.sleep(300);
      let btn2 = await driver.findComponent(ON.id('onSelectionChange7_btn2'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let text1_0 = getInspectorByKey('onSelectionChange7_text1');
      let Obj1_0 = JSON.parse(text1_0);
      expect(Obj1_0.$attrs.content).assertEqual('2');
      let text2_0 = getInspectorByKey('onSelectionChange7_text2');
      let Obj2_0 = JSON.parse(text2_0);
      expect(Obj2_0.$attrs.content).assertEqual('83');
      let text3_0 = getInspectorByKey('onSelectionChange7_text3');
      let Obj3_0 = JSON.parse(text3_0);
      expect(Obj3_0.$attrs.content).assertEqual('83');

      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);
      let text1_1 = getInspectorByKey('onSelectionChange7_text1');
      let Obj1_1 = JSON.parse(text1_1);
      expect(Obj1_1.$attrs.content).assertEqual('2');
      let text2_1 = getInspectorByKey('onSelectionChange7_text2');
      let Obj2_1 = JSON.parse(text2_1);
      expect(Obj2_1.$attrs.content).assertEqual('83');
      let text3_1 = getInspectorByKey('onSelectionChange7_text3');
      let Obj3_1 = JSON.parse(text3_1);
      expect(Obj3_1.$attrs.content).assertEqual('83');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);
      let text1_2 = getInspectorByKey('onSelectionChange7_text1');
      let Obj1_2 = JSON.parse(text1_2);
      expect(Obj1_2.$attrs.content).assertEqual('2');
      let text2_2 = getInspectorByKey('onSelectionChange7_text2');
      let Obj2_2 = JSON.parse(text2_2);
      expect(Obj2_2.$attrs.content).assertEqual('83');
      let text3_2 = getInspectorByKey('onSelectionChange7_text3');
      let Obj3_2 = JSON.parse(text3_2);
      expect(Obj3_2.$attrs.content).assertEqual('83');

      await driver.triggerKey(2014);
      await CommonFunc.sleep(1000);
      let text1_3 = getInspectorByKey('onSelectionChange7_text1');
      let Obj1_3 = JSON.parse(text1_3);
      expect(Obj1_3.$attrs.content).assertEqual('3');
      let text2_3 = getInspectorByKey('onSelectionChange7_text2');
      let Obj2_3 = JSON.parse(text2_3);
      expect(Obj2_3.$attrs.content).assertEqual('82');
      let text3_3 = getInspectorByKey('onSelectionChange7_text3');
      let Obj3_3 = JSON.parse(text3_3);
      expect(Obj3_3.$attrs.content).assertEqual('82');

      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);
      let text1_4 = getInspectorByKey('onSelectionChange7_text1');
      let Obj1_4 = JSON.parse(text1_4);
      expect(Obj1_4.$attrs.content).assertEqual('4');
      let text2_4 = getInspectorByKey('onSelectionChange7_text2');
      let Obj2_4 = JSON.parse(text2_4);
      expect(Obj2_4.$attrs.content).assertEqual('83');
      let text3_4 = getInspectorByKey('onSelectionChange7_text3');
      let Obj3_4 = JSON.parse(text3_4);
      expect(Obj3_4.$attrs.content).assertEqual('83');

      await driver.triggerKey(2012);
      await CommonFunc.sleep(1000);
      let text1_5 = getInspectorByKey('onSelectionChange7_text1');
      let Obj1_5 = JSON.parse(text1_5);
      expect(Obj1_5.$attrs.content).assertEqual('5');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);
      let text1_6 = getInspectorByKey('onSelectionChange7_text1');
      let Obj1_6 = JSON.parse(text1_6);
      expect(Obj1_6.$attrs.content).assertEqual('6');

      let btn1 = await driver.findComponent(ON.id('onSelectionChange7_btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text1_7 = getInspectorByKey('onSelectionChange7_text1');
      let Obj1_7 = JSON.parse(text1_7);
      expect(Obj1_7.$attrs.content).assertEqual('7');
      let text2_7 = getInspectorByKey('onSelectionChange7_text2');
      let Obj2_7 = JSON.parse(text2_7);
      expect(Obj2_7.$attrs.content).assertEqual('0');
      let text3_7 = getInspectorByKey('onSelectionChange7_text3');
      let Obj3_7 = JSON.parse(text3_7);
      expect(Obj3_7.$attrs.content).assertEqual('0');

      await driver.triggerKey(2012);
      await CommonFunc.sleep(1000);
      let text1_8 = getInspectorByKey('onSelectionChange7_text1');
      let Obj1_8 = JSON.parse(text1_8);
      expect(Obj1_8.$attrs.content).assertEqual('7');
      let text2_8 = getInspectorByKey('onSelectionChange7_text2');
      let Obj2_8 = JSON.parse(text2_8);
      expect(Obj2_8.$attrs.content).assertEqual('0');
      let text3_8 = getInspectorByKey('onSelectionChange7_text3');
      let Obj3_8 = JSON.parse(text3_8);
      expect(Obj3_8.$attrs.content).assertEqual('0');

      await driver.triggerKey(2014);
      await CommonFunc.sleep(1000);
      let text1_9 = getInspectorByKey('onSelectionChange7_text1');
      let Obj1_9 = JSON.parse(text1_9);
      expect(Obj1_9.$attrs.content).assertEqual('7');
      let text2_9 = getInspectorByKey('onSelectionChange7_text2');
      let Obj2_9 = JSON.parse(text2_9);
      expect(Obj2_9.$attrs.content).assertEqual('0');
      let text3_9 = getInspectorByKey('onSelectionChange7_text3');
      let Obj3_9 = JSON.parse(text3_9);
      expect(Obj3_9.$attrs.content).assertEqual('0');

      console.info('[onSelectionChange7_0100] END');
      done();
    });

  })
}
