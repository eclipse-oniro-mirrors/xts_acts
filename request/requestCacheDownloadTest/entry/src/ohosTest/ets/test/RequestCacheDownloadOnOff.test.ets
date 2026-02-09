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

export default function requestCacheDownloadOnOffUnitTest() {
  describe('requestCacheDownloadOnOffJSTest', () => {
    console.info('====>requestCacheDownloadOnOffJSTest Test start');

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningSuccess_0100
     * @tc.number SUB_Request_cacheDownload_ListeningSuccess_0100
     * @tc.desc   onDownloadSuccess url equal 8192.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningSuccess_0100', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningSuccess_0100 is starting-----------------------");
      let dns = cacheDownload.ErrorCode.DNS
      console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0100 DNS: ${JSON.stringify(dns)}`);
      expect(dns === 0).assertTrue();
      let tcp = cacheDownload.ErrorCode.TCP
      console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0100 TCP: ${JSON.stringify(tcp)}`);
      expect(tcp === 16).assertTrue();
      let ssl = cacheDownload.ErrorCode.SSL
      console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0100 SSL: ${JSON.stringify(ssl)}`);
      expect(ssl === 32).assertTrue();
      let http = cacheDownload.ErrorCode.HTTP
      console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0100 HTTP: ${JSON.stringify(http)}`);
      expect(http === 48).assertTrue();
      let others = cacheDownload.ErrorCode.OTHERS
      console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0100 OTHERS: ${JSON.stringify(others)}`);
      expect(others === 255).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningSuccess_0200
     * @tc.number SUB_Request_cacheDownload_ListeningSuccess_0200
     * @tc.desc   offDownloadSuccess one task.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_Request_cacheDownload_ListeningSuccess_0200', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningSuccess_0200 is starting-----------------------");
      let flag: boolean = true;
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      let onSuccessCallback = () => {
        flag = false;
        console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0200 onSuccessCallback flag: ${flag}`);
      }
      cacheDownload.download(url, {});
      console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0200 download success`);
      cacheDownload.onDownloadSuccess(url, onSuccessCallback);
      cacheDownload.offDownloadSuccess(url, onSuccessCallback);
      let t = setTimeout(() => {
        clearTimeout(t);
        try {
          console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0200 setTimeout flag: ${flag}`);
          expect(flag).assertTrue();
          done()
        } catch (err) {
          console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0200 catch err: ${JSON.stringify(err)}`);
          done()
        }
      }, 10000)
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningSuccess_0300
     * @tc.number SUB_Request_cacheDownload_ListeningSuccess_0300
     * @tc.desc   offDownloadSuccess all task.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_Request_cacheDownload_ListeningSuccess_0300', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningSuccess_0300 is starting-----------------------");
      let flag: boolean = true;
      let url1: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_2.jpg';
      let onSuccessCallback1 = () => {
        flag = false;
        console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0300 onSuccessCallback1 flag: ${flag}`);
      }
      let onSuccessCallback2 = () => {
        flag = false;
        console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0300 onSuccessCallback2 flag: ${flag}`);
      }
      let onSuccessCallback3 = () => {
        flag = false;
        console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0300 onSuccessCallback3 flag: ${flag}`);
      }
      cacheDownload.download(url1, {});
      console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0300 download success`);
      cacheDownload.onDownloadSuccess(url1, onSuccessCallback1);
      cacheDownload.onDownloadSuccess(url1, onSuccessCallback2);
      cacheDownload.onDownloadSuccess(url1, onSuccessCallback3);
      cacheDownload.offDownloadSuccess(url1);
      let t = setTimeout(() => {
        clearTimeout(t);
        try {
          console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0300 setTimeout flag: ${flag}`);
          expect(flag).assertTrue();
          done()
        } catch (err) {
          console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0300 catch err: ${JSON.stringify(err)}`);
          done()
        }
      }, 10000)
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningSuccess_0400
     * @tc.number SUB_Request_cacheDownload_ListeningSuccess_0400
     * @tc.desc   onDownloadSuccess task in order.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_Request_cacheDownload_ListeningSuccess_0400', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningSuccess_0400 is starting-----------------------");
      let flag1: number = 0;
      let flag2: number = 0;
      let flag3: number = 0;
      let url1: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_3.jpg';
      let onSuccessCallback1 = () => {
        try {
          flag1 = 1;
          console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0400 onSuccessCallback1 flag1 flag2 flag3: ${flag1}, ${flag2}, ${flag3}`);
          expect(flag1 === 1).assertTrue();
          expect(flag2 === 0).assertTrue();
          expect(flag3 === 0).assertTrue();
        }catch (err) {
          console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0400 onSuccessCallback1 not in order`);
          done();
        }
      }
      let onSuccessCallback2 = () => {
        try {
          flag2 = 1;
          console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0400 onSuccessCallback2 flag1 flag2 flag3: ${flag1}, ${flag2}, ${flag3}`);
          expect(flag1 === 1).assertTrue();
          expect(flag2 === 1).assertTrue();
          expect(flag3 === 0).assertTrue();
        }catch (err) {
          console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0400 onSuccessCallback2 not in order`);
          done();
        }
      }
      let onSuccessCallback3 = () => {
        try {
          flag3 = 1;
          console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0400 onSuccessCallback1 flag1 flag2 flag3: ${flag1}, ${flag2}, ${flag3}`);
          expect(flag1 === 1).assertTrue();
          expect(flag2 === 1).assertTrue();
          expect(flag3 === 1).assertTrue();
          cacheDownload.offDownloadSuccess(url1);
          done();
        }catch (err) {
          console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0400 onSuccessCallback3 not in order`);
          done();
        }
      }
      cacheDownload.download(url1, {});
      console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0400 download success`);
      cacheDownload.onDownloadSuccess(url1, onSuccessCallback1);
      cacheDownload.onDownloadSuccess(url1, onSuccessCallback2);
      cacheDownload.onDownloadSuccess(url1, onSuccessCallback3);
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_0500
     * @tc.number SUB_Request_cacheDownload_ListeningError_0500
     * @tc.desc   offDownloadError one task.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_Request_cacheDownload_ListeningError_0500', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_0500 is starting-----------------------");
      let flag: boolean = true;
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/testpicture5.jpg';
      let onErrorCallback = (err: cacheDownload.DownloadError) => {
        flag = false;
        console.info(`====>SUB_Request_cacheDownload_ListeningError_0500 onErrorCallback flag: ${flag}`);
      }
      cacheDownload.download(url, {});
      console.info(`====>SUB_Request_cacheDownload_ListeningError_0500 download success`);
      cacheDownload.onDownloadError(url, onErrorCallback);
      cacheDownload.offDownloadError(url, onErrorCallback);
      let t = setTimeout(() => {
        clearTimeout(t);
        try {
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0500 setTimeout flag: ${flag}`);
          expect(flag).assertTrue();
          done()
        } catch (err) {
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0500 catch err: ${JSON.stringify(err)}`);
          done()
        }
      }, 10000)
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_0600
     * @tc.number SUB_Request_cacheDownload_ListeningError_0600
     * @tc.desc   offDownloadError all task.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_Request_cacheDownload_ListeningError_0600', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_0600 is starting-----------------------");
      let flag: boolean = true;
      let url1: string = 'https://gitee.com/murphy1984/download/releases/download/V1/testpicture6.jpg';
      let onErrorCallback1 = (err: cacheDownload.DownloadError) => {
        flag = false;
        console.info(`====>SUB_Request_cacheDownload_ListeningError_0600 onErrorCallback1 flag: ${flag}`);
      }
      let onErrorCallback2 = (err: cacheDownload.DownloadError) => {
        flag = false;
        console.info(`====>SUB_Request_cacheDownload_ListeningError_0600 onErrorCallback2 flag: ${flag}`);
      }
      let onErrorCallback3 = (err: cacheDownload.DownloadError) => {
        flag = false;
        console.info(`====>SUB_Request_cacheDownload_ListeningError_0600 onErrorCallback3 flag: ${flag}`);
      }
      cacheDownload.download(url1, {});
      console.info(`====>SUB_Request_cacheDownload_ListeningError_0600 download success`);
      cacheDownload.onDownloadError(url1, onErrorCallback1);
      cacheDownload.onDownloadError(url1, onErrorCallback2);
      cacheDownload.onDownloadError(url1, onErrorCallback3);
      cacheDownload.offDownloadError(url1);
      let t = setTimeout(() => {
        clearTimeout(t);
        try {
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0600 setTimeout flag: ${flag}`);
          expect(flag).assertTrue();
          done()
        } catch (err) {
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0600 catch err: ${JSON.stringify(err)}`);
          done()
        }
      }, 10000)
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_0700
     * @tc.number SUB_Request_cacheDownload_ListeningError_0700
     * @tc.desc   onErrorCallback task in order.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_Request_cacheDownload_ListeningError_0700', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_0700 is starting-----------------------");
      let flag1: number = 0;
      let flag2: number = 0;
      let flag3: number = 0;
      let url1: string = 'https://gitee.com/murphy1984/download/releases/download/V1/testpicture7.jpg';
      let onErrorCallback1 = (err: cacheDownload.DownloadError) => {
        try {
          flag1 = 1;
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0700 onErrorCallback1 flag1 flag2 flag3: ${flag1}, ${flag2}, ${flag3}`);
          expect(flag1 === 1).assertTrue();
          expect(flag2 === 0).assertTrue();
          expect(flag3 === 0).assertTrue();
        }catch (err) {
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0700 onErrorCallback1 not in order`);
          done();
        }
      }
      let onErrorCallback2 = (err: cacheDownload.DownloadError) => {
        try {
          flag2 = 1;
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0700 onErrorCallback2 flag1 flag2 flag3: ${flag1}, ${flag2}, ${flag3}`);
          expect(flag1 === 1).assertTrue();
          expect(flag2 === 1).assertTrue();
          expect(flag3 === 0).assertTrue();
        }catch (err) {
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0700 onErrorCallback2 not in order`);
          done();
        }
      }
      let onErrorCallback3 = (err: cacheDownload.DownloadError) => {
        try {
          flag3 = 1;
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0700 onErrorCallback3 flag1 flag2 flag3: ${flag1}, ${flag2}, ${flag3}`);
          expect(flag1 === 1).assertTrue();
          expect(flag2 === 1).assertTrue();
          expect(flag3 === 1).assertTrue();
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0700 onErrorCallback3 message: ${JSON.stringify(err.message)}`);
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0700 onErrorCallback3 errorCode: ${JSON.stringify(err.errorCode)}`);
          expect(err.message === "404").assertTrue();
          expect(err.errorCode === 48).assertTrue();
          cacheDownload.offDownloadError(url1);
          done();
        }catch (err) {
          console.info(`====>SUB_Request_cacheDownload_ListeningError_0700 onErrorCallback3 not in order`);
          done();
        }
      }
      cacheDownload.download(url1, {});
      console.info(`====>SUB_Request_cacheDownload_ListeningError_0700 download success`);
      cacheDownload.onDownloadError(url1, onErrorCallback1);
      cacheDownload.onDownloadError(url1, onErrorCallback2);
      cacheDownload.onDownloadError(url1, onErrorCallback3);
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningSuccess_0900
     * @tc.number SUB_Request_cacheDownload_ListeningSuccess_0900
     * @tc.desc   onDownloadSuccess url equal 8192.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningSuccess_0900', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningSuccess_0900 is starting-----------------------");
      let txt: string = ''.padEnd(8165, 'xxx');
      let url: string = 'https://gitee.com/' + txt + '/test.hap';
      try {
        let onSuccessCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningSuccess_0900 onSuccessCallback");
        }
        cacheDownload.onDownloadSuccess(url, onSuccessCallback)
        console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0900 onDownloadSuccess url.length: ${url.length}`);
        expect(url.length === 8192).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningSuccess_0900 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningSuccess_0910
     * @tc.number SUB_Request_cacheDownload_ListeningSuccess_0910
     * @tc.desc   onDownloadSuccess url equal null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningSuccess_0910', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningSuccess_0910 is starting-----------------------");
      let url: string = '';
      try {
        let onSuccessCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningSuccess_0910 onSuccessCallback");
        }
        cacheDownload.onDownloadSuccess(url, onSuccessCallback)
        console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0910 onDownloadSuccess success`);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningSuccess_0910 catch err: " + JSON.stringify(err));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningSuccess_1000
     * @tc.number SUB_Request_cacheDownload_ListeningSuccess_1000
     * @tc.desc   onDownloadSuccess url equal 8193.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningSuccess_1000', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningSuccess_1000 is starting-----------------------");
      let txt: string = ''.padEnd(8166, 'xxx');
      let url: string = 'https://gitee.com/' + txt + '/test.hap';
      try {
        let onSuccessCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningSuccess_1000 onSuccessCallback");
        }
        cacheDownload.onDownloadSuccess(url, onSuccessCallback)
        console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_1000 onDownloadSuccess url.length: ${url.length}`);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningSuccess_1000 catch err: " + JSON.stringify(err));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningSuccess_1100
     * @tc.number SUB_Request_cacheDownload_ListeningSuccess_1100
     * @tc.desc   offDownloadSuccess url equal 8192.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningSuccess_1100', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningSuccess_1100 is starting-----------------------");
      let txt: string = ''.padEnd(8165, 'xxx');
      let url: string = 'https://gitee.com/' + txt + '/test.hap';
      try {
        let offSuccessCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningSuccess_1100 offSuccessCallback");
        }
        cacheDownload.offDownloadSuccess(url, offSuccessCallback)
        console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_1100 offDownloadSuccess url.length: ${url.length}`);
        expect(url.length === 8192).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningSuccess_1100 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningSuccess_1110
     * @tc.number SUB_Request_cacheDownload_ListeningSuccess_1110
     * @tc.desc   offDownloadSuccess url equal null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningSuccess_1110', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningSuccess_1110 is starting-----------------------");
      let url: string = '';
      try {
        let offSuccessCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningSuccess_1110 offSuccessCallback");
        }
        cacheDownload.offDownloadSuccess(url, offSuccessCallback)
        console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_1110 offDownloadSuccess success`);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningSuccess_1110 catch err: " + JSON.stringify(err));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningSuccess_1200
     * @tc.number SUB_Request_cacheDownload_ListeningSuccess_1200
     * @tc.desc   offDownloadSuccess url equal 8193.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningSuccess_1200', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningSuccess_1200 is starting-----------------------");
      let txt: string = ''.padEnd(8166, 'xxx');
      let url: string = 'https://gitee.com/' + txt + '/test.hap';
      try {
        let offSuccessCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningSuccess_1200 offSuccessCallback");
        }
        cacheDownload.offDownloadSuccess(url, offSuccessCallback)
        console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_1200 offDownloadSuccess url.length: ${url.length}`);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningSuccess_1200 catch err: " + JSON.stringify(err));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_1300
     * @tc.number SUB_Request_cacheDownload_ListeningError_1300
     * @tc.desc   onDownloadError url equal 8192.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningError_1300', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_1300 is starting-----------------------");
      let txt: string = ''.padEnd(8165, 'xxx');
      let url: string = 'https://gitee.com/' + txt + '/test.hap';
      try {
        let onErrorCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningError_1300 onErrorCallback");
        }
        cacheDownload.onDownloadError(url, onErrorCallback)
        console.info(`====>SUB_Request_cacheDownload_ListeningError_1300 onDownloadError url.length: ${url.length}`);
        expect(url.length === 8192).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningError_1300 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_1310
     * @tc.number SUB_Request_cacheDownload_ListeningError_1310
     * @tc.desc   onDownloadError url equal null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningError_1310', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_1310 is starting-----------------------");
      let url: string = '';
      try {
        let onErrorCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningError_1310 onErrorCallback");
        }
        cacheDownload.onDownloadError(url, onErrorCallback)
        console.info(`====>SUB_Request_cacheDownload_ListeningError_1310 onDownloadError success`);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningError_1310 catch err: " + JSON.stringify(err));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_1400
     * @tc.number SUB_Request_cacheDownload_ListeningError_1400
     * @tc.desc   onDownloadError url equal 8193.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningError_1400', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_1400 is starting-----------------------");
      let txt: string = ''.padEnd(8166, 'xxx');
      let url: string = 'https://gitee.com/' + txt + '/test.hap';
      try {
        let onErrorCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningError_1400 onErrorCallback");
        }
        cacheDownload.onDownloadError(url, onErrorCallback)
        console.info(`====>SUB_Request_cacheDownload_ListeningError_1400 onDownloadError url.length: ${url.length}`);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningError_1400 catch err: " + JSON.stringify(err));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_1500
     * @tc.number SUB_Request_cacheDownload_ListeningError_1500
     * @tc.desc   offDownloadError url equal 8192.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningError_1500', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_1500 is starting-----------------------");
      let txt: string = ''.padEnd(8165, 'xxx');
      let url: string = 'https://gitee.com/' + txt + '/test.hap';
      try {
        let offErrorCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningError_1500 offErrorCallback");
        }
        cacheDownload.offDownloadError(url, offErrorCallback)
        console.info(`====>SUB_Request_cacheDownload_ListeningError_1500 offDownloadError url.length: ${url.length}`);
        expect(url.length === 8192).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningError_1500 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_1510
     * @tc.number SUB_Request_cacheDownload_ListeningError_1510
     * @tc.desc   offDownloadError url equal null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningError_1510', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_1510 is starting-----------------------");
      let url: string = '';
      try {
        let offErrorCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningError_1510 offErrorCallback");
        }
        cacheDownload.offDownloadError(url, offErrorCallback)
        console.info(`====>SUB_Request_cacheDownload_ListeningError_1510 offDownloadError success`);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningError_1510 catch err: " + JSON.stringify(err));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningError_1600
     * @tc.number SUB_Request_cacheDownload_ListeningError_1600
     * @tc.desc   offDownloadError url equal 8193.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningError_1600', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_ListeningError_1600 is starting-----------------------");
      let txt: string = ''.padEnd(8166, 'xxx');
      let url: string = 'https://gitee.com/' + txt + '/test.hap';
      try {
        let offErrorCallback = () => {
          console.info("====>SUB_Request_cacheDownload_ListeningError_1600 offErrorCallback");
        }
        cacheDownload.offDownloadError(url, offErrorCallback)
        console.info(`====>SUB_Request_cacheDownload_maintenance_1300 offDownloadError url.length: ${url.length}`);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_ListeningError_1600 catch err: " + JSON.stringify(err));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_0100
     * @tc.number SUB_Request_cacheDownload_supplemental_0100
     * @tc.desc   download of undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_0100', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_0100 is starting-----------------------");
      try {
        cacheDownload.download(undefined, undefined);
        console.info("====>SUB_Request_cacheDownload_supplemental_0100 download success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_0100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_0200
     * @tc.number SUB_Request_cacheDownload_supplemental_0200
     * @tc.desc   download of null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_0200', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_0200 is starting-----------------------");
      try {
        cacheDownload.download(null, null);
        console.info("====>SUB_Request_cacheDownload_supplemental_0200 download success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_0200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_0300
     * @tc.number SUB_Request_cacheDownload_supplemental_0300
     * @tc.desc   cancel of undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_0300', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_0300 is starting-----------------------");
      try {
        cacheDownload.cancel(undefined);
        console.info("====>SUB_Request_cacheDownload_supplemental_0300 cancel success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_0300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_0400
     * @tc.number SUB_Request_cacheDownload_supplemental_0400
     * @tc.desc   cancel of null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_0400', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_0400 is starting-----------------------");
      try {
        cacheDownload.cancel(null);
        console.info("====>SUB_Request_cacheDownload_supplemental_0400 cancel success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_0400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_0500
     * @tc.number SUB_Request_cacheDownload_supplemental_0500
     * @tc.desc   cancel of empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_0500', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_0500 is starting-----------------------");
      let url:string = '';
      try {
        cacheDownload.cancel(url);
        console.info("====>SUB_Request_cacheDownload_supplemental_0500 cancel success");
        expect(url.length === 0).assertTrue();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_0500 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_0600
     * @tc.number SUB_Request_cacheDownload_supplemental_0600
     * @tc.desc   setFileCacheSize of undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_0600', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_0600 is starting-----------------------");
      try {
        cacheDownload.setFileCacheSize(undefined);
        console.info("====>SUB_Request_cacheDownload_supplemental_0600 setFileCacheSize success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_0600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_0700
     * @tc.number SUB_Request_cacheDownload_supplemental_0700
     * @tc.desc   setFileCacheSize of null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_0700', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_0700 is starting-----------------------");
      try {
        cacheDownload.setFileCacheSize(null);
        console.info("====>SUB_Request_cacheDownload_supplemental_0700 setFileCacheSize success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_0700 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_0800
     * @tc.number SUB_Request_cacheDownload_supplemental_0800
     * @tc.desc   setDownloadInfoListSize of undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_0800', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_0800 is starting-----------------------");
      try {
        cacheDownload.setDownloadInfoListSize(undefined);
        console.info("====>SUB_Request_cacheDownload_supplemental_0800 setDownloadInfoListSize success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_0800 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_0900
     * @tc.number SUB_Request_cacheDownload_supplemental_0900
     * @tc.desc   setDownloadInfoListSize of null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_0900', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_0900 is starting-----------------------");
      try {
        cacheDownload.setDownloadInfoListSize(null);
        console.info("====>SUB_Request_cacheDownload_supplemental_0900 setDownloadInfoListSize success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_0900 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_1000
     * @tc.number SUB_Request_cacheDownload_supplemental_1000
     * @tc.desc   offDownloadSuccess of undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_1000', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_1000 is starting-----------------------");
      try {
        cacheDownload.offDownloadSuccess(undefined);
        console.info("====>SUB_Request_cacheDownload_supplemental_1000 offDownloadSuccess success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_1000 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_1100
     * @tc.number SUB_Request_cacheDownload_supplemental_1100
     * @tc.desc   offDownloadSuccess of null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_1100', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_1100 is starting-----------------------");
      try {
        cacheDownload.offDownloadSuccess(null);
        console.info("====>SUB_Request_cacheDownload_supplemental_1100 offDownloadSuccess success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_1100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_1200
     * @tc.number SUB_Request_cacheDownload_supplemental_1200
     * @tc.desc   offDownloadError of undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_1200', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_1200 is starting-----------------------");
      try {
        cacheDownload.offDownloadError(undefined);
        console.info("====>SUB_Request_cacheDownload_supplemental_1200 offDownloadError success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_1200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_1300
     * @tc.number SUB_Request_cacheDownload_supplemental_1300
     * @tc.desc   offDownloadError of null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_1300', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_1300 is starting-----------------------");
      try {
        cacheDownload.offDownloadError(null);
        console.info("====>SUB_Request_cacheDownload_supplemental_1300 offDownloadError success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_1300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_1400
     * @tc.number SUB_Request_cacheDownload_supplemental_1400
     * @tc.desc   setMemoryCacheSize of undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_1400', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_1400 is starting-----------------------");
      try {
        cacheDownload.setMemoryCacheSize(undefined);
        console.info("====>SUB_Request_cacheDownload_supplemental_1400 setMemoryCacheSize success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_1400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_1500
     * @tc.number SUB_Request_cacheDownload_supplemental_1500
     * @tc.desc   setMemoryCacheSize of null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_1500', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_1500 is starting-----------------------");
      try {
        cacheDownload.setMemoryCacheSize(null);
        console.info("====>SUB_Request_cacheDownload_supplemental_1500 setMemoryCacheSize success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_1500 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_1600
     * @tc.number SUB_Request_cacheDownload_supplemental_1600
     * @tc.desc   offDownloadError of empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_1600', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_1600 is starting-----------------------");
      try {
        cacheDownload.offDownloadError('');
        console.info("====>SUB_Request_cacheDownload_supplemental_1600 cancel success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_1600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_supplemental_1700
     * @tc.number SUB_Request_cacheDownload_supplemental_1700
     * @tc.desc   offDownloadError of empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_supplemental_1700', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_supplemental_1700 is starting-----------------------");
      try {
        cacheDownload.offDownloadSuccess('');
        console.info("====>SUB_Request_cacheDownload_supplemental_1700 cancel success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_supplemental_1700 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

  });
}
