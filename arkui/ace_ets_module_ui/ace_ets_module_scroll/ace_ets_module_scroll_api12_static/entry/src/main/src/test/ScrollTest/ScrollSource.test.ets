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
import {
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'

import { UtilsTest } from '../Util.test';

let testAbilityContext: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
const waitUiReadyMs = 1000;

export default function ScrollSource() {
  describe('ScrollSource', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ScrollSource beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/ScrollSource",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ScrollSource state pages: " + JSON.stringify(pages));
        if (!("ScrollSource" == pages.name)) {
          console.info("get ScrollSource state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push ScrollSource page error: " + err);
        expect().assertFail();
      }
    });



    
      
  
/**
     * @tc.number   ScrollSource_0100
     * @tc.name     ScrollSource_0100
     * @tc.desc     ScrollSource_0100
     * @tc.level    Level.LEVEL0
     */
it('ScrollSource_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ScrollSource_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scrollSource'));
      await button!.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('scrollSource');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollSource_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[ScrollSource_0100] content obj is: " + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label'))
        .assertEqual('ScrollSource.SCROLLER_ANIMATION'); //SCROLLER_ANIMATION
      console.info('[ScrollSource_0100] END');
      done();
    });

    
      
  
/**
     * @tc.number   ScrollSource_0200
     * @tc.name     ScrollSource_0200
     * @tc.desc     ScrollSource_0200
     * @tc.level    Level.LEVEL0
     */
it('ScrollSource_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ScrollSource_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scrollSourceOther'));
      await button!.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('scrollSourceOther');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ScrollSource_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[ScrollSource_0200] content obj is: " + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('ScrollSource.SCROLLER'); //SCROLLER
      console.info('[ScrollSource_0200] END');
      done();
    });

  })
}

