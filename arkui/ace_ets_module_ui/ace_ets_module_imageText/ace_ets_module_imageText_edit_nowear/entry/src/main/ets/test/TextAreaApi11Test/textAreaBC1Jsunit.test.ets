/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
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

export default function textAreaBC1Jsunit() {
  describe('textAreaBC1Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("textAreaBC1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi11/textAreaBC1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaBC1Jsunit state pages:" + JSON.stringify(pages));
        if (!("textAreaBC1" == pages.name)) {
          console.info("get textAreaBC1Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textAreaBC1Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaBC1Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   textAreaBC1Jsunit_0100
     * @tc.number SUB_ACE_TS_COMPONENT_SR000HTP2G_011
     * @tc.desc   Move the cursor out of the TextArea component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('textAreaBC1Jsunit_0100', Level.LEVEL3, async (done: Function) => {
      console.info('textAreaBC1Jsunit_0100 START');
      let driver = await UiDriver.create()
      await CommonFunc.sleep(1000);
      let Storage11Button1 = await driver.findComponent(BY.key('textArea1'));
      await Storage11Button1.click();
      await CommonFunc.sleep(1000);
      let Storage12Button1 = await driver.findComponent(BY.key('textArea2'));
      await Storage12Button1.click();
      await CommonFunc.sleep(1000);
      console.info('textAreaBC1Jsunit_0100 Storage12Button1 clicked');
      let strJsont = getInspectorByKey('isEdit');
      let objt: ESObject = JSON.parse(strJsont);
      console.info('textAreaBC1Jsunit_0100 objt is: ' + objt.$attrs.content);
      await CommonFunc.sleep(1000);
      expect(objt.$attrs.content).assertEqual('Nodoing');
      done();
    });

    /**
     * @tc.name   textAreaBC1Jsunit_0200
     * @tc.number SUB_ACE_TS_COMPONENT_SR000HTP2G_005
     * @tc.desc   In the TextArea, delete and add the text content verification effect in the TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('textAreaBC1Jsunit_0200', Level.LEVEL3, async (done: Function) => {
      console.info('textAreaBC1Jsunit_0200 START');
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      // 第一次设置文本
      let text = await driver.findComponent(BY.key('textArea1'));
      await text.inputText('123');
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('change');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('textAreaBC1Jsunit_0200 obj1 is: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('123');
      let strJsont = getInspectorByKey('isEdit');
      let objt: ESObject = JSON.parse(strJsont);
      console.info('textAreaBC1Jsunit_0200 objt is: ' + objt.$attrs.content);
      expect(objt.$attrs.content).assertEqual('doing');
      await CommonFunc.sleep(2000);
      await text.inputText('123456');
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('change');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('textAreaBC1Jsunit_0200 obj2 is: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('123456');
      let strJsont1 = getInspectorByKey('isEdit');
      let objt1: ESObject = JSON.parse(strJsont1);
      console.info('textAreaBC1Jsunit_0200 objt1 is: ' + objt1.$attrs.content);
      expect(objt1.$attrs.content).assertEqual('doing');
      done();
    });

    /**
     * @tc.name   textAreaBC1Jsunit_0300
     * @tc.number SUB_ACE_TS_COMPONENT_SR000HTP2G_004
     * @tc.desc   Set the text color and text size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('textAreaBC1Jsunit_0300', Level.LEVEL3, async (done: Function) => {
      console.info('textAreaBC1Jsunit_0300 START');
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(BY.key('textArea1'));
      await text.inputText('444');
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('change');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('textAreaBC1Jsunit_0300 obj1 is: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('444');
      await CommonFunc.sleep(1000);
      console.info('textAreaBC1Jsunit_0300 START');
      globalThis.value.message.notify({name:'placeholderColor',value:'#FFFFFFFF'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'textColor',value:'#FF66DD00'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'fontSize',value:12})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('textArea1');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info('textAreaBC1Jsunit_0300 lala: ' + obj.$attrs);
      console.info('textAreaBC1Jsunit_0300 obj is: ' + obj.$attrs.placeholderColor + '--' + obj.$attrs.fontColor);
      expect(obj.$attrs.placeholderColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.fontColor).assertEqual('#FF66DD00');
      expect(obj.$attrs.fontSize).assertEqual('12.00fp');
      let strJsontw = getInspectorByKey('isEdit');
      let objtw: ESObject = JSON.parse(strJsontw);
      console.info('textAreaBC1Jsunit_0300 objtw is: ' + objtw.$attrs.content);
      expect(objtw.$attrs.content).assertEqual('doing');
      done();
    });

    /**
     * @tc.name   textAreaBC1Jsunit_0400
     * @tc.number SUB_ACE_TS_COMPONENT_SR000HTP2G_008
     * @tc.desc   Activate the handle inside the textArea component to verify the effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('textAreaBC1Jsunit_0400', Level.LEVEL3, async (done: Function) => {
      console.info('textAreaBC1Jsunit_0400 START');
      let driver = await UiDriver.create()
      let Storage12Button1 = await driver.findComponent(BY.key('textArea1'));
      await CommonFunc.sleep(1000);
      await Storage12Button1.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(BY.key('textArea1'));
      await text.inputText('rrr');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2047)
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('change');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('textAreaBC1Jsunit_0400 obj1 is: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('rrr');
      await CommonFunc.sleep(1000);
      let strJsont = getInspectorByKey('isEdit');
      let objt: ESObject = JSON.parse(strJsont);
      console.info('textAreaBC1Jsunit_0400 objt is: ' + objt.$attrs.content);
      expect(objt.$attrs.content).assertEqual('doing');
      done();
    });

    /**
     * @tc.name   textAreaBC1Jsunit_0500
     * @tc.number SUB_ACE_TS_COMPONENT_SR000HTP2G_001
     * @tc.desc   View the default in the TextArea component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('textAreaBC1Jsunit_0500', Level.LEVEL3, async (done: Function) => {
      console.info('textAreaBC1Jsunit_0500 START');
      let driver = await UiDriver.create()
      let Storage12Button1 = await driver.findComponent(BY.key('textArea1'));
      await CommonFunc.sleep(1000);
      console.log('dududud',Storage12Button1)
      await Storage12Button1.click();
      await CommonFunc.sleep(1000);
      let strJsont = getInspectorByKey('isEdit');
      let objt: ESObject = JSON.parse(strJsont);
      console.info('textAreaBC1Jsunit_0500 objt is: ' + objt.$attrs.content);
      expect(objt.$attrs.content).assertEqual('doing');
      done();
    });

    /**
     * @tc.name   textAreaBC1Jsunit_0600
     * @tc.number SUB_ACE_TS_COMPONENT_SR000HTP2G_006
     * @tc.desc   Raise the handle in the TextArea component and copy and paste the text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('textAreaBC1Jsunit_0600', Level.LEVEL3, async (done: Function) => {
      console.info('textAreaBC1Jsunit_0600 START');
      await CommonFunc.sleep(1000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      let driverX = await Driver.create()
      let textAreaRect = CommonFunc.getComponentRectOnScreen('textArea1')
      let clickX = Math.round((textAreaRect.right + textAreaRect.left)/2)
      let clickY = Math.round((textAreaRect.bottom + textAreaRect.top)/2)
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let allSelect = await driver.findComponent(BY.text('全选'));
      await CommonFunc.sleep(1000);
      console.log('0600allSelectallSelect',allSelect)
      if (allSelect != null) {
        console.log('0600我进来了--全选')
        await allSelect.click();
        await CommonFunc.sleep(1000);
      }
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let copy = await driver.findComponent(BY.text('复制'));
      await CommonFunc.sleep(1000);
      console.log('0600allSelectallSelect复制',copy)
      if (copy != null) {
        console.log('0600我进来了--复制')
        await copy.click();
        await CommonFunc.sleep(1000);
      }
      let textIn = await driver.findComponent(BY.key('copy'));
      await CommonFunc.sleep(1000);
      let txt = await textIn.getText();
      await CommonFunc.sleep(1000);
      console.info('textAreaBC1Jsunit_0600 component obj is: ' + txt);
      expect(txt).assertEqual('copy');
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let paste = await driver.findComponent(BY.text('粘贴'));
      if (paste != null) {
        await paste.click();
        await CommonFunc.sleep(1000);
      }
      let textPaste = await driver.findComponent(BY.key('paste'));
      let text1 = await textPaste.getText();
      console.info('textAreaJsunit_0900 text1: ' + text1);
      expect(text1).assertEqual('paste');
      done();
    });

    /**
     * @tc.name   textAreaBC1Jsunit_0700
     * @tc.number SUB_ACE_TS_COMPONENT_SR000HTP2G_003
     * @tc.desc   Cut text in the TextArea component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('textAreaBC1Jsunit_0700', Level.LEVEL3, async (done: Function) => {
      console.info('textAreaBC1Jsunit_0700 START');
      await CommonFunc.sleep(1000);
      let driver = UiDriver.create();
      let textArea = await driver.findComponent(BY.key('textArea1'));
      await textArea.inputText('123');
      await CommonFunc.sleep(1000);
      let driverX = await Driver.create()
      let textAreaRect = CommonFunc.getComponentRectOnScreen('textArea1')
      let clickX = Math.round((textAreaRect.right + textAreaRect.left)/2)
      let clickY = Math.round((textAreaRect.bottom + textAreaRect.top)/2)
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let allSelect = await driver.findComponent(BY.text('全选'));
      await CommonFunc.sleep(2000);
      if (allSelect != null) {
        await allSelect.click();
        await CommonFunc.sleep(1000);
      }
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let cutComponent = await driver.findComponent(BY.text('剪切'));
      await CommonFunc.sleep(2000);
      if (cutComponent != null) {
        await cutComponent.click();
        await CommonFunc.sleep(1000);
      }
      let textCut = await driver.findComponent(BY.key('cut_textAreaBC1'));
      let text = await textCut.getText();
      console.info('textAreaBC1Jsunit_0700 component obj is: ' + text);
      expect(text).assertEqual('cut');
      done();
    });
    /**
     * @tc.name   textAreaBC1Jsunit_0800
     * @tc.number SUB_ACE_TS_COMPONENT_SR000HTP2G_002
     * @tc.desc   Move position within the textArea by hand keyboard and mouse in the TextArea component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('textAreaBC1Jsunit_0800', Level.LEVEL2, async (done: Function) => {
      let driver = await UiDriver.create()
      let text = await driver.findComponent(BY.key('textArea1'));
      await text.inputText('ee');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2047)
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('change');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('textAreaBC1Jsunit_0800 obj1 is: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('ee');
      await CommonFunc.sleep(1000);
      let y = await driver.findComponent(BY.key('button1'));
      await y.click();
      await CommonFunc.sleep(1000);
      let strJsont = getInspectorByKey('isEdit');
      let objt: ESObject = JSON.parse(strJsont);
      console.info('textAreaBC1Jsunit_0800 objt is: ' + objt.$attrs.content);
      expect(objt.$attrs.content).assertEqual('doing');
      done();
    });

    /**
     * @tc.name   textAreaBC1Jsunit_0900
     * @tc.number SUB_ACE_TS_COMPONENT_SR000HTP2G_012
     * @tc.desc   Move position inside the textArea by hand keyboard and mouse outside the TextArea component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('textAreaBC1Jsunit_0900', Level.LEVEL3, async (done: Function) => {
      let driver = await UiDriver.create()
      let text = await driver.findComponent(BY.key('textArea2'));
      await text.inputText('yy');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2047)
      await CommonFunc.sleep(1000);
      let y = await driver.findComponent(BY.key('button2'));
      await y.click();
      await CommonFunc.sleep(1000);
      let strJsont = getInspectorByKey('isEdit');
      let objt: ESObject = JSON.parse(strJsont);
      console.info('textAreaBC1Jsunit_0900 objt is: ' + objt.$attrs.content);
      expect(objt.$attrs.content).assertEqual('Nodoing');
      done();
    });
  })
}