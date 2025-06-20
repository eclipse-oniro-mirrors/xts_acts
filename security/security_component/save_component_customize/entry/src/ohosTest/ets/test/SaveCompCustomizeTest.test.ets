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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import router from '@ohos.router';
import display from '@ohos.display';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import Utils from './Utils.test';
import window from '@ohos.window';
import {ObjectUtils}  from './ObjectUtils';

export default function saveCompCustomizeTest() {
  describe('saveCompCustomizeTest', ( ) => {
    beforeAll(async (done:Function) => {
      let options:router.RouterOptions = {
        url: 'testability/pages/saveButton_customize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('====>saveCompCustomizeTest get state success ' + JSON.stringify(pages));
        if (!('saveButton_customize' == pages.name)) {
          console.info('====>saveCompCustomizeTest get state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('====>saveCompCustomizeTest push page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('====>saveCompCustomizeTest push page error: ' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('====>saveCompCustomizeTest after each called');
    });

    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_Customize_0100
     * @tc.name Test_Security_Button_Save_Customize_0100
     * @tc.desc Test SaveComponent attr "setIcon, setText, iconBorderRadius, stateEffect,
     * tipPosition(SaveButtonTipPosition.ABOVE_BOTTOM)" and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('Test_Security_Button_Save_Customize_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('====>[Test_Security_Button_Save_Customize_0100] START====');
      let strJson = getInspectorByKey('keySave');
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
      expect(obj.$attrs.id).assertEqual('keySave');
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info('====>[Test_Security_Button_Save_Customize_0100] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_Save_Customize_0100] get clickData.data.clickResult is: ' + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_Save_Customize_0100] 设置权限成功');
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_Save_Customize_0100] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_Save_Customize_0100] 设置权限失败');
              expect().assertFail()
              console.info('====>[Test_Security_Button_Save_Customize_0100] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_Save_Customize_0100] ERR CASE 失败');
            expect().assertFail()
            console.info('====>[Test_Security_Button_Save_Customize_0100] END====');
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info('====>[Test_Security_Button_Save_Customize_0100] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info('====>[Test_Security_Button_Save_Customize_0100] button is:' + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
        let allowBtn = await driver.findComponent(ON.text('允许'));
        console.info('====>[Test_Security_Button_Save_Customize_0100] allowBtn is:' + JSON.stringify(allowBtn));
        if(allowBtn !== null){
          console.info('====>[Test_Security_Button_Save_Customize_0100] allowBtnClick START====');
          await allowBtn.click();
          console.info('====>[Test_Security_Button_Save_Customize_0100] reClick====');
        }else{
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('====>[Test_Security_Button_Save_Customize_0100] clickSecComponent err : ' + JSON.stringify(err));
      }
    });


    /**
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Controls_Save_Customize_0200
     * @tc.name Test_Security_Button_Save_Customize_0200
     * @tc.desc Test SaveComponent attr "setIcon, setText, iconBorderRadius, stateEffect,
     * tipPosition(SaveButtonTipPosition.BELOW_TOP)" and Authorization is successful
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('Test_Security_Button_Save_Customize_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('====>[Test_Security_Button_Save_Customize_0200] START====');
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
            "cuPosition": SaveButtonTipPosition.BELOW_TOP
          }
        }
        let innerEvent:events_emitter.InnerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('====>[Test_Security_Button_Save_Customize_0200] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info('====>[Test_Security_Button_Save_Customize_0200] change component data error: ' + err.message);
      }
      await Utils.sleep(1000);
      try {
        let clickCallback = (clickData:events_emitter.EventData) => {
          if(clickData.data !=undefined){
            console.info('====>[Test_Security_Button_Save_Customize_0200] get clickEvent result is: ' + JSON.stringify(clickEvent));
            console.info('====>[Test_Security_Button_Save_Customize_0200] get clickData.data.clickResult is: ' + JSON.stringify(clickData.data.clickResult));
            if (clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS) {
              console.info('====>[Test_Security_Button_Save_Customize_0200] 设置权限成功');
              expect(clickData.data.clickResult == SaveButtonOnClickResult.SUCCESS).assertTrue();
              console.info('====>[Test_Security_Button_Save_Customize_0200] END====');
              done();
            } else {
              console.info('====>[Test_Security_Button_Save_Customize_0200] 设置权限失败');
              expect().assertFail()
              console.info('====>[Test_Security_Button_Save_Customize_0200] END====');
              done();
            }
          } else {
            console.info('====>[Test_Security_Button_Save_Customize_0200] ERR CASE 失败');
            expect().assertFail()
            console.info('====>[Test_Security_Button_Save_Customize_0200] END====');
            done();
          }
        }
        let clickEvent:events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.once(clickEvent, clickCallback);
      } catch (err) {
        console.info('====>[Test_Security_Button_Save_Customize_0200] once clickEvent err : ' + JSON.stringify(err));
      }
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info('====>[Test_Security_Button_Save_Customize_0200] button is:' + JSON.stringify(button));
        await button.click();
        await Utils.sleep(1000);
        let allowBtn = await driver.findComponent(ON.text('允许'));
        console.info('====>[Test_Security_Button_Save_Customize_0200] allowBtn is:' + JSON.stringify(allowBtn));
        if(allowBtn !== null){
          console.info('====>[Test_Security_Button_Save_Customize_0200] allowBtnClick START====');
          await allowBtn.click();
          console.info('====>[Test_Security_Button_Save_Customize_0200] reClick====');
        }
      } catch (err) {
        console.info('====>[Test_Security_Button_Save_Customize_0200] clickSecComponent err : ' + JSON.stringify(err));
      }
    });
  })
}
