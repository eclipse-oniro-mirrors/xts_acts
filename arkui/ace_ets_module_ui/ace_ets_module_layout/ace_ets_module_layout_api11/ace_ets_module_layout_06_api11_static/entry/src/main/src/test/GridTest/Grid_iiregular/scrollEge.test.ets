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
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function scrollByJsunit() {
  describe('scrollEgeJsunit', () => {
    beforeAll(() => {
      console.info("scrollEgeJsunit beforeAll start");
            
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("scrollEgeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/scrollEge",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get scrollEgeJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollEge" == pages.name)) {
          console.info("get scrollEgeJsunit state pages.name: " + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }

      } catch (err) {
        console.error("push scrollEgeJsunit page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      console.info("List_scrollToIndex1 after each called");
    });


    

    
    



/**
     * @tc.number   scrollEgeJsunit_static_0001
     * @tc.name     scrollEgeJsunit_static_0001
     * @tc.desc     scrollEgeJsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('scrollEgeJsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollEgeJsunit_0001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge1'));
      await btn!.click();
      await CommonFunc.sleep(1000);


      let strJson2 = inspector.getInspectorByKey('text25');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('25');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text25');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.bottom) - Math.round(scrollTextItem.bottom)) <= 1).assertTrue();


      console.info('[scrollEgeJsunit_0001] END');
      done();
    });









/**
     * @tc.number   scrollEgeJsunit_static_0002
     * @tc.name     scrollEgeJsunit_static_0002
     * @tc.desc     scrollEgeJsunit_static_0002
     * @tc.level    Level.LEVEL0
     */
it('scrollEgeJsunit_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollEgeJsunit_0002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge2'));
      await btn!.click();
      await CommonFunc.sleep(1000);


      let strJson2 = inspector.getInspectorByKey('text25');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('25');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text25');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.bottom) - Math.round(scrollTextItem.bottom)) <= 1).assertTrue();


      console.info('[scrollEgeJsunit_0002] END');
      done();
    });










/**
     * @tc.number   scrollEgeJsunit_static_0003
     * @tc.name     scrollEgeJsunit_static_0003
     * @tc.desc     scrollEgeJsunit_static_0003
     * @tc.level    Level.LEVEL0
     */
it('scrollEgeJsunit_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollEgeJsunit_0003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge3'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollEgeJsunit_0003] END');
      done();
    });









/**
     * @tc.number   scrollEgeJsunit_static_0004
     * @tc.name     scrollEgeJsunit_static_0004
     * @tc.desc     scrollEgeJsunit_static_0004
     * @tc.level    Level.LEVEL0
     */
it('scrollEgeJsunit_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollEgeJsunit_0004] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge4'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollEgeJsunit_0004] END');
      done();
    });








/**
     * @tc.number   scrollEgeJsunit_static_0005
     * @tc.name     scrollEgeJsunit_static_0005
     * @tc.desc     scrollEgeJsunit_static_0005
     * @tc.level    Level.LEVEL0
     */
it('scrollEgeJsunit_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollEgeJsunit_0005] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge5'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollEgeJsunit_0005] END');
      done();
    });








/**
     * @tc.number   scrollEgeJsunit_static_0006
     * @tc.name     scrollEgeJsunit_static_0006
     * @tc.desc     scrollEgeJsunit_static_0006
     * @tc.level    Level.LEVEL0
     */
it('scrollEgeJsunit_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollEgeJsunit_0006] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge6'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('text25');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('25');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text25');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.bottom) - Math.round(scrollTextItem.bottom)) <= 1).assertTrue();

      console.info('[scrollEgeJsunit_0006] END');
      done();
    });










/**
     * @tc.number   scrollEgeJsunit_static_0007
     * @tc.name     scrollEgeJsunit_static_0007
     * @tc.desc     scrollEgeJsunit_static_0007
     * @tc.level    Level.LEVEL0
     */
it('scrollEgeJsunit_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollEgeJsunit_0007] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge7'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('text5');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('5');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text5');
      await CommonFunc.sleep(1000);
      console.info('[scrollEgeJsunit_0007] END');
      done();
    });
    


    
    



/**
     * @tc.number   scrollEgeJsunit_static_0008
     * @tc.name     scrollEgeJsunit_static_0008
     * @tc.desc     scrollEgeJsunit_static_0008
     * @tc.level    Level.LEVEL0
     */
it('scrollEgeJsunit_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollEgeJsunit_0008] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge8'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollEgeJsunit_0008] END');
      done();
    });
  })
}
