'use static';
/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
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
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function menuBackgroundBlurStyle() {
  describe('menuBackgroundBlurStyle', () => {
    beforeAll(() => {
      console.info("menuBackgroundBlurStyle beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.static", "EntryAbility");

    });
    beforeEach(async (): Promise<void> => {
      console.info("menuBackgroundBlurStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/menuBackgroundBlurStyle',
      }
      try {

        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get menuBackgroundBlurStyle state pages:" + JSON.stringify(pages));
        if (!("menuBackgroundBlurStyle" == pages.name)) {
          console.info("get menuBackgroundBlurStyle pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push menuBackgroundBlurStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuBackgroundBlurStyle page error: " + err);
        expect().assertFail();
      }
      // done();
    });

    
    
    /**
     * @tc.number   menuBackgroundBlurStyle_static_0100
     * @tc.name     menuBackgroundBlurStyle_static_0100
     * @tc.desc     menuBackgroundBlurStyle_static_0100
     * @tc.level    Level.LEVEL1
     */
it('menuBackgroundBlurStyle_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('menuBackgroundBlurStyle_static_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let Select = await driver.findComponent(ON.id('menuBackgroundBlurStyle'));
      await (Select?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('menuBackgroundBlurStyle');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuBackgroundBlurStyle_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[menuBackgroundBlurStyle_static_0100] title: " +
      JSON.stringify(obj.getElement('$attrs').getString('menuBackgroundBlurStyle')));
      expect(obj.getElement('$attrs').getString('menuBackgroundBlurStyle')).assertEqual('BlurStyle.Thin');
      console.info('[menuBackgroundBlurStyle_static_0100] END');
      done();
    });


  })
}

