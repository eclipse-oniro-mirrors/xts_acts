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
import { BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

let testAbilityContext: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
const waitUiReadyMs = 1000;


export default function ListScrollTest1() {
  describe('ListScrollTest1', () => {

    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ListScrollTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ListScroll',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ListScrollTest state pages: " + JSON.stringify(pages));
        if (!("ListScroll" == pages.name)) {
          console.info("get ListScrollTest state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ListScrollTest page error: " + err);
        expect().assertFail();
      }
    });

    
      
  
/**
     * @tc.number   ListScrollTest1_0100
     * @tc.name     ListScrollTest1_0100
     * @tc.desc     ListScrollTest1_0100
     * @tc.level    Level.LEVEL0
     */
it('ListScrollTest1_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ListScrollTest_0100 START');
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('listScroll_4');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("ListScrollTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width*0.2)).toInt(),(Math.round(bottom - height/4)).toInt(),(Math.round(left + width*0.2)).toInt(),(Math.round(bottom - height/2)).toInt());
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('listScroll_1');
      let strJson1 = inspector.getInspectorByKey('listScroll_2');
      let strJson2 = inspector.getInspectorByKey('listScroll_3');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ListScrollTest_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[ListScrollTest_0100] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      console.info("[ListScrollTest_0100] component obj2 is: " + JSON.stringifyJsonElement(obj2));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onWillScroll');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onDidScroll');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onScrollVisibleContentChange');
      console.info('[ListScrollTest_0100] END');
      done();
    });
  })
}

