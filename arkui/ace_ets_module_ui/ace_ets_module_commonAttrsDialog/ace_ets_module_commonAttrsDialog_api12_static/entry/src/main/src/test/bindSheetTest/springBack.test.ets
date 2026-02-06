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
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
// import { vp2px } from '@ohos.arkui.component'
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

// const uiContext = new UIContext();

export default function springBack() {
  describe('springBack', () => {
    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("springBack beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/bindSheet/springBack',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get springBack state pages:" + JSON.stringify(pages));
        if (!("springBack" == pages.name)) {
          console.info("get springBack pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push springBack page error:" + err);
      }
      console.info("springBack beforeEach end");
    });

    
    
    /**
     * @tc.number   springBack_static_0100
     * @tc.name     springBack_static_0100
     * @tc.desc     springBack_static_0100
     * @tc.level    Level.LEVEL0
     */
it('springBack_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('springBack_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('RegisterSpringback'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let bindSheetButton: Component = await driver.findComponent(ON.id('springBackButton')) as Component;
      let point = await bindSheetButton.getBoundsCenter();
      console.log("bindSheetButton-X " + point.x + " bindSheetButton-Y " + point.y)
      let x1 = Math.round(point.x) as int
      let y1 = Math.round(point.y) as int
      let y2 = Math.round(point.y + UIContext.resolveUIContext()!.vp2px(150)) as int
      let stepLen = Math.round(UIContext.resolveUIContext()!.vp2px(30)) as int
      await (driver.fling({x: x1, y: y1},{x: x1, y: y2}, stepLen, 3000) as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('onWillSpringBackWhenDismiss');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[springBack_0100] component obj is: " + JSON.stringify(obj));
      console.info("[springBack_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("springBack success");

      let strJson2 = inspector.getInspectorByKey('Dismiss_3');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[springBack_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[springBack_0100] title: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("reason: 3");

      console.info('[springBack_0100] END');
      done();
    });


  })
}