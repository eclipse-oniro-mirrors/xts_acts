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

export default function webDownloadManagerResumeDownloadParam() {

  describe('webDownloadManagerResumeDownloadParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webDownloadManagerResumeDownloadParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webDownloadManagerResumeDownloadParam state success ' + JSON.stringify(pages));
        if (!('webDownloadManagerResumeDownloadParam' == pages.name)) {
          console.info('get webDownloadManagerResumeDownloadParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webDownloadManagerResumeDownloadParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webDownloadManagerResumeDownloadParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webDownloadManagerResumeDownloadParamButton'), 10000);
      console.log('waitForComponent webDownloadManagerResumeDownloadParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webDownloadManagerResumeDownloadParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webDownloadManagerResumeDownloadParam afterEach start');
      done();
    })

    /**
     * @tc.name   testResumeDownloadNull001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_RESUMEDOWNLOAD_NULL_0100
     * @tc.desc   test WebDownloadManager.resumeDownload with null webDownloadItem parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResumeDownloadNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitResumeDownloadNull001', 176000);
      Utils.registerBaseEvent('testResumeDownloadNull001', 'success', 176010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webDownloadManagerResumeDownloadParamButton', 10, '');
    })

    /**
     * @tc.name   testResumeDownloadUndefined001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_RESUMEDOWNLOAD_UNDEFINED_0100
     * @tc.desc   test WebDownloadManager.resumeDownload with undefined webDownloadItem parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResumeDownloadUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitResumeDownloadUndefined001', 176000);
      Utils.registerBaseEvent('testResumeDownloadUndefined001', 'success', 176020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webDownloadManagerResumeDownloadParamButton', 10, '');
    })
  })
}
