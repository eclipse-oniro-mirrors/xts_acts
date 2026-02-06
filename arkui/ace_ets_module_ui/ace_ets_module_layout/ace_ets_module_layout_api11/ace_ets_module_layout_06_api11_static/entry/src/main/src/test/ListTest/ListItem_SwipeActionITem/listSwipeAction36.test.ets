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


export default function listSwipeAction36Jsunit() {
  describe('listSwipeAction36Test', () => {
    beforeAll(async (): Promise<void> => {
      console.info("listSwipeAction36Test beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(1000)

      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListItem_SwipeActionItem/listTest36"
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("listSwipeAction36Test  success pages " + JSON.stringify(pages));
        routerInstance.pushUrl(options)
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push listTest36 page error: " + err);
      }
    });

    afterEach(async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("listSwipeAction36Test after each called");
      
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btreset36'));
      await CommonFunc.sleep(200);
      buttonReset!.click();
      await CommonFunc.sleep(1000);
      done();

    });

    
    
    



/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGEs_static_0360
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGEs_static_0360
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGEs_static_0360
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGEs_static_0360', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('lSwipe36Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGEs_static_0360] current component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));

      let ListItem_00: RectValue = CommonFunc.getComponentRect('lSwipe36Action0');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom - top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGEs_static_0360 value is" + left + " --" + right + "--" +
        top + "--" + bottom);

      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + UIContext.resolveUIContext()!.vp2px(10))).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + UIContext.resolveUIContext()!.vp2px(20))).toInt()
      );
      await CommonFunc.sleep(5000);

      let textSwipeOffset = inspector.getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0340 json is ' +
      JSON.stringify(JSON.parseJsonElement(textSwipeOffset).getElement('$attrs')));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(textSwipeOffset)
        .getElement('$attrs')
        .getString('content')))) <= 1).assertTrue();
      
      let buttonReset2 = await driver.findComponent(ON.id('btreset36'));
      await driver.delayMs(300);
      buttonReset2!.click();
      await CommonFunc.sleep(1000);

      
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + UIContext.resolveUIContext()!.vp2px(100))).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + UIContext.resolveUIContext()!.vp2px(90))).toInt()
      );
      await CommonFunc.sleep(5000);
      let textSwipeOffset2 = inspector.getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGEs_static_0360 json is ' +
      JSON.stringify(JSON.parseJsonElement(textSwipeOffset2).getElement('$attrs')));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(textSwipeOffset2)
        .getElement('$attrs')
        .getString('content')))) <= 1).assertTrue();
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0380
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0380
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0380
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0380', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('lSwipe36Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380] current component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));

      let ListItem_00: RectValue = CommonFunc.getComponentRect('lSwipe36Action0');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom - top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380 value is" + left + " --" + right + "--" +
        top + "--" + bottom);
      

   await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height*0.2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height*0.4)).toInt()
      );
      await CommonFunc.sleep(5000);
      
      let textSwipeOffset = inspector.getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380 json is ' +
      JSON.parseJsonElement(textSwipeOffset).getElement('$attrs').getString('content'));
      let Swipe36Action_swipe: RectValue = CommonFunc.getComponentRect('lSwipe36Row');
      let swipe_height = Swipe36Action_swipe.bottom - Swipe36Action_swipe.top;
      console.info('36 0380 json' + Math.round(UIContext.resolveUIContext()!.px2vp(swipe_height)));
      
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(textSwipeOffset)
        .getElement('$attrs')
        .getString('content'))) - Math.round(UIContext.resolveUIContext()!.px2vp(swipe_height))) <= 1).assertTrue();

   await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height*0.4)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height*0.2)).toInt()
      );
      await CommonFunc.sleep(5000);
      let buttonReset2 = await driver.findComponent(ON.id('btreset36'));
      await driver.delayMs(300);
      buttonReset2!.click();
      await CommonFunc.sleep(3000);

   await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height*0.4)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height*0.2)).toInt()
      );
      await CommonFunc.sleep(4000);
      let textSwipeOffset2 = inspector.getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380 json is ' +
      JSON.parseJsonElement(textSwipeOffset2).getElement('$attrs').getString('content'));
      let Swipe36Action_swipe2: RectValue = CommonFunc.getComponentRect('lSwipe36Row2');
      let swipe_height2 = Swipe36Action_swipe2.bottom - Swipe36Action_swipe2.top;
      console.info('36 0380 json swipe_height2 = ' + UIContext.resolveUIContext()!.px2vp(swipe_height2));
       console.info('36 0380 json content = ' + JSON.parseJsonElement(textSwipeOffset2).getElement('$attrs').getString('content'));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(textSwipeOffset2)
        .getElement('$attrs')
        .getString('content'))) - (-Math.round(UIContext.resolveUIContext()!.px2vp(swipe_height2)))) <= 1).assertTrue();

   await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height*0.2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height*0.4)).toInt()
      );
      await CommonFunc.sleep(2000);
      done();

    });

    
    
    



/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0390
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0390
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0390
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0390', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('lSwipe36Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390] current component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));

      let ListItem_00: RectValue = CommonFunc.getComponentRect('lSwipe36Action0');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom - top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 value is" + left + " --" + right + "--" +
        top + "--" + bottom);
      
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + UIContext.resolveUIContext()!.vp2px(10))).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + UIContext.resolveUIContext()!.vp2px(20))).toInt()
      );
      await CommonFunc.sleep(1000);
      
      let textSwipeOffset0 = inspector.getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 json is ' +
      JSON.stringify(JSON.parseJsonElement(textSwipeOffset0).getElement('$attrs')));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(textSwipeOffset0)
        .getElement('$attrs')
        .getString('content')))) <= 1).assertTrue();
      
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + UIContext.resolveUIContext()!.vp2px(2))).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + bottom - UIContext.resolveUIContext()!.vp2px(2))).toInt()
      );
      await CommonFunc.sleep(5000);

      
      let textSwipeOffset1 = inspector.getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 json is ' +
      JSON.stringify(JSON.parseJsonElement(textSwipeOffset1).getElement('$attrs').getString('content')));
      console.info('36 0380 json' + Math.round(UIContext.resolveUIContext()!.px2vp(height)));

      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(textSwipeOffset1)
        .getElement('$attrs')
        .getString('content')) - Math.round(UIContext.resolveUIContext()!.px2vp(height)))) <= 1).assertTrue();

      let buttonReset2 = await driver.findComponent(ON.id('btreset36'));
      await driver.delayMs(300);
      buttonReset2!.click();
      await CommonFunc.sleep(1000);
      
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + bottom - UIContext.resolveUIContext()!.vp2px(2))).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + UIContext.resolveUIContext()!.vp2px(2))).toInt());
      await CommonFunc.sleep(5000);
      let textSwipeOffset2 = inspector.getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 json is ' +
      JSON.parseJsonElement(textSwipeOffset2).getElement('$attrs').getString('content'));
      console.info('36 0380 json' + Math.round(UIContext.resolveUIContext()!.px2vp(height)));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(textSwipeOffset2)
        .getElement('$attrs')
        .getString('content'))) - (-Math.round(UIContext.resolveUIContext()!.px2vp(height)))) <= 1).assertTrue();
      done();
    });
  })
}
