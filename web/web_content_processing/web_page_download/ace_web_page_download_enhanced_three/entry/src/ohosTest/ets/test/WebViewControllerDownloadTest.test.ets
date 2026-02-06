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

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETGUID_0100
    * @tc.name        : testGetGuid001
    * @tc.desc        : test WebDownloadItem.getGuid
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testGetGuid001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testGetGuid001", 131570)
      Utils.registerBaseEvent("testGetGuid001", 1, 131580, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETGUID_0200
    * @tc.name        : testGetGuid002
    * @tc.desc        : test WebDownloadItem.getGuid when download two files
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetGuid002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetGuid002", 131570)
      Utils.registerBaseEvent("testGetGuid002", 2, 131590, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETCURRENTSPEED_0100
    * @tc.name        : testGetCurrentSpeed001
    * @tc.desc        : test WebDownloadItem.getCurrentSpeed
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetCurrentSpeed001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetCurrentSpeed001", 131570)
      Utils.registerBaseEvent("testGetCurrentSpeed001", true, 131600, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_0100
    * @tc.name        : testGetPercentComplete001
    * @tc.desc        : test WebDownloadItem.getPercentComplete
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetPercentComplete001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetPercentComplete001", 131570)
      Utils.registerBaseEvent("testGetPercentComplete001", true, 131610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_0200
    * @tc.name        : testGetPercentComplete002
    * @tc.desc        : test WebDownloadItem.getPercentComplete when download finish
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetPercentComplete002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetPercentComplete002", 131570)
      Utils.registerBaseEvent("testGetPercentComplete002", true, 131620, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETTOTALBYTES_0100
    * @tc.name        : testGetTotalBytes001
    * @tc.desc        : test WebDownloadItem.getTotalBytes
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetTotalBytes001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetTotalBytes001", 131570)
      Utils.registerBaseEvent("testGetTotalBytes001", 381400, 131630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETMETHOD_0100
    * @tc.name        : testGetMethod001
    * @tc.desc        : test WebDownloadItem.getMethod
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetMethod001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMethod001", 131570)
      Utils.registerBaseEvent("testGetMethod001", 1, 131640, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_0100
    * @tc.name        : testGetMimeType001
    * @tc.desc        : test WebDownloadItem.getMimeType image/png
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetMimeType001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType001", 131570)
      Utils.registerBaseEvent("testGetMimeType001", true, 131650, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_0200
    * @tc.name        : testGetMimeType002
    * @tc.desc        : test WebDownloadItem.getMimeType video/mp4
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetMimeType002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType002", 131570)
      Utils.registerBaseEvent("testGetMimeType002", true, 131660, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_0300
    * @tc.name        : testGetMimeType003
    * @tc.desc        : test WebDownloadItem.getMimeType application/x-msdownload
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetMimeType003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetMimeType003", 131570)
      Utils.registerBaseEvent("testGetMimeType003", true, 131670, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETURL_0100
    * @tc.name        : testGetUrl001
    * @tc.desc        : test WebDownloadItem.getUrl
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetUrl001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetUrl001", 131570)
      Utils.registerBaseEvent("testGetUrl001", true, 131680, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETSUGGESTEDFILENAME_0100
    * @tc.name        : testGetSuggestedFileName001
    * @tc.desc        : test WebDownloadItem.getSuggestedFileName
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetSuggestedFileName001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetSuggestedFileName001", 131570)
      Utils.registerBaseEvent("testGetSuggestedFileName001", true, 131690, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETRECEIVEDBYTES_0100
    * @tc.name        : testGetReceivedBytes001
    * @tc.desc        : test WebDownloadItem.getReceivedBytes
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetReceivedBytes001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetReceivedBytes001", 131570)
      Utils.registerBaseEvent("testGetReceivedBytes001", true, 131700, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_GETFULLPATH_0100
    * @tc.name        : testGetFullPath001
    * @tc.desc        : test WebDownloadItem.getFullPath
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetFullPath001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetFullPath001", 131570)
      Utils.registerBaseEvent("testGetFullPath001", true, 131710, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_SERIALIZE_0100
    * @tc.name        : testSerialize001
    * @tc.desc        : test WebDownloadItem.serialize
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testSerialize001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSerialize001", 131570)
      Utils.registerBaseEvent("testSerialize001", true, 131720, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_DESERIALIZE_0100
    * @tc.name        : testDeserialize001
    * @tc.desc        : test WebDownloadItem.deserialize
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
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