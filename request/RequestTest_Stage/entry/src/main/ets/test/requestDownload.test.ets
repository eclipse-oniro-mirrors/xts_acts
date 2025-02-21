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
              console.info('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 Download task delete success.');
              expect(typeof data == "boolean").assertTrue();
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
            console.info('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 Download task delete success.');
            expect(data).assertEqual(true);
            console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DELETE_0002 end-----------------------");
            fileio.unlinkSync(downloadFilePath);
            done();
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
              console.info('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 Download task suspend success.');
              expect(data == true).assertTrue();
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
              console.info('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 Download  restore success.');
              expect(data == true).assertTrue();
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
              console.info('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 Download getTaskInfo success.');
              expect(typeof data == "object").assertTrue();
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
            console.info('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 Download task getTaskInfo success.');
            expect(typeof data == "object").assertTrue();
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
  });
}