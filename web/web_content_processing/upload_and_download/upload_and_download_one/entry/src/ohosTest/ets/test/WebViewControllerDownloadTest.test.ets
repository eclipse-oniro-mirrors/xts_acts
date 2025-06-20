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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerDownloadTest() {
  describe('WebViewControllerDownloadTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerDownloadTest',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerDownloadTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerDownloadTest" == pages.name)) {
          console.info("get WebViewControllerDownloadTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerDownloadTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerDownloadTest page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      await Utils.sleep(1000);
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerDownloadTest afterEach start");
      Utils.emitEvent('', 11)
      await Utils.sleep(3000);
      console.info("WebViewControllerDownloadTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBVIEWCONTROLLER_SETDOWNLOADDELEGATE_GROUP_0100
    * @tc.name        : testSetDownloadDelegateGroup001
    * @tc.desc        : test setDownloadDelegate
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testSetDownloadDelegateGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testSetDownloadDelegate001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testSetDownloadDelegate001", true, 79520,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBVIEWCONTROLLER_STARTDOWNLOAD_GROUP_0100
    * @tc.name        : testStartDownloadGroup001
    * @tc.desc        : test startDownload
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testStartDownloadGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testStartDownload001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testStartDownload001", true, 79530,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADSTATE_GROUP_0100
    * @tc.name        : testWebDownloadStateGroup001
    * @tc.desc        : test WebDownloadState.IN_PROGRESS
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadStateGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadState001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testWebDownloadState001", webView.WebDownloadState.IN_PROGRESS, 79540,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADSTATE_GROUP_0200
    * @tc.name        : testWebDownloadStateGroup002
    * @tc.desc        : test WebDownloadState.COMPLETED
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadStateGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadState002", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testWebDownloadState002", webView.WebDownloadState.COMPLETED, 79542,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADSTATE_GROUP_0300
    * @tc.name        : testWebDownloadStateGroup003
    * @tc.desc        : test WebDownloadState.CANCELED
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadStateGroup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadState003", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testWebDownloadState003", webView.WebDownloadState.CANCELED, 79544,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADSTATE_GROUP_0400
    * @tc.name        : testWebDownloadStateGroup004
    * @tc.desc        : test WebDownloadState.INTERRUPTED
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadStateGroup004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadState004", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testWebDownloadState004", webView.WebDownloadState.INTERRUPTED, 79546,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADSTATE_GROUP_0500
    * @tc.name        : testWebDownloadStateGroup005
    * @tc.desc        : test WebDownloadState.PENDING
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadStateGroup005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadState005", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testWebDownloadState005", webView.WebDownloadState.PENDING, 79548,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })


    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETGUID_GROUP_0100
    * @tc.name        : testGetGuidGroup001
    * @tc.desc        : test WebDownloadItem.getGuid
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetGuidGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetGuid001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetGuid001", true, 79650,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETGUID_GROUP_0200
    * @tc.name        : testGetGuidGroup002
    * @tc.desc        : test WebDownloadItem.getGuid when download two files
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetGuidGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetGuid002", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetGuid002", true, 79652,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETCURRENTSPEED_GROUP_0100
    * @tc.name        : testGetCurrentSpeedGroup001
    * @tc.desc        : test WebDownloadItem.getCurrentSpeed
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetCurrentSpeedGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetCurrentSpeed001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetCurrentSpeed001", true, 79654,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_GROUP_0100
    * @tc.name        : testGetPercentCompleteGroup001
    * @tc.desc        : test WebDownloadItem.getPercentComplete
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetPercentCompleteGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetPercentComplete001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetPercentComplete001", true, 79656,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_GROUP_0200
    * @tc.name        : testGetPercentCompleteGroup002
    * @tc.desc        : test WebDownloadItem.getPercentComplete when download finish
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetPercentCompleteGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetPercentComplete002", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetPercentComplete002", true, 79658,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETTOTALBYTES_GROUP_0100
    * @tc.name        : testGetTotalBytesGroup001
    * @tc.desc        : test WebDownloadItem.getTotalBytes
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetTotalBytesGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetTotalBytes001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetTotalBytes001", true, 79660,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETMETHOD_GROUP_0100
    * @tc.name        : testGetMethodGroup001
    * @tc.desc        : test WebDownloadItem.getMethod
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetMethodGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMethod001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetMethod001", true, 79662,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0100
    * @tc.name        : testGetMimeTypeGroup001
    * @tc.desc        : test WebDownloadItem.getMimeType image/png
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetMimeTypeGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetMimeType001", true, 79664,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0200
    * @tc.name        : testGetMimeTypeGroup002
    * @tc.desc        : test WebDownloadItem.getMimeType video/mp4
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetMimeTypeGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType002", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetMimeType002", true, 79666,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0300
    * @tc.name        : testGetMimeTypeGroup003
    * @tc.desc        : test WebDownloadItem.getMimeType application/x-msdownload
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetMimeTypeGroup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType003", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetMimeType003", true, 79668,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETURL_GROUP_0100
    * @tc.name        : testGetUrlGroup001
    * @tc.desc        : test WebDownloadItem.getUrl
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetUrlGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetUrl001", true, 79670,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETSUGGESTEDFILENAME_GROUP_0100
    * @tc.name        : testGetSuggestedFileNameGroup001
    * @tc.desc        : test WebDownloadItem.getSuggestedFileName
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetSuggestedFileNameGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetSuggestedFileName001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetSuggestedFileName001", true, 79672,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETRECEIVEDBYTES_GROUP_0100
    * @tc.name        : testGetReceivedBytesGroup001
    * @tc.desc        : test WebDownloadItem.getReceivedBytes
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetReceivedBytesGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetReceivedBytes001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetReceivedBytes001", true, 79674,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETFULLPATH_GROUP_0100
    * @tc.name        : testGetFullPathGroup001
    * @tc.desc        : test WebDownloadItem.getFullPath
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetFullPathGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetFullPath001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testGetFullPath001", true, 79676,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_SERIALIZE_GROUP_0100
    * @tc.name        : testSerializeGroup001
    * @tc.desc        : test WebDownloadItem.serialize
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testSerializeGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSerialize001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testSerialize001", true, 79678,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_DESERIALIZE_GROUP_0100
    * @tc.name        : testDeserializeGroup001
    * @tc.desc        : test WebDownloadItem.deserialize
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testDeserializeGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDeserialize001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testDeserialize001", true, 79680,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })


    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADDELEGATE_ONBEFOREDOWNLOAD_GROUP_0100
    * @tc.name        : testOnBeforeDownloadGroup001
    * @tc.desc        : test WebDownloadDelegate.onBeforeDownload
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnBeforeDownloadGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnBeforeDownload001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testOnBeforeDownload001", true, 79700,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADUPDATED_GROUP_0100
    * @tc.name        : testOnDownloadUpdatedGroup001
    * @tc.desc        : test WebDownloadDelegate.onDownloadUpdated
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnDownloadUpdatedGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnDownloadUpdated001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testOnDownloadUpdated001", true, 79702,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADFINISH_GROUP_0100
    * @tc.name        : testOnDownloadFinishGroup001
    * @tc.desc        : test WebDownloadDelegate.onDownloadFinish
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnDownloadFinishGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnDownloadFinish001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testOnDownloadFinish001", true, 79704,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADMANAGER_SETDOWNLOADDELEGATE_GROUP_0100
    * @tc.name        : testWebDownloadManagerSetDownloadDelegateGroup001
    * @tc.desc        : test WebDownloadManager.setDownloadDelegate
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadManagerSetDownloadDelegateGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadManagerSetDownloadDelegate001", 10)
      await Utils.sleep(2000);
      Utils.registerBaseEvent("testWebDownloadManagerSetDownloadDelegate001", true, 79750,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })
  })
}