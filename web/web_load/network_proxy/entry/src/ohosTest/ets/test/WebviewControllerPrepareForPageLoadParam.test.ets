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

export default function webviewControllerPrepareForPageLoadParam() {

  describe('webviewControllerPrepareForPageLoadParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerPrepareForPageLoadParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerPrepareForPageLoadParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerPrepareForPageLoadParam' == pages.name)) {
          console.info('get webviewControllerPrepareForPageLoadParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerPrepareForPageLoadParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerPrepareForPageLoadParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerPrepareForPageLoadParamButton'), 10000);
      console.log('waitForComponent webviewControllerPrepareForPageLoadParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerPrepareForPageLoadParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerPrepareForPageLoadParam afterEach start');
      done();
    })

    /**
     * @tc.name   testPrepareForPageLoadNullUrl001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREPAREFORPAGELOAD_NULLURL_0100
     * @tc.desc   test WebviewController.prepareForPageLoad with null url parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrepareForPageLoadNullUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrepareForPageLoadNullUrl001', 173000);
      Utils.registerBaseEvent('testPrepareForPageLoadNullUrl001', '17100002', 173010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPrepareForPageLoadParamButton', 10, '');
    })

    /**
     * @tc.name   testPrepareForPageLoadUndefinedUrl001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREPAREFORPAGELOAD_UNDEFINEDURL_0100
     * @tc.desc   test WebviewController.prepareForPageLoad with undefined url parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrepareForPageLoadUndefinedUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrepareForPageLoadUndefinedUrl001', 173000);
      Utils.registerBaseEvent('testPrepareForPageLoadUndefinedUrl001', '17100002', 173020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPrepareForPageLoadParamButton', 10, '');
    })

    /**
     * @tc.name   testPrepareForPageLoadEmptyStringUrl001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREPAREFORPAGELOAD_EMPTYSTRINGURL_0100
     * @tc.desc   test WebviewController.prepareForPageLoad with empty string url parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrepareForPageLoadEmptyStringUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrepareForPageLoadEmptyStringUrl001', 173000);
      Utils.registerBaseEvent('testPrepareForPageLoadEmptyStringUrl001', '17100002', 173030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPrepareForPageLoadParamButton', 10, '');
    })

    /**
     * @tc.name   testPrepareForPageLoadPreconnectableFalse001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREPAREFORPAGELOAD_PRECONNECTABLEFALSE_0100
     * @tc.desc   test WebviewController.prepareForPageLoad with preconnectable false parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrepareForPageLoadPreconnectableFalse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrepareForPageLoadPreconnectableFalse001', 173000);
      Utils.registerBaseEvent('testPrepareForPageLoadPreconnectableFalse001', 'success', 173040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPrepareForPageLoadParamButton', 10, '');
    })

    /**
     * @tc.name   testPrepareForPageLoadNumSocketsNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREPAREFORPAGELOAD_NUMSOCKETSNULL_0100
     * @tc.desc   test WebviewController.prepareForPageLoad with null numSockets parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrepareForPageLoadNumSocketsNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrepareForPageLoadNumSocketsNull001', 173000);
      Utils.registerBaseEvent('testPrepareForPageLoadNumSocketsNull001', '401', 173050, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPrepareForPageLoadParamButton', 10, '');
    })

    /**
     * @tc.name   testPrepareForPageLoadNumSocketsUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREPAREFORPAGELOAD_NUMSOCKETSUNDEFINED_0100
     * @tc.desc   test WebviewController.prepareForPageLoad with undefined numSockets parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrepareForPageLoadNumSocketsUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPrepareForPageLoadNumSocketsUndefined001', 173000);
      Utils.registerBaseEvent('testPrepareForPageLoadNumSocketsUndefined001', '401', 173060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPrepareForPageLoadParamButton', 10, '');
    })
  })
}
