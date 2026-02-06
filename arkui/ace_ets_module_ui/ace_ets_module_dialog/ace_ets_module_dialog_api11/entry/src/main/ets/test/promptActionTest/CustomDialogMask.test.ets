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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base'
import CommonFunc from '../../MainAbility/common/Common';

export default function CustomDialogMaskTest() {

  const SUITE: string = 'CustomDialogMask'
  const waitUiReadyMs: number = 500;

  describe('CustomDialogMaskTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/promptAction/CustomDialogMask",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("CustomDialogMask" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((err: BusinessError) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask_0100
     *tc.name   CustomDialogController#maskColor not set
     *tc.desc   CustomDialogController#maskColor not set
     */
    it('ArkUI_CustomDialog_Mask_0100', Level.LEVEL2, async (done: Function) => {
      let CASE: string = 'ArkUI_CustomDialog_Mask_0100'
      console.info(`${SUITE} ${CASE} START`);

      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('CustomDialogMask_Button_Open_1', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strObj: string = getInspectorByKey('CustomDialogMask_Button_Close_1');
      expect(JSON.parse(strObj).$attrs.visibility).assertEqual("Visibility.Visible");
      sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      await CommonFunc.sleep(1000);
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask0200
     *tc.name   CustomDialogController#maskColor set by Color
     *tc.desc   CustomDialogController#maskColor set by Color
     */
    it('ArkUI_CustomDialog_Mask0200', Level.LEVEL2, async (done: Function) => {
      let CASE: string = 'ArkUI_CustomDialog_Mask0200'
      console.info(`${SUITE} ${CASE} START`);
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('CustomDialogMask_Button_Open_2', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strObj: string = getInspectorByKey('CustomDialogMask_Button_Close_1');
      expect(JSON.parse(strObj).$attrs.visibility).assertEqual("Visibility.Visible");
      sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      await CommonFunc.sleep(1000);
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask0300
     *tc.name   CustomDialogController#maskColor set by string
     *tc.desc   CustomDialogController#maskColor set by string
     */
    it('ArkUI_CustomDialog_Mask0300', Level.LEVEL2, async (done: Function) => {
      let CASE: string = 'ArkUI_CustomDialog_Mask0300'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('CustomDialogMask_Button_Open_3', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strObj: string = getInspectorByKey('CustomDialogMask_Button_Close_1');
      expect(JSON.parse(strObj).$attrs.visibility).assertEqual("Visibility.Visible");
      sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      await CommonFunc.sleep(1000);
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask0400
     *tc.name   CustomDialogController#maskColor set by Resource
     *tc.desc   CustomDialogController#maskColor set by Resource
     */
    it('ArkUI_CustomDialog_Mask0400', Level.LEVEL2, async (done: Function) => {
      let CASE: string = 'ArkUI_CustomDialog_Mask0400'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('CustomDialogMask_Button_Open_4', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strObj: string = getInspectorByKey('CustomDialogMask_Button_Close_1');
      expect(JSON.parse(strObj).$attrs.visibility).assertEqual("Visibility.Visible");
      sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      await CommonFunc.sleep(1000);
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask0500
     *tc.name   CustomDialogController#maskColor set by number
     *tc.desc   CustomDialogController#maskColor set by number
     */
    it('ArkUI_CustomDialog_Mask0500', Level.LEVEL2, async (done: Function) => {
      let CASE: string = 'ArkUI_CustomDialog_Mask0500'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('CustomDialogMask_Button_Open_5', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strObj: string = getInspectorByKey('CustomDialogMask_Button_Close_1');
      expect(JSON.parse(strObj).$attrs.visibility).assertEqual("Visibility.Visible");
      sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      await CommonFunc.sleep(1000);
      done()
    });
  })
}
