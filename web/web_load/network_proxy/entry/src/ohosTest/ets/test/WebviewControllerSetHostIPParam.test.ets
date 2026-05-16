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

export default function webviewControllerSetHostIPParam() {

  describe('webviewControllerSetHostIPParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerSetHostIPParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerSetHostIPParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerSetHostIPParam' == pages.name)) {
          console.info('get webviewControllerSetHostIPParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerSetHostIPParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerSetHostIPParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerSetHostIPParamButton'), 10000);
      console.log('waitForComponent webviewControllerSetHostIPParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerSetHostIPParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerSetHostIPParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetHostIPHostNameEmpty001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETHOSTIP_HOSTNAME_EMPTY_0100
     * @tc.desc   test WebviewController.setHostIP with empty string hostName parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHostIPHostNameEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHostIPHostNameEmpty001', 172700);
      Utils.registerBaseEvent('testSetHostIPHostNameEmpty001', 'success', 172710, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetHostIPParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHostIPHostNameNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETHOSTIP_HOSTNAME_NULL_0100
     * @tc.desc   test WebviewController.setHostIP with null hostName parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHostIPHostNameNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHostIPHostNameNull001', 172700);
      Utils.registerBaseEvent('testSetHostIPHostNameNull001', '401', 172720, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetHostIPParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHostIPHostNameUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETHOSTIP_HOSTNAME_UNDEFINED_0100
     * @tc.desc   test WebviewController.setHostIP with undefined hostName parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHostIPHostNameUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHostIPHostNameUndefined001', 172700);
      Utils.registerBaseEvent('testSetHostIPHostNameUndefined001', '401', 172730, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetHostIPParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHostIPAddressEmpty001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETHOSTIP_ADDRESS_EMPTY_0100
     * @tc.desc   test WebviewController.setHostIP with empty string address parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHostIPAddressEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHostIPAddressEmpty001', 172700);
      Utils.registerBaseEvent('testSetHostIPAddressEmpty001', '401', 172740, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetHostIPParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHostIPAddressNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETHOSTIP_ADDRESS_NULL_0100
     * @tc.desc   test WebviewController.setHostIP with null address parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHostIPAddressNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHostIPAddressNull001', 172700);
      Utils.registerBaseEvent('testSetHostIPAddressNull001', '401', 172750, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetHostIPParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHostIPAddressUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETHOSTIP_ADDRESS_UNDEFINED_0100
     * @tc.desc   test WebviewController.setHostIP with undefined address parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHostIPAddressUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHostIPAddressUndefined001', 172700);
      Utils.registerBaseEvent('testSetHostIPAddressUndefined001', '401', 172760, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetHostIPParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHostIPAliveTimeNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETHOSTIP_ALIVETIME_NULL_0100
     * @tc.desc   test WebviewController.setHostIP with null aliveTime parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHostIPAliveTimeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHostIPAliveTimeNull001', 172700);
      Utils.registerBaseEvent('testSetHostIPAliveTimeNull001', '401', 172770, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetHostIPParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHostIPAliveTimeUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETHOSTIP_ALIVETIME_UNDEFINED_0100
     * @tc.desc   test WebviewController.setHostIP with undefined aliveTime parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHostIPAliveTimeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHostIPAliveTimeUndefined001', 172700);
      Utils.registerBaseEvent('testSetHostIPAliveTimeUndefined001', '401', 172780, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetHostIPParamButton', 10, '');
    })
  })
}
