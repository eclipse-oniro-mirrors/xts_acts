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


export default function textEnabledJsunit() {
  describe('textEnabledJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("textEnabledJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/textEnabled',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textEnabledJsunit state pages: " + JSON.stringify(pages));
        if (!("textEnabled" == pages.name)) {
          console.info("get textEnabledJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textEnabledJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textEnabledJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('textEnabledJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('textEnabledJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('texEnd1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('texEnd1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textEnabledJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_0100] text1: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("onClick-禁用");
      console.info('[textEnabledJsunit_0100] END');
      done();
    });

    it('textEnabledJsunit_0200', Level.LEVEL1, async (done: Function) => {
      console.info('textEnabledJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('texEnd2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('texEnd2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textEnabledJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_0200] text2: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("onTouch-禁用");
      console.info('[textEnabledJsunit_0200] END');
      done();
    });

    it('textEnabledJsunit_0300', Level.LEVEL1, async (done: Function) => {
      console.info('textEnabledJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('texEnd3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('texEnd3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textEnabledJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_0300] text3: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("onKeyEvent-禁用");
      console.info('[textEnabledJsunit_0300] END');
      done();
    });

    it('textEnabledJsunit_0400', Level.LEVEL1, async (done: Function) => {
      console.info('textEnabledJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('texEnd4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('texEnd4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textEnabledJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_0400] text4: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("鼠标事件onHover-禁用");
      console.info('[textEnabledJsunit_0400] END');
      done();
    });

    it('textEnabledJsunit_0500', Level.LEVEL1, async (done: Function) => {
      console.info('textEnabledJsunit_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('texEnd5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('texEnd5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textEnabledJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_0500] text5: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("鼠标事件onMouse-禁用");
      console.info('[textEnabledJsunit_0500] END');
      done();
    });

    it('textEnabledJsunit_0600', Level.LEVEL1, async (done: Function) => {
      console.info('textEnabledJsunit_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('texEnd6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('texEnd6');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textEnabledJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_0600] text6: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("焦点事件-禁用");
      console.info('[textEnabledJsunit_0600] END');
      done();
    });
  })
}

