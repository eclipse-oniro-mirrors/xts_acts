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
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import pasteboard from '@ohos.pasteboard';
import inspector from '@ohos.arkui.inspector';
import {
  PasteButtonOnClickResult,
  ButtonType,
  SecurityComponentLayoutDirection,
  FontStyle,
  FontWeight,
  BorderStyle,
  Alignment
} from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

export default function pasteComponentStaticTest() {
  describe('pasteComponentStaticTest', () => {
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
        if (err) {
          err = err as BusinessError
          console.error('====>pasteComponentStaticTest push page error: ' + err?.code + err?.message);
          expect(false).assertTrue();
        }
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info('====>pasteComponentStaticTest after each called');
    });

    /**
     * @tc.number SUB_SEC_AccCtl_SpecialItem_XTS_Controls_StaticPaste_0100
     * @tc.name Test_Security_Button_StaticPaste_0100
     * @tc.desc Test SecurityComponent Default parameters and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
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
          if(clickData.data !=undefined){
            const data = clickData.data as Record<String,RecordData>;
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
        err = err as BusinessError
        console.info('====>[Test_Security_Button_StaticPaste_0100] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0100] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError
        console.info('====>[Test_Security_Button_StaticPaste_0100] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_SpecialItem_XTS_Controls_StaticPaste_0200
     * @tc.name Test_Security_Button_StaticPaste_0200
     * @tc.desc Test SecurityComponent layoutDirection attribute is VERTICAL and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('Test_Security_Button_StaticPaste_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0200] START====');
      await UtilsTest.msSleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            'icon': 0,
            'textType': 0,
            'bgType': ButtonType.Normal,
            'iconSize': 16,
            'direct': SecurityComponentLayoutDirection.VERTICAL,
            'positionX': 0,
            'positionY': 0,
            'anchorX': 0,
            'anchorY': 0,
            'offsetX': 0,
            'offsetY': 0,
            'fontSize': 16,
            'fontStyle': FontStyle.Normal,
            'fontWeight': FontWeight.Medium,
            'fontColor': '0xffffffff',
            'iconColor': '0xffffffff',
            'bgColor': '0xff007dff',
            'borderSty': BorderStyle.Dashed,
            'borderWid': 0,
            'borderCol': '0xffffffff',
            'borderRad': 0,
            'left': 12,
            'right': 12,
            'top': 4,
            'bottom': 4,
            'middle': 4
          } as Record<String,RecordData>
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_0200] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError
        console.info('====>[Test_Security_Button_StaticPaste_0200] change component data error: ' + err.message);
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
            const data = clickData.data as Record<String,RecordData>;
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
        err = err as BusinessError
        console.info('====>[Test_Security_Button_StaticPaste_0200] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0200] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError
        console.info('====>[Test_Security_Button_StaticPaste_0200] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_SpecialItem_XTS_Controls_StaticPaste_0300
     * @tc.name Test_Security_Button_StaticPaste_0300
     * @tc.desc Test SecurityComponent position.x is 150.00vp and position.y is 20.00vp
     * markAnchor.x is 20.00vp and markAnchor.y is 20.00vp and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('Test_Security_Button_StaticPaste_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0300] START====');
      await UtilsTest.msSleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            'icon': 0,
            'textType': 0,
            'bgType': ButtonType.Normal,
            'iconSize': 16,
            'direct': SecurityComponentLayoutDirection.HORIZONTAL,
            'positionX': 10,
            'positionY': 10,
            'anchorX': 20,
            'anchorY': 20,
            'offsetX': 0,
            'offsetY': 0,
            'fontSize': 16,
            'fontStyle': FontStyle.Normal,
            'fontWeight': FontWeight.Medium,
            'fontColor': '0xffffffff',
            'iconColor': '0xffffffff',
            'bgColor': '0xff007dff',
            'borderSty': BorderStyle.Dashed,
            'borderWid': 0,
            'borderCol': '0xffffffff',
            'borderRad': 0,
            'left': 12,
            'right': 12,
            'top': 4,
            'bottom': 4,
            'middle': 4
          } as Record<String,RecordData>
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_0300] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError
        console.info('====>[Test_Security_Button_StaticPaste_0300] change component data error: ' + err.message);
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
            const data = clickData.data as Record<String,RecordData>;
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
        err = err as BusinessError
        console.info('====>[Test_Security_Button_StaticPaste_0300] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0300] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError
        console.info('====>[Test_Security_Button_StaticPaste_0300] clickSecComponent err : ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_SpecialItem_XTS_Controls_StaticPaste_0400
     * @tc.name Test_Security_Button_StaticPaste_0400
     * @tc.desc Test SecurityComponent offset and markAnchor attribute is normal and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('Test_Security_Button_StaticPaste_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('====>[Test_Security_Button_StaticPaste_0400] START====');
      await UtilsTest.msSleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            'icon': 0,
            'textType': 0,
            'bgType': ButtonType.Normal,
            'iconSize': 16,
            'direct': SecurityComponentLayoutDirection.VERTICAL,
            'positionX': 0,
            'positionY': 0,
            'anchorX': 20,
            'anchorY': 20,
            'offsetX': 10,
            'offsetY': 10,
            'fontSize': 16,
            'fontStyle': FontStyle.Normal,
            'fontWeight': FontWeight.Medium,
            'fontColor': '0xffffffff',
            'iconColor': '0xffffffff',
            'bgColor': '0xff007dff',
            'borderSty': BorderStyle.Dashed,
            'borderWid': 0,
            'borderCol': '0xffffffff',
            'borderRad': 0,
            'left': 12,
            'right': 12,
            'top': 4,
            'bottom': 4,
            'middle': 4
          } as Record<String,RecordData>
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_StaticPaste_0400] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError
        console.info('====>[Test_Security_Button_StaticPaste_0400] change component data error: ' + err.message);
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
            const data = clickData.data as Record<String,RecordData>;
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
        err = err as BusinessError
        console.info('====>[Test_Security_Button_StaticPaste_0400] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info('====>[Test_Security_Button_StaticPaste_0400] button is:' + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError
        console.info('====>[Test_Security_Button_StaticPaste_0400] clickSecComponent err : ' + JSON.stringify(err));
      }
    });
  })
}
