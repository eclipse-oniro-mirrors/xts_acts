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

export default function requestCacheDownloadUnitTest() {
  describe('requestCacheDownloadJSTest', () => {
    console.info('====>requestCacheDownloadJSTest Test start');
    /**
     * @tc.number SUB_Request_cacheDownload_0100
     * @tc.name SUB_Request_cacheDownload_0100
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_0100 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      let num: number = 1 * 1024 * 1024 * 1024
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.setMemoryCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_0100 setMemoryCacheSize success");
        cacheDownload.setFileCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_0100 setFileCacheSize success");
        cacheDownload.download(url, downloadOptions);
        console.info("====>SUB_Request_cacheDownload_0100 download success url: " + url);
        cacheDownload.cancel(url);
        console.info("====>SUB_Request_cacheDownload_0100 cancel success url: " + url);
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_0100 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_0200
     * @tc.name SUB_Request_cacheDownload_0200
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Request_cacheDownload_0200', Level.LEVEL0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_0200 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      let text: string = ''.padEnd(8175, 'cacheDownload')
      let url: string = 'https://gitee' + text + '.com';
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.download(url, downloadOptions);
        console.info("====>SUB_Request_cacheDownload_0200 download success url length: " + url.length);
        expect(url.length).assertEqual(8192);
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_0200 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_0300
     * @tc.name SUB_Request_cacheDownload_0300
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_0300', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_0300 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      let text: string = ''.padEnd(8176, 'cacheDownload')
      let url: string = 'https://gitee' + text + '.com';
      try {
        console.info("====>SUB_Request_cacheDownload_0300 download success url length: " + url.length);
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.download(url, downloadOptions);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_0300 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_0400
     * @tc.name SUB_Request_cacheDownload_0400
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_0400', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_0400 is starting-----------------------");
      let text: string = ''.padEnd(8175, 'cacheDownload')
      let url: string = 'https://gitee' + text + '.com';
      try {
        cacheDownload.cancel(url);
        console.info("====>SUB_Request_cacheDownload_0400 cancel success url length: " + url.length);
        expect(url.length).assertEqual(8192);
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_0400 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_0500
     * @tc.name SUB_Request_cacheDownload_0500
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_0500', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_0500 is starting-----------------------");
      let text: string = ''.padEnd(8176, 'cacheDownload')
      let url: string = 'https://gitee' + text + '.com';
      try {
        console.info("====>SUB_Request_cacheDownload_0500 cancel success url length: " + url.length);
        cacheDownload.cancel(url);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_0500 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_0600
     * @tc.name SUB_Request_cacheDownload_0600
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_0600', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_0600 is starting-----------------------");
      let num: number = 1 * 1024 * 1024 * 1024
      try {
        cacheDownload.setMemoryCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_0600 setMemoryCacheSize success num: " + num);
        expect(num).assertEqual(1073741824);
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_0600 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_0700
     * @tc.name SUB_Request_cacheDownload_0700
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_0700', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_0700 is starting-----------------------");
      let num: number = 1 * 1024 * 1024 * 1024 + 1
      try {
        console.info("====>SUB_Request_cacheDownload_0700 setMemoryCacheSize success num: " + num);
        cacheDownload.setMemoryCacheSize(num);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_0700 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_0800
     * @tc.name SUB_Request_cacheDownload_0800
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_0800', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_0800 is starting-----------------------");
      let num: number = 4 * 1024 * 1024 * 1024
      try {
        cacheDownload.setFileCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_0800 setMemoryCacheSize success num: " + num);
        expect(num).assertEqual(4294967296);
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_0800 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_0100
     * @tc.name SUB_Request_cacheDownload_0100
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_0900', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_0700 is starting-----------------------");
      let num: number = 4 * 1024 * 1024 * 1024 + 1
      try {
        console.info("====>SUB_Request_cacheDownload_0700 setMemoryCacheSize success num: " + num);
        cacheDownload.setFileCacheSize(num);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_0700 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

  });
}
