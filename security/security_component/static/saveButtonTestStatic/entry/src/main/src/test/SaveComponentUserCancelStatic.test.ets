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
  Color
} from '@ohos.arkui.component';

export default function saveComponentUserCancelStaticTest() {
  describe('saveComponentUserCancelStaticTest', () => {
    console.info('====>saveComponentUserCancelStaticTest start');
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.example.securitycomponent.static', 'EntryAbility')
      await UtilsTest.msSleep(2000);
      let options: router.RouterOptions = {
        url: 'pages/saveButtonUserCancel',
      }
      try {
        let gUiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;
        let uiRouter: Router = gUiContext.getRouter();
        let pages = uiRouter.getState();
        console.info('====>saveComponentUserCancelStaticTest get state success 1 ' + JSON.stringify(pages));
        if (!('saveButtonUserCancel' == pages.name)) {
          console.info('====>saveComponentUserCancelStaticTest get state success 2 ' + JSON.stringify(pages.name));
          uiRouter.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error('====>saveComponentUserCancelStaticTest push page error: ' + err?.code + err?.message);
        expect(false).assertTrue();
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info('====>saveComponentUserCancelStaticTest after each called');
    });

    let clickBtn = async (testname: string, driver: Driver, targetBut: string) => {
      console.info(`====>${testname} clickBtn function Start====`);
      try {
        let userBtn = await driver.findComponent(ON.text(targetBut));
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
          let userBtn = await driver.findComponent(ON.text('targetBut'));
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

    let clickSecComponent = async (testname: string, driver: Driver, butt: string) => {
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
          await clickBtn(testname, driver, butt);
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

    let cancelCallback = (testname: string, done: () => void) => {
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
            if (data['clickResult'] == SaveButtonOnClickResult.CANCELED_BY_USER) {
              console.info(`====>${testname} 取消授权成功`);
              expect(data['clickResult'] == SaveButtonOnClickResult.CANCELED_BY_USER).assertTrue();
              console.info(`====>${testname} END====`);
              done();
            } else {
              console.info(`====>${testname} 取消授权失败`);
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
     * @tc.name   Test_Security_SaveButton_CancelStatic_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CancelStatic_0100
     * @tc.desc   Test SaveComponent userCancelEvent is true and userCancel Save successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('Test_Security_SaveButton_CancelStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CancelStatic_0100';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'userEve': true
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
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySaveCancel');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      cancelCallback(TCNAME, done);
      let driver = Driver.create();
      let targetBut = '取消';
      await clickSecComponent(TCNAME, driver, targetBut);
    });
    
    /**
     * @tc.name   Test_Security_SaveButton_CancelStatic_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CancelStatic_0200
     * @tc.desc   Test SaveComponent userCancelEvent is true and Authorization is successfully after clicking Allow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_CancelStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CancelStatic_0200';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'userEve': true
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
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySaveCancel');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      let targetBut = '允许';
      await clickSecComponent(TCNAME, driver, targetBut);
    });

    /**
     * @tc.name   Test_Security_SaveButton_CancelStatic_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CancelStatic_0300
     * @tc.desc   Test SaveComponent userCancelEvent is false and Authorization is successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_CancelStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CancelStatic_0300';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'userEve': false
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
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySaveCancel');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      let targetBut = '允许';
      await clickSecComponent(TCNAME, driver, targetBut);
    });

    /**
     * @tc.name   Test_Security_SaveButton_CancelStatic_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_SaveControls_CancelStatic_0400
     * @tc.desc   Test SaveComponent userCancelEvent is undefined and Authorization is successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('Test_Security_SaveButton_CancelStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TCNAME: string = 'Test_Security_SaveButton_CancelStatic_0400';
      console.info(`====>${TCNAME} START====`);
      try {
        let data: Record<string, RecordData> = {
          'userEve': undefined
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
        console.info(`====>${TCNAME} change component data error: ` + err.message);
      }
      await UtilsTest.msSleep(1000);
      let strJson: string = inspector.getInspectorByKey('keySaveCancel');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      let targetBut = '允许';
      await clickSecComponent(TCNAME, driver, targetBut);
    });
  })
}
