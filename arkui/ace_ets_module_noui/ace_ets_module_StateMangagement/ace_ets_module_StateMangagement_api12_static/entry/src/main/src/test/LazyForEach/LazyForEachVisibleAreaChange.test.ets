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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,TestType,Size,Level} from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function LazyForEachVisibleAreaChange() {
  describe('LazyForEachVisibleAreaChange', () => {
    beforeAll(() => {
      console.info("LazyForEachVisibleAreaChange beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LazyForEachVisibleAreaChange beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForEach/LazyForEachVisibleAreaChange",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LazyForEachVisibleAreaChange state pages:" + JSON.stringify(pages));
        if (!("LazyForEachVisibleAreaChange" == pages.name)) {
          console.info("get LazyForEachVisibleAreaChange pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LazyForEachVisibleAreaChange page error:" + err);
      }
      console.info("LazyForEachVisibleAreaChange beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachVisibleAreaChange after each called");
    });

    
    
    /**
     * @tc.number   LazyForEachVisibleAreaChange_static_001
     * @tc.name     LazyForEachVisibleAreaChange_static_001
     * @tc.desc     LazyForEachVisibleAreaChange_static_001
     * @tc.level    Level.LEVEL0
     */
it('LazyForEachVisibleAreaChange_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LazyForEachVisibleAreaChange_static_001] START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      let scroll_to_800_btn = await driver.findComponent(ON.id('scroll_to_800'))
      let scroll_to_1800_btn = await driver.findComponent(ON.id('scroll_to_1800'));
      await (scroll_to_800_btn?.click() as Promise<void>);
      await (scroll_to_1800_btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let count_text = await driver.findComponent(ON.id('text_visible_area_change_count'));
      expect(await (count_text?.getText() as Promise<string>)).assertEqual('2');
      console.info('[LazyForEachVisibleAreaChange_static_001] END');
      done();
    });
  })
}