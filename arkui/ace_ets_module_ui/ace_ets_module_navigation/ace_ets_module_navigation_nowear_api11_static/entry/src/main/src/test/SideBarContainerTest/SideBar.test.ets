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

import events_emitter from '@ohos.events.emitter';
import {Color,$r} from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function sidebar() {
  describe('ActsAceSideBarTest',  () =>{
    beforeAll(() => {
      console.info("ActsAceSideBarTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("sidebar beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/SideBarContainer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sidebar state success " + JSON.stringify(pages));
        if (!("SideBarContainer" == pages.name)) {
          console.info("get sidebar state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push sidebar page error: " + err);
      }
    });

    afterEach(async () => {
      console.info("sidebar afterEach start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": '#000000',
            "startMarginStr": '5px',
            "endMarginStr": '5px',

            "nullFlag": false,

            "dividerColor": Color.Red,

            "strokeWidthNum": 10 as double,
            "dividerColorNum": 0x000000 as int,
            "startMarginNum": 5 as double,
            "endMarginNum": 5 as double,

            "strokeWidthRes": $r('app.string.Divider_width'),
            "dividerColorRes": $r('app.color.Divider_color'),
            "startMarginRes": $r('app.string.Divider_startMargin'),
            "endMarginRes": $r('app.string.Divider_endMargin'),
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      // done();
    })


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_0100
     * @tc.name     ArkUI_SideBarContainer_Divider_static_0100
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_0100 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest1');
      console.info("ArkUI_SideBarContainer_Divider_0100: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0100] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("1.00vp");
      expect(dividerObject.getString('color')).assertEqual("#08000000");
      expect(dividerObject.getString('startMargin')).assertEqual("0.00vp");
      expect(dividerObject.getString('endMargin')).assertEqual("0.00vp");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_0200
     * @tc.name     ArkUI_SideBarContainer_Divider_static_0200
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_0200 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest2');
      console.info("ArkUI_SideBarContainer_Divider_0200: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0200] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00vp");
      expect(dividerObject.getString('color')).assertEqual("#FF000000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00vp");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00vp");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_0300
     * @tc.name     ArkUI_SideBarContainer_Divider_static_0300
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_0300 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0300: " + JSON.stringify(strJson))
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0300] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00px");
      expect(dividerObject.getString('color')).assertEqual("#FF000000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00px");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00px");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_0400
     * @tc.name     ArkUI_SideBarContainer_Divider_static_0400
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_0400 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0400: " + JSON.stringify(strJson))

      let strokeWidthStr = '10vp';
      let startMarginStr = '5vp';
      let endMarginStr = '5vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": strokeWidthStr,
            "startMarginStr": startMarginStr,
            "endMarginStr": endMarginStr
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("ArkUI_SideBarContainer_Divider_0400 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("ArkUI_SideBarContainer_Divider_0400 change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);

      let newJson: string = inspector.getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0400: " + JSON.stringify(newJson))
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_0400] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00vp");
      expect(dividerObject.getString('color')).assertEqual("#FF000000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00vp");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00vp");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_0500
     * @tc.name     ArkUI_SideBarContainer_Divider_static_0500
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_0500 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0500: " + JSON.stringify(strJson))

      let strokeWidthStr = '10fp';
      let startMarginStr = '5fp';
      let endMarginStr = '5fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": strokeWidthStr,
            "startMarginStr": startMarginStr,
            "endMarginStr": endMarginStr
          }  as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("ArkUI_SideBarContainer_Divider_0500 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("ArkUI_SideBarContainer_Divider_0500 change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);

      let newJson: string = inspector.getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0500: " + JSON.stringify(newJson))
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_0500] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00fp");
      expect(dividerObject.getString('color')).assertEqual("#FF000000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00fp");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00fp");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_0600
     * @tc.name     ArkUI_SideBarContainer_Divider_static_0600
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_0600 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0600: " + JSON.stringify(strJson))

      let strokeWidthStr = '10lpx';
      let startMarginStr = '5lpx';
      let endMarginStr = '5lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": strokeWidthStr,
            "startMarginStr": startMarginStr,
            "endMarginStr": endMarginStr
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("ArkUI_SideBarContainer_Divider_0600 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("ArkUI_SideBarContainer_Divider_0600 change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(3000);

      let newJson: string = inspector.getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0600: " + JSON.stringify(newJson))
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_0600] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00lpx");
      expect(dividerObject.getString('color')).assertEqual("#FF000000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00lpx");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00lpx");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_0700
     * @tc.name     ArkUI_SideBarContainer_Divider_static_0700
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_0700 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest4');
      console.info("ArkUI_SideBarContainer_Divider_0700: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0700] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00px");
      expect(dividerObject.getString('color')).assertEqual("#FF000000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00px");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00px");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_0800
     * @tc.name     ArkUI_SideBarContainer_Divider_static_0800
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_0800 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest5');
      console.info("ArkUI_SideBarContainer_Divider_0800: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0800] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00vp");
      expect(dividerObject.getString('color')).assertEqual("#FFFF0000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00vp");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00vp");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_0900
     * @tc.name     ArkUI_SideBarContainer_Divider_static_0900
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_0900
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_0900 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest6');
      console.info("ArkUI_SideBarContainer_Divider_0900: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0900] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00vp");
      expect(dividerObject.getString('color')).assertEqual("#08000000");
      expect(dividerObject.getString('startMargin')).assertEqual("0.00vp");
      expect(dividerObject.getString('endMargin')).assertEqual("0.00vp");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_1000
     * @tc.name     ArkUI_SideBarContainer_Divider_static_1000
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_1000
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_1000 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest2');
      console.info("ArkUI_SideBarContainer_Divider_1000: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider_1000] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let newJson: string = inspector.getInspectorByKey('sideBarTest2');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_1000] divider:" + JSON.stringify(obj.getElement('$attrs').getString('divider')));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("1.00vp");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_1100
     * @tc.name     ArkUI_SideBarContainer_Divider_static_1100
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_1100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_1100 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest2');
      console.info("ArkUI_SideBarContainer_Divider_1100: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_1100] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00vp");
      expect(dividerObject.getString('color')).assertEqual("#FF000000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00vp");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00vp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthNum": -1 as double,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider_1100] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let newJson: string = inspector.getInspectorByKey('sideBarTest2');
      let newobj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_1100] divider:" + JSON.stringify(newobj.getElement('$attrs').getString('divider')));
      let newdividerObject = JSON.parseJsonElement(newobj.getElement('$attrs').getString('divider'));
      expect(newdividerObject.getString('strokeWidth')).assertEqual("1.00vp");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_1200
     * @tc.name     ArkUI_SideBarContainer_Divider_static_1200
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_1200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_1200 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_1200: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_1200] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00px");
      expect(dividerObject.getString('color')).assertEqual("#FF000000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00px");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "dividerColorStr": 'aaaaa',
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider_1200] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let newJson: string = inspector.getInspectorByKey('sideBarTest3');
      let newobj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_1200] divider:" + JSON.stringify(newobj.getElement('$attrs').getString('divider')));
      let newdividerObject = JSON.parseJsonElement(newobj.getElement('$attrs').getString('divider'));
      expect(newdividerObject.getString('color')).assertEqual("#08000000");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_1300
     * @tc.name     ArkUI_SideBarContainer_Divider_static_1300
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_1300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_1300 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest2');
      console.info("ArkUI_SideBarContainer_Divider_1300: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_1300] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00vp");
      expect(dividerObject.getString('color')).assertEqual("#FF000000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00vp");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00vp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startMarginNum": -1 as double,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider_1300] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let newJson: string = inspector.getInspectorByKey('sideBarTest2');
      let newobj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_1300] divider:" + JSON.stringify(newobj.getElement('$attrs').getString('divider')));
      let newdividerObject = JSON.parseJsonElement(newobj.getElement('$attrs').getString('divider'));
      expect(newdividerObject.getString('startMargin')).assertEqual("0.00vp");
      done();
    });


    
