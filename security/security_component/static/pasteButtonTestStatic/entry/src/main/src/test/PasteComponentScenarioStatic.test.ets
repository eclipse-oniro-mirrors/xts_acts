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

export default function pasteComponentScenarioStaticTest() {
  describe('pasteComponentScenarioStaticTest', () => {
    console.info('====>pasteComponentScenarioStaticTest start');
    beforeAll(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'pages/pasteButtonScenario',
      }
      try {
        let gUiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;
        let uiRouter: Router = gUiContext.getRouter();
        let pages = uiRouter.getState();
        console.info('====>pasteComponentScenarioStaticTest get state success 1 ' + JSON.stringify(pages));
        if (!('pasteButtonScenario' == pages.name)) {
          console.info('====>pasteComponentScenarioStaticTest get state success 2 ' + JSON.stringify(pages.name));
          uiRouter.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error('====>pasteComponentScenarioStaticTest push page error: ' + err?.code + err?.message);
        expect(false).assertTrue();
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info('====>pasteComponentScenarioStaticTest after each called');
    });

    let clickSecComponent = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      try {
        let button = await driver.findComponent(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        console.info(`====>${testname} button is:` + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(500);
      } catch (err) {
        err = err as BusinessError;
        console.error(`====>${testname} clickSecComponent err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickSecComponent function End====`);
    }

    let sucCallback = (testname: string, done: () => void) => {
      console.info(`====>${testname} sucCallback function Start====`);
      let clickEvent:events_emitter.InnerEvent = {
        eventId: 2,
        priority: events_emitter.EventPriority.LOW
      }
      let clickCallback = (clickData:events_emitter.EventData) => {
        try {
          if(clickData.data != undefined){
            const data = clickData.data as Record<string, RecordData>;
            console.info(`====>${testname} get clickEvent result is: ` + JSON.stringify(clickEvent));
            console.info(`====>${testname} get clickData.data.clickResult is: ` + JSON.stringify(data['clickResult']));
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info(`====>${testname} 设置权限成功`);
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info(`====>${testname} END====`);
              done();
            } else {
              console.info(`====>${testname} 设置权限失败`);
              expect(false).assertTrue();
              console.info(`====>${testname} END====`);
              done();
            }
          } else {
            console.info(`====>${testname} ERR CASE 失败`);
            expect(false).assertTrue();
            console.info(`====>${testname} END====`);
            done();
          }
        } catch (err) {
          err = err as BusinessError;
          console.error(`====>${testname} once clickEvent err : ` + JSON.stringify(err));
          done();
        }
      }
      events_emitter.once(clickEvent, clickCallback);
      console.info(`====>${testname} sucCallback function End====`);
    }

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_0100
     * @tc.desc   Test SecurityComponent width attribute value is Normal and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_ScenariosStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_0100';
      console.info(`====>${TCNAME} START====`);
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
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('width')).assertEqual('10.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_0200
     * @tc.desc   Test SecurityComponent height attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_ScenariosStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_0200';
      console.info(`====>${TCNAME} START====`);
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
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('height')).assertEqual('15.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_0300
     * @tc.desc   Test SecurityComponent size.width attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_0300';
      console.info(`====>${TCNAME} START====`);
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
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('size').getString('width')).assertEqual('10.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_0400
     * @tc.desc   Test SecurityComponent size.height attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_0400';
      console.info(`====>${TCNAME} START====`);
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
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('size').getString('height')).assertEqual('15.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_0500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_0500
     * @tc.desc   Test SecurityComponent constraintSize.minWidth attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_0500';
      console.info(`====>${TCNAME} START====`);
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
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(obj.getElement('$attrs').getString('constraintSize'));
      expect(obj1.getString('minWidth')).assertEqual('20.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_0600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_0600
     * @tc.desc   Test SecurityComponent constraintSize.maxWidth attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_0600';
      console.info(`====>${TCNAME} START====`);
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
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(obj.getElement('$attrs').getString('constraintSize'));
      expect(obj1.getString('maxWidth')).assertEqual('25.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_0700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_0700
     * @tc.desc   Test SecurityComponent constraintSize.minHeight attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_0700';
      console.info(`====>${TCNAME} START====`);
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
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(obj.getElement('$attrs').getString('constraintSize'));
      expect(obj1.getString('minHeight')).assertEqual('30.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });
    
    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_0800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_0800
     * @tc.desc   Test SecurityComponent constraintSize.maxHeight attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_0800';
      console.info(`====>${TCNAME} START====`);
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
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(obj.getElement('$attrs').getString('constraintSize'));
      expect(obj1.getString('maxHeight')).assertEqual('35.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_0900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_0900
     * @tc.desc   Test SecurityComponent layoutDirection attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_0900';
      console.info(`====>${TCNAME} START====`);
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('layoutDirection')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_1000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_1000
     * @tc.desc   Test SecurityComponent iconSize attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_1000';
      console.info(`====>${TCNAME} START====`);
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('iconSize')).assertEqual('16.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_1100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_1100
     * @tc.desc   Test SecurityComponent position attribute X is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_1100';
      console.info(`====>${TCNAME} START====`);
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_1200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_1200
     * @tc.desc   Test SecurityComponent position attribute Y is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_1200';
      console.info(`====>${TCNAME} START====`);
      await UtilsTest.msSleep(1000);
      try {
        let data: Record<string, RecordData> = {
          'icon': 0,
          'textType': 0,
          'bgType': ButtonType.Normal,
          'iconSize': 16,
          'direct': SecurityComponentLayoutDirection.HORIZONTAL,
          'positionX': '0',
          'positionY': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_1300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_1300
     * @tc.desc   Test SecurityComponent markAnchor attribute X is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_1300';
      console.info(`====>${TCNAME} START====`);
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
          'anchorX': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_1400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_1400
     * @tc.desc   Test SecurityComponent markAnchor attribute Y is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_1400';
      console.info(`====>${TCNAME} START====`);
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
          'anchorY': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_1500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_1500
     * @tc.desc   Test SecurityComponent offset attribute X is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_1500';
      console.info(`====>${TCNAME} START====`);
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
          'offsetX': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_1600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_1600
     * @tc.desc   Test SecurityComponent offset attribute Y is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_1600';
      console.info(`====>${TCNAME} START====`);
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
          'offsetY': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_1700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_1700
     * @tc.desc   Test SecurityComponent fontSize attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_ScenariosStatic_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_1700';
      console.info(`====>${TCNAME} START====`);
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
          'fontSize': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('16.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_1800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_1800
     * @tc.desc   Test SecurityComponent fontStyle attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_1800';
      console.info(`====>${TCNAME} START====`);
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
          'fontStyle': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('fontStyle')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_1900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_1900
     * @tc.desc   Test SecurityComponent fontWeight attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_1900';
      console.info(`====>${TCNAME} START====`);
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
          'fontWeight': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_2000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_2000
     * @tc.desc   Test SecurityComponent fontFamily attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_2000';
      console.info(`====>${TCNAME} START====`);
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
          'fontFamily': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('HarmonyOS Sans');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_2100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_2100
     * @tc.desc   Test SecurityComponent fontColor attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_2100';
      console.info(`====>${TCNAME} START====`);
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
          'fontColor': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFFFFF');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_2200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_2200
     * @tc.desc   Test SecurityComponent fontColor attribute is RGB value transmitted and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_2200';
      console.info(`====>${TCNAME} START====`);
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
          'fontColor': 'rgb(255, 255, 1)',
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFFF01');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_2300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_2300
     * @tc.desc   Test SecurityComponent iconColor attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_2300';
      console.info(`====>${TCNAME} START====`);
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
          'iconColor': undefined,
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('iconColor')).assertEqual('#FFFFFFFF');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_2400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_2400
     * @tc.desc   Test SecurityComponent iconColor attribute is RGB value transmitted and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_2400';
      console.info(`====>${TCNAME} START====`);
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
          'iconColor': 'rgb(255, 255, 1)',
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
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('iconColor')).assertEqual('#FFFFFF01');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_2500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_2500
     * @tc.desc   Test SecurityComponent backgroundColor attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_2500';
      console.info(`====>${TCNAME} START====`);
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
          'bgColor': undefined,
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF007DFF');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_2600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_2600
     * @tc.desc   Test SecurityComponent backgroundColor attribute is RGB value transmitted and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_2600';
      console.info(`====>${TCNAME} START====`);
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
          'bgColor': 'rgb(0, 235, 255)',
          'borderSty': BorderStyle.Dashed,
          'borderWid': 0,
          'borderCol': '#ffffffff',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00EBFF');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_2700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_2700
     * @tc.desc   Test SecurityComponent borderColor attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_2700';
      console.info(`====>${TCNAME} START====`);
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
          'borderCol': undefined,
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('borderColor')).assertEqual('#FFFFFFFF');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_2800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_2800
     * @tc.desc   Test SecurityComponent borderColor attribute is RGB value transmitted and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_2800';
      console.info(`====>${TCNAME} START====`);
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
          'borderCol': 'rgb(0, 235, 155)',
          'borderRad': 0,
          'left': 12,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('borderColor')).assertEqual('#FF00EB9B');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_2900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_2900
     * @tc.desc   Test SecurityComponent padding of left is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_2900';
      console.info(`====>${TCNAME} START====`);
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
          'left': undefined,
          'right': 12,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('padding').getString('left')).assertEqual('12.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_PasteButton_ScenariosStatic_3000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_ScenariosStatic_3000
     * @tc.desc   Test SecurityComponent padding of right is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_PasteButton_ScenariosStatic_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_PasteButton_ScenariosStatic_3000';
      console.info(`====>${TCNAME} START====`);
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
          'right': undefined,
          'top': 4,
          'bottom': 4,
          'middle': 4,
          'width': 10,
          'height': 15,
          'minWidth': 20,
          'maxWidth': 25,
          'minHeight': 30,
          'maxHeight': 35
        }
        let eventData:events_emitter.EventData = {};
        eventData.data = data;
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyPaste2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('padding').getString('right')).assertEqual('12.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });
  })
}
