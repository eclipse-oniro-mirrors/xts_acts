/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size  } from "../../../hypium/index";

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let baseContext: common.UIAbilityContext | undefined;

export default function requestCacheDownloadStaticTest() {
  describe('requestCacheDownloadStaticTest', (): void => {
    console.info('====>################################request download Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, '%{public}s', 'beforeAll start');
        let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        await Utils.msSleep(1000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.helloworld")
        await Utils.msSleep(4000)
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        baseContext = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'baseContext set success');
        done();
      } catch (err) {
        console.info('====>beforeAll catch err:'+JSON.stringify(err))
        done();
      }
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach((): void => {
      console.info('====>beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach((): void => {
      console.info('====>afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll((): void => {
      console.info('====>afterAll: Test suite-level cleanup condition is executed');
    });


    /**
     * @tc.name   SUB_Request_cacheDownload_ListeningSuccess_0100
     * @tc.number SUB_Request_cacheDownload_ListeningSuccess_0100
     * @tc.desc   onDownloadSuccess url equal 8192.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_ListeningSuccess_0100',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
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
      let force = cacheDownload.CacheStrategy.FORCE
      console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0100 OTHERS: ${JSON.stringify(force)}`);
      expect(force === 0).assertTrue();
      let lazy = cacheDownload.CacheStrategy.LAZY
      console.info(`====>SUB_Request_cacheDownload_ListeningSuccess_0100 OTHERS: ${JSON.stringify(lazy)}`);
      expect(lazy === 1).assertTrue();
      done();
    });


    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_Static_0200
     * @tc.number SUB_Request_cacheDownload_Supplemental_Static_0200
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_Static_0200',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_Supplemental_Static_0200 is starting-----------------------");
      try {
        let num: int = 1 * 1024 * 1024
        let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/testpicture6.jpg';
        let headers: Record<string, string> = {'Accept': '*/*'};
        let downloadOptions: cacheDownload.CacheDownloadOptions = {
          headers: headers,
          sslType: cacheDownload.SslType.TLCP,
          cacheStrategy: cacheDownload.CacheStrategy.LAZY,
          caPath: '/data/storage/el2/bundle/entry_test/resources/resfile/sm2.ca.pem',
        }
        cacheDownload.setMemoryCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0200 setMemoryCacheSize success");
        cacheDownload.setFileCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0200 setFileCacheSize success");
        cacheDownload.download(url, downloadOptions);
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0200 doonDownloadErrorwnload success");
        let downloadInfo = cacheDownload.getDownloadInfo(url);
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0200 getDownloadInfo: " + JSON.stringify(downloadInfo));
        expect(downloadInfo === undefined).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0200 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_Static_0300
     * @tc.number SUB_Request_cacheDownload_Supplemental_Static_0300
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_Static_0300',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_Supplemental_Static_0300 is starting-----------------------");
      try {
        let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
        let headers: Record<string, string> = {'Accept': '*/*'};
        let downloadOptions: cacheDownload.CacheDownloadOptions = {
          headers: headers,
          sslType: cacheDownload.SslType.TLS,
          cacheStrategy: cacheDownload.CacheStrategy.FORCE,
          caPath:''
        }

        let onSuccessCallback = () => {
          try {
            cacheDownload.offDownloadSuccess(url);
            let downloadInfo = cacheDownload.getDownloadInfo(url);
            console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0300 getDownloadInfo: " + JSON.stringify(downloadInfo));
            expect(downloadInfo!.resource.size !== undefined).assertTrue();
            expect(downloadInfo!.network.dnsServers !== undefined).assertTrue();
            expect(downloadInfo!.network.ip !== undefined).assertTrue();
            expect(downloadInfo!.performance.dnsTime !== undefined).assertTrue();
            expect(downloadInfo!.performance.connectTime !== undefined).assertTrue();
            expect(downloadInfo!.performance.tlsTime !== undefined).assertTrue();
            expect(downloadInfo!.performance.firstSendTime !== undefined).assertTrue();
            expect(downloadInfo!.performance.firstReceiveTime !== undefined).assertTrue();
            expect(downloadInfo!.performance.totalTime !== undefined).assertTrue();
            expect(downloadInfo!.performance.redirectTime !== undefined).assertTrue();
            cacheDownload.clearFileCache();
            cacheDownload.clearMemoryCache();
            cacheDownload.cancel(url);
            done();
          }catch (err) {
            console.info(`====>SUB_Request_cacheDownload_Supplemental_Static_0300 onSuccessCallback error: ${JSON.stringify(err)}`);
            done();
          }
        }
        cacheDownload.setDownloadInfoListSize(1);
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0300 setDownloadInfoListSize success");
        cacheDownload.download(url, downloadOptions);
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0300 download success url: " + url);
        cacheDownload.onDownloadSuccess(url, onSuccessCallback);
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0300 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_Static_0400
     * @tc.number SUB_Request_cacheDownload_Supplemental_Static_0400
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_Static_0400',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_Supplemental_Static_0400 is starting-----------------------");
      try {
        let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/testpicture7.jpg';
        let onErrorCallback = (err: cacheDownload.DownloadError) => {
          try {
            cacheDownload.offDownloadError(url);
            console.info(`====>SUB_Request_cacheDownload_Supplemental_Static_0400 onErrorCallback3 message: ${JSON.stringify(err.message)}`);
            console.info(`====>SUB_Request_cacheDownload_Supplemental_Static_0400 onErrorCallback3 errorCode: ${JSON.stringify(err.errorCode)}`);
            expect(err.message === "404").assertTrue();
            expect(err.errorCode === 48).assertTrue();
            done();
          }catch (err) {
            console.info(`====>SUB_Request_cacheDownload_Supplemental_Static_0400 onSuccessCallback error: ${JSON.stringify(err)}`);
            done();
          }
        }
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0400 setDownloadInfoListSize success");
        cacheDownload.download(url, {});
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0400 download success url: " + url);
        cacheDownload.onDownloadError(url, onErrorCallback);
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0400 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_Static_0500
     * @tc.number SUB_Request_cacheDownload_Supplemental_Static_0500
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_Static_0500',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_Supplemental_Static_0500 is starting-----------------------");
      let headers: Record<string, string> = {'Accept': '*/*'};
      let downloadOptions: cacheDownload.CacheDownloadOptions = {
        headers: headers,
      }
      let text: string = ''.padEnd(8176, 'cacheDownload')
      let url: string = 'https://gitee' + text + '.com';
      try {
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0500 download success url length: " + url.length);
        cacheDownload.download(url, downloadOptions);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0500 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });


    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_Static_0600
     * @tc.number SUB_Request_cacheDownload_Supplemental_Static_0600
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_Static_0600',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_Supplemental_Static_0600 is starting-----------------------");
      let text: string = ''.padEnd(8176, 'cacheDownload')
      let url: string = 'https://gitee' + text + '.com';
      try {
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0600 cancel success url length: " + url.length);
        cacheDownload.cancel(url);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0600 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_Static_0700
     * @tc.number SUB_Request_cacheDownload_Supplemental_Static_0700
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_Static_0700',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_Supplemental_Static_0700 is starting-----------------------");
      let num: Long = 1 * 1024 * 1024 * 1024 + 1
      try {
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0700 setMemoryCacheSize success num: " + num);
        cacheDownload.setMemoryCacheSize(num);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0700 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_Static_0800
     * @tc.number SUB_Request_cacheDownload_Supplemental_Static_0800
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_Static_0800',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_Supplemental_Static_0800 is starting-----------------------");
      let num: Long = 4294967296 + 1
      try {
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0800 setMemoryCacheSize success num: " + num);
        cacheDownload.setFileCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0800 setMemoryCacheSize setFileCacheSize success" + num);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_Supplemental_Static_0800 catch err: " + JSON.stringify(err.code));
        expect(err.code).assertEqual(401);
        done();
      }
    });

  });
}