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

export default function listSwipe06Jsunit() {
  describe('listSwipe06Test', () => {
    beforeAll(async (): Promise<void> => {
      console.info("listSwipe06Test beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListItem_SwipeActionItem/listTest06"
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("listSwipe06Test success pages " + JSON.stringify(pages));
        routerInstance.pushUrl(options)
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.error("push listSwipe06Test page error: " + err);
      }
    });

    afterEach(async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("listSwipe06Test after each called");
      
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btresetNoBuilder'));
      await CommonFunc.sleep(500);
      buttonReset!.click();
      await CommonFunc.sleep(2000);
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0060
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0060
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0060
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0060 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      
      let strJson = inspector.getInspectorByKey('lSwipeActionNoBuilder0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0060] current component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      
      let ListItem_00: RectValue = CommonFunc.getComponentRect('lSwipeActionNoBuilder0');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom -top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0060 value is" + left + " --" + right + "--" + top + "--" + bottom);
      
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + UIContext.resolveUIContext()!.vp2px(50))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height/2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + UIContext.resolveUIContext()!.vp2px(80))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number  + top + height/2)).toInt()
      );
      await CommonFunc.sleep(4500);
      
      let textSwipeState = inspector.getInspectorByKey('swipeStateNoBuilder');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0060 json is ' + JSON.stringify(JSON.parseJsonElement(textSwipeState).getElement('$attrs')));
      expect(JSON.parseJsonElement(textSwipeState).getElement('$attrs').getString('content')).assertEqual('-1');
      done();
    });


  })
}
