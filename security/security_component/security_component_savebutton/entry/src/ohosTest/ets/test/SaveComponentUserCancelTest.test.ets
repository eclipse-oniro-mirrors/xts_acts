/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import display from '@ohos.display';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import Utils from './Utils';
import window from '@ohos.window';

export default function saveComponentUserCancelTest() {
  describe("saveComponentUserCancelTest", ( ) => {
    beforeAll(async (done:Function) => {
      let options:router.RouterOptions = {
        url: "testability/pages/saveButton_userCancel",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('====>saveComponentTest get state success ' + JSON.stringify(pages));
        if (!("saveButton" == pages.name)) {
          console.info('====>saveComponentTest get state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('====>saveComponentTest push page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('====>saveComponentTest push page error: ' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('====>saveComponentTest after each called');
    });

    /**
     * @tc.name   Test_Security_Button_SaveCancel_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveCancel_0100
     * @tc.desc   Test SaveComponent userCancelEvent is true and userCancel Save successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Test_Security_Button_SaveCancel_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('====>[Test_Security_Button_SaveCancel_0100] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "userEve": true
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_SaveCancel_0100] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info('====>[Test_Security_Button_SaveCancel_0100] change component data error: ' + err.message);
      }
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info('====>[Test_Security_Button_SaveCancel_0100] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_SaveCancel_0100] get clickData.data.clickResult is: ' + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.CANCELED_BY_USER) {
              console.info('====>[Test_Security_Button_SaveCancel_0100] 取消授权成功');
              expect(clickData.data.clickResult == SaveButtonOnClickResult.CANCELED_BY_USER).assertTrue();
              console.info('====>[Test_Security_Button_SaveCancel_0100] END====');
            } else {
              console.info('====>[Test_Security_Button_SaveCancel_0100] 取消授权失败');
              expect().assertFail()
              console.info('====>[Test_Security_Button_SaveCancel_0100] END====');
            }
          } else {
            console.info('====>[Test_Security_Button_SaveCancel_0100] case Err');
            expect().assertFail()
            console.info('====>[Test_Security_Button_SaveCancel_0100] END====');
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info('====>[Test_Security_Button_SaveCancel_0100] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info('====>[Test_Security_Button_SaveCancel_0100] button is:' + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
        let cancelBtn = await driver.findComponent(ON.text('取消'));
        let titleTx = await driver.findComponent(ON.text('安全保存图片和视频'));
        console.info('====>[Test_Security_Button_SaveCancel_0100] cancelBtn is:' + JSON.stringify(cancelBtn));
        console.info('====>[Test_Security_Button_SaveCancel_0100] titleTx is:' + JSON.stringify(titleTx));
        if(cancelBtn !== null){
          console.info('====>[Test_Security_Button_SaveCancel_0100] cancelBtnClick START====');
          await cancelBtn.click();
          console.info('====>[Test_Security_Button_SaveCancel_0100] reClick====');
        }else if(titleTx !== null){
          let start_x = 0;
          let start_y = 0;
          let end_x = 0;
          let end_y = 0;
          display.getAllDisplays((err, data) => {
            console.info('====>[Test_Security_Button_SaveCancel_0100] the window data[0].width: ' + data[0].width);
            console.info('====>[Test_Security_Button_SaveCancel_0100] the window data[0].height: ' + data[0].height);
            start_x = end_x = Math.floor(data[0].width * (1/2));
            start_y = Math.floor(data[0].height * (4/5));
            end_y = Math.floor(data[0].height * (1/5));
          });
          for(let i = 0; i < 5; i++){
            await driver.swipe(start_x, start_y, end_x, end_y);
            await Utils.sleep(100);
          }
          let cancelBtn = await driver.findComponent(ON.text('取消'));
          console.info('====>[Test_Security_Button_SaveCancel_0100] cancelBtn is:' + JSON.stringify(cancelBtn));
          console.info('====>[Test_Security_Button_SaveCancel_0100] cancelBtnClick START====');
          await cancelBtn.click();
          console.info('====>[Test_Security_Button_SaveCancel_0100] reClick====');
        }else{
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('====>[Test_Security_Button_SaveCancel_0100] clickSecComponent err : ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name   Test_Security_Button_SaveCancel_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveCancel_0200
     * @tc.desc   Test SaveComponent userCancelEvent is true and Authorization is successfully after clicking Allow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Test_Security_Button_SaveCancel_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_SaveCancel_0200] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "userEve": true
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_SaveCancel_0200] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info('====>[Test_Security_Button_SaveCancel_0200] change component data error: ' + err.message);
      }
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info('====>[Test_Security_Button_SaveCancel_0200] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_SaveCancel_0200] get clickData.data.clickResult is: ' + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_SaveCancel_0200] 授权成功');
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_SaveCancel_0200] END====');
            } else {
              console.info('====>[Test_Security_Button_SaveCancel_0200] 授权失败');
              expect().assertFail()
              console.info('====>[Test_Security_Button_SaveCancel_0200] END====');
            }
          } else {
            console.info('====>[Test_Security_Button_SaveCancel_0200] case Err');
            expect().assertFail()
            console.info('====>[Test_Security_Button_SaveCancel_0200] END====');
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info('====>[Test_Security_Button_SaveCancel_0200] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info('====>[Test_Security_Button_SaveCancel_0200] button is:' + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
        let allowBtn = await driver.findComponent(ON.text('允许'));
        let titleTx = await driver.findComponent(ON.text('安全保存图片和视频'));
        console.info('====>[Test_Security_Button_SaveCancel_0200] allowBtn is:' + JSON.stringify(allowBtn));
        console.info('====>[Test_Security_Button_SaveCancel_0200] titleTx is:' + JSON.stringify(titleTx));
        if(allowBtn !== null){
          console.info('====>[Test_Security_Button_SaveCancel_0200] allowBtnClick START====');
          await allowBtn.click();
          console.info('====>[Test_Security_Button_SaveCancel_0200] reClick====');
        }else if(titleTx !== null){
          let start_x = 0;
          let start_y = 0;
          let end_x = 0;
          let end_y = 0;
          display.getAllDisplays((err, data) => {
            console.info('====>[Test_Security_Button_SaveCancel_0200] the window data[0].width: ' + data[0].width);
            console.info('====>[Test_Security_Button_SaveCancel_0200] the window data[0].height: ' + data[0].height);
            start_x = end_x = Math.floor(data[0].width * (1/2));
            start_y = Math.floor(data[0].height * (4/5));
            end_y = Math.floor(data[0].height * (1/5));
          });
          for(let i = 0; i < 5; i++){
            await driver.swipe(start_x, start_y, end_x, end_y);
            await Utils.sleep(100);
          }
          let allowBtn = await driver.findComponent(ON.text('允许'));
          console.info('====>[Test_Security_Button_SaveCancel_0200] allowBtn is:' + JSON.stringify(allowBtn));
          console.info('====>[Test_Security_Button_SaveCancel_0200] allowBtnClick START====');
          await allowBtn.click();
          console.info('====>[Test_Security_Button_SaveCancel_0200] reClick====');
        }else{
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('====>[Test_Security_Button_SaveCancel_0200] clickSecComponent err : ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name   Test_Security_Button_SaveCancel_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveCancel_0300
     * @tc.desc   Test SaveComponent userCancelEvent is false and Authorization is successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Test_Security_Button_SaveCancel_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_SaveCancel_0300] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "userEve": false
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_SaveCancel_0300] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info('====>[Test_Security_Button_SaveCancel_0300] change component data error: ' + err.message);
      }
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info('====>[Test_Security_Button_SaveCancel_0300] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_SaveCancel_0300] get clickData.data.clickResult is: ' + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_SaveCancel_0300] 授权成功');
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_SaveCancel_0300] END====');
            } else {
              console.info('====>[Test_Security_Button_SaveCancel_0300] 授权失败');
              expect().assertFail()
              console.info('====>[Test_Security_Button_SaveCancel_0300] END====');
            }
          } else {
            console.info('====>[Test_Security_Button_SaveCancel_0300] case Err');
            expect().assertFail()
            console.info('====>[Test_Security_Button_SaveCancel_0300] END====');
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info('====>[Test_Security_Button_SaveCancel_0300] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info('====>[Test_Security_Button_SaveCancel_0300] button is:' + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
        let allowBtn = await driver.findComponent(ON.text('允许'));
        console.info('====>[Test_Security_Button_SaveCancel_0300] allowBtn is:' + JSON.stringify(allowBtn));
        if(allowBtn !== null){
          console.info('====>[Test_Security_Button_SaveCancel_0300] allowBtnClick START====');
          await allowBtn.click();
          console.info('====>[Test_Security_Button_SaveCancel_0300] reClick====');
        }
      } catch (err) {
        console.info('====>[Test_Security_Button_SaveCancel_0300] clickSecComponent err : ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      await Utils.sleep(500);
      done();
    });
  })
}