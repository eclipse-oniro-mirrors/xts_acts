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


export default function TabBarComponentContent() {
  describe('TabBarComponentContent', () => {
    beforeAll(() => {
      console.info("TabBarComponentContent beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.scroll16.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info('TabBarComponentContent beforeEach start');
      const tabBarComponentContent = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabBarComponentContent',
      }
      try {
        let pages = tabBarComponentContent.getState();
        console.info('get TabBarComponentContent state pages: ' + JSON.stringify(pages));
        if (!('TabBarComponentContent' == pages.name)) {
          console.info('get TabBarComponentContent state pages.name: ' + JSON.stringify(pages.name));
          tabBarComponentContent.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push TabBarComponentContent page error: ' + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   TabBarComponentContent_static_0100
     * @tc.name     TabBarComponentContent_static_0100
     * @tc.desc     TabBarComponentContent_static_0100
     * @tc.level    Level.LEVEL1
     */
it('TabBarComponentContent_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('button1'));
      await (button1?.click() as Promise<void>);
      console.info('[TabBarComponentContent_static_0100] Button1 Onclick');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TabContent1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TabBarComponentContent_static_0100] component obj is: ' + strJson);
      let text = await driver.findComponent(ON.id('TabContent1'));
      let textContent = await (text?.getText() as Promise<String>);
      expect(textContent).assertEqual('tabBar1');
      console.info('[TabBarComponentContent_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   TabBarComponentContent_static_0200
     * @tc.name     TabBarComponentContent_static_0200
     * @tc.desc     TabBarComponentContent_static_0200
     * @tc.level    Level.LEVEL1
     */
it('TabBarComponentContent_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('button2'));
      await (button2?.click() as Promise<void>);
      console.info('[TabBarComponentContent_static_0200] Button2 Onclick');
      await CommonFunc.sleep(1000);
      let text01 = await driver.findComponent(ON.id('TabContent1'));
      expect(text01).assertEqual(null);
      console.info('[TabBarComponentContent_static_0200] END');
      done();
    });


    
    /**
     * @tc.number   TabBarComponentContent_static_0300
     * @tc.name     TabBarComponentContent_static_0300
     * @tc.desc     TabBarComponentContent_static_0300
     * @tc.level    Level.LEVEL1
     */
it('TabBarComponentContent_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button3 = await driver.findComponent(ON.id('button3'));
      await (button3?.click() as Promise<void>);
      console.info('[TabBarComponentContent_static_0300] Button3 Onclick');
      await CommonFunc.sleep(1000);
      let text02 = await driver.findComponent(ON.id('TabContent1'));
      expect(text02).assertEqual(null);
      console.info('[TabBarComponentContent_static_0300] END');
      done();
    });
  })
}