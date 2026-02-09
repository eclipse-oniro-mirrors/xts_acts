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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
import router from '@ohos.router';

import { Component,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/utils/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function useShadowBatching() {
  describe('useShadowBatching', () => {
    beforeAll(() => {
      console.info("useShadowBatching beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("useShadowBatching beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/useShadowBatching',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get useShadowBatching state pages: " + "");
        if (!("useShadowBatching" == pages.name)) {
          console.info("get useShadowBatching state pages.name: " + "");
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push useShadowBatching page error: " + err);
        expect().assertFail();
      }
    });
    
     
    
    

/**
     * @tc.number   useShadowBatching_static_0100
     * @tc.name     useShadowBatching_static_0100
     * @tc.desc     useShadowBatching_static_0100
     * @tc.level    Level.LEVEL0
     */
it('useShadowBatching_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('useShadowBatching_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('useShadowBatching');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[useShadowBatching_static_0100] component obj is: " + JSON.stringify(obj));
     console.info("[useShadowBatching_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('useShadowBatching')));
     expect(obj.getElement('$attrs').getString('useShadowBatching')).assertEqual('true');
      console.info('[useShadowBatching_static_0100] END');
      done();
    });
    

  })
}

