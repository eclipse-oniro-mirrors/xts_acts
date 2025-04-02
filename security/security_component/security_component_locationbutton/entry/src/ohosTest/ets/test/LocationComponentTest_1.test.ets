/**
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import Utils from './Utils';
import { emitter } from '@kit.BasicServicesKit';

export default function locationComponentTest_1() {
  describe('locationComponentTest_1', () =>{
    beforeAll(async (done:Function) => {
      let options:router.RouterOptions = {
        url: 'testability/pages/locationButton_1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("====>locationComponentTest_1 get state success " + JSON.stringify(pages));
        if (!("locationButton_1" == pages.name)) {
          console.info("====>locationComponentTest_1 get state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("====>locationComponentTest_1 push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("====>locationComponentTest_1 push page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("====>locationComponentTest_1 after each called");
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Location_2300
     * @tc.name Test_Security_Button_Location_2300
     * @tc.desc Test SecurityComponent The button style is a line and text describes the location selected and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_Location_2300', 0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Location_2300] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyLocation2');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.icon:" + obj.$attrs.icon);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.icon).assertEqual(1);
      expect(obj.$attrs.text).assertEqual(1);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Location_2300] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Location_2300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Location_2300] 设置权限成功");
              expect(clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Location_2300] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Location_2300] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Location_2300] END====");
              done();
            }
          }else {
            console.info("====>[Test_Security_Button_Location_2300] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Location_2300] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2300] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('LocationButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Location_2300] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
        let button2 = await driver.findComponents(ON.id('switchButton'));
        await button2[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2300] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Location_2400
     * @tc.name Test_Security_Button_Location_2400
     * @tc.desc Test SecurityComponent The text describes the location selected and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_Location_2400', 0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Location_2400] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyLocation3');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(2);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Location_2400] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Location_2400] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Location_2400] 设置权限成功");
              expect(clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Location_2400] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Location_2400] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Location_2400] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Location_2400] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Location_2400] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2400] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('LocationButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Location_2400] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
        let button2 = await driver.findComponents(ON.id('switchButton'));
        await button2[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2400] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Location_2500
     * @tc.name Test_Security_Button_Location_2500
     * @tc.desc Test SecurityComponent The text describes a shared location and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_Location_2500', 0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Location_2500] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyLocation4');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(3);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Location_2500] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Location_2500] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Location_2500] 设置权限成功");
              expect(clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Location_2500] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Location_2500] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Location_2500] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Location_2500] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Location_2500] END====");
            done();
          }
        }
        let clickEvent:emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2500] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('LocationButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Location_2500] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
        let button2 = await driver.findComponents(ON.id('switchButton'));
        await button2[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2500] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Location_2600
     * @tc.name Test_Security_Button_Location_2600
     * @tc.desc Test SecurityComponent The text describes the location of the send and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_Location_2600', 0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Location_2600] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyLocation5');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(4);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if (clickData.data != undefined) {
            console.info("====>[Test_Security_Button_Location_2600] get clickEvent result is: " +
            JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Location_2600] get clickData.data.clickResult is: " +
            JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Location_2600] 设置权限成功");
              expect(clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Location_2600] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Location_2600] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Location_2600] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Location_2600] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Location_2600] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2600] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('LocationButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Location_2600] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
        let button2 = await driver.findComponents(ON.id('switchButton'));
        await button2[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2600] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Location_2700
     * @tc.name Test_Security_Button_Location_2700
     * @tc.desc Test SecurityComponent The text describes positioning and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_Location_2700', 0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Location_2700] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyLocation6');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(5);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if (clickData.data != undefined) {
            console.info("====>[Test_Security_Button_Location_2700] get clickEvent result is: " +
            JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Location_2700] get clickData.data.clickResult is: " +
            JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Location_2700] 设置权限成功");
              expect(clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Location_2700] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Location_2700] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Location_2700] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Location_2700] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Location_2700] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2700] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('LocationButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Location_2700] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
        let button2 = await driver.findComponents(ON.id('switchButton'));
        await button2[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2700] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Location_2800
     * @tc.name Test_Security_Button_Location_2800
     * @tc.desc Test SecurityComponent The text describes the location and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_Location_2800', 0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Location_2800] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyLocation7');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(6);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if (clickData.data != undefined) {
            console.info("====>[Test_Security_Button_Location_2800] get clickEvent result is: " +
            JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Location_2800] get clickData.data.clickResult is: " +
            JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Location_2800] 设置权限成功");
              expect(clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Location_2800] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Location_2800] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Location_2800] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Location_2800] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Location_2800] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2800] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('LocationButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Location_2800] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
        let button2 = await driver.findComponents(ON.id('switchButton'));
        await button2[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2800] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Location_2900
     * @tc.name Test_Security_Button_Location_2900
     * @tc.desc Test SecurityComponent The text describes the real-time location of the send and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_Location_2900', 0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Location_2900] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyLocation8');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(7);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if (clickData.data != undefined) {
            console.info("====>[Test_Security_Button_Location_2900] get clickEvent result is: " +
            JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Location_2900] get clickData.data.clickResult is: " +
            JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Location_2900] 设置权限成功");
              expect(clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Location_2900] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Location_2900] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Location_2900] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Location_2900] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Location_2900] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2900] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('LocationButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Location_2900] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
        let button2 = await driver.findComponents(ON.id('switchButton'));
        await button2[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_2900] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Location_3000
     * @tc.name Test_Security_Button_Location_3000
     * @tc.desc Test SecurityComponent The text describes repositioning and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_Location_3000', 0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Location_3000] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyLocation9');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(8);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Location_3000] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Location_3000] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Location_3000] 设置权限成功");
              expect(clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Location_3000] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Location_3000] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Location_3000] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Location_3000] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Location_3000] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_3000] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('LocationButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Location_3000] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
        let button2 = await driver.findComponents(ON.id('switchButton'));
        await button2[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_3000] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Location_3100
     * @tc.name Test_Security_Button_Location_3100
     * @tc.desc Test SecurityComponent The text description is punch card positioning and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_Location_3100', 0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Location_3100] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyLocation10');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(9);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Location_3100] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Location_3100] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Location_3100] 设置权限成功");
              expect(clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Location_3100] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Location_3100] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Location_3100] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Location_3100] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Location_3100] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_3100] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('LocationButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Location_3100] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
        let button2 = await driver.findComponents(ON.id('switchButton'));
        await button2[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_3100] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Location_3200
     * @tc.name Test_Security_Button_Location_3200
     * @tc.desc Test SecurityComponent The text describes the location and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_Location_3200', 0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Location_3200] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyLocation11');
      let obj : ESObject = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(10);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Location_3200] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Location_3200] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Location_3200] 设置权限成功");
              expect(clickData.data.clickResult == LocationButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Location_3200] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Location_3200] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Location_3200] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Location_3200] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Location_3200] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_3200] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('LocationButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Location_3200] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
        let button2 = await driver.findComponents(ON.id('switchButton'));
        await button2[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Location_3200] clickSecComponent err : " + JSON.stringify(err));
      }
    });
  })
}