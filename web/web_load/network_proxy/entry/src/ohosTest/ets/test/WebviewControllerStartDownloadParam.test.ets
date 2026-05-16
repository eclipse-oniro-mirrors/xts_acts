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

export default function webviewControllerStartDownloadParam() {

  describe('webviewControllerStartDownloadParam', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerStartDownloadParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerStartDownloadParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerStartDownloadParam' == pages.name)) {
          console.info('get webviewControllerStartDownloadParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerStartDownloadParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerStartDownloadParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerStartDownloadParamButton'), 10000);
      console.log('waitForComponent webviewControllerStartDownloadParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerStartDownloadParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerStartDownloadParam afterEach start');
      done();
    })

    /**
     * @tc.name   testStartDownloadEmptyString001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_STARTDOWNLOAD_EMPTYSTRING_0100
     * @tc.desc   test WebviewController.startDownload with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartDownloadEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitStartDownloadEmptyString001', 175800);
      Utils.registerBaseEvent('testStartDownloadEmptyString001', '17100002', 175810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerStartDownloadParamButton', 10, '');
    })

    /**
     * @tc.name   testStartDownloadNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_STARTDOWNLOAD_NULL_0100
     * @tc.desc   test WebviewController.startDownload with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartDownloadNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitStartDownloadNull001', 175800);
      Utils.registerBaseEvent('testStartDownloadNull001', '17100002', 175820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerStartDownloadParamButton', 10, '');
    })

    /**
     * @tc.name   testStartDownloadUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_STARTDOWNLOAD_UNDEFINED_0100
     * @tc.desc   test WebviewController.startDownload with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartDownloadUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitStartDownloadUndefined001', 175800);
      Utils.registerBaseEvent('testStartDownloadUndefined001', '17100002', 175830, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerStartDownloadParamButton', 10, '');
    })
  })
}
