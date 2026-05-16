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

export default function tabsAnimationMode() {
  describe('tabsAnimationMode', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsAnimationMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabsAnimationMode',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get tabsAnimationMode state pages: " + JSON.stringify(pages));
        if (!("tabsAnimationMode" == pages.name)) {
          console.info("get tabsAnimationMode state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push tabsAnimationMode page error: " + err);
        expect().assertFail();
      }
    });

    
      
  
/**
     * @tc.number   tabsAnimationMode_static_0100
     * @tc.name     tabsAnimationMode_static_0100
     * @tc.desc     tabsAnimationMode_static_0100
     * @tc.level    Level.LEVEL0
     */
it('tabsAnimationMode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('tabsAnimationMode_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('animationMode_1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[tabsAnimationMode_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[tabsAnimationMode_static_0100] animationMode1: " +
      JSON.stringify(obj1.getElement('$attrs').getString('animationMode')));
      expect(obj1.getElement('$attrs').getString('animationMode')).assertEqual('AnimationMode.CONTENT_FIRST');

      let strJson2 = inspector.getInspectorByKey('animationMode_2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[tabsAnimationMode_static_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('animationMode')).assertEqual('AnimationMode.ACTION_FIRST');

      let strJson3 = inspector.getInspectorByKey('animationMode_3');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[tabsAnimationMode_static_0100] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('animationMode')).assertEqual('AnimationMode.NO_ANIMATION');
      console.info('[tabsAnimationMode_static_0100] END');
      done();
    });

  })
}