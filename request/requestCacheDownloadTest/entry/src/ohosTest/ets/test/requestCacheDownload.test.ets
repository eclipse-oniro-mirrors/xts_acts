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

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(async (done: Function) => {
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      let url1: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      let url2: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_2.jpg';
      let url3: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_3.jpg';
      let url4: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_4.jpg';
      let url5: string = 'https://gitee.com/murphy1984/download/releases/download/V1/error.jpg';
      let downloadInfo1: cacheDownload.DownloadInfo | undefined;
      let downloadInfo2: cacheDownload.DownloadInfo | undefined;
      let downloadInfo3: cacheDownload.DownloadInfo | undefined;
      let downloadInfo4: cacheDownload.DownloadInfo | undefined;
      let downloadInfo5: cacheDownload.DownloadInfo | undefined;
      let count1: number = 0;
      cacheDownload.setDownloadInfoListSize(5);
      console.info("====>beforeEach setDownloadInfoListSize 5 success");
      let downloadOptions = new cacheDownloadOptions();
      cacheDownload.download(url5, downloadOptions);
      cacheDownload.download(url4, downloadOptions);
      cacheDownload.download(url3, downloadOptions);
      cacheDownload.download(url2, downloadOptions);
      cacheDownload.download(url1, downloadOptions);
      let t1 = setInterval(() => {
        try {
          count1 += 1;
          console.info("====>beforeEach t1 count1: " + count1);
          downloadInfo5 = cacheDownload.getDownloadInfo(url5);
          downloadInfo4 = cacheDownload.getDownloadInfo(url4);
          downloadInfo3 = cacheDownload.getDownloadInfo(url3);
          downloadInfo2 = cacheDownload.getDownloadInfo(url2);
          downloadInfo1 = cacheDownload.getDownloadInfo(url1);
          console.info(`====>beforeEach t1 downloadInfo5: ${downloadInfo5};
                                           downloadInfo4: ${downloadInfo4};
                                           downloadInfo3: ${downloadInfo3};
                                           downloadInfo2: ${downloadInfo2};
                                           downloadInfo1: ${downloadInfo1};`);
          if(downloadInfo1 !== undefined && downloadInfo2 !== undefined &&
            downloadInfo3 !== undefined && downloadInfo4 !== undefined && downloadInfo5!== undefined){
            clearInterval(t1);
            console.info(`====>beforeEach t1 cacheDownload url5 success`);
            done();
          }
          if (count1 === 15){
            clearInterval(t1);
            console.info("====>beforeEach t1 cacheDownload timeout");
            done();
          }
        }catch (err) {
          clearInterval(t1);
          console.info("====>beforeEach t1 catch err: " + JSON.stringify(err));
          done();
        }
      }, 1000)
    });

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

    /**
     * @tc.number SUB_Request_cacheDownload_maintenance_0200
     * @tc.name   SUB_Request_cacheDownload_maintenance_0200
     * @tc.desc   setDownloadInfoListSize param error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_maintenance_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_maintenance_0200 is starting-----------------------");
      try {
        cacheDownload.setDownloadInfoListSize(-1);
        console.info("====>SUB_Request_cacheDownload_maintenance_0200 setDownloadInfoListSize success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_maintenance_0200 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_maintenance_0300
     * @tc.name   SUB_Request_cacheDownload_maintenance_0300
     * @tc.desc   setDownloadInfoListSize param error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_maintenance_0300', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_maintenance_0300 is starting-----------------------");
      try {
        cacheDownload.setDownloadInfoListSize(8193);
        console.info("====>SUB_Request_cacheDownload_maintenance_0300 setDownloadInfoListSize success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_maintenance_0300 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_maintenance_0400
     * @tc.name   SUB_Request_cacheDownload_maintenance_0400
     * @tc.desc   setDownloadInfoListSize param is default number error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_maintenance_0400', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_maintenance_0400 is starting-----------------------");
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      try {
        cacheDownload.setDownloadInfoListSize(0);
        console.info("====>SUB_Request_cacheDownload_maintenance_0400 setDownloadInfoListSize success");
        let downloadInfo: cacheDownload.DownloadInfo | undefined = cacheDownload.getDownloadInfo(url);
        console.info("====>SUB_Request_cacheDownload_maintenance_0400 cacheDownload success url: " + JSON.stringify(downloadInfo));
        expect(downloadInfo === undefined).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_maintenance_0400 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_maintenance_0600
     * @tc.name   SUB_Request_cacheDownload_maintenance_0600
     * @tc.desc   setDownloadInfoListSize param is default number error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_maintenance_0600', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_maintenance_0600 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      let url1: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      let url2: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_2.jpg';
      let url3: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_3.jpg';
      try {
        cacheDownload.setDownloadInfoListSize(1);
        let downloadOptions = new cacheDownloadOptions();
        let downloadInfo1: cacheDownload.DownloadInfo | undefined;
        let downloadInfo2: cacheDownload.DownloadInfo | undefined;
        let downloadInfo3: cacheDownload.DownloadInfo | undefined;
        let count1: number = 0;
        downloadInfo1 = cacheDownload.getDownloadInfo(url1);
        console.info("====>SUB_Request_cacheDownload_maintenance_0600 getDownloadInfo1: " + JSON.stringify(downloadInfo1));
        expect(typeof downloadInfo1 === 'object').assertTrue();
        cacheDownload.setDownloadInfoListSize(3);
        console.info("====>SUB_Request_cacheDownload_maintenance_0600 setDownloadInfoListSize 3 success");
        cacheDownload.download(url1, downloadOptions);
        cacheDownload.download(url2, downloadOptions);
        cacheDownload.download(url3, downloadOptions);
        console.info("====>SUB_Request_cacheDownload_maintenance_0600 cacheDownload three tasks url");
        let t1 = setInterval(() => {
          try {
            count1 += 1;
            console.info("====>SUB_Request_cacheDownload_maintenance_0600 t1 count1: " + count1)
            downloadInfo1 = cacheDownload.getDownloadInfo(url1);
            downloadInfo2 = cacheDownload.getDownloadInfo(url2);
            downloadInfo3 = cacheDownload.getDownloadInfo(url3);
            console.info(`====>SUB_Request_cacheDownload_maintenance_0600 t1 downloadInfo1: ${downloadInfo1};
                                                                             downloadInfo2: ${downloadInfo2};
                                                                             downloadInfo3: ${downloadInfo3};`);
            if(downloadInfo1 !== undefined && downloadInfo2 !== undefined && downloadInfo3 !== undefined){
              clearInterval(t1);
              expect(typeof downloadInfo1.resource === 'object').assertTrue();
              expect(typeof downloadInfo2.network === 'object').assertTrue();
              expect(typeof downloadInfo3.performance === 'object').assertTrue();
              done();
            }
            if (count1 == 14){
              clearInterval(t1);
              console.info("====>SUB_Request_cacheDownload_maintenance_0600 t1 cacheDownload timeout");
            }
          }catch (err) {
            clearInterval(t1);
            console.info("====>SUB_Request_cacheDownload_maintenance_0600 t1 cacheDownload err: " + JSON.stringify(err));
            done();
          }
        }, 1000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_maintenance_0600 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_maintenance_0700
     * @tc.name   SUB_Request_cacheDownload_maintenance_0700
     * @tc.desc   setDownloadInfoListSize param is default number error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_maintenance_0700', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_maintenance_0700 is starting-----------------------");
      let url1: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      let url2: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_2.jpg';
      let url3: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_3.jpg';
      let url4: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_4.jpg';
      try {
        cacheDownload.setDownloadInfoListSize(4);
        console.info("====>SUB_Request_cacheDownload_maintenance_0700 setDownloadInfoListSize 4 success");
        let downloadInfo1: cacheDownload.DownloadInfo | undefined;
        let downloadInfo2: cacheDownload.DownloadInfo | undefined;
        let downloadInfo3: cacheDownload.DownloadInfo | undefined;
        let downloadInfo4: cacheDownload.DownloadInfo | undefined;
        downloadInfo1 = cacheDownload.getDownloadInfo(url1);
        downloadInfo2 = cacheDownload.getDownloadInfo(url2);
        downloadInfo3 = cacheDownload.getDownloadInfo(url3);
        downloadInfo4 = cacheDownload.getDownloadInfo(url4);
        expect(typeof downloadInfo1 === 'object').assertTrue();
        expect(typeof downloadInfo2 === 'object').assertTrue();
        expect(typeof downloadInfo3 === 'object').assertTrue();
        expect(typeof downloadInfo4 === 'object').assertTrue();
        cacheDownload.setDownloadInfoListSize(2);
        console.info("====>SUB_Request_cacheDownload_maintenance_0700 setDownloadInfoListSize 2 success");
        downloadInfo1 = cacheDownload.getDownloadInfo(url1);
        downloadInfo2 = cacheDownload.getDownloadInfo(url2);
        downloadInfo3 = cacheDownload.getDownloadInfo(url3);
        downloadInfo4 = cacheDownload.getDownloadInfo(url4);
        console.info(`====>SUB_Request_cacheDownload_maintenance_0700 inner downloadInfo1: ${downloadInfo1};
                                                                            downloadInfo2: ${downloadInfo2};
                                                                            downloadInfo3: ${downloadInfo3};
                                                                            downloadInfo4: ${downloadInfo4};`);

        expect(downloadInfo1 === undefined).assertTrue();
        expect(downloadInfo2 === undefined).assertTrue();
        expect(downloadInfo3 !== undefined).assertTrue();
        expect(downloadInfo4 !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_maintenance_0700 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_maintenance_0800
     * @tc.name   SUB_Request_cacheDownload_maintenance_0800
     * @tc.desc   setDownloadInfoListSize param is default number error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_maintenance_0800', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_maintenance_0800 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      let url1: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      let url2: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_2.jpg';
      let url3: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_3.jpg';
      let url4: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_4.jpg';
      let url5: string = 'https://gitee.com/murphy1984/download/releases/download/V1/error.jpg';
      try {
        cacheDownload.setDownloadInfoListSize(4);
        console.info("====>SUB_Request_cacheDownload_maintenance_0800 setDownloadInfoListSize 4 success");
        let downloadOptions = new cacheDownloadOptions();
        let downloadInfo1: cacheDownload.DownloadInfo | undefined;
        let downloadInfo2: cacheDownload.DownloadInfo | undefined;
        let downloadInfo3: cacheDownload.DownloadInfo | undefined;
        let downloadInfo4: cacheDownload.DownloadInfo | undefined;
        let downloadInfo5: cacheDownload.DownloadInfo | undefined;
        let count1: number = 0;
        downloadInfo1 = cacheDownload.getDownloadInfo(url1);
        downloadInfo2 = cacheDownload.getDownloadInfo(url2);
        downloadInfo3 = cacheDownload.getDownloadInfo(url3);
        downloadInfo4 = cacheDownload.getDownloadInfo(url4);
        cacheDownload.download(url5, downloadOptions);
        console.info(`====>SUB_Request_cacheDownload_maintenance_0800 getDownloadInfo five success`);
        downloadInfo1 = cacheDownload.getDownloadInfo(url1);
        console.info(`====>SUB_Request_cacheDownload_maintenance_0800 getDownloadInfo1 success`);
        let t1 = setInterval(() => {
          try {
            count1 += 1;
            console.info("====>SUB_Request_cacheDownload_maintenance_0800 t1 count1: " + count1);
            downloadInfo5 = cacheDownload.getDownloadInfo(url5);
            console.info(`====>SUB_Request_cacheDownload_maintenance_0800 t1 downloadInfo5: ${downloadInfo5}`);
            if (downloadInfo5 !== undefined){
              clearInterval(t1);
              downloadInfo1 = cacheDownload.getDownloadInfo(url1);
              downloadInfo2 = cacheDownload.getDownloadInfo(url2);
              downloadInfo3 = cacheDownload.getDownloadInfo(url3);
              downloadInfo4 = cacheDownload.getDownloadInfo(url4);
              downloadInfo5 = cacheDownload.getDownloadInfo(url5);
              console.info(`====>SUB_Request_cacheDownload_maintenance_0800 t1 downloadInfo1: ${downloadInfo1};
                                                                               downloadInfo2: ${downloadInfo2};
                                                                               downloadInfo3: ${downloadInfo3};
                                                                               downloadInfo4: ${downloadInfo4};
                                                                               downloadInfo5: ${downloadInfo5};`);
              expect(downloadInfo1 !== undefined).assertTrue();
              expect(downloadInfo2 === undefined).assertTrue();
              expect(downloadInfo3 !== undefined).assertTrue();
              expect(downloadInfo4 !== undefined).assertTrue();
              expect(downloadInfo5 !== undefined).assertTrue();
              done();
            }
            if (count1 == 14){
              clearInterval(t1);
              console.info("====>SUB_Request_cacheDownload_maintenance_0800 t1 cacheDownload timeout");
            }
          }catch (err) {
            clearInterval(t1);
            console.info("====>SUB_Request_cacheDownload_maintenance_0800 t1 catch err: " + JSON.stringify(err));
            done();
          }
        }, 1000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_maintenance_0800 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_maintenance_0900
     * @tc.name   SUB_Request_cacheDownload_maintenance_0900
     * @tc.desc   setDownloadInfoListSize param is default number error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_maintenance_0900', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_maintenance_0900 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      try {
        cacheDownload.setDownloadInfoListSize(1);
        console.info("====>SUB_Request_cacheDownload_maintenance_0900 setDownloadInfoListSize 2 success");
        let downloadOptions = new cacheDownloadOptions();
        let downloadInfo1: cacheDownload.DownloadInfo | undefined;
        downloadInfo1 = cacheDownload.getDownloadInfo(url);
        console.info("====>SUB_Request_cacheDownload_maintenance_0900 getDownloadInfo1 success");
        let count: number = 0;
        cacheDownload.download(url, downloadOptions);
        console.info("====>SUB_Request_cacheDownload_maintenance_0900 getDownloadInfo first success");

        let t = setInterval(() => {
          try {
            let downloadInfo: cacheDownload.DownloadInfo | undefined = cacheDownload.getDownloadInfo(url);
            console.info("====>SUB_Request_cacheDownload_maintenance_0900 downloadInfo: " + JSON.stringify(downloadInfo));
            if(JSON.stringify(downloadInfo1?.performance) !== JSON.stringify(downloadInfo?.performance)){
              clearInterval(t);
              console.info("====>SUB_Request_cacheDownload_maintenance_0900 downloadInfo1: " + JSON.stringify(downloadInfo1));
              expect(downloadInfo1?.performance.dnsTime !== downloadInfo?.performance.dnsTime ||
                downloadInfo1?.performance.connectTime !== downloadInfo?.performance.connectTime ||
                downloadInfo1?.performance.tlsTime !== downloadInfo?.performance.tlsTime ||
                downloadInfo1?.performance.firstSendTime !== downloadInfo?.performance.firstSendTime ||
                downloadInfo1?.performance.firstReceiveTime !== downloadInfo?.performance.firstReceiveTime ||
                downloadInfo1?.performance.totalTime !== downloadInfo?.performance.totalTime ||
                downloadInfo1?.performance.redirectTime !== downloadInfo?.performance.redirectTime).assertTrue();
              done();
            }
            if(count === 14){
              clearInterval(t);
              console.info("====>SUB_Request_cacheDownload_maintenance_0900 cacheDownload timeout");
            }
          }catch (err) {
            clearInterval(t);
            console.info("====>SUB_Request_cacheDownload_maintenance_0900 cacheDownload err: " + JSON.stringify(err));
            done();
          }
        }, 1000)
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_maintenance_0900 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_cacheDownload_maintenance_1100
     * @tc.name   SUB_Request_cacheDownload_maintenance_1100
     * @tc.desc   can get error url downloadInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_maintenance_1100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_maintenance_1100 is starting-----------------------");
      let url5: string = 'https://gitee.com/murphy1984/download/releases/download/V1/error.jpg';
      try {
        console.info("====>SUB_Request_cacheDownload_maintenance_1100 setDownloadInfoListSize success");
        let downloadInfo: cacheDownload.DownloadInfo | undefined = cacheDownload.getDownloadInfo(url5);
        console.info("====>SUB_Request_cacheDownload_maintenance_1100 cacheDownload success url: " + JSON.stringify(downloadInfo));
        expect(downloadInfo !== undefined).assertTrue();
        console.info(`====>SUB_Request_cacheDownload_maintenance_1100
              typeof size: ${typeof downloadInfo?.resource.size};
              typeof dnsServers: ${typeof downloadInfo?.network.dnsServers};
              typeof dnsTime: ${typeof downloadInfo?.performance.dnsTime};
              typeof connectTime: ${typeof downloadInfo?.performance.connectTime};
              typeof tlsTime: ${typeof downloadInfo?.performance.tlsTime};
              typeof firstSendTime: ${typeof downloadInfo?.performance.firstSendTime};
              typeof firstReceiveTime: ${typeof downloadInfo?.performance.firstReceiveTime};
              typeof totalTime: ${typeof downloadInfo?.performance.totalTime};
              typeof redirectTime: ${typeof downloadInfo?.performance.redirectTime};`);
        expect(typeof downloadInfo?.resource.size === 'number').assertTrue();
        expect(typeof downloadInfo?.network.dnsServers === 'object').assertTrue();
        expect(typeof downloadInfo?.performance.dnsTime === 'number').assertTrue();
        expect(typeof downloadInfo?.performance.connectTime === 'number').assertTrue();
        expect(typeof downloadInfo?.performance.tlsTime === 'number').assertTrue();
        expect(typeof downloadInfo?.performance.firstSendTime === 'number').assertTrue();
        expect(typeof downloadInfo?.performance.firstReceiveTime === 'number').assertTrue();
        expect(typeof downloadInfo?.performance.totalTime === 'number').assertTrue();
        expect(typeof downloadInfo?.performance.redirectTime === 'number').assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_maintenance_1100 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

  });
}
