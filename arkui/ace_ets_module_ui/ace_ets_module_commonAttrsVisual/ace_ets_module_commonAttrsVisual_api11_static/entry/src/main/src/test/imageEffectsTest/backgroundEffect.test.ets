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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
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
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import bundle from '@ohos.bundle.bundleManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function backgroundEffectJsunit() {
  describe('backgroundEffectJsunit', () => {
    beforeAll(async (): Promise<void> => {
      console.info("backgroundEffectJsunit beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("backgroundEffectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/backgroundEffect',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get backgroundEffectJsunit state pages:" + JSON.stringify(pages));
        if (!("backgroundEffect" == pages.name)) {
          console.info("get backgroundEffectJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push backgroundEffectJsunit page error:" + err);
      }
      console.info("backgroundEffectJsunit beforeEach end");
    });


    
    
/**
     * @tc.number   backgroundEffectJsunit_static_0100
     * @tc.name     backgroundEffectJsunit_static_0100
     * @tc.desc     backgroundEffectJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('backgroundEffectJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the backgroundEffect component
      console.info('[backgroundEffectJsunit_0100] START');
      let strJson = inspector.getInspectorByKey('backgroundEffect_id1');
      await CommonFunc.sleep(2000);
      console.info("[backgroundEffectJsunit_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[backgroundEffectJsunit_0100] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getDouble('saturation')).assertEqual(10);
      console.info('[backgroundEffectJsunit_0100] END');
      done();
    });


    
    
/**
     * @tc.number   backgroundEffectJsunit_static_0200
     * @tc.name     backgroundEffectJsunit_static_0200
     * @tc.desc     backgroundEffectJsunit_static_0200
     * @tc.level    Level.LEVEL2
     */
it('backgroundEffectJsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the backgroundEffect component
      console.info('[backgroundEffectJsunit_0200] START');
      let strJson = inspector.getInspectorByKey('backgroundEffect_id1');
      await CommonFunc.sleep(2000);
      console.info("[backgroundEffectJsunit_0200] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('adaptiveColor')).assertEqual("AdaptiveColor.Default");
      console.info('[backgroundEffectJsunit_0200] END');
      done();
    });


//
//
// /**
//      * @tc.number   backgroundEffectJsunit_static_0300
//      * @tc.name     backgroundEffectJsunit_static_0300
//      * @tc.desc     backgroundEffectJsunit_static_0300
//      * @tc.level    Level.LEVEL2
//      */
// it('backgroundEffectJsunit_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       // Get the information of the backgroundEffect component
//       console.info('[backgroundEffectJsunit_0300] START');
//       let strJson = inspector.getInspectorByKey('backgroundEffect_id1');
//       await CommonFunc.sleep(2000);
//       console.info("[backgroundEffectJsunit_0300] component obj is: " +
//       JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
//   console.info("[backgroundEffectJsunit_0300] component obj+++ is: " +
//      expect(JSON.parseJsonElement(strJson)
//     .getElement('$attrs')
//     .getElement('backgroundEffect')
//     .getElement('options')
//     .getElement('blurOptions')
//        .getString('grayscale')
//      ));
//       expect(JSON.parseJsonElement(strJson)
//         .getElement('$attrs')
//         .getElement('backgroundEffect')
//         .getElement('options')
//         // .getElement('blurOptions')
//         .getString('blurOptions')
//       ).assertEqual("[1.000000,1.000000]");
//       console.info('[backgroundEffectJsunit_0300] END');
//       done();
//     });


    
    
/**
     * @tc.number   backgroundEffectJsunit_static_0400
     * @tc.name     backgroundEffectJsunit_static_0400
     * @tc.desc     backgroundEffectJsunit_static_0400
     * @tc.level    Level.LEVEL2
     */
it('backgroundEffectJsunit_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the backgroundEffect component
      console.info('[backgroundEffectJsunit_0400] START');
      let strJson = inspector.getInspectorByKey('backgroundEffect_id1');
      await CommonFunc.sleep(2000);
      console.info("[backgroundEffectJsunit_0400] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getDouble('radius')).assertEqual(10);
      console.info('[backgroundEffectJsunit_0400] END');
      done();
    });


    
    
/**
     * @tc.number   backgroundEffectJsunit_static_0500
     * @tc.name     backgroundEffectJsunit_static_0500
     * @tc.desc     backgroundEffectJsunit_static_0500
     * @tc.level    Level.LEVEL2
     */
it('backgroundEffectJsunit_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the backgroundEffect component
      console.info('[backgroundEffectJsunit_0500] START');
      let strJson = inspector.getInspectorByKey('backgroundEffect_id2');
      await CommonFunc.sleep(2000);
      console.info("[backgroundEffectJsunit_0500] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('adaptiveColor')).assertEqual("AdaptiveColor.Average");
      console.info('[backgroundEffectJsunit_0500] END');
      done();
    });
  })
}
