/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
import { BusinessError } from '@ohos.base';
import CommonFunc from '../../MainAbility/common/Common';


export default function TextAreaSelectTest() {

  const SUITE: string = 'TextAreaSelect'
  const waitUiReadyMs: number = 500;


  describe('TextAreaSelectTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaSelect",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("TextAreaSelect" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((err: BusinessError) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
          await CommonFunc.sleep(2000)
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0100
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0100', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_0100'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_1', 10, "")
      await CommonFunc.sleep(5000)
      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');
      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("0");

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0200
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0200', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_0200'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      globalThis.value.message.notify({
        name: 'requestFocus', value: ''
      });
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'Show selected (-1,0)', value: ''
      });
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'Show selected (-1,0)', value: ''
      });
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');
      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });


    /*
     *tc.number ArkUI_TextArea_Select_0300
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0300', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_0300'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      globalThis.value.message.notify({
        name: 'Show selected (0,3)', value: ''
      });
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');
      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("3");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0400
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0400', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_0400'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)


      globalThis.value.message.notify({
        name: 'Show selected (1,3)', value: ''
      });
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');
      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("3");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0500
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0500', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_0500'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      globalThis.value.message.notify({
        name: 'Show selected (-1,6)', value: ''
      });
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');
      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0600
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0600', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_0600'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      globalThis.value.message.notify({
        name: 'Show selected (0,6)', value: ''
      });
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');

      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0700
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0700', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_0700'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      globalThis.value.message.notify({
        name: 'Show selected (-1,8)', value: ''
      });
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');

      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0800
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0800', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_0800'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      globalThis.value.message.notify({
        name: 'Show selected (0,8)', value: ''
      });
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');

      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0900
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0900', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_0900'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      globalThis.value.message.notify({
        name: 'Show selected (null,null)', value: ''
      });
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');

      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_1000
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_1000', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_1000'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      globalThis.value.message.notify({
        name: 'Show selected (null,undefined)', value: ''
      });
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');

      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_1100
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_1100', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_1100'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      globalThis.value.message.notify({
        name: 'Show selected (undefined,null)', value: ''
      });
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');

      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_1200
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_1200', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_1200'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      globalThis.value.message.notify({
        name: 'Show selected (undefined,undefined)', value: ''
      });
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_1');

      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_1300
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_1300', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_1300'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_13', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_2');

      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_1400
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_1400', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_TextArea_Select_1400'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_TextArea_3', 10, "")
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_14', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson: string = getInspectorByKey('TextAreaSelect_TextArea_3');

      expect(JSON.parse(strJson).$attrs.caretPosition).assertEqual("10");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

  })
}
