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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 113920;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webDownloadErrorCode() {

  describe('WebDownloadErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webDownloadErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webDownloadErrorCode state success " + JSON.stringify(pages));
        if (!("webDownloadErrorCode" == pages.name)) {
          console.info("get webDownloadErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webDownloadErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webDownloadErrorCode page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebDownloadErrorCodeButton"), 10000);
      console.log("waitForComponent WebDownloadErrorCodeButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webDownloadErrorCode beforeEach start");
      done();
    })

    /**
     * @tc.name   testSetDownloadDelegate001
     * @tc.number SUB_WEB_ERRORCODE_SETDOWNLOADDELEGATE_0100
     * @tc.desc   test setDownloadDelegate error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetDownloadDelegate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetDownloadDelegate001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetDownloadDelegate001", '17100001', 113930, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testStartDownload001
     * @tc.number SUB_WEB_ERRORCODE_STARTDOWNLOAD_0100
     * @tc.desc   test startDownload error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStartDownload001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStartDownload001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStartDownload001", '17100001', 113940, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testStartDownload002
     * @tc.number SUB_WEB_ERRORCODE_STARTDOWNLOAD_0200
     * @tc.desc   test startDownload error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStartDownload002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStartDownload002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStartDownload002", '17100002', 113950, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testStartDownload003
     * @tc.number SUB_WEB_ERRORCODE_STARTDOWNLOAD_0300
     * @tc.desc   test startDownload error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStartDownload003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStartDownload003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStartDownload003", '17100002', 113960, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testStartDownload004
     * @tc.number SUB_WEB_ERRORCODE_STARTDOWNLOAD_0400
     * @tc.desc   test startDownload error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStartDownload004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStartDownload004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStartDownload004", '17100002', 113970, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testStartDownload005
     * @tc.number SUB_WEB_ERRORCODE_STARTDOWNLOAD_0500
     * @tc.desc   test startDownload error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStartDownload005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStartDownload005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStartDownload005", '17100002', 113980, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testStartDownload006
     * @tc.number SUB_WEB_ERRORCODE_STARTDOWNLOAD_0600
     * @tc.desc   test startDownload error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStartDownload006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStartDownload006", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStartDownload006", '17100002', 113990, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testWebDownloadPause001
     * @tc.number SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_PAUSE_0100
     * @tc.desc   test WebDownloadItem pause error when download not start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadPause001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebDownloadPause001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebDownloadPause001", '17100019', 114000, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testWebDownloadPause002
     * @tc.number SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_PAUSE_0200
     * @tc.desc   test WebDownloadItem pause error when download failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadPause002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebDownloadPause002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebDownloadPause002", '17100019', 114010, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testWebDownloadPause003
     * @tc.number SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_PAUSE_0300
     * @tc.desc   test WebDownloadItem pause error when download finish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadPause003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebDownloadPause003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebDownloadPause003", '17100019', 114020, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testWebDownloadResume001
     * @tc.number SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_RESUME_0100
     * @tc.desc   test WebDownloadItem resume error when download not start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadResume001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebDownloadResume001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebDownloadResume001", '17100016', 114030, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testWebDownloadResume002
     * @tc.number SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_RESUME_0200
     * @tc.desc   test WebDownloadItem resume error when downloading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadResume002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebDownloadResume002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebDownloadResume002", '17100016', 114040, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testWebDownloadResume003
     * @tc.number SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_RESUME_0300
     * @tc.desc   test WebDownloadItem resume error when download failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadResume003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebDownloadResume003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebDownloadResume003", '17100016', 114050, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testWebDownloadResume004
     * @tc.number SUB_WEB_ERRORCODE_WEBDOWNLOADITEM_RESUME_0400
     * @tc.desc   test WebDownloadItem resume error when download finish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadResume004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebDownloadResume004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebDownloadResume004", '17100016', 114060, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })

    /**
     * @tc.name   testWebDownloadManagerResumeDownload001
     * @tc.number SUB_WEB_ERRORCODE_WEBDOWNLOADMANAGER_RESUMEDOWNLOAD_0100
     * @tc.desc   test WebDownloadManager resumeDownload error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadManagerResumeDownload001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebDownloadManagerResumeDownload001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebDownloadManagerResumeDownload001", '17100018', 114070, done);
      await Utils.waitAndClickComponent(driver, "WebDownloadErrorCodeButton");
    })
  })
}