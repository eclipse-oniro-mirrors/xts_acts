'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
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
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { UtilsTest, startAbility } from '../../Util.test';

export default function appendChildTest() {
  describe('appendChildTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("appendChildTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/renderNode/appendChild',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get appendChildTest state pages:" + JSON.stringify(pages));
        if (!("appendChild" == pages.name)) {
          console.info("get appendChildTest pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push appendChildTest page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push appendChildTest page error: " + err);
        expect().assertFail();
      }

    });

    
    
/**
     * @tc.number   appendChildTest_static_0100
     * @tc.name     appendChildTest_static_0100
     * @tc.desc     appendChildTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('appendChildTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('appendChildTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('appendChild_1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('appendChild_width1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[appendChildTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('width1: 50');
      console.info('[appendChildTest_0100] END');
      done();
    });

    
    
/**
     * @tc.number   appendChildTest_static_0200
     * @tc.name     appendChildTest_static_0200
     * @tc.desc     appendChildTest_static_0200
     * @tc.level    Level.LEVEL2
     */
it('appendChildTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('appendChildTest_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('insertChildAfter_1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('appendChild_width1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[appendChildTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('width1: 0');
      console.info('[appendChildTest_0200] END');
      done();
    });

    
    
/**
     * @tc.number   appendChildTest_static_0300
     * @tc.name     appendChildTest_static_0300
     * @tc.desc     appendChildTest_static_0300
     * @tc.level    Level.LEVEL2
     */
it('appendChildTest_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('appendChildTest_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('removeChild_1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('appendChild_width1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[appendChildTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('width1: 0');
      console.info('[appendChildTest_0300] END');
      done();
    });

    
    
/**
     * @tc.number   appendChildTest_static_0400
     * @tc.name     appendChildTest_static_0400
     * @tc.desc     appendChildTest_static_0400
     * @tc.level    Level.LEVEL2
     */
it('appendChildTest_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('appendChildTest_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('clearChild_1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('appendChild_width1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[appendChildTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('width1: 130');
      console.info('[appendChildTest_0400] END');
      done();
    });
  })
}

