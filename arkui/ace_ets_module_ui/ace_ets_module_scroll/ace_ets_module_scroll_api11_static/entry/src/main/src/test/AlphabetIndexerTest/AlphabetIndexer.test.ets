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
import { describe, beforeEach, afterEach, it, expect, beforeAll, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { Color, FontWeight, $r, Resource } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { GlobalContext } from '../../../ets/MainAbility/common/GlobalContext.ets'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
let emitKey = "emitUserAgent";

function spliceColor(sysColor: Resource) {
  const context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
  let resourceColor = context?.resourceManager.getColorSync(sysColor.id)
  let newArgb: string = '#' + resourceColor?.toString(16).toUpperCase()
  return newArgb;
}

function alphabetDefaultPopupSize(sysWidth: Resource) {
  const context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
  let resourcePopupSize = context?.resourceManager.getDouble(sysWidth.id)
  const uiContext = AppStorage.get<UIContext>('uiContext');
  let newPopupSize: string = Math.round(uiContext!.px2vp(resourcePopupSize ?? 0)) + '.00vp'
  return newPopupSize;
}

export default function ActsAlphabetIndexerUxTest() {
  describe('ActsAlphabetIndexerUxTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/alphabetIndexerux",
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get AlphabetIndexer state success " + JSON.stringify(pages));
        if (!("alphabetIndexerux" == pages.name)) {
          console.info("get AlphabetIndexer state success " + JSON.stringify(pages.name));
          routerAlp.pushUrl(options)
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error("push AlphabetIndexer page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("AlphabetIndexer afterEach start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "popupSelectedColorStr": '#00FF00',
            "popupUnselectedColorStr": '#DA70D6',
            "popupItemBackgroundStr": '#FFD700',
            "popupItemFontSizeStr": '20',
            "popupItemFontWeightStr": '400',
            "popupSpaceStr": '120',
            "popupSelectedColor": Color.Orange,
            "popupUnselectedColor": Color.Green,
            "popupItemBackgroundColor": Color.Pink,
            "popupSelectedColorNum": 0x00CED1,
            "popupUnselectedColorNum": 0xC0FF3E,
            "popupItemBackgroundNum": 0x8470FF,
            "popupItemFontSizeNum": 30,
            "popupItemFontWeightNum": FontWeight.Normal,
            "popupSpaceNum": 50,
            "popupSelectedColorRes": $r('app.color.popupSelectedColor'),
            "popupUnselectedColorRes": $r('app.color.popupUnselectedColor'),
            "popupItemBackgroundRes": $r('app.color.popupItemBackground'),
            "popupItemFontSizeRes": $r('app.string.fontSize'),
            "popupSpaceRes": $r('app.string.popupSpace'),
            "popupItemFontWeightFont": FontWeight.Bolder,
            "nullFlag1": false,
            "nullFlag2": false,
            "nullFlag3": false,
            "nullFlag4": false,
            "nullFlag5": false
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
    })


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0100
     * @tc.name     ArkUI_AlphabetIndexer_static_0100
     * @tc.desc     ArkUI_AlphabetIndexer_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0100 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('popupSelectedColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      expect(obj.getElement('$attrs').getString('popupUnselectedColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      expect(obj.getElement('$attrs').getString('popupItemBackground')).assertEqual("#00000000");
      expect(obj.getElement('$attrs').getString('popupItemFontSize'))
        .assertEqual(alphabetDefaultPopupSize($r('sys.float.ohos_id_text_size_headline7')));
      expect(obj.getElement('$attrs').getString('popupItemFontWeight')).assertEqual("FontWeight.Medium");
      expect(obj.getElement('$attrs').getString('popupHorizontalSpace')).assertEqual("-1.00vp");
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0600
     * @tc.name     ArkUI_AlphabetIndexer_static_0600
     * @tc.desc     ArkUI_AlphabetIndexer_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0600 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest6');
      let obj = JSON.parseJsonElement(strJson);
      let popupItemFontSize: string = obj.getElement('$attrs').getString('popupItemFontSize');
      expect(parseFloat(popupItemFontSize)).assertEqual(30)
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0700
     * @tc.name     ArkUI_AlphabetIndexer_static_0700
     * @tc.desc     ArkUI_AlphabetIndexer_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0700 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest7');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('popupItemFontWeight')).assertEqual("FontWeight.Normal");
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0800
     * @tc.name     ArkUI_AlphabetIndexer_static_0800
     * @tc.desc     ArkUI_AlphabetIndexer_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0800 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag1": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupSelectedColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0900
     * @tc.name     ArkUI_AlphabetIndexer_static_0900
     * @tc.desc     ArkUI_AlphabetIndexer_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0900 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag2": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupUnselectedColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_1000
     * @tc.name     ArkUI_AlphabetIndexer_static_1000
     * @tc.desc     ArkUI_AlphabetIndexer_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1000 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag3": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemBackground')).assertEqual("#00000000");
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_1100
     * @tc.name     ArkUI_AlphabetIndexer_static_1100
     * @tc.desc     ArkUI_AlphabetIndexer_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1100 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemFontSize'))
        .assertEqual(alphabetDefaultPopupSize($r('sys.float.ohos_id_text_size_headline7')));
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_1200
     * @tc.name     ArkUI_AlphabetIndexer_static_1200
     * @tc.desc     ArkUI_AlphabetIndexer_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1200 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemFontWeight')).assertEqual("FontWeight.Medium");
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_1300
     * @tc.name     ArkUI_AlphabetIndexer_static_1300
     * @tc.desc     ArkUI_AlphabetIndexer_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1300 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag5": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_1300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupHorizontalSpace')).assertEqual("-1.00vp");
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_1400
     * @tc.name     ArkUI_AlphabetIndexer_static_1400
     * @tc.desc     ArkUI_AlphabetIndexer_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1400 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag1": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupSelectedColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_1500
     * @tc.name     ArkUI_AlphabetIndexer_static_1500
     * @tc.desc     ArkUI_AlphabetIndexer_static_1500
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1500 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag2": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupUnselectedColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_1600
     * @tc.name     ArkUI_AlphabetIndexer_static_1600
     * @tc.desc     ArkUI_AlphabetIndexer_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1600 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag3": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_1600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemBackground')).assertEqual("#00000000");
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_1700
     * @tc.name     ArkUI_AlphabetIndexer_static_1700
     * @tc.desc     ArkUI_AlphabetIndexer_static_1700
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1700 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_1700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemFontSize'))
        .assertEqual(alphabetDefaultPopupSize($r('sys.float.ohos_id_text_size_headline7')));
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_1800
     * @tc.name     ArkUI_AlphabetIndexer_static_1800
     * @tc.desc     ArkUI_AlphabetIndexer_static_1800
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1800 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_1800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemFontWeight')).assertEqual("FontWeight.Medium");
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_1900
     * @tc.name     ArkUI_AlphabetIndexer_static_1900
     * @tc.desc     ArkUI_AlphabetIndexer_static_1900
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_1900 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag5": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_1900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest3');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupHorizontalSpace')).assertEqual("-1.00vp");
      done();
    })


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_2600
     * @tc.name     ArkUI_AlphabetIndexer_static_2600
     * @tc.desc     ArkUI_AlphabetIndexer_static_2600
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_2600 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag1": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_2600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupSelectedColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_2700
     * @tc.name     ArkUI_AlphabetIndexer_static_2700
     * @tc.desc     ArkUI_AlphabetIndexer_static_2700
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_2700 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag2": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_2700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupUnselectedColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_2800
     * @tc.name     ArkUI_AlphabetIndexer_static_2800
     * @tc.desc     ArkUI_AlphabetIndexer_static_2800
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_2800 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag3": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_2800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemBackground')).assertEqual("#00000000");
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_2900
     * @tc.name     ArkUI_AlphabetIndexer_static_2900
     * @tc.desc     ArkUI_AlphabetIndexer_static_2900
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_2900 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_2900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_2900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemFontSize'))
        .assertEqual(alphabetDefaultPopupSize($r('sys.float.ohos_id_text_size_headline7')));
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_3000
     * @tc.name     ArkUI_AlphabetIndexer_static_3000
     * @tc.desc     ArkUI_AlphabetIndexer_static_3000
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_3000 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag4": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_3000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_3000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupItemFontWeight')).assertEqual("FontWeight.Medium");
      done();
    });


    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_3100
     * @tc.name     ArkUI_AlphabetIndexer_static_3100
     * @tc.desc     ArkUI_AlphabetIndexer_static_3100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_3100 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag5": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_AlphabetIndexer_static_3100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[ArkUI_AlphabetIndexer_static_3100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let newJson = inspector.getInspectorByKey('alphabetIndexerTest4');
      let obj = JSON.parseJsonElement(newJson);
      expect(obj.getElement('$attrs').getString('popupHorizontalSpace')).assertEqual("-1.00vp");
      done();
    });
  })
}