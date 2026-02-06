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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
import events_emitter from '@ohos.events.emitter'
import Utils from '../../../ets/MainAbility/common/Utils'
import { Color, FontWeight, Length,PickerTextStyle } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}


export default function textpicker() {
  describe('textpicker', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextPicker/Index",
      }

      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("[TextPickerMulti] current page is: " + JSON.stringify(pages.name));
        if (!('MainAbility/pages/TextPicker/Index' == pages.name)) {
          router.pushUrl(options);
        }
      } catch (err) {
        console.info("push TextPickerMulti page page error " + JSON.stringify(err));
      }
      await sleep(2);
    });
    afterEach(async (): Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.pushUrl({url:'MainAbility/pages/index/index'});
      await sleep(2);
    })
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_disappearTextStyle_static_0100
     * @tc.name     ArkUI_Stage_textpicker_disappearTextStyle_static_0100
     * @tc.desc     ArkUI_Stage_textpicker_disappearTextStyle_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_disappearTextStyle_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0100] disappearColor:" + obj.getElement('$attrs').getElement('disappearTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('color')).assertEqual('#FF000000');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size')).assertEqual('8.00fp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Lighter');
      done();
    });

    
    /**
     * @tc.number   ArkUI_Stage_textpicker_disappearTextStyle_static_0200
     * @tc.name     ArkUI_Stage_textpicker_disappearTextStyle_static_0200
     * @tc.desc     ArkUI_Stage_textpicker_disappearTextStyle_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_disappearTextStyle_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: Color.Black, font: {
          size: 8, weight: FontWeight.Bolder
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_disappearTextStyle_static_0200] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.error("[ArkUI_Stage_textpicker_disappearTextStyle_static_0200] disappearColor:" + obj.getElement('$attrs').getElement('disappearTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('color')).assertEqual('#FF000000');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size')).assertEqual('8.00fp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Bolder');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_disappearTextStyle_static_0300
     * @tc.name     ArkUI_Stage_textpicker_disappearTextStyle_static_0300
     * @tc.desc     ArkUI_Stage_textpicker_disappearTextStyle_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_disappearTextStyle_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 0x808080, font: {
          size: 8, weight: 100
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_disappearTextStyle_static_0300] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0300] disappearColor:" + obj.getElement('$attrs').getElement('disappearTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('color')).assertEqual('#FF808080');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size')).assertEqual('8.00fp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('weight')).assertEqual('100');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_disappearTextStyle_static_0400
     * @tc.name     ArkUI_Stage_textpicker_disappearTextStyle_static_0400
     * @tc.desc     ArkUI_Stage_textpicker_disappearTextStyle_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_disappearTextStyle_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: '#ff0000', font: {
          size: '1px', weight: '700'
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_disappearTextStyle_static_0400] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0400] disappearColor:" + obj.getElement('$attrs').getElement('disappearTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('color')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size')).assertEqual('1.00px');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('weight')).assertEqual('700');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_disappearTextStyle_static_0500
     * @tc.name     ArkUI_Stage_textpicker_disappearTextStyle_static_0500
     * @tc.desc     ArkUI_Stage_textpicker_disappearTextStyle_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_disappearTextStyle_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: Color.Green, font: {
          size: 30, weight: 450
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_disappearTextStyle_static_0500] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0500] disappearColor:" + obj.getElement('$attrs').getElement('disappearTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('color')).assertEqual('#FF008000');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size')).assertEqual('30.00fp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_disappearTextStyle_static_0600
     * @tc.name     ArkUI_Stage_textpicker_disappearTextStyle_static_0600
     * @tc.desc     ArkUI_Stage_textpicker_disappearTextStyle_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_disappearTextStyle_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: '#80808g', font: {
          size: -1, weight: 1000
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_disappearTextStyle_static_0600] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);

      let strJsonDefault = inspector.getInspectorByKey('textPickerDefault');
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0600] disappearColor:" + obj.getElement('$attrs').getElement('disappearTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('color')).assertEqual(objDefault.getElement('$attrs').getElement('disappearTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size')).assertEqual(objDefault.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size'));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_disappearTextStyle_static_0700
     * @tc.name     ArkUI_Stage_textpicker_disappearTextStyle_static_0700
     * @tc.desc     ArkUI_Stage_textpicker_disappearTextStyle_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_disappearTextStyle_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'xxx', font: {
          size: 'xxx', weight: FontWeight.Bold
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_disappearTextStyle_static_0700] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);

      let strJsonDefault = inspector.getInspectorByKey('textPickerDefault');
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0700] disappearColor:" + obj.getElement('$attrs').getElement('disappearTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('color')).assertEqual(objDefault.getElement('$attrs').getElement('disappearTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size')).assertEqual(objDefault.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size'));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Bold');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_disappearTextStyle_static_0800
     * @tc.name     ArkUI_Stage_textpicker_disappearTextStyle_static_0800
     * @tc.desc     ArkUI_Stage_textpicker_disappearTextStyle_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_disappearTextStyle_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'rgb(138,43,226)', font: {
          size: '20vp', weight: 900
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_disappearTextStyle_static_0800] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('color')).assertEqual('#FF8A2BE2');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('weight')).assertEqual('900');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_disappearTextStyle_static_0900
     * @tc.name     ArkUI_Stage_textpicker_disappearTextStyle_static_0900
     * @tc.desc     ArkUI_Stage_textpicker_disappearTextStyle_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_disappearTextStyle_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'rgb(138,43,226)', font: {
          size: '15lpx', weight: 90
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_disappearTextStyle_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_disappearTextStyle_static_0900] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('color')).assertEqual('#FF8A2BE2');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size')).assertEqual('15.00lpx');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });


    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_textStyle_static_0100
     * @tc.name     ArkUI_Stage_textpicker_textStyle_static_0100
     * @tc.desc     ArkUI_Stage_textpicker_textStyle_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_textStyle_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_textStyle_static_0100] disappearColor:" + obj.getElement('$attrs').getElement('textStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size')).assertEqual('10.00px');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_textStyle_static_0200
     * @tc.name     ArkUI_Stage_textpicker_textStyle_static_0200
     * @tc.desc     ArkUI_Stage_textpicker_textStyle_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_textStyle_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: Color.Red, font: {
          size: '10px', weight: FontWeight.Bolder
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_textStyle_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_textStyle_static_0200] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.error("[ArkUI_Stage_textpicker_textStyle_static_0200] disappearColor:" + obj.getElement('$attrs').getElement('textStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size')).assertEqual('10.00px');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Bolder');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_textStyle_static_0300
     * @tc.name     ArkUI_Stage_textpicker_textStyle_static_0300
     * @tc.desc     ArkUI_Stage_textpicker_textStyle_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_textStyle_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 0xFF808080.toInt(), font: {
          size: '10px', weight: 100
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_textStyle_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_textStyle_static_0300] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_textStyle_static_0300] disappearColor:" + obj.getElement('$attrs').getElement('textStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual('#FF808080');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size')).assertEqual('10.00px');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight')).assertEqual('100');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_textStyle_static_0400
     * @tc.name     ArkUI_Stage_textpicker_textStyle_static_0400
     * @tc.desc     ArkUI_Stage_textpicker_textStyle_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_textStyle_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: '#00ff00', font: {
          size: '1px', weight: '700'
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_textStyle_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_textStyle_static_0400] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_textStyle_static_0400] disappearColor:" + obj.getElement('$attrs').getElement('textStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual('#FF00FF00');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size')).assertEqual('1.00px');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight')).assertEqual('700');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_textStyle_static_0500
     * @tc.name     ArkUI_Stage_textpicker_textStyle_static_0500
     * @tc.desc     ArkUI_Stage_textpicker_textStyle_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_textStyle_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: Color.Green, font: {
          size: 30, weight: 450
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_textStyle_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_textStyle_static_0500] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_textStyle_static_0500] disappearColor:" + obj.getElement('$attrs').getElement('textStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual('#FF008000');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size')).assertEqual('30.00fp');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_textStyle_static_0600
     * @tc.name     ArkUI_Stage_textpicker_textStyle_static_0600
     * @tc.desc     ArkUI_Stage_textpicker_textStyle_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_textStyle_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: '#80808g', font: {
          size: -1, weight: 1000
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_textStyle_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_textStyle_static_0600] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);

      let strJsonDefault = inspector.getInspectorByKey('textPickerDefault');
      let objDefault = JSON.parseJsonElement(strJsonDefault)

      console.info("[ArkUI_Stage_textpicker_textStyle_static_0600] disappearColor:" + obj.getElement('$attrs').getElement('textStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual(objDefault.getElement('$attrs').getElement('textStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size')).assertEqual(objDefault.getElement('$attrs').getElement('textStyle').getElement('font').getString('size'));
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_textStyle_static_0700
     * @tc.name     ArkUI_Stage_textpicker_textStyle_static_0700
     * @tc.desc     ArkUI_Stage_textpicker_textStyle_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_textStyle_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'xxx', font: {
          size: 'xxx', weight: FontWeight.Lighter
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_textStyle_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_textStyle_static_0700] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);

      let strJsonDefault = inspector.getInspectorByKey('textPickerDefault');
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      console.info("[ArkUI_Stage_textpicker_textStyle_static_0700] disappearColor:" + obj.getElement('$attrs').getElement('textStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual(objDefault.getElement('$attrs').getElement('textStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size')).assertEqual(objDefault.getElement('$attrs').getElement('textStyle').getElement('font').getString('size'));
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Lighter');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_textStyle_static_0800
     * @tc.name     ArkUI_Stage_textpicker_textStyle_static_0800
     * @tc.desc     ArkUI_Stage_textpicker_textStyle_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_textStyle_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'rgb(138,43,226)', font: {
          size: '20vp', weight: 900
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_textStyle_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_textStyle_static_0800] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual('#FF8A2BE2');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight')).assertEqual('900');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_textStyle_static_0900
     * @tc.name     ArkUI_Stage_textpicker_textStyle_static_0900
     * @tc.desc     ArkUI_Stage_textpicker_textStyle_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_textStyle_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'rgb(138,43,226)', font: {
          size: '15lpx', weight: 90
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_textStyle_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_textStyle_static_0900] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual('#FF8A2BE2');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size')).assertEqual('15.00lpx');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_selectedTextStyle_static_0100
     * @tc.name     ArkUI_Stage_textpicker_selectedTextStyle_static_0100
     * @tc.desc     ArkUI_Stage_textpicker_selectedTextStyle_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_selectedTextStyle_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0100] disappearColor:" + obj.getElement('$attrs').getElement('selectedTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('color')).assertEqual('#FF0000FF');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size')).assertEqual('20.00px');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Bold');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_selectedTextStyle_static_0200
     * @tc.name     ArkUI_Stage_textpicker_selectedTextStyle_static_0200
     * @tc.desc     ArkUI_Stage_textpicker_selectedTextStyle_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_selectedTextStyle_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: Color.Blue, font: {
          size: '20px', weight: FontWeight.Bolder
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_selectedTextStyle_static_0200] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.error("[ArkUI_Stage_textpicker_selectedTextStyle_static_0200] disappearColor:" + obj.getElement('$attrs').getElement('selectedTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('color')).assertEqual('#FF0000FF');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size')).assertEqual('20.00px');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Bolder');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_selectedTextStyle_static_0300
     * @tc.name     ArkUI_Stage_textpicker_selectedTextStyle_static_0300
     * @tc.desc     ArkUI_Stage_textpicker_selectedTextStyle_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_selectedTextStyle_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 0xFF808080.toInt(), font: {
          size: '20px', weight: 100
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_selectedTextStyle_static_0300] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0300] disappearColor:" + obj.getElement('$attrs').getElement('selectedTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('color')).assertEqual('#FF808080');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size')).assertEqual('20.00px');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('weight')).assertEqual('100');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_selectedTextStyle_static_0400
     * @tc.name     ArkUI_Stage_textpicker_selectedTextStyle_static_0400
     * @tc.desc     ArkUI_Stage_textpicker_selectedTextStyle_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_selectedTextStyle_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: '#00ff00', font: {
          size: '1px', weight: '700'
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_selectedTextStyle_static_0400] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0400] disappearColor:" + obj.getElement('$attrs').getElement('selectedTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('color')).assertEqual('#FF00FF00');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size')).assertEqual('1.00px');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('weight')).assertEqual('700');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_selectedTextStyle_static_0500
     * @tc.name     ArkUI_Stage_textpicker_selectedTextStyle_static_0500
     * @tc.desc     ArkUI_Stage_textpicker_selectedTextStyle_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_selectedTextStyle_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: Color.Green, font: {
          size: 30, weight: 450
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_selectedTextStyle_static_0500] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0500] disappearColor:" + obj.getElement('$attrs').getElement('selectedTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('color')).assertEqual('#FF008000');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size')).assertEqual('30.00fp');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_selectedTextStyle_static_0600
     * @tc.name     ArkUI_Stage_textpicker_selectedTextStyle_static_0600
     * @tc.desc     ArkUI_Stage_textpicker_selectedTextStyle_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_selectedTextStyle_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: '#80808g', font: {
          size: -1, weight: 1000
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_selectedTextStyle_static_0600] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);

      let strJsonDefault = inspector.getInspectorByKey('textPickerDefault');
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0600] disappearColor:" + obj.getElement('$attrs').getElement('selectedTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('color')).assertEqual(objDefault.getElement('$attrs').getElement('selectedTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size')).assertEqual(objDefault.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size'));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_selectedTextStyle_static_0700
     * @tc.name     ArkUI_Stage_textpicker_selectedTextStyle_static_0700
     * @tc.desc     ArkUI_Stage_textpicker_selectedTextStyle_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_selectedTextStyle_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'xxx', font: {
          size: 'xxx', weight: FontWeight.Lighter
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_selectedTextStyle_static_0700] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);

      let strJsonDefault = inspector.getInspectorByKey('textPickerDefault');
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0700] disappearColor:" + obj.getElement('$attrs').getElement('selectedTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('color')).assertEqual(objDefault.getElement('$attrs').getElement('selectedTextStyle').getString('color'));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size')).assertEqual(objDefault.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size'));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Lighter');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_selectedTextStyle_static_0800
     * @tc.name     ArkUI_Stage_textpicker_selectedTextStyle_static_0800
     * @tc.desc     ArkUI_Stage_textpicker_selectedTextStyle_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_selectedTextStyle_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'rgb(138,43,226)', font: {
          size: '20vp', weight: 900
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_selectedTextStyle_static_0800] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('color')).assertEqual('#FF8A2BE2');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('weight')).assertEqual('900');
      done();
    });



    
    
    /**
     * @tc.number   ArkUI_Stage_textpicker_selectedTextStyle_static_0900
     * @tc.name     ArkUI_Stage_textpicker_selectedTextStyle_static_0900
     * @tc.desc     ArkUI_Stage_textpicker_selectedTextStyle_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_textpicker_selectedTextStyle_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let value: PickerTextStyle = {
        color: 'rgb(138,43,226)', font: {
          size: '15lpx', weight: 90
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": value
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_textpicker_selectedTextStyle_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_textpicker_selectedTextStyle_static_0900] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('color')).assertEqual('#FF8A2BE2');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size')).assertEqual('15.00lpx');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      done();
    });
  })
}
