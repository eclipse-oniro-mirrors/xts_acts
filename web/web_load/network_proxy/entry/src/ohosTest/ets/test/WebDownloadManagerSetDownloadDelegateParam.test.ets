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

export default function webDownloadManagerSetDownloadDelegateParam() {

  describe('webDownloadManagerSetDownloadDelegateParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webDownloadManagerSetDownloadDelegateParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webDownloadManagerSetDownloadDelegateParam state success ' + JSON.stringify(pages));
        if (!('webDownloadManagerSetDownloadDelegateParam' == pages.name)) {
          console.info('get webDownloadManagerSetDownloadDelegateParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webDownloadManagerSetDownloadDelegateParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webDownloadManagerSetDownloadDelegateParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webDownloadManagerSetDownloadDelegateParamButton'), 10000);
      console.log('waitForComponent webDownloadManagerSetDownloadDelegateParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webDownloadManagerSetDownloadDelegateParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webDownloadManagerSetDownloadDelegateParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetDownloadDelegateNull001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_SETDOWNLOADDELEGATE_NULL_0100
     * @tc.desc   test WebDownloadManager.setDownloadDelegate with null delegate parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDownloadDelegateNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetDownloadDelegateNull001', 175000);
      Utils.registerBaseEvent('testSetDownloadDelegateNull001', 'success', 175010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webDownloadManagerSetDownloadDelegateParamButton', 10, '');
    })

    /**
     * @tc.name   testSetDownloadDelegateUndefined001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_SETDOWNLOADDELEGATE_UNDEFINED_0100
     * @tc.desc   test WebDownloadManager.setDownloadDelegate with undefined delegate parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDownloadDelegateUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetDownloadDelegateUndefined001', 175000);
      Utils.registerBaseEvent('testSetDownloadDelegateUndefined001', 'success', 175020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webDownloadManagerSetDownloadDelegateParamButton', 10, '');
    })
  })
}
