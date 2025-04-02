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
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestDownloadJSUnit() {
  describe('requestDownloadJSUnit', function () {
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
     * @tc.number    SUB_MISC_REQUEST_DOWNLOAD_state_0010
     * @tc.name      T download task
     * @tc.desc      Test requestUploadTest API functionality.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MISC_REQUEST_DOWNLOAD_state_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_state_0010 is starting-----------------------");
      try {
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_state_0010 request.agent.State.INITIALIZED:" + request.agent.State.INITIALIZED);
        expect(request.agent.State.INITIALIZED).assertEqual(0);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_state_0010 request.agent.State.WAITING:" + request.agent.State.WAITING);
        expect(request.agent.State.WAITING).assertEqual(16);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_state_0010 request.agent.State.RUNNING:" + request.agent.State.RUNNING);
        expect(request.agent.State.RUNNING).assertEqual(32);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_state_0010 request.agent.State.RETRYING:" + request.agent.State.RETRYING);
        expect(request.agent.State.RETRYING).assertEqual(33);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_state_0010 request.agent.State.PAUSED:" + request.agent.State.PAUSED);
        expect(request.agent.State.PAUSED).assertEqual(48);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_state_0010 request.agent.State.STOPPED:" + request.agent.State.STOPPED);
        expect(request.agent.State.STOPPED).assertEqual(49);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_state_0010 request.agent.State.COMPLETED:" + request.agent.State.COMPLETED);
        expect(request.agent.State.COMPLETED).assertEqual(64);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_state_0010 request.agent.State.FAILED:" + request.agent.State.FAILED);
        expect(request.agent.State.FAILED).assertEqual(65);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_state_0010 request.agent.State.REMOVED:" + request.agent.State.REMOVED);
        expect(request.agent.State.REMOVED).assertEqual(80);
      } catch (err) {
        console.error("====>SUB_MISC_REQUEST_DOWNLOAD_state_0010 error: " + err);
        expect().assertFail();
      }
      console.info("====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_state_0010 end-----------------------");
      done();
    })

    /**
     * @tc.number    SUB_MISC_REQUEST_DOWNLOAD_faults_0010
     * @tc.name      T download task
     * @tc.desc      Test requestUploadTest API functionality.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MISC_REQUEST_DOWNLOAD_faults_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_faults_0010 is starting-----------------------");
      try {
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_0010 request.agent.Faults.OTHERS: " + request.agent.Faults.OTHERS);
        expect(request.agent.Faults.OTHERS).assertEqual(255);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_0010 request.agent.Faults.DISCONNECTED: " + request.agent.Faults.DISCONNECTED);
        expect(request.agent.Faults.DISCONNECTED).assertEqual(0);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_0010 request.agent.Faults.TIMEOUT: " + request.agent.Faults.TIMEOUT);
        expect(request.agent.Faults.TIMEOUT).assertEqual(16);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_0010 request.agent.Faults.PROTOCOL: " + request.agent.Faults.PROTOCOL);
        expect(request.agent.Faults.PROTOCOL).assertEqual(32);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_0010 request.agent.Faults.FSIO: " + request.agent.Faults.FSIO);
        expect(request.agent.Faults.FSIO).assertEqual(64);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_0010 request.agent.Faults.PARAM: " + request.agent.Faults.PARAM);
        expect(request.agent.Faults.PARAM).assertEqual(48);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_0010 request.agent.Faults.DNS: " + request.agent.Faults.DNS);
        expect(request.agent.Faults.DNS).assertEqual(80);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_0010 request.agent.Faults.TCP: " + request.agent.Faults.TCP);
        expect(request.agent.Faults.TCP).assertEqual(96);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_0010 request.agent.Faults.SSL: " + request.agent.Faults.SSL);
        expect(request.agent.Faults.SSL).assertEqual(112);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_0010 request.agent.Faults.REDIRECT: " + request.agent.Faults.REDIRECT);
        expect(request.agent.Faults.REDIRECT).assertEqual(128);
      } catch (err) {
        console.error("====>SUB_MISC_REQUEST_DOWNLOAD_faults_0010 error: " + err);
        expect().assertFail();
      }
      console.info("====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_faults_0010 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Download_Callback_0010
     * @tc.name    SUB_Misc_REQUEST_Create_Download_Callback_0010
     * @tc.desc      Starts a download session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Download_Callback_0010', 0, async function (done) {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Download_Callback_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Create_Download_Callback_0010.txt',
        network: request.agent.Network.WIFI,
        mode:request.agent.Mode.BACKGROUND
      };

      request.agent.create(globalThis.abilityContext, config, async (err, task)=>{
        console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0010 downloadTask: " + task);
        try{
          if(err){
            console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0010 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          expect(task !== undefined).assertEqual(true);
          expect(typeof(task.config) === "object").assertEqual(true);
          console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0010 create success: " + task);
        }catch(error){
          console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0010 create fail: " + JSON.stringify(error));
        }
        await request.agent.remove(task.tid);
        console.info("-----------------------SUB_Misc_REQUEST_Create_Download_Callback_0010 end-----------------------");
        done();
      });
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Download_Promise_0010
     * @tc.name    SUB_Misc_REQUEST_Create_Download_Promise_0010
     * @tc.desc      Starts a download session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Download_Promise_0010', 0, async function (done) {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Download_Promise_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Create_Download_Promise_0010.txt',
        network: request.agent.Network.WIFI,
        mode:request.agent.Mode.BACKGROUND
      };

      try {
        var task = await request.agent.create(globalThis.abilityContext, config);
        expect(task !== undefined).assertEqual(true);
        await request.agent.remove(task.tid);
        console.info("====>SUB_Misc_REQUEST_Create_Download_Promise_0010 create success: " + task);
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Download_Promise_0010 catch error: " + JSON.stringify(err));
        await request.agent.remove(task.tid);
        expect().assertFail();
      }
      console.info("-----------------------SUB_Misc_REQUEST_Create_Download_Promise_0010 end-----------------------");
      done();
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Remove_Download_Callback_0010
     * @tc.name SUB_Misc_REQUEST_Remove_Download_Callback_0010
     * @tc.desc Delete the download task.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Callback_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Download_Callback_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Remove_Download_Callback_0010.txt',
        network: request.agent.Network.ANY,
      };

      try {
        let task = await request.agent.create(globalThis.abilityContext, config);
        request.agent.remove(task.tid, err => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0010 remove err: " + JSON.stringify(err));
              expect().assertFail();
            }
            expect(task !== undefined).assertEqual(true);
            console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0010 remove success: " + task);
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0010 remove fail: " + JSON.stringify(err));
          }
        });
        done();
      } catch (error) {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0010 catch error: " + JSON.stringify(error));
        expect().assertFail();
      }
      console.info("-----------------------SUB_Misc_REQUEST_Remove_Download_Callback_0010 end-----------------------");
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Remove_Download_Promise_0010
     * @tc.name SUB_Misc_REQUEST_Remove_Download_Promise_0010
     * @tc.desc Delete the download task.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Promise_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Download_Promise_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Remove_Download_Promise_0010.txt',
        network: request.agent.Network.ANY,
      };

      try {
        let task = await request.agent.create(globalThis.abilityContext, config);
        await request.agent.remove(task.tid);
        expect(true).assertEqual(true);
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0010 remove success: " + task);
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0010 catch error: " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("-----------------------SUB_Misc_REQUEST_Remove_Download_Promise_0010 end-----------------------");
      done();
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Start_Download_Callback_0010
     * @tc.name SUB_Misc_REQUEST_Start_Download_Callback_0010
     * @tc.desc Suspend the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Start_Download_Callback_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Start_Download_Callback_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Start_Download_Callback_0010.txt',
        network: request.agent.Network.ANY,
      };

      request.agent.create(globalThis.abilityContext, config, async (err, task)=>{
        console.info("====>SUB_Misc_REQUEST_Start_Download_Callback_0010 downloadTask: " + task);
        task.start(async err => {
          try{
            if(err){
              console.info("====>SUB_Misc_REQUEST_Start_Download_Callback_0010 download start err: " + JSON.stringify(err));
              expect().assertFail();
            }
            expect(true).assertEqual(true);
            console.info("====>SUB_Misc_REQUEST_Start_Download_Callback_0010 download start success: " + task);
          }catch(err){
            console.info("====>SUB_Misc_REQUEST_Start_Download_Callback_0010 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
          }
          await request.agent.remove(task.tid);
          console.info("-----------------------SUB_Misc_REQUEST_Start_Download_Callback_0010 end-----------------------");
          done();
        })
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Start_Download_Promise_0010
     * @tc.name SUB_Misc_REQUEST_Start_Download_Promise_0010
     * @tc.desc Suspend the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Start_Download_Promise_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Start_Download_Promise_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Start_Download_Promise_0010.txt',
        network: request.agent.Network.ANY,
      };

      try {
        var task = await request.agent.create(globalThis.abilityContext, config);
        await task.start();
        expect(true).assertEqual(true);
        await request.agent.remove(task.tid);
        console.info("====>SUB_Misc_REQUEST_Start_Download_Promise_0010 download start success: " + task);
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Start_Download_Promise_0010 download start err: " + JSON.stringify(err));
        await request.agent.remove(task.tid);
        expect().assertFail();
      }
      console.info("-----------------------SUB_Misc_REQUEST_Start_Download_Promise_0010 end-----------------------");
      done();
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Pause_Download_Callback_0010
     * @tc.name SUB_Misc_REQUEST_Pause_Download_Callback_0010
     * @tc.desc Restore the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Pause_Download_Callback_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Pause_Download_Callback_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Pause_Download_Callback_0010.txt',
        network: request.agent.Network.WIFI,
      };

      request.agent.create(globalThis.abilityContext, config, async (err, task)=>{
        console.info("====>SUB_Misc_REQUEST_Pause_Download_Callback_0010 downloadTask: " + task);
        task.start(err => {
          console.info("====>SUB_Misc_REQUEST_Pause_Download_Callback_0010 download start: " + JSON.stringify(err));
          task.pause(async err => {
            try{
              if(err){
                console.info("====>SUB_Misc_REQUEST_Pause_Download_Callback_0010 download pause err: " + JSON.stringify(err));
                expect().assertFail();
              }
              expect(true).assertEqual(true);
              console.info("====>SUB_Misc_REQUEST_Pause_Download_Callback_0010 download pause success: " + task);
            }catch(err){
              console.info("====>SUB_Misc_REQUEST_Pause_Download_Callback_0010 catch err: " + JSON.stringify(err));
            }
            await request.agent.remove(task.tid);
            console.info("-----------------------SUB_Misc_REQUEST_Pause_Download_Callback_0010 end-----------------------");
            done();
          })
        })
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Pause_Download_Promise_0010
     * @tc.name SUB_Misc_REQUEST_Pause_Download_Promise_0010
     * @tc.desc Restore the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Pause_Download_Promise_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Pause_Download_Promise_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Pause_Download_Promise_0010.txt',
        network: request.agent.Network.WIFI,
      };

      let task = await request.agent.create(globalThis.abilityContext, config);
      task.start(async err => {
        try {
          console.info("====>SUB_Misc_REQUEST_Pause_Download_Promise_0010 download start: " + JSON.stringify(err));
          await task.pause();
          expect(true).assertEqual(true);
          await request.agent.remove(task.tid);
          console.info("====>SUB_Misc_REQUEST_Pause_Download_Promise_0010 download pause success: " + task);
          done();
        } catch (err) {
          console.info("====>SUB_Misc_REQUEST_Pause_Download_Promise_0010 download pause err: " + JSON.stringify(err));
          await request.agent.remove(task.tid);
          expect().assertFail();
          done();
        }
      })
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Resume_Download_Callback_0010
     * @tc.name SUB_Misc_REQUEST_Resume_Download_Callback_0010
     * @tc.desc Get the download task info
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Resume_Download_Callback_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Resume_Download_Callback_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Resume_Download_Callback_0010.txt',
        network: request.agent.Network.WIFI,
      };

      request.agent.create(globalThis.abilityContext, config, async (err, task)=>{
        console.info("====>SUB_Misc_REQUEST_Resume_Download_Callback_0010 downloadTask: " + task);
        task.start(err => {
          console.info("====>SUB_Misc_REQUEST_Resume_Download_Callback_0010 start: " + JSON.stringify(err));
          task.pause(err => {
            console.info("====>SUB_Misc_REQUEST_Resume_Download_Callback_0010 pause: " + JSON.stringify(err));
            task.resume(async err => {
              try{
                if(err){
                  console.info("====>SUB_Misc_REQUEST_Resume_Download_Callback_0010 download resume err: " + JSON.stringify(err));
                  expect().assertFail();
                }
                expect(true).assertEqual(true);
                console.info("====>SUB_Misc_REQUEST_Resume_Download_Callback_0010 download resume success: " + task);
              }catch(err){
                console.info("====>SUB_Misc_REQUEST_Resume_Download_Callback_0010 catch err: " + JSON.stringify(err));
              }
              await request.agent.remove(task.tid);
              console.info("-----------------------SUB_Misc_REQUEST_Resume_Download_Callback_0010 end-----------------------");
              done();
            })
          })
        })
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Resume_Download_Promise_0010
     * @tc.name SUB_Misc_REQUEST_Resume_Download_Promise_0010
     * @tc.desc Get the download task info
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Resume_Download_Promise_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Resume_Download_Promise_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Resume_Download_Promise_0010.txt',
        network: request.agent.Network.WIFI,
      };

      let task = await request.agent.create(globalThis.abilityContext, config);
      task.start(err => {
        console.info("====>SUB_Misc_REQUEST_Resume_Download_Promise_0010 start: " + JSON.stringify(err));
        task.pause(async err => {
          console.info("====>SUB_Misc_REQUEST_Resume_Download_Promise_0010 pause: " + JSON.stringify(err));
          try {
            await task.resume();
            expect(true).assertEqual(true);
            await request.agent.remove(task.tid);
            console.info("====>SUB_Misc_REQUEST_Resume_Download_Promise_0010 download resume success: " + task);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Resume_Download_Promise_0010 download resume err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            expect().assertFail();
            done();
          }
        });
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Stop_Download_Callback_0010
     * @tc.name SUB_Misc_REQUEST_Stop_Download_Callback_0010
     * @tc.desc Get mimetype of the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Stop_Download_Callback_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Stop_Download_Callback_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Stop_Download_Callback_0010.txt',
        network: request.agent.Network.WIFI,
      };

      request.agent.create(globalThis.abilityContext, config, async (err, task)=>{
        console.info("====>SUB_Misc_REQUEST_Stop_Download_Callback_0010 downloadTask: " + task);
        task.start(err => {
          console.info("====>SUB_Misc_REQUEST_Stop_Download_Callback_0010 start: " + JSON.stringify(err));
          task.stop(async err => {
            try{
              if(err){
                console.info("====>SUB_Misc_REQUEST_Stop_Download_Callback_0010 download stop err: " + JSON.stringify(err));
                expect().assertFail();
              }
              expect(true).assertEqual(true);
              console.info("====>SUB_Misc_REQUEST_Stop_Download_Callback_0010 download stop success: " + task);
            }catch(err){
              console.info("====>SUB_Misc_REQUEST_Stop_Download_Callback_0010 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
            }
            console.info("-----------------------SUB_Misc_REQUEST_Stop_Download_Callback_0010 end-----------------------");
            done();
          })
        })
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Stop_Download_Promise_0010
     * @tc.name SUB_Misc_REQUEST_Stop_Download_Promise_0010
     * @tc.desc  download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Stop_Download_Promise_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Stop_Download_Promise_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Stop_Download_Promise_0010.txt',
        network: request.agent.Network.WIFI,
      };

      let task = await request.agent.create(globalThis.abilityContext, config);
      task.start(async err => {
        console.info("====>SUB_Misc_REQUEST_Stop_Download_Promise_0010 start: " + JSON.stringify(err));
        try {
          await task.stop();
          expect(true).assertEqual(true);
          console.info("====>SUB_Misc_REQUEST_Stop_Download_Promise_0010 download stop success: " + task);
          done();
        } catch (err) {
          console.info("====>SUB_Misc_REQUEST_Stop_Download_Promise_0010 download stop err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
    });

    /**
     * @tc.number SUB_Misc_REQUEST_On_Download_Progress_0040
     * @tc.name SUB_Misc_REQUEST_On_Download_Progress_0040
     * @tc.desc  download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Progress_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Progress_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Progress_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = async (pro) => {
            task.off('progress', on_progressCallback);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 pro.state: " + pro.state);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 pro.index: " + pro.index);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 pro.processed: " + pro.processed);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 pro.size: " + pro.sizes);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 pro.extras: " + JSON.stringify(pro.extras));
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 task has complete: " + JSON.stringify(task.tid));
            }
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Off_Download_Progress_0040
     * @tc.name SUB_Misc_REQUEST_Off_Download_Progress_0040
     * @tc.desc  download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Progress_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Progress_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Progress_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 on_progressCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            task.off('progress', on_progressCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 offProgress success flag: " + flag);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_On_Download_Completed_0040
     * @tc.name SUB_Misc_REQUEST_On_Download_Completed_0040
     * @tc.desc  download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Completed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Completed_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Completed_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_completedCallback =async (pro) => {
            task.off('completed', on_completedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 pro.state: " + pro.state);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 pro.index: " + pro.index);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 pro.processed: " + pro.processed);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 pro.sizes: " + pro.sizes);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 pro.extras: " + JSON.stringify(pro.extras));
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Off_Download_Completed_0040
     * @tc.name SUB_Misc_REQUEST_Off_Download_Completed_0040
     * @tc.desc  download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Completed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Completed_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Completed_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_offCompletedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 on_offCompletedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_offCompletedCallback);
            task.off('completed', on_offCompletedCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 offCompleted success flag: " + flag);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 offCompleted fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_On_Download_Failed_0040
     * @tc.name SUB_Misc_REQUEST_On_Download_Failed_0040
     * @tc.desc  download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Failed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Failed_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/xxxxxxxxxxx/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Failed_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_failedCallback = async (pro) => {
            task.off('failed', on_failedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 pro.state: " + pro.state);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 pro.index: " + pro.index);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 pro.processed: " + pro.processed);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 pro.size: " + pro.size);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 pro.extras: " + JSON.stringify(pro.extras));
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Off_Download_Failed_0040
     * @tc.name SUB_Misc_REQUEST_Off_Download_Failed_0040
     * @tc.desc  download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Failed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Failed_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/xxxxxxxxxxx/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Failed_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_failedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 on_failedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            task.off('failed', on_failedCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 offFailed success flag: " + flag);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 offFailed fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Create_Download_Callback_0060
     * @tc.name SUB_Misc_REQUEST_Create_Download_Callback_0060
     * @tc.desc Suspend the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Download_Callback_0060', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Create_Download_Callback_0060 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Create_Download_Callback_0060.txt',
        overwrite: true,
        network: request.agent.Network.WIFI,
        mode:request.agent.Mode.FOREGROUND
      };
      request.agent.create(globalThis.abilityContext, config, async (err, task1)=>{
        console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0060 uploadTask: " + task1);
        try{
          if(err){
            console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0060 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          request.agent.create(globalThis.abilityContext, config, async (err, task2)=>{
            try {
              if(err){
                console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0060 create err: " + JSON.stringify(err));
                expect().assertFail();
              }
              console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0060 task2 create success");
              await task1.start();
              await request.agent.remove(task1.tid);
              console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0060 task1 remove");
              await request.agent.remove(task2.tid);
              console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0060 task2 remove");
              expect(true).assertTrue()
              done();
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0060 create success: " + JSON.stringify(err));
              done();
            }
          });
        }catch(error){
          console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0060 create fail: " + JSON.stringify(error));
          done();
        }
        console.info("-----------------------SUB_Misc_REQUEST_Create_Download_Callback_0060 end-----------------------");
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Create_Download_Promise_0060
     * @tc.name SUB_Misc_REQUEST_Create_Download_Promise_0060
     * @tc.desc Suspend the download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Download_Promise_0060', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Create_Download_Promise_0060 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Create_Download_Promise_0060.txt',
        overwrite: true,
        network: request.agent.Network.WIFI,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        let task1 = await request.agent.create(globalThis.abilityContext, config);
        let task2 = await request.agent.create(globalThis.abilityContext, config);
        console.info("====>SUB_Misc_REQUEST_Create_Download_Promise_0060 task1 and task2 create success");
        await request.agent.remove(task1.tid);
        console.info("====>SUB_Misc_REQUEST_Create_Download_Promise_0060 task1 remove");
        await request.agent.remove(task2.tid);
        console.info("====>SUB_Misc_REQUEST_Create_Download_Promise_0060 task2 remove");
        expect(true).assertTrue()
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Download_Promise_0060 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Agent_GetTask_Promise_0100
     * @tc.name   SUB_REQUEST_Agent_GetTask_Promise_0100
     * @tc.desc   request.agent.getTask(),Promise
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Agent_GetTask_Promise_0100', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_Agent_GetTask_Promise_0100 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_REQUEST_Agent_GetTask_Promise_0100.txt',
        network: request.agent.Network.ANY,
        priority:0,
      };

      try {
        let task = await request.agent.create(globalThis.abilityContext, config);
        let task1 = await request.agent.getTask(globalThis.abilityContext, task.tid);
        console.info("====>SUB_REQUEST_Agent_GetTask_Promise_0100 Succeeded in querying a download task: " + JSON.stringify(task));
        console.info("====>SUB_REQUEST_Agent_GetTask_Promise_0100 Succeeded in querying a download task1: " + JSON.stringify(task1));
        let taskStr1 = JSON.stringify(task);
        let taskStr2 = JSON.stringify(task1);
        expect(taskStr1 === taskStr2).assertTrue();
        try {
          await request.agent.remove(task1.tid);
          console.info("====>SUB_REQUEST_Agent_GetTask_Promise_0100 remove success: " + task);
        } catch (err) {
          console.info('====>SUB_REQUEST_Agent_GetTask_Promise_0100 task not remove: ' + JSON.stringify(task1.tid));
        }
        done();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_GetTask_Promise_0100 Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Download_TaskGrouping_1000
     * @tc.name   SUB_Request_Download_TaskGrouping_1000
     * @tc.desc   request group task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Download_TaskGrouping_1000', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_TaskGrouping_1000 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_TaskGrouping_1000.txt',
        network: request.agent.Network.ANY,
      };

      try {
        let notification: request.agent.Notification = {
          text:'',
          title:''
        }
        let groupConfig: request.agent.GroupConfig = {
          gauge: true,
          notification: notification
        }
        let task = await request.agent.create(baseContext, config);
        let gid: string = await request.agent.createGroup(groupConfig)
        console.info("====>SUB_Request_Download_TaskGrouping_1000 createGroup success");
        await request.agent.attachGroup(gid, [task.tid]);
        console.info("====>SUB_Request_Download_TaskGrouping_1000 attachGroup success tid: " + task.tid);
        await request.agent.deleteGroup(gid);
        console.info("====>SUB_Request_Download_TaskGrouping_1000 deleteGroup success");
        expect(gid !== '').assertTrue();
        expect(typeof gid === 'string').assertTrue();
        await request.agent.remove(task.tid);
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_TaskGrouping_1000 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Download_TaskGrouping_1100
     * @tc.name   SUB_Request_Download_TaskGrouping_1100
     * @tc.desc   request group task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Download_TaskGrouping_1100', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_TaskGrouping_1100 is starting-----------------------");
      try {
        await request.agent.deleteGroup('');
        console.info("====>SUB_Request_Download_TaskGrouping_1100 deleteGroup success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_TaskGrouping_1100 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Download_TaskGrouping_1200
     * @tc.name   SUB_Request_Download_TaskGrouping_1200
     * @tc.desc   request group task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Download_TaskGrouping_1200', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_TaskGrouping_1200 is starting-----------------------");
      try {
        await request.agent.attachGroup('123', []);
        console.info("====>SUB_Request_Download_TaskGrouping_1200 deleteGroup success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_TaskGrouping_1200 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900008);
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Download_TaskGrouping_1300
     * @tc.name   SUB_Request_Download_TaskGrouping_1300
     * @tc.desc   request group task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Download_TaskGrouping_1300', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_TaskGrouping_1300 is starting-----------------------");
      try {
        let notification: request.agent.Notification = {
          text:'',
          title:''
        }
        let groupConfig: request.agent.GroupConfig = {
          gauge: true,
          notification: notification
        }
        let gid: string = await request.agent.createGroup(groupConfig)
        console.info("====>SUB_Request_Download_TaskGrouping_1300 createGroup success");
        await request.agent.attachGroup(gid, []);
        console.info("====>SUB_Request_Download_TaskGrouping_1300 attachGroup success tid");
        expect(gid !== '').assertTrue();
        expect(typeof gid === 'string').assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_TaskGrouping_1300 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Download_TaskGrouping_1400
     * @tc.name   SUB_Request_Download_TaskGrouping_1400
     * @tc.desc   request group task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Download_TaskGrouping_1400', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_TaskGrouping_1400 is starting-----------------------");
      try {
        let text: string = ''.padEnd(1025, 'title')
        let notification: request.agent.Notification = {
          title: text
        }
        let groupConfig: request.agent.GroupConfig = {
          notification: notification
        }
        let gid: string = await request.agent.createGroup(groupConfig)
        console.info("====>SUB_Request_Download_TaskGrouping_1400 createGroup success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_TaskGrouping_1400 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Download_TaskGrouping_1500
     * @tc.name   SUB_Request_Download_TaskGrouping_1500
     * @tc.desc   request group task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Download_TaskGrouping_1500', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_TaskGrouping_1500 is starting-----------------------");
      try {
        let text: string = ''.padEnd(1024, 'title')
        let notification: request.agent.Notification = {
          title: text
        }
        let groupConfig: request.agent.GroupConfig = {
          notification: notification
        }
        let gid: string = await request.agent.createGroup(groupConfig)
        console.info("====>SUB_Request_Download_TaskGrouping_1500 createGroup success");
        expect(gid !== '').assertTrue();
        expect(typeof gid === 'string').assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_TaskGrouping_1500 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Download_TaskGrouping_1600
     * @tc.name   SUB_Request_Download_TaskGrouping_1600
     * @tc.desc   request group task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Download_TaskGrouping_1600', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_TaskGrouping_1600 is starting-----------------------");
      try {
        let text: string = ''.padEnd(3073, 'text')
        let notification: request.agent.Notification = {
          text: text
        }
        let groupConfig: request.agent.GroupConfig = {
          notification: notification
        }
        await request.agent.createGroup(groupConfig)
        console.info("====>SUB_Request_Download_TaskGrouping_1600 createGroup success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_TaskGrouping_1600 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Download_TaskGrouping_1700
     * @tc.name   SUB_Request_Download_TaskGrouping_1700
     * @tc.desc   request group task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Download_TaskGrouping_1700', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_TaskGrouping_1700 is starting-----------------------");
      try {
        let text: string = ''.padEnd(3072, 'text')
        let notification: request.agent.Notification = {
          text: text
        }
        let groupConfig: request.agent.GroupConfig = {
          notification: notification
        }
        let gid: string = await request.agent.createGroup(groupConfig)
        console.info("====>SUB_Request_Download_TaskGrouping_1700 createGroup success");
        expect(gid !== '').assertTrue();
        expect(typeof gid === 'string').assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_TaskGrouping_1700 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Download_TaskGrouping_0700
     * @tc.name   SUB_Request_Download_TaskGrouping_0700
     * @tc.desc   request group task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Download_TaskGrouping_0700', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_TaskGrouping_0700 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_TaskGrouping_0700.txt',
        network: request.agent.Network.ANY,
      };
      let notification: request.agent.Notification = {
        text:'',
        title:''
      }
      let groupConfig: request.agent.GroupConfig = {
        gauge: true,
        notification: notification
      }

      let task: request.agent.Task | null = null;

      try {
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Download_TaskGrouping_0700 create task success");
        let gid: string = await request.agent.createGroup(groupConfig)
        console.info("====>SUB_Request_Download_TaskGrouping_0700 createGroup success");
        await task.start();
        console.info("====>SUB_Request_Download_TaskGrouping_0700 task start success");
        await request.agent.attachGroup(gid, [task.tid]);
        console.info("====>SUB_Request_Download_TaskGrouping_0700 attachGroup success tid: " + task.tid);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_TaskGrouping_0700 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900007);
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Agent_customizingNotification_0500
     * @tc.name   SUB_Request_Agent_customizingNotification_0500
     * @tc.desc   testing text and title of notification
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Agent_customizingNotification_0500', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_customizingNotification_0500 is starting-----------------------");
      let notification: request.agent.Notification = {
        text: undefined,
        title: undefined
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.FOREGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_customizingNotification_0500.txt',
        network: request.agent.Network.ANY,
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_customizingNotification_0500 create foreground task success");
        expect(task !== null).assertTrue();
        await request.agent.remove(task.tid);
        done();
      } catch (err) {
        console.info("====>SUB_Request_Agent_customizingNotification_0500 err: " + JSON.stringify(err));
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Agent_customizingNotification_0600
     * @tc.name   SUB_Request_Agent_customizingNotification_0600
     * @tc.desc   testing text and title of notification
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Agent_customizingNotification_0600', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_customizingNotification_0600 is starting-----------------------");
      let text: string = ''.padEnd(3073, 'text')
      let notification: request.agent.Notification = {
        text: text
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_customizingNotification_0600.txt',
        network: request.agent.Network.ANY,
      };
      let task: request.agent.Task | null = null;
      try {
        console.info("====>SUB_Request_Agent_customizingNotification_0600 text length: " + config.notification?.text?.length);
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_customizingNotification_0600 create task success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Agent_customizingNotification_0600 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Agent_customizingNotification_0700
     * @tc.name   SUB_Request_Agent_customizingNotification_0700
     * @tc.desc   testing text and title of notification
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Agent_customizingNotification_0700', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_customizingNotification_0700 is starting-----------------------");
      let title: string = ''.padEnd(1025, 'text')
      let notification: request.agent.Notification = {
        title: title
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_customizingNotification_0700.txt',
        network: request.agent.Network.ANY,
      };
      let task: request.agent.Task | null = null;
      try {
        console.info("====>SUB_Request_Agent_customizingNotification_0800 title length: " + config.notification?.title?.length);
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_customizingNotification_0700 create task success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Agent_customizingNotification_0700 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Agent_customizingNotification_0800
     * @tc.name   SUB_Request_Agent_customizingNotification_0800
     * @tc.desc   testing text and title of notification
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Agent_customizingNotification_0800', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_customizingNotification_0800 is starting-----------------------");
      let notification: request.agent.Notification = {
        text: undefined,
        title: undefined
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_customizingNotification_0800.txt',
        network: request.agent.Network.ANY,
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_customizingNotification_0800 create foreground task success");
        expect(task !== null).assertTrue();
        await request.agent.remove(task.tid);
        done();
      } catch (err) {
        console.info("====>SUB_Request_Agent_customizingNotification_0800 err: " + JSON.stringify(err));
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Agent_customizingNotification_0900
     * @tc.name   SUB_Request_Agent_customizingNotification_0900
     * @tc.desc   testing text and title of notification
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Agent_customizingNotification_0900', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_customizingNotification_0900 is starting-----------------------");
      let text: string = ''.padEnd(3072, 'text')
      let title: string = ''.padEnd(1024, 'text')
      let notification: request.agent.Notification = {
        text: text,
        title: title
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_customizingNotification_0900.txt',
        network: request.agent.Network.ANY,
      };
      let task: request.agent.Task | null = null;
      try {
        console.info("====>SUB_Request_Agent_customizingNotification_0900 text length: " + config.notification?.text?.length);
        console.info("====>SUB_Request_Agent_customizingNotification_0900 title length: " + config.notification?.title?.length);
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_customizingNotification_0900 create foreground task success");
        expect(task !== null).assertTrue();
        await request.agent.remove(task.tid);
        done();
      } catch (err) {
        console.info("====>SUB_Request_Agent_customizingNotification_0900 err: " + JSON.stringify(err));
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Agent_customizingNotification_1000
     * @tc.name   SUB_Request_Agent_customizingNotification_1000
     * @tc.desc   testing text and title of notification
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Agent_customizingNotification_1000', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_customizingNotification_1000 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: undefined,
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_customizingNotification_1000.txt',
        network: request.agent.Network.ANY,
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_customizingNotification_1000 create foreground task success");
        expect(task !== null).assertTrue();
        await request.agent.remove(task.tid);
        done();
      } catch (err) {
        console.info("====>SUB_Request_Agent_customizingNotification_1000 err: " + JSON.stringify(err));
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        expect().assertFail();
        done();
      }
    });

  });
}
