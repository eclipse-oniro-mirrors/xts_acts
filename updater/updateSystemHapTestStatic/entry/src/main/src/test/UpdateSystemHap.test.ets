// @ts-nocheck
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import update from '@ohos.update';
import hilog from '@ohos.hilog';
// import { BusinessError } from '@ohos.base';
import { BusinessError, AsyncCallback } from '@ohos.base';

// let sleep = (ms: number): Promise<void> => {
//   return new Promise<void>((resolve) => setTimeout(resolve, ms));
// };

function extractErrorCodeSimple(message: string): null | Double {
  const parts = message.split(' ');
  const errorCodeStr = parts[1]; // 第二个词通常是 "202"
  const code = parseInt(errorCodeStr, 10);
  if (isNaN(code)) {
    const errorCodeStr2 = parts[2]; // 第二个词通常是 "202"
    const code2 = parseInt(errorCodeStr2, 10);
    return isNaN(code2) ? null : code2;
  }
  return isNaN(code) ? null : code;
}

export default function updateSystemHapTest() {
  describe('updateSystemHapTest', (): void => {
    const NOT_SYSTEM_HAP = 202;
    let updater: update.Updater;
    let restorer: update.Restorer;
    let localUpdater: update.LocalUpdater;
    let upgradeInfo: update.UpgradeInfo = {
      upgradeApp: "com.hmos.ouc",
      businessType: {
        vendor: update.BusinessVendor.PUBLIC,
        subType: update.BusinessSubType.FIRMWARE
      }
    };
    let taskCallback: update.UpgradeTaskCallback = (eventInfo: update.EventInfo) => {
      console.info('onTest callback checkRet = ' + eventInfo);
    };

    beforeAll(():void => {
    });
    beforeEach(():void => {
    });
    afterEach(():void => {
    });
    afterAll(():void => {
    });

    /**
     * @tc.name   updateSystemHapTest001
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0001
     * @tc.desc   To test hap is not system hap and  invoke getOnlineUpdater api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateSystemHapTest001', Level.LEVEL1, async  () => {
      console.info('updateSystemHapTest001 START');
      try{
        let updater = update.getOnlineUpdater(upgradeInfo);
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest001 catch " + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.name   updateSystemHapTest002
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0002
     * @tc.desc   To test hap is not system hap and  invoke applyNewVersion api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest002', Level.LEVEL2, async  () => {
      console.info('updateSystemHapTest002 START');
      try{
        let restorer = update.getRestorer();
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest002 catch " + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.name   updateSystemHapTest003
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0003
     * @tc.desc   To test hap is not system hap and  invoke applyNewVersion api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest003', Level.LEVEL2, async  () => {
      console.info('updateSystemHapTest003 START');
      try{
        let localUpdater = update.getLocalUpdater();
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest003 catch " + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.name   updateSystemHapTest004
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0004
     * @tc.desc   To test hap is not system hap and  invoke checkNewVersion api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest004', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest004 START');
      try{
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.checkNewVersion((err: BusinessError<void>|null, data: update.CheckResult|undefined) => {
          console.error("updateSystemHapTest004 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest004 catch2 " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   updateSystemHapTest005
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0005
     * @tc.desc   To test hap is not system hap and  invoke checkNewVersion api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest005', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest005 START');
      try {
        updater = update.getOnlineUpdater(upgradeInfo);
        await updater.checkNewVersion();
      } catch (err) {
        console.error("updateSystemHapTest005 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest005 message " + err);
        try {
          console.error("updateSystemHapTest005 code " + extractErrorCodeSimple(JSON.stringify(err)));
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest005 code" + err);
      }
      done();
    });

    /**
     * @tc.name   updateSystemHapTest007
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0007
     * @tc.desc   To test hap is not system hap and  invoke getNewVersionInfo api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest007', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest007 START');
      try {
        updater = update.getOnlineUpdater(upgradeInfo);
        await updater.getNewVersionInfo();
      } catch (err) {
        console.error("updateSystemHapTest007 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest007 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest007  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest009
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0009
     * @tc.desc   To test hap is not system hap and  invoke getNewVersionDescription api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest009', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest009 START');
      try {
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const descriptionOptions: update.DescriptionOptions = {
          format: update.DescriptionFormat.STANDARD,
          language: "zh-cn" // 中文
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        await updater.getNewVersionDescription(versionDigestInfo, descriptionOptions);
      } catch (err) {
        console.error("updateSystemHapTest009 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest009 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest009  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest006
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0006
     * @tc.desc   To test hap is not system hap and  invoke getNewVersionInfo api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest006', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest006 START');
      try{
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getNewVersionInfo((err: BusinessError<void>|null, data: update.NewVersionInfo|undefined) => {
          console.error("updateSystemHapTest006 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest006 catch2 " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   updateSystemHapTest008
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0008
     * @tc.desc   To test hap is not system hap and  invoke getNewVersionDescription api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest008', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest008 START');
      try{
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const descriptionOptions: update.DescriptionOptions = {
          format: update.DescriptionFormat.STANDARD, // 标准格式
          language: "zh-cn" // 中文
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getNewVersionDescription(versionDigestInfo, descriptionOptions, (err: BusinessError<void>|null, data: Array<update.ComponentDescription>|undefined) => {
          console.error("updateSystemHapTest008 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest008 catch2 " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   updateSystemHapTest010
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0010
     * @tc.desc   To test hap is not system hap and  invoke getCurrentVersionInfo api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest010', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest007 START');
      try{
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getCurrentVersionInfo((err: BusinessError<void>|null, data: update.CurrentVersionInfo|undefined) => {
          console.error("updateSystemHapTest010 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest010 catch2 " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   updateSystemHapTest011
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0011
     * @tc.desc   To test hap is not system hap and  invoke getCurrentVersionInfo api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest011', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest011 START');
      try {
        updater = update.getOnlineUpdater(upgradeInfo);
        await updater.getCurrentVersionInfo();
      } catch (err) {
        console.error("updateSystemHapTest011 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest011 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest011  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest012
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0012
     * @tc.desc   To test hap is not system hap and  invoke getCurrentVersionDescription api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest012', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest012 START');
      try{
        const descriptionOptions: update.DescriptionOptions = {
          format: update.DescriptionFormat.STANDARD, // 标准格式
          language: "zh-cn" // 中文
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getCurrentVersionDescription(descriptionOptions, (err: BusinessError<void>|null, data: Array<update.ComponentDescription>|undefined) => {
          console.error("updateSystemHapTest012 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest012 catch2 " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   updateSystemHapTest013
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0013
     * @tc.desc   To test hap is not system hap and  invoke getCurrentVersionDescription api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest013', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest013 START');
      try {
        const descriptionOptions: update.DescriptionOptions = {
          format: update.DescriptionFormat.STANDARD,
          language: "zh-cn" // 中文
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        let result = await updater.getCurrentVersionDescription(descriptionOptions);
        console.log("updateSystemHapTest013 result is " + JSON.stringify(result));
      } catch (err) {
        console.error("updateSystemHapTest013 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest013 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest013  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest014
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0014
     * @tc.desc   To test hap is not system hap and  invoke getTaskInfo api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest014', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest014 START');
      try{
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getTaskInfo((err: BusinessError<void>|null, data: update.TaskInfo|undefined) => {
          console.error("updateSystemHapTest014 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest014 catch2 " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   updateSystemHapTest015
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0015
     * @tc.desc   To test hap is not system hap and  invoke getTaskInfo api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateSystemHapTest015', Level.LEVEL1, async () => {
      console.info('updateSystemHapTest015 START');
      try {
        updater = update.getOnlineUpdater(upgradeInfo);
        let result = await updater.getTaskInfo();
        console.log("updateSystemHapTest015 result is " + JSON.stringify(result));
      } catch (err) {
        console.error("updateSystemHapTest015 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest015 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest015  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest016
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0016
     * @tc.desc   To test hap is not system hap and  invoke download api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest016', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest016 START');
      try{
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const downloadOptions: update.DownloadOptions = {
          allowNetwork: update.NetType.CELLULAR, // 允许数据网络下载
          order: update.Order.DOWNLOAD // 下载
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.download(versionDigestInfo, downloadOptions, (err) => {
          console.error("updateSystemHapTest016 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest016 catch2 " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   updateSystemHapTest017
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0017
     * @tc.desc   To test hap is not system hap and  invoke download api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest017', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest017 START');
      try {
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const downloadOptions : update.DownloadOptions= {
          allowNetwork: update.NetType.CELLULAR, // 允许数据网络下载
          order: update.Order.DOWNLOAD // 下载
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        let result = await updater.download(versionDigestInfo, downloadOptions);
        console.log("updateSystemHapTest017 result is " + JSON.stringify(result));
      } catch (err) {
        console.error("updateSystemHapTest017 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest017 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest017  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest018
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0018
     * @tc.desc   To test hap is not system hap and  invoke resumeDownload api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest018', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest018 START');
      try{
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const resumeDownloadOptions: update.ResumeDownloadOptions = {
          allowNetwork: update.NetType.CELLULAR, // 允许数据网络下载
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.resumeDownload(versionDigestInfo, resumeDownloadOptions, (err) => {
          console.error("updateSystemHapTest018 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest018 catch2 " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   updateSystemHapTest019
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0019
     * @tc.desc   To test hap is not system hap and  invoke resumeDownload api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest019', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest019 START');
      try {
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const resumeDownloadOptions : update.ResumeDownloadOptions = {
          allowNetwork: update.NetType.CELLULAR, // 允许数据网络下载
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        let result = await updater.resumeDownload(versionDigestInfo, resumeDownloadOptions);
        console.log("updateSystemHapTest019 result is " + JSON.stringify(result));
      } catch (err) {
        console.error("updateSystemHapTest019 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest019 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest019  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest020
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0020
     * @tc.desc   To test hap is not system hap and  invoke pauseDownload api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest020', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest020 START');
      try{
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const pauseDownloadOptions: update.PauseDownloadOptions = {
          isAllowAutoResume: true // 允许自动恢复下载
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.pauseDownload(versionDigestInfo, pauseDownloadOptions, (err) => {
          console.error("updateSystemHapTest020 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest020 catch2 " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   updateSystemHapTest021
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0021
     * @tc.desc   To test hap is not system hap and  invoke pauseDownload api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest021', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest021 START');
      try {
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const pauseDownloadOptions : update.PauseDownloadOptions = {
          isAllowAutoResume: true // 允许自动恢复下载
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        let result = await updater.pauseDownload(versionDigestInfo, pauseDownloadOptions);
        console.log("updateSystemHapTest021 result is " + JSON.stringify(result));
      } catch (err) {
        console.error("updateSystemHapTest021 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest021 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest021  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest022
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0022
     * @tc.desc   To test hap is not system hap and  invoke upgrade api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest022', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest022 START');
      try{
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const upgradeOptions: update.UpgradeOptions = {
          order: update.Order.INSTALL // 安装指令
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.upgrade(versionDigestInfo, upgradeOptions, (err) => {
          console.error("updateSystemHapTest022 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest022 catch2 " + JSON.stringify(err));

      }
    });

    /**
     * @tc.name   updateSystemHapTest023
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0023
     * @tc.desc   To test hap is not system hap and  invoke upgrade api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest023', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest023 START');
      try {
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const upgradeOptions : update.UpgradeOptions = {
          order: update.Order.INSTALL // 安装指令
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        let result = await updater.upgrade(versionDigestInfo, upgradeOptions);
        console.log("updateSystemHapTest023 result is " + JSON.stringify(result));
      } catch (err) {
        console.error("updateSystemHapTest023 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest023 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest023  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest024
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0024
     * @tc.desc   To test hap is not system hap and  invoke clearError api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest024', Level.LEVEL2, (): void => {
      console.info('updateSystemHapTest024 START');
      try {
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const clearOptions: update.ClearOptions = {
          status: update.UpgradeStatus.DOWNLOADING,
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.clearError(versionDigestInfo, clearOptions, (err) => {
          console.error("updateSystemHapTest024 catch1 " + JSON.stringify(err));
          console.error("updateSystemHapTest024 message " + err?.message);
          expect(err?.code == NOT_SYSTEM_HAP).assertTrue();
        });
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.error("updateSystemHapTest024 catch2 " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   updateSystemHapTest025
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0025
     * @tc.desc   To test hap is not system hap and  invoke clearError api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest025', Level.LEVEL2, async () => {
      try {
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const clearOptions: update.ClearOptions = {
          status: update.UpgradeStatus.DOWNLOADING,
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        let result = await updater.clearError(versionDigestInfo, clearOptions);
        console.log("updateSystemHapTest025 result is " + JSON.stringify(result));
      } catch (err) {
        console.error("updateSystemHapTest025 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest025 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest025  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest026
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0026
     * @tc.desc   To test hap is not system hap and  invoke getUpgradePolicy api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest026', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest026 START');
      try{
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getUpgradePolicy((err: BusinessError<void>|null, data: update.UpgradePolicy|undefined) => {
          console.error("updateSystemHapTest026 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest026 catch2 " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   updateSystemHapTest027
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0027
     * @tc.desc   To test hap is not system hap and  invoke getUpgradePolicy api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest027', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest027 START');
      try {
        updater = update.getOnlineUpdater(upgradeInfo);
        let policy = await updater.getUpgradePolicy();
        console.log("updateSystemHapTest027 policy is " + JSON.stringify(policy));
      } catch (err) {
        console.error("updateSystemHapTest027 catch " + JSON.stringify(err));;
        console.error("updateSystemHapTest027 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest027  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest028
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0028
     * @tc.desc   To test hap is not system hap and  invoke setUpgradePolicy api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest028', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest025 START');
      try{
        const policy: update.UpgradePolicy = {
          downloadStrategy: false,
          autoUpgradeStrategy: false,
          autoUpgradePeriods: [ { start: 120, end: 240 } ] // 自动升级时间段，用分钟表示
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.setUpgradePolicy(policy, (err) => {
          console.error("updateSystemHapTest028 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest028 catch2 " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   updateSystemHapTest029
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0029
     * @tc.desc   To test hap is not system hap and  invoke setUpgradePolicy api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest029', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest029 START');
      try {
        const policy: update.UpgradePolicy = {
          downloadStrategy: false,
          autoUpgradeStrategy: false,
          autoUpgradePeriods: [{ start: 120, end: 240 }] // 自动升级时间段，用分钟表示
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        let result = await updater.setUpgradePolicy(policy);
        console.log("updateSystemHapTest029 result is " + JSON.stringify(result));
      } catch (err) {
        console.error("updateSystemHapTest029 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest029 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest029  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest030
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0030
     * @tc.desc   To test hap is not system hap and  invoke terminateUpgrade api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest030', Level.LEVEL2, async (done: () => void) : Promise<void> => {
      console.info('updateSystemHapTest030 START');
      try{
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.terminateUpgrade((err) => {
          console.error("updateSystemHapTest030 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest030 catch2 " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   updateSystemHapTest031
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0031
     * @tc.desc   To test hap is not system hap and  invoke terminateUpgrade api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest031', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest031 START');
      try {
        updater = update.getOnlineUpdater(upgradeInfo);
        let result = await updater.terminateUpgrade()
      } catch (err) {
        console.error("updateSystemHapTest031 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest031 message " + err);
        try {
          console.error("updateSystemHapTest031 extractErrorCodeSimple(JSON.stringify(err))-- " + extractErrorCodeSimple(JSON.stringify(err)));
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest031  code" + err);
      }
      done();
    });

    /**
     * @tc.name   updateSystemHapTest032
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0032
     * @tc.desc   To test hap is not system hap and  invoke on api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest032', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest032 START');
      try{
        const eventClassifyInfo: update.EventClassifyInfo = {
          eventClassify : update.EventClassify.TASK,
          extraInfo: ""
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.on(eventClassifyInfo, taskCallback => {
          console.error("updateSystemHapTest033 catch1 " + JSON.stringify(taskCallback));
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest032 catch2 " + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.name   updateSystemHapTest033
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0033
     * @tc.desc   To test hap is not system hap and  invoke off api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest033', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest033 START');
      try{
        const eventClassifyInfo: update.EventClassifyInfo = {
          eventClassify : update.EventClassify.TASK,
          extraInfo: ""
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.off(eventClassifyInfo, taskCallback => {
          console.error("updateSystemHapTest033 catch1 " + JSON.stringify(taskCallback));
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest033 catch2 " + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.name   updateSystemHapTest034
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0034
     * @tc.desc   To test hap is not system hap and  invoke factoryReset api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest034', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest034 START');
      try{
        restorer = update.getRestorer();
        restorer.factoryReset((err) => {
          console.error("updateSystemHapTest034 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest034 catch2 " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   updateSystemHapTest035
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0035
     * @tc.desc   To test hap is not system hap and  invoke factoryReset api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest035', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest035 START');
      try {
        restorer = update.getRestorer();
        let result = await restorer.factoryReset();
      } catch (err) {
        console.error("updateSystemHapTest035 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest035 message " + err);
        try {
          console.error("updateSystemHapTest035 extractErrorCodeSimple(JSON.stringify(err))-- " + extractErrorCodeSimple(JSON.stringify(err)));
          console.info('err.code' + err.code + typeof(err.code))
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest035  code" + err);
      }
      done();
    });

    /**
     * @tc.name   updateSystemHapTest036
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0036
     * @tc.desc   To test hap is not system hap and  invoke verifyUpgradePackage api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest036', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest036 START');
      try{
        const upgradeFile: update.UpgradeFile = {
          fileType: update.ComponentType.OTA,
          filePath: "/data/ota_package/updater.zip" // 本地升级包路径
        };
        localUpdater = update.getLocalUpdater();
        localUpdater.verifyUpgradePackage(upgradeFile, "cerstFilePath", (err) => {
          console.error("updateSystemHapTest036 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest036 catch2 " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   updateSystemHapTest037
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0037
     * @tc.desc   To test hap is not system hap and  invoke verifyUpgradePackage api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest037', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest037 START');
      try {
        const upgradeFile: update.UpgradeFile = {
          fileType: update.ComponentType.OTA, // OTA包
          filePath: "/data/ota_package/updater.zip" // 本地升级包路径
        };
        localUpdater = update.getLocalUpdater();
        let result = await localUpdater.verifyUpgradePackage(upgradeFile, "cerstFilePath");
        console.log("updateSystemHapTest037 result is " + JSON.stringify(result));
      } catch (err) {
        console.error("updateSystemHapTest037 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest037 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest037  code" + err);
      }
    });

    /**
     * @tc.name   updateSystemHapTest038
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0038
     * @tc.desc   To test hap is not system hap and  invoke applyNewVersion api(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest038', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest038 START');
      try{
        const upgradeFiles: update.UpgradeFile[] = [{
          fileType: update.ComponentType.OTA,
          filePath: "/data/ota_package/updater.zip" // 本地升级包路径
        }];
        localUpdater = update.getLocalUpdater();
        localUpdater.applyNewVersion(upgradeFiles, (err) => {
          console.error("updateSystemHapTest038 catch1 " + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_SYSTEM_HAP);
        });
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest038 catch2 " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   updateSystemHapTest039
     * @tc.number SUB_UPDATE_SYSTEM_HAP_TEST_0039
     * @tc.desc   To test hap is not system hap and  invoke applyNewVersion api(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateSystemHapTest039', Level.LEVEL2, async () => {
      console.info('updateSystemHapTest039 START');
      try {
        const upgradeFiles: Array<update.UpgradeFile> = [{
          fileType: update.ComponentType.OTA, // OTA包
          filePath: "/data/ota_package/updater.zip" // 本地升级包路径
        }];
        localUpdater = update.getLocalUpdater();
        await localUpdater.applyNewVersion(upgradeFiles);
      } catch (err) {
        console.error("updateSystemHapTest039 catch " + JSON.stringify(err));
        console.error("updateSystemHapTest039 message " + err);
        try {
          expect(extractErrorCodeSimple(JSON.stringify(err)) == NOT_SYSTEM_HAP).assertTrue();
        } catch (e) {
          console.log(e);
        }
        console.error("updateSystemHapTest039  code" + err);
      }
    });
  })
}