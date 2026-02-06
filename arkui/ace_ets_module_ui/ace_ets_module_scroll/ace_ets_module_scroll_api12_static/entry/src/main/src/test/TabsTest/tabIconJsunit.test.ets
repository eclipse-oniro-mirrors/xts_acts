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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function tabIconJsunit() {
  describe('tabIconJsunit', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabIconJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabIcon',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get tabIconJsunit state pages: " + JSON.stringify(pages));
        if (!("tabIcon" == pages.name)) {
          console.info("get tabIconJsunit state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabIconJsunit success: ");
        }
      } catch (err) {
        console.error("push tabIconJsunit page error: " + err);
        expect().assertFail();
      }
    });



    
      
  
/**
     * @tc.number   tabIconJsunit_static_0100
     * @tc.name     tabIconJsunit_static_0100
     * @tc.desc     tabIconJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('tabIconJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tabIconJsunit_static_0100 START');

      let strJson = inspector.getInspectorByKey('tabBar_iconStyle');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[tabIconJsunit_static_0100] component obj is: " + strJson);
      console.info("[tabIconJsunit_static_0100] iconStyle: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('tabBar').getElement('iconStyle')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('iconStyle').getString('unselectedColor'))
        .assertEqual("#FFFF0000");
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('iconStyle').getString('selectedColor'))
        .assertEqual("#FF008000");
      console.info('[tabIconJsunit_static_0100] END');
      done();
    });
    
      
  
/**
     * @tc.number   tabIconJsunit_static_0200
     * @tc.name     tabIconJsunit_static_0200
     * @tc.desc     tabIconJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('tabIconJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tabIconJsunit_static_0200 START');
      let swiperTabs = CommonFunc.getComponentRectOnScreen('tabs_iconStyle');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("tabIconJsunit_static_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width * 0.9)).toInt(), (Math.round(bottom - height / 2)).toInt(),
        (Math.round(left + width * 0.1)).toInt(), (Math.round(bottom - height / 2)).toInt());
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('tabIcon_mess1');
      let strJson1 = inspector.getInspectorByKey('tabIcon_mess2');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[tabIconJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[tabIconJsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onWillHide');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onWillShow');
      console.info('[tabIconJsunit_static_0200] END');
      done();
    });
  })
}

