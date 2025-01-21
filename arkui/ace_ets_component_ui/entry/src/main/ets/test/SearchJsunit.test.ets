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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function SearchJsunit() {
  describe('SearchJsunit', function () {
    beforeEach(async function (done) {
      console.info("SearchJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/SearchPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchJsunit state pages: " + JSON.stringify(pages));
        if (!("SearchPage" == pages.name)) {
          console.info("get SearchJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('SearchJsunit_0100', 0, async function (done) {
      // Get the information of the Search component
      console.info('[SearchJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('search');
      let obj = JSON.parse(strJson);
      console.info("[SearchJsunit_0100] component obj is: " + JSON.stringify(obj.inspector));
      console.info("[SearchJsunit_0100] icon: " + JSON.stringify(obj.$attrs.icon));
      console.info("[SearchJsunit_0100] searchButton: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[SearchJsunit_0100] placeholderColor: " + JSON.stringify(obj.$attrs.placeholderColor));
      console.info("[SearchJsunit_0100] value: " + JSON.stringify(obj.$attrs.value));
      console.info("[SearchJsunit_0100] placeholder: " + JSON.stringify(obj.$attrs.placeholder));
      console.info("[SearchJsunit_0100] placeholderFont: " + JSON.stringify(obj.$attrs.placeholderFont));
      console.info("[SearchJsunit_0100] textFont: " + JSON.stringify(obj.$attrs.textFont));
      console.info("[SearchJsunit_0100] textAlign: " + JSON.stringify(obj.$attrs.textAlign));
      console.info("[SearchJsunit_0100] copyOption: " + JSON.stringify(obj.$attrs.copyOption));
      expect(obj.$attrs.icon).assertEqual('resource:///ohos_search.svg');
      expect(obj.$attrs.searchButton).assertEqual('SEARCH');
      expect(obj.$attrs.placeholderColor).assertEqual('#FF808080');
      expect(obj.$attrs.value).assertEqual('');
      expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.$attrs.textFont).assertEqual('{"fontSize":"14.00fp","fontStyle":"FontStyle.Normal","fontWeight":"400","fontFamily":"HarmonyOS Sans"}');
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Start');
      expect(obj.$attrs.copyOption).assertEqual('CopyOptions.InApp');
      expect(obj.$attrs.placeholder).assertEqual('Type to search...');
      console.info('[SearchJsunit_0100] END');
      done();
    });

    it('SearchJsunit_0200', 0, async function (done) {
      // Modify the properties of component Search
      console.info('[SearchJsunit_0200] START');
      await CommonFunc.sleep(500);      
      globalThis.value.message.notify({name:'icon',value:'./resources/base/media/star_3.png'})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'searchButton',value:'search'})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'placeholderColor',value:Color.Green})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'changeValue',value:'hello'})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'placeholder',value:'Type to search...'})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'placeholderFont',value:'{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}'})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'textFont',value:'{"fontSize":"14.00fp","fontStyle":"FontStyle.Normal","fontWeight":"400","fontFamily":"HarmonyOS Sans"}'})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'textAlign',value:TextAlign.Center})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'copyOption',value:CopyOptions.LocalDevice})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'positionValue',value:2})
      await CommonFunc.sleep(2000);

      // Get the properties of the Search component
      let strJson = getInspectorByKey('search');
      let obj = JSON.parse(strJson);
      console.info("[SearchJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[SearchJsunit_0200] icon: " + JSON.stringify(obj.$attrs.icon));
      console.info("[SearchJsunit_0200] searchButton: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[SearchJsunit_0200] placeholderColor: " + JSON.stringify(obj.$attrs.placeholderColor));
      console.info("[SearchJsunit_0200] value: " + JSON.stringify(obj.$attrs.value));
      console.info("[SearchJsunit_0200] placeholder: " + JSON.stringify(obj.$attrs.placeholder));
      console.info("[SearchJsunit_0200] placeholderFont: " + JSON.stringify(obj.$attrs.placeholderFont));
      console.info("[SearchJsunit_0200] textFont: " + JSON.stringify(obj.$attrs.textFont));
      console.info("[SearchJsunit_0200] textAlign: " + JSON.stringify(obj.$attrs.textAlign));
      console.info("[SearchJsunit_0200] copyOption: " + JSON.stringify(obj.$attrs.copyOption));
      //expect(obj.$attrs.icon).assertEqual('./resources/base/media/star_3.png');
      expect(obj.$attrs.searchButton).assertEqual('search');
      expect(obj.$attrs.value).assertEqual('hello');
      expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.$attrs.textFont).assertEqual('{"fontSize":"14.00fp","fontStyle":"FontStyle.Normal","fontWeight":"400","fontFamily":"HarmonyOS Sans"}');
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Center');
      expect(obj.$attrs.copyOption).assertEqual('CopyOptions.Local');
      expect(obj.$attrs.placeholderColor).assertEqual('#FF008000');
      expect(obj.$attrs.placeholder).assertEqual('Type to search...');
      console.info('[SearchJsunit_0200] END');
      done();
    });

    it('SearchJsunit_0300', 0, async function (done) {
      // Verify the functions of the Search component
      console.info('[SearchJsunit_0300] START');
      globalThis.value.message.notify({name:'changeValue',value:''})
      await CommonFunc.sleep(1000);
      
      // Verify the onChange function of the Search component
      let driver = await UiDriver.create()
      let textComponent1 = await driver.findComponent(BY.key('search'));
      await textComponent1.inputText("hello")
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('change');
      let obj1 = JSON.parse(strJson1);
      console.info("[SearchJsunit_0300] obj1: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('onChange:hello');
      await CommonFunc.sleep(1000);

      // Verify the onSubmit function of the Search component
      let textComponent2 = await driver.findComponent(BY.text('search'));
      await textComponent2.click()
      await CommonFunc.sleep(1000);
      console.info("[SearchJsunit_0300] CLICK_SEARCH succ ");
      let strJson2 = getInspectorByKey('submit');
      let obj2 = JSON.parse(strJson2);
      console.info("[SearchJsunit_0300] obj2: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('onSubmit:hello');

      // Verify the onCopy function of the Search component
      await textComponent1.click()
      await textComponent1.longClick()
      await CommonFunc.sleep(1000);
      console.info("[SearchJsunit_0300] first longClick succ ");
      let textComponent3 = await driver.findComponent(BY.text('全选'));
      await textComponent3.click()
      let textComponent4 = await driver.findComponent(BY.text('复制'));
      await textComponent4.click()
      await CommonFunc.sleep(1000);
      console.info("[SearchJsunit_0300] click copy succ ");
      let strJson3 = getInspectorByKey('copy');
      let obj3 = JSON.parse(strJson3);
      console.info("[SearchJsunit_0300] obj3: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('onCopy:hello');

      // Verify the onCut function of the Search component
      await textComponent1.click()
      await textComponent1.longClick()
      await CommonFunc.sleep(1000);
      console.info("[SearchJsunit_0300] secand longClick succ ");
      let textComponent5 = await driver.findComponent(BY.text('全选'));
      await textComponent5.click()
      let textComponent6 = await driver.findComponent(BY.text('剪切'));
      await textComponent6.click()
      await CommonFunc.sleep(1000);
      console.info("[SearchJsunit_0300] click cut succ ");
      let strJson4 = getInspectorByKey('cut');
      let obj4 = JSON.parse(strJson4);
      console.info("[SearchJsunit_0300] obj4: " + JSON.stringify(obj4));
      expect(obj4.$attrs.content).assertEqual('onCut:hello');

      // Verify the onPaste function of the Search component
      await textComponent1.longClick()
      await CommonFunc.sleep(1000);
      let textComponent8 = await driver.findComponent(BY.text('粘贴'));
      await textComponent8.click()
      await CommonFunc.sleep(1000);
      console.info("[SearchJsunit_0300] click paste succ ");
      let strJson5 = getInspectorByKey('paste');
      let obj5 = JSON.parse(strJson5);
      console.info("[SearchJsunit_0300] obj5: " + JSON.stringify(obj5));
      expect(obj5.$attrs.content).assertEqual('onPaste:hello');

      // Verify the caretPosition function of the Search component
      let textComponent7 = await driver.findComponent(BY.key('button'));
      await textComponent7.click();
      await CommonFunc.sleep(1000);
      console.info("[SearchJsunit_0300] click button succ ");
      let strJson6 = getInspectorByKey('button');
      let obj6 = JSON.parse(strJson6);
      console.info("[SearchJsunit_0300] obj6: " + JSON.stringify(obj6));
      expect(obj6.$attrs.label).assertEqual('Set caretPosition 2');
      console.info('[SearchJsunit_0300] END');
      done();
    });

    it('SearchJsunit_0400', 0, async function (done) {
      // Illegal modification of properties of component Search
      console.info('[SearchJsunit_0400] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'icon',value:10})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'searchButton',value:10})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'placeholderColor',value:10})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'changeValue',value:10})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'placeholder',value:168})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'placeholderFont',value:'aaa'})
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'textFont',value:'bbb'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'textAlign',value:'test'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'copyOption',value:10})
      await CommonFunc.sleep(2000);

      // Get the properties of the Search component
      let strJson = getInspectorByKey('search');
      let obj = JSON.parse(strJson);
      console.info("[SearchJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[SearchJsunit_0400] icon: " + JSON.stringify(obj.$attrs.icon));
      console.info("[SearchJsunit_0400] searchButton: " + JSON.stringify(obj.$attrs.searchButton));
      console.info("[SearchJsunit_0400] placeholderColor: " + JSON.stringify(obj.$attrs.placeholderColor));
      console.info("[SearchJsunit_0400] value: " + JSON.stringify(obj.$attrs.value));
      console.info("[SearchJsunit_0400] placeholderFont: " + JSON.stringify(obj.$attrs.placeholderFont));
      console.info("[SearchJsunit_0400] textFont: " + JSON.stringify(obj.$attrs.textFont));
      console.info("[SearchJsunit_0400] textAlign: " + JSON.stringify(obj.$attrs.textAlign));
      console.info("[SearchJsunit_0400] copyOption: " + JSON.stringify(obj.$attrs.copyOption));
      console.info("[SearchJsunit_0400] placeholder: " + JSON.stringify(obj.$attrs.placeholder));
      expect(obj.$attrs.icon).assertEqual('resource:///ohos_search.svg');
      expect(obj.$attrs.searchButton).assertEqual('search');
      expect(obj.$attrs.placeholderColor).assertEqual('#FF00000A');
      expect(obj.$attrs.value).assertEqual('hello');
      expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.$attrs.textFont).assertEqual('{"fontSize":"14.00fp","fontStyle":"FontStyle.Normal","fontWeight":"400","fontFamily":"HarmonyOS Sans"}');
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Start');
      expect(obj.$attrs.copyOption).assertEqual('');
      expect(obj.$attrs.placeholder).assertEqual('Type to search...');
      console.info('[SearchJsunit_0400] END');
      done();
    });
  })
}
