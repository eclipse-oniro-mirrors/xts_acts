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

export default function List_scrollToIndex2() {
  describe('List_scrollToIndex2', () => {
    beforeAll(() => {
      console.info("List_scrollToIndex2 beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("List_scrollToIndex2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/List_scrollToIndex/List_scrollToIndex2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get List_scrollToIndex2 state pages:" + JSON.stringify(pages));
        if (!("List_scrollToIndex2" == pages.name)) {
          console.info("get List_scrollToIndex2 pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push List_scrollToIndex2 page error:" + err);
      }
      console.info("List_scrollToIndex2 beforeEach end");
    });
    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      routerInstance.back()
      await CommonFunc.sleep(1000);
      console.info("List_scrollToIndex2 after each called");
    });


    
    
    



/**
     * @tc.number   List_scrollToIndex2_static_0100
     * @tc.name     List_scrollToIndex2_static_0100
     * @tc.desc     List_scrollToIndex2_static_0100
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex2_0100] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_to20'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem0');
      expect(Math.abs(ListItem.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0100] END');
      done();
    });

    
    
    



/**
     * @tc.number   List_scrollToIndex2_static_0200
     * @tc.name     List_scrollToIndex2_static_0200
     * @tc.desc     List_scrollToIndex2_static_0200
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex2_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex2_0200] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_to-3'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem0');
      expect(Math.abs(ListItem.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0200] END');
      done();
    });

    
    
    



/**
     * @tc.number   List_scrollToIndex2_static_0300
     * @tc.name     List_scrollToIndex2_static_0300
     * @tc.desc     List_scrollToIndex2_static_0300
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex2_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex2_0300] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_to0'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem0');
      expect(Math.abs(ListItem.top - List.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0300] END');
      done();
    });

    
    
    



/**
     * @tc.number   List_scrollToIndex2_static_0400
     * @tc.name     List_scrollToIndex2_static_0400
     * @tc.desc     List_scrollToIndex2_static_0400
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex2_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex2_0400] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_to9'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem9');
      expect(Math.abs(ListItem.bottom - List.bottom) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem.top) - Math.round(List.bottom - UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0400] END');
      done();
    });

    
    
    



/**
     * @tc.number   List_scrollToIndex2_static_0500
     * @tc.name     List_scrollToIndex2_static_0500
     * @tc.desc     List_scrollToIndex2_static_0500
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex2_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex2_0500] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_AUTO5'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem5');
      expect(Math.abs(ListItem.bottom - List.bottom) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem.top) - Math.round(List.bottom - UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0500] END');
      done();
    });

    
    
    



/**
     * @tc.number   List_scrollToIndex2_static_0600
     * @tc.name     List_scrollToIndex2_static_0600
     * @tc.desc     List_scrollToIndex2_static_0600
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex2_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex2_0600] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_AUTO4'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem4');
      expect(Math.abs(ListItem.bottom - List.bottom) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem.top) - Math.round(List.bottom - UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0600] END');
      done();
    });

    
    
    



/**
     * @tc.number   List_scrollToIndex2_static_0700
     * @tc.name     List_scrollToIndex2_static_0700
     * @tc.desc     List_scrollToIndex2_static_0700
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex2_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex2_0700] START');
      let ListItem1: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem1');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_AUTO1'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let ListItem2: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem1');
      expect(Math.abs(ListItem1.top - ListItem2.top) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0700] END');
      done();
    });

    
    
    



/**
     * @tc.number   List_scrollToIndex2_static_0800
     * @tc.name     List_scrollToIndex2_static_0800
     * @tc.desc     List_scrollToIndex2_static_0800
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex2_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex2_0800] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_CENTER5'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem5');
      expect(Math.abs(Math.round(ListItem.top)-Math.round(List.top + (List.bottom - List.top) / 2 - (ListItem.bottom - ListItem.top) / 2))<=1).assertTrue();
     
      console.info('[List_scrollToIndex2_0800] END');
      done();
    });

    
    
    



/**
     * @tc.number   List_scrollToIndex2_static_0900
     * @tc.name     List_scrollToIndex2_static_0900
     * @tc.desc     List_scrollToIndex2_static_0900
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex2_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex2_0900] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_END5'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem5');
      expect(Math.abs(ListItem.bottom - List.bottom) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem.top) - Math.round(List.bottom - UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_0900] END');
      done();
    });

    
    
    



/**
     * @tc.number   List_scrollToIndex2_static_1000
     * @tc.name     List_scrollToIndex2_static_1000
     * @tc.desc     List_scrollToIndex2_static_1000
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex2_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex2_1000] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex2_START5'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex2_ListItem5');
      expect(Math.abs(ListItem.top - List.top) <= 1).assertTrue();
	  console.info('value1000' + ListItem.bottom +  List.top)
      expect(Math.abs(Math.round(ListItem.bottom) - Math.round(List.top + UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex2_1000] END');
      done();
    });

  })
}