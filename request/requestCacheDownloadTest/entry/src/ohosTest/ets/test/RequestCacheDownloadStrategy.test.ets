/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export default function requestCacheDownloadStrategyUnitTest() {
  describe('requestCacheDownloadStrategyJSTest', () => {

    /**
     * beforeAll: Prerequisites at the test case level, which are executed before all test case is executed.
     */
    beforeAll(async (done:Function) => {
      cacheDownload.clearMemoryCache();
      console.info("====>afterEach clearMemoryCache success");
      cacheDownload.clearFileCache();
      console.info("====>afterEach clearFileCache success");
      let url1: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      let downloadInfo1: cacheDownload.DownloadInfo | undefined;
      let count1: number = 0;
      cacheDownload.setDownloadInfoListSize(1);
      console.info("====>beforeAll setDownloadInfoListSize 1 success");
      cacheDownload.download(url1, {cacheStrategy: cacheDownload.CacheStrategy.LAZY});
      let t1 = setInterval(() => {
        try {
          count1 += 1;
          console.info("====>beforeAll t1 count1: " + count1);
          downloadInfo1 = cacheDownload.getDownloadInfo(url1);
          console.info(`====>beforeAll t1 downloadInfo1: ${downloadInfo1};`);
          if(downloadInfo1 !== undefined){
            clearInterval(t1);
            console.info(`====>beforeAll t1 cacheDownload count1 success`);
            done();
          }
          if (count1 === 14){
            clearInterval(t1)
            console.info("====>beforeAll t1 cacheDownload timeout");
            done();
          }
        }catch (err) {
          clearInterval(t1);
          console.info("====>beforeAll t1 catch err: " + JSON.stringify(err));
          done();
        }
      }, 1000)
    })

    console.info('====>requestCacheDownloadJSTest Test start');
    /**
     * @tc.number SUB_Request_cacheDownload_cacheStrategy_0100
     * @tc.name   SUB_Request_cacheDownload_cacheStrategy_0100
     * @tc.desc   LAZY strategy can load twice.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Request_cacheDownload_cacheStrategy_0100', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_cacheStrategy_0100 is starting-----------------------");
      let cacheDownloadOptions: cacheDownload.CacheDownloadOptions = {
        cacheStrategy: cacheDownload.CacheStrategy.LAZY,
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      try {
        cacheDownload.setDownloadInfoListSize(1);
        console.info("====>SUB_Request_cacheDownload_cacheStrategy_0100 setDownloadInfoListSize 1 success");
        let downloadInfo1: cacheDownload.DownloadInfo | undefined;
        downloadInfo1 = cacheDownload.getDownloadInfo(url);
        console.info(`====>SUB_Request_cacheDownload_cacheStrategy_0100 getDownloadInfo1 success: ${JSON.stringify(downloadInfo1)}`);
        cacheDownload.download(url, cacheDownloadOptions);
        console.info("====>SUB_Request_cacheDownload_cacheStrategy_0100 getDownloadInfo first success");
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            expect(downloadInfo1 !== undefined).assertTrue();
            console.info("====>SUB_Request_cacheDownload_cacheStrategy_0100 downloadInfo1 not undefined");
            let downloadInfo2: cacheDownload.DownloadInfo | undefined;
            downloadInfo2 = cacheDownload.getDownloadInfo(url);
            console.info(`====>SUB_Request_cacheDownload_cacheStrategy_0100 getDownloadInfo2 success: ${JSON.stringify(downloadInfo2)}`);
            expect(JSON.stringify(downloadInfo1) === JSON.stringify(downloadInfo2)).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_cacheStrategy_0100 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_cacheStrategy_0100 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_cacheStrategy_0200
     * @tc.name   SUB_Request_cacheDownload_cacheStrategy_0200
     * @tc.desc   FORCE strategy can load twice.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Request_cacheDownload_cacheStrategy_0200', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_cacheStrategy_0200 is starting-----------------------");
      let cacheDownloadOptions: cacheDownload.CacheDownloadOptions = {
        cacheStrategy: cacheDownload.CacheStrategy.FORCE,
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      try {
        cacheDownload.setDownloadInfoListSize(1);
        console.info("====>SUB_Request_cacheDownload_cacheStrategy_0200 setDownloadInfoListSize 1 success");
        let downloadInfo1: cacheDownload.DownloadInfo | undefined;
        downloadInfo1 = cacheDownload.getDownloadInfo(url);
        console.info(`====>SUB_Request_cacheDownload_cacheStrategy_0200 getDownloadInfo1 success: ${JSON.stringify(downloadInfo1)}`);
        cacheDownload.download(url, cacheDownloadOptions);
        console.info("====>SUB_Request_cacheDownload_cacheStrategy_0200 getDownloadInfo first success");
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            expect(downloadInfo1 !== undefined).assertTrue();
            console.info("====>SUB_Request_cacheDownload_cacheStrategy_0200 downloadInfo1 not undefined");
            let downloadInfo2: cacheDownload.DownloadInfo | undefined;
            downloadInfo2 = cacheDownload.getDownloadInfo(url);
            console.info(`====>SUB_Request_cacheDownload_cacheStrategy_0200 getDownloadInfo2 success: ${JSON.stringify(downloadInfo2)}`);
            expect(JSON.stringify(downloadInfo1) !== JSON.stringify(downloadInfo2)).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_cacheStrategy_0200 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_cacheStrategy_0200 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_cacheStrategy_0300
     * @tc.name   SUB_Request_cacheDownload_cacheStrategy_0300
     * @tc.desc   undefined strategy can load twice.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Request_cacheDownload_cacheStrategy_0300', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_cacheStrategy_0300 is starting-----------------------");
      let cacheDownloadOptions: cacheDownload.CacheDownloadOptions = {
        cacheStrategy: undefined,
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      try {
        cacheDownload.setDownloadInfoListSize(1);
        console.info("====>SUB_Request_cacheDownload_cacheStrategy_0300 setDownloadInfoListSize 1 success");
        let downloadInfo1: cacheDownload.DownloadInfo | undefined;
        downloadInfo1 = cacheDownload.getDownloadInfo(url);
        console.info(`====>SUB_Request_cacheDownload_cacheStrategy_0300 getDownloadInfo1 success: ${JSON.stringify(downloadInfo1)}`);
        cacheDownload.download(url, cacheDownloadOptions);
        console.info("====>SUB_Request_cacheDownload_cacheStrategy_0300 getDownloadInfo first success");
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            expect(downloadInfo1 !== undefined).assertTrue();
            console.info("====>SUB_Request_cacheDownload_cacheStrategy_0300 downloadInfo1 not undefined");
            let downloadInfo2: cacheDownload.DownloadInfo | undefined;
            downloadInfo2 = cacheDownload.getDownloadInfo(url);
            console.info(`====>SUB_Request_cacheDownload_cacheStrategy_0300 getDownloadInfo2 success: ${JSON.stringify(downloadInfo2)}`);
            expect(JSON.stringify(downloadInfo1) !== JSON.stringify(downloadInfo2)).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_cacheStrategy_0300 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_cacheStrategy_0300 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_cacheStrategy_0400
     * @tc.name   SUB_Request_cacheDownload_cacheStrategy_0400
     * @tc.desc   other number strategy can load twice.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Request_cacheDownload_cacheStrategy_0400', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_cacheStrategy_0400 is starting-----------------------");
      let cacheDownloadOptions: cacheDownload.CacheDownloadOptions = {
        cacheStrategy: 8,
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      try {
        cacheDownload.setDownloadInfoListSize(1);
        console.info(`====>SUB_Request_cacheDownload_cacheStrategy_0400 downloadOptions: ${JSON.stringify(cacheDownloadOptions)}`);
        let downloadInfo1: cacheDownload.DownloadInfo | undefined;
        downloadInfo1 = cacheDownload.getDownloadInfo(url);
        console.info(`====>SUB_Request_cacheDownload_cacheStrategy_0400 getDownloadInfo1 success: ${JSON.stringify(downloadInfo1)}`);
        cacheDownload.download(url, cacheDownloadOptions);
        console.info("====>SUB_Request_cacheDownload_cacheStrategy_0400 getDownloadInfo first success");
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            expect(downloadInfo1 !== undefined).assertTrue();
            console.info("====>SUB_Request_cacheDownload_cacheStrategy_0400 downloadInfo1 not undefined");
            let downloadInfo2: cacheDownload.DownloadInfo | undefined;
            downloadInfo2 = cacheDownload.getDownloadInfo(url);
            console.info(`====>SUB_Request_cacheDownload_cacheStrategy_0400 getDownloadInfo2 success: ${JSON.stringify(downloadInfo2)}`);
            expect(JSON.stringify(downloadInfo1) !== JSON.stringify(downloadInfo2)).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_cacheStrategy_0400 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_cacheStrategy_0400 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

  });
}
