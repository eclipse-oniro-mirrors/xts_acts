/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import { UtilsTest } from './Util.test';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { BusinessError, RecordData } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import window from '@ohos.window';
import display from '@ohos.display';
import common from '@ohos.app.ability.common';
import {
  PasteButtonOnClickResult,
  ButtonType,
  SecurityComponentLayoutDirection,
  FontStyle,
  FontWeight,
  BorderStyle,
  Alignment,
  Color
} from '@ohos.arkui.component';

let gContext: common.UIAbilityContext;

export default function pasteComponentStaticTest() {
  describe('pasteComponentStaticTest', () => {
    console.info('====>pasteComponentStaticTest start');
    beforeAll(() => {
      await UtilsTest.startAbility('com.example.securitycomponent.static', 'EntryAbility')
      await UtilsTest.msSleep(2000);
      let options: router.RouterOptions = {
        url: 'pages/pasteButton',
      }
      try {
        let gUiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;
        let uiRouter: Router = gUiContext.getRouter();
        let pages = uiRouter.getState();
        console.info('====>pasteComponentStaticTest get state success 1 ' + JSON.stringify(pages));
        if (!('pasteButton' == pages.name)) {
          console.info('====>pasteComponentStaticTest get state success 2 ' + JSON.stringify(pages.name));
          uiRouter.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error('====>pasteComponentStaticTest push page error: ' + err?.code + err?.message);
        expect(false).assertTrue();
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info('====>pasteComponentStaticTest after each called');
    });

    /**
     * @tc.number SUB_SEC_AccCtl_SpecialItem_XTS_Controls_StaticPaste_0100
     * @tc.name   Test_Security_Button_StaticPaste_0100
     * @tc.desc   Test SecurityComponent Default parameters and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 0
     */
    it('Test_Security_Button_StaticPaste_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0100] START');
      let strJson: string = inspector.getInspectorByKey('keyPaste');
      console.info('====> strJson: ' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('buttonType')).assertEqual(0);
      expect(obj.getElement('$attrs').getString('iconSize')).assertEqual('16.00vp');
      expect(obj.getElement('$attrs').getInteger('layoutDirection')).assertEqual(0);
      expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('16.00vp');
      expect(obj.getElement('$attrs').getInteger('fontStyle')).assertEqual(0);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('HarmonyOS Sans');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getString('iconColor')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF007DFF');
      expect(obj.getElement('$attrs').getInteger('borderStyle')).assertEqual(1);
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('borderColor')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('padding').getString('left')).assertEqual('12.00vp');
      expect(obj.getElement('$attrs').getElement('padding').getString('right')).assertEqual('12.00vp');
      expect(obj.getElement('$attrs').getElement('padding').getString('top')).assertEqual('4.00vp');
      expect(obj.getElement('$attrs').getElement('padding').getString('bottom')).assertEqual('4.00vp');
      expect(obj.getElement('$attrs').getString('textIconSpace')).assertEqual('4.00vp');
      expect(obj.getElement('$attrs').getString('align')).assertEqual('Alignment.Center');
      expect(obj.getElement('$attrs').getString('id').toString()).assertEqual('keyPaste');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if( clickData.data != undefined ){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_0100] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_0100] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_0100] 设置权限成功');
              expect((data['clickResult'] == PasteButtonOnClickResult.SUCCESS)).assertTrue();
              await UtilsTest.msSleep(500);
              console.info('====>[Test_Security_Button_StaticPaste_0100] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_0100] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0100] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_0100] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_0100] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0100] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0100] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0100] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_SpecialItem_XTS_Controls_StaticPaste_0200
     * @tc.name   Test_Security_Button_StaticPaste_0200
     * @tc.desc   Test SecurityComponent layoutDirection attribute is VERTICAL and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0200] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.VERTICAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_0200] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0200] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('layoutDirection')).assertEqual(1);
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_0200] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_0200] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_0200] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0200] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_0200] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0200] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_0200] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_0200] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0200] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0200] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0200] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_SpecialItem_XTS_Controls_StaticPaste_0300
     * @tc.name   Test_Security_Button_StaticPaste_0300
     * @tc.desc   Test SecurityComponent position.x is 150.00vp and position.y is 20.00vp
     * markAnchor.x is 20.00vp and markAnchor.y is 20.00vp and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0300] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '10',
          'positionY': '10',
          'anchorX': '20',
          'anchorY': '20',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_0300] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0300] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('20.00vp');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_0300] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_0300] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_0300] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0300] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_0300] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0300] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_0300] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_0300] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0300] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0300] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0300] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_SpecialItem_XTS_Controls_StaticPaste_0400
     * @tc.name   Test_Security_Button_StaticPaste_0400
     * @tc.desc   Test SecurityComponent offset and markAnchor attribute is normal and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0400] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.VERTICAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '20',
          'anchorY': '20',
          'offsetX': '10',
          'offsetY': '10',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_0400] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0400] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('10.00vp');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_0400] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_0400] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_0400] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0400] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_0400] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0400] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_0400] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_0400] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0400] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0400] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0400] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_SpecialItem_XTS_Controls_StaticPaste_0500
     * @tc.name   Test_Security_Button_StaticPaste_0500
     * @tc.desc   Test SecurityComponent FontStyle attribute is Italic and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0500] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Italic,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_0500] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0500] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('fontStyle')).assertEqual(1);
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_0500] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_0500] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_0500] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0500] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_0500] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0500] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_0500] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_0500] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0500] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0500] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0500] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_SpecialItem_XTS_Controls_StaticPaste_0600
     * @tc.name   Test_Security_Button_StaticPaste_0600
     * @tc.desc   Test SecurityComponent FontWeight attribute is Lighter and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0600] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Lighter,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_0600] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0600] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_0600] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_0600] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_0600] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0600] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_0600] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0600] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_0600] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_0600] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0600] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0600] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0600] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_0700
     * @tc.name   Test_Security_Button_StaticPaste_0700
     * @tc.desc   Test SecurityComponent FontWeight attribute is Normal and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0700] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Normal,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_0700] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0700] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_0700] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_0700] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_0700] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0700] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_0700] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0700] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_0700] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_0700] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0700] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0700] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0700] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_0800
     * @tc.name   Test_Security_Button_StaticPaste_0800
     * @tc.desc   Test SecurityComponent FontWeight attribute is Regular and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0800] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Regular,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_0800] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0800] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Regular');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_0800] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_0800] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_0800] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0800] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_0800] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0800] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_0800] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_0800] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0800] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0800] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0800] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_0900
     * @tc.name   Test_Security_Button_StaticPaste_0900
     * @tc.desc   Test SecurityComponent FontWeight attribute is Bold and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0900] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Bold,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_0900] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0900] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bold');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_0900] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_0900] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_0900] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0900] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_0900] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_0900] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_0900] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_0900] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0900] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0900] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_0900] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_1000
     * @tc.name   Test_Security_Button_StaticPaste_1000
     * @tc.desc   Test SecurityComponent FontWeight attribute is Bolder and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_1000] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Bolder,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_1000] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1000] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bolder');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_1000] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_1000] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_1000] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1000] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_1000] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1000] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_1000] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_1000] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1000] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1000] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1000] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_1100
     * @tc.name   Test_Security_Button_StaticPaste_1100
     * @tc.desc   Test SecurityComponent BorderStyle is Dotted , borderWidth , borderColor , borderRadius attribute is normal and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_1100] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dotted,
          'borderWid': 5,
          'borderCol': '#ffffffff',
          'borderRad': 5,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_1100] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1100] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('borderStyle')).assertEqual(2);
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual('5.00vp');
      expect(obj.getElement('$attrs').getString('borderColor')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual('5.00vp');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_1100] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_1100] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_1100] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1100] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_1100] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1100] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_1100] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_1100] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1100] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1100] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1100] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_1200
     * @tc.name   Test_Security_Button_StaticPaste_1200
     * @tc.desc   Test SecurityComponent BorderStyle attribute is Dashed and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     * @tc.require
     */
    it('Test_Security_Button_StaticPaste_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_1200] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 5,
          'borderCol': '#ffffffff',
          'borderRad': 5,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_1200] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1200] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('borderStyle')).assertEqual(1);
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual('5.00vp');
      expect(obj.getElement('$attrs').getString('borderColor')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual('5.00vp');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_1200] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_1200] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_1200] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1200] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_1200] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1200] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_1200] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_1200] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1200] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1200] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1200] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_1300
     * @tc.name   Test_Security_Button_StaticPaste_1300
     * @tc.desc   Test SecurityComponent BorderStyle attribute is Solid and Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_1300] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Solid,
          'borderWid': 5,
          'borderCol': '#ffffffff',
          'borderRad': 5,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_1300] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1300] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('borderStyle')).assertEqual(0);
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual('5.00vp');
      expect(obj.getElement('$attrs').getString('borderColor')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual('5.00vp');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_1300] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_1300] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_1300] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1300] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_1300] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1300] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_1300] 设置权限失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_1300] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1300] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1300] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1300] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_1400
     * @tc.name   Test_Security_Button_StaticPaste_1400
     * @tc.desc   Test SecurityComponent offset.x attribute is 200.00vp result in Authorization is failed
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_1400] START====');
      await UtilsTest.msSleep(1000);
      let positX: String = '0';
      gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      try{
        let windowClass: window.Window | undefined = await window.getLastWindow(gContext);
        if (windowClass) {
          let properties: window.WindowProperties = windowClass.getWindowProperties();
          console.info('Succeeded in obtaining the window properties.width: ' + properties.windowRect.width);
          let window_width: Int = properties.windowRect.width;
          console.info('====>[Test_Security_Button_StaticPaste_1400] properties.windowRect.width is: ' + window_width);
          positX = `${(window_width / 2).toInt()}px`;
        }
      } catch (err){
        err = err as BusinessError;
        console.error('Failed to obtain the window properties.error.code: ' + err.code);
      }
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': positX,
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        await UtilsTest.msSleep(1000);
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1400] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1400] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_1400] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_1400] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info('====>[Test_Security_Button_StaticPaste_1400] TEST CASE 成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1400] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_1400] TEST CASE 失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1400] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_1400] ERR CASE 失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_1400] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1400] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1400] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1400] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_1500
     * @tc.name   Test_Security_Button_StaticPaste_1500
     * @tc.desc   Test SecurityComponent offset.x attribute is -200.00vp result in Authorization is failed
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_1500] START====');
      await UtilsTest.msSleep(1000);
      let positX: String = '0';
      gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      try {
        let windowClass: window.Window | undefined = await window.getLastWindow(gContext);
        if (windowClass) {
          let properties: window.WindowProperties = windowClass.getWindowProperties();
          console.info('Succeeded in obtaining the window properties.width: ' + properties.windowRect.width);
          let window_width: Int = properties.windowRect.width;
          console.info('====>[Test_Security_Button_StaticPaste_1500] properties.windowRect.width is: ' + window_width);
          positX = `${-(window_width / 2).toInt()}px`;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error('Failed to obtain the window properties.error.code: ' + err.code)
      }
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': positX,
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1500] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1500] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_1500] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_1500] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info('====>[Test_Security_Button_StaticPaste_1500] ERR CASE 成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1500] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_1500] ERR CASE 失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1500] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_1500] ERR CASE 失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_1500] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1500] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1500] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1500] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_1600
     * @tc.name   Test_Security_Button_StaticPaste_1600
     * @tc.desc   Test SecurityComponent Size excood displaysSize 10% result in Authorization is successful
     * @tc.size   MEDIUMTEST
     * @tc.type   Function
     * @tc.level  LEVEL 3
     */
    it('Test_Security_Button_StaticPaste_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_1600] START====');
      await UtilsTest.msSleep(1000);
      let button_width: String = '0';
      let button_height: String = '0';
      try {
        let data: Array<display.Display> = await display.getAllDisplays();
        if (data) {
          console.info('====>[Test_Security_Button_StaticPaste_1600] the window data[0].width: ' + data[0].width);
          console.info('====>[Test_Security_Button_StaticPaste_1600] the window data[0].height: ' + data[0].height);
          button_width = `${data[0].width.toInt() / 3}px`;
          button_height = `${data[0].height.toInt() / 3}px`;
          console.info('====>[Test_Security_Button_StaticPaste_1600] button_width is: ' + button_width);
          console.info('====>[Test_Security_Button_StaticPaste_1600] button_height is: ' + button_height);
        }
      } catch (err){
        err = err as BusinessError;
        console.error('Failed to obtain the window properties.error.code: ' + err.code);
      }
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'buWidth': button_width,
          'buHeight': button_height,
          'rowWidth': button_width,
          'rowHeight': button_height
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        await UtilsTest.msSleep(1000);
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1600] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1600] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_1600] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_1600] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_1600] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1600] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_1600] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1600] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_1600] ERR CASE 失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_1600] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1600] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1600] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1600] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_1700
     * @tc.name   Test_Security_Button_StaticPaste_1700
     * @tc.desc   Test SecurityComponent iconColor attribute is too light result in Authorization is failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_StaticPaste_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_1700] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#10ff0000',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_1700] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1700] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('iconColor')).assertEqual('#10FF0000');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data != undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_1700] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_1700] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info('====>[Test_Security_Button_StaticPaste_1700] ERR CASE 成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1700] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_1700] ERR CASE 失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1700] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_1700] ERR CASE 失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_1700] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1700] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1700] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1700] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_1800
     * @tc.name   Test_Security_Button_StaticPaste_1800
     * @tc.desc   Test SecurityComponent buttonType is 0 , iconSize is 20.00vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_StaticPaste_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_1800] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 20,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#fffa0050',
          'bgColor': '#ffff0000',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_1800] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1800] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('buttonType')).assertEqual(0);
      expect(obj.getElement('$attrs').getString('iconSize')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getString('iconColor')).assertEqual('#FFFA0050');
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data != undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_1800] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_1800] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_StaticPaste_1800] 设置权限成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1800] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_1800] 设置权限失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1800] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_1800] ERR CASE 失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_1800] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1800] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1800] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1800] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_1900
     * @tc.name   Test_Security_Button_StaticPaste_1900
     * @tc.desc   Test SecurityComponent iconSize attribute is too small result in Authorization is failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_StaticPaste_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_1900] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<String, RecordData> ={
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 1,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 20,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': '#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_1900] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1900] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('iconSize')).assertEqual('1.00vp');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('20.00vp');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_1900] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_1900] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info('====>[Test_Security_Button_StaticPaste_1900] ERR CASE 成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1900] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_1900] ERR CASE 失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_1900] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_1900] ERR CASE 失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_1900] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1900] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_1900] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_1900] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_2000
     * @tc.name   Test_Security_Button_StaticPaste_2000
     * @tc.desc   Test SecurityComponent iconColor attribute is transparent result in Authorization is failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_StaticPaste_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_2000] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<String, RecordData> ={
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': '#ffffffff',
          'iconColor': Color.Transparent,
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_2000] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_2000] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('iconColor')).assertEqual('#00000000');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_2000] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_2000] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info('====>[Test_Security_Button_StaticPaste_2000] ERR CASE 成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_2000] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_2000] ERR CASE 失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_2000] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_2000] ERR CASE 失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_2000] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_2000] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_2000] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_2000] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_StaticPaste_2100
     * @tc.name   Test_Security_Button_StaticPaste_2100
     * @tc.desc   Test SecurityComponent fontColor attribute is transparent result in Authorization is failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_StaticPaste_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_2100] START====');
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<String, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': '0',
          'anchorX': '0',
          'anchorY': '0',
          'offsetX': '0',
          'offsetY': '0',
          'fontSize': 16,
          'fontStyle': FontStyle.Normal,
          'fontWeight': FontWeight.Medium,
          'fontColor': Color.Transparent,
          'iconColor':'#ffffffff',
          'bgColor': '#ff007dff',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4
        };
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_2100] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_2100] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#00000000');
      await UtilsTest.msSleep(1000);
      try {
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info('====>[Test_Security_Button_StaticPaste_2100] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_StaticPaste_2100] get clickData.data.clickResult is: ' + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info('====>[Test_Security_Button_StaticPaste_2100] ERR CASE 成功');
              expect(data['clickResult'] == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_2100] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_StaticPaste_2100] ERR CASE 失败');
              expect(false).assertTrue();
              console.info('====>[Test_Security_Button_StaticPaste_2100] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_StaticPaste_2100] ERR CASE 失败');
            expect(false).assertTrue();
            console.info('====>[Test_Security_Button_StaticPaste_2100] END====');
            done();
          }
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_2100] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_2100] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error('====>[Test_Security_Button_StaticPaste_2100] clickSecComponent err : ' + JSON.stringify(err));
      }
    });
  })
}
