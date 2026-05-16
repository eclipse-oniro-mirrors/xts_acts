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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import CommonFunc from '../../../../../src/main/ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter'
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { UtilsTest, startAbility,stopApplication } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function RenderNodeInvalidateJsSuit() {
  describe('RenderNodeInvalidateJsSuit', () => {
    beforeAll(() => {
      console.info("RenderNodeInvalidateJsSuit beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("RenderNodeInvalidateJsSuit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RenderNode/RenderNodeInvalidate",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get MarqueeDynamicSyncSceneTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get MarqueeDynamicSyncSceneTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push MarqueeDynamicSyncSceneTest page result:" + JSON.stringify(result));
        }
      } catch (err:Error) {
        console.error("push MarqueeDynamicSyncSceneTest page error:" + err);
      }
      console.info("MarqueeDynamicSyncSceneTest beforeEach end");
    });


    // afterAll(async (): Promise<void> => {
    //   await UtilsTest.msSleep(1000)
    //   stopApplication("com.arkui.ace.imageText.api11.other.static")
    //   await UtilsTest.msSleep(1000)
    // })

    
    
/**
     * @tc.number   RenderNodeInvalidateJsSuit_static_0100
     * @tc.name     RenderNodeInvalidateJsSuit_static_0100
     * @tc.desc     RenderNodeInvalidateJsSuit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('RenderNodeInvalidateJsSuit_static_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('[RenderNodeInvalidateJsSuit_static_0100] START');
      let driver = Driver.create();
      //let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('invalidate_Opacity'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Opacity_reset');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RenderNodeInvalidateJsSuit_static_0100] obj is: " + JSON.stringify(obj));
      console.info("[RenderNodeInvalidateJsSuit_static_0100] obj content is: " +
      JSON.stringify(obj.getElement('$attrs').getString('height')));
      expect(obj.getElement('$attrs').getString('content') == 'statusOpacity:0.5').assertTrue();
      console.info('[RenderNodeInvalidateJsSuit_static_0100] END');
      done();
    });
  })
}