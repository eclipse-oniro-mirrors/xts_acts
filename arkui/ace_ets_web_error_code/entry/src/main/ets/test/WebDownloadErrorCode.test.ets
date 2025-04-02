/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export default function webDownloadErrorCode() {

  describe('WebDownloadErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webDownloadErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webDownloadErrorCode state success " + JSON.stringify(pages));
        if (!("webDownloadErrorCode" == pages.name)) {
          console.info("get webDownloadErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webDownloadErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webDownloadErrorCode page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("webDownloadErrorCode beforeEach start");
      await Utils.sleep(1000);
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebDownloadErrorCodeTestSuite afterEach start");
      Utils.emitEvent('', 11)
      await Utils.sleep(3000);
      console.info("WebDownloadErrorCodeTestSuite afterEach end");
      done();
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_SETDOWNLOADDELEGATE_0100
     * @tc.name       : testSetDownloadDelegate001
     * @tc.desc       : test setDownloadDelegate error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSetDownloadDelegate001', 0, async (done: Function) => {
      Utils.emitEvent("testSetDownloadDelegate001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetDownloadDelegate001", '17100001', 60000, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_STARTDOWNLOAD_0100
     * @tc.name       : testStartDownload001
     * @tc.desc       : test startDownload error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStartDownload001', 0, async (done: Function) => {
      Utils.emitEvent("testStartDownload001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStartDownload001", '17100001', 60010, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_STARTDOWNLOAD_0200
     * @tc.name       : testStartDownload002
     * @tc.desc       : test startDownload error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStartDownload002', 0, async (done: Function) => {
      Utils.emitEvent("testStartDownload002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStartDownload002", '17100002', 60011, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_STARTDOWNLOAD_0300
     * @tc.name       : testStartDownload003
     * @tc.desc       : test startDownload error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStartDownload003', 0, async (done: Function) => {
      Utils.emitEvent("testStartDownload003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStartDownload003", '17100002', 60012, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_STARTDOWNLOAD_0400
     * @tc.name       : testStartDownload004
     * @tc.desc       : test startDownload error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStartDownload004', 0, async (done: Function) => {
      Utils.emitEvent("testStartDownload004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStartDownload004", '17100002', 60013, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_STARTDOWNLOAD_0500
     * @tc.name       : testStartDownload005
     * @tc.desc       : test startDownload error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStartDownload005', 0, async (done: Function) => {
      Utils.emitEvent("testStartDownload005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStartDownload005", '17100002', 60014, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_STARTDOWNLOAD_0600
     * @tc.name       : testStartDownload006
     * @tc.desc       : test startDownload error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStartDownload006', 0, async (done: Function) => {
      Utils.emitEvent("testStartDownload006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStartDownload006", '17100002', 60015, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_PAUSE_0100
     * @tc.name       : testWebDownloadPause001
     * @tc.desc       : test WebDownloadItem pause error when download not start
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWebDownloadPause001', 0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadPause001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadPause001", '17100019', 60020, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_PAUSE_0200
     * @tc.name       : testWebDownloadPause002
     * @tc.desc       : test WebDownloadItem pause error when download failed
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWebDownloadPause002', 0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadPause002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadPause002", '17100019', 60022, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_PAUSE_0300
     * @tc.name       : testWebDownloadPause003
     * @tc.desc       : test WebDownloadItem pause error when download finish
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWebDownloadPause003', 0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadPause003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadPause003", '17100019', 60024, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_RESUME_0100
     * @tc.name       : testWebDownloadResume001
     * @tc.desc       : test WebDownloadItem resume error when download not start
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWebDownloadResume001', 0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadResume001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadResume001", '17100016', 60030, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_RESUME_0200
     * @tc.name       : testWebDownloadResume002
     * @tc.desc       : test WebDownloadItem resume error when downloading
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWebDownloadResume002', 0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadResume002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadResume002", '17100016', 60032, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_RESUME_0300
     * @tc.name       : testWebDownloadResume003
     * @tc.desc       : test WebDownloadItem resume error when download failed
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWebDownloadResume003', 0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadResume003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadResume003", '17100016', 60034, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_RESUME_0400
     * @tc.name       : testWebDownloadResume004
     * @tc.desc       : test WebDownloadItem resume error when download finish
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWebDownloadResume004', 0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadResume004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadResume004", '17100016', 60036, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_WEBDOWNLOADMANAGER_RESUMEDOWNLOAD_0100
     * @tc.name       : testWebDownloadManagerResumeDownload001
     * @tc.desc       : test WebDownloadManager resumeDownload error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWebDownloadManagerResumeDownload001', 0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadManagerResumeDownload001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadManagerResumeDownload001", '17100018', 60040, done);
      sendEventByKey('WebDownloadErrorCodeButton', 10, '');
    })

  })
}
