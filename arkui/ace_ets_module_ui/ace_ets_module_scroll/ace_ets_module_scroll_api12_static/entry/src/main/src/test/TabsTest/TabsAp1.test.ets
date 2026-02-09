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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function TabsAp1() {
  describe('TabsAp1', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("TabsAp1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsAp1',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get TabsAp1 state pages:" + JSON.stringify(pages));
        if (!("TabsAp1" == pages.name)) {
          console.info("get TabsAp1 pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TabsAp1 page error:" + err);
      }
      console.info("TabsAp1 beforeEach end");
    });

    
      
  
/**
     * @tc.number   TabsAp1_static_0100
     * @tc.name     TabsAp1_static_0100
     * @tc.desc     TabsAp1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('TabsAp1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TabsAp1_static_0100 START');
      await CommonFunc.sleep(1000);

      let text1 = inspector.getInspectorByKey('TabsAp1_text1');
      expect(String(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))).assertEqual('tabContent3')

      await CommonFunc.sleep(1000);

      console.info('TabsAp1_static_0100 END');
      done();
    });
  })
}