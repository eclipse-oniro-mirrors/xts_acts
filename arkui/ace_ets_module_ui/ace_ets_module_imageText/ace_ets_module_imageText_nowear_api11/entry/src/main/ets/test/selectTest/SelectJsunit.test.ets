/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function SelectJsunit() {
  describe('SelectJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("SelectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/SelectPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SelectJsunit state pages: " + JSON.stringify(pages));
        if (!("SelectPage" == pages.name)) {
          console.info("get SelectJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SelectJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SelectJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SelectJsunit_0100
     * @tc.number SelectJsunit_0100
     * @tc.desc   SelectJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SelectJsunit_0100', Level.LEVEL0, async (done: Function) => {
      // Get the information of the Select component
      console.info('[SelectJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('select');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SelectJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[SelectJsunit_0100] selected: " + JSON.stringify(obj.$attrs.selected));
      console.info("[SelectJsunit_0100] value: " + JSON.stringify(obj.$attrs.value));
      console.info("[SelectJsunit_0100] font: " + JSON.stringify(obj.$attrs.font));
      console.info("[SelectJsunit_0100] fontColor: " + JSON.stringify(obj.$attrs.fontColor));
      console.info("[SelectJsunit_0100] selectedOptionBgColor: " + JSON.stringify(obj.$attrs.selectedOptionBgColor));
      console.info("[SelectJsunit_0100] selectedOptionFont: " + JSON.stringify(obj.$attrs.selectedOptionFont));
      console.info("[SelectJsunit_0100] selectedOptionFontColor: " + JSON.stringify(obj.$attrs.selectedOptionFontColor));
      console.info("[SelectJsunit_0100] optionBgColor: " + JSON.stringify(obj.$attrs.optionBgColor));
      console.info("[SelectJsunit_0100] optionFont: " + JSON.stringify(obj.$attrs.optionFont));
      console.info("[SelectJsunit_0100] optionFontColor: " + JSON.stringify(obj.$attrs.optionFontColor));
      expect(obj.$attrs.selected).assertEqual('0');
      expect(obj.$attrs.value).assertEqual('SelecteButton');
      expect(obj.$attrs.font).assertEqual('{"size":"16.00fp","weight":"500","family":"","style":"FontStyle.Normal"}');
      expect(obj.$attrs.fontColor).assertEqual('#FF000000');
      expect(obj.$attrs.selectedOptionBgColor).assertEqual('#FF808080');
      expect(obj.$attrs.selectedOptionFont).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
      expect(obj.$attrs.selectedOptionFontColor).assertEqual('#FFFF0000');
      expect(obj.$attrs.optionBgColor).assertEqual('#FF808080');
      expect(obj.$attrs.optionFont).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
      expect(obj.$attrs.optionFontColor).assertEqual('#FFFF0000');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('indexValue');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SelectJsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('indexValue:0');
      console.info('[SelectJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   SelectJsunit_0200
     * @tc.number SelectJsunit_0200
     * @tc.desc   SelectJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SelectJsunit_0200', Level.LEVEL0, async (done: Function) => {
      // Modify the properties of component select
      console.info('[SelectJsunit_0200] START');
      globalThis.value.message.notify({name:'selected',value:2})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'selectValue',value:'testButton'})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'selectFont',value:'{ size: 16, weight: 500 }'})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'selectedOptionBgColor',value:Color.Blue})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'selectedOptionFont',value:'{ size: 16, weight: 400 }'})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'selectedOptionFontColor',value:Color.Yellow})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'optionBgColor',value:Color.Grey})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'optionFont',value:'{ size: 16, weight: 400 }'})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'optionFontColor',value:Color.Red})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'fontColor',value:Color.Green})
      await CommonFunc.sleep(500);

      // Get the propoties value of the select component
      let strJson = getInspectorByKey('select');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SelectJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.selected).assertEqual('2');
      expect(obj.$attrs.value).assertEqual('testButton');
      expect(obj.$attrs.font).assertContain('fp');
      expect(obj.$attrs.font).assertContain('FontWeight');
      expect(obj.$attrs.font).assertContain('FontStyle');
      expect(obj.$attrs.selectedOptionBgColor).assertContain('#');
      expect(obj.$attrs.selectedOptionFont).assertContain('fp');
      expect(obj.$attrs.selectedOptionFont).assertContain('400');
      expect(obj.$attrs.selectedOptionFont).assertContain('FontStyle');
      expect(obj.$attrs.selectedOptionFontColor).assertContain('#');
      expect(obj.$attrs.optionBgColor).assertContain('#');
      expect(obj.$attrs.optionFont).assertContain('fp');
      expect(obj.$attrs.optionFont).assertContain('400');
      expect(obj.$attrs.optionFont).assertContain('FontStyle');
      expect(obj.$attrs.optionFontColor).assertContain('#');
      expect(obj.$attrs.fontColor).assertContain('#');
      await CommonFunc.sleep(1000);
      console.info('[SelectJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   SelectJsunit_0300
     * @tc.number SelectJsunit_0300
     * @tc.desc   SelectJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SelectJsunit_0300', Level.LEVEL0, async (done: Function) => {
      // Verify the functions of the select component
      console.info('[SelectJsunit_0300] START');

      // Verify the click function of the select component
      let driver = await UiDriver.create()
      let textComponent1 = await driver.findComponent(BY.key('select'));
      await textComponent1.click()
      await CommonFunc.sleep(1000);

      // Verify the onSelect function of the select component
      let textMenuComponent = await driver.findComponent(BY.text('bbb'));
      await textMenuComponent.click()
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('indexValue');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SelectJsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('indexValue:1');

      let strJson = getInspectorByKey('select');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SelectJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.value).assertEqual('bbb');
      expect(obj.$attrs.selected).assertEqual('1');
      console.info('[SelectJsunit_0300] END');
      done();
    });
  })
}
