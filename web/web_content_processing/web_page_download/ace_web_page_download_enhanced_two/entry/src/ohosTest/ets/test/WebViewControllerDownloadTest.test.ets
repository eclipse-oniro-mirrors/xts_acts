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

import { afterEach, beforeAll, beforeEach, describe, it, Level, Size, TestType } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import webView from '@ohos.web.webview';
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
        router.clear();
        let pages = router.getState();
        console.info('get WebViewControllerDownloadTest state success ' + JSON.stringify(pages));
        if (!('WebViewControllerDownloadTest' == pages.name)) {
          console.info('get WebViewControllerDownloadTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push WebViewControllerDownloadTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebViewControllerDownloadTest page error: ' + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('web beforeEach start');
      await Utils.sleep(4000);
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebViewControllerDownloadTest afterEach start');
      Utils.emitEvent('', 11)
      await Utils.sleep(4000);
      console.info('WebViewControllerDownloadTest afterEach end');
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBVIEWCONTROLLER_SETDOWNLOADDELEGATE_0100
    * @tc.name        : testSetDownloadDelegate001
    * @tc.desc        : test setDownloadDelegate
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testSetDownloadDelegate001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('testSetDownloadDelegate001', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testSetDownloadDelegate001', true, 79520, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBVIEWCONTROLLER_STARTDOWNLOAD_0100
    * @tc.name        : testStartDownload001
    * @tc.desc        : test startDownload
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testStartDownload001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testStartDownload001', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testStartDownload001', true, 79530, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADSTATE_0100
    * @tc.name        : testWebDownloadState001
    * @tc.desc        : test WebDownloadState.IN_PROGRESS
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadState001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState001', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testWebDownloadState001', webView.WebDownloadState.IN_PROGRESS, 79540, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADSTATE_0200
    * @tc.name        : testWebDownloadState002
    * @tc.desc        : test WebDownloadState.COMPLETED
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadState002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState002', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testWebDownloadState002', webView.WebDownloadState.COMPLETED, 79542, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADSTATE_0300
    * @tc.name        : testWebDownloadState003
    * @tc.desc        : test WebDownloadState.CANCELED
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadState003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState003', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testWebDownloadState003', webView.WebDownloadState.CANCELED, 79544, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADSTATE_0400
    * @tc.name        : testWebDownloadState004
    * @tc.desc        : test WebDownloadState.INTERRUPTED
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadState004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState004', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testWebDownloadState004', webView.WebDownloadState.INTERRUPTED, 79546, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADSTATE_0500
    * @tc.name        : testWebDownloadState005
    * @tc.desc        : test WebDownloadState.PENDING
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadState005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState005', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testWebDownloadState005', webView.WebDownloadState.PENDING, 79548, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADSTATE_0600
    * @tc.name        : testWebDownloadState006
    * @tc.desc        : test WebDownloadState.PAUSED
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadState006', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebDownloadState006', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testWebDownloadState006', webView.WebDownloadState.PAUSED, 79550, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADITEM_RESUME_0100
    * @tc.name        : testResume001
    * @tc.desc        : test WebDownloadItem.resume
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testResume001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testResume001', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testResume001', webView.WebDownloadState.IN_PROGRESS, 79692, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADDELEGATE_ONBEFOREDOWNLOAD_0100
    * @tc.name        : testOnBeforeDownload001
    * @tc.desc        : test WebDownloadDelegate.onBeforeDownload
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnBeforeDownload001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testOnBeforeDownload001', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testOnBeforeDownload001', true, 79700, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADUPDATED_0100
    * @tc.name        : testOnDownloadUpdated001
    * @tc.desc        : test WebDownloadDelegate.onDownloadUpdated
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnDownloadUpdated001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testOnDownloadUpdated001', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testOnDownloadUpdated001', true, 79702, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADFINISH_0100
    * @tc.name        : testOnDownloadFinish001
    * @tc.desc        : test WebDownloadDelegate.onDownloadFinish
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnDownloadFinish001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testOnDownloadFinish001', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testOnDownloadFinish001', true, 79704, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADMANAGER_SETDOWNLOADDELEGATE_0100
    * @tc.name        : testWebDownloadManagerSetDownloadDelegate001
    * @tc.desc        : test WebDownloadManager.setDownloadDelegate
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadManagerSetDownloadDelegate001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: Function) => {
      Utils.emitEvent('testWebDownloadManagerSetDownloadDelegate001', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testWebDownloadManagerSetDownloadDelegate001', true, 79750, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADMANAGER_RESUMEDOWNLOAD_0100
    * @tc.name        : testResumeDownload001
    * @tc.desc        : test WebDownloadManager.resumeDownload
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testResumeDownload001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testResumeDownload001', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testResumeDownload001', webView.WebDownloadState.IN_PROGRESS, 79752, done);
      sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
    })

  })
}