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
import { Driver, ON } from '@ohos.UiTest';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function List_scrollToIndex3() {
  describe('List_scrollToIndex3', () => {
    beforeAll(() => {
      console.info("List_scrollToIndex3 beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("List_scrollToIndex3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/List_scrollToIndex/List_scrollToIndex3",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get List_scrollToIndex3 state pages:" + JSON.stringify(pages));
        if (!("List_scrollToIndex3" == pages.name)) {
          console.info("get List_scrollToIndex3 pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push List_scrollToIndex3 page error:" + err);
      }
      console.info("List_scrollToIndex3 beforeEach end");
    });
    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      routerInstance.back()
      await CommonFunc.sleep(2000);
      console.info("List_scrollToIndex3 after each called");
    });


    
    
    



/**
     * @tc.number   List_scrollToIndex3_static_0100
     * @tc.name     List_scrollToIndex3_static_0100
     * @tc.desc     List_scrollToIndex3_static_0100
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex3_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex3_0100] START');
      let driver = Driver.create();
      let btn = await driver!.findComponent(ON.id('List_scrollToIndex3_visibility'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_List');
      let ListItemGroup: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup.top - List.top) <= 1).assertTrue();
      console.log('------' + Math.round(ListItemGroup.bottom))
      console.log('------' + Math.round(List.top + UIContext.resolveUIContext()!.vp2px(40)))
      expect(Math.abs(Math.round(ListItemGroup.bottom) - Math.round(List.top + UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0100] END');
      done();
    });

    
    
    



/**
     * @tc.number   List_scrollToIndex3_static_0200
     * @tc.name     List_scrollToIndex3_static_0200
     * @tc.desc     List_scrollToIndex3_static_0200
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex3_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex3_0200] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex3_START0'));
      await btn!.click();
      await CommonFunc.sleep(500);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_List');
      let ListItem1: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItem1');
      expect(Math.abs(Math.round(ListItem1.top) - Math.round(List.top + UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] START0 END');

      let btn2 = await driver.findComponent(ON.id('List_scrollToIndex3_CENTER0'));
      await btn2!.click();
      await CommonFunc.sleep(500);
      let ListItem2: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItem1');
      expect(Math.abs(Math.round(ListItem2.top) - Math.round(List.top + UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] CENTER0 END');

      let btn3 = await driver.findComponent(ON.id('List_scrollToIndex3_END0'));
      await btn3!.click();
      await CommonFunc.sleep(500);
      let ListItem3: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItem1');
      expect(Math.abs(Math.round(ListItem3.top) - Math.round(List.top + UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] END0 END');

      let btn4 = await driver.findComponent(ON.id('List_scrollToIndex3_AUTO0'));
      await btn4!.click();
      await CommonFunc.sleep(500);
      let ListItem4: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItem1');
      expect(Math.abs(Math.round(ListItem4.top) - Math.round(List.top + UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] AUTO0 END');

      let btnVisibility = await driver.findComponent(ON.id('List_scrollToIndex3_visibility'));
      await btnVisibility!.click();
      await CommonFunc.sleep(1000);

      let btn22 = await driver.findComponent(ON.id('List_scrollToIndex3_CENTER0'));
      await btn22!.click();
      await CommonFunc.sleep(500);
      let ListItemGroup22: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup22.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] visibility CENTER0 END');

      let btn33 = await driver.findComponent(ON.id('List_scrollToIndex3_END0'));
      await btn33!.click();
      await CommonFunc.sleep(500);
      let ListItemGroup33: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup33.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] visibility END0 END');

      let btn44 = await driver.findComponent(ON.id('List_scrollToIndex3_AUTO0'));
      await btn44!.click();
      await CommonFunc.sleep(500);
      let ListItemGroup44: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup44.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] visibility AUTO0 END');

      let btnScrollBy200 = await driver.findComponent(ON.id('List_scrollToIndex3_scrollBy'));
      await btnScrollBy200!.click();
      await CommonFunc.sleep(1000);

      let btn111 = await driver.findComponent(ON.id('List_scrollToIndex3_START0'));
      await btn111!.click();
      await CommonFunc.sleep(1000);
      let ListItemGroup111: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup111.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] ScrollBy200 START0 END');

      let btn222 = await driver.findComponent(ON.id('List_scrollToIndex3_CENTER0'));
      await btn222!.click();
      await CommonFunc.sleep(500);
      let ListItemGroup222: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup222.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] ScrollBy200 CENTER0 END');

      let btn333 = await driver.findComponent(ON.id('List_scrollToIndex3_END0'));
      await btn333!.click();
      await CommonFunc.sleep(500);
      let ListItemGroup333: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup333.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] ScrollBy200 END0 END');

      let btn444 = await driver.findComponent(ON.id('List_scrollToIndex3_AUTO0'));
      await btn444!.click();
      await CommonFunc.sleep(500);
      let ListItemGroup444: RectValue = CommonFunc.getComponentRect('List_scrollToIndex3_ListItemGroup');
      expect(Math.abs(ListItemGroup444.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex3_0200] ScrollBy200 AUTO0 END');

      console.info('[List_scrollToIndex3_0200] END');
      done();
    });

  })
}