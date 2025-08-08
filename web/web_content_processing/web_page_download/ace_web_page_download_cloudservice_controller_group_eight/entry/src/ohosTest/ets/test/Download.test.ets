/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import { router } from '@kit.ArkUI';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function Download() {
  describe('Download', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/Download',
      }
      try {
        await Utils.sleep(500)
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('Download' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(800);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error: ' + err);
      }
      await Utils.sleep(1000)
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(300);
      done();
    });

    afterEach(() => {
    })

    afterAll(() => {
    })


    /**
     * @tc.number SUB_ACE_WEB_setDownloadDelegate_1000
     * @tc.name testWebView_setDownloadDelegate1000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_setDownloadDelegate1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      Utils.registerBaseEvent('testWebView_setDownloadDelegate1000', '17100019The download task is not started yet.',
        400, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('pause', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_setDownloadDelegate_1001
     * @tc.name testWebView_setDownloadDelegate1001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_setDownloadDelegate1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('testWebView_setDownloadDelegate1001', '4', 401, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setDownloadDelegate', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('startDownload', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('cancel', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('state', 10, '');
      await Utils.sleep(2000);
    })

    /**
     * @tc.number SUB_ACE_WEB_setDownloadDelegate_1002
     * @tc.name testWebView_setDownloadDelegate1002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_setDownloadDelegate1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('testWebView_setDownloadDelegate1002', '4', 401, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setDownloadDelegate', 10, '');
      await Utils.sleep(200);
      sendEventByKey('startDownload', 10, '');
      await Utils.sleep(200);
      sendEventByKey('pause', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('resume', 10, '');
      await Utils.sleep(200);
      sendEventByKey('cancel', 10, '');
      await Utils.sleep(200);
      sendEventByKey('state', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_setDownloadDelegate_1003
     * @tc.name testWebView_setDownloadDelegate1003
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_setDownloadDelegate1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('testWebView_setDownloadDelegate1003', '17100001Init error. The WebviewController must be associated with a Web component', 402, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setDownloadDelegateNotController', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_setDownloadDelegate_1004
     * @tc.name testWebView_setDownloadDelegate1004
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_setDownloadDelegate1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('testWebView_setDownloadDelegate1004', '17100002Invalid url', 403, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setDownloadDelegate', 10, '');
      await Utils.sleep(400);
      sendEventByKey('startDownload1', 10, '');
    })

  })
}