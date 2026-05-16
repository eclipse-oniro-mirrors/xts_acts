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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function commonBackgroundBlurStyleJsunit() {
  describe('commonBackgroundBlurStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("commonBackgroundBlurStyleTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("commonBackgroundBlurStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/common3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get commonBackgroundBlurStyleTest state pages:" + JSON.stringify(pages));
        if (!("common3" == pages.name)) {
          console.info("get commonBackgroundBlurStyleTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push commonBackgroundBlurStyleTest page error:" + err);
      }
      console.info("commonBackgroundBlurStyleTest beforeEach end");
    });


    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("commonBackgroundBlurStyle after each called");
    });

    
    
/**
     * @tc.number   testcommonBackgroundBlurStyle_static_001
     * @tc.name     testcommonBackgroundBlurStyle_static_001
     * @tc.desc     testcommonBackgroundBlurStyle_static_001
     * @tc.level    Level.LEVEL2
     */
it('testcommonBackgroundBlurStyle_static_001', Level.LEVEL2, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('borderImageText');
      console.info("[testcommonBackgroundBlurStyle001] component borderImage strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      let jsonObject =
        JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderImage'));
      expect(jsonObject.getString('width')).assertEqual("10.00px");

    });

    
    
    
/**
     * @tc.number   testcommonBackgroundBlurStyle_static_002
     * @tc.name     testcommonBackgroundBlurStyle_static_002
     * @tc.desc     testcommonBackgroundBlurStyle_static_002
     * @tc.level    Level.LEVEL2
     */
it('testcommonBackgroundBlurStyle_static_002', Level.LEVEL2, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabIndexText');
      console.info("[testcommonBackgroundBlurStyle002] component tabIndex strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('tabIndex')).assertEqual(1);
      console.info("[testcommonBackgroundBlurStyle002] tabIndex value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'));

    });

    
    
    
/**
     * @tc.number   testcommonBackgroundBlurStyle_static_003
     * @tc.name     testcommonBackgroundBlurStyle_static_003
     * @tc.desc     testcommonBackgroundBlurStyle_static_003
     * @tc.level    Level.LEVEL2
     */
it('testcommonBackgroundBlurStyle_static_003', Level.LEVEL2, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('sepiaText');
      console.info("[testcommonBackgroundBlurStyle003] component sepia strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('sepia')).assertEqual(1);
      console.info("[testcommonBackgroundBlurStyle003] sepia value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('sepia'));

    });

    
    
    
/**
     * @tc.number   testcommonBackgroundBlurStyle_static_004
     * @tc.name     testcommonBackgroundBlurStyle_static_004
     * @tc.desc     testcommonBackgroundBlurStyle_static_004
     * @tc.level    Level.LEVEL2
     */
it('testcommonBackgroundBlurStyle_static_004', Level.LEVEL2, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alignRulesText');
      console.info("[testcommonBackgroundBlurStyle004] component alignRules strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('alignRules')).assertEqual(undefined);

    });

    
    
/**
     * @tc.number   testcommonBackgroundBlurStyle_static_005
     * @tc.name     testcommonBackgroundBlurStyle_static_005
     * @tc.desc     testcommonBackgroundBlurStyle_static_005
     * @tc.level    Level.LEVEL2
     */
it('testcommonBackgroundBlurStyle_static_005', Level.LEVEL2, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('backgroundBlurStyleText');
      console.info("[testcommonBackgroundBlurStyle005] component backgroundBlurStyle strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      const Str = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundBlurStyle')
      expect(Str instanceof Object)
        .assertTrue();

    });

    
    
/**
     * @tc.number   testcommonBackgroundBlurStyle_static_006
     * @tc.name     testcommonBackgroundBlurStyle_static_006
     * @tc.desc     testcommonBackgroundBlurStyle_static_006
     * @tc.level    Level.LEVEL2
     */
it('testcommonBackgroundBlurStyle_static_006', Level.LEVEL2, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle006 START');
      console.info("common onKeyEvent click result is: " +
      JSON.stringify(inspector.sendEventByKey('onKeyEventButton', 10, "")));

    });

    
    
    
/**
     * @tc.number   testcommonHoverEffectHighlight_static_0001
     * @tc.name     testcommonHoverEffectHighlight_static_0001
     * @tc.desc     testcommonHoverEffectHighlight_static_0001
     * @tc.level    Level.LEVEL2
     */
it('testcommonHoverEffectHighlight_static_0001', Level.LEVEL2, async () => {
      console.info('commonHoverEffectHighlight testcommonHoverEffectHighlight0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('hoverEffectText');
      console.info("[testcommonHoverEffectHighlight0001] component hoverEffect strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('hoverEffect'))
        .assertEqual('HoverEffect.Highlight');
      console.info("[testcommonHoverEffectHighlight0001] hoverEffect value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('hoverEffect'));

    });

    
    
    
/**
     * @tc.number   testcommonHoverEffectScale_static_0001
     * @tc.name     testcommonHoverEffectScale_static_0001
     * @tc.desc     testcommonHoverEffectScale_static_0001
     * @tc.level    Level.LEVEL2
     */
it('testcommonHoverEffectScale_static_0001', Level.LEVEL2, async () => {
      console.info('commonHoverEffectScale testcommonHoverEffectScale0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('hoverEffectScaleText');
      console.info("[testcommonHoverEffectScale0001] component hoverEffect strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('hoverEffect'))
        .assertEqual('HoverEffect.Scale');
      console.info("[testcommonHoverEffectScale0001] hoverEffect value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('hoverEffect'));

    });

  })
}
