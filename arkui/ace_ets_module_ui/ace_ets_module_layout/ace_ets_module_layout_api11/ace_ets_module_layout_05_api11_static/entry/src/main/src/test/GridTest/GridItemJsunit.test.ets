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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
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
let testAbilityContext:common.UIAbilityContext;

export default function GridItemJsunit() {
  describe('GridItemJsunit', () => {
    beforeAll(() => {
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridItemJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridItemPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get GridItemJsunit state pages: " + JSON.stringify(pages));
        if (!("GridItemPage" == pages.name)) {
          console.info("get GridItemJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridItemJsunit page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   GridItemJsunit_static_0100
     * @tc.name     GridItemJsunit_static_0100
     * @tc.desc     GridItemJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('GridItemJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridItemJsunit_static_0100] START');
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('gridItem1');
      let obj = JSON.parseJsonElement(strJson1);
      console.info("[GridItemJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('rowStart')).assertEqual('1');
      expect(obj.getElement('$attrs').getString('rowEnd')).assertEqual('4');
      expect(obj.getElement('$attrs').getString('selectable')).assertEqual('false');
      
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('gridItem2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridItemJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));

      expect(obj2.getElement('$attrs').getString('selectable')).assertEqual('true');
      console.info('[GridItemJsunit_static_0100] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridItemJsunit_static_0200
     * @tc.name     GridItemJsunit_static_0200
     * @tc.desc     GridItemJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('GridItemJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridItemJsunit_static_0200] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'rowStart',value:'2'})
      await CommonFunc.sleep(2000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'rowEnd',value:'5'})
      await CommonFunc.sleep(2000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'selectable',value:'true'})
      await CommonFunc.sleep(2000);

      
      let strJson = inspector.getInspectorByKey('gridItem1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridItemJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('rowStart')).assertEqual('2');
      expect(obj.getElement('$attrs').getString('rowEnd')).assertEqual('5');
      expect(obj.getElement('$attrs').getString('selectable')).assertEqual('true');
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('gridItem2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridItemJsunit_static_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info('[GridItemJsunit_static_0200] END');
      done();
    });
    
    
    

/**
     * @tc.number   GridItemJsunit_static_0300
     * @tc.name     GridItemJsunit_static_0300
     * @tc.desc     GridItemJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('GridItemJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridItemJsunit_static_0300] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'rowStart',value:'test'})
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'rowEnd',value:'#'})
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'selectable',value:'test'})
      await CommonFunc.sleep(2000);

      
      let strJson = inspector.getInspectorByKey('gridItem1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridItemJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      expect(Math.abs(Number(obj.getElement('$attrs').getString('rowStart'))) <= 1).assertTrue();
      expect(Math.abs(Number(obj.getElement('$attrs').getString('rowEnd'))) <= 1).assertTrue();
      expect(obj.getElement('$attrs').getString('selectable')).assertEqual('true');
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('gridItem2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridItemJsunit_static_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info('[GridItemJsunit_static_0300] END');
      done();
    });
    
    
    

/**
     * @tc.number   GridItemJsunit_static_0400
     * @tc.name     GridItemJsunit_static_0400
     * @tc.desc     GridItemJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('GridItemJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridItemJsunit_static_0400] START');
      let grid1 = CommonFunc.getComponentRect('grid1');
      let left_x = Math.round(grid1.left)
      let bottom_y = Math.round(grid1.bottom / 2)
      let driver = Driver.create()

      driver.swipe((Math.round((AppStorage.get<number>("winLeft") ?? 0) + left_x + UIContext.resolveUIContext()!.vp2px(100))).toInt(), (bottom_y).toInt(), (Math.round((AppStorage.get<number>("winLeft") ?? 0) + left_x + UIContext.resolveUIContext()!.vp2px(120))).toInt(), (bottom_y).toInt());
      await CommonFunc.sleep(500);
      let textComponent = await driver.findComponent(ON.id('onSelect'));
      let text = await (textComponent?.getText() as Promise<string>);
      await CommonFunc.sleep(500);
      expect(text).assertEqual('a');
      console.info('[GridItemJsunit_static_0400] END');
      done();
    });
    
    
    

/**
     * @tc.number   GridItemJsunit_static_0500
     * @tc.name     GridItemJsunit_static_0500
     * @tc.desc     GridItemJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('GridItemJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridItemJsunit_static_0500] START');
      let gridItem1 = CommonFunc.getComponentRect('0');
      let right1 = gridItem1.right;
      await CommonFunc.sleep(1000);
      let gridItem3 = CommonFunc.getComponentRect('1');
      let left3 = gridItem3.left;

      expect(Math.abs(Math.ceil(left3 - right1) - Math.ceil(UIContext.resolveUIContext()!.vp2px(4))) <= 1).assertTrue();
      console.info('[GridItemJsunit_static_0500] END');
      done();
    });
    
    
    

/**
     * @tc.number   GridItemJsunit_static_0600
     * @tc.name     GridItemJsunit_static_0600
     * @tc.desc     GridItemJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('GridItemJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridItemJsunit_static_0600] START');
      await CommonFunc.sleep(1000);
      let gridItem1 = CommonFunc.getComponentRect('0');
      let bottom1 = gridItem1.bottom;
      let gridItem3 = CommonFunc.getComponentRect('4');
      let top3 = gridItem3.top;

      expect(Math.abs((top3 - bottom1) - UIContext.resolveUIContext()!.vp2px(5)) <= 1).assertTrue();
      console.info('[GridItemJsunit_static_0600] END');
      done();
    });
    
    
    

/**
     * @tc.number   GridItemJsunit_static_0700
     * @tc.name     GridItemJsunit_static_0700
     * @tc.desc     GridItemJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('GridItemJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridItemJsunit_static_0700] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let gridItem1 = CommonFunc.getComponentRect('gridItem1');
      let right1 = gridItem1.right;
      let gridItem2 = CommonFunc.getComponentRect('0');
      let left1 = gridItem2.left;

	  expect(Math.abs((left1 - right1) - UIContext.resolveUIContext()!.vp2px(4)) <= 1).assertTrue();
      console.info('[GridItemJsunit_static_0700] END');
      done();
    });
    
    
    

/**
     * @tc.number   GridItemJsunit_static_0800
     * @tc.name     GridItemJsunit_static_0800
     * @tc.desc     GridItemJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('GridItemJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridItemJsunit_static_0800] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'rowStart',value:'1'})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'rowEnd',value:'4'})
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let gridItem1 = CommonFunc.getComponentRect('gridItem1');
      let bottom1 = gridItem1.bottom;
      let gridItem2 = CommonFunc.getComponentRect('gridItem3');
      let top1 = gridItem2.top;

      expect(Math.abs((top1 - bottom1) - UIContext.resolveUIContext()!.vp2px(5)) <= 1).assertTrue();
      console.info('[GridItemJsunit_static_0800] END');
      done();
    });

    
  })
}
