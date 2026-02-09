'use static';
/**
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function scrollByJsunit() {
  describe('scrollToJsunit', () => {
    beforeAll(() => {
      console.info("scrollToJsunit beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("scrollPageJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/scrollTo",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get scrollToJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollTo" == pages.name)) {
          console.info("get scrollToJsunit state pages.name: " + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push scrollToJsunit page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      // routerInstance.clear()
      console.info("Grid_scrollToIndex1 after each called");
    });
    
    
    



/**
     * @tc.number   scrollToJsunit_static_0001
     * @tc.name     scrollToJsunit_static_0001
     * @tc.desc     scrollToJsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('scrollToJsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollToJsunit_0001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo1'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('scrollTo_text1');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('1');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text1');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();


      console.info('[scrollToJsunit_0001] END');
      done();
    });

    
    
    



/**
     * @tc.number   scrollToJsunit_static_0002
     * @tc.name     scrollToJsunit_static_0002
     * @tc.desc     scrollToJsunit_static_0002
     * @tc.level    Level.LEVEL0
     */
it('scrollToJsunit_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollToJsunit_0002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo2'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('scrollTo_text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0002] END');
      done();
    });

    

    
    



/**
     * @tc.number   scrollToJsunit_static_0003
     * @tc.name     scrollToJsunit_static_0003
     * @tc.desc     scrollToJsunit_static_0003
     * @tc.level    Level.LEVEL0
     */
it('scrollToJsunit_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollToJsunit_0003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo3'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('scrollTo_text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0003] END');
      done();
    });








/**
     * @tc.number   scrollToJsunit_static_0004
     * @tc.name     scrollToJsunit_static_0004
     * @tc.desc     scrollToJsunit_static_0004
     * @tc.level    Level.LEVEL0
     */
it('scrollToJsunit_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollToJsunit_0004] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo4'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('scrollTo_text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');


      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0004] END');
      done();
    });








/**
     * @tc.number   scrollToJsunit_static_0005
     * @tc.name     scrollToJsunit_static_0005
     * @tc.desc     scrollToJsunit_static_0005
     * @tc.level    Level.LEVEL0
     */
it('scrollToJsunit_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollToJsunit_0005] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo5'));
      await btn!.click();
      await CommonFunc.sleep(100);

      let strJson2 = inspector.getInspectorByKey('scrollTo_text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0005] END');
      done();
    });







/**
     * @tc.number   scrollToJsunit_static_0006
     * @tc.name     scrollToJsunit_static_0006
     * @tc.desc     scrollToJsunit_static_0006
     * @tc.level    Level.LEVEL0
     */
it('scrollToJsunit_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollToJsunit_0006] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo6'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('scrollTo_text3');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('3');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text3');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0006] END');
      done();
    });








/**
     * @tc.number   scrollToJsunit_static_0007
     * @tc.name     scrollToJsunit_static_0007
     * @tc.desc     scrollToJsunit_static_0007
     * @tc.level    Level.LEVEL0
     */
it('scrollToJsunit_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollToJsunit_0007] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo7'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('scrollTo_text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0007] END');
      done();
    });








/**
     * @tc.number   scrollToJsunit_static_0008
     * @tc.name     scrollToJsunit_static_0008
     * @tc.desc     scrollToJsunit_static_0008
     * @tc.level    Level.LEVEL0
     */
it('scrollToJsunit_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollToJsunit_0008] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo8'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('scrollTo_text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0008] END');
      done();
    });








/**
     * @tc.number   scrollToJsunit_static_0009
     * @tc.name     scrollToJsunit_static_0009
     * @tc.desc     scrollToJsunit_static_0009
     * @tc.level    Level.LEVEL0
     */
it('scrollToJsunit_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollToJsunit_0009] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo9'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('scrollTo_text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0009] END');
      done();
    });

  })
}
