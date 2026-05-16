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
import { AppStorage } from '@ohos.arkui.stateManagement';

const uiContext = new UIContext();

export default function RenderNodeBlurStaticTest() {
  describe('RenderNodeBlurStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("RenderNodeBlurStaticTest beforeEach start");
      await startAbility("com.arkui.ace.XNode.api20.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("RenderNodeBlurStaticTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RenderNode/RenderNodeBlurStatic",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get RenderNodeBlurStatic state pages: " + JSON.stringify(pages));
        if (!("RenderNodeBlurStatic" == pages.name)) {
          console.info("get RenderNodeBlurStatic state pages.name: " + JSON.stringify(pages.name));
          
          router.pushUrl(options)
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push RenderNodeBlurStatic page error: " + err);
        expect().assertFail();
      }
    });
    
    /** 
      * @tc.name   RenderNodeBlurStaticTest_0100 
      * @tc.number SUB_ARKUI_API_RenderNodeBlurStaticTest_0100
      * @tc.desc   ArkUIAPI 
      * @tc.type   FUNCTION 
      * @tc.size   MEDIUMTEST 
      * @tc.level  LEVEL1 
      */ 
     it('RenderNodeBlurStaticTest_0100', Level.LEVEL1, async (done: ()=>void) => { 
       console.info('[RenderNodeBlurStaticTest_0100] START'); 
       let driver = await Driver.create() 
       await CommonFunc.sleep(1000);

       let button1 = await driver.findComponent(ON.id('setBackgroundBlur'));
       await button1!.click();
       await CommonFunc.sleep(2000);

       let button2 = await driver.findComponent(ON.id('setContentBlur'));
       await button2!.click();
       await CommonFunc.sleep(2000);

       let button3 = await driver.findComponent(ON.id('setForegroundBlur'));
       await button3!.click();
       await CommonFunc.sleep(2000);

       let button4 = await driver.findComponent(ON.id('clearBlurEffects'));
       await button4!.click();
       await CommonFunc.sleep(2000);

       let button5 = await driver.findComponent(ON.id('getBlurConfigs'));
       await button5!.click();
       await CommonFunc.sleep(2000);

       let button6 = await driver.findComponent(ON.id('setAndGetUndefined'));
       await button6!.click();
       await CommonFunc.sleep(2000);

       console.info('RenderNodeBlur backgroundBlurRadiusUndefined:' + AppStorage.get<Double>('backgroundBlurRadiusUndefined'))
       console.info('RenderNodeBlur backgroundBlurGrayscaleUndefined:' + AppStorage.get<[Int, Int]|undefined>('backgroundBlurGrayscaleUndefined'))
       console.info('RenderNodeBlur contentBlurRadiusUndefined:' + AppStorage.get<Double>('contentBlurRadiusUndefined'))
       console.info('RenderNodeBlur contentBlurGrayscaleUndefined:' + AppStorage.get<[Int, Int]|undefined>('contentBlurGrayscaleUndefined'))
       console.info('RenderNodeBlur foregroundBlurRadiusUndefined:' + AppStorage.get<Double>('foregroundBlurRadiusUndefined'))

       console.info('RenderNodeBlur backgroundBlurRadiusUndefined:' + AppStorage.get<Double>('backgroundBlurRadiusUndefined'))
       expect(AppStorage.get<Double>('backgroundBlurRadiusUndefined')).assertEqual(0);
       AppStorage.delete('backgroundBlurRadiusUndefined')

       console.info('RenderNodeBlur backgroundBlurGrayscaleUndefined:' + AppStorage.get<[Int, Int]|undefined>('backgroundBlurGrayscaleUndefined'))
       expect(AppStorage.get<[Int, Int]|undefined>('backgroundBlurGrayscaleUndefined')!.toString()).assertEqual('0,0');
       AppStorage.delete('backgroundBlurGrayscaleUndefined')

       console.info('RenderNodeBlur contentBlurRadiusUndefined:' + AppStorage.get<Double>('contentBlurRadiusUndefined'))
       expect(AppStorage.get<Double>('contentBlurRadiusUndefined')).assertEqual(0);
       AppStorage.delete('contentBlurRadiusUndefined')

       console.info('RenderNodeBlur contentBlurRadiusUndefined:' + AppStorage.get<Double>('contentBlurRadiusUndefined'))
       expect(AppStorage.get<[Int, Int]|undefined>('contentBlurGrayscaleUndefined')!.toString()).assertEqual('0,0');
       AppStorage.delete('contentBlurGrayscaleUndefined')

       console.info('RenderNodeBlur foregroundBlurRadiusUndefined:' + AppStorage.get<Double>('foregroundBlurRadiusUndefined'))
       expect(AppStorage.get<Double>('foregroundBlurRadiusUndefined')).assertEqual(0);
       AppStorage.delete('foregroundBlurRadiusUndefined') 
        
       console.info('[RenderNodeBlurStaticTest_0100] END'); 
       done(); 
     }); 
    
  })
}