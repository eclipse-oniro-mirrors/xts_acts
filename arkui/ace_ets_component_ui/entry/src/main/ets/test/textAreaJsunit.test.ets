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
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
const waitUiReadyMs = 1000;

export default function textAreaJsunit() {
  describe('textAreaJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("textAreaJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textArea',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaJsunit state pages:" + JSON.stringify(pages));
        if (!("textArea" == pages.name)) {
          console.info("get textAreaJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push textAreaJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push textAreaJsunit page error:" + err);
	  expect().assertFail();
      }
      done();
    });

    it('textAreaJsunit_0100', 0, async (done: Function) => {
       console.info('textAreaJsunit_0100');
       await CommonFunc.sleep(1000);
       // get the textArea component and test attribute
       let strJson = getInspectorByKey('textArea');
       let obj: ESObject = JSON.parse(strJson);
       console.info('textAreaJsunit_0100 component obj is: ' + obj.$attrs.placeholderFont + "---" + obj.$attrs.text + "--" + obj.$attrs.placeholderColor + "--" + obj.$attrs.placeholder
       + "--" + obj.$attrs.textAlign + "--" + obj.$attrs.caretColor + "--" + obj.$attrs.fontSize + "--" + obj.$attrs.inputFilter + "--" + obj.$attrs.copyOption);
       expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"16.00fp","weight":"400","fontFamily":"sans-serif"}');
       expect(obj.$attrs.placeholder).assertEqual('The text area can hold an unlimited amount of text. input your word...');
       expect(obj.$attrs.text).assertEqual('test1');
       expect(obj.$attrs.placeholderColor).assertEqual('#FFAACCEE');
       expect(obj.$attrs.textAlign).assertEqual('TextAlign.End');
       expect(obj.$attrs.caretColor).assertEqual('#FFACDEFF');
       expect(obj.$attrs.fontSize).assertEqual('16.00fp');
       expect(obj.$attrs.copyOption).assertEqual('CopyOptions.Local');
       done();
    });

   it('textAreaJsunit_0200', 0, async (done: Function) => {
      console.info('textAreaJsunit_0200 START');
      // modify the type attribute normal value of textArea dynamically
      globalThis.value.message.notify({name:'sizeT',value:20})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'weightT',value:300})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaJsunit_0200 component obj is: ' + obj.$attrs.placeholderFont);
      expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"20.00fp","weight":"300","fontFamily":"sans-serif"}');
      done();
    });

    it('textAreaJsunit_0300', 0, async (done: Function) => {
      console.info('marqueeJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the type attribute illegal value of textArea dynamically
      globalThis.value.message.notify({name:'sizeT',value:-30})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'weightT',value:-300})
      await CommonFunc.sleep(200);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaJsunit_0300 component obj is: ' + obj.$attrs.placeholderFont);
      expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"-30.00fp","fontWeight":"FontWeight.Normal","fontFamily":"sans-serif"}');
      done();   
   });
   
    it('textAreaJsunit_0400', 0, async (done: Function) => {
      console.info('textAreaJsunit_0400 START');
      // modify the Color attribute normal value of textArea dynamically
      globalThis.value.message.notify({name:'placeholderColor',value:'#FFFFFF'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'caretColor',value:'#EEFFFF'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaJsunit_0400 component obj is: ' + obj.$attrs.placeholderColor + '--' + obj.$attrs.caretColor);
      expect(obj.$attrs.placeholderColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.caretColor).assertEqual('#FFEEFFFF');
      done();   
    });

    it('textAreaJsunit_0500', 0, async (done: Function) => {
      console.info('textAreaJsunit_0500 START');
      // modify the Color attribute normal value of textArea dynamically
      globalThis.value.message.notify({name:'placeholderColor',value:'rgb(238, 130, 238)'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'caretColor',value:'rgb(238, 131, 233)'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaJsunit_0500 component obj is: ' + obj.$attrs.placeholderColor + '--' + obj.$attrs.caretColor);
      expect(obj.$attrs.placeholderColor).assertEqual('#FFEE82EE');
      expect(obj.$attrs.caretColor).assertEqual('#FFEE83E9');
      done(); 
    });

    it('textAreaJsunit_0600', 0, async (done: Function) => {
      console.info('textAreaJsunit_0600 START');
      // modify the Color attribute normal value of textArea dynamically
      globalThis.value.message.notify({name:'placeholderColor',value:Color.Green})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'caretColor',value:Color.Red})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaJsunit_0600 component obj is: ' + obj.$attrs.placeholderColor + '--' + obj.$attrs.caretColor);
      expect(obj.$attrs.placeholderColor).assertEqual('#FF008000');
      expect(obj.$attrs.caretColor).assertEqual('#FFFF0000');
      done(); 
    });
    
   it('textAreaJsunit_0700', 0, async (done: Function) => {
      console.info('textAreaJsunit_0700 START');
      // modify the Color attribute illegal value of textArea dynamically
      globalThis.value.message.notify({name:'placeholderColor',value:'#AED'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'caretColor',value:'#ACD'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaJsunit_0700 component obj is: ' + obj.$attrs.placeholderColor + '--' + obj.$attrs.caretColor);
      expect(obj.$attrs.placeholderColor).assertEqual('#FFAAEEDD');
      expect(obj.$attrs.caretColor).assertEqual('#FFAACCDD');
      done();   
   });
  
   it('textAreaJsunit_0800', 0, async (done: Function) => {
      console.info('textAreaJsunit_0800 START');
      globalThis.value.message.notify({name:'text',value:''})
      await CommonFunc.sleep(1000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      // test the change event
      let text = await driver.findComponent(BY.key('textArea'));
      await text.inputText('123');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('change');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaJsunit_0800 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('123');
      done();
    });

    it('textAreaJsunit_0900', 0, async (done: Function) => {
      console.info('marqueeJsunit_0900 START');
      await CommonFunc.sleep(1000);
      // test the copy event
      let driver = UiDriver.create();
      let driverX = await Driver.create()
      let textAreaRect = CommonFunc.getComponentRectOnScreen('textArea')
      let clickX = Math.round((textAreaRect.right + textAreaRect.left)/2)
      let clickY = Math.round((textAreaRect.bottom + textAreaRect.top)/2)
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let allSelect = await driver.findComponent(BY.text('全选'));
      if (allSelect != null) {
        await allSelect.click();
        await CommonFunc.sleep(1000);
      }
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let copy = await driver.findComponent(BY.text('复制'));
      if (copy != null) {
        await copy.click();
        await CommonFunc.sleep(1000);
      }
      await CommonFunc.sleep(2000);
      let textIn = await driver.findComponent(BY.key('copy'));
      let txt = await textIn.getText();
      console.info('textAreaJsunit_0900 component obj is: ' + txt);
      expect(txt).assertEqual('copy');

      // test the paste event
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let paste = await driver.findComponent(BY.text('粘贴'));
      if (paste != null) {
        await paste.click();
        await CommonFunc.sleep(1000);
      }
      await CommonFunc.sleep(2000);
      let textPaste = await driver.findComponent(BY.key('paste'));
      let text1 = await textPaste.getText();
      console.info('textAreaJsunit_0900 text1: ' + text1);
      expect(text1).assertEqual('paste');
      done();     
    });

    it('textAreaJsunit_1000', 0, async (done: Function) => {
      console.info('textAreaJsunit_1000 START');
      await CommonFunc.sleep(1000);
      // test the cut event
      let driver = UiDriver.create();
      let textArea = await driver.findComponent(BY.key('textArea'));
      await textArea.inputText('123');
      await CommonFunc.sleep(1000);
      let driverX = await Driver.create()
      let textAreaRect = CommonFunc.getComponentRectOnScreen('textArea')
      let clickX = Math.round((textAreaRect.right + textAreaRect.left)/2)
      let clickY = Math.round((textAreaRect.bottom + textAreaRect.top)/2)
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let allSelect = await driver.findComponent(BY.text('全选'));
      if (allSelect != null) {
        await allSelect.click();
        await CommonFunc.sleep(1000);
      }
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let cutComponent = await driver.findComponent(BY.text('剪切'));
      if (cutComponent != null) {
        await cutComponent.click();
        await CommonFunc.sleep(1000);
      }
      await CommonFunc.sleep(2000);
      let textCut = await driver.findComponent(BY.key('cut'));
      let text = await textCut.getText();
      console.info('textAreaJsunit_1000 component obj is: ' + text);
      expect(text).assertEqual('cut');
      done();     
    });
  })
}