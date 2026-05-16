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

export default function TabsOnSelectedTest() {
  describe('TabsOnSelectedTest', () => {
    beforeAll(() => {
      console.info("TabsOnSelectedTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.scroll16.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info('TabsOnSelectedTest beforeEach start');
      const tabsOnSelected = AppStorage.get<Router>("router") as Router
      tabsOnSelected.clear();
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsOnSelected',
      }
      try {
        let pages = tabsOnSelected.getState();
        console.info('get TabsOnSelected state pages: ' + JSON.stringify(pages));
        if (!('TabsOnSelected' == pages.name)) {
          console.info('get TabsOnSelected pages.name: ' + JSON.stringify(pages.name));
          tabsOnSelected.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push TabsOnSelected page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('TabsOnSelected beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('bindSheetRadius after each called');
    })
  


    
    /**
     * @tc.number   TabsOnSelectedTest_static_0010
     * @tc.name     TabsOnSelectedTest_static_0010
     * @tc.desc     TabsOnSelectedTest_static_0010
     * @tc.level    Level.LEVEL1
     */
it('TabsOnSelectedTest_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'TabsOnSelectedTest0010_static';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.text('blue'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('onSelected_0100');
      console.info("[TabsOnSelectedTest0010] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("onSelected");
      await CommonFunc.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    
    /**
     * @tc.number   TabsOnSelectedTest_static_0020
     * @tc.name     TabsOnSelectedTest_static_0020
     * @tc.desc     TabsOnSelectedTest_static_0020
     * @tc.level    Level.LEVEL1
     */
it('TabsOnSelectedTest_static_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'TabsOnSelectedTest0020_static';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.text('pink'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('onSelected_0100');
      console.info("[TabsOnSelectedTest0020] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("onSelected");
      await CommonFunc.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}