/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
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
        console.info("get WebViewControllerDownloadTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerDownloadTest" == pages.name)) {
          console.info("get WebViewControllerDownloadTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);

          console.info("push WebViewControllerDownloadTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerDownloadTest page error: " + err);
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
        if (data.chload >= 900 || data.rssi <= -80) {
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
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerDownloadTest afterEach start");
      Utils.emitEvent('', 11)
      console.info("WebViewControllerDownloadTest afterEach end");
      done();
    })

    /**
     * @tc.name   testGetGuid001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETGUID_0100
     * @tc.desc   test WebDownloadItem.getGuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGuid001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testGetGuid001", 131570)
      Utils.registerBaseEvent("testGetGuid001", 1, 131580, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetGuid002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETGUID_0200
     * @tc.desc   test WebDownloadItem.getGuid when download two files
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGuid002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetGuid002", 131570)
      Utils.registerBaseEvent("testGetGuid002", 2, 131590, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetCurrentSpeed001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETCURRENTSPEED_0100
     * @tc.desc   test WebDownloadItem.getCurrentSpeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCurrentSpeed001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetCurrentSpeed001", 131570)
      Utils.registerBaseEvent("testGetCurrentSpeed001", true, 131600, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetPercentComplete001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_0100
     * @tc.desc   test WebDownloadItem.getPercentComplete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPercentComplete001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetPercentComplete001", 131570)
      Utils.registerBaseEvent("testGetPercentComplete001", true, 131610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetPercentComplete002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_0200
     * @tc.desc   test WebDownloadItem.getPercentComplete when download finish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPercentComplete002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetPercentComplete002", 131570)
      Utils.registerBaseEvent("testGetPercentComplete002", true, 131620, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetTotalBytes001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETTOTALBYTES_0100
     * @tc.desc   test WebDownloadItem.getTotalBytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTotalBytes001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetTotalBytes001", 131570)
      Utils.registerBaseEvent("testGetTotalBytes001", 381400, 131630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetMethod001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMETHOD_0100
     * @tc.desc   test WebDownloadItem.getMethod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMethod001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMethod001", 131570)
      Utils.registerBaseEvent("testGetMethod001", 1, 131640, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetMimeType001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_0100
     * @tc.desc   test WebDownloadItem.getMimeType image/png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMimeType001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType001", 131570)
      Utils.registerBaseEvent("testGetMimeType001", true, 131650, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetMimeType002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_0200
     * @tc.desc   test WebDownloadItem.getMimeType video/mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMimeType002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType002", 131570)
      Utils.registerBaseEvent("testGetMimeType002", true, 131660, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetMimeType003
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_0300
     * @tc.desc   test WebDownloadItem.getMimeType application/x-msdownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMimeType003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType003", 131570)
      Utils.registerBaseEvent("testGetMimeType003", true, 131670, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetUrl001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETURL_0100
     * @tc.desc   test WebDownloadItem.getUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUrl001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetUrl001", 131570)
      Utils.registerBaseEvent("testGetUrl001", true, 131680, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetSuggestedFileName001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETSUGGESTEDFILENAME_0100
     * @tc.desc   test WebDownloadItem.getSuggestedFileName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSuggestedFileName001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetSuggestedFileName001", 131570)
      Utils.registerBaseEvent("testGetSuggestedFileName001", true, 131690, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetReceivedBytes001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETRECEIVEDBYTES_0100
     * @tc.desc   test WebDownloadItem.getReceivedBytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetReceivedBytes001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetReceivedBytes001", 131570)
      Utils.registerBaseEvent("testGetReceivedBytes001", true, 131700, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetFullPath001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETFULLPATH_0100
     * @tc.desc   test WebDownloadItem.getFullPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFullPath001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetFullPath001", 131570)
      Utils.registerBaseEvent("testGetFullPath001", true, 131710, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testSerialize001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_SERIALIZE_0100
     * @tc.desc   test WebDownloadItem.serialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSerialize001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSerialize001", 131570)
      Utils.registerBaseEvent("testSerialize001", true, 131720, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testDeserialize001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_DESERIALIZE_0100
     * @tc.desc   test WebDownloadItem.deserialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeserialize001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDeserialize001", 131570)
      Utils.registerBaseEvent("testDeserialize001", true, 131730, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

  })
}