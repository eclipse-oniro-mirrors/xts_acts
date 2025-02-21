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
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function TextInputPageJsunit() {
  describe('TextInputPageJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputPageJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputPageJsunit state pages: " + JSON.stringify(pages));
        if (!("TextInputPage" == pages.name)) {
          console.info("get TextInputPageJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputPageJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputPageJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('TextInputPageJsunit_0100', 0, async (done: Function) => {
      // Get the information of the TextInput component
      console.info('[TextInputPageJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textInput');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputPageJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[TextInputPageJsunit_0100] placeholder: " + JSON.stringify(obj.$attrs.placeholder));
      console.info("[TextInputPageJsunit_0100] type: " + JSON.stringify(obj.$attrs.type));
      console.info("[TextInputPageJsunit_0100] placeholderColor: " + JSON.stringify(obj.$attrs.placeholderColor));
      console.info("[TextInputPageJsunit_0100] placeholderFont: " + JSON.stringify(obj.$attrs.placeholderFont));
      console.info("[TextInputPageJsunit_0100] enterKeyType: " + JSON.stringify(obj.$attrs.enterKeyType));
      console.info("[TextInputPageJsunit_0100] caretColor: " + JSON.stringify(obj.$attrs.caretColor));
      console.info("[TextInputPageJsunit_0100] maxLength: " + JSON.stringify(obj.$attrs.maxLength));
      console.info("[TextInputPageJsunit_0100] copyOption: " + JSON.stringify(obj.$attrs.copyOption));
      console.info("[TextInputPageJsunit_0100] showPasswordIcon: " + JSON.stringify(obj.$attrs.showPasswordIcon));
      console.info("[TextInputPageJsunit_0100] style: " + JSON.stringify(obj.$attrs.style));
      console.info("[TextInputPageJsunit_0100] textAlign: " + JSON.stringify(obj.$attrs.textAlign));
      expect(obj.$attrs.placeholder).assertEqual('input your word...');
      expect(obj.$attrs.type).assertEqual('InputType.Email');
      expect(obj.$attrs.placeholderColor).assertEqual('#FF808080');
      expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Search');
      expect(obj.$attrs.caretColor).assertEqual('#FF0000FF');
      expect(obj.$attrs.maxLength).assertEqual('10');
      expect(obj.$attrs.style).assertEqual('TextInputStyle.Default');
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Center');
      expect(obj.$attrs.copyOption).assertEqual('CopyOptions.InApp');
      expect(obj.$attrs.showPasswordIcon).assertEqual(false); 
      console.info('[TextInputPageJsunit_0100] END');
      done();
    });

    it('TextInputPageJsunit_0200', 0, async (done: Function) => {
      // Get default attributes of TextInput component
      console.info('[TextInputPageJsunit_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('input');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputPageJsunit_0200] component obj1 is: " + JSON.stringify(obj));
      console.info("[TextInputPageJsunit_0200] placeholder: " + JSON.stringify(obj.$attrs.placeholder));
      console.info("[TextInputPageJsunit_0200] type: " + JSON.stringify(obj.$attrs.type));
      console.info("[TextInputPageJsunit_0200] placeholderColor: " + JSON.stringify(obj.$attrs.placeholderColor));
      console.info("[TextInputPageJsunit_0200] placeholderFont: " + JSON.stringify(obj.$attrs.placeholderFont));
      console.info("[TextInputPageJsunit_0200] enterKeyType: " + JSON.stringify(obj.$attrs.enterKeyType));
      console.info("[TextInputPageJsunit_0200] caretColor: " + JSON.stringify(obj.$attrs.caretColor));
      console.info("[TextInputPageJsunit_0200] maxLength: " + JSON.stringify(obj.$attrs.maxLength));
      console.info("[TextInputPageJsunit_0200] copyOption: " + JSON.stringify(obj.$attrs.copyOption));
      console.info("[TextInputPageJsunit_0200] showPasswordIcon: " + JSON.stringify(obj.$attrs.showPasswordIcon));
      console.info("[TextInputPageJsunit_0200] style: " + JSON.stringify(obj.$attrs.style));
      console.info("[TextInputPageJsunit_0200] textAlign: " + JSON.stringify(obj.$attrs.textAlign));
      expect(obj.$attrs.placeholder).assertEqual('inline style');
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"16.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Done');
      expect(obj.$attrs.maxLength).assertEqual('INF');
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Start');
      expect(obj.$attrs.showPasswordIcon).assertEqual(true);
      await CommonFunc.sleep(1000);
      console.info('[TextInputPageJsunit_0200] END');
      done();
    });

    it('TextInputPageJsunit_0300', 0, async (done: Function) => {
      // Modify the properties of TextInput component 
      console.info('[TextInputPageJsunit_0300] START');
      globalThis.value.message.notify({name:'placeholder',value:'place input your word...'})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'type',value:InputType.Normal})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'placeholderColor',value:Color.Green})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'placeholderFont',value:{ size: 18, weight: 500 }})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'enterKeyType',value:EnterKeyType.Done})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'caretColor',value:Color.Red})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'maxLength',value:8})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'textAlign',value:TextAlign.Start})
      await CommonFunc.sleep(1000);

      // Get the propoties value of the TextInput component
      let strJson = getInspectorByKey('textInput');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputPageJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[TextInputPageJsunit_0300] placeholder: " + JSON.stringify(obj.$attrs.placeholder));
      console.info("[TextInputPageJsunit_0300] type: " + JSON.stringify(obj.$attrs.type));
      console.info("[TextInputPageJsunit_0300] placeholderColor: " + JSON.stringify(obj.$attrs.placeholderColor));
      console.info("[TextInputPageJsunit_0300] placeholderFont: " + JSON.stringify(obj.$attrs.placeholderFont));
      console.info("[TextInputPageJsunit_0300] enterKeyType: " + JSON.stringify(obj.$attrs.enterKeyType));
      console.info("[TextInputPageJsunit_0300] caretColor: " + JSON.stringify(obj.$attrs.caretColor));
      console.info("[TextInputPageJsunit_0300] maxLength: " + JSON.stringify(obj.$attrs.maxLength));
      console.info("[TextInputPageJsunit_0300] textAlign: " + JSON.stringify(obj.$attrs.textAlign));
      expect(obj.$attrs.placeholder).assertEqual('place input your word...');
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      expect(obj.$attrs.placeholderColor).assertEqual('#FF008000');
      expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"18.00fp","weight":"500","fontFamily":"sans-serif"}');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Done');
      expect(obj.$attrs.caretColor).assertEqual('#FFFF0000');
      expect(obj.$attrs.maxLength).assertEqual('8');
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Start');
      console.info('[TextInputPageJsunit_0300] END');
      done();
    });

    it('TextInputPageJsunit_0400', 0, async (done: Function) => {
      // Verify functions of TextInput component
      console.info('[TextInputPageJsunit_0400] START');

      // Verify change function of the TextInput component
      let driver = await UiDriver.create()
      let textComponent = await driver.findComponent(BY.key('textInput'));
      await textComponent.click()
      await CommonFunc.sleep(500);
      await textComponent.inputText("hello")
      await CommonFunc.sleep(1000);
      let component = await driver.findComponent(BY.key('text'));
      let text = await component.getText();
      expect(text).assertEqual('hello');
      console.info("[TextInputPageJsunit_0400] inputText hello succ !");

      // Verify submit function of TextInput component
      let textComponent1 = await driver.findComponent(BY.key('submit'));
      let text1 = await textComponent1.getText();
      expect(text1).assertEqual('onSubmit:');
      console.info("[TextInputPageJsunit_0400] Verify submit succ !");

      // Verify editChange function of TextInput component
      let textComponent2 = await driver.findComponent(BY.key('editChange'));
      let text2 = await textComponent2.getText();
      expect(text2).assertEqual('onEditChange:true');
      let password = await driver.findComponent(BY.key('password'));
      await password.click()
      await CommonFunc.sleep(1000);
      let textFalse = await textComponent2.getText();
      expect(textFalse).assertEqual('onEditChange:false');
      console.info("[TextInputPageJsunit_0400] Verify editChange succ !");

      // Verify onCopy function of TextInput component
      let driverX = await Driver.create()
      let textInputRect = CommonFunc.getComponentRectOnScreen('textInput')
      let clickX = Math.round((textInputRect.right + textInputRect.left)/2)
      let clickY = Math.round((textInputRect.bottom + textInputRect.top)/2)
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(3000);
      let textComponent3 = await driver.findComponent(BY.text('全选'));
      await textComponent3?.click()
      await CommonFunc.sleep(3000);
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent4 = await driver.findComponent(BY.text('复制'));
      await textComponent4.click()
      await textComponent.click()
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('copy');
      await CommonFunc.sleep(3000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextInputPageJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onCopy:hello');
      console.info("[TextInputPageJsunit_0400] Verify copy succ !");

      // Verify onCut function of TextInput component
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent5 = await driver.findComponent(BY.text('全选'));
      await textComponent5?.click()
      await CommonFunc.sleep(3000);
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent6 = await driver.findComponent(BY.text('剪切'));
      await textComponent6.click()
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('cut');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[TextInputPageJsunit_0400] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('onCut:hello');
      console.info("[TextInputPageJsunit_0400] Verify cut succ !");

      // Verify onPaste function of TextInput component
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent7 = await driver.findComponent(BY.text('粘贴'));
      await textComponent7.click()
      await CommonFunc.sleep(3000);
      let strJson2 = getInspectorByKey('paste');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[TextInputPageJsunit_0400] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('onPaste:hello');
      console.info("[TextInputPageJsunit_0400] Verify paste succ !");
      console.info('[TextInputPageJsunit_0400] END');
      done();
    });
  })
}
