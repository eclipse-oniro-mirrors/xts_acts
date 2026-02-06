/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import cacheDownload from "@ohos.request.cacheDownload";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function requestCacheDownloadSpecialTest() {
  describe('requestCacheDownloadSpecialJSTest', () => {

    console.info('====>requestCacheDownloadSpecialJSTest Test start');
    /**
     * @tc.name   SUB_Request_cacheDownload_maintenance_1400
     * @tc.number SUB_Request_cacheDownload_maintenance_1400
     * @tc.desc   not through DNS， get ip in downloadInfo.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_Request_cacheDownload_maintenance_1400', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_maintenance_1400 is starting-----------------------");
      cacheDownload.setDownloadInfoListSize(1);
      let url: string = 'https://murphy1984.gitee.com/murphy1984/download/releases/download/V1/testxxx0014.jpg';
      let downloadInfo1: cacheDownload.DownloadInfo | undefined;
      let onErrorCallback = (err: cacheDownload.DownloadError) => {
        try {
          cacheDownload.offDownloadError(url, onErrorCallback);
          downloadInfo1 = cacheDownload.getDownloadInfo(url);
          console.info(`====>SUB_Request_cacheDownload_maintenance_1400 onErrorCallback ${JSON.stringify(downloadInfo1)}`);
          console.info(`====>SUB_Request_cacheDownload_maintenance_1400 onErrorCallback ${JSON.stringify(downloadInfo1?.network.ip)}`);
          expect(downloadInfo1?.network.ip === undefined).assertTrue();
          done();
        } catch (err) {
          console.info("====>SUB_Request_cacheDownload_maintenance_1400 catch err: " + JSON.stringify(err));
          done();
        }
      }
      cacheDownload.download(url, {});
      console.info(`====>SUB_Request_cacheDownload_maintenance_1400 download success`);
      cacheDownload.onDownloadError(url, onErrorCallback);
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_0800
     * @tc.number SUB_Request_cacheDownload_ListeningError_0800
     * @tc.desc   errorCode is 255.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_Request_cacheDownload_ListeningError_0800', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_0800 is starting-----------------------");
      let url: string = 'htttttps://gitee.com';
      let onErrorCallback = (err: cacheDownload.DownloadError) => {
        try {
          cacheDownload.offDownloadError(url, onErrorCallback);
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0800 onErrorCallback3 errorCode: ${JSON.stringify(err.errorCode)}`)
          expect(err.errorCode === 255).assertTrue();
          done();
        } catch (err) {
          console.info("====>SUB_Request_cacheDownload_ListeningError_0800 catch err: " + JSON.stringify(err));
          done();
        }
      }
      cacheDownload.download(url, {});
      console.info(`====>SUB_Request_cacheDownload_ListeningError_0800 download success`);
      cacheDownload.onDownloadError(url, onErrorCallback);
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_0900
     * @tc.number SUB_Request_cacheDownload_ListeningError_0900
     * @tc.desc   errorCode is 0.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_Request_cacheDownload_ListeningError_0900', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_0900 is starting-----------------------");
      let url: string = 'https://gitee1111.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      let onErrorCallback = (err: cacheDownload.DownloadError) => {
        try {
          cacheDownload.offDownloadError(url, onErrorCallback);
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0900 onErrorCallback3 errorCode: ${JSON.stringify(err.errorCode)}`)
          expect(err.errorCode === 0).assertTrue();
          done();
        } catch (err) {
          console.info("====>SUB_Request_cacheDownload_ListeningError_0900 catch err: " + JSON.stringify(err));
          done();
        }
      }
      cacheDownload.download(url, {});
      console.info(`====>SUB_Request_cacheDownload_ListeningError_0900 download success`);
      cacheDownload.onDownloadError(url, onErrorCallback);
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_1000
     * @tc.number SUB_Request_cacheDownload_ListeningError_1000
     * @tc.desc   errorCode is 16.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_Request_cacheDownload_ListeningError_1000', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_1000 is starting-----------------------");
      let url: string = 'https://127.0.0.1';
      let onErrorCallback = (err: cacheDownload.DownloadError) => {
        try {
          cacheDownload.offDownloadError(url, onErrorCallback);
          console.info(`====>SUB_Request_cacheDownload_ListeningError_1000 onErrorCallback3 errorCode: ${JSON.stringify(err.errorCode)}`)
          expect(err.errorCode === 16).assertTrue();
          done();
        } catch (err) {
          console.info("====>SUB_Request_cacheDownload_ListeningError_1000 catch err: " + JSON.stringify(err));
          done();
        }
      }
      cacheDownload.download(url, {});
      console.info(`====>SUB_Request_cacheDownload_ListeningError_1000 download success`);
      cacheDownload.onDownloadError(url, onErrorCallback);
    });

  });
}
