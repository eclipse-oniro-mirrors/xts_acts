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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
import {
  Point,
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
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function setTest() {
  describe('setTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("setTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/childrenMainSize/set",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get setTest state pages: " + JSON.stringify(pages));
        if (!("set" == pages.name)) {
          console.info("get setTest state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err: Error) {
        console.error("push setTest page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   setTest_static_0100
     * @tc.name     setTest_static_0100
     * @tc.desc     setTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('setTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('setTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let set_childDefaultSize: Component = await driver.findComponent(ON.id('set_childDefaultSize')) as Component;
      await set_childDefaultSize.click();
      await CommonFunc.sleep(1000);
      let set = inspector.getInspectorByKey('set');
      console.info("[setTest_static_0100] attrs is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(set).getElement('$attrs')));
      expect(JSON.parseJsonElement(set).getElement('$attrs').getString('content'))
        .assertEqual('set childDefaultSize(150)');
      await CommonFunc.sleep(2000);
      console.info('[setTest_static_0100] END');
      done();
    });
  })
}