'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import { Color, ColoringStrategy, ShadowOptions, ShadowStyle } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


interface ShadowValueInter {
  radius: string
  color: string
  offsetX: string
  offsetY: string
}

export default function imageEffectsJsunit() {
  describe('imageEffectsJsunit', () => {
    beforeAll(async (): Promise<void> => {
      console.info("hoverEffectJsunit beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageEffectsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/imageEffects',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageEffectsTest state pages:" + JSON.stringify(pages));
        if (!("imageEffects" == pages.name)) {
          console.info("get imageEffectsTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push imageEffectsTest page error:" + err);
      }
      console.info("imageEffectsTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      const routerInstance = AppStorage.get<Router>("router") as Router
      // routerInstance.back();
      console.info("imageEffects after each called");
    });

    
    
/**
     * @tc.number   testImageEffects_static_001
     * @tc.name     testImageEffects_static_001
     * @tc.desc     testImageEffects_static_001
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testSizeSetting001] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('centerRow');
      console.info("[testImageEffects001] component strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blur')).assertEqual(100);
      done()
    });

    
    
/**
     * @tc.number   testImageEffects_static_002
     * @tc.name     testImageEffects_static_002
     * @tc.desc     testImageEffects_static_002
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "blurValue": 10 as Long
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 12,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects002] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow');
      await CommonFunc.sleep(2000);

      console.info("[testImageEffects002] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('blur')).assertEqual(10);
      done()
    });

    
//
// /**
//      * @tc.number   testImageEffects_static_003
//      * @tc.name     testImageEffects_static_003
//      * @tc.desc     testImageEffects_static_003
//      * @tc.level    Level.LEVEL2
//      */
// it('testImageEffects_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[testImageEffects003] START');
//       await CommonFunc.sleep(1000);
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "blurValue": 0x80000000 as Long
//           } as Record<String, undefined | null | Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 12,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info("[testImageEffects003] start to publish emit");
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err) {
//         console.log("[testImageEffects003] change component data error: " + err.message);
//       }
//       await CommonFunc.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('centerRow');
//       await CommonFunc.sleep(2000);
//
//       console.info("[testImageEffects003] component JSON.parseJsonElement(strJsonNew) is: " +
//       JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('blur'));
//       expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('blur')).assertEqual(0x80000000);
//       done()
//     });
//
//
    
/**
     * @tc.number   testImageEffects_static_004
     * @tc.name     testImageEffects_static_004
     * @tc.desc     testImageEffects_static_004
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "blurValue": 10000 as Long
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 12,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects004] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow');
      await CommonFunc.sleep(2000);

      console.info("[testImageEffects004] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('blur')).assertEqual(10000);
      done()
    });



/**
     * @tc.number   testImageEffects_static_005
     * @tc.name     testImageEffects_static_005
     * @tc.desc     testImageEffects_static_005
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects005] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "blurValue": 0 as Long
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 12,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects005] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects005] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow');
      await CommonFunc.sleep(2000);

      console.info("[testImageEffects005] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('blur')).assertEqual(0);
      done()
    });



/**
     * @tc.number   testImageEffects_static_006
     * @tc.name     testImageEffects_static_006
     * @tc.desc     testImageEffects_static_006
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects006] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('centerRow3');
      await CommonFunc.sleep(2000);
      console.info("[testImageEffects006] component strJson:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shadow'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shadow').getString('radius'))
        .assertEqual("10.000000");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shadow').getString('color'))
        .assertEqual("#FF808080");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shadow').getString('offsetX'))
        .assertEqual("5.000000");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shadow').getString('offsetY'))
        .assertEqual("5.000000");
      done()
    });



/**
     * @tc.number   testImageEffects_static_007
     * @tc.name     testImageEffects_static_007
     * @tc.desc     testImageEffects_static_007
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_007', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects007] START');
      await CommonFunc.sleep(1000);
      let shadowValue: ShadowOptions = {
        radius: 20.0,
        color: Color.Gray,
        offsetX: 10.0,
        offsetY: 10.0
      } as ShadowOptions;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowValue": shadowValue as ShadowOptions
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 13,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects007] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects007] change component data error: " + err.message);
      }

      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow3');
      await CommonFunc.sleep(2000);

      console.info("[testImageEffects007] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('radius'))
        .assertEqual("20.000000");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('color'))
        .assertEqual("#FF808080");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetX'))
        .assertEqual("10.000000");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetY'))
        .assertEqual("10.000000");
      done()
    });



// /**
//      * @tc.number   testImageEffects_static_008
//      * @tc.name     testImageEffects_static_008
//      * @tc.desc     testImageEffects_static_008
//      * @tc.level    Level.LEVEL2
//      */
// it('testImageEffects_static_008', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[testImageEffects008] START');
//       await CommonFunc.sleep(1000);
//       let shadowValue: ShadowOptions = {
//         radius: 0x80000000,
//         color: Color.Black,
//         offsetX: 0x80000000,
//         offsetY: 0x80000000
//       } as ShadowOptions;
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "shadowValue": shadowValue as ShadowOptions
//           } as Record<String, undefined | null | Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 13,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info("[testImageEffects008] start to publish emit");
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err) {
//         console.log("[testImageEffects008] change component data error: " + err.message);
//       }
//       await CommonFunc.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('centerRow3');
//       await CommonFunc.sleep(2000);
//
//       console.info("[testImageEffects008] component JSON.parseJsonElement(strJsonNew) is: " +
//       JSON.stringify(JSON.parseJsonElement(strJsonNew)));
//       expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('radius'))
//         .assertEqual("0.000000");
//       expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('color'))
//         .assertEqual(Color.Black);
//       expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetX'))
//         .assertEqual("-2147483648.000000");
//       expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetY'))
//         .assertEqual("-2147483648.000000");
//       done()
//     });



/**
     * @tc.number   testImageEffects_static_009
     * @tc.name     testImageEffects_static_009
     * @tc.desc     testImageEffects_static_009
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_009', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects009] START');
      await CommonFunc.sleep(1000);
      let shadowValue: ShadowOptions = {
        radius: 0x7FFFFFFF,
        color: Color.White,
        offsetX: 0x7FFFFFFF,
        offsetY: 0x7FFFFFFF
      } as ShadowOptions;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowValue": shadowValue as ShadowOptions
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 13,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects009] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects009] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow3');
      await CommonFunc.sleep(2000);

      console.info("[testImageEffects009] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('radius'))
        .assertEqual("2147483648.000000");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('color'))
        .assertEqual(Color.White);
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetX'))
        .assertEqual("2147483648.000000");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetY'))
        .assertEqual("2147483648.000000");
      done()
    });



/**
     * @tc.number   testImageEffects_static_010
     * @tc.name     testImageEffects_static_010
     * @tc.desc     testImageEffects_static_010
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects010] START');
      await CommonFunc.sleep(1000);
      let shadowValue: ShadowValueInter = {
        radius: 'error',
        color: 'error',
        offsetX: 'error',
        offsetY: 'error'
      } as ShadowValueInter;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowValue": shadowValue as ShadowValueInter
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 13,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects010] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects010] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow3');

      console.info("[testImageEffects010] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      // expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('radius'))
      //   .assertEqual("0.000000");
      // expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('color'))
      //   .assertEqual('#FF000000');
      // expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetX'))
      //   .assertEqual("0.000000");
      // expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetY'))
      //   .assertEqual("0.000000");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('radius'))
        .assertEqual("2147483648.000000");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('color'))
        .assertEqual(Color.White);
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetX'))
        .assertEqual("2147483648.000000");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetY'))
        .assertEqual("2147483648.000000");
      done()
    });



/**
     * @tc.number   testImageEffects_static_011
     * @tc.name     testImageEffects_static_011
     * @tc.desc     testImageEffects_static_011
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_011', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testSizeSetting011] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('centerRow5');
      await CommonFunc.sleep(2000);
      console.info("[testImageEffects011] component strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('brightness')).assertEqual(20);
      done()
    });



/**
     * @tc.number   testImageEffects_static_012
     * @tc.name     testImageEffects_static_012
     * @tc.desc     testImageEffects_static_012
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_012', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects012] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "brightnessValue": 15 as Long
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 15,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects012] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects012] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow5');
      await CommonFunc.sleep(2000);

      console.info("[testImageEffects012] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('brightness')).assertEqual(15);
      done()
    });



// /**
//      * @tc.number   testImageEffects_static_013
//      * @tc.name     testImageEffects_static_013
//      * @tc.desc     testImageEffects_static_013
//      * @tc.level    Level.LEVEL2
//      */
// it('testImageEffects_static_013', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[testImageEffects012] START');
//       await CommonFunc.sleep(1000);
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "brightnessValue": 0x80000000 as Long
//           } as Record<String, undefined | null | Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 15,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info("[testImageEffects013] start to publish emit");
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err) {
//         console.log("[testImageEffects013] change component data error: " + err.message);
//       }
//       await CommonFunc.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('centerRow5');
//       await CommonFunc.sleep(2000);
//
//       console.info("[testImageEffects013] component JSON.parseJsonElement(strJsonNew) is: " +
//       JSON.stringify(JSON.parseJsonElement(strJsonNew)));
//       // expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('brightness')).assertEqual(0x80000000);
//       expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('brightness')).assertEqual(0);
//       done()
//     });



/**
     * @tc.number   testImageEffects_static_014
     * @tc.name     testImageEffects_static_014
     * @tc.desc     testImageEffects_static_014
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_014', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects014] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "brightnessValue": 0x7FFFFFFF as Long
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 15,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects014] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects014] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow5');
      await CommonFunc.sleep(2000);

      console.info("[testImageEffects014] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('brightness')).assertEqual(2147483647);
      done()
    });



/**
     * @tc.number   testImageEffects_static_015
     * @tc.name     testImageEffects_static_015
     * @tc.desc     testImageEffects_static_015
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_015', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects015] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "brightnessValue": 'error'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 15,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects015] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects015] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow5');
      await CommonFunc.sleep(2000);

      console.info("[testImageEffects015] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('brightness')).assertEqual(2147483647);
      done()
    });



/**
     * @tc.number   testImageEffects_static_016
     * @tc.name     testImageEffects_static_016
     * @tc.desc     testImageEffects_static_016
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_016', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects016] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('centerRow6');
      await CommonFunc.sleep(2000);
      console.info("[testImageEffects016] component strJson:" + strJson);
      console.info("[testImageEffects016] component strJson:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('saturate'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('saturate')).assertEqual(50);
      done()
    });



/**
     * @tc.number   testImageEffects_static_017
     * @tc.name     testImageEffects_static_017
     * @tc.desc     testImageEffects_static_017
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_017', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects017] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "saturateValue": 40 as Long
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 16,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects017] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects017] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow6');

      console.info("[testImageEffects017] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('saturate')).assertEqual(40);
      done()
    });



/**
     * @tc.number   testImageEffects_static_018
     * @tc.name     testImageEffects_static_018
     * @tc.desc     testImageEffects_static_018
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_018', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects018] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "saturateValue": -2147483648
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 16,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects018] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects018] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow6');
      await CommonFunc.sleep(2000);

      console.info("[testImageEffects018] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('saturate')).assertEqual(40);
      done()
    });



/**
     * @tc.number   testImageEffects_static_019
     * @tc.name     testImageEffects_static_019
     * @tc.desc     testImageEffects_static_019
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_019', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects019] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "saturateValue": 0x7FFFFFFF as Long
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 16,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects019] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects019] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow6');

      console.info("[testImageEffects019] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('saturate')).assertEqual(2147483647);
      done()
    });



/**
     * @tc.number   testImageEffects_static_020
     * @tc.name     testImageEffects_static_020
     * @tc.desc     testImageEffects_static_020
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects020] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "saturateValue": 'error'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 16,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects020] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects020] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow6');

      console.info("[testImageEffects020] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('saturate')).assertEqual(2147483647);
      done()
    });



/**
     * @tc.number   testImageEffects_static_021
     * @tc.name     testImageEffects_static_021
     * @tc.desc     testImageEffects_static_021
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_021', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testSizeSetting021] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('centerRow7');
      await CommonFunc.sleep(2000);
      console.info("[testImageEffects021] component strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('contrast')).assertEqual(20);
      done()
    });



/**
     * @tc.number   testImageEffects_static_022
     * @tc.name     testImageEffects_static_022
     * @tc.desc     testImageEffects_static_022
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_022', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects022] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "contrastValue": 10 as Long
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 17,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects022] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects022] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow7');

      console.info("[testImageEffects022] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('contrast')).assertEqual(10);
      done()
    });



/**
     * @tc.number   testImageEffects_static_023
     * @tc.name     testImageEffects_static_023
     * @tc.desc     testImageEffects_static_023
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_023', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects023] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "contrastValue": -2147483648
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 17,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects023] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects023] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow7');

      console.info("[testImageEffects023] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('contrast')).assertEqual(10);
      done()
    });



/**
     * @tc.number   testImageEffects_static_024
     * @tc.name     testImageEffects_static_024
     * @tc.desc     testImageEffects_static_024
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_024', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects024] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "contrastValue": 0x7FFFFFFF as Long
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 17,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects024] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects024] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow7');

      console.info("[testImageEffects024] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('contrast')).assertEqual(2147483647);
      done()
    });



/**
     * @tc.number   testImageEffects_static_025
     * @tc.name     testImageEffects_static_025
     * @tc.desc     testImageEffects_static_025
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_025', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects025] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "contrastValue": 'error'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 17,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects025] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects025] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow7');

      console.info("[testImageEffects025] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('contrast')).assertEqual(2147483647);
      done()
    });



/**
     * @tc.number   testImageEffects_static_026
     * @tc.name     testImageEffects_static_026
     * @tc.desc     testImageEffects_static_026
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_026', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testSizeSetting0026] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('centerRow8');
      await CommonFunc.sleep(2000);
      console.info("[testImageEffects026] component strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('invert')).assertEqual(1);
      done()
    });



/**
     * @tc.number   testImageEffects_static_027
     * @tc.name     testImageEffects_static_027
     * @tc.desc     testImageEffects_static_027
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_027', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects027] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "invertValue": 20.0
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 18,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects027] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects027] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow8');

      console.info("[testImageEffects027] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('invert')).assertEqual(1);
      done()
    });



/**
     * @tc.number   testImageEffects_static_028
     * @tc.name     testImageEffects_static_028
     * @tc.desc     testImageEffects_static_028
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_028', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects028] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "invertValue": 0.0
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 18,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects028] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects028] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow8');

      console.info("[testImageEffects028] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('invert')).assertEqual(0);
      done()
    });



/**
     * @tc.number   testImageEffects_static_029
     * @tc.name     testImageEffects_static_029
     * @tc.desc     testImageEffects_static_029
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_029', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects029] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "invertValue": 10000.0
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 18,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects029] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects029] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow8');

      console.info("[testImageEffects029] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('invert')).assertEqual(1);
      done()
    });



/**
     * @tc.number   testImageEffects_static_030
     * @tc.name     testImageEffects_static_030
     * @tc.desc     testImageEffects_static_030
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects030] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "invertValue": 'error'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 18,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects030] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects030] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow8');

      console.info("[testImageEffects030] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('invert')).assertEqual(1);
      done()
    });



/**
     * @tc.number   testImageEffects_static_031
     * @tc.name     testImageEffects_static_031
     * @tc.desc     testImageEffects_static_031
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_031', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects031] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('centerRow9');
      console.info("[testImageEffects031] component strJson:" + strJson);
      console.info("[testImageEffects031] component strJson:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shadow'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('hueRotate')).assertEqual(10);
      done()
    });



/**
     * @tc.number   testImageEffects_static_032
     * @tc.name     testImageEffects_static_032
     * @tc.desc     testImageEffects_static_032
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_032', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects032] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "hueRotateValue": 20 as Long
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 19,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects032] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects032] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow9');

      console.info("[testImageEffects032] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('hueRotate')).assertEqual(20);
      done()
    });


/**
     * @tc.number   testImageEffects_static_033
     * @tc.name     testImageEffects_static_033
     * @tc.desc     testImageEffects_static_033
     * @tc.level    Level.LEVEL2
     */
// it('testImageEffects_static_033', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[testImageEffects033] START');
//       await CommonFunc.sleep(1000);
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "hueRotateValue": 0x80000000 as Long
//           } as Record<String, undefined | null | Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 19,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info("[testImageEffects033] start to publish emit");
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err) {
//         console.log("[testImageEffects033] change component data error: " + err.message);
//       }
//       await CommonFunc.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('centerRow9');
//
//       console.info("[testImageEffects033] component JSON.parseJsonElement(strJsonNew) is: " +
//       JSON.stringify(JSON.parseJsonElement(strJsonNew)));
//       expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('hueRotate')).assertEqual(232);
//       done()
//     });


/**
     * @tc.number   testImageEffects_static_034
     * @tc.name     testImageEffects_static_034
     * @tc.desc     testImageEffects_static_034
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_034', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects034] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "hueRotateValue": 0x7FFFFFFF as Long
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 19,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects034] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects034] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow9');

      console.info("[testImageEffects034] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('hueRotate')).assertEqual(128);
      done()
    });


/**
     * @tc.number   testImageEffects_static_035
     * @tc.name     testImageEffects_static_035
     * @tc.desc     testImageEffects_static_035
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_035', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects035] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "hueRotateValue": 'error'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 19,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects035] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects035] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow9');

      console.info("[testImageEffects035] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('hueRotate')).assertEqual(128);
      done()
    });



/**
     * @tc.number   testImageEffects_static_036
     * @tc.name     testImageEffects_static_036
     * @tc.desc     testImageEffects_static_036
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_036', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects036] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_DEFAULT_XS
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects036] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects036] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects036] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('shadow'))
        .assertEqual('ShadowStyle.OuterDefaultXS');
      done()
    });



/**
     * @tc.number   testImageEffects_static_037
     * @tc.name     testImageEffects_static_037
     * @tc.desc     testImageEffects_static_037
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_037', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects037] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_DEFAULT_SM
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects037] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects037] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects037] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('shadow'))
        .assertEqual('ShadowStyle.OuterDefaultSM');
      done()
    });



/**
     * @tc.number   testImageEffects_static_038
     * @tc.name     testImageEffects_static_038
     * @tc.desc     testImageEffects_static_038
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_038', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects038] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_DEFAULT_MD
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects038] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects038] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects038] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('shadow'))
        .assertEqual('ShadowStyle.OuterDefaultMD');
      done()
    });



/**
     * @tc.number   testImageEffects_static_039
     * @tc.name     testImageEffects_static_039
     * @tc.desc     testImageEffects_static_039
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_039', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects039] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_DEFAULT_LG
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects039] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects039] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects039] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('shadow'))
        .assertEqual('ShadowStyle.OuterDefaultLG');
      done()
    });



/**
     * @tc.number   testImageEffects_static_040
     * @tc.name     testImageEffects_static_040
     * @tc.desc     testImageEffects_static_040
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects040] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_FLOATING_SM
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects040] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects040] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects040] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('shadow'))
        .assertEqual('ShadowStyle.OuterFloatingSM');
      done()
    });



/**
     * @tc.number   testImageEffects_static_041
     * @tc.name     testImageEffects_static_041
     * @tc.desc     testImageEffects_static_041
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_041', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects041] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_FLOATING_MD
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects041] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects041] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects041] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('shadow'))
        .assertEqual('ShadowStyle.OuterFloatingMD');
      done()
    });



/**
     * @tc.number   testImageEffects_static_042
     * @tc.name     testImageEffects_static_042
     * @tc.desc     testImageEffects_static_042
     * @tc.level    Level.LEVEL2
     */
it('testImageEffects_static_042', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testImageEffects042] START');
      await CommonFunc.sleep(1000);
      let shadowValue: ShadowOptions = {
        radius: 20.0,
        color: ColoringStrategy.AVERAGE,
        offsetX: 10.0,
        offsetY: 10.0
      } as ShadowOptions;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowValue": shadowValue as ShadowOptions
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 21,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects042] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects042] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('centerRow3');

      console.info("[testImageEffects042] component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('radius'))
        .assertEqual("20.000000");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('color'))
        .assertEqual("ColoringStrategy.AVERAGE");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetX'))
        .assertEqual("10.000000");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('shadow').getString('offsetY'))
        .assertEqual("10.000000");
      done()
    });
  })
}
