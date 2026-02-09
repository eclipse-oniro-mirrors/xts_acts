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
export default function LazyForEachCacheEnhance() {
  describe('LazyForEachCacheEnhance', () => {
    beforeAll(() => {
      console.info("LazyForEachCacheEnhance beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LazyForEachCacheEnhance beforeEach start");
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/LazyForEach/LazyForEachCacheEnhance",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LazyForEachCacheEnhance state pages:" + JSON.stringify(pages));
        if (!("LazyForEachCacheEnhance" == pages.name)) {
          console.info("get LazyForEachCacheEnhance pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LazyForEachCacheEnhance page error:" + err);
      }
      console.info("LazyForEachCacheEnhance beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
      console.info("LazyForEachCacheEnhance after each called");
    });

    
    
    /**
     * @tc.number   LazyForEachCacheEnhance_static_001
     * @tc.name     LazyForEachCacheEnhance_static_001
     * @tc.desc     LazyForEachCacheEnhance_static_001
     * @tc.level    Level.LEVEL1
     */
it('LazyForEachCacheEnhance_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[LazyForEachCacheEnhance_static_001] START');
      await CommonFunc.sleep(100);
      let driver = Driver.create();
      let scroll_1200_btn = await driver.findComponent(ON.id('scroll_1200'))
      for(let i = 0; i<50; i++){
        await (scroll_1200_btn?.click() as Promise<void>);
      }
      let count_text = await driver.findComponent(ON.id('reuse_count'));
      expect(parseInt(await (count_text?.getText() as Promise<string>))).assertLargerOrEqual(900);
      console.info('[LazyForEachCacheEnhance_static_001] END');
      done();
    });
  })
}