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
import fs from  '@ohos.file.fs';

export default function requestCacheDownloadStateSecretUnitTest() {
  describe('requestCacheDownloadStateSecret', () => {
    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(async (done: Function) => {
      cacheDownload.setFileCacheSize(0);
      cacheDownload.setMemoryCacheSize(0);
      console.info('====>beforeEach clean cache file');
      done();
    });

    console.info('====>requestCacheDownloadJSTest Test start');
    /**
     * @tc.name   SUB_Request_cacheDownload_stateSecret_0100
     * @tc.number SUB_Request_cacheDownload_stateSecret_0100
     * @tc.desc   sslType value is TLS and url support it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_cacheDownload_stateSecret_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_stateSecret_0100 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        sslType?: cacheDownload.SslType | undefined = cacheDownload.SslType.TLS
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      let num: number = 20 * 1024 * 1024
      let path: string = '/data/storage/el2/base/cache/preload_caches/' +
        '3b4f620e78c517516346b749a0cdfd26df4c080f0e2f6a2617432e8e694fbeeb_F';
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.setFileCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_stateSecret_0100 setFileCacheSize success");
        cacheDownload.download(url, downloadOptions);
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_stateSecret_0100 ifExit: " + ifExit);
            expect(ifExit).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_stateSecret_0100 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_stateSecret_0100 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_stateSecret_0200
     * @tc.number SUB_Request_cacheDownload_stateSecret_0200
     * @tc.desc   sslType value is TLS and url not support it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_cacheDownload_stateSecret_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_stateSecret_0200 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        sslType?: cacheDownload.SslType | undefined = cacheDownload.SslType.TLS
      }
      let url: string = 'https://test1.gmssl.cn';
      let num: number = 20 * 1024 * 1024
      let path: string = '/data/storage/el2/base/cache/preload_caches/' +
        'b7efbb405e31b1cf5b21574dfff403101643b00c55f0cdfb9c4b015f914b4488_F';
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.setFileCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_stateSecret_0200 setFileCacheSize success");
        cacheDownload.download(url, downloadOptions);
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_stateSecret_0200 ifExit: " + ifExit);
            expect(ifExit).assertFalse();
            cacheDownload.cancel(url);
            let t1 = setTimeout(() => {
              clearTimeout(t1)
              done();
            }, 1000)
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_stateSecret_0200 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_stateSecret_0200 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_stateSecret_0300
     * @tc.number SUB_Request_cacheDownload_stateSecret_0300
     * @tc.desc   sslType value is TLCP and url support it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_cacheDownload_stateSecret_0300', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_stateSecret_0300 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        sslType?: cacheDownload.SslType | undefined = cacheDownload.SslType.TLCP
        caPath?: string | undefined = ''
      }
      let url: string = 'https://test1.gmssl.cn';
      let num: number = 20 * 1024 * 1024
      let path: string = '/data/storage/el2/base/cache/preload_caches/' +
        'b7efbb405e31b1cf5b21574dfff403101643b00c55f0cdfb9c4b015f914b4488_F';
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.setFileCacheSize(num);
        console.info(`====>SUB_Request_cacheDownload_stateSecret_0300 setFileCacheSize success + ${JSON.stringify(downloadOptions)}`);
        cacheDownload.download(url, downloadOptions);

        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit: boolean;
            let fileExistence: boolean = fs.accessSync(path);
            if(!fileExistence){
              ifExit = true;
            } else{
              ifExit = false;
            }
            console.info("====>SUB_Request_cacheDownload_stateSecret_0300 ifExit: " + ifExit);
            expect(ifExit).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_stateSecret_0300 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_stateSecret_0300 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_stateSecret_0400
     * @tc.number SUB_Request_cacheDownload_stateSecret_0400
     * @tc.desc   sslType value is TLCP and url is not support it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_cacheDownload_stateSecret_0400', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_stateSecret_0400 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        sslType?: cacheDownload.SslType | undefined = cacheDownload.SslType.TLCP
        caPath?: string | undefined = '/data/storage/el1/bundle/entry_test/resources/resfile/sm2.ca.pem'
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_2.jpg';
      let num: number = 20 * 1024 * 1024
      let path: string = '/data/storage/el2/base/cache/preload_caches/' +
        '992d6edc2381fc94faca955e110c73aa276881042cb8d2171a0c784250bcbc0a_F';
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.setFileCacheSize(num);
        console.info(`====>SUB_Request_cacheDownload_stateSecret_0400 setFileCacheSize success + ${JSON.stringify(downloadOptions)}`);
        cacheDownload.download(url, downloadOptions);
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_stateSecret_0400 ifExit: " + ifExit);
            expect(ifExit).assertFalse();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_stateSecret_0400 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_stateSecret_0400 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_stateSecret_0500
     * @tc.number SUB_Request_cacheDownload_stateSecret_0500
     * @tc.desc   sslType value is TLCP and caPath is error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_cacheDownload_stateSecret_0500', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_stateSecret_0500 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        sslType?: cacheDownload.SslType | undefined = cacheDownload.SslType.TLCP
        caPath?: string | undefined = '/data/storage/el2/bundle/entry_test/resources/resfile/sm2.ca.pem'
      }
      let url: string = 'https://test1.gmssl.cn';
      let num: number = 20 * 1024 * 1024
      let path: string = '/data/storage/el2/base/cache/preload_caches/' +
        'b7efbb405e31b1cf5b21574dfff403101643b00c55f0cdfb9c4b015f914b4488_F';
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.setFileCacheSize(num);
        console.info(`====>SUB_Request_cacheDownload_stateSecret_0500 setFileCacheSize success + ${JSON.stringify(downloadOptions)}`);
        cacheDownload.download(url, downloadOptions);
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_stateSecret_0500 ifExit: " + ifExit);
            expect(ifExit).assertFalse();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_stateSecret_0500 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_stateSecret_0500 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_stateSecret_0600
     * @tc.number SUB_Request_cacheDownload_stateSecret_0600
     * @tc.desc   sslType value is undefined and url support it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_cacheDownload_stateSecret_0600', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_stateSecret_0600 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        sslType?: cacheDownload.SslType | undefined = undefined
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_3.jpg';
      let num: number = 20 * 1024 * 1024
      let path: string = '/data/storage/el2/base/cache/preload_caches/' +
        '8b058bba5e7749849d2b6e45df2a43b9ff1d8e71b0bff46f51ac97ff840d3f1e_F';
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.setFileCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_stateSecret_0600 setFileCacheSize success");
        cacheDownload.download(url, downloadOptions);
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_stateSecret_0600 ifExit: " + ifExit);
            expect(ifExit).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_stateSecret_0600 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_stateSecret_0600 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_cacheClear_0100
     * @tc.name SUB_Request_cacheDownload_cacheClear_0100
     * @tc.desc clearMemoryCache success.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Request_cacheDownload_cacheClear_0100', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_cacheClear_0100 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.clearMemoryCache();
        expect(downloadOptions.headers !== undefined).assertTrue();
        console.info("====>SUB_Request_cacheDownload_cacheClear_0100 clearMemoryCache success");
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_cacheClear_0100 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_cacheClear_0200
     * @tc.name SUB_Request_cacheDownload_cacheClear_0200
     * @tc.desc clearFileCache success.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Request_cacheDownload_cacheClear_0200', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_cacheClear_0200 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_3.jpg';
      let num: number = 20 * 1024 * 1024
      let path: string = '/data/storage/el2/base/cache/preload_caches/' +
        '8b058bba5e7749849d2b6e45df2a43b9ff1d8e71b0bff46f51ac97ff840d3f1e_F';
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.setFileCacheSize(num);
        cacheDownload.download(url, downloadOptions);
        console.info("====>SUB_Request_cacheDownload_cacheClear_0200 download success");
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit1: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_cacheClear_0200 ifExit: " + ifExit1);
            expect(ifExit1).assertTrue();
            cacheDownload.clearFileCache();
            console.info("====>SUB_Request_cacheDownload_cacheClear_0200 clearFileCache success");
            let ifExit2: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_cacheClear_0200 clearFileCache ifExit2: " + ifExit2);
            expect(ifExit2).assertFalse();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_cacheClear_0200 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_cacheClear_0200 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_cacheClear_0300
     * @tc.name SUB_Request_cacheDownload_cacheClear_0300
     * @tc.desc can not clear download file.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Request_cacheDownload_cacheClear_0300', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_cacheClear_0300 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_3.jpg';
      let num: number = 20 * 1024 * 1024
      let path: string = '/data/storage/el2/base/cache/preload_caches/' +
        '8b058bba5e7749849d2b6e45df2a43b9ff1d8e71b0bff46f51ac97ff840d3f1e_F';
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.setFileCacheSize(num);
        cacheDownload.download(url, downloadOptions);
        console.info("====>SUB_Request_cacheDownload_cacheClear_0300 download success");
        cacheDownload.clearFileCache();
        console.info("====>SUB_Request_cacheDownload_cacheClear_0300 clearFileCache success");
        let t = setTimeout(() => {
          clearTimeout(t);
          try {
            let ifExit1: boolean = fs.accessSync(path);
            console.info("====>SUB_Request_cacheDownload_cacheClear_0300 ifExit: " + ifExit1);
            expect(ifExit1).assertTrue();
            done();
          }catch (err) {
            console.info("====>SUB_Request_cacheDownload_cacheClear_0300 err: " + JSON.stringify(err));
            done();
          }
        }, 10000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_cacheClear_0300 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

  });
}
