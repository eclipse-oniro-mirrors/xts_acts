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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
const waitUiReadyMs = 1000;

export default function textAreaUIJsunit() {
  describe('textAreaUIJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("textAreaUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textAreaUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaUIJsunit state pages:" + JSON.stringify(pages));
        if (!("textAreaUI" == pages.name)) {
          console.info("get textAreaUIJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push textAreaUIJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push textAreaUIJsunit page error:" + err);
	  expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   textAreaUIJsunit_0100
     * @tc.number textAreaUIJsunit_0100
     * @tc.desc   textAreaUIJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaUIJsunit_0100', Level.LEVEL0, async (done: Function) => {
       console.info('textAreaUIJsunit_0100');
       await CommonFunc.sleep(1000);
       // get the textArea component and test attribute
       let strJson = getInspectorByKey('textArea');
       let obj: ESObject = JSON.parse(strJson);
       console.info('textAreaUIJsunit_0100 component obj is: ' + obj.$attrs.placeholderFont + "---" + obj.$attrs.text + "--" + obj.$attrs.placeholderColor + "--" + obj.$attrs.placeholder
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

   /**
    * @tc.name   textAreaUIJsunit_0200
    * @tc.number textAreaUIJsunit_0200
    * @tc.desc   textAreaUIJsunit_0200
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('textAreaUIJsunit_0200', Level.LEVEL0, async (done: Function) => {
      console.info('textAreaUIJsunit_0200 START');
      // modify the type attribute normal value of textArea dynamically
      globalThis.value.message.notify({name:'sizeT',value:20})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'weightT',value:300})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaUIJsunit_0200 component obj is: ' + obj.$attrs.placeholderFont);
      expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"20.00fp","weight":"300","fontFamily":"sans-serif"}');
      done();
    });

    /**
     * @tc.name   textAreaUIJsunit_0300
     * @tc.number textAreaUIJsunit_0300
     * @tc.desc   textAreaUIJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaUIJsunit_0300', Level.LEVEL0, async (done: Function) => {
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
      console.info('textAreaUIJsunit_0300 component obj is: ' + obj.$attrs.placeholderFont);
      expect(obj.$attrs.placeholderFont).assertEqual('{"style":"FontStyle.Normal","size":"-30.00fp","fontWeight":"FontWeight.Normal","fontFamily":"sans-serif"}');
      done();   
   });
   
    /**
     * @tc.name   textAreaUIJsunit_0400
     * @tc.number textAreaUIJsunit_0400
     * @tc.desc   textAreaUIJsunit_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaUIJsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('textAreaUIJsunit_0400 START');
      // modify the Color attribute normal value of textArea dynamically
      globalThis.value.message.notify({name:'placeholderColor',value:'#FFFFFF'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'caretColor',value:'#EEFFFF'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaUIJsunit_0400 component obj is: ' + obj.$attrs.placeholderColor + '--' + obj.$attrs.caretColor);
      expect(obj.$attrs.placeholderColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.caretColor).assertEqual('#FFEEFFFF');
      done();   
    });

    /**
     * @tc.name   textAreaUIJsunit_0500
     * @tc.number textAreaUIJsunit_0500
     * @tc.desc   textAreaUIJsunit_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaUIJsunit_0500', Level.LEVEL0, async (done: Function) => {
      console.info('textAreaUIJsunit_0500 START');
      // modify the Color attribute normal value of textArea dynamically
      globalThis.value.message.notify({name:'placeholderColor',value:'rgb(238, 130, 238)'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'caretColor',value:'rgb(238, 131, 233)'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaUIJsunit_0500 component obj is: ' + obj.$attrs.placeholderColor + '--' + obj.$attrs.caretColor);
      expect(obj.$attrs.placeholderColor).assertEqual('#FFEE82EE');
      expect(obj.$attrs.caretColor).assertEqual('#FFEE83E9');
      done(); 
    });

    /**
     * @tc.name   textAreaUIJsunit_0600
     * @tc.number textAreaUIJsunit_0600
     * @tc.desc   textAreaUIJsunit_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaUIJsunit_0600', Level.LEVEL0, async (done: Function) => {
      console.info('textAreaUIJsunit_0600 START');
      // modify the Color attribute normal value of textArea dynamically
      globalThis.value.message.notify({name:'placeholderColor',value:Color.Green})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'caretColor',value:Color.Red})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaUIJsunit_0600 component obj is: ' + obj.$attrs.placeholderColor + '--' + obj.$attrs.caretColor);
      expect(obj.$attrs.placeholderColor).assertEqual('#FF008000');
      expect(obj.$attrs.caretColor).assertEqual('#FFFF0000');
      done(); 
    });
    
   /**
    * @tc.name   textAreaUIJsunit_0700
    * @tc.number textAreaUIJsunit_0700
    * @tc.desc   textAreaUIJsunit_0700
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('textAreaUIJsunit_0700', Level.LEVEL0, async (done: Function) => {
      console.info('textAreaUIJsunit_0700 START');
      // modify the Color attribute illegal value of textArea dynamically
      globalThis.value.message.notify({name:'placeholderColor',value:'#AED'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'caretColor',value:'#ACD'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaUIJsunit_0700 component obj is: ' + obj.$attrs.placeholderColor + '--' + obj.$attrs.caretColor);
      expect(obj.$attrs.placeholderColor).assertEqual('#FFAAEEDD');
      expect(obj.$attrs.caretColor).assertEqual('#FFAACCDD');
      done();   
   });
  
   /**
    * @tc.name   textAreaUIJsunit_0800
    * @tc.number textAreaUIJsunit_0800
    * @tc.desc   textAreaUIJsunit_0800
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('textAreaUIJsunit_0800', Level.LEVEL0, async (done: Function) => {
      console.info('textAreaUIJsunit_0800 START');
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
      console.info('textAreaUIJsunit_0800 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('123');
      done();
    });

    /**
     * @tc.name   textAreaUIJsunit_0900
     * @tc.number textAreaUIJsunit_0900
     * @tc.desc   textAreaUIJsunit_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaUIJsunit_0900', Level.LEVEL0, async (done: Function) => {
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
      console.info('textAreaUIJsunit_0900 component obj is: ' + txt);
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
      console.info('textAreaUIJsunit_0900 text1: ' + text1);
      expect(text1).assertEqual('paste');
      done();     
    });

    /**
     * @tc.name   textAreaUIJsunit_1000
     * @tc.number textAreaUIJsunit_1000
     * @tc.desc   textAreaUIJsunit_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaUIJsunit_1000', Level.LEVEL0, async (done: Function) => {
      console.info('textAreaUIJsunit_1000 START');
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
      console.info('textAreaUIJsunit_1000 component obj is: ' + text);
      expect(text).assertEqual('cut');
      done();     
    });

    /**
     * @tc.name   textAreaUIJsunit_1100
     * @tc.number textAreaUIJsunit_1100
     * @tc.desc   textAreaUIJsunit_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaUIJsunit_1100', Level.LEVEL0, async (done: Function) => {
      console.info('textAreaUIJsunit_1100 START');
      // modify the Color attribute normal value of textArea dynamically
      globalThis.value.message.notify({name:'caretColor',value:'rgba(0, 255, 0, 1)'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaUIJsunit_1100 component obj is: ' + obj.$attrs.placeholderColor + '--' + obj.$attrs.caretColor);
      expect(obj.$attrs.caretColor).assertEqual('#FF00FF00');
      done();
    });

    /**
     * @tc.name   textAreaUIJsunit_1200
     * @tc.number textAreaUIJsunit_1200
     * @tc.desc   textAreaUIJsunit_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaUIJsunit_1200', Level.LEVEL0, async (done: Function) => {
      console.info('textAreaUIJsunit_1200 START');
      // modify the Color attribute normal value of textArea dynamically
      globalThis.value.message.notify({name:'caretColor',value:0xffc0cb})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textAreaUIJsunit_1200 component obj is: ' + obj.$attrs.placeholderColor + '--' + obj.$attrs.caretColor);
      expect(obj.$attrs.caretColor).assertEqual('#FFFFC0CB');
      done(); 
    });

    /**
     * @tc.name   textAreaUIJsunit_1300
     * @tc.number textAreaUIJsunit_1300
     * @tc.desc   textAreaUIJsunit_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaUIJsunit_1300', Level.LEVEL0, async (done: Function) => {
      console.info("[textAreaUIJsunit_1300] start");
      let newJson = getInspectorByKey('textArea');
      console.info("[textAreaUIJsunit_1300]: " + JSON.stringify(newJson));

      let caretColor = $r('sys.color.ohos_id_color_connected');
      globalThis.value.message.notify({
        name: 'caretColor', value: caretColor
      });
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('textArea');
      let strJson2 = getInspectorByKey('textAreaResource');
      console.info("[textAreaUIJsunit_1300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[textAreaUIJsunit_1300111]: " + JSON.stringify(obj.$attrs.caretColor));
      console.info("[textAreaUIJsunit_1300111]: " + JSON.stringify(obj2.$attrs.caretColor));
      expect(obj.$attrs.caretColor).assertEqual(obj2.$attrs.caretColor);
      console.info("[textAreaUIJsunit_1300] end");
      done();
    });
  })
}