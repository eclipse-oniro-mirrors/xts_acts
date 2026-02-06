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
import Server from '../common/Server'
import fs from  '@ohos.file.fs';

export default function requestCacheDownloadHttpUnitTest() {
  describe('requestCacheDownloadHttpJSTest', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done:Function) => {
      try {
        console.info('====>beforeAll startServer ');
        new Server().startServer();
        console.info('====>beforeAll startServer success');
        let t = setTimeout(() => {
          clearTimeout(t);
          console.info('====>beforeAll end');
          done();
        }, 2000)
      }catch (err) {
        console.info('====>beforeAll err: ' + JSON.stringify(err));
        done()
      }
    })

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(async (done: Function) => {
      console.info('====>beforeEach: setFileCacheSize start.');
      cacheDownload.setFileCacheSize(0);
      console.info('====>beforeEach: setFileCacheSize success.');
      done();
    });

    console.info('====>requestCacheDownloadHttpJSTest Test start');
    /**
     * @tc.name   SUB_Request_cacheDownload_httpHeaders_0100
     * @tc.number SUB_Request_cacheDownload_httpHeaders_0100
     * @tc.desc   Isolated invalid byte.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_cacheDownload_httpHeaders_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_httpHeaders_0100 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string>;
      }
      try {
        cacheDownload.setFileCacheSize(1024);
        console.info('====>SUB_Request_cacheDownload_httpHeaders_0100 setFileCacheSize success.');
        let path: string = '/data/storage/el2/base/cache/preload_caches/' +
          'd30a576c0318716717366ab932e3d7dfbc4009a5bc10176403b60892912f070e_F';
        let url: string = 'http://127.0.0.1:8080';
        let downloadOptions = new cacheDownloadOptions();
        downloadOptions.headers = {'test1': 'cacheDownloadHttpHeaders0100'};
        cacheDownload.download(url, downloadOptions);
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_httpHeaders_0100 ifExit: " + ifExit);
            expect(ifExit).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_httpHeaders_0100 err: " + JSON.stringify(err));
            done();
          }
        }, 1000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_httpHeaders_0100 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_httpHeaders_0200
     * @tc.number SUB_Request_cacheDownload_httpHeaders_0200
     * @tc.desc   The second byte is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Request_cacheDownload_httpHeaders_0200', Level.LEVEL0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_httpHeaders_0200 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string>;
      }
      try {
        cacheDownload.setFileCacheSize(1024);
        console.info('====>SUB_Request_cacheDownload_httpHeaders_0200 setFileCacheSize success.');
        let path: string = '/data/storage/el2/base/cache/preload_caches/' +
          'd30a576c0318716717366ab932e3d7dfbc4009a5bc10176403b60892912f070e_F';
        let url: string = 'http://127.0.0.1:8080';
        let downloadOptions = new cacheDownloadOptions();
        downloadOptions.headers = {'test2': 'cacheDownloadHttpHeaders0200'};
        cacheDownload.download(url, downloadOptions);
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_httpHeaders_0200 ifExit: " + ifExit);
            expect(ifExit).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_httpHeaders_0200 err: " + JSON.stringify(err));
            done();
          }
        }, 1000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_httpHeaders_0200 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_httpHeaders_0300
     * @tc.number SUB_Request_cacheDownload_httpHeaders_0300
     * @tc.desc   SInvalid multi-byte encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Request_cacheDownload_httpHeaders_0300', Level.LEVEL0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_httpHeaders_0300 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string>;
      }
      try {
        cacheDownload.setFileCacheSize(1024);
        console.info('====>SUB_Request_cacheDownload_httpHeaders_0300 setFileCacheSize success.');
        let path: string = '/data/storage/el2/base/cache/preload_caches/' +
          'd30a576c0318716717366ab932e3d7dfbc4009a5bc10176403b60892912f070e_F';
        let url: string = 'http://127.0.0.1:8080';
        let downloadOptions = new cacheDownloadOptions();
        downloadOptions.headers = {'test3': 'cacheDownloadHttpHeaders0300'};
        cacheDownload.download(url, downloadOptions);
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_httpHeaders_0300 ifExit: " + ifExit);
            expect(ifExit).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_httpHeaders_0300 err: " + JSON.stringify(err));
            done();
          }
        }, 1000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_httpHeaders_0300 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_httpHeaders_0400
     * @tc.number SUB_Request_cacheDownload_httpHeaders_0400
     * @tc.desc   Encoding exceeds Unicode range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Request_cacheDownload_httpHeaders_0400', Level.LEVEL0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_httpHeaders_0400 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string>;
      }
      try {
        cacheDownload.setFileCacheSize(1024);
        console.info('====>SUB_Request_cacheDownload_httpHeaders_0400 setFileCacheSize success.');
        let path: string = '/data/storage/el2/base/cache/preload_caches/' +
          'd30a576c0318716717366ab932e3d7dfbc4009a5bc10176403b60892912f070e_F';
        let url: string = 'http://127.0.0.1:8080';
        let downloadOptions = new cacheDownloadOptions();
        downloadOptions.headers = {'test4': 'cacheDownloadHttpHeaders0400'};
        cacheDownload.download(url, downloadOptions);
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_httpHeaders_0400 ifExit: " + ifExit);
            expect(ifExit).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_httpHeaders_0400 err: " + JSON.stringify(err));
            done();
          }
        }, 1000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_httpHeaders_0400 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_httpHeaders_0500
     * @tc.number SUB_Request_cacheDownload_httpHeaders_0500
     * @tc.desc   special characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Request_cacheDownload_httpHeaders_0500', Level.LEVEL0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_httpHeaders_0500 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string>;
      }
      try {
        cacheDownload.setFileCacheSize(1024);
        console.info('====>SUB_Request_cacheDownload_httpHeaders_0500 setFileCacheSize success.');
        let path: string = '/data/storage/el2/base/cache/preload_caches/' +
          'd30a576c0318716717366ab932e3d7dfbc4009a5bc10176403b60892912f070e_F';
        let url: string = 'http://127.0.0.1:8080';
        let downloadOptions = new cacheDownloadOptions();
        downloadOptions.headers = {'test5': ':"!@#$%^&*`<>(){}[]'};
        cacheDownload.download(url, downloadOptions);
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_httpHeaders_0500 ifExit: " + ifExit);
            expect(ifExit).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_httpHeaders_0500 err: " + JSON.stringify(err));
            done();
          }
        }, 1000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_httpHeaders_0500 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_maintenance_1500
     * @tc.number SUB_Request_cacheDownload_maintenance_1500
     * @tc.desc   get local ip in downloadInfo.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_Request_cacheDownload_maintenance_1500', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_maintenance_1500 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string>;
      }
      cacheDownload.setDownloadInfoListSize(1);
      let url: string = 'http://127.0.0.1:8080';
      let downloadInfo1: cacheDownload.DownloadInfo | undefined;
      let downloadOptions = new cacheDownloadOptions();
      let onSuccessCallback = () => {
        try {
          cacheDownload.offDownloadSuccess(url, onSuccessCallback);
          downloadInfo1 = cacheDownload.getDownloadInfo(url);
          console.info(`====>SUB_Request_cacheDownload_maintenance_1500 onSuccessCallback ${JSON.stringify(downloadInfo1)}}`);
          expect(downloadInfo1?.network.ip === '127.0.0.1').assertTrue();
          done();
        } catch (err) {
          console.info("====>SUB_Request_cacheDownload_maintenance_1500 catch err: " + JSON.stringify(err));
          done();
        }
      }
      downloadOptions.headers = {'test6': 'cacheDownloadMaintenance1500'};
      cacheDownload.download(url, downloadOptions);
      console.info(`====>SUB_Request_cacheDownload_maintenance_1500 download success`);
      cacheDownload.onDownloadSuccess(url, onSuccessCallback);
    });

  });
}
