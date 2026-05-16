/**
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import Utils from './Utils';
import display from '@ohos.display';

export default function saveComponentTest_2() {
  describe('saveComponentTest_2', ( ) =>{
    beforeAll(async (done:Function) => {
      let options:router.RouterOptions = {
        url: 'testability/pages/saveButton_2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("====>saveComponentTest_2 get state success " + JSON.stringify(pages));
        if (!("saveButton_2" == pages.name)) {
          console.info("====>saveComponentTest_2 get state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("====>saveComponentTest_2 push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("====>saveComponentTest_2 push page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("====>saveComponentTest_2 after each called");
    });

    let clickSecComponent = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info(`====>${testname} button is:` + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
        let titleTx = await driver.findComponent(ON.text('安全保存图片和视频'));
        console.info(`====>${testname} titleTx is:` + JSON.stringify(titleTx));
        if (titleTx !== null) {
          await clickAllowBtn(testname, driver);
        }
      } catch (err) {
        console.error(`====>${testname} clickSecComponent err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickSecComponent function End====`);
    }

    let clickAllowBtn = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickAllowBtn function Start====`);
      try {
        let allowBtn = await driver.findComponent(ON.text('允许'));
        console.info(`====>${testname} allowBtn is:` + JSON.stringify(allowBtn));
        if(allowBtn !== null) {
          console.info(`====>${testname} allowBtnClick START====`);
          await allowBtn.click();
          console.info(`====>${testname} reClick====`);
        } else {
          let start_x = 0;
          let start_y = 0;
          let end_x = 0;
          let end_y = 0;
          display.getAllDisplays((err, data) => {
            console.info(`====>${testname} the window data[0].width: ` + data[0].width);
            console.info(`====>${testname} the window data[0].height: ` + data[0].height);
            start_x = end_x = Math.floor(data[0].width * (1/2));
            start_y = Math.floor(data[0].height * (4/5));
            end_y = Math.floor(data[0].height * (1/5));
          });
          for(let i = 0; i < 5; i++){
            await driver.swipe(start_x, start_y, end_x, end_y);
            await Utils.sleep(100);
          }
          let allowBtn = await driver.findComponent(ON.text('允许'));
          console.info(`====>${testname} allowBtn is:` + JSON.stringify(allowBtn));
          console.info(`====>${testname} allowBtnClick START====`);
          await allowBtn.click();
          console.info(`====>${testname} reClick====`);
        }
      } catch (err) {
        console.error(`====>${testname} clickAllowBtn err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickAllowBtn function End====`);
    }

    let sucCallback = (testname: string, done: Function) => {
      console.info(`====>${testname} sucCallback function Start====`);
      let clickEvent:events_emitter.InnerEvent = {
        eventId: 2,
        priority: events_emitter.EventPriority.LOW
      }
      let clickCallback = (clickData:events_emitter.EventData) => {
        try {
          if(clickData.data !=undefined){
            console.info(`====>${testname} get clickEvent result is: ` + JSON.stringify(clickEvent));
            console.info(`====>${testname} get clickData.data.clickResult is: ` + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info(`====>${testname} 设置权限成功`);
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info(`====>${testname} END====`);
              done();
            } else {
              console.info(`====>${testname} 设置权限失败`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`====>${testname} ERR CASE 失败`);
            expect(false).assertTrue();
          }
        } catch (err) {
          console.error(`====>${testname} once clickEvent err : ` + JSON.stringify(err));
          console.info(`====>${testname} END====`);
          done();
        }
      }
      events_emitter.once(clickEvent, clickCallback);
      console.info(`====>${testname} sucCallback function End====`);
    }

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_0100
     * @tc.desc   Test SecurityComponent width attribute value is Normal and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_SaveScenarios_0100] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": 0,
            "anchorY": 0,
            "offsetX": 0,
            "offsetY": 0,
            "fontSize": 16,
            "fontStyle": FontStyle.Normal,
            "fontWeight": FontWeight.Medium,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_SaveScenarios_0100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0100] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_SaveScenarios_0100] get obj is: " + JSON.stringify(obj));
      // width的默认值取值
      expect(obj.$attrs.width).assertEqual('10.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_SaveScenarios_0100] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_SaveScenarios_0100] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_SaveScenarios_0100] 设置权限成功");
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_SaveScenarios_0100] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_SaveScenarios_0100] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_SaveScenarios_0100] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_SaveScenarios_0100] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_SaveScenarios_0100] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0100] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        console.info("====>[Test_Security_Button_SaveScenarios_0100] driver is:" + JSON.stringify(driver));
        let flag = false;
        console.info("====>[Test_Security_Button_SaveScenarios_0100] flag is:" + flag);
        for (let i = 0; i < 5; i++) {
          console.info("====>[Test_Security_Button_SaveScenarios_0100] loop START====" + i);
          if (flag) {
            break;
          }
          let textComponent = await driver.findComponent(ON.type('SaveButton'));
          console.info("====>[Test_Security_Button_SaveScenarios_0100] textComponent is:" + JSON.stringify(textComponent));
          await Utils.sleep(200)
          if (textComponent != undefined && textComponent != null) {
            try {
              await textComponent.click();
              console.info("====>[Test_Security_Button_SaveScenarios_0100] textComponentClick finishfinishfinish");
            } catch (err) {
              console.info("====>[Test_Security_Button_SaveScenarios_0100] textComponentClick err : " + JSON.stringify(err));
            }
            ;
          }
          let allowBtn = await driver.findComponent(ON.text('允许'));
          console.info("====>[Test_Security_Button_SaveScenarios_0100] allowBtn is:" + JSON.stringify(allowBtn));
          if (allowBtn !== null) {
            console.info("====>[Test_Security_Button_SaveScenarios_0100] allowBtnClick START====");
            await allowBtn.click();
            console.info("====>[Test_Security_Button_SaveScenarios_0100] reClick====" + i);
          } else {
            flag = true;
          }
        }
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0100] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_0200
     * @tc.desc   Test SecurityComponent height attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[TTest_Security_Button_SaveScenarios_0200] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": 0,
            "anchorY": 0,
            "offsetX": 0,
            "offsetY": 0,
            "fontSize": 16,
            "fontStyle": FontStyle.Normal,
            "fontWeight": FontWeight.Medium,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[TTest_Security_Button_SaveScenarios_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[TTest_Security_Button_SaveScenarios_0200] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>[TTest_Security_Button_SaveScenarios_0200] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.height).assertEqual('15.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[TTest_Security_Button_SaveScenarios_0200] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[TTest_Security_Button_SaveScenarios_0200] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[TTest_Security_Button_SaveScenarios_0200] 设置权限成功");
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[TTest_Security_Button_SaveScenarios_0200] END====");
              done();
            } else {
              console.info("====>[TTest_Security_Button_SaveScenarios_0200] 设置权限失败");
              expect().assertFail()
              console.info("====>[TTest_Security_Button_SaveScenarios_0200] END====");
              done();
            }
          } else {
            console.info("====>[TTest_Security_Button_SaveScenarios_0200] 设置权限失败");
            expect().assertFail()
            console.info("====>[TTest_Security_Button_SaveScenarios_0200] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[TTest_Security_Button_SaveScenarios_0200] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[TTest_Security_Button_SaveScenarios_0200] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[TTest_Security_Button_SaveScenarios_0200] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_0300
     * @tc.desc   Test SecurityComponent size.width attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_SaveScenarios_0300] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": 0,
            "anchorY": 0,
            "offsetX": 0,
            "offsetY": 0,
            "fontSize": 16,
            "fontStyle": FontStyle.Normal,
            "fontWeight": FontWeight.Medium,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_SaveScenarios_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0300] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      let constraintSize:ESObject = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_SaveScenarios_0300] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_SaveScenarios_0300] get obj is: " + JSON.stringify(obj));
      // size.width的默认值取值
      expect(obj.$attrs.size.width).assertEqual('10.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_SaveScenarios_0300] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_SaveScenarios_0300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_SaveScenarios_0300] 设置权限成功");
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_SaveScenarios_0300] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_SaveScenarios_0300] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_SaveScenarios_0300] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_SaveScenarios_0300] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_SaveScenarios_0300] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0300] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_SaveScenarios_0300] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0300] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_0400
     * @tc.desc   Test SecurityComponent size.height attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_SaveScenarios_0400] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": 0,
            "anchorY": 0,
            "offsetX": 0,
            "offsetY": 0,
            "fontSize": 16,
            "fontStyle": FontStyle.Normal,
            "fontWeight": FontWeight.Medium,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_SaveScenarios_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0400] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      let constraintSize:ESObject = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_SaveScenarios_0400] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_SaveScenarios_0400] get obj is: " + JSON.stringify(obj));
      // size.height的默认值取值
      expect(obj.$attrs.size.height).assertEqual('15.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_SaveScenarios_0400] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_SaveScenarios_0400] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_SaveScenarios_0400] 设置权限成功");
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_SaveScenarios_0400] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_SaveScenarios_0400] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_SaveScenarios_0400] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_SaveScenarios_0400] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_SaveScenarios_0400] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0400] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_SaveScenarios_0400] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0400] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_0500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_0500
     * @tc.desc   Test SecurityComponent constraintSize.minWidth attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_SaveScenarios_0500] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": 0,
            "anchorY": 0,
            "offsetX": 0,
            "offsetY": 0,
            "fontSize": 16,
            "fontStyle": FontStyle.Normal,
            "fontWeight": FontWeight.Medium,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_SaveScenarios_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0500] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      let constraintSize:ESObject = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_SaveScenarios_0500] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_SaveScenarios_0500] get obj is: " + JSON.stringify(obj));
      // constraintSize.minWidth的默认值取值
      expect(constraintSize.minWidth).assertEqual('20.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_SaveScenarios_0500] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_SaveScenarios_0500] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_SaveScenarios_0500] 设置权限成功");
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_SaveScenarios_0500] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_SaveScenarios_0500] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_SaveScenarios_0500] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_SaveScenarios_0500] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_SaveScenarios_0500] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0500] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_SaveScenarios_0500] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0500] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_0600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_0600
     * @tc.desc   Test SecurityComponent constraintSize.maxWidth attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_SaveScenarios_0600] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": 0,
            "anchorY": 0,
            "offsetX": 0,
            "offsetY": 0,
            "fontSize": 16,
            "fontStyle": FontStyle.Normal,
            "fontWeight": FontWeight.Medium,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_SaveScenarios_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0600] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      let constraintSize:ESObject = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_SaveScenarios_0600] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_SaveScenarios_0600] get obj is: " + JSON.stringify(obj));
      // constraintSize.maxWidth的默认值取值
      expect(constraintSize.maxWidth).assertEqual('25.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_SaveScenarios_0600] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_SaveScenarios_0600] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_SaveScenarios_0600] 设置权限成功");
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_SaveScenarios_0600] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_SaveScenarios_0600] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_SaveScenarios_0600] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_SaveScenarios_0600] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_SaveScenarios_0600] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0600] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_SaveScenarios_0600] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0600] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_0700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_0700
     * @tc.desc   Test SecurityComponent constraintSize.minHeight attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_SaveScenarios_0700] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": 0,
            "anchorY": 0,
            "offsetX": 0,
            "offsetY": 0,
            "fontSize": 16,
            "fontStyle": FontStyle.Normal,
            "fontWeight": FontWeight.Medium,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_SaveScenarios_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0700] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      let constraintSize:ESObject = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_SaveScenarios_0700] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_SaveScenarios_0700] get obj is: " + JSON.stringify(obj));
      // constraintSize.minHeight的默认值取值
      expect(constraintSize.minHeight).assertEqual('30.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_SaveScenarios_0700] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_SaveScenarios_0700] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_SaveScenarios_0700] 设置权限成功");
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_SaveScenarios_0700] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_SaveScenarios_0700] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_SaveScenarios_0700] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_SaveScenarios_0700] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_SaveScenarios_0700] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0700] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_SaveScenarios_0700] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0700] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_0800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_0800
     * @tc.desc   Test SecurityComponent constraintSize.maxHeight attribute is Normal and Authorization succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_SaveScenarios_0800] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": 0,
            "anchorY": 0,
            "offsetX": 0,
            "offsetY": 0,
            "fontSize": 16,
            "fontStyle": FontStyle.Normal,
            "fontWeight": FontWeight.Medium,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_SaveScenarios_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0800] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      let constraintSize:ESObject = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_SaveScenarios_0800] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_SaveScenarios_0800] get obj is: " + JSON.stringify(obj));
      // constraintSize.maxHeight的默认值取值
      expect(constraintSize.maxHeight).assertEqual('35.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_SaveScenarios_0800] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_SaveScenarios_0800] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_SaveScenarios_0800] 设置权限成功");
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_SaveScenarios_0800] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_SaveScenarios_0800] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_SaveScenarios_0800] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_SaveScenarios_0800] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_SaveScenarios_0800] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0800] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_SaveScenarios_0800] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0800] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_0900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_0900
     * @tc.desc   Test SecurityComponent iconSize attribute is undefined and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_SaveScenarios_0900] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": undefined,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": 0,
            "anchorY": 0,
            "offsetX": 0,
            "offsetY": 0,
            "fontSize": 16,
            "fontStyle": FontStyle.Normal,
            "fontWeight": FontWeight.Medium,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_SaveScenarios_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0900] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_SaveScenarios_0900] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.iconSize).assertEqual('16.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_SaveScenarios_0900] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_SaveScenarios_0900] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_SaveScenarios_0900] 设置权限成功");
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_SaveScenarios_0900] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_SaveScenarios_0900] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_SaveScenarios_0900] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_SaveScenarios_0900] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_SaveScenarios_0900] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0900] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_SaveScenarios_0900] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_SaveScenarios_0900] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_1000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_1000
     * @tc.desc   Test SecurityComponent fontWeight set 400 and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_Button_SaveScenarios_1000';
      console.info(`====>${TCNAME} START====`);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            'fontWeight': 400,
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.error(`====>${TCNAME} change component data error: ` + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew: string = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info(`====>${TCNAME} get obj is: ` + JSON.stringify(obj));
      expect(obj.$attrs.fontWeight).assertEqual('400');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_1100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_1100
     * @tc.desc   Test SecurityComponent fontWeight set 'lighter' and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_Button_SaveScenarios_1100';
      console.info(`====>${TCNAME} START====`);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            'fontWeight': 'lighter',
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.error(`====>${TCNAME} change component data error: ` + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew: string = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info(`====>${TCNAME} get obj is: ` + JSON.stringify(obj));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_1200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_1200
     * @tc.desc   Test SecurityComponent fontWeight set '' and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_Button_SaveScenarios_1200';
      console.info(`====>${TCNAME} START====`);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            'fontWeight': '',
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.error(`====>${TCNAME} change component data error: ` + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew: string = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info(`====>${TCNAME} get obj is: ` + JSON.stringify(obj));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_1300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_1300
     * @tc.desc   Test SecurityComponent fontFamily set '' and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_Button_SaveScenarios_1300';
      console.info(`====>${TCNAME} START====`);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            'fontFamily': '',
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.error(`====>${TCNAME} change component data error: ` + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew: string = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info(`====>${TCNAME} get obj is: ` + JSON.stringify(obj));
      expect(obj.$attrs.fontFamily).assertEqual('HarmonyOS Sans');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_1400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_1400
     * @tc.desc   Test SecurityComponent id set '' and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_Button_SaveScenarios_1400';
      console.info(`====>${TCNAME} START====`);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            'id': '',
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.error(`====>${TCNAME} change component data error: ` + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew: string = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info(`====>${TCNAME} get obj is: ` + JSON.stringify(obj));
      expect(obj.$attrs.id).assertEqual('keySave11');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_1500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_1500
     * @tc.desc   Test SecurityComponent maxFontSize&minFontSize set string and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_Button_SaveScenarios_1500';
      console.info(`====>${TCNAME} START====`);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            'maxFontSize': '20',
            'minFontSize': '10',
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.error(`====>${TCNAME} change component data error: ` + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew: string = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info(`====>${TCNAME} get obj is: ` + JSON.stringify(obj));
      expect(obj.$attrs.maxFontSize).assertEqual('20.00fp');
      expect(obj.$attrs.minFontSize).assertEqual('10.00fp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, driver);
    });

    /**
     * @tc.name   Test_Security_Button_SaveScenarios_1600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_SaveScenarios_1600
     * @tc.desc   Test SecurityComponent enabled set false and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_SaveScenarios_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_Button_SaveScenarios_1600';
      console.info(`====>${TCNAME} START====`);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            'enable': false
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info(`====>${TCNAME} start to publish emit`);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.error(`====>${TCNAME} change component data error: ` + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew: string = getInspectorByKey('keySave11');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info(`====>${TCNAME} get obj is: ` + JSON.stringify(obj));
      expect(obj.$attrs.enabled).assertEqual(false);
      done();
    });
  });
}
