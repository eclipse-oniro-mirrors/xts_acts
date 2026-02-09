/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { BusinessError } from '@kit.BasicServicesKit';

export default function requestCacheDownloadNormalUnitTest() {
  describe('requestCacheDownloadNormalJSTest', () => {
    console.info('====>requestCacheDownloadNormalJSTest Test start');

    /**
     * @tc.name   SUB_Request_cacheDownloadNormal_0100
     * @tc.number SUB_Request_cacheDownloadNormal_0100
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Request_cacheDownloadNormal_0100', Level.LEVEL0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownloadNormal_0100 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.download(url, downloadOptions);
        console.info("====>SUB_Request_cacheDownloadNormal_0100 download success url: " + url);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownloadNormal_0100 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_maintenance_0100
     * @tc.number SUB_Request_cacheDownload_maintenance_0100
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Request_cacheDownload_maintenance_0100', Level.LEVEL0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_maintenance_0100 is starting-----------------------");
      try {
        let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
        let downloadInfo: cacheDownload.DownloadInfo | undefined = cacheDownload.getDownloadInfo(url);
        console.info("====>SUB_Request_cacheDownload_maintenance_0100 downloadInfo success: " + downloadInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_maintenance_0100 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

  });
}
