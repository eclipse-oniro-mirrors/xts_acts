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

import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest.test';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const driver = Driver.create();

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

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
     * @tc.name   testSetDownloadDelegateGroup001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETDOWNLOADDELEGATE_GROUP_0100
     * @tc.desc   test setDownloadDelegate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDownloadDelegateGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testSetDownloadDelegate001", 130080)
      Utils.registerBaseEvent("testSetDownloadDelegate001", true, 130090,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testStartDownloadGroup001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_STARTDOWNLOAD_GROUP_0100
     * @tc.desc   test startDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartDownloadGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testStartDownload001", 130080)
      Utils.registerBaseEvent("testStartDownload001", true, 130100,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadStateGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0100
     * @tc.desc   test WebDownloadState.IN_PROGRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadStateGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadState001", 130080)
      Utils.registerBaseEvent("testWebDownloadState001", webView.WebDownloadState.IN_PROGRESS, 130110,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadStateGroup002
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0200
     * @tc.desc   test WebDownloadState.COMPLETED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadStateGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadState002", 130080)
      Utils.registerBaseEvent("testWebDownloadState002", webView.WebDownloadState.COMPLETED, 130120,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadStateGroup003
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0300
     * @tc.desc   test WebDownloadState.CANCELED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadStateGroup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadState003", 130080)
      Utils.registerBaseEvent("testWebDownloadState003", webView.WebDownloadState.CANCELED, 130130,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadStateGroup004
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0400
     * @tc.desc   test WebDownloadState.INTERRUPTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadStateGroup004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadState004", 130080)
      Utils.registerBaseEvent("testWebDownloadState004", webView.WebDownloadState.INTERRUPTED, 130140,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadStateGroup005
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0500
     * @tc.desc   test WebDownloadState.PENDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadStateGroup005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadState005", 130080)
      Utils.registerBaseEvent("testWebDownloadState005", webView.WebDownloadState.PENDING, 130150,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })


    /**
     * @tc.name   testGetGuidGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETGUID_GROUP_0100
     * @tc.desc   test WebDownloadItem.getGuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGuidGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetGuid001", 130080)
      Utils.registerBaseEvent("testGetGuid001", true, 130160,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetGuidGroup002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETGUID_GROUP_0200
     * @tc.desc   test WebDownloadItem.getGuid when download two files
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGuidGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetGuid002", 130080)
      Utils.registerBaseEvent("testGetGuid002", true, 130170,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetCurrentSpeedGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETCURRENTSPEED_GROUP_0100
     * @tc.desc   test WebDownloadItem.getCurrentSpeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCurrentSpeedGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetCurrentSpeed001", 130080)
      Utils.registerBaseEvent("testGetCurrentSpeed001", true, 130180,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetPercentCompleteGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_GROUP_0100
     * @tc.desc   test WebDownloadItem.getPercentComplete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPercentCompleteGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetPercentComplete001", 130080)
      Utils.registerBaseEvent("testGetPercentComplete001", true, 130190,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetPercentCompleteGroup002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_GROUP_0200
     * @tc.desc   test WebDownloadItem.getPercentComplete when download finish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPercentCompleteGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetPercentComplete002", 130080)
      Utils.registerBaseEvent("testGetPercentComplete002", true, 130200,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetTotalBytesGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETTOTALBYTES_GROUP_0100
     * @tc.desc   test WebDownloadItem.getTotalBytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTotalBytesGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetTotalBytes001", 130080)
      Utils.registerBaseEvent("testGetTotalBytes001", true, 130210,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetMethodGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMETHOD_GROUP_0100
     * @tc.desc   test WebDownloadItem.getMethod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMethodGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMethod001", 130080)
      Utils.registerBaseEvent("testGetMethod001", true, 130220,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetMimeTypeGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0100
     * @tc.desc   test WebDownloadItem.getMimeType image/png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMimeTypeGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType001", 130080)
      Utils.registerBaseEvent("testGetMimeType001", true, 130230,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetMimeTypeGroup002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0200
     * @tc.desc   test WebDownloadItem.getMimeType video/mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMimeTypeGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType002", 130080)
      Utils.registerBaseEvent("testGetMimeType002", true, 130240,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetMimeTypeGroup003
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0300
     * @tc.desc   test WebDownloadItem.getMimeType application/x-msdownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMimeTypeGroup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType003", 130080)
      Utils.registerBaseEvent("testGetMimeType003", true, 130250,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetUrlGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETURL_GROUP_0100
     * @tc.desc   test WebDownloadItem.getUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUrlGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetUrl001", 130080)
      Utils.registerBaseEvent("testGetUrl001", true, 130260,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetSuggestedFileNameGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETSUGGESTEDFILENAME_GROUP_0100
     * @tc.desc   test WebDownloadItem.getSuggestedFileName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSuggestedFileNameGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetSuggestedFileName001", 130080)
      Utils.registerBaseEvent("testGetSuggestedFileName001", true, 130270,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetReceivedBytesGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETRECEIVEDBYTES_GROUP_0100
     * @tc.desc   test WebDownloadItem.getReceivedBytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetReceivedBytesGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetReceivedBytes001", 130080)
      Utils.registerBaseEvent("testGetReceivedBytes001", true, 130280,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testGetFullPathGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETFULLPATH_GROUP_0100
     * @tc.desc   test WebDownloadItem.getFullPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFullPathGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetFullPath001", 130080)
      Utils.registerBaseEvent("testGetFullPath001", true, 130290,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testSerializeGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_SERIALIZE_GROUP_0100
     * @tc.desc   test WebDownloadItem.serialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSerializeGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSerialize001", 130080)
      Utils.registerBaseEvent("testSerialize001", true, 130300,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testDeserializeGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_DESERIALIZE_GROUP_0100
     * @tc.desc   test WebDownloadItem.deserialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeserializeGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDeserialize001", 130080)
      Utils.registerBaseEvent("testDeserialize001", true, 130310,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })


    /**
     * @tc.name   testOnBeforeDownloadGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONBEFOREDOWNLOAD_GROUP_0100
     * @tc.desc   test WebDownloadDelegate.onBeforeDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnBeforeDownloadGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnBeforeDownload001", 130080)
      Utils.registerBaseEvent("testOnBeforeDownload001", true, 130320,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testOnDownloadUpdatedGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADUPDATED_GROUP_0100
     * @tc.desc   test WebDownloadDelegate.onDownloadUpdated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnDownloadUpdatedGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnDownloadUpdated001", 130080)
      Utils.registerBaseEvent("testOnDownloadUpdated001", true, 130330,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testOnDownloadFinishGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADFINISH_GROUP_0100
     * @tc.desc   test WebDownloadDelegate.onDownloadFinish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnDownloadFinishGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnDownloadFinish001", 130080)
      Utils.registerBaseEvent("testOnDownloadFinish001", true, 130340,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /**
     * @tc.name   testWebDownloadManagerSetDownloadDelegateGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_SETDOWNLOADDELEGATE_GROUP_0100
     * @tc.desc   test WebDownloadManager.setDownloadDelegate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadManagerSetDownloadDelegateGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadManagerSetDownloadDelegate001", 130080)
      Utils.registerBaseEvent("testWebDownloadManagerSetDownloadDelegate001", true, 130350,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })
  })
}