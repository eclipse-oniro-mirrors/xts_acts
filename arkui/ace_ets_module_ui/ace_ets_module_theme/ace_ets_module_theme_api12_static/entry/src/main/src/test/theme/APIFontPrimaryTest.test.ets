'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import Utils from '../../../ets/MainAbility/common/Utils';
export default function APIFontPrimaryTest() {
  describe('APIFontPrimaryTest', () => {
    beforeAll(() => {
      console.info("APIFontPrimaryTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.theme.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("APIFontPrimaryTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/theme/APIFontPrimary',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router" ) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get APIFontPrimaryTest state pages:" + JSON.stringify(pages));
        if (!("APIFontPrimary" == pages.name)) {
          console.info("get APIFontPrimaryTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push APIFontPrimaryTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIFontPrimaryTest page error:" + err);
      }
      console.info("APIFontPrimaryTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(2000);
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_0100
     * @tc.name     APIFontPrimaryTest_static_0100
     * @tc.desc     APIFontPrimaryTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('c');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await Utils.sleep(1000);
      console.log("++++++++++++++APIFontPrimaryTest_static_0100button " + button);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text02');
      
      console.info("[APIFontPrimaryTest_static_0100] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_0100] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_0100] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_0200
     * @tc.name     APIFontPrimaryTest_static_0200
     * @tc.desc     APIFontPrimaryTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_0200 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text03');
      
      console.info("[APIFontPrimaryTest_static_0200] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_0200] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_0200] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_0300
     * @tc.name     APIFontPrimaryTest_static_0300
     * @tc.desc     APIFontPrimaryTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_0300 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text04');
      
      console.info("[APIFontPrimaryTest_static_0300] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_0300] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_0300] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_0400
     * @tc.name     APIFontPrimaryTest_static_0400
     * @tc.desc     APIFontPrimaryTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_0400 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text05');
      
      console.info("[APIFontPrimaryTest_static_0400] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_0400] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_0400] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_0500
     * @tc.name     APIFontPrimaryTest_static_0500
     * @tc.desc     APIFontPrimaryTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_0500 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text06');
      
      console.info("[APIFontPrimaryTest_static_0500] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_0500] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_0500] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_0600
     * @tc.name     APIFontPrimaryTest_static_0600
     * @tc.desc     APIFontPrimaryTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_0600 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text07');
      
      console.info("[APIFontPrimaryTest_static_0600] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_0600] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_0600] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_0700
     * @tc.name     APIFontPrimaryTest_static_0700
     * @tc.desc     APIFontPrimaryTest_static_0700
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_0700 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text08');
      
      console.info("[APIFontPrimaryTest_static_0700] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_0700] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_0700] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_0800
     * @tc.name     APIFontPrimaryTest_static_0800
     * @tc.desc     APIFontPrimaryTest_static_0800
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_0800 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text09');
      
      console.info("[APIFontPrimaryTest_static_0800] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_0800] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_0800] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_0900
     * @tc.name     APIFontPrimaryTest_static_0900
     * @tc.desc     APIFontPrimaryTest_static_0900
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_0900 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text10');
      
      console.info("[APIFontPrimaryTest_static_0900] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_0900] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_0900] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_1000
     * @tc.name     APIFontPrimaryTest_static_1000
     * @tc.desc     APIFontPrimaryTest_static_1000
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_1000 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
      await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text11');
      
      console.info("[APIFontPrimaryTest_static_1000] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_1000] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_1000] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_1100
     * @tc.name     APIFontPrimaryTest_static_1100
     * @tc.desc     APIFontPrimaryTest_static_1100
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_1100 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text12');
      
      console.info("[APIFontPrimaryTest_static_1100] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_1100] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_1100] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_1200
     * @tc.name     APIFontPrimaryTest_static_1200
     * @tc.desc     APIFontPrimaryTest_static_1200
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_1200 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text13');
      
      console.info("[APIFontPrimaryTest_static_1200] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_1200] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_1200] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_1300
     * @tc.name     APIFontPrimaryTest_static_1300
     * @tc.desc     APIFontPrimaryTest_static_1300
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_1300 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text14');
      
      console.info("[APIFontPrimaryTest_static_1300] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_1300] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_1300] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_1400
     * @tc.name     APIFontPrimaryTest_static_1400
     * @tc.desc     APIFontPrimaryTest_static_1400
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_1400 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text15');
      
      console.info("[APIFontPrimaryTest_static_1400] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_1400] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_1400] END');
      done();
    });
    


/**
     * @tc.number   APIFontPrimaryTest_static_1500
     * @tc.name     APIFontPrimaryTest_static_1500
     * @tc.desc     APIFontPrimaryTest_static_1500
     * @tc.level    Level.LEVEL0
     */
it('APIFontPrimaryTest_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('APIFontPrimaryTest_static_1500 START');
      let driver = Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('APIFontPrimary_Button'));
  await Utils.sleep(1000);
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIFontPrimary_Text16');
      
      console.info("[APIFontPrimaryTest_static_1500] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[APIFontPrimaryTest_static_1500] component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[APIFontPrimaryTest_static_1500] END');
      done();
    });
  })
}