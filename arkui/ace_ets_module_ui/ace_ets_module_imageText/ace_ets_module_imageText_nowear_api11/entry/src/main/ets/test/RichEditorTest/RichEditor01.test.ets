/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


export default function RichEditor01() {
  describe('RichEditor01', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor01 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditor01',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor01 state pages: " + JSON.stringify(pages));
        if (!("RichEditor01" == pages.name)) {
          console.info("get RichEditor01 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditor01 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor01 page error: " + err);
        expect().assertFail();
      }
      done();
    });


    //onReady 事件测试
    it('RichEditor01_001', 0, async (done: Function) => {

      await CommonFunc.sleep(1000);
      console.info('[RichEditor01_001] START');

      let strJson = getInspectorByKey('RichEditor01Text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditor01_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      console.info("[obj.$attrs.content] : " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('012345678');

      console.info('[RichEditor01_001] END');
      done();
    });

    //aboutToIMEInput 事件测试
    it('RichEditor01_002', 0, async (done: Function) => {

      console.info('[RichEditor01_002] START');
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('RichEditorKey'));
      await text.inputText('9');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('RichEditor02Text');
      let obj1: ESObject = JSON.parse(strJson1);
      let strJson2 = getInspectorByKey('RichEditor03Text');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RichEditor01_002] component obj is: " + JSON.stringify(obj1));
      console.info("[RichEditor01_002] component obj is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('0');
      expect(obj2.$attrs.content).assertEqual('9');

      console.info('[RichEditor01_002] END');
      done();
    });

    //onIMEInputComplete 事件测试
    it('RichEditor01_003', 0, async (done: Function) => {

      console.info('[RichEditor01_003] START');
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('RichEditorKey'));
      await text.inputText('9');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RichEditor01Text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditor01_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('0,9,0,1,0,1,16');

      console.info('[RichEditor01_003] END');
      done();
    });

    //set setCaretOffset to 6
    it('RichEditor01_004', 0, async (done: Function) => {

      console.info('[RichEditor01_004] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setCaretOffset01'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RichEditor01Text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditor01_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('true');

      console.info('[RichEditor01_004] END');
      done();
    });

    //set setCaretOffset to 100
    it('RichEditor01_005', 0, async (done: Function) => {

      console.info('[RichEditor01_005] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setCaretOffset02'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RichEditor01Text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditor01_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('false');

      console.info('[RichEditor01_005] END');
      done();
    });

    //set setCaretOffset to 100
    it('RichEditor01_006', 0, async (done: Function) => {

      console.info('[RichEditor01_006] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('setCaretOffset01'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('getCaretOffset'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RichEditor01Text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditor01_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('1');

      console.info('[RichEditor01_006] END');
      done();
    });


    //deleteSpans
    // it('RichEditor01_007', 0, async (done: Function) => {
    //
    //   console.info('[RichEditor01_007] START');
    //   await CommonFunc.sleep(1000);
    //   let driver = Driver.create();
    //   let button = await driver.findComponent(ON.id('RichEditor01DelSpans'));
    //   await button.click();
    //   await CommonFunc.sleep(1000);
    //   let button2 = await driver.findComponent(ON.id('RichEditor01GetSpans'));
    //   await button2.click();
    //   await CommonFunc.sleep(1000);
    //
    //   let strJson = getInspectorByKey('RichEditor01Text');
    //   let obj: ESObject = JSON.parse(strJson);
    //   console.info("[RichEditor01_007] component obj is: " + JSON.stringify(obj));
    //   console.info("[obj.$attrs.content] : " + obj.$attrs.content);
    //   await CommonFunc.sleep(1000);
    //   expect(obj.$attrs.content).assertEqual('');
    //
    //   console.info('[RichEditor01_007] END');
    //   done();
    // });








  })
}
