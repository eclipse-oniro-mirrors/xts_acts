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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function RichTextJsunit() {
  describe('RichTextJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("RichTextJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichTextPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichTextJsunit state pages: " + JSON.stringify(pages));
        if (!("RichTextPage" == pages.name)) {
          console.info("get RichTextJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichTextJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichTextJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('RichTextJsunit_0100', 0, async (done: Function) => {
      // Get the data of the RichText component
      console.info('[RichTextJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('richText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichTextJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('<h1 style="text-align: center;">h1标题</h1>' +
  '<h1 style="text-align: center;"><i>h1斜体</i></h1>' +
  '<h1 style="text-align: center;"><u>h1下划线</u></h1>' +
  '<h2 style="text-align: center;">h2标题</h2>' +
  '<h3 style="text-align: center;">h3标题</h3>' +
  '<p style="text-align: center;">p常规</p><hr/>' +
  '<div style="width: 500px;height: 500px;border: 1px solid;margin: 0auto;">' +
  '<p style="font-size: 35px;text-align: center;font-weight: bold; color: rgb(24,78,228)">字体大小35px,行高45px</p>' +
  '<p style="background-color: #e5e5e5;line-height: 45px;font-size: 35px;text-indent: 2em;">' +
  '<p>这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字</p>');
      console.info('[RichTextJsunit_0100] END');
      done();
    });

    it('RichTextJsunit_0200', 0, async (done: Function) => {
      // Verify the onStart of the RichText component
      console.info('[RichTextJsunit_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      let textComponent = await driver.findComponent(BY.key('text1'));
      let text = await textComponent.getText();
      expect(text == 'startOn').assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[RichTextJsunit_0200] END');
      done();
    });

    it('RichTextJsunit_0300', 0, async (done: Function) => {
      // Verify the onComplete of the RichText component
      console.info('[RichTextJsunit_0300] START');
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      let textComponent = await driver.findComponent(BY.key('text2'));
      let text = await textComponent.getText();
      expect(text == 'completeOn').assertTrue();
      console.info('[RichTextJsunit_0300] END');
      done();
    });

    it('RichTextJsunit_0400', 0, async (done: Function) => {
      // Modify data of the RichText component
      console.info('[RichTextJsunit_0400] START');
      globalThis.value.message.notify({name:'RichTextData',value:'<h1 style="text-align: center;">h1Test标题</h1>'})
      await CommonFunc.sleep(2000);
      // Get the value of the QRCode component
      let strJson = getInspectorByKey('richText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichTextJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('<h1 style="text-align: center;">h1Test标题</h1>');
      console.info('[RichTextJsunit_0400] END');
      done();
    });

    it('RichTextJsunit_0500', 0, async (done: Function) => {
      // Illegal modification content of the RichText component
      console.info('[RichTextJsunit_0500] START');
      globalThis.value.message.notify({name:'RichTextData',value:1})
      await CommonFunc.sleep(2000);
      // Get the content of the RichText component
      let strJson = getInspectorByKey('richText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichTextJsunit_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('<h1 style="text-align: center;">h1Test标题</h1>');
      console.info('[RichTextJsunit_0500] END');
      done();
    });
  })
}
