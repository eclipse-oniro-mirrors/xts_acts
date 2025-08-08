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
export default function lastErrorCode() {
  describe('lastErrorCode', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/LastErrorCode',
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
     * @tc.number HWBrowser_ArkWeb_DOWNLOAD_SDK_0900
     * @tc.name testWebViewGetPercentComplete
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebViewGetPercentComplete", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('testWebViewGetPercentComplete', 2, 404, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      sendEventByKey('FILE_FAILED', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('startDownload', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_getLastErrorCode_1001
     * @tc.name testWebView_getLastErrorCode1001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_getLastErrorCode1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('testWebView_getLastErrorCode1001', 33, 405, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      sendEventByKey('111', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('startDownloadUrlFail', 10, '');
    })

  })
}