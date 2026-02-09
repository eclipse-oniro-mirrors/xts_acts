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
import RectValue from '../../../../ets/MainAbility/common/Rect';
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
let testAbilityContext: common.UIAbilityContext;


export default function scrollByJsunit() {
  describe('scrollByJsunit', () => {
    beforeAll(() => {
      console.info("scrollByJsunit beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("scrollByJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/scrollBy",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get scrollByJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollBy" == pages.name)) {
          console.info("get scrollByJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }

      } catch (err) {
        console.error("push scrollByJsunit page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      // routerInstance.clear()
      console.info("scrollBy after each called");
    });

    

    
    



/**
     * @tc.number   scrollByJsunit_static_0001
     * @tc.name     scrollByJsunit_static_0001
     * @tc.desc     scrollByJsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('scrollByJsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollByJsunit_0000] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'distance', value: 0
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      console.info('[scrollByJsunit_0000] scrollButton = ' + ON.id('scrollButton'));
      let btn = await driver.findComponent(ON.id('scrollButton'));
      console.info('[scrollByJsunit_0000] scrollButton');
      await btn!.click();
      await CommonFunc.sleep(1000);


      let strJson2 = inspector.getInspectorByKey('content00');
      console.info('[scrollByJsunit_0000] content00');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');


      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      console.info('[scrollByJsunit_0000] scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content00');
      console.info('[scrollByJsunit_0000] content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();


      console.info('[scrollByJsunit_0000] END');
      done();
    });
    


    
    



/**
     * @tc.number   scrollByJsunit_static_0002
     * @tc.name     scrollByJsunit_static_0002
     * @tc.desc     scrollByJsunit_static_0002
     * @tc.level    Level.LEVEL0
     */
it('scrollByJsunit_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollByJsunit_0002] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'distance', value: 1500
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      console.info('[scrollByJsunit_0000] scrollButton = ' + ON.id('scrollButton'));
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('content30');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('3');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content30');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();


      console.info('[scrollByJsunit_0002] END');
      done();
    });


    


    
    



/**
     * @tc.number   scrollByJsunit_static_0003
     * @tc.name     scrollByJsunit_static_0003
     * @tc.desc     scrollByJsunit_static_0003
     * @tc.level    Level.LEVEL0
     */
it('scrollByJsunit_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollByJsunit_0003] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'distance', value: -150
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('content00');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();
      console.info('[scrollByJsunit_0003] END');
      done();
    });






/**
     * @tc.number   scrollByJsunit_static_0004
     * @tc.name     scrollByJsunit_static_0004
     * @tc.desc     scrollByJsunit_static_0004
     * @tc.level    Level.LEVEL0
     */
it('scrollByJsunit_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollByJsunit_0004] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'distance', value: UIContext.resolveUIContext()!.px2vp(150)
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('content12');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('1');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content12');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();
      console.info('[scrollByJsunit_0004] END');
      done();
    });






/**
     * @tc.number   scrollByJsunit_static_0005
     * @tc.name     scrollByJsunit_static_0005
     * @tc.desc     scrollByJsunit_static_0005
     * @tc.level    Level.LEVEL0
     */
it('scrollByJsunit_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollByJsunit_0005] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'distance', value: 150
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('content11');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('1');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content11');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollByJsunit_0005] END');
      done();
    });









/**
     * @tc.number   scrollByJsunit_static_0006
     * @tc.name     scrollByJsunit_static_0006
     * @tc.desc     scrollByJsunit_static_0006
     * @tc.level    Level.LEVEL0
     */
it('scrollByJsunit_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollByJsunit_0060] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'distance', value: '50%'
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('content02');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');
      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content02');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollByJsunit_0060] END');
      done();
    });








/**
     * @tc.number   scrollByJsunit_static_0007
     * @tc.name     scrollByJsunit_static_0007
     * @tc.desc     scrollByJsunit_static_0007
     * @tc.level    Level.LEVEL0
     */
it('scrollByJsunit_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollByJsunit_0070] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'distance', value: 'aa50%'
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('content00');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollByJsunit_0070] END');
      done();
    });






/**
     * @tc.number   scrollByJsunit_static_0008
     * @tc.name     scrollByJsunit_static_0008
     * @tc.desc     scrollByJsunit_static_0008
     * @tc.level    Level.LEVEL0
     */
it('scrollByJsunit_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollByJsunit_0080] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'distance', value: 'aa'
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn!.click();

      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('content00');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');


      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();


      console.info('[scrollByJsunit_0080] END');
      done();
    });






/**
     * @tc.number   scrollByJsunit_static_0009
     * @tc.name     scrollByJsunit_static_0009
     * @tc.desc     scrollByJsunit_static_0009
     * @tc.level    Level.LEVEL0
     */
it('scrollByJsunit_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollByJsunit_0090] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'distance', value: 'undefined'
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn!.click();
      await CommonFunc.sleep(100);


      let strJson2 = inspector.getInspectorByKey('content00');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollByJsunit_0090] END');
      done();
    });
  })
}
