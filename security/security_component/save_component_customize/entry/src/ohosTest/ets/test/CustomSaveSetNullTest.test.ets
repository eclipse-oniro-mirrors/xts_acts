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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import router from '@ohos.router';
import display from '@ohos.display';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest'
import Utils from './Utils.test';
import window from '@ohos.window';
import {ObjectUtils}  from './ObjectUtils';

export default function customSaveSetNullTest() {
  describe('customSaveSetNullTest', ( ) => {
    beforeAll(async (done:Function) => {
      let options:router.RouterOptions = {
        url: 'testability/pages/customSaveSetNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('====>customSaveSetNullTest get state success ' + JSON.stringify(pages));
        if (!('customSaveSetNull' == pages.name)) {
          console.info('====>customSaveSetNullTest get state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('====>customSaveSetNullTest push page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('====>customSaveSetNullTest push page error: ' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('====>saveCompCustomizeTest after each called');
    });

    let clickSecComponent = async (testname: string, expectText: string, driver: Driver) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      try {
        let button = await driver.findComponent(ON.type('SaveButton'));
        await Utils.sleep(500);
        console.info(`====>${testname} button is:` + JSON.stringify(button));
        let buttonText = await button.getText();
        console.info(`====>${testname} buttonText is:` + JSON.stringify(buttonText));
        expect(expectText == buttonText).assertTrue();
        await button.click();
        await Utils.sleep(1000);
        let titleTx = await driver.findComponent(ON.text('安全保存图片和视频'));
        console.info(`====>${testname} titleTx is:` + JSON.stringify(titleTx));
        if (titleTx !== null) {
          await clickAllowBtn(testname, driver);
        }
        let button2 = await driver.findComponent(ON.id('switchButton'))
        console.info(`====>${testname} switchButton is:` + JSON.stringify(button2));
        await button2.click();
        await Utils.sleep(1000);
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
          let startX = 0;
          let startY = 0;
          let endX = 0;
          let endY = 0;
          display.getAllDisplays((err, data) => {
            console.info(`====>${testname} the window data[0].width: ` + data[0].width);
            console.info(`====>${testname} the window data[0].height: ` + data[0].height);
            startX = endX = Math.floor(data[0].width * (1/2));
            startY = Math.floor(data[0].height * (4/5));
            endY = Math.floor(data[0].height * (1/5));
          });
          for(let i = 0; i < 5; i++){
            await driver.swipe(startX, startY, endX, endY);
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
     * @tc.name   Test_Security_Customize_SaveButton_SetNull_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Customize_SaveButton_SetNull_0100
     * @tc.desc   Test SaveComponent attr setIcon set null and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Customize_SaveButton_SetNull_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_Customize_SaveButton_SetNull_0100';
      console.info(`====>${TCNAME} START====`);
      let expectText: string = '自定义保存';
      let strJson = getInspectorByKey('customSave0');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.icon).assertEqual(0);
      expect(obj.$attrs.text).assertEqual(0);
      expect(obj.$attrs.buttonType).assertEqual(0);
      expect(obj.$attrs.iconSize).assertEqual('16.00vp');
      expect(obj.$attrs.iconBorderRadius.topLeft).assertEqual('2.00vp');
      expect(obj.$attrs.iconBorderRadius.topRight).assertEqual('2.00vp');
      expect(obj.$attrs.iconBorderRadius.bottomLeft).assertEqual('2.00vp');
      expect(obj.$attrs.iconBorderRadius.bottomRight).assertEqual('2.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, expectText, driver);
    });

    /**
     * @tc.name   Test_Security_Customize_SaveButton_SetNull_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Customize_SaveButton_SetNull_0200
     * @tc.desc   Test SaveComponent attr setText set null and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Customize_SaveButton_SetNull_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_Customize_SaveButton_SetNull_0200';
      console.info(`====>${TCNAME} START====`);
      let expectText: string = '下载';
      let strJson = getInspectorByKey('customSave1');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.icon).assertEqual(0);
      expect(obj.$attrs.text).assertEqual(0);
      expect(obj.$attrs.buttonType).assertEqual(0);
      expect(obj.$attrs.iconSize).assertEqual('16.00vp');
      expect(obj.$attrs.iconBorderRadius.topLeft).assertEqual('2.00vp');
      expect(obj.$attrs.iconBorderRadius.topRight).assertEqual('2.00vp');
      expect(obj.$attrs.iconBorderRadius.bottomLeft).assertEqual('2.00vp');
      expect(obj.$attrs.iconBorderRadius.bottomRight).assertEqual('2.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, expectText, driver);
    });

    /**
     * @tc.name   Test_Security_Customize_SaveButton_SetNull_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Customize_SaveButton_SetNull_0300
     * @tc.desc   Test SaveComponent attr iconSize set null validated and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Customize_SaveButton_SetNull_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_Customize_SaveButton_SetNull_0300';
      console.info(`====>${TCNAME} START====`);
      let expectText: string = '自定义保存';
      let strJson = getInspectorByKey('customSave2');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.icon).assertEqual(0);
      expect(obj.$attrs.text).assertEqual(0);
      expect(obj.$attrs.buttonType).assertEqual(0);
      expect(obj.$attrs.iconSize).assertEqual('16.00vp');
      expect(obj.$attrs.iconBorderRadius.topLeft).assertEqual('2.00vp');
      expect(obj.$attrs.iconBorderRadius.topRight).assertEqual('2.00vp');
      expect(obj.$attrs.iconBorderRadius.bottomLeft).assertEqual('2.00vp');
      expect(obj.$attrs.iconBorderRadius.bottomRight).assertEqual('2.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, expectText, driver);
    });

    /**
     * @tc.name   Test_Security_Customize_SaveButton_SetNull_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_Customize_SaveButton_SetNull_0400
     * @tc.desc   Test SaveComponent attr iconBorderRadius set null validated and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_Customize_SaveButton_SetNull_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_Customize_SaveButton_SetNull_0400';
      console.info(`====>${TCNAME} START====`);
      let expectText: string = '自定义保存';
      let strJson = getInspectorByKey('customSave3');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.icon).assertEqual(0);
      expect(obj.$attrs.text).assertEqual(0);
      expect(obj.$attrs.buttonType).assertEqual(0);
      expect(obj.$attrs.iconSize).assertEqual('16.00vp');
      expect(obj.$attrs.iconBorderRadius.topLeft).assertEqual('0.00vp');
      expect(obj.$attrs.iconBorderRadius.topRight).assertEqual('0.00vp');
      expect(obj.$attrs.iconBorderRadius.bottomLeft).assertEqual('0.00vp');
      expect(obj.$attrs.iconBorderRadius.bottomRight).assertEqual('0.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      let driver = Driver.create();
      await clickSecComponent(TCNAME, expectText, driver);
    });
  })
}
