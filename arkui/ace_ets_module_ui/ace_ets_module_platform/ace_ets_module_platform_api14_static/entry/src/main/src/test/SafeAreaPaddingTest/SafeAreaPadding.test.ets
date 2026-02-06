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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON,Component } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router,UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import CommonFunc from '../../../ets/MainAbility/common/Common';
let testAbilityContext: common.UIAbilityContext;
const uiContext = new UIContext();
export default function SafeAreaPadding1() {
  describe('SafeAreaPadding1', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.platform.api14.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaPadding1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SafeAreaPadding/SafeAreaPadding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SafeAreaPadding1 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaPadding1" == pages.name)) {
          console.info("get SafeAreaPadding1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaPadding1 page error:" + err);
      }
      console.info("SafeAreaPadding1 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SafeAreaPadding1 after each called");
    });

    /**
     * @tc.number   SafeAreaPadding1_static_0100
     * @tc.name     SafeAreaPadding1_static_0100
     * @tc.desc     SafeAreaPadding1_static_0100
     * @tc.level    Level.LEVEL2
     */
it('SafeAreaPadding1_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SafeAreaPadding1_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button1 = await (driver.findComponent(ON.id('SafeArea_button1')) as Promise<Component>);
      await CommonFunc.sleep(500);
      Button1.click();
      await CommonFunc.sleep(1000);
      let SafeAreaPaading001 = CommonFunc.getComponentRect('safeAreaPadding_001');
      console.log("[SafeAreaPadding1_static_0100] component safeAreaPadding_001 is: " + SafeAreaPaading001);
      console.log("[SafeAreaPadding1_static_0100] component safeAreaPadding_001 top is: " + SafeAreaPaading001.top);
      let SafeAreaPaading002 = CommonFunc.getComponentRect('safeAreaPadding_002');
      console.log("[SafeAreaPadding1_static_0100] component safeAreaPadding_002 is: " + SafeAreaPaading002);
      console.log("[SafeAreaPadding1_static_0100] component safeAreaPadding_002 top is: " + SafeAreaPaading002.top);
      expect(Math.abs(Math.round(SafeAreaPaading001.top - SafeAreaPaading002.top)-Math.round(UIContext.resolveUIContext()!.vp2px(5)))<=1).assertTrue()

      console.info('SafeAreaPadding1_static_0100 END');
      done();
    });
  })
}