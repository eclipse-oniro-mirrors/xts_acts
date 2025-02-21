/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export default function saveComponentTest_1() {
  describe('saveComponentTest_1', function () {
    beforeAll(async function (done) {
      let options = {
        url: 'MainAbility/pages/saveButton_1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("====>saveComponentTest_1 get state success " + JSON.stringify(pages));
        if (!("saveButton_1" == pages.name)) {
          console.info("====>saveComponentTest_1 get state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("====>saveComponentTest_1 push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("====>saveComponentTest_1 push page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("====>saveComponentTest_1 after each called");
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2300
     * @tc.name Test_Security_Button_Save_2300
     * @tc.desc Test SecurityComponent The button style is a line and the text is described as a download file and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_2300', 0, async function (done) {
      console.info('====>[Test_Security_Button_Save_2300] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.icon:" + obj.$attrs.icon);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.icon).assertEqual(1);
      expect(obj.$attrs.text).assertEqual(1);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_Save_2300] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_Save_2300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_Save_2300] 设置权限成功");
            expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_Save_2300] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_Save_2300] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Save_2300] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2300] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Save_2300] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2300] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2400
     * @tc.name Test_Security_Button_Save_2400
     * @tc.desc Test SecurityComponent The text is described as saving and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_2400', 0, async function (done) {
      console.info('====>[Test_Security_Button_Save_2400] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave3');
      let obj = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(2);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_Save_2400] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_Save_2400] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_Save_2400] 设置权限成功");
            expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_Save_2400] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_Save_2400] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Save_2400] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2400] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Save_2400] button is:" + JSON.stringify(button));
        await button[1].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2400] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2500
     * @tc.name Test_Security_Button_Save_2500
     * @tc.desc Test SecurityComponent The text describes saving the image and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_2500', 0, async function (done) {
      console.info('====>[Test_Security_Button_Save_2500] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave4');
      let obj = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(3);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_Save_2500] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_Save_2500] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_Save_2500] 设置权限成功");
            expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_Save_2500] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_Save_2500] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Save_2500] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2500] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Save_2500] button is:" + JSON.stringify(button));
        await button[2].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2500] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2600
     * @tc.name Test_Security_Button_Save_2600
     * @tc.desc Test SecurityComponent The text describes the saved file and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_2600', 0, async function (done) {
      console.info('====>[Test_Security_Button_Save_2600] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave5');
      let obj = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(4);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_Save_2600] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_Save_2600] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_Save_2600] 设置权限成功");
            expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_Save_2600] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_Save_2600] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Save_2600] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2600] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Save_2600] button is:" + JSON.stringify(button));
        await button[3].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2600] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2700
     * @tc.name Test_Security_Button_Save_2700
     * @tc.desc Test SecurityComponent The text description is download and share and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_2700', 0, async function (done) {
      console.info('====>[Test_Security_Button_Save_2700] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave6');
      let obj = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(5);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_Save_2700] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_Save_2700] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_Save_2700] 设置权限成功");
            expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_Save_2700] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_Save_2700] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Save_2700] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2700] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Save_2700] button is:" + JSON.stringify(button));
        await button[4].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2700] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2800
     * @tc.name Test_Security_Button_Save_2800
     * @tc.desc Test SecurityComponent The text is described as receiving and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_2800', 0, async function (done) {
      console.info('====>[Test_Security_Button_Save_2800] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave7');
      let obj = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(6);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_Save_2800] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_Save_2800] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_Save_2800] 设置权限成功");
            expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_Save_2800] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_Save_2800] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Save_2800] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2800] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Save_2800] button is:" + JSON.stringify(button));
        await button[5].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2800] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_2900
     * @tc.name Test_Security_Button_Save_2900
     * @tc.desc Test SecurityComponent The text describes continued receiving and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_2900', 0, async function (done) {
      console.info('====>[Test_Security_Button_Save_2900] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave8');
      let obj = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(7);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_Save_2900] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_Save_2900] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_Save_2900] 设置权限成功");
            expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_Save_2900] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_Save_2900] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Save_2900] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2900] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Save_2900] button is:" + JSON.stringify(button));
        await button[6].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_2900] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_3000
     * @tc.name Test_Security_Button_Save_3000
     * @tc.desc Test SecurityComponent The text describes save to gallery and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_3000', 0, async function (done) {
      console.info('====>[Test_Security_Button_Save_3000] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave9');
      let obj = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(8);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_Save_3000] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_Save_3000] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_Save_3000] 设置权限成功");
            expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_Save_3000] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_Save_3000] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_3000] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3000] once clickEvent err : " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Save_3000] button is:" + JSON.stringify(button));
        await button[7].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3000] clickSecComponent err : " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_3100
     * @tc.name Test_Security_Button_Save_3100
     * @tc.desc Test SecurityComponent The text describes export to gallery and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_3100', 0, async function (done) {
      console.info('====>[Test_Security_Button_Save_3100] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave15');
      let obj = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(9);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_Save_3100] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_Save_3100] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_Save_3100] 设置权限成功");
            expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_Save_3100] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_Save_3100] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_3100] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3100] once clickEvent err : " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Save_3100] button is:" + JSON.stringify(button));
        await button[8].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3100] clickSecComponent err : " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_3200
     * @tc.name Test_Security_Button_Save_3200
     * @tc.desc Test SecurityComponent The text describes quick save to gallery and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_3200', 0, async function (done) {
      console.info('====>[Test_Security_Button_Save_3200] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave16');
      let obj = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(10);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_Save_3200] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_Save_3200] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_Save_3200] 设置权限成功");
            expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_Save_3200] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_Save_3200] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_3200] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3200] once clickEvent err : " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Save_3200] button is:" + JSON.stringify(button));
        await button[9].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3200] clickSecComponent err : " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });
	
	/**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_3300
     * @tc.name Test_Security_Button_Save_3300
     * @tc.desc Test SecurityComponent The text describes resave to gallery and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_3300', 0, async function (done) {
      console.info('====>[Test_Security_Button_Save_3300] START====');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keySave17');
      let obj = JSON.parse(strJsonNew);
      console.info("====>component obj.$attrs.text:" + obj.$attrs.text);
      expect(obj.$attrs.text).assertEqual(11);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_Save_3300] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_Save_3300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_Save_3300] 设置权限成功");
            expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_Save_3300] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_Save_3300] 设置权限失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Save_3300] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3300] once clickEvent err : " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Save_3300] button is:" + JSON.stringify(button));
        await button[10].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Save_3300] clickSecComponent err : " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });
  })
}