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

import request from "@ohos.request";
import fileio from '@ohos.fileio';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

export default function requestDownloadJSUnit() {
  describe('requestDownloadJSUnit', () => {
    console.info('====>################################request download Test start');

    let baseContext: common.Context;
    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll((done: Function) => {
      try {
        let context: common.Context | undefined = AppStorage.get('context');
        if (context !== undefined){
          baseContext = context;
          console.info('====>beforeAll requestDownloadJSUnit baseContext:'+JSON.stringify(baseContext))
          done();
        } else {
          console.info('====>beforeAll requestDownloadJSUnit baseContext is undefined')
          done();
        }
      } catch (err) {
        console.info('====>beforeAll requestDownloadJSUnit catch err:'+JSON.stringify(err))
        done();
      }
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(() => {
      console.info('====>beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(() => {
      console.info('====>afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(() => {
      console.info('====>afterAll: Test suite-level cleanup condition is executed');
    });

    let sleep = (timeout: number): Promise<ESObject> => {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    let deleteTask = async (task: request.DownloadTask, path: string): Promise<void> => {
      try {
        let ifDelete = await task.delete();
        console.info('====>if task delete: ' + ifDelete);
        fileio.unlinkSync(path);
        console.info('====>if uninstall file success');
      } catch (err) {
        console.info('====>task delete failed, possibly the task delete err: ' + JSON.stringify(err));
      }
    }

    /**
     * @tc.number    SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001
     * @tc.desc      Starts a download session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 is starting-----------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask)=>{
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 is starting-----------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
        request.downloadFile(baseContext, downloadFileConfig).then(async (downloadTask) => {
          console.info("====>SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 downloadTask: " + downloadTask);
          expect(downloadTask != undefined).assertEqual(true);
          await downloadTask.delete();
          fileio.unlinkSync(downloadFilePath);
          done();
        }).catch((err: BusinessError) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_REQUEST_DOWNLOAD_API_DELETE_0001', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_delete_0001 is starting-----------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0001.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0001.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
              expect(data === true).assertTrue();
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_REQUEST_DOWNLOAD_API_DELETE_0002', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DELETE_0002 is starting-----------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0002.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0002.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.delete().then(async data => {
            expect(data).assertEqual(true);
            console.info('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 Download task delete success.');
            fileio.unlinkSync(downloadFilePath);
            done();
            console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DELETE_0002 end-----------------------");
          }).catch(async (err: BusinessError) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 is starting-----------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 is starting-----------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_RESTORE_0001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 is starting-----------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0001.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0001.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_RESTORE_0002', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 is starting-----------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0002.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0002.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.restore().then(async data => {
            console.info('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 Download task restore.');
            expect(data == true).assertTrue();
            await downloadTask.delete();
            fileio.unlinkSync(downloadFilePath);
            done();
          }).catch(async (err: BusinessError) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001', Level.LEVEL0, async (done: Function) => {
      console.info("====>---------------------SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002', Level.LEVEL2, async (done: Function) => {
      console.info("====>-------------------SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 is starting----------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.getTaskInfo().then(async data => {
            expect(typeof data == "object").assertTrue();
            console.info('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 Download task getTaskInfo success.');
            await downloadTask.delete();
            fileio.unlinkSync(downloadFilePath);
            done();

          }).catch(async (err: BusinessError) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002', Level.LEVEL2, async (done: Function) => {
      console.info("====>-------------------SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002 is starting----------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_Notice_Task_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_Download_Notice_Task_001 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_001.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_001.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_Notice_Task_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_Download_Notice_Task_002 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_002.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_002.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_Notice_Task_003', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_Download_Notice_Task_003 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_003.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_Misc_Request_Download_Notice_Task_003.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.number SUB_Misc_Request_DownloadManagement_0003
     * @tc.desc Get mimetype of the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_DownloadManagement_0003', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_DownloadManagement_0003 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_Misc_Request_DownloadManagement_0003.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_Misc_Request_DownloadManagement_0003.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
        await request.downloadFile(baseContext, downloadFileConfig);
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_DownloadManagement_0004', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_DownloadManagement_0004 is starting---------------------");
      let downloadFilePath = `/data/app/el2/100/base/com.example.myapplication/haps/entry_test/cache/SUB_Misc_Request_DownloadManagement_0004.txt`
      console.info("====>downloadFileConfig: " + `${downloadFilePath}`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
        await request.downloadFile(baseContext, downloadFileConfig);
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
     * @tc.number  SUB_Misc_Request_DownloadManagement_0014
     * @tc.name    SUB_Misc_Request_DownloadManagement_0014
     * @tc.desc    error config of the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_DownloadManagement_0014', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_DownloadManagement_0014 is starting---------------------");
      let downloadFilePath = `/data/app/el2/100/base/com.example.myapplication/haps/entry_test/cache/SUB_Misc_Request_DownloadManagement_0014.txt`
      console.info("====>downloadFileConfig: " + `${downloadFilePath}`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
        request.downloadFile(baseContext, downloadFileConfig, (err: BusinessError, downloadTask: request.DownloadTask) => {
          try {
            console.info("====>SUB_Misc_Request_DownloadManagement_0014 callback");
            expect().assertFail();
            done();
          }catch (err) {
            console.info("====>SUB_Misc_Request_DownloadManagement_0014 err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_Request_DownloadManagement_0014 create error: " + JSON.stringify(err));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_Request_DownloadManagement_0005
     * @tc.desc Starts a download session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_DownloadManagement_0005', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_Misc_Request_DownloadManagement_0005 is starting");
      let downloadFileConfig: request.DownloadConfig = {
        url: '/downloadTest/releases/download/v1.0/test.apk',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: "downloadFilePath",
        title: 'XTS download test!',
        background: false
      }
      try {
        await request.downloadFile(baseContext, downloadFileConfig)
        console.info('====>SUB_Misc_Request_DownloadManagement_0005 Download success.');
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_Request_DownloadManagement_0005 except error: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number  SUB_Misc_Request_DownloadManagement_0015
     * @tc.name    SUB_Misc_Request_DownloadManagement_0015
     * @tc.desc    param error.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_DownloadManagement_0015', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_Misc_Request_DownloadManagement_0015 is starting");
      let downloadFileConfig: request.DownloadConfig = {
        url: '/downloadTest/releases/download/v1.0/test.apk',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: "downloadFilePath",
        title: 'XTS download test!',
        background: false
      }
      try {
        request.downloadFile(baseContext, downloadFileConfig, (err: BusinessError, downloadTask: request.DownloadTask) => {
          try {
            console.info("====>SUB_Misc_Request_DownloadManagement_0015 callback");
            expect().assertFail();
            done();
          }catch (err) {
            console.info("====>SUB_Misc_Request_DownloadManagement_0015 err: " + JSON.stringify(err));
            done();
          }
        })
      } catch (err) {
        console.info("====>SUB_Misc_Request_DownloadManagement_0005 param error: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001
     * @tc.desc Get mimetype of the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_001 is starting---------------------");
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
              fs.unlinkSync(`${baseContext.cacheDir}/test.hap`);
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_Misc_Request_Download_SupportSystem_DownloadSuccess_002.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', async () => {
            try {
              downloadTask.off('complete');
              console.info('====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 complete off success');
              await request.downloadFile(baseContext, downloadFileConfig);
              console.info("====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 second downloadTask success");
              expect().assertFail();
              done();
            } catch (err) {
              try {
                fs.unlinkSync(downloadFilePath);
                console.info("====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 second downloadTask fail: " + JSON.stringify(err));
                expect(err.code).assertEqual(13400002);
                done();
              } catch (err) {
                console.info("====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 catch err: " + JSON.stringify(err));
                done();
              }
            }
          });
        } catch (err) {
          console.info("====>SUB_Misc_Request_Download_SupportSystem_ConflictDownload_001 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fs.unlinkSync(downloadFilePath);
        }
      })
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Download_Promise_0030
     * @tc.desc Starts a download session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Download_Promise_0030', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_Misc_REQUEST_Download_Promise_0030 is starting");
      let downloadFileConfig: request.DownloadConfig = {
        url: 'xxxxxxx.xxx',
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: "downloadFilePath",
        title: 'XTS download test!',
        background: false
      }
      try {
        await request.downloadFile(baseContext, downloadFileConfig);
        console.info('====>SUB_Misc_REQUEST_Download_Promise_0030 Download success.');
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Download_Promise_0030 except error: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number Download_Test_0400
     * @tc.desc Get mimetype of the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_0400', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------Download_Test_0400 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/Download_Test_0400.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/Download_Test_0400.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_0600', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------Download_Test_0600 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/Download_Test_0600.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/Download_Test_0600.txt`);
      let downloadFileConfig: request.DownloadConfig = {
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_0700', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------Download_Test_0700 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/Download_Test_0700.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/Download_Test_0700.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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
          downloadTask.on('progress',async (size, totalSize) => {
            console.info(`====>size: ${size}; totalSize  ${totalSize}`);
            if (size === totalSize){
              try {
                console.info('====>Download_Test_0700 into expect');
                await sleep(100);
                downloadTask.off('progress');
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
                console.info('====>Download_Test_0700 catch err: ' + JSON.stringify(err));
                done();
              }
            }
          })
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
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_1100', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------Download_Test_1100 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/Download_Test_1100.txt`
      let downloadFilePath1 = `${baseContext.tempDir}/Download_Test1_1100.txt`
      let downloadFilePath2 = `${baseContext.tempDir}/Download_Test2_1100.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/Download_Test_1100.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
        let  task = await request.downloadFile(baseContext, downloadFileConfig);
        console.info('====>Download_Test_1100 task1 success');

        let downloadFileConfig1 = downloadFileConfig
        downloadFileConfig1.filePath = downloadFilePath1
        let  task1 = await request.downloadFile(baseContext, downloadFileConfig1);
        console.info('====>Download_Test_1100 task2 success');

        let downloadFileConfig2 = downloadFileConfig
        downloadFileConfig2.filePath = downloadFilePath2
        let  task2 = await request.downloadFile(baseContext, downloadFileConfig2);
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
     * @tc.number Download_Test_0100
     * @tc.desc Starts a download session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>Download_Test_0100 is starting");
      let downloadFileConfig: request.DownloadConfig = {
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
        await request.downloadFile(baseContext, downloadFileConfig);
        console.info('====>Download_Test_0100 Download success.');
        expect().assertFail();
      } catch (err) {
        console.info("====>Download_Test_0100 except error: " + JSON.stringify(err));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /**
     * @tc.number    SUB_REQUEST_DownloadManagement_Download_0500
     * @tc.desc      download delete task.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DownloadManagement_Download_0500', Level.LEVEL2, async (done: Function) => {
      console.info('-----------------------SUB_REQUEST_DownloadManagement_Download_0500 is starting-----------------------');
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DownloadManagement_Download_0500.txt`;
      console.info('====>downloadFileConfig:' + `${baseContext.tempDir}/SUB_REQUEST_DownloadManagement_Download_0500.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask)=>{
        console.info('====>SUB_REQUEST_DownloadManagement_Download_0500 downloadTask: ' + downloadTask);
        let onProgress = async (receivedSize: number, totalSize: number) => {
          try {
            downloadTask.off('progress', onProgress);
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0500 onProgress success: ');
            let ifDelete: boolean = await downloadTask.delete();
            expect(ifDelete === true).assertTrue();
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0500 delete ifDelete: ' + ifDelete);
            fileio.unlinkSync(downloadFilePath);
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0500 unlinkSync success: ');
            done();
          } catch (err) {
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0500 onProgress err: ' + JSON.stringify(err));
            done();
          }
        }
        try{
          if(err){
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0500 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          downloadTask.on('progress', onProgress);
        } catch (error) {
          await deleteTask(downloadTask, downloadFilePath)
          console.info('====>SUB_REQUEST_DownloadManagement_Download_0500 catch error: ' + error);
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DownloadManagement_Download_0300
     * @tc.desc      download pause task.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DownloadManagement_Download_0300', Level.LEVEL2, async (done: Function) => {
      console.info('-----------------------SUB_REQUEST_DownloadManagement_Download_0300 is starting-----------------------');
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DownloadManagement_Download_0300.txt`;
      console.info('====>downloadFileConfig:' + `${baseContext.tempDir}/SUB_REQUEST_DownloadManagement_Download_0300.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask)=>{
        console.info('====>SUB_REQUEST_DownloadManagement_Download_0300 downloadTask: ' + downloadTask);
        let onProgress = async (receivedSize: number, totalSize: number) => {
          try {
            downloadTask.off('progress');
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0300 onProgress success: ');
            await downloadTask.pause();
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0300 downloadTask.pause success: ');
          } catch (err) {
            await deleteTask(downloadTask, downloadFilePath);
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0300 onProgress err: ' + JSON.stringify(err));
            done();
          }
        }

        let pauseProgress = async () => {
          try {
            await deleteTask(downloadTask, downloadFilePath);
            downloadTask.off('pause');
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0300 pauseProgress success: ');
            expect(downloadTask !== null).assertTrue();
            done();
          } catch (err) {
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0300 pauseProgress err: ' + JSON.stringify(err));
            done();
          }
        }

        try{
          if(err){
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0300 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          downloadTask.on('progress', onProgress);
          downloadTask.on('pause', pauseProgress);
        } catch (error) {
          await deleteTask(downloadTask, downloadFilePath)
          console.info('====>SUB_REQUEST_DownloadManagement_Download_0300 catch error: ' + error);
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DownloadManagement_Download_0310
     * @tc.desc      download pause task.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DownloadManagement_Download_0310', Level.LEVEL2, async (done: Function) => {
      console.info('-----------------------SUB_REQUEST_DownloadManagement_Download_0310 is starting-----------------------');
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DownloadManagement_Download_0310.txt`;
      console.info('====>downloadFileConfig:' + `${baseContext.tempDir}/SUB_REQUEST_DownloadManagement_Download_0310.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask)=>{
        console.info('====>SUB_REQUEST_DownloadManagement_Download_0310 downloadTask: ' + downloadTask);
        let onProgress = async (receivedSize: number, totalSize: number) => {
          try {
            downloadTask.off('progress');
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0310 onProgress success: ');
            await downloadTask.pause();
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0310 downloadTask.pause success: ');
          } catch (err) {
            await deleteTask(downloadTask, downloadFilePath);
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0310 onProgress err: ' + JSON.stringify(err));
            done();
          }
        }

        let pauseProgress = async () => {
          try {
            await deleteTask(downloadTask, downloadFilePath);
            downloadTask.off('pause', pauseProgress);
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0310 pauseProgress success: ');
            expect(downloadTask !== null).assertTrue();
            done();
          } catch (err) {
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0310 pauseProgress err: ' + JSON.stringify(err));
            done();
          }
        }

        try{
          if(err){
            console.info('====>SUB_REQUEST_DownloadManagement_Download_0310 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          downloadTask.on('progress', onProgress);
          downloadTask.on('pause', pauseProgress);
        } catch (error) {
          await deleteTask(downloadTask, downloadFilePath)
          console.info('====>SUB_REQUEST_DownloadManagement_Download_0310 catch error: ' + error);
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DownloadManagement_DownloadSuccess_0100
     * @tc.desc      download complete task.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DownloadManagement_DownloadSuccess_0100', Level.LEVEL2, async (done: Function) => {
      console.info('-----------------------SUB_REQUEST_DownloadManagement_DownloadSuccess_0100 is starting-----------------------');
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_DownloadManagement_DownloadSuccess_0100.txt`;
      console.info('====>downloadFileConfig:' + `${baseContext.tempDir}/SUB_REQUEST_DownloadManagement_DownloadSuccess_0100.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask)=>{
        console.info('====>SUB_REQUEST_DownloadManagement_DownloadSuccess_0100 downloadTask: ' + downloadTask);
        let completeProgress = async () => {
          try {
            downloadTask.off('complete');
            console.info('====>SUB_REQUEST_DownloadManagement_DownloadSuccess_0100 completeProgress success: ');
            await deleteTask(downloadTask, downloadFilePath);
            expect(downloadTask !== null).assertTrue();
            done();
          } catch (err) {
            console.info('====>SUB_REQUEST_DownloadManagement_DownloadSuccess_0100 completeProgress err: ' + JSON.stringify(err));
            done();
          }
        }

        try{
          if(err){
            console.info('====>SUB_REQUEST_DownloadManagement_DownloadSuccess_0100 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          downloadTask.on('complete', completeProgress);
        } catch (error) {
          await deleteTask(downloadTask, downloadFilePath)
          console.info('====>SUB_REQUEST_DownloadManagement_DownloadSuccess_0100 catch error: ' + error);
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_SupportSystem_DownloadMultitask_0100
     * @tc.desc      download completed multipart tasks.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_SupportSystem_DownloadMultitask_0100', Level.LEVEL2, async (done: Function) => {
      console.info('-----------------------SUB_REQUEST_SupportSystem_DownloadMultitask_0100 is starting-----------------------');
      let downloadFilePath1 = `${baseContext.tempDir}/downloadFilePath1.txt`;
      let downloadFilePath2 = `${baseContext.tempDir}/downloadFilePath2.txt`;
      let downloadFileConfig1: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath1,
        title: 'XTS download test!',
        background: false
      }

      let downloadFileConfig2: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath2,
        title: 'XTS download test!',
        background: false
      }

      let complete1: boolean = false;
      let complete2: boolean = false;
      let downloadTask1 = await request.downloadFile(baseContext, downloadFileConfig1);
      let downloadTask2 = await request.downloadFile(baseContext, downloadFileConfig2);
      console.info('====>SUB_REQUEST_SupportSystem_DownloadMultitask_0100 create tow tasks success' );
      let completeProgress1 = async () => {
        complete1 = true;
        downloadTask1.off('complete', completeProgress1);
        console.info('====>SUB_REQUEST_SupportSystem_DownloadMultitask_0100 completeProgress1 success');
        await deleteTask(downloadTask1, downloadFilePath1);
        if(complete2){
          console.info('====>SUB_REQUEST_SupportSystem_DownloadMultitask_0100 both complete1');
          expect(downloadTask1 !== null).assertTrue();
          done();
        } else  {
          console.info('====>SUB_REQUEST_SupportSystem_DownloadMultitask_0100 completeProgress1 complete');
        }
      }

      let completeProgress2 = async () => {
        complete2 = true;
        downloadTask2.off('complete', completeProgress2);
        console.info('====>SUB_REQUEST_SupportSystem_DownloadMultitask_0100 completeProgress2 success: ');
        await deleteTask(downloadTask2, downloadFilePath2);
        if(complete1){
          console.info('====>SUB_REQUEST_SupportSystem_DownloadMultitask_0100 both complete2');
          expect(downloadTask1 !== null).assertTrue();
          done();
        } else  {
          console.info('====>SUB_REQUEST_SupportSystem_DownloadMultitask_0100 completeProgress2 complete');
        }
      }
      downloadTask1.on('complete', completeProgress1);
      downloadTask2.on('complete', completeProgress2);
    });

    /**
     * @tc.number    SUB_REQUEST_SupportSystem_DownloadSuccess_0300
     * @tc.desc      download pass on header task.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_SupportSystem_DownloadSuccess_0300', Level.LEVEL2, async (done: Function) => {
      console.info('-----------------------SUB_REQUEST_SupportSystem_DownloadSuccess_0300 is starting-----------------------');
      let downloadFilePath = `${baseContext.tempDir}/SUB_REQUEST_SupportSystem_DownloadSuccess_0300.txt`
      console.info('====>downloadFileConfig:' + `${baseContext.tempDir}/SUB_REQUEST_SupportSystem_DownloadSuccess_0300.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        header:{
          'Content-Type': 'application/octet-stream'
        },
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask)=>{
        console.info('====>SUB_REQUEST_SupportSystem_DownloadSuccess_0300 downloadTask: ' + downloadTask);
        let completeProgress = async () => {
          try {
            downloadTask.off('complete');
            console.info('====>SUB_REQUEST_SupportSystem_DownloadSuccess_0300 completeProgress success: ');
            await deleteTask(downloadTask, downloadFilePath);
            expect(downloadTask !== null).assertTrue();
            done();
          } catch (err) {
            console.info('====>SUB_REQUEST_SupportSystem_DownloadSuccess_0300 completeProgress err: ' + JSON.stringify(err));
            done();
          }
        }

        try{
          if(err){
            console.info('====>SUB_REQUEST_SupportSystem_DownloadSuccess_0300 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          downloadTask.on('complete', completeProgress);
        } catch (error) {
          await deleteTask(downloadTask, downloadFilePath)
          console.info('====>SUB_REQUEST_SupportSystem_DownloadSuccess_0300 catch error: ' + error);
        }
      });
    });

    /**
     * @tc.number    SUB_Request_download_Default_0100
     * @tc.name      SUB_Request_download_Default_0100
     * @tc.desc      download pass on header task.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_download_Default_0100', Level.LEVEL2, async (done: Function) => {
      console.info('-----------------------SUB_Request_download_Default_0100 is starting-----------------------');
      let downloadFilePath = `${baseContext.cacheDir}/test.hap`
      console.info('====>downloadFileConfig:' + `${baseContext.cacheDir}/test.hap`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        filePath: undefined,
        header: undefined,
        enableMetered: undefined,
        enableRoaming: undefined,
        description: undefined,
        networkType: undefined,
        title: undefined,
        background: undefined,
      }
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask)=>{
        console.info('====>SUB_Request_download_Default_0100 downloadTask: ' + downloadTask);
        let completeProgress = async () => {
          try {
            downloadTask.off('complete');
            console.info('====>SUB_Request_download_Default_0100 completeProgress success: ');
            await deleteTask(downloadTask, downloadFilePath);
            expect(downloadTask !== null).assertTrue();
            done();
          } catch (err) {
            console.info('====>SUB_Request_download_Default_0100 completeProgress err: ' + JSON.stringify(err));
            done();
          }
        }

        try{
          if(err){
            console.info('====>SUB_Request_download_Default_0100 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          downloadTask.on('complete', completeProgress);
        } catch (error) {
          await deleteTask(downloadTask, downloadFilePath)
          console.info('====>SUB_Request_download_Default_0100 catch error: ' + error);
        }
      });
    });

  });
}