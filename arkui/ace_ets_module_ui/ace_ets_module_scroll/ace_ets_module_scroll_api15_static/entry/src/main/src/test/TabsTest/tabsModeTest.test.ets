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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, afterAll } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
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
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function tabsModeTest() {
  describe('tabsModeTest', () => {
    beforeAll(() => {
      console.info("tabsModeTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.scroll15.static", "EntryAbility");
      
    });

    beforeEach(async () => {
      console.info("tabsModeTest beforeEach start");
      const tabsMode = AppStorage.get<Router>("router") as Router
      tabsMode.clear();
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsMode",
      }
      try {
        let pages = tabsMode.getState();
        console.info("get tabsModeTest state pages:" + JSON.stringify(pages));
        if (!("tabsMode" == pages.name)) {
          console.info("get tabsModeTest pages.name:" + JSON.stringify(pages.name));
          tabsMode.pushUrl(options);
        }
      } catch (err) {
        console.error("push tabsModeTest page error:" + err);
      }
      console.info("tabsModeTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsModeTest after each called");
    });


    
    /**
     * @tc.number   tabsModeTest_0100
     * @tc.name     tabsModeTest_0100
     * @tc.desc     tabsModeTest_0100
     * @tc.level    Level.LEVEL1
     */
it('tabsModeTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[tabsModeTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('tabs_animode_content')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabs_aniMode');
      console.info("[tabsModeTest_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[tabsModeTest_0100] tabsMode1: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('animationMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('animationMode'))
        .assertEqual('AnimationMode.CONTENT_FIRST_WITH_JUMP');
      console.info('[tabsModeTest_0100] AnimationMode.CONTENT_FIRST_WITH_JUMP END');
      done();
    });


    
    /**
     * @tc.number   tabsModeTest_0200
     * @tc.name     tabsModeTest_0200
     * @tc.desc     tabsModeTest_0200
     * @tc.level    Level.LEVEL1
     */
it('tabsModeTest_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[tabsModeTest_0200] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('tabs_animode_first')) as Component;
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(8000);
      let strJson = inspector.getInspectorByKey('tabs_aniMode');
      console.info("[tabsModeTest_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[tabsModeTest_0200] tabsMode1: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('animationMode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('animationMode'))
        .assertEqual('AnimationMode.ACTION_FIRST_WITH_JUMP');
      console.info('[tabsModeTest_0200] AnimationMode.ACTION_FIRST_WITH_JUMP END');
      done();
    });
  })
}