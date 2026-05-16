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

export default function webviewControllerSearchAllAsyncParam() {

  describe('webviewControllerSearchAllAsyncParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerSearchAllAsyncParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerSearchAllAsyncParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerSearchAllAsyncParam' == pages.name)) {
          console.info('get webviewControllerSearchAllAsyncParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerSearchAllAsyncParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerSearchAllAsyncParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerSearchAllAsyncParamButton'), 10000);
      console.log('waitForComponent webviewControllerSearchAllAsyncParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerSearchAllAsyncParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerSearchAllAsyncParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSearchAllAsyncEmpty001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SEARCHALLASYNC_EMPTY_0100
     * @tc.desc   test WebviewController.searchAllAsync with empty string searchString parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSearchAllAsyncEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSearchAllAsyncEmpty001', 172700);
      Utils.registerBaseEvent('testSearchAllAsyncEmpty001', 'success', 172710, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSearchAllAsyncParamButton', 10, '');
    })

    /**
     * @tc.name   testSearchAllAsyncNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SEARCHALLASYNC_NULL_0100
     * @tc.desc   test WebviewController.searchAllAsync with null searchString parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSearchAllAsyncNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSearchAllAsyncNull001', 172700);
      Utils.registerBaseEvent('testSearchAllAsyncNull001', '401', 172720, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSearchAllAsyncParamButton', 10, '');
    })

    /**
     * @tc.name   testSearchAllAsyncUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SEARCHALLASYNC_UNDEFINED_0100
     * @tc.desc   test WebviewController.searchAllAsync with undefined searchString parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSearchAllAsyncUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSearchAllAsyncUndefined001', 172700);
      Utils.registerBaseEvent('testSearchAllAsyncUndefined001', '401', 172730, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSearchAllAsyncParamButton', 10, '');
    })
  })
}
