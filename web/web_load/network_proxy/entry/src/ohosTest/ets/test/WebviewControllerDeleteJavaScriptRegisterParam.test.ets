/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterEach, beforeAll, beforeEach, expect, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPABILITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function webviewControllerDeleteJavaScriptRegisterParam() {

  describe('webviewControllerDeleteJavaScriptRegisterParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerDeleteJavaScriptRegisterParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerDeleteJavaScriptRegisterParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerDeleteJavaScriptRegisterParam' == pages.name)) {
          console.info('get webviewControllerDeleteJavaScriptRegisterParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerDeleteJavaScriptRegisterParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerDeleteJavaScriptRegisterParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerDeleteJavaScriptRegisterParamButton'), 10000);
      console.log('waitForComponent webviewControllerDeleteJavaScriptRegisterParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerDeleteJavaScriptRegisterParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerDeleteJavaScriptRegisterParam afterEach start');
      done();
    })

    /**
     * @tc.name   testDeleteJavaScriptRegisterEmpty001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_DELETEJAVASCRIPTREGISTER_EMPTY_0100
     * @tc.desc   test WebviewController.deleteJavaScriptRegister with empty string name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteJavaScriptRegisterEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitDeleteJavaScriptRegisterEmpty001', 172600);
      Utils.registerBaseEvent('testDeleteJavaScriptRegisterEmpty001', '17100008', 172610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerDeleteJavaScriptRegisterParamButton', 10, '');
    })

    /**
     * @tc.name   testDeleteJavaScriptRegisterNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_DELETEJAVASCRIPTREGISTER_NULL_0100
     * @tc.desc   test WebviewController.deleteJavaScriptRegister with null name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteJavaScriptRegisterNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitDeleteJavaScriptRegisterNull001', 172600);
      Utils.registerBaseEvent('testDeleteJavaScriptRegisterNull001', '401', 172620, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerDeleteJavaScriptRegisterParamButton', 10, '');
    })

    /**
     * @tc.name   testDeleteJavaScriptRegisterUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_DELETEJAVASCRIPTREGISTER_UNDEFINED_0100
     * @tc.desc   test WebviewController.deleteJavaScriptRegister with undefined name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteJavaScriptRegisterUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitDeleteJavaScriptRegisterUndefined001', 172600);
      Utils.registerBaseEvent('testDeleteJavaScriptRegisterUndefined001', '401', 172630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerDeleteJavaScriptRegisterParamButton', 10, '');
    })
  })
}
