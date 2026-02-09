/**
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
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
import display from '@ohos.display';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import Utils from './Utils';
import window from '@ohos.window';
import { ObjectUtils } from './ObjectUtils'

export default function pasteComponentTest() {
  describe('pasteComponentTest', ( ) => {
    beforeAll(async (done:Function) => {
      try {
        let driver = Driver.create();
        await Utils.sleep(500);
        let dialog_usb = await driver.findComponent(ON.type('Dialog'));
        if (dialog_usb !== null) {
          let button = await driver.findComponent(ON.id('advanced_dialog_button_0'));
          console.info("====>beforeAll USB_Dialog button is : " + JSON.stringify(button));
          await button.click();
          await Utils.sleep(500);
        } else {
          console.info("====>beforeAll USB_Dialog not exist.");
        }
      } catch (err) {
        console.info("====>beforeAll USB_Dialog err : " + JSON.stringify(err));
      }
      let options:router.RouterOptions = {
        url: 'testability/pages/pasteButton',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("====>pasteComponentTest get state success " + JSON.stringify(pages));
        if (!("pasteButton" == pages.name)) {
          console.info("====>pasteComponentTest get state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("====>pasteComponentTest push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("====>pasteComponentTest push page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("====>pasteComponentTest after each called");
    });

    /**
     * @tc.name   Test_Security_Button_Paste_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_0100
     * @tc.desc   Test SecurityComponent Default parameters and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_Security_Button_Paste_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_0100] START');
      let strJson = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.icon).assertEqual(0);
      expect(obj.$attrs.text).assertEqual(0);
      expect(obj.$attrs.buttonType).assertEqual(0);
      expect(obj.$attrs.iconSize).assertEqual('16.00vp');
      expect(obj.$attrs.layoutDirection).assertEqual(0);
      expect(obj.$attrs.position.x).assertEqual('0.00vp');
      expect(obj.$attrs.position.y).assertEqual('0.00vp');
      expect(obj.$attrs.markAnchor.x).assertEqual('0.00vp');
      expect(obj.$attrs.markAnchor.y).assertEqual('0.00vp');
      expect(obj.$attrs.offset.x).assertEqual('0.00vp');
      expect(obj.$attrs.offset.y).assertEqual('0.00vp');
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
      expect(obj.$attrs.fontStyle).assertEqual(0);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Medium');
      expect(obj.$attrs.fontFamily).assertEqual('HarmonyOS Sans');
      expect(obj.$attrs.fontColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.iconColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.backgroundColor).assertEqual('#FF007DFF');
      expect(obj.$attrs.borderStyle).assertEqual(1);
      expect(obj.$attrs.borderWidth).assertEqual('0.00vp');
      expect(obj.$attrs.borderColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.borderRadius).assertEqual('0.00vp');
      expect(obj.$attrs.padding.left).assertEqual('12.00vp');
      expect(obj.$attrs.padding.right).assertEqual('12.00vp');
      expect(obj.$attrs.padding.top).assertEqual('4.00vp');
      expect(obj.$attrs.padding.bottom).assertEqual('4.00vp');
      expect(obj.$attrs.textIconSpace).assertEqual('4.00vp');
      expect(obj.$attrs.align).assertEqual('Alignment.Center');
      expect(obj.$attrs.id).assertEqual('keyPaste');
      await Utils.sleep(1000);
      try {
        let clickCallback = async (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_0100] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_0100] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_0100] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              await Utils.sleep(500);
              console.info("====>[Test_Security_Button_Paste_0100] END====");
              done()
            } else {
              console.info("====>[Test_Security_Button_Paste_0100] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_0100] END====");
              done()
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_0100] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_0100] END====");
            done()
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0100] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_0100] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0100] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_0200
     * @tc.desc   Test SecurityComponent layoutDirection attribute is VERTICAL and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_0200] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": SecurityComponentLayoutDirection.VERTICAL,
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
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0200] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.layoutDirection).assertEqual(SecurityComponentLayoutDirection.VERTICAL);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_0200] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_0200] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_0200] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_0200] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_0200] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_0200] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_0200] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_0200] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0200] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_0200] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0200] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_0300
     * @tc.desc   Test SecurityComponent position.x is 150.00vp and position.y is 20.00vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_0300] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": 10,
            "positionY": 10,
            "anchorX": 20,
            "anchorY": 20,
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
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0300] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.position.x).assertEqual('10.00vp');
      expect(obj.$attrs.position.y).assertEqual('10.00vp');
      expect(obj.$attrs.markAnchor.x).assertEqual('20.00vp');
      expect(obj.$attrs.markAnchor.y).assertEqual('20.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_0300] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_0300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_0300] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_0300] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_0300] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_0300] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_0300] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_0300] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0300] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_0300] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0300] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_0400
     * @tc.desc   Test SecurityComponent offset and markAnchor attribute is normal and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_0400] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 1,
            "positionX": 0,
            "positionY": 0,
            "anchorX": 20,
            "anchorY": 20,
            "offsetX": 10,
            "offsetY": 10,
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
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0400] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.offset.x).assertEqual('10.00vp');
      expect(obj.$attrs.offset.y).assertEqual('10.00vp');
      expect(obj.$attrs.markAnchor.x).assertEqual('20.00vp');
      expect(obj.$attrs.markAnchor.y).assertEqual('20.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_0400] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_0400] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_0400] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_0400] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_0400] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_0400] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_0400] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_0400] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0400] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_0400] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0400] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_0500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_0500
     * @tc.desc   Test SecurityComponent FontStyle attribute is Italic and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_0500] START====');
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
            "fontStyle": FontStyle.Italic,
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
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0500] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontStyle).assertEqual(1);
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_0500] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_0500] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_0500] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_0500] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_0500] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_0500] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_0500] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_0500] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0500] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_0500] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0500] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_0600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_0600
     * @tc.desc   Test SecurityComponent FontWeight attribute is Lighter and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_0600] START====');
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
            "fontWeight": FontWeight.Lighter,
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
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0600] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_0600] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_0600] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_0600] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_0600] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_0600] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_0600] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_0600] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_0600] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0600] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_0600] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0600] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_0700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_0700
     * @tc.desc   Test SecurityComponent FontWeight attribute is Normal and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_0700] START====');
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
            "fontWeight": FontWeight.Normal,
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
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0700] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_0700] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_0700] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_0700] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_0700] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_0700] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_0700] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_0700] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_0700] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0700] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_0700] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0700] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_0800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_0800
     * @tc.desc   Test SecurityComponent FontWeight attribute is Regular and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_0800] START====');
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
            "fontWeight": FontWeight.Regular,
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
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0800] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Regular');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_0800] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_0800] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_0800] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_0800] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_0800] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_0800] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_0800] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_0800] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0800] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_0800] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0800] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_0900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_0900
     * @tc.desc   Test SecurityComponent FontWeight attribute is Bold and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_0900] START====');
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
            "fontWeight": FontWeight.Bold,
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
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0900] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_0900] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_0900] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_0900] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_0900] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_0900] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_0900] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_0900] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_0900] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0900] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_0900] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_0900] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_1000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_1000
     * @tc.desc   Test SecurityComponent FontWeight attribute is Bolder and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_1000] START====');
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
            "fontWeight": FontWeight.Bolder,
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
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1000] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bolder');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_1000] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_1000] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_1000] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_1000] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_1000] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_1000] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_1000] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_1000] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1000] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1000] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1000] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_1100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_1100
     * @tc.desc   Test SecurityComponent BorderStyle is Dotted , borderWidth , borderColor , borderRadius attribute is normal and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_1100] START====');
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
            "borderSty": BorderStyle.Dotted,
            "borderWid": 5,
            "borderCol": 0xffffffff,
            "borderRad": 5,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1100] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.borderStyle).assertEqual(2);
      expect(obj.$attrs.borderWidth).assertEqual('5.00vp');
      expect(obj.$attrs.borderColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.borderRadius).assertEqual('5.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_1100] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_1100] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_1100] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_1100] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_1100] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_1100] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_1100] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_1100] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1100] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1100] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1100] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_1200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_1200
     * @tc.desc   Test SecurityComponent BorderStyle attribute is Dashed and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_1200] START====');
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
            "borderWid": 5,
            "borderCol": 0xffffffff,
            "borderRad": 5,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1200] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.borderStyle).assertEqual(1);
      expect(obj.$attrs.borderWidth).assertEqual('5.00vp');
      expect(obj.$attrs.borderColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.borderRadius).assertEqual('5.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_1200] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_1200] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_1200] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_1200] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_1200] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_1200] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_1200] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_1200] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1200] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1200] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1200] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_1300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_1300
     * @tc.desc   Test SecurityComponent BorderStyle attribute is Solid and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_1300] START====');
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
            "borderSty": BorderStyle.Solid,
            "borderWid": 5,
            "borderCol": 0xffffffff,
            "borderRad": 5,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1300] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.borderStyle).assertEqual(0);
      expect(obj.$attrs.borderWidth).assertEqual('5.00vp');
      expect(obj.$attrs.borderColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.borderRadius).assertEqual('5.00vp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_1300] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_1300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_1300] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_1300] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_1300] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_1300] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_1300] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_1300] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1300] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1300] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1300] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_1400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_1400
     * @tc.desc   Test SecurityComponent offset.x attribute is 200.00vp result in Authorization is failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_1400] START====');
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
            "middle": 4
          }
        }
        try{
          window.getLastWindow(globalThis.abilityContext, (err, data) => {
            const errCode = err.code;
            if(errCode){
              console.error('Failed to obtain the top window Cause:' + JSON.stringify(err));
              return;
            }
            let properties = data.getWindowProperties();
            console.info('Succeeded in obtaining the window properties.width: ' + properties.windowRect.width);
            let window_width = properties.windowRect.width;
            console.info('====>[Test_Security_Button_Paste_1400] properties.windowRect.width is: ' + properties.windowRect.width);
            let offsetObj:ESObject = {"positionX": `${window_width / 2}px`};
            ObjectUtils.assign(eventData.data,offsetObj);
          });
        } catch (error){
          console.error('Failed to obtain the window properties.error.code: ' + error.code)
        }
        await Utils.sleep(1000);
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1400] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_1400] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_1400] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info("====>[Test_Security_Button_Paste_1400] ERR CASE 成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info("====>[Test_Security_Button_Paste_1400] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_1400] ERR CASE 失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_1400] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_1400] ERR CASE 失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_1400] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1400] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1400] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1400] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_1500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_1500
     * @tc.desc   Test SecurityComponent offset.x attribute is -200.00vp result in Authorization is failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_1500] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": 0,
            "positionX": `${-100}px`,
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
            "middle": 4
          }
        }
        try{
          window.getLastWindow(globalThis.abilityContext, (err, data) => {
            const errCode = err.code;
            if(errCode){
              console.error('Failed to obtain the top window Cause:' + JSON.stringify(err));
              return;
            }
            let properties = data.getWindowProperties();
            console.info('Succeeded in obtaining the window properties.width: ' + properties.windowRect.width);
            let window_width = properties.windowRect.width;
            console.info('====>[Test_Security_Button_Paste_1500] properties.windowRect.width is: ' + properties.windowRect.width);
            let offsetObj:ESObject = {"positionX": `${-window_width / 2}px`};
            ObjectUtils.assign(eventData.data,offsetObj);
          });
        } catch (error){
          console.error('Failed to obtain the window properties.error.code: ' + error.code)
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1500] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_1500] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_1500] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info("====>[Test_Security_Button_Paste_1500] ERR CASE 成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info("====>[Test_Security_Button_Paste_1500] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_1500] ERR CASE 失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_1500] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_1500] ERR CASE 失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_1500] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1500] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponents(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1500] button is:" + JSON.stringify(button));
        await button[0].click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1500] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_1600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_1600
     * @tc.desc   Test SecurityComponent Size excood displaysSize 10% result in Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_1600] START====');
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
            "buWidth": undefined,
            "buHeight": undefined,
            "rowWidth": undefined,
            "rowHeight": undefined
          }
        }
        let displayClass = [];
        display.getAllDisplays((err, data) => {
          console.info('====>[Test_Security_Button_Paste_1600] the window data[0].width: ' + data[0].width);
          console.info('====>[Test_Security_Button_Paste_1600] the window data[0].height: ' + data[0].height);
          let button_width = data[0].width * (1/3);
          let button_height = data[0].height * (1/3);
          console.info('====>[Test_Security_Button_Paste_1600] button_width is: ' + button_width);
          console.info('====>[Test_Security_Button_Paste_1600] button_height is: ' + button_height);
          let offsetObj:ESObject = {
            "buWidth": `${button_width}px`,
            "buHeight": `${button_height}px`,
            "rowWidth": `${button_width}px`,
            "rowHeight": `${button_height}px`
          };
          ObjectUtils.assign(eventData.data,offsetObj);
        });
        await Utils.sleep(1000);
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1600] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_1600] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_1600] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_1600] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_1600] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_1600] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_1600] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_1600] ERR CASE 失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_1600] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1600] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1600] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1600] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_1700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_1700
     * @tc.desc   Test SecurityComponent iconColor attribute is too light result in Authorization is failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_1700] START====');
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
            "iconColor": 0x10ff0000,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1700] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.iconColor).assertEqual('#10FF0000');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_1700] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_1700] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info("====>[Test_Security_Button_Paste_1700] ERR CASE 成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info("====>[Test_Security_Button_Paste_1700] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_1700] ERR CASE 失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_1700] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_1700] ERR CASE 失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_1700] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1700] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1700] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1700] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_1800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_1800
     * @tc.desc   Test SecurityComponent buttonType is 0 , iconSize is 20.00vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_1800] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 20,
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
            "iconColor": 0xfffa0050,
            "bgColor": 0xffff0000,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1800] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.buttonType).assertEqual(0);
      expect(obj.$attrs.iconSize).assertEqual('20.00vp');
      expect(obj.$attrs.iconColor).assertEqual('#FFFA0050');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFF0000');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_1800] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_1800] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_1800] ERR CASE 成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_1800] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_1800] ERR CASE 失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_1800] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_1800] ERR CASE 失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_1800] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1800] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1800] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1800] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_1900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_1900
     * @tc.desc   Test SecurityComponent iconSize attribute is too small result in Authorization is failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_1900] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 1,
            "direct": 0,
            "positionX": 0,
            "positionY": 0,
            "anchorX": 0,
            "anchorY": 0,
            "offsetX": 0,
            "offsetY": 0,
            "fontSize": 20,
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
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1900] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.iconSize).assertEqual('1.00vp');
      expect(obj.$attrs.fontSize).assertEqual('20.00fp');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_1900] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_1900] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info("====>[Test_Security_Button_Paste_1900] ERR CASE 成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info("====>[Test_Security_Button_Paste_1900] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_1900] ERR CASE 失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_1900] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_1900] ERR CASE 失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_1900] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1900] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_1900] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_1900] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_2000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_2000
     * @tc.desc   Test SecurityComponent iconColor attribute is transparent result in Authorization is failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_2000] START====');
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
            "iconColor":Color.Transparent,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2000] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.iconColor).assertEqual('#00000000');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_2000] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_2000] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info("====>[Test_Security_Button_Paste_2000] ERR CASE 成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info("====>[Test_Security_Button_Paste_2000] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_2000] ERR CASE 失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_2000] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_2000] ERR CASE 失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_2000] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2000] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_2000] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2000] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_2100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_2100
     * @tc.desc   Test SecurityComponent fontColor attribute is transparent result in Authorization is failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_2100] START====');
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
            "fontColor": Color.Transparent,
            "iconColor":0xffffffff,
            "bgColor": 0xff007dff,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2100] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontColor).assertEqual('#00000000');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_2100] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_2100] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED) {
              console.info("====>[Test_Security_Button_Paste_2100] ERR CASE 成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.TEMPORARY_AUTHORIZATION_FAILED).assertTrue();
              console.info("====>[Test_Security_Button_Paste_2100] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_2100] ERR CASE 失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_2100] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_2100] ERR CASE 失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_2100] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2100] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_2100] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2100] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_2200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_2200
     * @tc.desc   Test SecurityComponent backgroundColor attribute is transparent result in Authorization is failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_2200] START====');
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
            "bgColor": Color.Transparent,
            "borderSty": BorderStyle.Dashed,
            "borderWid": 0,
            "borderCol": 0xffffffff,
            "borderRad": 0,
            "left": 12,
            "right": 12,
            "top": 4,
            "bottom": 4,
            "middle": 4
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2200] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.backgroundColor).assertEqual('#FF000000');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_2200] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_2200] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_2200] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_2200] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_2200] 设置权限失败");
              expect().assertFail()
              console.info("====>[Test_Security_Button_Paste_2200] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_2200] 设置权限失败");
            expect().assertFail()
            console.info("====>[Test_Security_Button_Paste_2200] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2200] once clickEvent err : " + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_2200] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2200] clickSecComponent err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   Test_Security_Button_Paste_2300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Paste_2300
     * @tc.desc   Test SecurityComponent attr focusBox and result in PasteButton Authorization is passed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Button_Paste_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Paste_2300] START====');
      await Utils.sleep(1000);
      try {
        let eventData:events_emitter.EventData = {
          data: {
            "icon": 0,
            "textType": 0,
            "bgType": ButtonType.Normal,
            "iconSize": 16,
            "direct": SecurityComponentLayoutDirection.VERTICAL,
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
            "strokeMag": 10,
            "strokeColR": 255,
            "strokeColG": 0,
            "strokeColB": 0,
            "strokeWth": 10
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("====>[Test_Security_Button_Paste_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2300] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('keyPaste');
      let obj : ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.focusBox.margin).assertEqual("10.00vp");
      expect(obj.$attrs.focusBox.strokeColor).assertEqual("#FFFF0000");
      expect(obj.$attrs.focusBox.strokeWidth).assertEqual("10.00px");
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info("====>[Test_Security_Button_Paste_2300] get clickEvent result is: " + JSON.stringify(clickEvent));
            console.info("====>[Test_Security_Button_Paste_2300] get clickData.data.clickResult is: " + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info("====>[Test_Security_Button_Paste_2300] 设置权限成功");
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
              console.info("====>[Test_Security_Button_Paste_2300] END====");
              done();
            } else {
              console.info("====>[Test_Security_Button_Paste_2300] 设置权限失败");
              expect(false).assertTrue();
              console.info("====>[Test_Security_Button_Paste_2300] END====");
              done();
            }
          } else {
            console.info("====>[Test_Security_Button_Paste_2300] ERR CASE 失败");
            expect(false).assertTrue();
            console.info("====>[Test_Security_Button_Paste_2300] END====");
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2300] once clickEvent err : " + JSON.stringify(err));
        expect(false).assertTrue();
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info("====>[Test_Security_Button_Paste_2300] button is:" + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.info("====>[Test_Security_Button_Paste_2300] clickSecComponent err : " + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });
  })
}
