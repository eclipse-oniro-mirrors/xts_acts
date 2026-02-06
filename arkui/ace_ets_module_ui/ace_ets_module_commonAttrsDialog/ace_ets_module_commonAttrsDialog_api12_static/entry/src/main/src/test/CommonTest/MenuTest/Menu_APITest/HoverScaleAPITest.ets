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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Point} from '@ohos.UiTest';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../../../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function HoverScale_APITest() {
  describe('HoverScale_APITest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api12.static", "EntryAbility")
    });

beforeEach(async (): Promise<void> => {
  console.info("HoverScale_APITest beforeEach start");
  let options: router.RouterOptions = {
    url:"MainAbility/pages/Common/Menu/Menu_API/HoverScale",
  }
  try {
    const routerInstance = AppStorage.get<Router>("router") as Router
    routerInstance.clear();
    let pages = routerInstance.getState();
    console.info("get HoverScale_APITest state pages:" + JSON.stringify(pages));
    if (!("ListMainChildren" == pages.name)) {
      console.info("get HoverScale_APITest pages.name:" + JSON.stringify(pages.name));
      routerInstance.pushUrl(options);
      await CommonFunc.sleep(2000);
    }
  } catch (err) {
    console.error("push HoverScale_APITest page error:" + err);
  }
  console.info("HoverScale_APITest beforeEach end");
});

    
    
    /**
     * @tc.number   HoverScale_APITest_static_0100
     * @tc.name     HoverScale_APITest_static_0100
     * @tc.desc     HoverScale_APITest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('HoverScale_APITest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('HoverScale_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn:Component = await driver.findComponent(ON.id('btn')) as Component;
      let row:Component = await driver.findComponent(ON.id('row')) as Component;

      let point =  await row.getBoundsCenter();

       await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(5000);
       driver?.click(Math.round(point.x/2) as int, Math.round(point.y/4) as int);
      await CommonFunc.sleep(1000);
      let hoverScale = inspector.getInspectorByKey('hoverScale');
      console.info("[HoverScale_APITest_0100] hoverScale attrs is: " + JSON.stringify(JSON.parseJsonElement(hoverScale).getElement('$attrs')));
      expect(JSON.parseJsonElement(hoverScale).getElement('$attrs').getString('content')).assertEqual('hoverScale');
      console.info('[HoverScale_APITest_0100] END');
      done();
    });
  })
}