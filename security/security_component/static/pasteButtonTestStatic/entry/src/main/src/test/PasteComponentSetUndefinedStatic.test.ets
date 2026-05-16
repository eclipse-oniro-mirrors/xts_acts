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
import common from '@ohos.app.ability.common';
import {
  PasteButtonOnClickResult,
  ButtonType,
  SecurityComponentLayoutDirection,
  FontStyle,
  FontWeight,
  BorderStyle,
  Alignment,
  Color
} from '@ohos.arkui.component';

export default function pasteComponentSetUndefinedStaticTest() {
  describe('pasteComponentSetUndefinedStaticTest', ( ) => {
    console.info('====>pasteComponentSetUndefinedStaticTest start');
    beforeAll(async (): Promise<void> => {
      let options:router.RouterOptions = {
        url: 'pages/pasteButtonSetUndefined',
      }
      try {
        let gUiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;
        let uiRouter: Router = gUiContext.getRouter();
        let pages = uiRouter.getState();
        console.info('====>pasteComponentStaticTest get state success 1 ' + JSON.stringify(pages));
        if (!('pasteButton' == pages.name)) {
          console.info('====>pasteComponentStaticTest get state success 2 ' + JSON.stringify(pages.name));
          uiRouter.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error('====>pasteComponentStaticTest push page error: ' + err?.code + err?.message);
        expect(false).assertTrue();
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info('====>pasteComponentSetUndefinedStaticTest after each called');
    });

    let clickSecComponent = async (testname: string, driver: Driver, index: int) => {
      console.info(`====>${testname} clickSecComponent function Start====`);
      try {
        let buttons = await driver.findComponents(ON.type('PasteButton'));
        await UtilsTest.msSleep(500);
        if (buttons && buttons.length > 0) {
          let button = buttons.at(index);
          console.info(`====>${testname} button is:` + JSON.stringify(button));
          await (button?.click() as Promise<void>);
        } else {
          console.error(`====>${testname} button is None`);
          expect(false).assertTrue();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`====>${testname} clickSecComponent err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickSecComponent function End====`);
    }

    let clickSwitchButton = async (testname: string, driver: Driver) => {
      console.info(`====>${testname} clickSwitchButton function Start====`);
      try {
        let switchButton = await driver.findComponent(ON.id('switchButton'));
        await UtilsTest.msSleep(500);
        console.info(`====>${testname} switchButton is:` + JSON.stringify(switchButton));
        await (switchButton?.click() as Promise<void>);
        await UtilsTest.msSleep(1000);
      } catch (err) {
        err = err as BusinessError;
        console.error(`====>${testname} clickSwitchButton err : ` + JSON.stringify(err));
        expect(false).assertTrue();
      }
      console.info(`====>${testname} clickSwitchButton function End====`);
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
            if (data['clickResult'] == PasteButtonOnClickResult.SUCCESS) {
              console.info(`====>${testname} 设置权限成功`);
              expect(data['clickResult'] == PasteButtonOnClickResult.SUCCESS).assertTrue();
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

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0100
     * @tc.desc   Test SecurityComponent iconSize set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      let strJson: string = inspector.getInspectorByKey('setUndefined0');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('iconSize')).assertEqual('16.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0200
     * @tc.desc   Test SecurityComponent position set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0200';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('');
      expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0300
     * @tc.desc   Test SecurityComponent markAnchor set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0300';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0400
     * @tc.desc   Test SecurityComponent offset set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0400';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined3');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('0.00px');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0500
     * @tc.desc   Test SecurityComponent fontSize set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0500';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined4');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0600
     * @tc.desc   Test SecurityComponent fontStyle set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0600';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined5');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('fontStyle')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0700
     * @tc.desc   Test SecurityComponent fontWeight set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0700';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined6');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0800
     * @tc.desc   Test SecurityComponent fontFamily set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0800';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined7');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('HarmonyOS Sans');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_0900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_0900
     * @tc.desc   Test SecurityComponent fontColor set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_0900';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = inspector.getInspectorByKey('setUndefined8-1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let except_fontColor: string = obj1.getElement('$attrs').getString('fontColor');
      let strJson2: string = inspector.getInspectorByKey('setUndefined8-2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson2));
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('fontColor')).assertEqual(except_fontColor);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1000
     * @tc.desc   Test SecurityComponent iconColor set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1000';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = inspector.getInspectorByKey('setUndefined9-1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let except_iconColor: string = obj1.getElement('$attrs').getString('iconColor');
      let strJson2: string = inspector.getInspectorByKey('setUndefined9-2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson2));
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('iconColor')).assertEqual(except_iconColor);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1100
     * @tc.desc   Test SecurityComponent backgroundColor set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = inspector.getInspectorByKey('setUndefined10-1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let except_backgroundColor: string = obj1.getElement('$attrs').getString('backgroundColor');
      let strJson2: string = inspector.getInspectorByKey('setUndefined10-2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson2));
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual(except_backgroundColor);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1200
     * @tc.desc   Test SecurityComponent borderStyle set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1200';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined11');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('borderStyle')).assertEqual(3);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1300
     * @tc.desc   Test SecurityComponent borderWidth set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1300';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined12');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1400
     * @tc.desc   Test SecurityComponent borderColor set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1400';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined13');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('borderColor')).assertEqual('#FFFFFFFF');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1500
     * @tc.desc   Test SecurityComponent borderRadius set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1500';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined14');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1600
     * @tc.desc   Test SecurityComponent borderRadius(BorderRadiuses) set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1600';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined15');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1700
     * @tc.desc   Test SecurityComponent padding set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1700';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined16');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('padding').getString('left')).assertEqual('16.00vp');
      expect(obj.getElement('$attrs').getElement('padding').getString('right')).assertEqual('16.00vp');
      expect(obj.getElement('$attrs').getElement('padding').getString('top')).assertEqual('8.00vp');
      expect(obj.getElement('$attrs').getElement('padding').getString('bottom')).assertEqual('8.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1800
     * @tc.desc   Test SecurityComponent textIconSpace set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1800';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined17');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('textIconSpace')).assertEqual('4.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_1900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_1900
     * @tc.desc   Test SecurityComponent width set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_1900';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = inspector.getInspectorByKey('setUndefined18-1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let expect_width: string = obj1.getElement('$attrs').getString('width');
      let strJson2: string = inspector.getInspectorByKey('setUndefined18-2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson2));
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('width')).assertEqual(expect_width);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_2000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_2000
     * @tc.desc   Test SecurityComponent height set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_2000';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = inspector.getInspectorByKey('setUndefined19-1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let expect_height: string = obj1.getElement('$attrs').getString('height');
      let strJson2: string = inspector.getInspectorByKey('setUndefined19-2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson2));
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('height')).assertEqual(expect_height);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_2100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_2100
     * @tc.desc   Test SecurityComponent size set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_2100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = inspector.getInspectorByKey('setUndefined20-1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let expect_size_width: string = obj1.getElement('$attrs').getElement('size').getString('width');
      let expect_size_height: string = obj1.getElement('$attrs').getElement('size').getString('height');
      let strJson2: string = inspector.getInspectorByKey('setUndefined20-2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson2));
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getElement('size').getString('width')).assertEqual(expect_size_width);
      expect(obj2.getElement('$attrs').getElement('size').getString('height')).assertEqual(expect_size_height);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_2200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_2200
     * @tc.desc   Test SecurityComponent constraintSize set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_2200';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = inspector.getInspectorByKey('setUndefined21-1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let expect_constraintSize: string = obj1.getElement('$attrs').getString('constraintSize');
      let strJson2: string = inspector.getInspectorByKey('setUndefined21-2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson2));
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('constraintSize')).assertEqual(expect_constraintSize);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_2300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_2300
     * @tc.desc   Test SecurityComponent align set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_2300';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined22');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('align')).assertEqual('Alignment.Center');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_2400
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_2400
     * @tc.desc   Test SecurityComponent alignRules set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_2400';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined23');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_2500
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_2500
     * @tc.desc   Test SecurityComponent id set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_2500';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined24');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('id')).assertEqual('setUndefined24');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_2600
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_2600
     * @tc.desc   Test SecurityComponent chainMode set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_2600';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined25');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_2700
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_2700
     * @tc.desc   Test SecurityComponent minFontScale set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_2700';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = inspector.getInspectorByKey('setUndefined26-1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let expect_minFontScale: string = obj1.getElement('$attrs').getString('minFontScale');
      let strJson2: string = inspector.getInspectorByKey('setUndefined26-2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('minFontScale')).assertEqual(expect_minFontScale);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_2800
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_2800
     * @tc.desc   Test SecurityComponent maxFontScale set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_2800';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = inspector.getInspectorByKey('setUndefined27-1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let expect_maxFontScale: string = obj1.getElement('$attrs').getString('maxFontScale');
      let strJson2: string = inspector.getInspectorByKey('setUndefined27-2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson2));
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('maxFontScale')).assertEqual(expect_maxFontScale);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_2900
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_2900
     * @tc.desc   Test SecurityComponent minFontSize set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_2900';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = inspector.getInspectorByKey('setUndefined28-1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let expect_minFontSize: string = obj1.getElement('$attrs').getString('minFontSize');
      let strJson2: string = inspector.getInspectorByKey('setUndefined28-2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson2));
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('minFontSize')).assertEqual(expect_minFontSize);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_3000
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_3000
     * @tc.desc   Test SecurityComponent maxFontSize set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_3000';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson1: string = inspector.getInspectorByKey('setUndefined29-1');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let expect_maxFontSize: string = obj1.getElement('$attrs').getString('maxFontSize');
      let strJson2: string = inspector.getInspectorByKey('setUndefined29-2');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson2));
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('maxFontSize')).assertEqual(expect_maxFontSize);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 1);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_3100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_3100
     * @tc.desc   Test SecurityComponent maxLines set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_3100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined30');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('1000000');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_3200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_3200
     * @tc.desc   Test SecurityComponent heightAdaptivePolicy set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_3200';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined31');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetUndefined_3300
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetUndefined_3300
     * @tc.desc   Test SecurityComponent focusBox set undefined is Default and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetUndefined_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetUndefined_3300';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setUndefined32');
      console.info(`====>${TCNAME} get strJson is: ` + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getInteger('icon')).assertEqual(0);
      expect(obj.getElement('$attrs').getInteger('text')).assertEqual(0);
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNullStr_0100
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNullStr_0100
     * @tc.desc   Test SecurityComponent maxFontSize set '' is ineffective and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNullStr_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetNullStr_0100';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setNullStr01');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('maxFontSize')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });

    /**
     * @tc.name   Test_Security_PasteButton_SetNullStr_0200
     * @tc.number SUB_SEC_AccCtl_Specialltem_XTS_PasteControls_SetNullStr_0200
     * @tc.desc   Test SecurityComponent minFontSize set '' is ineffective and Authorization is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_Security_PasteButton_SetNullStr_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TCNAME = 'Test_Security_PasteButton_SetNullStr_0200';
      console.info(`====>${TCNAME} START`);
      let driver = Driver.create();
      await clickSwitchButton(TCNAME, driver);
      let strJson: string = inspector.getInspectorByKey('setNullStr02');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('minFontSize')).assertEqual('0.00vp');
      await UtilsTest.msSleep(1000);
      sucCallback(TCNAME, done);
      await clickSecComponent(TCNAME, driver, 0);
    });
  })
}
