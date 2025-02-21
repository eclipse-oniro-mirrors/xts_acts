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

export default function pasteComponentTest_1() {
  describe('pasteComponentTest_1', function () {
    beforeAll(async function (done) {
      console.info("====>pasteComponentTest_1 start");
      let options = {
        url: 'MainAbility/pages/pasteButton_1',
      };
      console.info("====>pasteComponentTest_1 get options" + JSON.stringify(options));
      try {
        router.clear();
        let pages = router.getState();
        console.info("====>pasteComponentTest_1 get state success " + JSON.stringify(pages));
        if (!("pasteButton_1" == pages.name)) {
          console.info("====>pasteComponentTest_1 get state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("====>pasteComponentTest_1 push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("====>pasteComponentTest_1 push page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("====>pasteComponentTest_1 after each called");
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_0100
     * @tc.name Test_Security_Button_PasteScenarios_0100
     * @tc.desc Test SecurityComponent width attribute value is Normal and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_0100', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_0100] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_0100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0100] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_0100] get obj is: " + JSON.stringify(obj));
      // width的默认值取值
      expect(obj.$attrs.width).assertEqual('10.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_0100] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_0100] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_0100] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_0100] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_0100] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_0100] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0100] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_0100] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0100] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_0200
     * @tc.name Test_Security_Button_PasteScenarios_0200
     * @tc.desc Test SecurityComponent height attribute is Normal and Authorization succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_0200', 3, async function (done) {
      console.info('====>[TTest_Security_Button_PasteScenarios_0200] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[TTest_Security_Button_PasteScenarios_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[TTest_Security_Button_PasteScenarios_0200] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[TTest_Security_Button_PasteScenarios_0200] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.height).assertEqual('15.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[TTest_Security_Button_PasteScenarios_0200] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[TTest_Security_Button_PasteScenarios_0200] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[TTest_Security_Button_PasteScenarios_0200] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[TTest_Security_Button_PasteScenarios_0200] END====");
            done();
          } else {
            console.info("====>[TTest_Security_Button_PasteScenarios_0200] 设置权限失败");
            expect().assertFail()
            console.info("====>[TTest_Security_Button_PasteScenarios_0200] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[TTest_Security_Button_PasteScenarios_0200] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[TTest_Security_Button_PasteScenarios_0200] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[TTest_Security_Button_PasteScenarios_0200] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_0300
     * @tc.name Test_Security_Button_PasteScenarios_0300
     * @tc.desc Test SecurityComponent size.width attribute is Normal and Authorization succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_0300', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_0300] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0300] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      let constraintSize = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_PasteScenarios_0300] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_PasteScenarios_0300] get obj is: " + JSON.stringify(obj));
      // size.width的默认值取值
      expect(obj.$attrs.size.width).assertEqual('10.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_0300] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_0300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_0300] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_0300] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_0300] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_0300] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0300] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_0300] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0300] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_0400
     * @tc.name Test_Security_Button_PasteScenarios_0400
     * @tc.desc Test SecurityComponent size.height attribute is Normal and Authorization succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_0400', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_0400] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0400] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      let constraintSize = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_PasteScenarios_0400] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_PasteScenarios_0400] get obj is: " + JSON.stringify(obj));
      // size.height的默认值取值
      expect(obj.$attrs.size.height).assertEqual('15.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_0400] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_0400] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_0400] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_0400] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_0400] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_0400] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0400] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_0400] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0400] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_0500
     * @tc.name Test_Security_Button_PasteScenarios_0500
     * @tc.desc Test SecurityComponent constraintSize.minWidth attribute is Normal and Authorization succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_0500', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_0500] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0500] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      let constraintSize = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_PasteScenarios_0500] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_PasteScenarios_0500] get obj is: " + JSON.stringify(obj));
      // constraintSize.minWidth的默认值取值
      expect(constraintSize.minWidth).assertEqual('20.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_0500] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_0500] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_0500] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_0500] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_0500] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_0500] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0500] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_0500] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0500] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_0600
     * @tc.name Test_Security_Button_PasteScenarios_0600
     * @tc.desc Test SecurityComponent constraintSize.maxWidth attribute is Normal and Authorization succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_0600', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_0600] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0600] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      let constraintSize = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_PasteScenarios_0600] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_PasteScenarios_0600] get obj is: " + JSON.stringify(obj));
      // constraintSize.maxWidth的默认值取值
      expect(constraintSize.maxWidth).assertEqual('25.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_0600] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_0600] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_0600] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_0600] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_0600] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_0600] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0600] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_0600] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0600] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_0700
     * @tc.name Test_Security_Button_PasteScenarios_0700
     * @tc.desc Test SecurityComponent constraintSize.minHeight attribute is Normal and Authorization succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_0700', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_0700] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0700] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      let constraintSize = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_PasteScenarios_0700] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_PasteScenarios_0700] get obj is: " + JSON.stringify(obj));
      // constraintSize.minHeight的默认值取值
      expect(constraintSize.minHeight).assertEqual('30.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_0700] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_0700] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_0700] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_0700] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_0700] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_0700] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0700] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_0700] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0700] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_0800
     * @tc.name Test_Security_Button_PasteScenarios_0800
     * @tc.desc Test SecurityComponent constraintSize.maxHeight attribute is Normal and Authorization succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_0800', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_0800] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0800] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      let constraintSize = JSON.parse(obj.$attrs.constraintSize);
      console.info("====>[Test_Security_Button_PasteScenarios_0800] get constraintSize is: " + JSON.stringify(constraintSize));
      console.info("====>[Test_Security_Button_PasteScenarios_0800] get obj is: " + JSON.stringify(obj));
      // constraintSize.maxHeight的默认值取值
      expect(constraintSize.maxHeight).assertEqual('35.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_0800] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_0800] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_0800] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_0800] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_0800] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_0800] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0800] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_0800] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0800] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_0900
     * @tc.name Test_Security_Button_PasteScenarios_0900
     * @tc.desc Test SecurityComponent layoutDirection attribute is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_0900', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_0900] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": undefined,
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0900] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_0900] get obj is: " + JSON.stringify(obj));
      // layoutDirection的undefined取值
      expect(obj.$attrs.layoutDirection).assertEqual(SecurityComponentLayoutDirection.HORIZONTAL);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_0900] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_0900] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_0900] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_0900] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_0900] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_0900] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0900] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_0900] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_0900] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_1000
     * @tc.name Test_Security_Button_PasteScenarios_1000
     * @tc.desc Test SecurityComponent iconSize attribute is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_1000', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_1000] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1000] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_1000] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.iconSize).assertEqual('16.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_1000] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_1000] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_1000] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_1000] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_1000] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_1000] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1000] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_1000] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1000] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_1100
     * @tc.name Test_Security_Button_PasteScenarios_1100
     * @tc.desc Test SecurityComponent position attribute X is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_1100', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_1100] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": undefined,
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1100] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_1100] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.position.x).assertEqual('0.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_1100] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_1100] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_1100] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_1100] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_1100] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_1100] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1100] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_1100] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1100] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_1200
     * @tc.name Test_Security_Button_PasteScenarios_1200
     * @tc.desc Test SecurityComponent position attribute Y is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_1200', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_1200] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 0,
            "positionY": undefined,
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1200] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_1200] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.position.y).assertEqual('0.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_1200] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_1200] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_1200] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_1200] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_1200] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_1200] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1200] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_1200] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1200] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_1300
     * @tc.name Test_Security_Button_PasteScenarios_1300
     * @tc.desc Test SecurityComponent markAnchor attribute X is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_1300', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_1300] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": undefined,
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1300] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_1300] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.markAnchor.x).assertEqual('0.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_1300] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_1300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_1300] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_1300] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_1300] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_1300] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1300] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_1300] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1300] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_1400
     * @tc.name Test_Security_Button_PasteScenarios_1400
     * @tc.desc Test SecurityComponent markAnchor attribute Y is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_1400', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_1400] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": undefined,
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1400] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_1400] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.markAnchor.y).assertEqual('0.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_1400] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_1400] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_1400] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_1400] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_1400] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_1400] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1400] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_1400] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1400] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_1500
     * @tc.name Test_Security_Button_PasteScenarios_1500
     * @tc.desc Test SecurityComponent offset attribute X is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_1500', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_1500] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "offsetX": undefined,
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1500] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_1500] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.offset.x).assertEqual('0.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_1500] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_1500] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_1500] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_1500] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_1500] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_1500] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1500] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_1500] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1500] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_1600
     * @tc.name Test_Security_Button_PasteScenarios_1600
     * @tc.desc Test SecurityComponent offset attribute Y is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_1600', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_1600] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "offsetY": undefined,
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1600] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_1600] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.offset.y).assertEqual('0.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_1600] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_1600] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_1600] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_1600] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_1600] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_1600] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1600] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_1600] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1600] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_1700
     * @tc.name Test_Security_Button_PasteScenarios_1700
     * @tc.desc Test SecurityComponent fontSize attribute is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_1700', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_1700] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontSize": undefined,
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
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1700] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_1700] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_1700] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_1700] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_1700] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_1700] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_1700] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_1700] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1700] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_1700] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1700] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_1800
     * @tc.name Test_Security_Button_PasteScenarios_1800
     * @tc.desc Test SecurityComponent fontStyle attribute is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_1800', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_1800] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontStyle": undefined,
            "fontWeight": FontWeight.Medium,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1800] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_1800] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontStyle).assertEqual(FontStyle.Normal);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_1800] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_1800] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_1800] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_1800] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_1800] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_1800] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1800] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_1800] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1800] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_1900
     * @tc.name Test_Security_Button_PasteScenarios_1900
     * @tc.desc Test SecurityComponent fontWeight attribute is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_1900', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_1900] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontWeight": undefined,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1900] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_1900] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontWeight).assertEqual("FontWeight.Medium");
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_1900] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_1900] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_1900] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_1900] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_1900] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_1900] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1900] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_1900] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_1900] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_2000
     * @tc.name Test_Security_Button_PasteScenarios_2000
     * @tc.desc Test SecurityComponent fontFamily attribute is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_2000', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_2000] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontWeight": FontWeight.Normal,
            "fontFamily": undefined,
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2000] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_2000] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontFamily).assertEqual("HarmonyOS Sans");
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_2000] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_2000] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_2000] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_2000] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_2000] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_2000] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2000] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_2000] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2000] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_2100
     * @tc.name Test_Security_Button_PasteScenarios_2100
     * @tc.desc Test SecurityComponent fontColor attribute is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_2100', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_2100] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontWeight": FontWeight.Normal,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": undefined,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2100] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_2100] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontColor).assertEqual("#FFFFFFFF");
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_2100] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_2100] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_2100] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_2100] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_2100] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_2100] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2100] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_2100] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2100] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_2200
     * @tc.name Test_Security_Button_PasteScenarios_2200
     * @tc.desc Test SecurityComponent fontColor attribute is RGB value transmitted and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_2200', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_2200] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontWeight": FontWeight.Normal,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 'rgb(255, 255, 1)',
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2200] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_2200] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontColor).assertEqual("#FFFFFF01");
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_2200] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_2200] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_2200] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_2200] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_2200] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_2200] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2200] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_2200] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2200] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_2300
     * @tc.name Test_Security_Button_PasteScenarios_2300
     * @tc.desc Test SecurityComponent iconColor attribute is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_2300', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_2300] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontWeight": FontWeight.Normal,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": undefined,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2300] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_2300] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.iconColor).assertEqual("#FFFFFFFF");
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_2300] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_2300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_2300] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_2300] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_2300] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_2300] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2300] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_2300] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2300] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_2400
     * @tc.name Test_Security_Button_PasteScenarios_2400
     * @tc.desc Test SecurityComponent iconColor attribute is RGB value transmitted and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_2400', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_2400] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontWeight": FontWeight.Normal,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 'rgb(255, 255, 1)',
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2400] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_2400] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.iconColor).assertEqual('#FFFFFF01');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_2400] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_2400] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_2400] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_2400] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_2400] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_2400] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2400] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_2400] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2400] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_2500
     * @tc.name Test_Security_Button_PasteScenarios_2500
     * @tc.desc Test SecurityComponent backgroundColor attribute is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_2500', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_2500] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontWeight": FontWeight.Normal,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": undefined,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2500] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_2500] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.backgroundColor).assertEqual("#FF007DFF");
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_2500] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_2500] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_2500] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_2500] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_2500] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_2500] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2500] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_2500] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2500] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_2600
     * @tc.name Test_Security_Button_PasteScenarios_2600
     * @tc.desc Test SecurityComponent backgroundColor attribute is RGB value transmitted and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_2600', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_2600] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontWeight": FontWeight.Normal,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 'rgb(0, 235, 255)',
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2600] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_2600] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.backgroundColor).assertEqual('#FF00EBFF');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_2600] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_2600] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_2600] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_2600] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_2600] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_2600] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2600] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_2600] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2600] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_2700
     * @tc.name Test_Security_Button_PasteScenarios_2700
     * @tc.desc Test SecurityComponent borderColor attribute is undefined and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_2700', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_2700] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontWeight": FontWeight.Normal,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": undefined,
            "borderRad": 0,
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2700] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_2700] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.borderColor).assertEqual("#FFFFFFFF");
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_2700] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_2700] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_2700] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_2700] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_2700] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_2700] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2700] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_2700] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2700] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_PasteScenarios_2800
     * @tc.name Test_Security_Button_PasteScenarios_2800
     * @tc.desc Test SecurityComponent borderColor attribute is RGB value transmitted and Authorization is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_PasteScenarios_2800', 3, async function (done) {
      console.info('====>[Test_Security_Button_PasteScenarios_2800] START====');
      await Utils.sleep(1000);
      try {
        var eventData = {
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
            "fontWeight": FontWeight.Normal,
            "fontFamily": 'HarmonyOS Sans',
            "fontColor": 0xffffffff,
            "iconColor": 0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 'rgb(0, 235, 155)',
            "borderRad": 0,
            "left": 24,
            "right": 24,
            "top": 8,
            "bottom": 8,
            "middle": 4,
            "width": 10,
            "height": 15,
            "minWidth": 20,
            "maxWidth": 25,
            "minHeight": 30,
            "maxHeight": 35
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_PasteScenarios_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2800] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste2');
      let obj = JSON.parse(strJsonNew);
      console.info("====>[Test_Security_Button_PasteScenarios_2800] get obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.borderColor).assertEqual('#FF00EB9B');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData) => {
          console.info("====>[Test_Security_Button_PasteScenarios_2800] get clickEvent result is: " + JSON.stringify(clickEvent));
          console.info("====>[Test_Security_Button_PasteScenarios_2800] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
          if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
            console.info("====>[Test_Security_Button_PasteScenarios_2800] 设置权限成功");
            expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
            console.info("====>[Test_Security_Button_PasteScenarios_2800] END====");
            done();
          } else {
            console.info("====>[Test_Security_Button_PasteScenarios_2800] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_PasteScenarios_2800] END====");
            done();
          }
        }
        var clickEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2800] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_PasteScenarios_2800] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_PasteScenarios_2800] clickSecComponent err : " + JSON.stringify(err));
      }
    });
  })
}