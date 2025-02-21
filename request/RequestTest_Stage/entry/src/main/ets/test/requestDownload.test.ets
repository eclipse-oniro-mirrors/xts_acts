/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import fileio from '@ohos.fileio';
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestDownloadJSUnit() {
  describe('requestDownloadJSUnit', function () {
    console.info('====>################################request download Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(function () {
      console.info('====>beforeAll: Prerequisites are executed.');
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(function () {
      console.info('====>beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(function () {
      console.info('====>afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(function () {
      console.info('====>afterAll: Test suite-level cleanup condition is executed');
    });

    let sleep = function (timeout) {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    /**
     * @tc.number    SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001
     * @tc.desc      Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001', 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
        }catch(e){
          console.info("====>SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 except error: " + e);
        }
        await downloadTask.delete();
        fileio.unlinkSync(downloadFilePath);
        console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 end-----------------------");
        done();
      });
    });

    /**
     * @tc.number    SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001
     * @tc.desc      Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001', 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
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
        request.downloadFile(globalThis.abilityContext, downloadFileConfig).then(async (downloadTask) => {
          console.info("====>SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 downloadTask: " + downloadTask);
          expect(downloadTask != undefined).assertEqual(true);
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }).catch(err => {
          console.error("====>SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 error: " + err);
          fileio.unlinkSync(downloadFilePath);
          done();
        })
      }catch(err){
        console.error("====>SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 catch error: " + err);
        fileio.unlinkSync(downloadFilePath);
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_DELETE_0001
     * @tc.name SUB_REQUEST_DOWNLOAD_API_DELETE_0001
     * @tc.desc Delete the download task.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DELETE_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_delete_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0001.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.delete(async (err, data) => {
            try{
              if (err) {
                console.error('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 Failed to delete the download task.');
                await downloadTask.delete();
                expect().assertFail();
              }
              expect(typeof data == "boolean").assertTrue();
              console.info('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 Download task delete success.');
            }catch(err){
              await downloadTask.delete();
              console.error('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 delete throw error' + err);
            }
            fileio.unlinkSync(downloadFilePath);
            done();
          });
        } catch (error) {
          console.error('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 delete catch error' + error);
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_DELETE_0002
     * @tc.name SUB_REQUEST_DOWNLOAD_API_DELETE_0002
     * @tc.desc Delete the download task.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DELETE_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DELETE_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0002.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0002.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.delete().then(async data => {
            expect(data).assertEqual(true);
            console.info('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 Download task delete success.');
            fileio.unlinkSync(downloadFilePath);
            done();
            console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DELETE_0002 end-----------------------");
          }).catch(async (err) => {
            console.info('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 Failed to delete the download task.');
            await downloadTask.delete();
            fileio.unlinkSync(downloadFilePath);
            expect().assertFail();
            done();
          })
        } catch (error) {
          console.error('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 delete catch error');
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001
     * @tc.name SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001
     * @tc.desc Suspend the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.suspend(async (err, data) => {
            try{
              if (err) {
                console.error('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 Failed to suspend the download task.');
                expect().assertFail();
              }
              expect(data == true).assertTrue();
              console.info('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 Download task suspend success.');
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 throw_error: " + JSON.stringify(err));
            }
            await downloadTask.delete();
            fileio.unlinkSync(downloadFilePath);
            done();
          });
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 suspend catch error' + JSON.stringify(err));
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002
     * @tc.desc Suspend the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          try{
            let data = await downloadTask.suspend();
            expect(data == true).assertTrue();
          }catch(err){
            console.info('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 throw_err:' + JSON.stringify(err));
          }
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 suspend catch error' + JSON.stringify(err));
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_RESTORE_0001
     * @tc.name SUB_REQUEST_DOWNLOAD_API_RESTORE_0001
     * @tc.desc Restore the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_RESTORE_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0001.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.restore(async (err, data) => {
            try{
              if (err) {
                console.error('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 Failed to restore the download task.');
                expect().assertFail();
              }
              expect(data == true).assertTrue();
              console.info('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 Download  restore success.');
            }catch(err){
              console.info('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 throw_err:' + JSON.stringify(err));
            }
            await downloadTask.delete();
            fileio.unlinkSync(downloadFilePath);
            done();
          });
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 restore catch error' + JSON.stringify(err));
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_RESTORE_0002
     * @tc.desc Restore the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_RESTORE_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0002.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0002.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.restore().then(async data => {
            console.info('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 Download task restore.');
            expect(data == true).assertTrue();
            await downloadTask.delete();
            fileio.unlinkSync(downloadFilePath);
            done();
          }).catch(async (err) => {
            console.info('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 Failed to restore the download task.');
            await downloadTask.delete();
            fileio.unlinkSync(downloadFilePath);
            done();
          });
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 restore catch error' +JSON.stringify(err));
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001
     * @tc.name SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001
     * @tc.desc Get the download task info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001', 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.getTaskInfo(async (err, data) => {
            try{
              if (err) {
                console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 Failed to getTaskInfo the download task.');
                expect().assertFail();
              }
              expect(typeof data == "object").assertTrue();
              console.info('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 Download getTaskInfo success.');
            }catch(err){
              console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 throw_error' +JSON.stringify(err));
            }
            await downloadTask.delete();
            fileio.unlinkSync(downloadFilePath);
            done();
          });
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 getTaskInfo catch error' + JSON.stringify(err));
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002
     * @tc.name SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002
     * @tc.desc Get the download task info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002', 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.getTaskInfo().then(async data => {
            expect(typeof data == "object").assertTrue();
            console.info('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 Download task getTaskInfo success.');
            await downloadTask.delete();
            fileio.unlinkSync(downloadFilePath);
            done();

          }).catch(async (err) => {
            console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 Failed to getTaskInfo the download task.');
            await downloadTask.delete();
            fileio.unlinkSync(downloadFilePath);
            done();
          });
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 getTaskInfo catch error' + JSON.stringify(err));
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001', 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      let flag = false;
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('progress', async (data1, data2) => {
            try{
              if (data1 > 0 && flag == false){
                flag = true;
                downloadTask.off('progress');
                downloadTask.getTaskMimeType(async (err, data)=>{
                  try{
                    if(err) {
                      console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 err:'+ JSON.stringify(err));
                      fileio.unlinkSync(downloadFilePath);
                      expect().assertFail();
                      done();
                    }
                    if (data) {
                      console.info('====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 data:' + JSON.stringify(data));
                      expect(typeof data == "string").assertTrue();
                    } else {
                      console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 error: " + JSON.stringify(err));
                      expect().assertFail();
                    }
                  }catch(err){
                    console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 throw_error: " + JSON.stringify(err));
                  }
                  let t = setTimeout(async ()=>{
                    await downloadTask.delete();
                    fileio.unlinkSync(downloadFilePath);
                    clearTimeout(t);
                    done();
                  },1000)
                });
              }
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 error: " + JSON.stringify(err));
              await downloadTask.delete();
              fileio.unlinkSync(downloadFilePath);
              done();
            }
          })
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002', 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      let flag = false;
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('progress', async (data1, data2) => {
            try{
              if(data1 > 0 && flag == false){
                flag = true;
                downloadTask.off('progress');
                let data = await downloadTask.getTaskMimeType()
                console.info('====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002 data:' + JSON.stringify(data));
                expect(typeof data == "string").assertTrue();
              }
              let t = setTimeout(async ()=>{
                await downloadTask.delete();
                fileio.unlinkSync(downloadFilePath);
                clearTimeout(t);
                done();
              },1000)
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002 throw_error: " + JSON.stringify(err));
              await downloadTask.delete();
              fileio.unlinkSync(downloadFilePath);
              done();
            }
          })
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002 error: " + JSON.stringify(err));
          await downloadTask.delete();
          done();
        }
      })
    });

    /**
     * @tc.number SUB_Misc_Request_Download_Notice_Task_001
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_Notice_Task_001', 0, async function (done) {
      console.info("====>---------------------SUB_Misc_Request_Download_Notice_Task_001 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_001.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_001.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_Misc_Request_Download_Notice_Task_001 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>SUB_Misc_Request_Download_Notice_Task_001 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', async () => {
            try {
              downloadTask.off('complete');
              console.info('====>SUB_Misc_Request_Download_Notice_Task_001 complete success');
              fs.unlinkSync(downloadFilePath);
              console.info('====>SUB_Misc_Request_Download_Notice_Task_001 delete files success');
              await downloadTask.delete();
              console.info('====>SUB_Misc_Request_Download_Notice_Task_001 delete downloadTask');
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Misc_Request_Download_Notice_Task_001 complete error: " + JSON.stringify(err));
              done();
            }
          });
        } catch (err) {
          console.info("====>SUB_Misc_Request_Download_Notice_Task_001 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fs.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number SUB_Misc_Request_Download_Notice_Task_002
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_Notice_Task_002', 0, async function (done) {
      console.info("====>---------------------SUB_Misc_Request_Download_Notice_Task_002 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_002.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_002.txt`);
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_Misc_Request_Download_Notice_Task_002 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>SUB_Misc_Request_Download_Notice_Task_002 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', async () => {
            try {
              downloadTask.off('complete');
              console.info('====>SUB_Misc_Request_Download_Notice_Task_002 complete success');
              fs.unlinkSync(downloadFilePath);
              console.info('====>SUB_Misc_Request_Download_Notice_Task_002 delete files success');
              await downloadTask.delete();
              console.info('====>SUB_Misc_Request_Download_Notice_Task_002 delete downloadTask');
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Misc_Request_Download_Notice_Task_002 complete error: " + JSON.stringify(err));
              done();
            }
          });
        } catch (err) {
          console.info("====>SUB_Misc_Request_Download_Notice_Task_002 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fs.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number SUB_Misc_Request_Download_Notice_Task_003
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_Notice_Task_003', 0, async function (done) {
      console.info("====>---------------------SUB_Misc_Request_Download_Notice_Task_003 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_003.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_003.txt`);
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: true
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_Misc_Request_Download_Notice_Task_003 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>SUB_Misc_Request_Download_Notice_Task_003 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', async () => {
            try {
              downloadTask.off('complete');
              console.info('====>SUB_Misc_Request_Download_Notice_Task_003 complete success');
              fs.unlinkSync(downloadFilePath);
              console.info('====>SUB_Misc_Request_Download_Notice_Task_003 delete files success');
              await downloadTask.delete();
              console.info('====>SUB_Misc_Request_Download_Notice_Task_003 delete downloadTask');
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Misc_Request_Download_Notice_Task_003 complete error: " + JSON.stringify(err));
              done();
            }
          });
        } catch (err) {
          console.info("====>SUB_Misc_Request_Download_Notice_Task_003 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fs.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number SUB_Misc_Request_DownloadManagement_0002
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_DownloadManagement_0002', 0, async function (done) {
      console.info("====>---------------------SUB_Misc_Request_DownloadManagement_0002 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_DownloadManagement_0002.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_DownloadManagement_0002.txt`);
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }

      let downLoadTask = await request.downloadFile(globalThis.abilityContext, downloadFileConfig);
      try {
        // @ts-ignore
        let bool = await downLoadTask.suspend("123")
        console.info('====>SUB_Misc_Request_DownloadManagement_0002 bool: ' + bool);
        // @ts-ignore
        let bool1 = await downLoadTask.restore(123)
        console.info('====>SUB_Misc_Request_DownloadManagement_0002 bool1: ' + bool1);

        // @ts-ignore
        let DownloadInfo = await downLoadTask.getTaskInfo(false)
        console.info('====>SUB_Misc_Request_DownloadManagement_0002 DownloadInfo: ' + DownloadInfo);

        // @ts-ignore
        let str = await downLoadTask.getTaskMimeType("")
        console.info('====>SUB_Misc_Request_DownloadManagement_0002 string: ' + str);

        // @ts-ignore
        let bool2 = await downLoadTask.delete("true")
        console.info('====>SUB_Misc_Request_DownloadManagement_0002 bool2: ' + bool2);

        expect(typeof bool === "boolean").assertTrue();
        expect(typeof bool1 === "boolean").assertTrue();
        expect(typeof bool2 === "boolean").assertTrue();
        expect(typeof DownloadInfo === "object").assertTrue();
        expect(typeof str === "string").assertTrue();
        fs.unlinkSync(downloadFilePath);
        console.info('====>SUB_Misc_Request_DownloadManagement_0002  exception parameter success');
        done();
      } catch (err) {
        console.info("====>SUB_Misc_Request_DownloadManagement_0002 exception parameter err" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_Request_DownloadManagement_0003
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_DownloadManagement_0003', 0, async function (done) {
      console.info("====>---------------------SUB_Misc_Request_DownloadManagement_0003 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_DownloadManagement_0003.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_DownloadManagement_0003.txt`);
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
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
        console.info("====>SUB_Misc_Request_DownloadManagement_0003 write data to file succeed and size is:" + writeLen);
        fs.closeSync(file);
        await request.downloadFile(globalThis.abilityContext, downloadFileConfig);
        console.info("====>SUB_Misc_Request_DownloadManagement_0003 downloadFile success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Misc_Request_DownloadManagement_0003 error: " + JSON.stringify(err));
        fs.unlinkSync(downloadFilePath);
        expect(err.code).assertEqual(13400002);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_Request_DownloadManagement_0004
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_DownloadManagement_0004', 0, async function (done) {
      console.info("====>---------------------SUB_Misc_Request_DownloadManagement_0004 is starting---------------------");
      let downloadFilePath = `/data/app/el2/100/base/com.example.myapplication/haps/entry_test/cache/SUB_Misc_Request_DownloadManagement_0004.txt`
      console.info("====>downloadFileConfig: " + `${downloadFilePath}`);
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      try {
        await request.downloadFile(globalThis.abilityContext, downloadFileConfig);
        console.info("====>SUB_Misc_Request_DownloadManagement_0004 downloadFile success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Misc_Request_DownloadManagement_0004 error: " + JSON.stringify(err));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_Request_DownloadManagement_0005
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_DownloadManagement_0005', 0, async function (done) {
      console.info("====>SUB_Misc_Request_DownloadManagement_0005 is starting");
      let downloadFileConfig = {
        url: '/downloadTest/releases/download/v1.0/test.apk',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: "downloadFilePath",
        title: 'XTS download test!',
        background: false
      }
      try {
        await request.downloadFile(globalThis.abilityContext, downloadFileConfig)
        console.info('====>SUB_Misc_Request_DownloadManagement_0005 Download success.');
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_Request_DownloadManagement_0005 except error: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001', 0, async function (done) {
      console.info("====>---------------------SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001 is starting---------------------");
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', async () => {
            try {
              downloadTask.off('complete');
              console.info('====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001 complete success');
              await downloadTask.delete();
              console.info('====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001 delete downloadTask');
              fs.unlinkSync(`${globalThis.abilityContext.cacheDir}/test.apk`);
              console.info('====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002 delete files success');
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001 complete error: " + JSON.stringify(err));
              done();
            }
          });
        } catch (err) {
          console.info("====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001 error: " + JSON.stringify(err));
          await downloadTask.delete();
          done();
        }
      })
    });

    /**
     * @tc.number SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002', 0, async function (done) {
      console.info("====>---------------------SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002.txt`);
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', async () => {
            try {
              downloadTask.off('complete');
              console.info('====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002 complete success');
              fs.unlinkSync(downloadFilePath);
              console.info('====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002 delete files success');
              await downloadTask.delete();
              console.info('====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002 delete downloadTask');
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002 complete error: " + JSON.stringify(err));
              done();
            }
          });
        } catch (err) {
          console.info("====>SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fs.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001', 0, async function (done) {
      console.info("====>---------------------SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001.txt`);
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      let flag;
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', async () => {
            flag = true;
            try {
              downloadTask.off('complete');
              console.info('====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 complete success');
              await downloadTask.delete();
              console.info('====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 delete downloadTask');
            } catch (err) {
              console.info("====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 complete error: " + JSON.stringify(err));
            }
          });
        } catch (err) {
          console.info("====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fs.unlinkSync(downloadFilePath);
        }
      })
      await sleep(8000);
      if (flag) {
        try {
          await request.downloadFile(globalThis.abilityContext, downloadFileConfig);
          console.info("====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 second downloadTask success");
          expect().assertFail();
          done();
        } catch (err) {
          fs.unlinkSync(downloadFilePath);
          console.info("====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 second downloadTask fail: " + JSON.stringify(err));
          expect(err.code).assertEqual(13400002);
          done();
        }
      } else {
        console.info("====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 first downloadTask can not complete");
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Download_Promise_0030
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Download_Promise_0030', 0, async function (done) {
      console.info("====>SUB_Misc_REQUEST_Download_Promise_0030 is starting");
      let downloadFileConfig = {
        url: 'xxxxxxx.xxx',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: "downloadFilePath",
        title: 'XTS download test!',
        background: false
      }
      try {
        await request.downloadFile(globalThis.abilityContext, downloadFileConfig);
        console.info('====>SUB_Misc_REQUEST_Download_Promise_0030 Download success.');
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Download_Promise_0030 except error: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Download_Promise_0050
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Download_Promise_0050', 0, async function (done) {
      console.info("====>SUB_Misc_REQUEST_Download_Promise_0050 is starting");
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: "downloadFilePath",
        title: 'XTS download test!',
        background: false
      }
      try {
        // @ts-ignore
        await request.downloadFile(downloadFileConfig);
        console.info('====>SUB_Misc_REQUEST_Download_Promise_0050 Download success.');
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Download_Promise_0050 except error: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number Download_Test_0300
     * @tc.desc Called when the current download session fails.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_0300', 0, async function (done) {
      console.info("====>---------------------Download_Test_0300 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/Download_Test_0300.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/Download_Test_0300.txt`);
      let downloadFileConfig = {
        url: 'https://xxx.com.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>Download_Test_0300 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>Download_Test_0300 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('fail', async () => {
            try {
              downloadTask.off('fail');
              console.info('====>Download_Test_0300 fail success');
              fs.unlinkSync(downloadFilePath);
              console.info('====>Download_Test_0300 delete files success');
              await downloadTask.delete();
              console.info('====>Download_Test_0300 delete downloadTask');
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.info("====>Download_Test_0300 fail error: " + JSON.stringify(err));
              done();
            }
          });
        } catch (err) {
          console.info("====>Download_Test_0300 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fs.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number Download_Test_0400
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_0400', 0, async function (done) {
      console.info("====>---------------------Download_Test_0400 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/Download_Test_0400.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/Download_Test_0400.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>Download_Test_0400 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>Download_Test_0400 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', async () => {
            try {
              downloadTask.off('complete');
              console.info('====>Download_Test_0400 complete success');
              fs.unlinkSync(downloadFilePath);
              console.info('====>Download_Test_0400 delete files success');
              await downloadTask.delete();
              console.info('====>Download_Test_0400 delete downloadTask');
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.info("====>Download_Test_0400 complete error: " + JSON.stringify(err));
              done();
            }
          });
        } catch (err) {
          console.info("====>Download_Test_0400 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fs.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number Download_Test_0600
     * @tc.desc Called when the current download session fails.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_0600', 0, async function (done) {
      console.info("====>---------------------Download_Test_0600 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/Download_Test_0600.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/Download_Test_0600.txt`);
      let downloadFileConfig = {
        url: 'https://xxx.com.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      let flag = true;
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>Download_Test_0600 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>Download_Test_0600 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('fail', async () => {
            flag = false;
            console.info("====>Download_Test_0600 complete flag " + flag);
          });
          downloadTask.off('fail');
          await sleep(30);
          if (flag) {
            console.info('====>Download_Test_0600 onFail success');
            fs.unlinkSync(downloadFilePath);
            console.info('====>Download_Test_0600 delete files success');
            await downloadTask.delete();
            console.info('====>Download_Test_0600 delete downloadTask');
            expect(true).assertTrue();
            done();
          } else {
            console.info("====>Download_Test_0600 onFail error: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.info("====>Download_Test_0600 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fs.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number Download_Test_0700
     * @tc.desc Called when the current download session fails.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_0700', 0, async function (done) {
      console.info("====>---------------------Download_Test_0700 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/Download_Test_0700.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/Download_Test_0700.txt`);
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      let flag = true;
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>Download_Test_0700 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>Download_Test_0700 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', async () => {
            flag = false;
            console.info("====>Download_Test_0700 complete flag " + flag);
          });
          downloadTask.off('complete');
          await sleep(8000);
          if (flag) {
            console.info('====>Download_Test_0700 onFail success');
            fs.unlinkSync(downloadFilePath);
            console.info('====>Download_Test_0700 delete files success');
            await downloadTask.delete();
            console.info('====>Download_Test_0700 delete downloadTask');
            expect(true).assertTrue();
            done();
          } else {
            console.info("====>Download_Test_0700 onFail error: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.info("====>Download_Test_0700 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fs.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

    /**
     * @tc.number Download_Test_1100
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_1100', 0, async function (done) {
      console.info("====>---------------------Download_Test_1100 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/Download_Test_1100.txt`
      let downloadFilePath1 = `${globalThis.abilityContext.tempDir}/Download_Test1_1100.txt`
      let downloadFilePath2 = `${globalThis.abilityContext.tempDir}/Download_Test2_1100.txt`
      console.info("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/Download_Test_1100.txt`)
      let downloadFileConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      try {
        let  task = await request.downloadFile(globalThis.abilityContext, downloadFileConfig);
        console.info('====>Download_Test_1100 task1 success');

        let downloadFileConfig1 = downloadFileConfig
        downloadFileConfig1.filePath = downloadFilePath1
        let  task1 = await request.downloadFile(globalThis.abilityContext, downloadFileConfig1);
        console.info('====>Download_Test_1100 task2 success');

        let downloadFileConfig2 = downloadFileConfig
        downloadFileConfig2.filePath = downloadFilePath2
        let  task2 = await request.downloadFile(globalThis.abilityContext, downloadFileConfig2);
        console.info('====>Download_Test_1100 task2 success');

        await task.delete();
        console.info('====>Download_Test_1100 task delete success');
        await task1.delete();
        console.info('====>Download_Test_1100 task1 delete success');
        await task2.delete();
        console.info('====>Download_Test_1100 task2 delete success');
        fs.unlinkSync(downloadFilePath);
        console.info('====>Download_Test_1100 task delete file success');
        fs.unlinkSync(downloadFilePath1);
        console.info('====>Download_Test_1100 task1 delete file success');
        fs.unlinkSync(downloadFilePath2);
        console.info('====>Download_Test_1100 task2 delete file success');
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info("====>Download_Test_1100 error: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number Download_Test_1400
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_1400', 0, async function (done) {
      console.info("====>Download_Test_1400 is starting");
      let downloadFileConfig = {
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: "downloadFilePath",
        title: 'XTS download test!',
        background: false
      }
      try {
        // @ts-ignore
        await request.downloadFile(globalThis.abilityContext, downloadFileConfig);
        console.info('====>Download_Test_1400 Download success.');
        expect().assertFail();
      } catch (err) {
        console.info("====>Download_Test_1400 except error: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number Download_Test_0100
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_0100', 0, async function (done) {
      console.info("====>Download_Test_0100 is starting");
      let downloadFileConfig = {
        url: 'https://mirror.bjtu.edu.cn/kernel/linux/devel/binutils/biniutils-2.11.90.0.23-2.11.90.0.24.sign',
        header: {},
        enableMetered: true,
        enableRoaming: true,
        description: 'a2',
        networkType: 1,
        filePath: "/system/lib/abc2.txt",
        title: 'a2'
      }
      try {
        // @ts-ignore
        await request.downloadFile(globalThis.abilityContext, downloadFileConfig);
        console.info('====>Download_Test_0100 Download success.');
        expect().assertFail();
      } catch (err) {
        console.info("====>Download_Test_0100 except error: " + JSON.stringify(err));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

  });
}