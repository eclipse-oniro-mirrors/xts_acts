                                                                     /**
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

import { afterEach, beforeAll, beforeEach, describe, it, Level, Size, TestType, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import webView from '@ohos.web.webview';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest';
import events_emitter from '@ohos.events.emitter';
import { Driver } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const driver = Driver.create();

export default function webViewControllerDownloadTest() {
  describe('WebViewControllerDownloadTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerDownloadTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebViewControllerDownloadTest state success ' + JSON.stringify(pages));
        if (!('WebViewControllerDownloadTest' == pages.name)) {
          console.info('get WebViewControllerDownloadTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebViewControllerDownloadTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebViewControllerDownloadTest page error: ' + err);
      }
      await waitForComponents('WebViewControllerDownloadTestButton');
      done()
    });
    beforeEach(async (done: Function) => {
      try {
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
          done()
        }
        if (data.chload >= 800 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('web beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebViewControllerDownloadTest afterEach start');
      Utils.emitEvent('', 11)
      console.info('WebViewControllerDownloadTest afterEach end');
      done();
    })

    /**
     * @tc.name   testSetDownloadDelegate001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETDOWNLOADDELEGATE_0100
     * @tc.desc   test setDownloadDelegate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDownloadDelegate001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('testSetDownloadDelegate001', 131740)
      Utils.registerBaseEvent('testSetDownloadDelegate001', true, 131750, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testStartDownload001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_STARTDOWNLOAD_0100
     * @tc.desc   test startDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartDownload001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testStartDownload001', 131740)
      Utils.registerBaseEvent('testStartDownload001', true, 131760, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadState001
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_0100
     * @tc.desc   test WebDownloadState.IN_PROGRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadState001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState001', 131740)
      Utils.registerBaseEvent('testWebDownloadState001', webView.WebDownloadState.IN_PROGRESS, 131770, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadState002
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_0200
     * @tc.desc   test WebDownloadState.COMPLETED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadState002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState002', 131740)
      Utils.registerBaseEvent('testWebDownloadState002', webView.WebDownloadState.COMPLETED, 131780, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadState003
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_0300
     * @tc.desc   test WebDownloadState.CANCELED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadState003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState003', 131740)
      Utils.registerBaseEvent('testWebDownloadState003', webView.WebDownloadState.CANCELED, 131790, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadState004
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_0400
     * @tc.desc   test WebDownloadState.INTERRUPTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadState004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState004', 131740)
      Utils.registerBaseEvent('testWebDownloadState004', webView.WebDownloadState.INTERRUPTED, 131800, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadState005
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_0500
     * @tc.desc   test WebDownloadState.PENDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadState005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState005', 131740)
      Utils.registerBaseEvent('testWebDownloadState005', webView.WebDownloadState.PENDING, 131810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadState006
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_0600
     * @tc.desc   test WebDownloadState.PAUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadState006', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState006', 131740)
      Utils.registerBaseEvent('testWebDownloadState006', webView.WebDownloadState.PAUSED, 131820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testResume001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_RESUME_0100
     * @tc.desc   test WebDownloadItem.resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResume001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testResume001', 131740)
      Utils.registerBaseEvent('testResume001', webView.WebDownloadState.IN_PROGRESS, 131830, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testOnBeforeDownload001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONBEFOREDOWNLOAD_0100
     * @tc.desc   test WebDownloadDelegate.onBeforeDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnBeforeDownload001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testOnBeforeDownload001', 131740)
      Utils.registerBaseEvent('testOnBeforeDownload001', true, 131840, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testOnDownloadUpdated001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADUPDATED_0100
     * @tc.desc   test WebDownloadDelegate.onDownloadUpdated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnDownloadUpdated001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testOnDownloadUpdated001', 131740)
      Utils.registerBaseEvent('testOnDownloadUpdated001', true, 131850, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testOnDownloadFinish001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADFINISH_0100
     * @tc.desc   test WebDownloadDelegate.onDownloadFinish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnDownloadFinish001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testOnDownloadFinish001', 131740)
      Utils.registerBaseEvent('testOnDownloadFinish001', true, 131860, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadManagerSetDownloadDelegate001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_SETDOWNLOADDELEGATE_0100
     * @tc.desc   test WebDownloadManager.setDownloadDelegate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadManagerSetDownloadDelegate001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: Function) => {
      Utils.emitEvent('testWebDownloadManagerSetDownloadDelegate001', 131740)
      Utils.registerBaseEvent('testWebDownloadManagerSetDownloadDelegate001', true, 131870, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testResumeDownload001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_RESUMEDOWNLOAD_0100
     * @tc.desc   test WebDownloadManager.resumeDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResumeDownload001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testResumeDownload001', 131740)
      Utils.registerBaseEvent('testResumeDownload001', webView.WebDownloadState.IN_PROGRESS, 131880, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

  })
}