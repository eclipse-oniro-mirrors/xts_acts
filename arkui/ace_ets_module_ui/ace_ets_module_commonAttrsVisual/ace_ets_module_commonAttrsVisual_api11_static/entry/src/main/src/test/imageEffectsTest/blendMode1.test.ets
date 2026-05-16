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
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import bundle from '@ohos.bundle.bundleManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function blendMode1Jsunit() {
  describe('blendMode1Jsunit', () => {
    beforeAll(async (): Promise<void> => {
      console.info("blendMode1Jsunit beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("blendMode1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/imageEffects/blendMode1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get blendMode1Jsunit state pages:" + JSON.stringify(pages));
        if (!("blendMode1" == pages.name)) {
          console.info("get blendMode1Jsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push blendMode1Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push blendMode1Jsunit page error:" + err);
      }
      console.info("blendMode1Jsunit beforeEach end");
    });
    
   
    
    
    
/**
     * @tc.number   blendMode1Jsunit_static_0100
     * @tc.name     blendMode1Jsunit_static_0100
     * @tc.desc     blendMode1Jsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('blendMode1Jsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the blendMode component
      console.info('[blendMode1Jsunit_0100] START');
      let strJson = inspector.getInspectorByKey('blendMode11_DESTINATION_IN');
      console.info("[blendMode1Jsunit_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('blendMode')).assertEqual(1);
      console.info('[blendMode1Jsunit_0100] END');
      done();
    });

    
    
    
/**
     * @tc.number   blendMode1Jsunit_static_0200
     * @tc.name     blendMode1Jsunit_static_0200
     * @tc.desc     blendMode1Jsunit_static_0200
     * @tc.level    Level.LEVEL2
     */
it('blendMode1Jsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the blendMode component
      console.info('[blendMode1Jsunit_0200] START');
      let strJson = inspector.getInspectorByKey('blendMode11_SOURCE_IN');
      console.info("[blendMode1Jsunit_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('blendMode')).assertEqual(2);
      console.info('[blendMode1Jsunit_0200] END');
      done();
    });

    
    
    
/**
     * @tc.number   blendMode1Jsunit_static_0300
     * @tc.name     blendMode1Jsunit_static_0300
     * @tc.desc     blendMode1Jsunit_static_0300
     * @tc.level    Level.LEVEL2
     */
it('blendMode1Jsunit_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the blendMode component
      console.info('[blendMode1Jsunit_0300] START');
      let strJson = inspector.getInspectorByKey('blendMode11_NORMAL');
      console.info("[blendMode1Jsunit_0300] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('blendMode')).assertEqual(0);
      console.info('[blendMode1Jsunit_0300] END');
      done();
    });
  })
}
