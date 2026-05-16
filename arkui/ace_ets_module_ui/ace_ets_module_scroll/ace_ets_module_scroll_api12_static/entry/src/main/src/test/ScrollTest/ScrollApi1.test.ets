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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
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

export default function ScrollApi1() {
  describe('ScrollApi1', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ScrollApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollApi1',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ScrollApi1 state pages:" + JSON.stringify(pages));
        if (!("ScrollApi1" == pages.name)) {
          console.info("get ScrollApi1 pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ScrollApi1 page error:" + err);
      }
      console.info("ScrollApi1 beforeEach end");
    });

    
      
  
/**
     * @tc.number   ScrollApi1_0100
     * @tc.name     ScrollApi1_0100
     * @tc.desc     ScrollApi1_0100
     * @tc.level    Level.LEVEL0
     */
it('ScrollApi1_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ScrollApi1_0100 START');
      await CommonFunc.sleep(1000);

      inspector.sendEventByKey('ScrollApi1_btn', 10, "")
      await CommonFunc.sleep(1000);

      let scroll = CommonFunc.getComponentRect('ScrollApi1_Scroll');
      let listItem1 = CommonFunc.getComponentRect('ScrollApi1_listItem1');
      expect(scroll.top).assertEqual(listItem1.top)

      await CommonFunc.sleep(1000);

      console.info('ScrollApi1_0100 END');
      done();
    });

  })
}