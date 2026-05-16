'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import inspector from '@ohos.arkui.inspector'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest,startAbility} from '../Util.test'

const uiContext = new UIContext();

export default function CrossLanguageOptionsSupportFiveMethodsStaticTest() {
  describe('CrossLanguageOptionsSupportFiveMethodsStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("CrossLanguageOptionsSupportFiveMethodsStaticTest beforeEach start");
      await startAbility("com.arkui.ace.XNode.api20.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("CrossLanguageOptionsSupportFiveMethodsStaticTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/CrossLanguageOptionsSupportFiveMethodsStatic",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get CrossLanguageOptionsSupportFiveMethodsStatic state pages: " + JSON.stringify(pages));
        if (!("CrossLanguageOptionsSupportFiveMethodsStatic" == pages.name)) {
          console.info("get CrossLanguageOptionsSupportFiveMethodsStatic state pages.name: " + JSON.stringify(pages.name));
          
          router.pushUrl(options)
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push CrossLanguageOptionsSupportFiveMethodsStatic page error: " + err);
        expect().assertFail();
      }
    });
    
    /** 
      * @tc.name   CrossLanguageOptionsSupportFiveMethodsStaticTest_0100 
      * @tc.number SUB_ARKUI_API_CrossLanguageOptionsSupportFiveMethodsStaticTest_0100 
      * @tc.desc   ArkUIAPI 
      * @tc.type   FUNCTION 
      * @tc.size   MEDIUMTEST 
      * @tc.level  LEVEL1 
      */ 
     it('CrossLanguageOptionsSupportFiveMethodsStaticTest_0100', Level.LEVEL1, async (done: ()=>void) => { 
       console.info('[CrossLanguageOptionsSupportFiveMethodsStaticTest_0100] START'); 
       let driver = await Driver.create() 
       await CommonFunc.sleep(1000);

       let button = await driver.findComponent(ON.id('CrossLanguageOptionsSetTrue')); 
       await button!.click(); 
       await CommonFunc.sleep(2000); 
  
       let node1 = await driver.findComponent(ON.id('colStatic')); 
       expect(node1).not().assertNull(); 
        
       console.info('[CrossLanguageOptionsSupportFiveMethodsStaticTest_0100] END'); 
       done(); 
     }); 
    
  })
}