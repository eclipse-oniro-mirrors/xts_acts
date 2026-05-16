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
import {
  SaveButtonOnClickResult,
  ButtonType,
  SecurityComponentLayoutDirection,
  FontStyle,
  FontWeight,
  BorderStyle,
  Alignment,
  Color,
  Resource,
  $r
} from '@ohos.arkui.component';

export default function saveCompCustomizeStaticTest() {
  describe('saveCompCustomizeStaticTest', () => {
    console.info('====>saveCompCustomizeStaticTest start');
    beforeAll(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'pages/saveButtonCustomize',
      }
      try {
        let gUiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;
        let uiRouter: Router = gUiContext.getRouter();
        let pages = uiRouter.getState();
        console.info('====>saveCompCustomizeStaticTest get state success 1 ' + JSON.stringify(pages));
        if (!('saveButtonCustomize' == pages.name)) {
          console.info('====>saveCompCustomizeStaticTest get state success 2 ' + JSON.stringify(pages.name));
          uiRouter.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error('====>saveCompCustomizeStaticTest push page error: ' + err?.code + err?.message);
        expect(false).assertTrue();
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info('====>saveCompCustomizeStaticTest after each called');
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

    let clickSecComponent = async (testname: string, expectText: string, driver: Driver) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await UtilsTest.msSleep(500);
        console.info(`====>${testname} button is:` + JSON.stringify(button));
        let buttonText: string = await (button?.getText() as Promise<string>);
        console.info(`====>${testname} buttonText is:` + JSON.stringify(buttonText));
        expect(buttonText).assertEqual(expectText);
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

    /**
     * @tc.name   Test_Security_SaveButton_CustomStatic_Nopermission_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CustomStatic_Nopermission_0100
     * @tc.desc   Nopermission Test SaveComponent attr setIcon, setText, stateEffect(true) ineffective and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it('Test_Security_SaveButton_CustomStatic_Nopermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CustomStatic_Nopermission_0100';
      console.info(`====>${TCNAME} START====`);
      let customIcon: Resource = $r('app.media.startIcon');
      let customText: string = '自定义保存';
      let expectText: string = '下载';
      try {
        let data: Record<string, RecordData> = {
          'cuIcon': customIcon,
          'cuText': customText,
          'stateEffect': true
        }
        let eventData: events_emitter.EventData = {};
        eventData.data = data;
        let InnerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit====`);
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyCustomSave');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      expect(obj.getElement('$attrs').getBoolean('stateEffect')).assertEqual(true);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, expectText, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_CustomStatic_Nopermission_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CustomStatic_Nopermission_0200
     * @tc.desc   Nopermission Test SaveComponent attr setText, stateEffect ineffective and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_CustomStatic_Nopermission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CustomStatic_Nopermission_0200';
      console.info(`====>${TCNAME} START====`);
      let customIcon: Resource = $r('app.media.startIcon');
      let customText: string = 'CustomSave';
      let expectText: string = '下载';
      try {
        let data: Record<string, RecordData> = {
          'cuIcon': customIcon,
          'cuText': customText,
          'stateEffect': false
        }
        let eventData: events_emitter.EventData = {};
        eventData.data = data;
        let InnerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit====`);
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyCustomSave');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      expect(obj.getElement('$attrs').getBoolean('stateEffect')).assertEqual(true);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, expectText, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_CustomStatic_Nopermission_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CustomStatic_Nopermission_0300
     * @tc.desc   Nopermission Test SaveComponent attr iconBorderRadius set Dimension ineffective and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it('Test_Security_SaveButton_CustomStatic_Nopermission_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CustomStatic_Nopermission_0300';
      console.info(`====>${TCNAME} START====`);
      let customIcon: Resource = $r('app.media.startIcon');
      let customText: string = '保存控件03';
      let expectText: string = '下载';
      try {
        let data: Record<string, RecordData> = {
          'cuIcon': customIcon,
          'cuText': customText,
          'iconSize': 20,
          'icRadius': 10
        }
        let eventData: events_emitter.EventData = {};
        eventData.data = data;
        let InnerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit====`);
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyCustomSave');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('iconBorderRadius')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, expectText, driver);
    });

    /**
     * @tc.name   Test_Security_SaveButton_CustomStatic_Nopermission_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CustomStatic_Nopermission_0400
     * @tc.desc   Nopermission Test SaveComponent attr iconBorderRadius set BorderRadiuses ineffective and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_CustomStatic_Nopermission_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CustomStatic_Nopermission_0400';
      console.info(`====>${TCNAME} START====`);
      let customIcon: Resource = $r('app.media.startIcon');
      let customText: string = 'SaveCase04';
      let expectText: string = '下载';
      try {
        let data: Record<string, RecordData> = {
          'cuIcon': customIcon,
          'cuText': customText,
          'iconSize': 20,
          'icRadsTl': 8,
          'icRadsTr': 0,
          'icRadsBl': -6,
          'icRadsBr': 12,
        }
        let eventData: events_emitter.EventData = {};
        eventData.data = data;
        let InnerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit====`);
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.error(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keyCustomSave');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('iconBorderRadius')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, expectText, driver);
    });
  })
}
