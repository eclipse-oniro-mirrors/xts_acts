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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { BarState, Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function GridJsunit() {
  describe('GridJsunit', () => {
    beforeAll(() => {
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get GridJsunit state pages: " + JSON.stringify(pages));
        if (!("GridPage" == pages.name)) {
          console.info("get GridJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridJsunit page error: " + err);
      }
    });


    
    
    

/**
     * @tc.number   GridJsunit_static_0100
     * @tc.name     GridJsunit_static_0100
     * @tc.desc     GridJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0100] START');
      let strJson1 = inspector.getInspectorByKey('grid1');
      let obj = JSON.parseJsonElement(strJson1);
      console.info("[GridJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('columnsGap')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getString('rowsGap')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getDouble('cachedCount')).assertEqual(1);
      expect(obj.getElement('$attrs').getString('multiSelectable')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('supportAnimation')).assertEqual('false');
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('grid2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Off');
      expect(obj2.getElement('$attrs').getString('scrollBarColor')).assertEqual('#FF808080');
      expect(obj2.getElement('$attrs').getString('scrollBarWidth')).assertEqual('20.00vp');
      console.info('[GridJsunit_static_0100] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0200
     * @tc.name     GridJsunit_static_0200
     * @tc.desc     GridJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0200] START');
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'columnsGap', value: 15.0
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowsGap', value: 20.0
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<BarState>>('messageManager')?.notify({
        name: 'scrollBar', value: BarState.On
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'scrollBarColor', value: 'Color.Blue'
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'scrollBarWidth', value: 30.0
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'cachedCount', value: 2
      })
      await CommonFunc.sleep(2000);

      
      let strJson = inspector.getInspectorByKey('grid1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('columnsGap')).assertEqual('15.00vp');
      expect(obj.getElement('$attrs').getString('rowsGap')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getDouble('cachedCount')).assertEqual(2);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('grid2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridJsunit_static_0200] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('scrollBarColor'))
        .assertEqual(obj.getElement('$attrs').getString('scrollBarColor'));
      expect(obj2.getElement('$attrs').getString('scrollBarWidth')).assertEqual('30.00vp');
      console.info('[GridJsunit_static_0200] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0300
     * @tc.name     GridJsunit_static_0300
     * @tc.desc     GridJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0300] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'columnsGap', value: 0.0
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowsGap', value: -10.0
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<BarState>>('messageManager')?.notify({
        name: 'scrollBar', value: BarState.Auto
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'scrollBarColor', value: 'aaa'
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'scrollBarWidth', value: -10.0
      })
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'cachedCount', value: 1
      })
      await CommonFunc.sleep(200);

      
      let strJson = inspector.getInspectorByKey('grid1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('columnsGap')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('rowsGap')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getDouble('cachedCount')).assertEqual(1);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('grid2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridJsunit_static_0300] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Auto');
      expect(obj2.getElement('$attrs').getString('scrollBarColor'))
        .assertEqual(obj.getElement('$attrs').getString('scrollBarColor'));
      expect(obj2.getElement('$attrs').getString('scrollBarWidth')).assertEqual('4.00vp');
      console.info('[GridJsunit_static_0300] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0400
     * @tc.name     GridJsunit_static_0400
     * @tc.desc     GridJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0400] START');
      await CommonFunc.sleep(1000);

      
      let grid2 = CommonFunc.getComponentRect('grid2');
      let top = grid2.top
      let bottom = grid2.bottom
      let left = grid2.left
      let right = grid2.right
      let driver = Driver.create()

      await driver.swipe((Math.round((right - left) / 2)).toInt(),
        (Math.round(bottom - UIContext.resolveUIContext()!.vp2px(10))).toInt(),
        (Math.round((right - left) / 2)).toInt(),
        (Math.round(top + UIContext.resolveUIContext()!.vp2px(10))).toInt());
      await driver.swipe((Math.round((right - left) / 2)).toInt(),
        (Math.round(bottom - UIContext.resolveUIContext()!.vp2px(10))).toInt(),
        (Math.round((right - left) / 2)).toInt(),
        (Math.round(top + UIContext.resolveUIContext()!.vp2px(10))).toInt());
      await CommonFunc.sleep(2000);
      let onScrollIndex1:Component = await driver.findComponent(ON.id('onScrollIndex')) as Component;
      let text1 = await (onScrollIndex1?.getText() as Promise<string>);
      expect(text1).assertEqual('onScrollIndex:2');
      await CommonFunc.sleep(1000);

      await driver.swipe((Math.round((right - left) / 2)).toInt(),
        (Math.round(bottom - UIContext.resolveUIContext()!.vp2px(10))).toInt(),
        (Math.round((right - left) / 2)).toInt(),
        (Math.round(top + UIContext.resolveUIContext()!.vp2px(10))).toInt());
      await driver.swipe((Math.round((right - left) / 2)).toInt(),
        (Math.round(bottom - UIContext.resolveUIContext()!.vp2px(10))).toInt(),
        (Math.round((right - left) / 2)).toInt(),
        (Math.round(top + UIContext.resolveUIContext()!.vp2px(10))).toInt());
      await CommonFunc.sleep(1000);
      let onScrollIndex2:Component = await driver.findComponent(ON.id('onScrollIndex')) as Component;
      let text2 = await (onScrollIndex2?.getText() as Promise<string>);
      expect(text2).assertEqual('onScrollIndex:2');


      let button:Component = await driver.findComponent(ON.id('button')) as Component;
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('button');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('label')).assertEqual('clicked');
      console.info('[GridJsunit_static_0400] END');
      done();
    });


/**
     * @tc.number   GridJsunit_static_0500
     * @tc.name     GridJsunit_static_0500
     * @tc.desc     GridJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0500] START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('grid_default');
      let obj = JSON.parseJsonElement(strJson1);
      console.info("[GridJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      console.info("[GridJsunit_static_0500] columnsGap: " +
      JSON.stringify(obj.getElement('$attrs').getString('columnsGap')));
      console.info("[GridJsunit_static_0500] rowsGap: " +
      JSON.stringify(obj.getElement('$attrs').getString('rowsGap')));
      console.info("[GridJsunit_static_0500] scrollBar: " +
      JSON.stringify(obj.getElement('$attrs').getString('scrollBar')));
      console.info("[GridJsunit_static_0500] cachedCount: " +
      JSON.stringify(obj.getElement('$attrs').getDouble('cachedCount')));
      console.info("[GridJsunit_static_0500] supportAnimation: " +
      JSON.stringify(obj.getElement('$attrs').getString('supportAnimation')));
      expect(obj.getElement('$attrs').getString('columnsGap')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('rowsGap')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Auto');
      expect(obj.getElement('$attrs').getDouble('cachedCount')).assertEqual(1);
      expect(obj.getElement('$attrs').getString('supportAnimation')).assertEqual('false');
      console.info('[GridJsunit_static_0500] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0600
     * @tc.name     GridJsunit_static_0600
     * @tc.desc     GridJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0600] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'columnsTemplate', value: '1fr 1fr'
      })
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'rowsTemplate', value: '1fr 1fr'
      })
      await CommonFunc.sleep(1000);
      let gridItem1 = CommonFunc.getComponentRect('0');
      let bottom = gridItem1.bottom
      let gridItem2 = CommonFunc.getComponentRect('2');
      let top = gridItem2.top
      expect(top > bottom).assertTrue();

      
      let driver = Driver.create()
      let grid_1 = await driver.findComponent(ON.id('grid1'));
      let result = await (grid_1?.isScrollable() as Promise<boolean>)
      expect(result).assertFalse();
      console.info('[GridJsunit_static_0600] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0700
     * @tc.name     GridJsunit_static_0700
     * @tc.desc     GridJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0700] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'columnsTemplate', value: '1fr 1fr 1fr 1fr'
      })
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'rowsTemplate', value: ''
      })
      await CommonFunc.sleep(1000);
      let gridItem1 = CommonFunc.getComponentRect('0');
      let left1 = gridItem1.left
      let gridItem2 = CommonFunc.getComponentRect('4');
      let left2 = gridItem2.left
      expect(left1).assertEqual(left2);
      console.info('[GridJsunit_static_0700] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0800
     * @tc.name     GridJsunit_static_0800
     * @tc.desc     GridJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0800] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'columnsTemplate', value: ''
      })
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'rowsTemplate', value: '1fr 1fr 1fr 1fr'
      })
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let gridItem1 = CommonFunc.getComponentRect('0');
      let left1 = gridItem1.left
      let gridItem2 = CommonFunc.getComponentRect('1');
      let left2 = gridItem2.left
      expect(Math.round(left1)).assertEqual(Math.round(left2));
      console.info('[GridJsunit_static_0800] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0900
     * @tc.name     GridJsunit_static_0900
     * @tc.desc     GridJsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0900] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'columnsTemplate', value: ''
      })
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'rowsTemplate', value: ''
      })
      await CommonFunc.sleep(1000);
      
      let driver = Driver.create()
      let grid_1 = await driver.findComponent(ON.id('grid1'));
      let result = await (grid_1?.isScrollable() as Promise<boolean>)
      expect(result).assertFalse();
      console.info('[GridJsunit_static_0900] END');
      done();
    });
  })
}
