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

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function menuBackgroundColor() {
  describe('menuBackgroundColor', () => {
    beforeAll(() => {
      console.info("menuBackgroundColor beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.static", "EntryAbility");

    });
    beforeEach(async (): Promise<void> => {
      console.info("menuBackgroundColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/menuBackgroundColor',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get menuBackgroundColor state pages:" + JSON.stringify(pages));
        if (!("menuBackgroundColor" == pages.name)) {
          console.info("get menuBackgroundColor pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push menuBackgroundColor page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuBackgroundColor page error: " + err);
        expect().assertFail();
      }
      // done();
    });

    
    
    /**
     * @tc.number   menuBackgroundColor_static_0100
     * @tc.name     menuBackgroundColor_static_0100
     * @tc.desc     menuBackgroundColor_static_0100
     * @tc.level    Level.LEVEL1
     */
it('menuBackgroundColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('menuBackgroundColor_static_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let Select = await driver.findComponent(ON.id('menuBackgroundColor'));
      await (Select?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('menuBackgroundColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuBackgroundColor_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[menuBackgroundColor_static_0100] title: " +
      JSON.stringify(obj.getElement("$attrs").getString("menuBackgroundColor")));
      expect(obj.getElement("$attrs").getString("menuBackgroundColor")).assertEqual('#FF808080');
      console.info('[menuBackgroundColor_static_0100] END');
      done();
    });


  })
}

