'use static';
/*
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
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium/index'
import events_emitter from '@ohos.events.emitter';
import Utils from "../../../ets/MainAbility/common/Utils";
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { $r } from '@ohos.arkui.component';
import { ArrowPosition, Resource } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function select() {
  describe('ActsAceSelectTest', () => {
    beforeAll(() => {
      console.info("ActsAceSelectTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.static", "EntryAbility");

    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Select/SelectIndex",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Select state pages:" + JSON.stringify(pages));
        if (!("SelectIndex" == pages.name)) {
          console.info("get Select pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Select page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Select page error " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      console.info("select beforeEach start");
      // done();
    })

    // afterEach( async (done: () => void): Promise<void> => {
    //   console.info("[selectTest_afterEach] start");
    //   let spaceValueString = undefined;
    //   try {
    //     let eventData: events_emitter.EventData = {
    //       data: {
    //         "spaceValue": 8,
    //         "arrowPosition": ArrowPosition.END,
    //         "spaceValueString": spaceValueString
    //       } as Record<String,RecordData>
    //     }
    //     let innerEvent: events_emitter.InnerEvent = {
    //       eventId: 181,
    //       priority: events_emitter.EventPriority.LOW
    //     }
    //     console.info("[selectTest_afterEach] start to publish emit");
    //     events_emitter.emit(innerEvent, eventData);
    //   } catch (err: Error) {
    //     console.log("[selectTest_afterEach] change component data error: " + err.message);
    //   }
    //   done();
    // })

    
    /**
     * @tc.number   ArkUI_Stage_Select2_Layout_static_0100
     * @tc.name     ArkUI_Stage_Select2_Layout_static_0100
     * @tc.desc     ArkUI_Stage_Select2_Layout_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select2_Layout_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select2_Layout_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select2_Layout_static_0100: arrowPosition=" +
      objNew.getElement('$attrs').getString('arrowPosition'))
      expect(objNew.getElement('$attrs').getString("arrowPosition") == 'ArrowPosition.END').assertTrue();
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Select2_Layout_static_0200
     * @tc.name     ArkUI_Stage_Select2_Layout_static_0200
     * @tc.desc     ArkUI_Stage_Select2_Layout_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select2_Layout_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select2_Layout_static_0200 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "arrowPosition": ArrowPosition.START as ArrowPosition
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_Select2_Layout_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select2_Layout_static_0200] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Select2_Layout_static_0200] arrowPosition:" +
      objNew.getElement('$attrs').getString("arrowPosition"));
      expect(objNew.getElement('$attrs').getString('arrowPosition') == 'ArrowPosition.START').assertTrue();
      done();
    });
    
    /**
     * @tc.number   ArkUI_Stage_Select2_Space_static_0100
     * @tc.name     ArkUI_Stage_Select2_Space_static_0100
     * @tc.desc     ArkUI_Stage_Select2_Space_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select2_Space_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select2_Space_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select2_Space_static_0100: space=" + objNew.getElement('$attrs').getString("space"));
      expect(objNew.getElement('$attrs').getString("space")).assertEqual('8.00vp');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select2_Space_static_0200
     * @tc.name     ArkUI_Stage_Select2_Space_static_0200
     * @tc.desc     ArkUI_Stage_Select2_Space_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select2_Space_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select2_Space_static_0200 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValue": 20.00
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_Select2_Space_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select2_Space_static_0200] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Select2_Space_static_0200] space:" + objNew.getElement('$attrs').getString("space"));
      expect(objNew.getElement('$attrs').getString("space")).assertEqual('20.00vp');
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Select2_Space_static_0300
     * @tc.name     ArkUI_Stage_Select2_Space_static_0300
     * @tc.desc     ArkUI_Stage_Select2_Space_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select2_Space_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select2_Space_static_0300 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": '40.00vp'
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_Select2_Space_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select2_Space_static_0300] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest2');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Select2_Space_static_0300] space:" + objNew.getElement('$attrs').getString("space"));
      expect(objNew.getElement('$attrs').getString("space")).assertEqual('40.00vp');
      done();
    });

    
//      /*
//      * @tc.number   ArkUI_Stage_Select2_Space_static_0400
//      * @tc.name     ArkUI_Stage_Select2_Space_static_0400
//      * @tc.desc     ArkUI_Stage_Select2_Space_static_0400
//      * @tc.level    Level.LEVEL1
//      */
// it('ArkUI_Stage_Select2_Space_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
//       console.info("ArkUI_Stage_Select2_Space_static_0400 start");
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "spaceValue": null // 异常值
//           } as Record<string, RecordData>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 181,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info("[ArkUI_Stage_Select2_Space_static_0400] start to publish emit");
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err: Error) {
//         console.log("[ArkUI_Stage_Select2_Space_static_0400] change component data error: " + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJson = inspector.getInspectorByKey('selectTest');
//       let objNew = JSON.parseJsonElement(strJson);
//       console.info("[ArkUI_Stage_Select2_Space_static_0400] space:" + objNew.getElement('$attrs').getString("space"));
//       expect(objNew.getElement('$attrs').getString("space")).assertEqual('8.00vp');
//       done();
//     });
//
//
//     /*
//      * @tc.number   ArkUI_Stage_Select2_Space_static_0500
//      * @tc.name     ArkUI_Stage_Select2_Space_static_0500
//      * @tc.desc     ArkUI_Stage_Select2_Space_static_0500
//      * @tc.level    Level.LEVEL1
//      */
// it('ArkUI_Stage_Select2_Space_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
//       console.info("ArkUI_Stage_Select2_Space_static_0500 start");
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "spaceValue": -1 // 异常值
//           } as Record<string, RecordData>
//         } as events_emitter.EventData
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 181,
//           priority: events_emitter.EventPriority.LOW
//         } as events_emitter.InnerEvent
//         console.info("[ArkUI_Stage_Select2_Space_static_0500] start to publish emit");
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err) {
//         console.log("[ArkUI_Stage_Select2_Space_static_0500] change component data error: " + (err as Error).message);
//       }
//       await Utils.sleep(2000);
//       let strJson = inspector.getInspectorByKey('selectTest');
//       let objNew = JSON.parseJsonElement(strJson);
//       console.info("[ArkUI_Stage_Select2_Space_static_0500] space:" + objNew.getElement('$attrs').getString("space"));
//       expect(objNew.getElement('$attrs').getString("space")).assertEqual('8.00vp');
//       done();
//     });


    
    /**
     * @tc.number   ArkUI_Stage_Select2_Space_static_0600
     * @tc.name     ArkUI_Stage_Select2_Space_static_0600
     * @tc.desc     ArkUI_Stage_Select2_Space_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select2_Space_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select2_Space_static_0600 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueResource": $r('app.string.Test_Values') as Resource
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_Select2_Space_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select2_Space_static_0600] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest3');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Select2_Space_static_0600] space:" + objNew.getElement('$attrs').getString("space"));
      expect(objNew.getElement('$attrs').getString("space")).assertEqual('50.00vp');
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Select2_Space_static_0700
     * @tc.name     ArkUI_Stage_Select2_Space_static_0700
     * @tc.desc     ArkUI_Stage_Select2_Space_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select2_Space_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select2_Space_static_0700 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": "40.00px"
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_Select2_Space_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select2_Space_static_0700] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest2');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Select2_Space_static_0700] space:" + objNew.getElement('$attrs').getString("space"));
      expect(objNew.getElement('$attrs').getString("space")).assertEqual('40.00px');
      //expect(objNew.getElement('$attrs').space == expectString).assertTrue();
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select2_Space_static_0800
     * @tc.name     ArkUI_Stage_Select2_Space_static_0800
     * @tc.desc     ArkUI_Stage_Select2_Space_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select2_Space_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select2_Space_static_0800 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": "40.00lpx"
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_Select2_Space_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select2_Space_static_0800] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest2');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Select2_Space_static_0800] space:" + objNew.getElement('$attrs').getString("space"));
      expect(objNew.getElement('$attrs').getString("space")).assertEqual('40.00lpx');
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_Select2_Space_static_0900
     * @tc.name     ArkUI_Stage_Select2_Space_static_0900
     * @tc.desc     ArkUI_Stage_Select2_Space_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select2_Space_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select2_Space_static_0900 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": "40.00fp"
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_Select2_Space_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select2_Space_static_0900] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest2');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Select2_Space_static_0900] space:" + objNew.getElement('$attrs').getString("space"));
      expect(objNew.getElement('$attrs').getString("space")).assertEqual('40.00fp');
      done();
    });

  })
}