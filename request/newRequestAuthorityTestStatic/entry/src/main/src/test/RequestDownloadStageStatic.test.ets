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

import request from "@ohos.request";
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size  } from "../../../hypium/index";
import fs from '@ohos.file.fs'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let baseContext: common.UIAbilityContext | undefined;

export default function requestDownloadStageStaticUnit() {
  describe('requestDownloadStageStaticTSUnit', (): void => {
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
        let pathDir: string = baseContext!.cacheDir;
        let filePath = pathDir + `/test.txt`;
        let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let content = ''.padEnd(1 * 1024, 'Hello world');
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        hilog.info(domain, tag, '%{public}s', '====>beforeAll: text.txt file generate');
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
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0100
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0100
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_0100 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0100.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0100.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test002.hap',
        header: {
          'headers': 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(baseContext!, downloadFileConfig, async (err, downloadTask):void => {
        console.info("====>SUB_Request_downloadStage_Supplemental_Static_0100 downloadTask: " + downloadTask);
        try{
          if(err){
            console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0100 downloadFile error: ${JSON.stringify(err)}`)
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          let ifExit = await downloadTask!.delete();
          expect(ifExit === true).assertEqual(true);
          fs.unlinkSync(downloadFilePath);
          let downloadInfo = await downloadTask!.getTaskInfo();
          expect(downloadInfo.description !== undefined).assertTrue();
          expect(downloadInfo.downloadedBytes !== undefined).assertTrue();
          expect(downloadInfo.downloadId !== undefined).assertTrue();
          expect(downloadInfo.failedReason !== undefined).assertTrue();
          expect(downloadInfo.fileName !== undefined).assertTrue();
          expect(downloadInfo.filePath !== undefined).assertTrue();
          expect(downloadInfo.pausedReason !== undefined).assertTrue();
          expect(downloadInfo.status !== undefined).assertTrue();
          expect(downloadInfo.targetURI !== undefined).assertTrue();
          expect(downloadInfo.downloadTitle !== undefined).assertTrue();
          expect(downloadInfo.downloadTotalBytes !== undefined).assertTrue();
          console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_0100 end-----------------------");
          done();
        }catch(e){
          console.info("====>SUB_Request_downloadStage_Supplemental_Static_0100 except error: " + e);
        }
      });
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0200
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0200
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_0200 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0200.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0200.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test002.hap',
        header: {
          'headers': 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      try{
        let downloadTask = await request.downloadFile(baseContext!, downloadFileConfig);
        let ifExit = await downloadTask!.delete();
        expect(ifExit === true).assertEqual(true);
        fs.unlinkSync(downloadFilePath);
        done();
        console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_0200 end-----------------------");
      } catch(err){
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0200 except error: ${JSON.stringify(err)}`)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0300
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0300
     * @tc.desc   different index,begins and ends.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let File: request.File = {
        filename: 'test',
        name: 'test',
        uri: 'internal://cache/text.txt',
        type: 'txt'
      }

      let RequestData: request.RequestData = {
        name: 'name',
        value: '123'
      }

      let config: request.UploadConfig = {
        url: 'http://127.0.0.1:8080',
        header: { 'Accept': '*/*' },
        method: "POST",
        files: [File],
        data: [RequestData],
        index: 0,
        begins: 0,
        ends: 1,
      }
      console.info('====>SUB_Request_downloadStage_Supplemental_Static_0300 config_multi: ' + JSON.stringify(config));
      try {
        let uploadTask: request.UploadTask = await request.uploadFile(baseContext!, config);
        let failCallback = (taskStates: Array<request.TaskState>) => {
          try {
            uploadTask.offFail();
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_0300 fail TaskState: " + JSON.stringify(taskStates[0]));
            expect(taskStates[0].path !== undefined).assertEqual(true);
            expect(taskStates[0].responseCode !== undefined).assertEqual(true);
            expect(taskStates[0].message !== undefined).assertEqual(true);
            expect(taskStates.length).assertEqual(1);
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_0300 TaskState is correct");
          } catch (err) {
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_0300 err: " + JSON.stringify(err));
          }
        }
        uploadTask.onFail(failCallback)
        console.info('====>SUB_Request_downloadStage_Supplemental_Static_0300 onFail success');
        expect().assertFail();
      }catch (err) {
        console.info('====>SUB_Request_downloadStage_Supplemental_Static_0300 uploadFile err: ' + JSON.stringify(err.code));
        expect(err.code).assertEqual(13400002);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0400
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0400
     * @tc.desc   different index,begins and ends.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let File: request.File = {
        filename: '',
        name: '',
        uri: '',
        type: ''
      }

      let RequestData: request.RequestData = {
        name: '',
        value: ''
      }

      let config: request.UploadConfig = {
        url: 'http://127.0.0.1:8080',
        header: { 'Accept': '*/*' },
        method: "POST",
        files: [File],
        data: [RequestData],
      }
      console.info('====>SUB_Request_downloadStage_Supplemental_Static_0400 config_multi: ' + JSON.stringify(config));
      try {
        request.uploadFile(baseContext!, config, (err, data) => {
          if (err) {
            console.error(`====>SUB_Request_downloadStage_Supplemental_Static_0400 err Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
        });
        console.info('====>SUB_Request_downloadStage_Supplemental_Static_0400 onFail success');
        expect().assertFail();
      }catch (err) {
        console.info('====>SUB_Request_downloadStage_Supplemental_Static_0400 uploadFile err: ' + JSON.stringify(err.code));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0500
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0500
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_0500 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0500.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0500.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test002.hap',
        header: {
          'headers': 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      try{
        let downloadTask = await request.downloadFile(baseContext!, downloadFileConfig);
        let progressCallback = (receivedSize: Long, totalSize: Long) => {
          console.info("download receivedSize:" + receivedSize + " totalSize:" + totalSize);
        };
        let completeCallback = () => {
          console.info('Download task completed.');
        };
        let pauseCallback = () => {
          console.info('Download task pause.');
        };
        let removeCallback = () => {
          console.info('Download task remove.');
        };
        let failCallback = (err: int) => {
          console.error(`Failed to download the task. Code: ${err}`);
        };
        downloadTask.onProgress(progressCallback);
        downloadTask.offProgress(progressCallback);
        downloadTask.offProgress();

        downloadTask.onComplete(completeCallback);
        downloadTask.offComplete(completeCallback);
        downloadTask.offComplete();

        downloadTask.onPause(pauseCallback);
        downloadTask.offPause(pauseCallback);
        downloadTask.offPause();


        downloadTask.offRemove(removeCallback);
        downloadTask.offRemove(removeCallback);
        downloadTask.offRemove();

        downloadTask.onFail(failCallback);
        downloadTask.offFail(failCallback);
        downloadTask.offFail();

        let ifExit = await downloadTask.delete();
        expect(ifExit === true).assertEqual(true);
        fs.unlinkSync(downloadFilePath);
        done();
        console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_0500 end-----------------------");
      } catch(err){
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0500 except error: ${JSON.stringify(err)}`)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0600
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0600
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_0600 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0600.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0600.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test002.hap',
        header: {
          'headers': 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      try{
        let downloadTask = await request.downloadFile(baseContext!, downloadFileConfig);
        downloadTask.delete((err, result) => {
          try {
            if (err) {
              console.error(`====>SUB_Request_downloadStage_Supplemental_Static_0600 Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            }
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_0600 Succeeded in delete the download task.');
            expect(result === true).assertEqual(true);
          } catch (err) {
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_0600 Succeeded delete error.');
          }
        });

        let result = await downloadTask.delete();
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0600 result: ${result}`);
        expect(result === true).assertEqual(true);
        fs.unlinkSync(downloadFilePath);
        done();
        console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_0600 end-----------------------");
      } catch(err){
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0600 except error: ${JSON.stringify(err)}`)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0700
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0700
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_0700 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0700.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0700.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test002.hap',
        header: {
          'headers': 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      try{
        let downloadTask = await request.downloadFile(baseContext!, downloadFileConfig);
        downloadTask.suspend((err, result) => {
          try {
            if (err) {
              console.error(`====>SUB_Request_downloadStage_Supplemental_Static_0700 Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            }
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_0700 Succeeded in suspend the download task.');
            expect(result === true).assertEqual(true);
          } catch (err) {
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_0700 Succeeded suspend error.');
          }
        });

        let result = await downloadTask.suspend();
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0700 result: ${result}`);
        expect(result === true).assertEqual(true);
        fs.unlinkSync(downloadFilePath);
        done();
        console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_0700 end-----------------------");
      } catch(err){
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0700 except error: ${JSON.stringify(err)}`)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0800
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0800
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_0800 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0800.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0800.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test002.hap',
        header: {
          'headers': 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      try{
        let downloadTask = await request.downloadFile(baseContext!, downloadFileConfig);
        downloadTask.restore((err, result) => {
          try {
            if (err) {
              console.error(`====>SUB_Request_downloadStage_Supplemental_Static_0800 Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            }
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_0800 Succeeded in restore the download task.');
            expect(result === true).assertEqual(true);
          } catch (err) {
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_0800 Succeeded restore error.');
          }
        });

        let result = await downloadTask.restore();
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0800 result: ${result}`);
        expect(result === true).assertEqual(true);
        fs.unlinkSync(downloadFilePath);
        done();
        console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_0800 end-----------------------");
      } catch(err){
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0800 except error: ${JSON.stringify(err)}`)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0900
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0900
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_0900 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0900.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0900.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test002.hap',
        header: {
          'headers': 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      try{
        let downloadTask = await request.downloadFile(baseContext!, downloadFileConfig);
        downloadTask.getTaskInfo((err, taskInfo) => {
          try {
            if (err) {
              console.error(`====>SUB_Request_downloadStage_Supplemental_Static_0900 Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            }
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_0900 Succeeded in getTaskInfo the download task.');
            expect(taskInfo !== undefined).assertEqual(true);
          } catch (err) {
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_0900 Succeeded getTaskInfo error.');
          }
        });

        let taskInfo = await downloadTask.getTaskInfo();
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0900 result: ${taskInfo}`);
        expect(taskInfo !== undefined).assertEqual(true);
        fs.unlinkSync(downloadFilePath);
        done();
        console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_0900 end-----------------------");
      } catch(err){
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0900 except error: ${JSON.stringify(err)}`)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_1000
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_1000
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_1000 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_1000.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_1000.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test002.hap',
        header: {
          'headers': 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      try{
        let downloadTask = await request.downloadFile(baseContext!, downloadFileConfig);
        downloadTask.getTaskMimeType((err, taskInfo) => {
          try {
            if (err) {
              console.error(`====>SUB_Request_downloadStage_Supplemental_Static_1000 Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            }
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_1000 Succeeded in getTaskInfo the download task.');
            expect(taskInfo !== undefined).assertEqual(true);
          } catch (err) {
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_1000 Succeeded getTaskInfo error.');
          }
        });

        let taskInfo = await downloadTask.getTaskMimeType();
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_1000 result: ${taskInfo}`);
        expect(taskInfo !== undefined).assertEqual(true);
        fs.unlinkSync(downloadFilePath);
        done();
        console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_1000 end-----------------------");
      } catch(err){
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_1000 except error: ${JSON.stringify(err)}`)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_1100
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_1100
     * @tc.desc   different index,begins and ends.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_1100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let File: request.File = {
        filename: '',
        name: '',
        uri: '',
        type: ''
      }

      let RequestData: request.RequestData = {
        name: '',
        value: ''
      }

      let config: request.UploadConfig = {
        url: 'http://127.0.0.1:8080',
        header: { 'Accept': '*/*' },
        method: "POST",
        files: [File],
        data: [RequestData],
        index: 0,
        begins: 0,
        ends: 1,
      }
      console.info('====>SUB_Request_downloadStage_Supplemental_Static_1100 config_multi: ' + JSON.stringify(config));
      try {
        let uploadTask: request.UploadTask = await request.uploadFile(baseContext!, config);
        let progressCallback = (receivedSize: Long, totalSize: Long) => {
          console.info("download receivedSize:" + receivedSize + " totalSize:" + totalSize);
        };

        let headerCallback = (headers: object) => {
          console.info("upOnHeader headers:" + JSON.stringify(headers));
        };

        let completeCallback = (taskStates: Array<request.TaskState>) => {
          console.info('Upload delete complete notification.');
          for (let i = 0; i < taskStates.length; i++) {
            console.info('taskState:' + JSON.stringify(taskStates[i]));
          }
        };

        let failCallback =  (taskStates: Array<request.TaskState>) => {
          console.info('Upload delete fail notification.');
          for (let i = 0; i < taskStates.length; i++) {
            console.info('taskState:' + JSON.stringify(taskStates[i]));
          }
        };

        uploadTask.onProgress(progressCallback);
        uploadTask.offProgress(progressCallback);
        uploadTask.offProgress();

        uploadTask.onHeaderReceive(headerCallback);
        uploadTask.offHeaderReceive(headerCallback);
        uploadTask.offHeaderReceive();

        uploadTask.onComplete(completeCallback);
        uploadTask.offComplete(completeCallback);
        uploadTask.offComplete();

        uploadTask.onFail(failCallback);
        uploadTask.offFail(failCallback);
        uploadTask.offFail();

        console.info('====>SUB_Request_downloadStage_Supplemental_Static_1100 onFail success');
        expect().assertFail();
      }catch (err) {
        console.info('====>SUB_Request_downloadStage_Supplemental_Static_1100 uploadFile err: ' + JSON.stringify(err.code));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_1200
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_1200
     * @tc.desc   different index,begins and ends.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_1200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let config: request.UploadConfig = {
        url: 'http://127.0.0.1:8080',
        header: { 'Accept': '*/*' },
        method: "POST",
        files: [],
        data: [],
        index: 0,
        begins: 0,
        ends: 1,
      }
      console.info('====>SUB_Request_downloadStage_Supplemental_Static_1200 config_multi: ' + JSON.stringify(config));
      try {
        let uploadTask: request.UploadTask = await request.uploadFile(baseContext!, config);
        uploadTask.delete((err, result) => {
          try {
            if (err) {
              console.error(`====>SUB_Request_downloadStage_Supplemental_Static_1200 Failed errCode: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            }
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_1200 delete Succeeded.');
            expect(result === true).assertEqual(true);
          } catch (err) {
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_1200 restore error.');
          }

        });
        let result = await uploadTask.delete();
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_1200 result: ${result}`);
        expect(result === true).assertEqual(true);
        done();
      }catch (err) {
        console.info('====>SUB_Request_downloadStage_Supplemental_Static_1200 uploadFile err: ' + JSON.stringify(err.code));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_1300
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_1300
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_1300 is starting-----------------------");
      let downloadFileConfig: request.DownloadConfig = {
        url: 'gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test002.hap',
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: 'base/SUB_Request_downloadStage_Supplemental_Static_1300',
        title: 'XTS download test!',
        background: true,
        enableMetered: true,
        enableRoaming: true,
      }
      try{
        let downloadTask = await request.downloadFile(baseContext!, downloadFileConfig);
        expect(downloadTask !== undefined).assertEqual(true);

        request.downloadFile(baseContext!, downloadFileConfig, async (err, downloadTask):void => {
          console.info("====>SUB_Request_downloadStage_Supplemental_Static_1300 downloadTask: " + downloadTask);
          try{
            if(err){
              console.info(`====>SUB_Request_downloadStage_Supplemental_Static_1300 downloadFile error: ${JSON.stringify(err)}`)
              expect().assertFail();
            }
            expect(downloadTask != undefined).assertEqual(true);
            done();
          }catch(e){
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_1300 except error: " + e);
            done();
          }
        });

        let del:boolean = await downloadTask.delete();
        expect(del === false).assertTrue();
        downloadTask.onRemove(() => {
          console.info("====>SUB_Request_downloadStage_Supplemental_Static_1300 onRemove success:");
          expect(del === true).assertTrue();
        })
        downloadTask.delete((err, result) => {
          if (err) {
            console.error(`====>Failed to delete the upload task. Code: ${err.code}, message: ${err.message}`);
            expect(result === false).assertTrue();
          }
          console.info('====>Succeeded in deleting the upload task.');
          expect(result === true).assertTrue();
        });

        let pause:boolean = await downloadTask.suspend();
        expect(pause === false).assertTrue();
        downloadTask.onPause(() => {
          console.info("====>SUB_Request_downloadStage_Supplemental_Static_1300 onRemove success:");
          expect(pause === true).assertTrue();
        })
        downloadTask.suspend((err, result) => {
          if (err) {
            console.error(`====>Failed to pause the download task. Code: ${err.code}, message: ${err.message}`);
            expect(result === false).assertTrue();
          }
          console.info('====>Succeeded in pausing the download task.');
          expect(result === true).assertTrue();
        });

        let pro:boolean = await downloadTask.restore();
        expect(pro === false).assertTrue();
        downloadTask.onProgress((receivedSize: long, totalSize: long) => {
          console.info("====>SUB_Request_downloadStage_Supplemental_Static_1300 onRemove success:");
          expect(pause === true).assertTrue();
        })
        downloadTask.restore((err, result) => {
          if (err) {
            console.error(`====>Failed to pause the download task. Code: ${err.code}, message: ${err.message}`);
            expect(result === false).assertTrue();
          }
          console.info('====>Succeeded in pausing the download task.');
          expect(result === true).assertTrue();
        });

        downloadTask.getTaskInfo((err, taskInfo) => {
          try {
            if (err) {
              console.error(`====>SUB_Request_downloadStage_Supplemental_Static_1300: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            }
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_1300 in getTaskInfo the download task.');
            expect(taskInfo!.description !== undefined).assertTrue();
            expect(taskInfo!.downloadedBytes !== undefined).assertTrue();
            expect(taskInfo!.downloadId !== undefined).assertTrue();
            expect(taskInfo!.failedReason !== undefined).assertTrue();
            expect(taskInfo!.fileName !== undefined).assertTrue();
            expect(taskInfo!.filePath !== undefined).assertTrue();
            expect(taskInfo!.pausedReason !== undefined).assertTrue();
            expect(taskInfo!.status !== undefined).assertTrue();
            expect(taskInfo!.targetURI !== undefined).assertTrue();
            expect(taskInfo!.downloadTitle !== undefined).assertTrue();
            expect(taskInfo!.downloadTotalBytes !== undefined).assertTrue();
          } catch (err) {
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_1300 getTaskInfo error.');
          }
        });
        done();
        console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_1300 end-----------------------");
      } catch(err){
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_1300 except error: ${JSON.stringify(err.code)}`)
        expect(err.code === 401).assertEqual(true);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_1400
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_1400
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_1400 is starting-----------------------");
      let File1: request.File = {
        filename: 'request',
        name: '1300',
        uri: 'cache/test.txt',
        type: 'text'
      }

      let RequestData1: request.RequestData = {
        name: 'upload',
        value: 'key'
      }

      let File2: request.File = {
        filename: '',
        name: '',
        uri: '',
        type: ''
      }

      let RequestData2: request.RequestData = {
        name: '',
        value: ''
      }

      let config1: request.UploadConfig = {
        url: 'http://127.0.0.1:8080',
        header: { 'Accept': '*/*' },
        method: "POST",
        files: [File1],
        data: [RequestData1],
      }

      let config2: request.UploadConfig = {
        url: 'http://127.0.0.1:8080',
        header: { 'Accept': '*/*' },
        method: "POST",
        files: [File2],
        data: [RequestData2],
      }

      let config3: request.UploadConfig = {
        url: 'http://127.0.0.1:8080',
        header: { 'Accept': '*/*' },
        method: "POST",
        files: [],
        data: [],
      }
      try{
        let uploadTask1: request.UploadTask = await request.uploadFile(baseContext!, config1);
        expect(uploadTask1 !== undefined).assertEqual(true);
        let uploadTask2: request.UploadTask = await request.uploadFile(baseContext!, config2);
        expect(uploadTask2 !== undefined).assertEqual(true);

        request.uploadFile(baseContext!, config2, (err, data) => {
          if (err) {
            console.error(`====>SUB_Request_downloadStage_Supplemental_Static_1400 err Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            expect(data !== undefined).assertEqual(true);
          }
        });

        request.uploadFile(baseContext!, config3, (err, data) => {
          if (err) {
            console.error(`====>SUB_Request_downloadStage_Supplemental_Static_1400 err Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            expect(data !== undefined).assertEqual(true);
          }
        });

        let del:boolean = await uploadTask1.delete();
        expect(del === false).assertTrue();
        uploadTask1.onProgress((receivedSize: long, totalSize: long) => {
          console.info("====>SUB_Request_downloadStage_Supplemental_Static_1400 onRemove success:");
          expect(del === true).assertTrue();
        })
        uploadTask1.delete((err, result) => {
          if (err) {
            console.error(`====>Failed to delete the upload task. Code: ${err.code}, message: ${err.message}`);
            expect(result === false).assertTrue();
          }
          console.info('====>Succeeded in deleting the upload task.');
          expect(result === true).assertTrue();
        });

        uploadTask1.onComplete((taskStates: Array<request.TaskState>) => {
          console.info('====>Upload delete complete notification.');
          expect(taskStates.length === 0).assertTrue();
        });

        uploadTask1.onComplete((taskStates: Array<request.TaskState>) => {
          console.info('====>Upload delete complete notification.');
          expect(taskStates.length === 1).assertTrue();
        });

        uploadTask1.onFail((taskStates: Array<request.TaskState>) => {
          console.info('====>Upload delete complete notification.');
          expect(taskStates.length === 0).assertTrue();
        });

        uploadTask1.onFail((taskStates: Array<request.TaskState>) => {
          console.info('====>Upload delete complete notification.');
          expect(taskStates.length >= 1).assertTrue();
        });
        done();
        console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_1400 end-----------------------");
      } catch(err){
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_1400 except error: ${JSON.stringify(err.code)}`)
        expect(err.code === 13400002).assertEqual(true);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_1500
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_1500
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_1500 is starting-----------------------");
      let downloadFileConfig: request.DownloadConfig = {
        url: '/downloadTest/releases/download/v1.0/test.hap',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: "downloadFilePath",
        title: 'XTS download test!',
        background: true
      }
      try {
        request.downloadFile(baseContext!, downloadFileConfig, (err, downloadTask) => {
          try {
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_1500 callback");
            expect().assertFail();
            done();
          }catch (err) {
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_1500 err: " + JSON.stringify(err));
            done();
          }
        })
      } catch (err) {
        console.info("====>SUB_Request_downloadStage_Supplemental_Static_1500 param error: " + JSON.stringify(err.code));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_1600
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_1600
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_1600 is starting-----------------------");
      let downloadFileConfig: request.DownloadConfig = {
        url: '/downloadTest/releases/download/v1.0/test.hap',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: "downloadFilePath",
        title: 'XTS download test!',
        background: false
      }
      try {
        await request.downloadFile(baseContext!, downloadFileConfig)
        console.info('====>SUB_Request_downloadStage_Supplemental_Static_1600 Download success.');
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_downloadStage_Supplemental_Static_1600 except error: " + JSON.stringify(err.code));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_1700
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_1700
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_1700 is starting-----------------------");
      let config: request.UploadConfig = {
        url: 'upload',
        header: { 'Accept': '*/*' },
        method: "POST",
        files: [{ filename: "test", name: "test", uri: "internal://cache/test.txt", type: "txt" }],
        data: [{ name: "name123", value: "123" }],
      }
      console.info('====>SUB_Request_downloadStage_Supplemental_Static_1700 config_multi: ' + JSON.stringify(config));
      try {
        request.uploadFile(baseContext!, config, (err, uploadTask)=>{
          try{
            if (err) {
              console.info('====>SUB_Request_downloadStage_Supplemental_Static_1700 downloadFile fail: ' + JSON.stringify(err));
              expect().assertFail();
            }
          }catch(err){
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_1700 catch err: ' + JSON.stringify(err));
          }
        });
      }catch (err) {
        console.info('====>SUB_Request_downloadStage_Supplemental_Static_1700 uploadFile err: ' + JSON.stringify(err.code));
        expect(err.code).assertEqual(401);
        done();
      }
    });


    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_1900
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_1900
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_1900 is starting-----------------------");
      let downloadFilePath = `/data/app/el2/100/base/cache/SUB_Request_downloadStage_Supplemental_Static_1900.txt`
      console.info("====>downloadFileConfig: " + `${downloadFilePath}`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      try {
        await request.downloadFile(baseContext!, downloadFileConfig);
        console.info("====>SUB_Request_downloadStage_Supplemental_Static_1900 downloadFile success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_downloadStage_Supplemental_Static_1900 error: " + JSON.stringify(err.code));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_2000
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_2000
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_2000 is starting-----------------------");
      let downloadFilePath = `/data/app/el2/100/base/cache/SUB_Misc_Request_DownloadManagement_0014.txt`
      console.info("====>downloadFileConfig: " + `${downloadFilePath}`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      try {
        request.downloadFile(baseContext!, downloadFileConfig, (err, downloadTask) => {
          try {
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_2000 callback");
            expect().assertFail();
            done();
          }catch (err) {
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_2000 err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_downloadStage_Supplemental_Static_2000 create error: " + JSON.stringify(err.code));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_2100
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_2100
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_2100 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_2100.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_2100.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      try {
        let file = fs.openSync(downloadFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let str: string = "hello, world";
        let writeLen = fs.writeSync(file.fd, str);
        console.info("====>SUB_Request_downloadStage_Supplemental_Static_2100 write data to file succeed and size is:" + writeLen);
        fs.closeSync(file);
        await request.downloadFile(baseContext!, downloadFileConfig);
        console.info("====>SUB_Request_downloadStage_Supplemental_Static_2100 downloadFile success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Misc_Request_DownloadManagement_0003 error: " + JSON.stringify(err.code));
        fs.unlinkSync(downloadFilePath);
        expect(err.code).assertEqual(13400002);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_2200
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_2200
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_2200 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_2200.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_2200.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      try {
        let file = fs.openSync(downloadFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let str: string = "hello, world";
        let writeLen = fs.writeSync(file.fd, str);
        console.info("====>SUB_Request_downloadStage_Supplemental_Static_2200 write data to file succeed and size is:" + writeLen);
        fs.closeSync(file);
        request.downloadFile(baseContext!, downloadFileConfig, (err, downloadTask) => {
          try {
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_2200 into downloadFile');
            expect().assertFail();
            done();
          }catch (err) {
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_2200 downloadFile error: " + JSON.stringify(err.code));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_downloadStage_Supplemental_Static_2200 error: " + JSON.stringify(err.code));
        fs.unlinkSync(downloadFilePath);
        expect(err.code).assertEqual(13400002);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_2300
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_2300
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_2300 is starting-----------------------");
      let config: request.UploadConfig = {
        url: 'http://127.0.0.1:8080',
        header: { 'Accept': '*/*' },
        method: "POST",
        files: [{ filename: "text", name: "text", uri: "internal://cache/text.txt", type: "txt" }],
        data: [{ name: "name123", value: "123" }],
      }
      console.info('====>SUB_Request_downloadStage_Supplemental_Static_2300 config: ' + JSON.stringify(config));
      try {
        request.uploadFile(baseContext!, config, (err, uploadTask)=>{
          try{
            if (err) {
              console.info('====>SUB_Request_downloadStage_Supplemental_Static_2300 downloadFile fail: ' + JSON.stringify(err));
              expect().assertFail();
            }
          }catch(err){
            console.info('====>SUB_Request_downloadStage_Supplemental_Static_2300 catch err: ' + JSON.stringify(err));
          }
        });
      }catch (err) {
        console.info('====>SUB_Request_downloadStage_Supplemental_Static_2300 uploadFile err: ' + JSON.stringify(err.code));
        expect(err.code).assertEqual(13400002);
        done();
      }
    });

  });
}