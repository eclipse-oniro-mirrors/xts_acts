'use static';
/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router'
import {  Driver, Component, ON } from '@ohos.UiTest'
import emitter from '@ohos.events.emitter';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { BusinessError } from '@ohos.base';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextAreaSelectTest() {

  const SUITE: string = 'TextAreaSelect'
  const waitUiReadyMs: int = 500;


  describe('TextAreaSelectTest', () => {
    beforeAll(() => {
      console.info("TextAreaSelectTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaSelectTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaSelect",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get TextAreaSelectTest state pages:" + JSON.stringify(pages));
        if (!("TextAreaSelect" == pages.name)) {
          console.info("get TextAreaSelectTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaSelectTest page error:" + err);
      }
      console.info("TextAreaSelectTest beforeEach end");
    });

    /**
     * @tc.number   ArkUI_TextArea_Select_0100
     * @tc.name     ArkUI_TextArea_Select_0100
     * @tc.desc     ArkUI_TextArea_Select_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_TextArea_Select_0100', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_TextArea_Select_0100'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      inspector.sendEventByKey('TextAreaSelect_Button_1', 10, "")
      await CommonFunc.sleep(5000)
      let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("0");

      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    /**
     * @tc.number   ArkUI_TextArea_Select_0200
     * @tc.name     ArkUI_TextArea_Select_0200
     * @tc.desc     ArkUI_TextArea_Select_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_TextArea_Select_0200', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_TextArea_Select_0200'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
      messageManager.notify({
          name: 'requestFocus', value: ''
        })
      await CommonFunc.sleep(1000);
      messageManager.notify({
        name: 'Show selected (-1,0)', value: ''
      })
      await CommonFunc.sleep(1000);
      messageManager.notify({
        name: 'Show selected (-1,0)', value: ''
      })

      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });



    /**
     * @tc.number   ArkUI_TextArea_Select_0300
     * @tc.name     ArkUI_TextArea_Select_0300
     * @tc.desc     ArkUI_TextArea_Select_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_TextArea_Select_0300', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_TextArea_Select_0300'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
      messageManager.notify({
        name: 'Show selected (0,3)', value: ''
      })

      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("3");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    /**
     * @tc.number   ArkUI_TextArea_Select_0400
     * @tc.name     ArkUI_TextArea_Select_0400
     * @tc.desc     ArkUI_TextArea_Select_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_TextArea_Select_0400', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_TextArea_Select_0400'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
      messageManager.notify({
        name: 'Show selected (1,3)', value: ''
      })

      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("3");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    /**
     * @tc.number   ArkUI_TextArea_Select_0500
     * @tc.name     ArkUI_TextArea_Select_0500
     * @tc.desc     ArkUI_TextArea_Select_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_TextArea_Select_0500', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_TextArea_Select_0500'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
      messageManager.notify({
        name: 'Show selected (-1,6)', value: ''
      })

      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    /**
     * @tc.number   ArkUI_TextArea_Select_0600
     * @tc.name     ArkUI_TextArea_Select_0600
     * @tc.desc     ArkUI_TextArea_Select_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_TextArea_Select_0600', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_TextArea_Select_0600'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
      messageManager.notify({
        name: 'Show selected (0,6)', value: ''
      })

      await CommonFunc.sleep(1000);

      let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /**
     * @tc.number   ArkUI_TextArea_Select_0700
     * @tc.name     ArkUI_TextArea_Select_0700
     * @tc.desc     ArkUI_TextArea_Select_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_TextArea_Select_0700', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_TextArea_Select_0700'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
      messageManager.notify({
        name: 'Show selected (-1,8)', value: ''
      })

      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    /**
     * @tc.number   ArkUI_TextArea_Select_0800
     * @tc.name     ArkUI_TextArea_Select_0800
     * @tc.desc     ArkUI_TextArea_Select_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_TextArea_Select_0800', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_TextArea_Select_0800'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
      messageManager.notify({
        name: 'Show selected (0,8)', value: ''
      })

      await CommonFunc.sleep(1000);

      let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    // /*
    //  * @tc.number   ArkUI_TextArea_Select_0900
    //  * @tc.name     ArkUI_TextArea_Select_0900
    //  * @tc.desc     ArkUI_TextArea_Select_0900
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_TextArea_Select_0900', Level.LEVEL1, async (done: ()=>void) => {
    //   let CASE: string = 'ArkUI_TextArea_Select_0900'
    //   console.info(`${SUITE} ${CASE} START`);
    //
    //   let driver: Driver = Driver.create()
    //   await driver.delayMs(waitUiReadyMs)
    //
    //   const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
    //   messageManager.notify({
    //     name: 'Show selected (null,null)', value: ''
    //   })
    //   await CommonFunc.sleep(1000);
    //
    //   let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');
    //
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("0");
    //   await driver.delayMs(waitUiReadyMs)
    //
    //   console.info(`${SUITE} ${CASE} END`);
    //   done()
    // });
    //

    // /*
    //  * @tc.number   ArkUI_TextArea_Select_1000
    //  * @tc.name     ArkUI_TextArea_Select_1000
    //  * @tc.desc     ArkUI_TextArea_Select_1000
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_TextArea_Select_1000', Level.LEVEL1, async (done: ()=>void) => {
    //   let CASE: string = 'ArkUI_TextArea_Select_1000'
    //   console.info(`${SUITE} ${CASE} START`);
    //
    //   let driver: Driver = Driver.create()
    //   await driver.delayMs(waitUiReadyMs)
    //   const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
    //   messageManager.notify({
    //     name: 'Show selected (null,undefined)', value: ''
    //   })
    //
    //   await CommonFunc.sleep(1000);
    //
    //   let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');
    //
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("0");
    //   await driver.delayMs(waitUiReadyMs)
    //
    //   console.info(`${SUITE} ${CASE} END`);
    //   done()
    // });
    //

    // /*
    //  * @tc.number   ArkUI_TextArea_Select_1100
    //  * @tc.name     ArkUI_TextArea_Select_1100
    //  * @tc.desc     ArkUI_TextArea_Select_1100
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_TextArea_Select_1100', Level.LEVEL1, async (done: ()=>void) => {
    //   let CASE: string = 'ArkUI_TextArea_Select_1100'
    //   console.info(`${SUITE} ${CASE} START`);
    //
    //   let driver: Driver = Driver.create()
    //   await driver.delayMs(waitUiReadyMs)
    //
    //
    //   const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
    //   messageManager.notify({
    //     name: 'Show selected (undefined,null)', value: ''
    //   })
    //   await CommonFunc.sleep(1000);
    //
    //   let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');
    //
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("0");
    //   await driver.delayMs(waitUiReadyMs)
    //
    //   console.info(`${SUITE} ${CASE} END`);
    //   done()
    // });
    //

    // /*
    //  * @tc.number   ArkUI_TextArea_Select_1200
    //  * @tc.name     ArkUI_TextArea_Select_1200
    //  * @tc.desc     ArkUI_TextArea_Select_1200
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUI_TextArea_Select_1200', Level.LEVEL1, async (done: ()=>void) => {
    //   let CASE: string = 'ArkUI_TextArea_Select_1200'
    //   console.info(`${SUITE} ${CASE} START`);
    //
    //   let driver: Driver = Driver.create()
    //   await driver.delayMs(waitUiReadyMs)
    //
    //   const messageManager = AppStorage.get<MessageManager>('messageManager') as MessageManager
    //   messageManager.notify({
    //     name: 'Show selected (undefined,undefined)', value: ''
    //   })
    //
    //   await CommonFunc.sleep(1000);
    //
    //   let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_1');
    //
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("0");
    //   await driver.delayMs(waitUiReadyMs)
    //
    //   console.info(`${SUITE} ${CASE} END`);
    //   done()
    // });


    /**
     * @tc.number   ArkUI_TextArea_Select_1300
     * @tc.name     ArkUI_TextArea_Select_1300
     * @tc.desc     ArkUI_TextArea_Select_1300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_TextArea_Select_1300', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_TextArea_Select_1300'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      inspector.sendEventByKey('TextAreaSelect_Button_13', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_2');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    /**
     * @tc.number   ArkUI_TextArea_Select_1400
     * @tc.name     ArkUI_TextArea_Select_1400
     * @tc.desc     ArkUI_TextArea_Select_1400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_TextArea_Select_1400', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_TextArea_Select_1400'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      inspector.sendEventByKey('TextAreaSelect_TextArea_3', 10, "")
      await driver.delayMs(waitUiReadyMs)
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('TextAreaSelect_Button_14', 10, "")
      await driver.delayMs(waitUiReadyMs)
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('TextAreaSelect_TextArea_3');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual("10");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

  })
}
