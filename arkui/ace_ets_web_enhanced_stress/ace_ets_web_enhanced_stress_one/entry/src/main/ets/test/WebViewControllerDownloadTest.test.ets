/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Constants } from './Constants';

export default function webViewControllerDownloadTest() {
  describe('WebViewControllerDownloadTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerDownloadTest',
      }
      try {
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
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_SETDOWNLOADDELEGATE_0100
    * @tc.name        : testSetDownloadDelegate001
    * @tc.desc        : test setDownloadDelegate
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testSetDownloadDelegate001', 0, async (done: Function) => {
      Utils.doIt("testSetDownloadDelegate001", 79520, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_STARTDOWNLOAD_0100
    * @tc.name        : testStartDownload001
    * @tc.desc        : test startDownload
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testStartDownload001', 0, async (done: Function) => {
      Utils.doIt("testStartDownload001", 79530,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETGUID_0100
    * @tc.name        : testGetGuid001
    * @tc.desc        : test WebDownloadItem.getGuid
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetGuid001', 0, async (done: Function) => {
      Utils.doIt("testGetGuid001", 79650, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETCURRENTSPEED_0100
    * @tc.name        : testGetCurrentSpeed001
    * @tc.desc        : test WebDownloadItem.getCurrentSpeed
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetCurrentSpeed001', 0, async (done: Function) => {
      Utils.doIt("testGetCurrentSpeed001", 79654, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_0100
    * @tc.name        : testGetPercentComplete001
    * @tc.desc        : test WebDownloadItem.getPercentComplete
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetPercentComplete001', 0, async (done: Function) => {
      Utils.doIt("testGetPercentComplete001", 79656, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETTOTALBYTES_0100
    * @tc.name        : testGetTotalBytes001
    * @tc.desc        : test WebDownloadItem.getTotalBytes
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetTotalBytes001', 0, async (done: Function) => {
      Utils.doIt("testGetTotalBytes001", 79660, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETSTATE_0100
    * @tc.name        : testGetState001
    * @tc.desc        : test WebDownloadItem.getState
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetState001', 0, async (done: Function) => {
      Utils.doIt("testGetState001", 79661, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETLASTERRORCODE_0100
    * @tc.name        : testGetLastErrorCode001
    * @tc.desc        : test WebDownloadItem.getLastErrorCode
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetLastErrorCode001', 0, async (done: Function) => {
      Utils.doIt("testGetLastErrorCode001", 79663, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETMETHOD_0100
    * @tc.name        : testGetMethod001
    * @tc.desc        : test WebDownloadItem.getMethod
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetMethod001', 0, async (done: Function) => {
      Utils.doIt("testGetMethod001", 79662, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETMIMETYPE_0100
    * @tc.name        : testGetMimeType001
    * @tc.desc        : test WebDownloadItem.getMimeType image/png
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetMimeType001', 0, async (done: Function) => {
      Utils.doIt("testGetMimeType001", 79664, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETURL_0100
    * @tc.name        : testGetUrl001
    * @tc.desc        : test WebDownloadItem.getUrl
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetUrl001', 0, async (done: Function) => {
      Utils.doIt("testGetUrl001", 79670, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETSUGGESTEDFILENAME_0100
    * @tc.name        : testGetSuggestedFileName001
    * @tc.desc        : test WebDownloadItem.getSuggestedFileName
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetSuggestedFileName001', 0, async (done: Function) => {
      Utils.doIt("testGetSuggestedFileName001", 79672, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETRECEIVEDBYTES_0100
    * @tc.name        : testGetReceivedBytes001
    * @tc.desc        : test WebDownloadItem.getReceivedBytes
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetReceivedBytes001', 0, async (done: Function) => {
      Utils.doIt("testGetReceivedBytes001", 79674, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_GETFULLPATH_0100
    * @tc.name        : testGetFullPath001
    * @tc.desc        : test WebDownloadItem.getFullPath
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetFullPath001', 0, async (done: Function) => {
      Utils.doIt("testGetFullPath001", 79676, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_SERIALIZE_0100
    * @tc.name        : testSerialize001
    * @tc.desc        : test WebDownloadItem.serialize
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testSerialize001', 0, async (done: Function) => {
      Utils.doIt("testSerialize001", 79678, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_DESERIALIZE_0100
    * @tc.name        : testDeserialize001
    * @tc.desc        : test WebDownloadItem.deserialize
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testDeserialize001', 0, async (done: Function) => {
      Utils.doIt("testDeserialize001", 79680, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_START_0100
    * @tc.name        : testStart001
    * @tc.desc        : test WebDownloadItem.start
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testStart001', 0, async (done: Function) => {
      Utils.doIt("testStart001", 79682, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_CANCEL_0100
    * @tc.name        : testCancel001
    * @tc.desc        : test WebDownloadItem.cancel
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testCancel001', 0, async (done: Function) => {
      Utils.doIt("testCancel001", 79684, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_PAUSE_0100
    * @tc.name        : testPause001
    * @tc.desc        : test WebDownloadItem.pause
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testPause001', 0, async (done: Function) => {
      Utils.doIt("testPause001", 79686, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADITEM_RESUME_0100
    * @tc.name        : testResume001
    * @tc.desc        : test WebDownloadItem.resume
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testResume001', 0, async (done: Function) => {
      Utils.doIt("testResume001", 79692, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADDELEGATE_ONDOWNLOADFINISH_0100
    * @tc.name        : testOnDownloadFinish001
    * @tc.desc        : test WebDownloadDelegate.onDownloadFinish
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnDownloadFinish001', 0, async (done: Function) => {
      Utils.doIt("testOnDownloadFinish001", 79704,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADDELEGATE_ONBEFOREDOWNLOAD_0100
    * @tc.name        : testOnBeforeDownload001
    * @tc.desc        : test WebDownloadDelegate.onBeforeDownload
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnBeforeDownload001', 0, async (done: Function) => {
      Utils.doIt("testOnBeforeDownload001", 79700,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADDELEGATE_ONDOWNLOADUPDATED_0100
    * @tc.name        : testOnDownloadUpdated001
    * @tc.desc        : test WebDownloadDelegate.onDownloadUpdated
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnDownloadUpdated001', 0, async (done: Function) => {
      Utils.doIt("testOnDownloadUpdated001", 79702,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADDELEGATE_ONDOWNLOADFAILED_0100
    * @tc.name        : testOnDownloadFailed001
    * @tc.desc        : test WebDownloadDelegate.onDownloadFailed
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnDownloadFailed001', 0, async (done: Function) => {
      Utils.doIt("testOnDownloadFailed001", 79703,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADMANAGER_SETDOWNLOADDELEGATE_0100
    * @tc.name        : testWebDownloadManagerSetDownloadDelegate001
    * @tc.desc        : test WebDownloadManager.setDownloadDelegate
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadManagerSetDownloadDelegate001', 0, async (done: Function) => {
      Utils.doIt("testWebDownloadManagerSetDownloadDelegate001", 79750, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBDOWNLOADMANAGER_RESUMEDOWNLOAD_0100
    * @tc.name        : testResumeDownload001
    * @tc.desc        : test WebDownloadManager.resumeDownload
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testResumeDownload001', 0, async (done: Function) => {
      Utils.doIt("testResumeDownload001", 79752,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })
  })
}