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


export default function buttonEnabledJsunit() {
  describe('buttonEnabledJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("buttonEnabledJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/buttonEnabled',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get buttonEnabledJsunit state pages: " + JSON.stringify(pages));
        if (!("buttonEnabled" == pages.name)) {
          console.info("get buttonEnabledJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push buttonEnabledJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push buttonEnabledJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   buttonEnabledJsunit_0100
     * @tc.number buttonEnabledJsunit_0100
     * @tc.desc   test button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonEnabledJsunit_0100', Level.LEVEL1, async (done: Function) => {

      console.info('buttonEnabledJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btnEnd'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnEnd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[buttonEnabledJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_0100] button1: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("点击事件已触发");
      console.info('[buttonEnabledJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   buttonEnabledJsunit_0200
     * @tc.number buttonEnabledJsunit_0200
     * @tc.desc   test button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonEnabledJsunit_0200', Level.LEVEL1, async (done: Function) => {

      console.info('buttonEnabledJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btnEnd1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnEnd1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[buttonEnabledJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_0200] button1: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("onClick-禁用");
      console.info('[buttonEnabledJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   buttonEnabledJsunit_0300
     * @tc.number buttonEnabledJsunit_0300
     * @tc.desc   test button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonEnabledJsunit_0300', Level.LEVEL1, async (done: Function) => {

      console.info('buttonEnabledJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btnEnd2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnEnd2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[buttonEnabledJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_0300] button2: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("onTouch-禁用");
      console.info('[buttonEnabledJsunit_0300] END');
      done();
    });

    /**
     * @tc.name   buttonEnabledJsunit_0400
     * @tc.number buttonEnabledJsunit_0400
     * @tc.desc   test button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonEnabledJsunit_0400', Level.LEVEL1, async (done: Function) => {

      console.info('buttonEnabledJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btnEnd3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnEnd3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[buttonEnabledJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_0400] button3: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("onKeyEvent-禁用");
      console.info('[buttonEnabledJsunit_0400] END');
      done();
    });

    /**
     * @tc.name   buttonEnabledJsunit_0500
     * @tc.number buttonEnabledJsunit_0500
     * @tc.desc   test button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonEnabledJsunit_0500', Level.LEVEL1, async (done: Function) => {

      console.info('buttonEnabledJsunit_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btnEnd4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnEnd4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[buttonEnabledJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_0500] button4: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("鼠标事件onHover-禁用");
      console.info('[buttonEnabledJsunit_0500] END');
      done();
    });

    /**
     * @tc.name   buttonEnabledJsunit_0600
     * @tc.number buttonEnabledJsunit_0600
     * @tc.desc   test button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonEnabledJsunit_0600', Level.LEVEL1, async (done: Function) => {

      console.info('buttonEnabledJsunit_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btnEnd5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnEnd5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[buttonEnabledJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_0600] button5: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("鼠标事件onMouse-禁用");
      console.info('[buttonEnabledJsunit_0600] END');
      done();
    });

    /**
     * @tc.name   buttonEnabledJsunit_0700
     * @tc.number buttonEnabledJsunit_0700
     * @tc.desc   test button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonEnabledJsunit_0700', Level.LEVEL1, async (done: Function) => {

      console.info('buttonEnabledJsunit_0700 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btnEnd6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnEnd6');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[buttonEnabledJsunit_0700] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_0700] button6: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("焦点事件-禁用");
      console.info('[buttonEnabledJsunit_0700] END');
      done();
    });
  })
}

