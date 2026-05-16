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

export default function webviewControllerRegisterJavaScriptProxyParam() {

  describe('webviewControllerRegisterJavaScriptProxyParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerRegisterJavaScriptProxyParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerRegisterJavaScriptProxyParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerRegisterJavaScriptProxyParam' == pages.name)) {
          console.info('get webviewControllerRegisterJavaScriptProxyParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerRegisterJavaScriptProxyParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerRegisterJavaScriptProxyParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerRegisterJavaScriptProxyParamButton'), 10000);
      console.log('waitForComponent webviewControllerRegisterJavaScriptProxyParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerRegisterJavaScriptProxyParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerRegisterJavaScriptProxyParam afterEach start');
      done();
    })

    /**
     * @tc.name   testRegisterJavaScriptProxyJsObjectNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REGISTERJAVASCRIPTPROXY_JSOBJECT_NULL_0100
     * @tc.desc   test WebviewController.registerJavaScriptProxy with jsObject null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterJavaScriptProxyJsObjectNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRegisterJavaScriptProxyJsObjectNull001', 173800);
      Utils.registerBaseEvent('testRegisterJavaScriptProxyJsObjectNull001', '401', 173810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRegisterJavaScriptProxyParamButton', 10, '');
    })

    /**
     * @tc.name   testRegisterJavaScriptProxyJsObjectUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REGISTERJAVASCRIPTPROXY_JSOBJECT_UNDEFINED_0100
     * @tc.desc   test WebviewController.registerJavaScriptProxy with jsObject undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterJavaScriptProxyJsObjectUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRegisterJavaScriptProxyJsObjectUndefined001', 173800);
      Utils.registerBaseEvent('testRegisterJavaScriptProxyJsObjectUndefined001', '401', 173820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRegisterJavaScriptProxyParamButton', 10, '');
    })

    /**
     * @tc.name   testRegisterJavaScriptProxyNameEmpty001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REGISTERJAVASCRIPTPROXY_NAME_EMPTY_0100
     * @tc.desc   test WebviewController.registerJavaScriptProxy with name empty parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterJavaScriptProxyNameEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRegisterJavaScriptProxyNameEmpty001', 173800);
      Utils.registerBaseEvent('testRegisterJavaScriptProxyNameEmpty001', 'success', 173830, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRegisterJavaScriptProxyParamButton', 10, '');
    })

    /**
     * @tc.name   testRegisterJavaScriptProxyNameNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REGISTERJAVASCRIPTPROXY_NAME_NULL_0100
     * @tc.desc   test WebviewController.registerJavaScriptProxy with name null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterJavaScriptProxyNameNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRegisterJavaScriptProxyNameNull001', 173800);
      Utils.registerBaseEvent('testRegisterJavaScriptProxyNameNull001', '401', 173840, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRegisterJavaScriptProxyParamButton', 10, '');
    })

    /**
     * @tc.name   testRegisterJavaScriptProxyNameUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REGISTERJAVASCRIPTPROXY_NAME_UNDEFINED_0100
     * @tc.desc   test WebviewController.registerJavaScriptProxy with name undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterJavaScriptProxyNameUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRegisterJavaScriptProxyNameUndefined001', 173800);
      Utils.registerBaseEvent('testRegisterJavaScriptProxyNameUndefined001', '401', 173850, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRegisterJavaScriptProxyParamButton', 10, '');
    })

    /**
     * @tc.name   testRegisterJavaScriptProxyPermissionEmpty001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REGISTERJAVASCRIPTPROXY_PERMISSION_EMPTY_0100
     * @tc.desc   test WebviewController.registerJavaScriptProxy with permission empty parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterJavaScriptProxyPermissionEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRegisterJavaScriptProxyPermissionEmpty001', 173800);
      Utils.registerBaseEvent('testRegisterJavaScriptProxyPermissionEmpty001', 'success', 173860, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRegisterJavaScriptProxyParamButton', 10, '');
    })

    /**
     * @tc.name   testRegisterJavaScriptProxyPermissionNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REGISTERJAVASCRIPTPROXY_PERMISSION_NULL_0100
     * @tc.desc   test WebviewController.registerJavaScriptProxy with permission null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterJavaScriptProxyPermissionNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRegisterJavaScriptProxyPermissionNull001', 173800);
      Utils.registerBaseEvent('testRegisterJavaScriptProxyPermissionNull001', '401', 173870, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRegisterJavaScriptProxyParamButton', 10, '');
    })

    /**
     * @tc.name   testRegisterJavaScriptProxyPermissionUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REGISTERJAVASCRIPTPROXY_PERMISSION_UNDEFINED_0100
     * @tc.desc   test WebviewController.registerJavaScriptProxy with permission undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterJavaScriptProxyPermissionUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRegisterJavaScriptProxyPermissionUndefined001', 173800);
      Utils.registerBaseEvent('testRegisterJavaScriptProxyPermissionUndefined001', '401', 173880, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRegisterJavaScriptProxyParamButton', 10, '');
    })
  })
}
