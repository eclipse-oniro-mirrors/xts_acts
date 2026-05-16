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
;
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function listSwipeAction29Jsunit() {
  describe('listSwipeAction29Test', () => {
    beforeAll(async (): Promise<void> => {
      console.info("listSwipeAction29Test beforeEach start");
      await UtilsTest.msSleep(2000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(2000)

      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListItem_SwipeActionItem/listTest29"
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("listSwipeAction29Test  success pages " + JSON.stringify(pages));
        routerInstance.pushUrl(options)
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("push listTest29 page error: " + err);
      }
    });

    afterEach(async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("listSwipeAction29Test after each called");
      
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btreset29'));
      await CommonFunc.sleep(300);
      buttonReset!.click();
      await CommonFunc.sleep(2000);
      done();
    });


    
    
    



/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0290
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0290
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0290
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0290', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0290 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0290 driver' + driver);
      await CommonFunc.sleep(500);
      
      let strJson = inspector.getInspectorByKey('lSwipe29Action0');
      let Swipe29Action: RectValue = CommonFunc.getComponentRect('lSwipe29Action0');
      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0290] current component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      let right: number = Swipe29Action.right;
      let left: number = Swipe29Action.left;
      let top: number = Swipe29Action.top;
      let bottom: number = Swipe29Action.bottom;
      let width = right - left;
      let height = bottom -top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0290 value is" + left + " --" + right + "--" + top + "--" + bottom);
      
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + UIContext.resolveUIContext()!.vp2px(50))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height/2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + UIContext.resolveUIContext()!.vp2px(62))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number  + top + height/2)).toInt()
      );
      await CommonFunc.sleep(1000);
      
      let textSwipeOffset = inspector.getInspectorByKey('swipe29Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0290 json is ' + JSON.stringify(JSON.parseJsonElement(textSwipeOffset).getElement('$attrs')));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(textSwipeOffset).getElement('$attrs').getString('content'))))<=1).assertTrue();
      await CommonFunc.sleep(1000);
      let buttonReset = await driver.findComponent(ON.id('btreset29'));
      await driver.delayMs(300);
      buttonReset!.click();
      await CommonFunc.sleep(1000);
      
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + UIContext.resolveUIContext()!.vp2px(100))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height/2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + UIContext.resolveUIContext()!.vp2px(88))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number  + top + height/2)).toInt()
      );
      await CommonFunc.sleep(1000);
      let textSwipeOffset2 = inspector.getInspectorByKey('swipe29Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0290 json is ' + JSON.stringify(JSON.parseJsonElement(textSwipeOffset2).getElement('$attrs')));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(textSwipeOffset2).getElement('$attrs').getString('content'))))<=1).assertTrue();
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0310
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0310
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0310
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0310', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('lSwipe29Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310] current component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      let Swipe29Action: RectValue = CommonFunc.getComponentRect('lSwipe29Action0');
      let right: number = Swipe29Action.right;
      let left: number = Swipe29Action.left;
      let top: number = Swipe29Action.top;
      let bottom: number = Swipe29Action.bottom;
      let width = right - left;
      let height = bottom -top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let strJsonR = inspector.getInspectorByKey('lSwipe29Row');
      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310R] current component obj is: " + JSON.parseJsonElement(strJsonR).getElement('$attrs').getString('width'));

      
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width*0.2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height/2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width*0.5)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number  + top + height/2)).toInt()
      );
      await CommonFunc.sleep(5000);
      
      let textSwipeOffset = inspector.getInspectorByKey('swipe29Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310 json is ' + JSON.parseJsonElement(textSwipeOffset).getElement('$attrs').getString('content'));
      let Swipe29Action_swipe: RectValue = CommonFunc.getComponentRect('lSwipe29Row');
      let swipe_width = Swipe29Action_swipe.right - Swipe29Action_swipe.left;
      console.info('29 0310 json' + Math.round(UIContext.resolveUIContext()!.px2vp(swipe_width)));
      
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(textSwipeOffset).getElement('$attrs').getString('content')))-Math.round(UIContext.resolveUIContext()!.px2vp(swipe_width)))<=1).assertTrue();
      // reset
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + width*0.2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height/2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + right)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number  + top + height/2)).toInt()
      );
      await CommonFunc.sleep(2000);
      let buttonReset2 = await driver.findComponent(ON.id('btreset29'));
      await driver.delayMs(300);
      buttonReset2!.click();
      await CommonFunc.sleep(4000);

      
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + right - width*0.2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height/2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + right - width*0.5)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number  + top + height/2)).toInt()
      );
      await CommonFunc.sleep(2000);
      let textSwipeOffset2 = inspector.getInspectorByKey('swipe29Offset');
      console.info('29 0310 json2: ' + Math.round(UIContext.resolveUIContext()!.px2vp(swipe_width)));
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310 json is ' + JSON.parseJsonElement(textSwipeOffset2).getElement('$attrs').getString('content'));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(textSwipeOffset2).getElement('$attrs').getString('content')))-(-Math.round(UIContext.resolveUIContext()!.px2vp(swipe_width))))<=1).assertTrue();
      
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + right - width*0.2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height/2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number  + top + height/2)).toInt()
      );
      await CommonFunc.sleep(5000);
      done();
    });


  })
}
