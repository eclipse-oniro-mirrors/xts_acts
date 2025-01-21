/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility'
import fileio from '@ohos.fileio';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index";

export default function requestDownloadJSUnit() {
  describe('requestDownloadTest', function () {
    console.info('====>################################request download Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(async function () {
      console.info('====>beforeAll: Prerequisites are executed.');
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(async function () {
      console.info('====>beforeEach: Prerequisites is executed.');
      await setDownLoadConfig()
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

    let downloadConfig
    async function setDownLoadConfig(){
      let downloadFilePath = await featureAbility.getContext().getFilesDir()
      downloadConfig = {
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: `${downloadFilePath}/`,
        title: 'XTS download test!',
        background: false
      }
    }

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0001
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0001
     * @tc.desc      alled when the current download session is in process.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0001 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0001.txt';
      let flag = false;
      let filePath = downloadConfig.filePath;
      request.download(downloadConfig, async (err, downloadTask)=>{
        try{
          console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0001 downloadTask: " + JSON.stringify(downloadTask) );
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('progress', async (data1, data2) => {
            if (data1 == data2 && flag == false){
              flag = true;
              try{
                console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0001 on data1 =" + data1);
                console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0001 on data2 =" + data2);
                expect(true).assertEqual(data1 != undefined);
                expect(true).assertEqual(data2 != undefined);

                downloadTask.off('progress');
                await downloadTask.remove();
                fileio.unlinkSync(filePath);
                done();
              }catch(err){
                console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0001 throw_error: " + err);
                downloadTask.off('progress');
                await downloadTask.remove();
                fileio.unlinkSync(filePath);
                done();
              }
            }
          });
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0001 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0002
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0002
     * @tc.desc       Called when the current download session complete、pause or remove.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0002 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0002.txt';
      let flag = false;
      let filePath = downloadConfig.filePath;
      request.download(downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', async () => {
            if (flag == false){
              flag = true;
              downloadTask.off('complete');
              try{
                console.info('====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0002 task completed.')
                expect(true).assertTrue();
              }catch(err){
                console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0002 throw_error: " + err);
              }
              downloadTask.off('complete');
              await downloadTask.remove();
              fileio.unlinkSync(filePath);
              done();
            }
          });
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0002 error: " + err);
          downloadTask.off('complete');
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0003
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0003
     * @tc.desc       Called when the current download session complete、pause or remove.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0003', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0003 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0003.txt';
      let flag = false;
      let filePath = downloadConfig.filePath;
      request.download(downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0003 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('pause', async () => {
            try{
              console.info('====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0003 task pause.')
              expect(true).assertTrue();
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0003 throw_error: " + err);
            }
            downloadTask.off('pause');
            await downloadTask.remove();
            fileio.unlinkSync(filePath);
            done();
          });
          downloadTask.on('progress', async (data1, data2) => {
            if (flag == false){
              flag = true
              await downloadTask.pause();
              downloadTask.off('progress');
            }
          });
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0003 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0004
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0004
     * @tc.desc       Called when the current download session complete、pause or remove.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0004', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0004 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0004.txt';
      let flag = false;
      let filePath = downloadConfig.filePath;
      request.download(downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0004 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('remove', () => {
            try{
              console.info('====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0004 remove remove')
              expect(true).assertTrue();
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0004 throw_error: " + err);
            }
            downloadTask.off('remove');
            fileio.unlinkSync(filePath);
            done();
          });
          downloadTask.on('progress', async (data1, data2) => {
            if(flag == false){
              flag = true;
              await downloadTask.remove();
              downloadTask.off('progress');
            }
          });
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0004 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0005
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0005
     * @tc.desc      Called when the current download session fails.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0005', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0005 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0005.txt';
      downloadConfig.url = 'https://www.baidu.com/xxxxxx.jpg';
      let flag = false;
      let filePath = downloadConfig.filePath;
      request.download(downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0005 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('fail', async (err) =>{
            try{
              console.info('====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0005 fail fail' + err)
              expect(true).assertTrue();
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0005 throw_error: " + err);
            }
            downloadTask.off('fail');
            await downloadTask.remove();
            fileio.unlinkSync(filePath);
            done();
          })
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0005 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0006
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0006
     * @tc.desc      Called when the current download session fails.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0006', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0006 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0006.txt';
      let flag = false;
      let filePath = downloadConfig.filePath;
      request.download(downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0006 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', async () => {
            try{
              await request.download(downloadConfig);
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0006 second throw_error: " + err);
              expect(err.code).assertEqual(undefined);
              downloadTask.off('complete');
              await downloadTask.remove();
              fileio.unlinkSync(filePath);
              done();
            }
          });
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_ON_0006 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0001
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0001
     * @tc.desc      alled when the current download session is in process.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0001 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0001.txt';
      let flag = false;
      let filePath = downloadConfig.filePath;
      request.download(downloadConfig, async (err, downloadTask)=>{
        try{
          console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0001 downloadTask: " + downloadTask);
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('progress', async (data1, data2) => {
            downloadTask.off('progress');
            await downloadTask.remove();
            fileio.unlinkSync(filePath);
            done();
          });

        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0001 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0002
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0002
     * @tc.desc      alled when the current download session complete、pause or remove.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0002 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0002.txt';
      let filePath = downloadConfig.filePath;
      request.download(downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('complete', () => {});
          downloadTask.off('complete');
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0002 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0003
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0003
     * @tc.desc      alled when the current download session complete、pause or remove.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0003', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0003 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0003.txt';
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0003 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('pause', () => {});
          downloadTask.off('pause');
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0003 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0004
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0004
     * @tc.desc      alled when the current download session complete、pause or remove.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0004', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0004 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0004.txt';
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0004 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('remove', () => {});
          downloadTask.off('remove');
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0004 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0005
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0005
     * @tc.desc      Called when the current download session fails.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0005', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0005 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0005.txt';
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0005 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('fail', (data) => {});
          downloadTask.off('fail');
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DOWNLOADTASK_OFF_0005 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_REMOVE_0001
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_REMOVE_0001
     * @tc.desc      Deletes a download session and the downloaded files.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_REMOVE_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_REMOVE_0001 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_REMOVE_0001.txt';
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_REMOVE_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.remove((err, data)=>{
            try{
              if(err) {
                console.error('====>SUB_REQUEST_DOWNLOAD_API_REMOVE_0001 Failed to remove the download task.');
                expect().assertFail();
              }
              if (data) {
                console.info('====>SUB_REQUEST_DOWNLOAD_API_REMOVE_0001 removed data:' + JSON.stringify(data));
                expect(data == true).assertTrue();
              } else {
                console.error('====>SUB_REQUEST_DOWNLOAD_API_REMOVE_0001 Failed to remove the download task.');
                expect().assertFail();
              }
            }catch(err){
              console.info('====>SUB_REQUEST_DOWNLOAD_API_REMOVE_0001 remove_throw_err:' + JSON.stringify(err))
            }
            fileio.unlinkSync(filePath);
            done();
          });
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_REMOVE_0001 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      })
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_REMOVE_0002
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_REMOVE_0002
     * @tc.desc      Deletes a download session and the downloaded files.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_REMOVE_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_REMOVE_0002 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_REMOVE_0002.txt';
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_REMOVE_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          let data = await downloadTask.remove();
          console.info('====>SUB_REQUEST_DOWNLOAD_API_REMOVE_0002 removed data:' + JSON.stringify(data));
          expect(data == true).assertTrue();
          fileio.unlinkSync(filePath);
          done();
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_REMOVE_0002 error: " + err);
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      })
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_PAUSE_0001
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_PAUSE_0001
     * @tc.desc      Pause a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_PAUSE_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_PAUSE_0001 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_PAUSE_0001.txt';
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_PAUSE_0001 downloadTask: " + downloadTask);
        expect(downloadTask != undefined).assertEqual(true);
        try{
          downloadTask.pause(async ()=>{
            try{
              expect(true).assertTrue();
              console.info('====>SUB_REQUEST_DOWNLOAD_API_PAUSE_0001 Download task pause success.');
            }catch(err){
              console.info('====>SUB_REQUEST_DOWNLOAD_API_PAUSE_0001 pause_throw_err:' + JSON.stringify(err))
            }
            await downloadTask.remove();
            fileio.unlinkSync(filePath);
            done();
          })
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_PAUSE_0001 error: " + JSON.stringify(err));
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      })
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_PAUSE_0002
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_PAUSE_0002
     * @tc.desc      Pause a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_PAUSE_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_PAUSE_0002 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_PAUSE_0002.txt';
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_PAUSE_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          await downloadTask.pause();
          await downloadTask.remove()
          fileio.unlinkSync(filePath);
          done();
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_PAUSE_0002 error: " + JSON.stringify(err));
          await downloadTask.remove()
          fileio.unlinkSync(filePath);
          done();
        }
      })
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_REMUSE_0001
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_REMUSE_0001
     * @tc.desc      Resume a paused download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_REMUSE_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_REMUSE_0001 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_REMUSE_0001.txt';
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_REMUSE_0001 downloadTask: " + downloadTask);
        expect(downloadTask != undefined).assertEqual(true);
        try{
          downloadTask.resume(async ()=>{
            try{
              expect(true).assertTrue();
              console.info('====>SUB_REQUEST_DOWNLOAD_API_REMUSE_0001 Download task resume success.');
            }catch(err){
              console.info('====>SUB_REQUEST_DOWNLOAD_API_REMUSE_0001 pause_throw_err:' + JSON.stringify(err))
            }
            await downloadTask.remove();
            fileio.unlinkSync(downloadConfig.filePath);
            done();
          })
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_REMUSE_0001 error: " + JSON.stringify(err));
          await downloadTask.remove();
          fileio.unlinkSync(downloadConfig.filePath);
          done();
        }
      })
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_REMUSE_0002
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_REMUSE_0002
     * @tc.desc      Resume a paused download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_REMUSE_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_REMUSE_0002 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_REMUSE_0002.txt';
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_REMUSE_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          await downloadTask.resume();
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_REMUSE_0002 error: " + JSON.stringify(err));
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      })
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_QUERY_0001
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_QUERY_0001
     * @tc.desc      Queries download information of a session, which is defined in DownloadSession.DownloadInfo.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_QUERY_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_QUERY_0001 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_QUERY_0001.txt';
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.query(async (err, downloadInfo)=>{
            try{
              if(err) {
                console.error('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 Failed to query: ' + JSON.stringify(err));
                expect().assertFail();
              } else {
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 query info: '+ downloadInfo.description);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 query info: '+ downloadInfo.downloadedBytes);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 query info: '+ downloadInfo.downloadId);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 query info: '+ downloadInfo.failedReason);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 query info: '+ downloadInfo.fileName);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 query info: '+ downloadInfo.filePath);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 query info: '+ downloadInfo.pausedReason);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 query info: '+ downloadInfo.status);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 query info: '+ downloadInfo.targetURI);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 query info: '+ downloadInfo.downloadTitle);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 query info: '+ downloadInfo.downloadTotalBytes);
                expect(true).assertTrue();
              }
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 throw_error: " + JSON.stringify(err));
            }
            await downloadTask.remove();
            fileio.unlinkSync(filePath);
            done();
          })
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_QUERY_0001 error: " + JSON.stringify(err));
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      })
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_QUERY_0002
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_QUERY_0002
     * @tc.desc      Queries download information of a session, which is defined in DownloadSession.DownloadInfo.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_QUERY_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_QUERY_0002 is starting-----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_QUERY_0002.txt';
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.query().then(async (downloadInfo)=>{
            try{
              if(err) {
                console.error('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 Failed to query: ' + JSON.stringify(err));
                expect().assertFail();
              } else {
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 query info: '+ downloadInfo.description);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 query info: '+ downloadInfo.downloadedBytes);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 query info: '+ downloadInfo.downloadId);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 query info: '+ downloadInfo.failedReason);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 query info: '+ downloadInfo.fileName);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 query info: '+ downloadInfo.filePath);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 query info: '+ downloadInfo.pausedReason);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 query info: '+ downloadInfo.status);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 query info: '+ downloadInfo.targetURI);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 query info: '+ downloadInfo.downloadTitle);
                console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 query info: '+ downloadInfo.downloadTotalBytes);
                expect(true).assertTrue();
              }
              await downloadTask.remove();
              fileio.unlinkSync(filePath);
              done();
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 error: " + JSON.stringify(err));
              await downloadTask.remove();
              fileio.unlinkSync(filePath);
              done();
            }
          }).catch(async (err)=>{
            console.error("====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002  catch_error: " + JSON.stringify(err));
            await downloadTask.remove();
            fileio.unlinkSync(filePath);
            expect().assertFail();
            done();
          })
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_QUERY_0002 error: " + JSON.stringify(err));
          await downloadTask.remove();
          fileio.unlinkSync(downloadConfig.filePath);
          done();
        }
      })
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001
     * @tc.desc      Queries the MIME type of the download file.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001', 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001 is starting---------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001.txt';
      let flag = false;
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('progress', async (data1, data2)=>{
            try {
                if (data1 > 0 && flag == false) {
                  flag = true;
                  downloadTask.off('progress');
                  downloadTask.queryMimeType(async (err, data) => {
                    try {
                      if (err) {
                        console.error('====>SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001 return_err:' + JSON.stringify(err));
                        fileio.unlinkSync(downloadConfig.filePath);
                        expect().assertFail();
                        done();
                      }
                      if (data) {
                        console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001 data:' + JSON.stringify(data));
                        expect(typeof data == "string").assertTrue();
                        await downloadTask.remove();
                        fileio.unlinkSync(filePath);
                        done();
                      } else {
                        console.error("====>SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001 data_error: ");
                        expect().assertFail();
                      }
                    } catch (err) {
                      console.error("====>SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001 throw_error: " + JSON.stringify(err));
                      await downloadTask.remove();
                      fileio.unlinkSync(filePath);
                      done();
                    }
                  });
                }
              } catch (err) {
                console.error("====>SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001 error: " + JSON.stringify(err));
                await downloadTask.remove();
                fileio.unlinkSync(filePath);
                done();
              }
          })
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0001 error: " + JSON.stringify(err));
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      })
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0002
     * @tc.name    SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0002
     * @tc.desc      Queries the MIME type of the download file.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0002', 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0002 is starting----------------------");
      downloadConfig.filePath += 'SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0002.txt';
      let flag = false;
      let filePath = downloadConfig.filePath;
      request.download( downloadConfig, async (err, downloadTask)=>{
        console.info("====>SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('progress', async (data1, data2) => {
            try{
                if(data1 > 0 && flag == false){
                  flag = true;
                  downloadTask.off('progress');
                  let data = await downloadTask.queryMimeType()
                  console.info('====>SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0002 Download task queryMimeType.');
                  expect(typeof data == "string").assertTrue();
                  downloadTask.off('progress');
                  await downloadTask.remove();
                  fileio.unlinkSync(filePath);
                  done();
                }
              }catch(err){
                console.error("====>SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0002 throw_error: " + err);
                await downloadTask.remove();
                fileio.unlinkSync(filePath);
                done();
              }
          })
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_QUERYMINETYPE_0002 error: " + JSON.stringify(err));
          await downloadTask.remove();
          fileio.unlinkSync(filePath);
          done();
        }
      })
    });
  })
}
