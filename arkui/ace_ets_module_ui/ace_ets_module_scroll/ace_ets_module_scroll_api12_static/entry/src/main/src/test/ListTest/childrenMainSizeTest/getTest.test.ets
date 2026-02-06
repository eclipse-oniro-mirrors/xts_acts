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

export default function getTest() {
  describe('getTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("getTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/childrenMainSize/get",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get getTest state pages: " + JSON.stringify(pages));
        if (!("get" == pages.name)) {
          console.info("get getTest state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push getTest page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   getTest_static_0100
     * @tc.name     getTest_static_0100
     * @tc.desc     getTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('getTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('getTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let get_childDefaultSize: Component = await driver.findComponent(ON.id('get_childDefaultSize')) as Component;
      await get_childDefaultSize.click();
      await CommonFunc.sleep(1000);
      let get = inspector.getInspectorByKey('get');
      console.info("[getTest_static_0100] attrs is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(get).getElement('$attrs')));
      expect(JSON.parseJsonElement(get).getElement('$attrs').getString('content'))
        .assertEqual('get childDefaultSize:0');
      console.info('[getTest_static_0100] END');
      done();
    });
  })
}