/**
     * @tc.number   ArkUI_SideBarContainer_Divider_static_1400
     * @tc.name     ArkUI_SideBarContainer_Divider_static_1400
     * @tc.desc     ArkUI_SideBarContainer_Divider_static_1400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info("ArkUI_SideBarContainer_Divider_1400 start");
      let strJson: string = inspector.getInspectorByKey('sideBarTest2');
      console.info("ArkUI_SideBarContainer_Divider_1400: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_1400] divider:" + obj.getElement('$attrs').getString('divider'));
      let dividerObject = JSON.parseJsonElement(obj.getElement('$attrs').getString('divider'));
      expect(dividerObject.getString('strokeWidth')).assertEqual("10.00vp");
      expect(dividerObject.getString('color')).assertEqual("#FF000000");
      expect(dividerObject.getString('startMargin')).assertEqual("5.00vp");
      expect(dividerObject.getString('endMargin')).assertEqual("5.00vp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endMarginNum": -1 as double,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider_1400] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let newJson: string = inspector.getInspectorByKey('sideBarTest2');
      let newobj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_1400] divider:" + JSON.stringify(newobj.getElement('$attrs').getString('divider')));
      let newdividerObject = JSON.parseJsonElement(newobj.getElement('$attrs').getString('divider'));
      expect(newdividerObject.getString('endMargin')).assertEqual("0.00vp");
      done();
    });
  })
}
