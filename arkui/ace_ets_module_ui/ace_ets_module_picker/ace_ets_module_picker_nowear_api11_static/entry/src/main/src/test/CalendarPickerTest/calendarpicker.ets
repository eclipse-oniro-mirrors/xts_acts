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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Color, FontWeight, CalendarAlign, PickerTextStyle } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function calendarpicker() {
  describe('ActsAceCalendarPickerTest', () => {
    beforeAll(() => {
      console.info("ActsAceCalendarPickerTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.static", "EntryAbility");

    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CalendarPicker/CalendarPickerIndex",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CalendarPickerIndex state pages:" + JSON.stringify(pages));
        if (!("CalendarPickerIndex" == pages.name)) {
          console.info("get CalendarPickerIndex pages.name:" + JSON.stringify(pages.name));
          let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CalendarPickerIndex page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CalendarPicker page error " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      console.info("CalendarPicker beforeEach start");
      // done();
    })


    /*
         * @tc.number   ArkUI_Stage_CalendarPicker_textStyle_static_0100
         * @tc.name     ArkUI_Stage_CalendarPicker_textStyle_static_0100
         * @tc.desc     ArkUI_Stage_CalendarPicker_textStyle_static_0100
         * @tc.level    Level.LEVEL1
         */
    it('ArkUI_Stage_CalendarPicker_textStyle_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('CalendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_textStyle_static_0100] Color:" +
      obj.getElement('$attrs').getElement('textStyle').getString("color"));

      expect(obj.getElement('$attrs').getElement('textStyle').getString("color")).assertEqual('#FF000000');

      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size')).assertEqual('8.00fp');

      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Lighter');
      done();
    });


    /*
         * @tc.number   ArkUI_Stage_CalendarPicker_textStyle_static_0200
         * @tc.name     ArkUI_Stage_CalendarPicker_textStyle_static_0200
         * @tc.desc     ArkUI_Stage_CalendarPicker_textStyle_static_0200
         * @tc.level    Level.LEVEL1
         */
    it('ArkUI_Stage_CalendarPicker_textStyle_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: '#ff0000', font: {
          size: '1px', weight: '700'
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value as PickerTextStyle
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_static_0200] change component data error: " +
        (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('CalendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_textStyle_static_0200] color:" +
      obj.getElement('$attrs').getElement('textStyle').getString('color'));

      expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual('#FFFF0000');

      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("size"))
        .assertEqual('1.00px');

      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("weight"))
        .assertEqual('700');
      done();
    });


    /*
         * @tc.number   ArkUI_Stage_CalendarPicker_textStyle_static_0300
         * @tc.name     ArkUI_Stage_CalendarPicker_textStyle_static_0300
         * @tc.desc     ArkUI_Stage_CalendarPicker_textStyle_static_0300
         * @tc.level    Level.LEVEL1
         */
    it('ArkUI_Stage_CalendarPicker_textStyle_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: Color.Green, font: {
          size: 30, weight: 450
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value as PickerTextStyle
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_static_0300] change component data error: " +
        (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('CalendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_textStyle_static_0300] color:" +
      obj.getElement('$attrs').getElement('textStyle').getString("color"));

      expect(obj.getElement('$attrs').getElement('textStyle').getString("color")).assertEqual('#FF008000');

      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("size"))
        .assertEqual('30.00fp');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("weight"))
        .assertEqual('FontWeight.Normal');
      done();
    });


    /*
         * @tc.number   ArkUI_Stage_CalendarPicker_textStyle_static_0400
         * @tc.name     ArkUI_Stage_CalendarPicker_textStyle_static_0400
         * @tc.desc     ArkUI_Stage_CalendarPicker_textStyle_static_0400
         * @tc.level    Level.LEVEL1
         */
    it('ArkUI_Stage_CalendarPicker_textStyle_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: '#80808g', font: {
          size: -1, weight: 1000
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value as PickerTextStyle
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_static_0400] change component data error: " +
        (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('CalendarPicker');
      let obj = JSON.parseJsonElement(strJson);

      let strJsonDefault = inspector.getInspectorByKey('CalendarPickerDefault');
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      console.info("[ArkUI_Stage_CalendarPicker_textStyle_static_0400] color:" +
      obj.getElement('$attrs').getElement('textStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textStyle').getString("color"))
        .assertEqual(objDefault.getElement("$attrs").getElement("textStyle").getString("color"));
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("size"))
        .assertEqual(objDefault.getElement("$attrs").getElement("textStyle").getElement('font').getString("size"));
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("weight"))
        .assertEqual('FontWeight.Normal');
      done();
    });


    /*
         * @tc.number   ArkUI_Stage_CalendarPicker_textStyle_static_0500
         * @tc.name     ArkUI_Stage_CalendarPicker_textStyle_static_0500
         * @tc.desc     ArkUI_Stage_CalendarPicker_textStyle_static_0500
         * @tc.level    Level.LEVEL1
         */
    it('ArkUI_Stage_CalendarPicker_textStyle_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'xxx', font: {
          size: 'xxx', weight: FontWeight.Bold
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value as PickerTextStyle
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_static_0500] change component data error: " +
        (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('CalendarPicker');
      let obj = JSON.parseJsonElement(strJson);

      let strJsonDefault = inspector.getInspectorByKey('CalendarPickerDefault');
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      console.info("[ArkUI_Stage_CalendarPicker_textStyle_static_0500] color:" +
      obj.getElement('$attrs').getElement('textStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textStyle').getString("color"))
        .assertEqual(objDefault.getElement("$attrs").getElement("textStyle").getString("color"));
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("size"))
        .assertEqual(objDefault.getElement("$attrs").getElement("textStyle").getElement('font').getString("size"));
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("weight"))
        .assertEqual('FontWeight.Bold');
      done();
    });


    /*
         * @tc.number   ArkUI_Stage_CalendarPicker_textStyle_static_0600
         * @tc.name     ArkUI_Stage_CalendarPicker_textStyle_static_0600
         * @tc.desc     ArkUI_Stage_CalendarPicker_textStyle_static_0600
         * @tc.level    Level.LEVEL1
         */
    it('ArkUI_Stage_CalendarPicker_textStyle_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'rgb(138,43,226)', font: {
          size: '20vp', weight: 900
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value as PickerTextStyle
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_static_0600] change component data error: " +
        (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('CalendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('textStyle').getString("color")).assertEqual('#FF8A2BE2');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("size"))
        .assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("weight"))
        .assertEqual('900');
      done();
    });


    /*
         * @tc.number   ArkUI_Stage_CalendarPicker_textStyle_static_0700
         * @tc.name     ArkUI_Stage_CalendarPicker_textStyle_static_0700
         * @tc.desc     ArkUI_Stage_CalendarPicker_textStyle_static_0700
         * @tc.level    Level.LEVEL1
         */
    it('ArkUI_Stage_CalendarPicker_textStyle_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'rgb(138,43,226)', font: {
          size: '15lpx', weight: 90
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value as PickerTextStyle
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_static_0700] change component data error: " +
        (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('CalendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('textStyle').getString("color")).assertEqual('#FF8A2BE2');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("size"))
        .assertEqual('15.00lpx');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString("weight"))
        .assertEqual('FontWeight.Normal');
      done();
    });


    /*
         * @tc.number   ArkUI_Stage_CalendarPicker_EdgeAlign_static_0100
         * @tc.name     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0100
         * @tc.desc     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0100
         * @tc.level    Level.LEVEL1
         */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('CalendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0100] edgeAlign:" +
      obj.getElement('$attrs').getElement('edgeAlign'));
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0100] edgeAlign.alignType:" +
      obj.getElement('$attrs').getElement('edgeAlign').getString("alignType"));
      // expect(obj.$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.END');
      expect(obj.getElement('$attrs').getElement('edgeAlign').getString("alignType")).assertEqual('CalendarAlign.END');
      done();
    });


    /*
         * @tc.number   ArkUI_Stage_CalendarPicker_EdgeAlign_static_0200
         * @tc.name     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0200
         * @tc.desc     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0200
         * @tc.level    Level.LEVEL1
         */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "edgeAlign": CalendarAlign.CENTER as CalendarAlign
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
        console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0200] eventData:" + JSON.stringify(eventData));
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0200] change component data error: " +
        (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('CalendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0200] edgeAlign:" +
      obj.getElement('$attrs').getElement('edgeAlign'));
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0200] edgeAlign.alignType:" +
      obj.getElement('$attrs').getElement('edgeAlign').getString("alignType"));
      expect(obj.getElement('$attrs').getElement('edgeAlign').getString("alignType"))
        .assertEqual('CalendarAlign.CENTER');
      done();
    });


    /*
         * @tc.number   ArkUI_Stage_CalendarPicker_EdgeAlign_static_0300
         * @tc.name     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0300
         * @tc.desc     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0300
         * @tc.level    Level.LEVEL1
         */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "edgeAlign": CalendarAlign.START as CalendarAlign
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0300] change component data error: " +
        (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('CalendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0300] edgeAlign.alignType:" +
      obj.getElement('$attrs').getElement('edgeAlign').getString("alignType"));
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0300] edgeAlign.offset.dx:" + obj.getElement('$attrs').getElement('edgeAlign').getElement('offset').getString('dx'));
      expect(obj.getElement('$attrs').getElement('edgeAlign').getString("alignType"))
        .assertEqual('CalendarAlign.START');
      done();
    });


    // /*
    //      * @tc.number   ArkUI_Stage_CalendarPicker_EdgeAlign_static_0400
    //      * @tc.name     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0400
    //      * @tc.desc     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0400
    //      * @tc.level    Level.LEVEL1
    //      */
    // it('ArkUI_Stage_CalendarPicker_EdgeAlign_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   try {
    //     let eventData: events_emitter.EventData = {
    //       data: {
    //         "edgeAlign": "edgeAlign" // 异常值
    //       } as Record<string, RecordData>
    //     } as events_emitter.EventData
    //     let innerEvent: events_emitter.InnerEvent = {
    //       eventId: 185,
    //       priority: events_emitter.EventPriority.LOW
    //     } as events_emitter.InnerEvent
    //     console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0400] start to publish emit");
    //     events_emitter.emit(innerEvent, eventData);
    //     console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0400] eventData:" + JSON.stringify(eventData));
    //   } catch (err) {
    //     console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0400] change component data error: " +
    //     (err as Error).message);
    //   }
    //   await Utils.sleep(3000);
    //   let strJson = inspector.getInspectorByKey('CalendarPicker');
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0400] edgeAlign.alignType:" +
    //   obj.getElement('$attrs').getElement('edgeAlign').getString("alignType"));
    //   // expect(obj.$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.END');
    //   expect(obj.getElement('$attrs').getElement('edgeAlign').getString("alignType")).assertEqual('CalendarAlign.END');
    //   done();
    // });
    //
    //
    // // unKnow 暂时注释
    // /*
    //  * @tc.number   ArkUI_Stage_CalendarPicker_EdgeAlign_static_0500
    //  * @tc.name     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0500
    //  * @tc.desc     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0500
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_Stage_CalendarPicker_EdgeAlign_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   try {
    //     let eventData: events_emitter.EventData = {
    //       data: {
    //         "edgeAlign": null  // 异常值
    //       } as Record<String, RecordData>
    //     }
    //     let innerEvent: events_emitter.InnerEvent = {
    //       eventId: 185,
    //       priority: events_emitter.EventPriority.LOW
    //     }
    //     console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0500] start to publish emit");
    //     events_emitter.emit(innerEvent, eventData);
    //   } catch (err) {
    //     console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0500] change component data error: " + (err as Error).message);
    //   }
    //   await Utils.sleep(3000);
    //   let strJson = inspector.getInspectorByKey('CalendarPicker');
    //   let obj = JSON.parseJsonElement(strJson);
    //   // expect(obj.$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.END');
    //   expect(obj.getElement('$attrs').getElement('edgeAlign').getString("alignType")).assertEqual('CalendarAlign.END');
    //   done();
    // });


    /**
     * @tc.number   ArkUI_Stage_CalendarPicker_EdgeAlign_static_0600
     * @tc.name     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0600
     * @tc.desc     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('CalendarPicker1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0600] edgeAlign.alignType:" +
      obj.getElement('$attrs').getElement('edgeAlign').getString("alignType"));
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0600] edgeAlign.offset.dx:" +
      obj.getElement('$attrs').getElement('edgeAlign').getElement("offset").getString('dx'));
      expect(obj.getElement('$attrs').getElement('edgeAlign').getString("alignType"))
        .assertEqual('CalendarAlign.START');
      expect(obj.getElement('$attrs').getElement('edgeAlign').getElement('offset').getString("dx"))
        .assertEqual('5.00vp');
      expect(obj.getElement('$attrs').getElement('edgeAlign').getElement('offset').getString("dy"))
        .assertEqual('5.00vp');
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_CalendarPicker_EdgeAlign_static_0700
     * @tc.name     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0700
     * @tc.desc     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('CalendarPicker2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0700] edgeAlign.alignType:" +
      obj.getElement('$attrs').getElement('edgeAlign').getString("alignType"));
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0700] edgeAlign.offset.dx:" +
      obj.getElement('$attrs').getElement('edgeAlign').getElement("offset").getString("dx"));
      expect(obj.getElement('$attrs').getElement('edgeAlign').getString("alignType"))
        .assertEqual('CalendarAlign.CENTER');
      expect(obj.getElement('$attrs').getElement('edgeAlign').getElement('offset').getString("dx"))
        .assertEqual('-10.00vp');
      expect(obj.getElement('$attrs').getElement('edgeAlign').getElement('offset').getString("dy"))
        .assertEqual('0.00vp');
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_CalendarPicker_EdgeAlign_static_0800
     * @tc.name     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0800
     * @tc.desc     ArkUI_Stage_CalendarPicker_EdgeAlign_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('CalendarPicker3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0800] edgeAlign.alignType:" +
      obj.getElement('$attrs').getElement('edgeAlign').getString("alignType"));
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_static_0800] edgeAlign.offset.dx:" +
      obj.getElement('$attrs').getElement('edgeAlign').getElement("offset").getString("dx"));
      expect(obj.getElement('$attrs').getElement('edgeAlign').getString("alignType")).assertEqual('CalendarAlign.END');
      expect(obj.getElement('$attrs').getElement('edgeAlign').getElement('offset').getString("dx"))
        .assertEqual('-20.00vp');
      expect(obj.getElement('$attrs').getElement('edgeAlign').getElement('offset').getString("dy"))
        .assertEqual('-10.00vp');
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_CalendarPicker_hintRadius_static_0100
     * @tc.name     ArkUI_Stage_CalendarPicker_hintRadius_static_0100
     * @tc.desc     ArkUI_Stage_CalendarPicker_hintRadius_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Stage_CalendarPicker_hintRadius_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('CalendarPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_hintRadius_static_0100] hintRadius:" + obj.getElement('$attrs').tryGetElement('hintRadius'));
      expect(obj.getElement('$attrs').tryGetElement("hintRadius")).assertEqual(undefined);
      done();
    });

  })
}
