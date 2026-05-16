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
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
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

export default function hoverEffectJsunit() {
  describe('hoverEffectTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("hoverEffectJsunit beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("hoverEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/imageEffects/hoverEffect',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get hoverEffectTest state pages:" + JSON.stringify(pages));
        if (!("hoverEffect" == pages.name)) {
          console.info("get hoverEffectTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push hoverEffectTest page error:" + err);
      }
      console.info("hoverEffectTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("hoverEffect after each called");
    });

    
    
    
/**
     * @tc.number   testhoverEffect_static_0001
     * @tc.name     testhoverEffect_static_0001
     * @tc.desc     testhoverEffect_static_0001
     * @tc.level    Level.LEVEL2
     */
it('testhoverEffect_static_0001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('hoverEffect testhoverEffect0001 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('ScaleText');
      console.info("[testhoverEffect0001] component hoverEffect strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('hoverEffect')).assertEqual('HoverEffect.Scale');
      console.info("[testhoverEffect0001] hoverEffect value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('hoverEffect'));
      done();
    });

    
    
    
/**
     * @tc.number   testhoverEffect_static_0002
     * @tc.name     testhoverEffect_static_0002
     * @tc.desc     testhoverEffect_static_0002
     * @tc.level    Level.LEVEL2
     */
it('testhoverEffect_static_0002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('hoverEffect testhoverEffect0002 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('HighlightText');
      console.info("[testhoverEffect0002] component hoverEffect strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('hoverEffect')).assertEqual('HoverEffect.Highlight');
      console.info("[testhoverEffect0002] hoverEffect value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('hoverEffect'));
      done();
    });
  })
}