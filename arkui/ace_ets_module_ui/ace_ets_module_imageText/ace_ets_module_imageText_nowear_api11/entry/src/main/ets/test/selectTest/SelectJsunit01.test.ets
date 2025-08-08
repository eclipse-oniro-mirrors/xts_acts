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


export default function SelectJsunit01() {
  describe('SelectJsunit01', () => {
    beforeEach(async (done: Function) => {
      console.info("SelectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/SelectPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SelectJsunit state pages: " + JSON.stringify(pages));
        if (!("SelectJsunit01" == pages.name)) {
          console.info("get SelectJsunit01 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SelectJsunit01 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SelectJsunit01 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    SelectJsunit_0100
    * @tc.name      SelectJsunit_0100
    * @tc.desc      set SelectJsunit_0100
    * @tc.level:    Level 0
    * @tc.type :
    * @tc.size :
    */
   it('SelectJsunit_0100', Level.LEVEL0, async (done: Function) => {
      // Illegal modification of properties of component select
      console.info('[SelectJsunit_0400] START');
      globalThis.value.message.notify({name:'optionValue',value:'-20'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'icon',value:'10'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'selected',value:'test'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'selectValue',value:'10'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'selectFont',value:'###'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'fontColor',value:'123'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'selectedOptionBgColor',value:'0'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'selectedOptionFont',value:'%666'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'selectedOptionFontColor',value:'hello'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'optionBgColor',value:'-10'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'optionFont',value:'aaa'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'optionFontColor',value:'123'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'indexValue',value:'bbb'})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the select component
      let strJson = getInspectorByKey('select');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SelectJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.selected).assertEqual('0');
      expect(obj.$attrs.value).assertEqual('10');
      expect(obj.$attrs.font).assertEqual('{"size":"16.00fp","weight":"FontWeight.Medium","family":"","style":"FontStyle.Normal"}');
      expect(obj.$attrs.fontColor).assertEqual('#FF00007B');
      expect(obj.$attrs.selectedOptionBgColor).assertEqual('#FF808080');
      expect(obj.$attrs.selectedOptionFont).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
      expect(obj.$attrs.selectedOptionFontColor).assertEqual('#FFFF0000');
      expect(obj.$attrs.optionBgColor).assertEqual('#FF808080');
      expect(obj.$attrs.optionFont).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
      expect(obj.$attrs.optionFontColor).assertEqual('#FFFF0000');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('indexValue');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SelectJsunit_0400] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('indexValue:0');
      console.info('[SelectJsunit_0400] END');
      done();
    });
  })
}