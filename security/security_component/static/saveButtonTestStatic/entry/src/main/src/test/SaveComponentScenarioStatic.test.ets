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
  SaveButtonOnClickResult,
  ButtonType,
  SecurityComponentLayoutDirection,
  FontStyle,
  FontWeight,
  BorderStyle,
  Color,
} from '@ohos.arkui.component';

let gContext: common.UIAbilityContext;

export default function saveComponentScenarioStaticTest() {
  describe('saveComponentScenarioStaticTest', () => {
    console.info('====>saveComponentScenarioStaticTest start');
    beforeAll(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'pages/saveButtonScenario',
      }
      try {
        let gUiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;
        let uiRouter: Router = gUiContext.getRouter();
        let pages = uiRouter.getState();
        console.info('====>saveComponentScenarioStaticTest get state success 1 ' + JSON.stringify(pages));
        if (!('saveButtonScenario' == pages.name)) {
          console.info('====>saveComponentScenarioStaticTest get state success 2 ' + JSON.stringify(pages.name));
          uiRouter.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error('====>saveComponentScenarioStaticTest push page error: ' + err?.code + err?.message);
        expect(false).assertTrue();
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info('====>saveComponentScenarioStaticTest after each called');
    });

    let clickBtn = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickBtn function Start====`);
      try {
        let userBtn = await driver.findComponent(ON.text('允许'));
        console.info(`====>${testname} userBtn is:` + JSON.stringify(userBtn));
        if(userBtn !== null) {
          console.info(`====>${testname} userBtnClick START====`);
          await (userBtn?.click() as Promise<void>);
          console.info(`====>${testname} reClick====`);
        } else {
          let startX: int = 0;
          let startY: int = 0;
          let endX: int = 0;
          let endY: int = 0;
          display.getAllDisplays((err: BusinessError | null, data: Array<display.Display> | undefined) => {
            if (err?.code) {
              console.info(`====>${testname} failed to obtain all the display objects. Code: ${err?.code}, message: ${err?.message}`);
              expect(false).assertTrue();
            }
            if (data && data.length > 0) {
              console.info(`====>${testname} the window data[0].width: ` + data[0].width);
              console.info(`====>${testname} the window data[0].height: ` + data[0].height);
              startX = endX = Math.floor(data[0].width * (1/2)).toInt();
              startY = Math.floor(data[0].height * (4/5)).toInt();
              endY = Math.floor(data[0].height * (1/5)).toInt();
            } else {
              console.info(`====>${testname} failed to obtain all the display objects data is Null`);
              expect(false).assertTrue();
            }
          });
          for(let i = 0; i < 5; i++){
            await driver.swipe(startX, startY, endX, endY);
            await UtilsTest.msSleep(100);
          }
          let userBtn = await driver.findComponent(ON.text('允许'));
          console.info(`====>${testname} userBtn is:` + JSON.stringify(userBtn));
          console.info(`====>${testname} userBtnClick START====`);
          await (userBtn?.click() as Promise<void>);
          console.info(`====>${testname} reClick====`);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`====>${testname} clickBtn err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickBtn function End====`);
    }

    let clickSecComponent = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await UtilsTest.msSleep(500);
        console.info(`====>${testname} button is:` + JSON.stringify(button));
        await (button?.click() as Promise<void>);
        await UtilsTest.msSleep(2000);
        let titleTx = await driver.findComponent(ON.text('安全保存图片和视频'));
        console.info(`====>${testname} titleTx is:` + JSON.stringify(titleTx));
        if (titleTx !== null) {
          await clickBtn(testname, driver);
        }
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
            if (data['clickResult'] == SaveButtonOnClickResult.SUCCESS) {
              console.info(`====>${testname} 设置权限成功`);
              expect(data['clickResult'] == SaveButtonOnClickResult.SUCCESS).assertTrue();
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

    let failCallback = (testname: string, done: () => void) => {
      console.info(`====>${testname} failCallback function Start====`);
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
            if (data['clickResult'] == SaveButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info(`====>${testname} 设置权限失败 pass`);
              expect(data['clickResult'] == SaveButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info(`====>${testname} END====`);
              done();
            } else {
              console.info(`====>${testname} ERR CASE 失败`);
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
      console.info(`====>${testname} failCallback function End====`);
    }

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_0100
     * @tc.desc   Test SecurityComponent width attribute value is Normal and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_0100';
      console.info(`====>${TCNAME} START====`);
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('width')).assertEqual('10.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_0200
     * @tc.desc   Test SecurityComponent height attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_0200';
      console.info(`====>${TCNAME} START====`);
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('height')).assertEqual('15.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_0300
     * @tc.desc   Test SecurityComponent size.width attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_0300';
      console.info(`====>${TCNAME} START====`);
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('size').getString('width')).assertEqual('10.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_0400
     * @tc.desc   Test SecurityComponent size.height attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_0400';
      console.info(`====>${TCNAME} START====`);
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('size').getString('height')).assertEqual('15.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_0500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_0500
     * @tc.desc   Test SecurityComponent constraintSize.minWidth attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_0500';
      console.info(`====>${TCNAME} START====`);
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(obj.getElement('$attrs').getString('constraintSize'));
      console.info(`====>${TCNAME} get minWidth is: ` + JSON.stringify(obj1.getString('minWidth')));
      expect(obj1.getString('minWidth')).assertEqual('20.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_0600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_0600
     * @tc.desc   Test SecurityComponent constraintSize.maxWidth attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_0600';
      console.info(`====>${TCNAME} START====`);
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(obj.getElement('$attrs').getString('constraintSize'));
      console.info(`====>${TCNAME} get maxWidth is: ` + JSON.stringify(obj1.getString('maxWidth')));
      expect(obj1.getString('maxWidth')).assertEqual('25.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_0700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_0700
     * @tc.desc   Test SecurityComponent constraintSize.minHeight attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_0700';
      console.info(`====>${TCNAME} START====`);
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(obj.getElement('$attrs').getString('constraintSize'));
      console.info(`====>${TCNAME} get minHeight is: ` + JSON.stringify(obj1.getString('minHeight')));
      expect(obj1.getString('minHeight')).assertEqual('30.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_0800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_0800
     * @tc.desc   Test SecurityComponent constraintSize.maxHeight attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_0800';
      console.info(`====>${TCNAME} START====`);
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(obj.getElement('$attrs').getString('constraintSize'));
      console.info(`====>${TCNAME} get maxHeight is: ` + JSON.stringify(obj1.getString('maxHeight')));
      expect(obj1.getString('maxHeight')).assertEqual('35.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_0900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_0900
     * @tc.desc   Test SecurityComponent iconSize attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_0900';
      console.info(`====>${TCNAME} START====`);
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
          'middle': 4
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('iconSize')).assertEqual('16.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_1000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_1000
     * @tc.desc   Test SecurityComponent fontWeight set '' and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_1000';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'fontWeight_S': '',
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info(`====>${TCNAME} get fontWeight is: ` + JSON.stringify(obj.getElement('$attrs').getString('fontWeight')));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_1100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_1100
     * @tc.desc   Test SecurityComponent fontWeight set 400 and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_1100';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'fontWeight_N': 400,
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('400');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_1200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_1200
     * @tc.desc   Test SecurityComponent fontWeight set 'lighter' and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_1200';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'fontWeight_S': 'lighter',
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_1300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_1300
     * @tc.desc   Test SecurityComponent fontFamily set '' and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_1300';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'fontFamily': '',
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('HarmonyOS Sans');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_1400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_1400
     * @tc.desc   Test SecurityComponent id set '' and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_ScenariosStatic_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_1400';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'id': '',
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('id')).assertEqual('keySave2');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_1500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_1500
     * @tc.desc   Test SecurityComponent maxFontSize&minFontSize set string and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_SaveButton_ScenariosStatic_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_1500';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'maxFontSize': '20.00vp',
          'minFontSize': '10.00vp',
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('maxFontSize')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getString('minFontSize')).assertEqual('10.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_ScenariosStatic_1600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_ScenariosStatic_1600
     * @tc.desc   Test SecurityComponent enabled set false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_SaveButton_ScenariosStatic_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_ScenariosStatic_1600';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'enable': false
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
      let strJson: string = inspector.getInspectorByKey('keySave2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getBoolean('enabled')).assertEqual(false);
      done();
    });
  })
}
