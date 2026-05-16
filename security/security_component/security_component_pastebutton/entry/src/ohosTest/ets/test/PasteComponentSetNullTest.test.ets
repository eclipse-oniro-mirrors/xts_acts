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
import Utils from './Utils';
import window from '@ohos.window';
import { ObjectUtils } from './ObjectUtils'

export default function pasteComponentSetNullTest() {
  describe('pasteComponentSetNullTest', ( ) => {
    beforeAll(async (done:Function) => {
      try {
        let driver = Driver.create();
        await Utils.sleep(500);
        let dialog_usb = await driver.findComponent(ON.type('Dialog'));
        if (dialog_usb !== null) {
          let button = await driver.findComponent(ON.id('advanced_dialog_button_0'));
          console.info('====>beforeAll USB_Dialog button is : ' + JSON.stringify(button));
          await button.click();
          await Utils.sleep(500);
        } else {
          console.info('====>beforeAll USB_Dialog not exist.');
        }
      } catch (err) {
        console.info('====>beforeAll USB_Dialog err : ' + JSON.stringify(err));
      }
      let options:router.RouterOptions = {
        url: 'testability/pages/pasteButtonSetNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('====>pasteComponentSetNullTest get state success ' + JSON.stringify(pages));
        if (!('pasteButtonSetNull' == pages.name)) {
          console.info('====>pasteComponentSetNullTest get state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('====>pasteComponentSetNullTest push page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('====>pasteComponentSetNullTest push page error: ' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('====>pasteComponentSetNullTest after each called');
    });

    let clickSecComponent = async (testname: string, driver: Driver, index: number) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      try {
        let button = await driver.findComponents(ON.type('PasteButton'));
        await Utils.sleep(500);
        console.info(`====>${testname} button is:` + JSON.stringify(button[index]));
        await button[index].click();
      } catch (err) {
        console.error(`====>${testname} clickSecComponent err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickSecComponent function End====`);
    }

    let clickSwitchButton = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickSwitchButton function Start====`);
      try {
        let switchButton = await driver.findComponent(ON.id('switchButton'));
        await Utils.sleep(500);
        console.info(`====>${testname} switchButton is:` + JSON.stringify(switchButton));
        await switchButton.click();
        await Utils.sleep(1000);
      } catch (err) {
        console.error(`====>${testname} clickSwitchButton err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickSwitchButton function End====`);
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
            if (clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS) {
              console.info(`====>${testname} 设置权限成功`);
              expect(clickData.data.clickResult == PasteButtonOnClickResult.SUCCESS).assertTrue();
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
     * @tc.name   Test_Security_PasteButton_SetNull_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_0100
     * @tc.desc   Test SecurityComponent iconSize set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_0100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      let strJson: string = getInspectorByKey('setNull0');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.iconSize).assertEqual('16.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_0200
     * @tc.desc   Test SecurityComponent position set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_0200';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull1');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.position.x).assertEqual('');
      expect(obj.$attrs.position.y).assertEqual('');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_0300
     * @tc.desc   Test SecurityComponent markAnchor set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_0300';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull2');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.markAnchor.x).assertEqual('0.00vp');
      expect(obj.$attrs.markAnchor.y).assertEqual('0.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_0400
     * @tc.desc   Test SecurityComponent offset set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_0400';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull3');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.offset.x).assertEqual('0.00vp');
      expect(obj.$attrs.offset.y).assertEqual('0.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_0500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_0500
     * @tc.desc   Test SecurityComponent fontSize set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_0500';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull4');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_0600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_0600
     * @tc.desc   Test SecurityComponent fontStyle set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_0600';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull5');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.fontStyle).assertEqual(0);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_0700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_0700
     * @tc.desc   Test SecurityComponent fontWeight set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_0700';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull6');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Medium');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_0800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_0800
     * @tc.desc   Test SecurityComponent fontFamily set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_0800';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull7');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.fontFamily).assertEqual('HarmonyOS Sans');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_0900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_0900
     * @tc.desc   Test SecurityComponent fontColor set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_0900';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull8-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let except_fontColor: string = obj1.$attrs.fontColor;
      let strJson2: string = getInspectorByKey('setNull8-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.fontColor).assertEqual(except_fontColor);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_1000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_1000
     * @tc.desc   Test SecurityComponent iconColor set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_1000';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull9-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let except_iconColor: string = obj1.$attrs.iconColor;
      let strJson2: string = getInspectorByKey('setNull9-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.iconColor).assertEqual(except_iconColor);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_1100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_1100
     * @tc.desc   Test SecurityComponent backgroundColor set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_1100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull10-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let except_backgroundColor: string = obj1.$attrs.backgroundColor;
      let strJson2: string = getInspectorByKey('setNull10-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.backgroundColor).assertEqual(except_backgroundColor);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_1200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_1200
     * @tc.desc   Test SecurityComponent borderStyle set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_1200';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull11');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.borderStyle).assertEqual(3);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_1300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_1300
     * @tc.desc   Test SecurityComponent borderWidth set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_1300';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull12');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.borderWidth).assertEqual('0.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_1400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_1400
     * @tc.desc   Test SecurityComponent borderColor set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_1400';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull13');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.borderColor).assertEqual('#FFFFFFFF');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_1500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_1500
     * @tc.desc   Test SecurityComponent borderRadius set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_1500';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull14');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.borderRadius).assertEqual('0.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_1600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_1600
     * @tc.desc   Test SecurityComponent borderRadius(BorderRadiuses) set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_1600';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull15');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.borderRadius).assertEqual('0.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_1700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_1700
     * @tc.desc   Test SecurityComponent padding set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_1700';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull16');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.padding.left).assertEqual('16.00vp');
      expect(obj.$attrs.padding.right).assertEqual('16.00vp');
      expect(obj.$attrs.padding.top).assertEqual('8.00vp');
      expect(obj.$attrs.padding.bottom).assertEqual('8.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_1800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_1800
     * @tc.desc   Test SecurityComponent textIconSpace set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_1800';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull17');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.textIconSpace).assertEqual('4.00vp');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

  /**
     * @tc.name   Test_Security_PasteButton_SetNull_1900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_1900
     * @tc.desc   Test SecurityComponent width set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_1900';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull18-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_width: string = obj1.$attrs.width;
      let strJson2: string = getInspectorByKey('setNull18-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.width).assertEqual(expect_width);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_2000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_2000
     * @tc.desc   Test SecurityComponent height set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_2000';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull19-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_height: string = obj1.$attrs.height;
      let strJson2: string = getInspectorByKey('setNull19-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.height).assertEqual(expect_height);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_2100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_2100
     * @tc.desc   Test SecurityComponent size set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_2100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull20-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_size_width: string = obj1.$attrs.size.width;
      let expect_size_height: string = obj1.$attrs.size.height;
      let strJson2: string = getInspectorByKey('setNull20-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.size.width).assertEqual(expect_size_width);
      expect(obj2.$attrs.size.height).assertEqual(expect_size_height);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_2200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_2200
     * @tc.desc   Test SecurityComponent constraintSize set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_2200';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull21-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_constraintSize: string = obj1.$attrs.constraintSize;
      let strJson2: string = getInspectorByKey('setNull21-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.constraintSize).assertEqual(expect_constraintSize);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_2300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_2300
     * @tc.desc   Test SecurityComponent align set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_2300';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull22');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.align).assertEqual('Alignment.Center');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_2400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_2400
     * @tc.desc   Test SecurityComponent alignRules set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_2400';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull23-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_alignRules: string = obj1.$attrs.alignRules;
      let strJson2: string = getInspectorByKey('setNull23-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.alignRules).assertEqual(expect_alignRules);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_2500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_2500
     * @tc.desc   Test SecurityComponent id set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_2500';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull24');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.id).assertEqual('setNull24');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_2600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_2600
     * @tc.desc   Test SecurityComponent chainMode set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_2600';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull25-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_chainMode: string | undefined = obj1.$attrs.chainMode;
      let strJson2: string = getInspectorByKey('setNull25-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.chainMode).assertEqual(expect_chainMode);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_2700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_2700
     * @tc.desc   Test SecurityComponent minFontScale set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_2700';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull26-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_minFontScale: string = obj1.$attrs.minFontScale;
      let strJson2: string = getInspectorByKey('setNull26-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.minFontScale).assertEqual(expect_minFontScale);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_2800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_2800
     * @tc.desc   Test SecurityComponent maxFontScale set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_2800';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull27-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_maxFontScale: string = obj1.$attrs.maxFontScale;
      let strJson2: string = getInspectorByKey('setNull27-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.maxFontScale).assertEqual(expect_maxFontScale);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_2900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_2900
     * @tc.desc   Test SecurityComponent minFontSize set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_2900';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull28-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_minFontSize: string = obj1.$attrs.minFontSize;
      let strJson2: string = getInspectorByKey('setNull28-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.minFontSize).assertEqual(expect_minFontSize);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_3000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_3000
     * @tc.desc   Test SecurityComponent maxFontSize set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_3000';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull29-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_maxFontSize: string = obj1.$attrs.maxFontSize;
      let strJson2: string = getInspectorByKey('setNull29-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.maxFontSize).assertEqual(expect_maxFontSize);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_3100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_3100
     * @tc.desc   Test SecurityComponent maxLines set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_3100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull30');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.maxLines).assertEqual('1000000');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_3200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_3200
     * @tc.desc   Test SecurityComponent heightAdaptivePolicy set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_3200';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = getInspectorByKey('setNull31');
      let obj : ESObject = JSON.parse(strJson);
      expect(obj.$attrs.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNull_3300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNull_3300
     * @tc.desc   Test SecurityComponent focusBox set null is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNull_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNull_3300';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNull32-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_focusBox: string | undefined = obj1.$attrs.focusBox;
      let strJson2: string = getInspectorByKey('setNull32-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.focusBox).assertEqual(expect_focusBox);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNullStr_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNullStr_0100
     * @tc.desc   Test SecurityComponent maxFontSize&minFontSize set '' is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNullStr_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const TCNAME = 'Test_Security_PasteButton_SetNullStr_0100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = getInspectorByKey('setNullStr01-1');
      let obj1 : ESObject = JSON.parse(strJson1);
      let expect_maxFontSize: string | undefined = obj1.$attrs.maxFontSize;
      let expect_minFontSize: string | undefined = obj1.$attrs.minFontSize;
      let strJson2: string = getInspectorByKey('setNullStr01-2');
      let obj2 : ESObject = JSON.parse(strJson2);
      expect(obj2.$attrs.maxFontSize).assertEqual(expect_maxFontSize);
      expect(obj2.$attrs.minFontSize).assertEqual(expect_minFontSize);
      await Utils.sleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });
  })
}
