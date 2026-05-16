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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function DensityInfo() {
  describe('DensityInfoTest', () => {
    beforeAll(() => {
      console.info("DensityInfoTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.observer12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("DensityInfoTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/DensityInfo',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DensityInfoTest state pages: " + JSON.stringify(pages));
        if (!("DensityInfo" == pages.name)) {
          console.info("get DensityInfoTest state pages.name: " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push DensityInfoTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DensityInfoTest page error: " + err);
        expect().assertFail();
      }
    });
    
    
/**
     * @tc.number   DensityInfoTest_static_0100
     * @tc.name     DensityInfoTest_static_0100
     * @tc.desc     DensityInfoTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('DensityInfoTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('DensityInfoTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('DensityInfo_id'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('DensityInfo_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DensityInfoTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('DensityInfo succ');
      console.info('[DensityInfoTest_0100] END');
      done();
    });
  })
}

