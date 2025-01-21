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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestDownloadOneJSUnitTest() {
  describe('requestDownloadOneJSUnit', function () {
    console.info('====>################################request download Test start');

    let sleep = function (timeout) {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Callback_0140
     * @tc.name    SUB_Misc_REQUEST_Create_Callback_0140
     * @tc.desc      Create a download Task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_create_Callback_0140", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://cidownload.openharmony.cn/version/Master_Version/OpenHarmony_5.0.2.45/20240924_092847/version-Master_Version-OpenHarmony_5.0.2.45-20240924_092847-hispark_taurus_Linux_weekly.tar.gz',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.FOREGROUND ,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_create_Callback_0140.txt",
        network: request.agent.Network.WIFI,
        index: 0,
        begins: 0,
        ends: 100,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_create_Callback_0140 is starting---------------------");
      request.agent.create(globalThis.abilityContext, config, async (err, task) => {
        try{
          if (err) {
            console.info("====>SUB_Misc_REQUEST_create_Callback_0140 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          task.on("completed", (progress) => {
            task.off("completed");
            let downloadSize = progress.sizes[0];
            console.info('====>downloadSize:' + downloadSize);
            let fileSize = config.ends - config.begins + 1;
            console.info('====>fileSize:'+ fileSize);
            expect(downloadSize).assertEqual(fileSize);
            console.info("====>----------SUB_Misc_REQUEST_create_Callback_0140 is end---------------");
            done();
          });
          await task.start();
        }catch(err){
          console.info("====>SUB_Misc_REQUEST_create_Callback_0140 create err: " + JSON.stringify(err));
          done();
        }
      });
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0140
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0140
     * @tc.desc      Create a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0140", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://cidownload.openharmony.cn/version/Master_Version/OpenHarmony_5.0.2.45/20240924_092847/version-Master_Version-OpenHarmony_5.0.2.45-20240924_092847-hispark_taurus_Linux_weekly.tar.gz',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0140.txt",
        network: request.agent.Network.WIFI,
        index: 0,
        begins: 0,
        ends: 100,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0140 is starting---------------------");

      try{
        let task = await request.agent.create(globalThis.abilityContext, config)
        async function onCompletedCallback(progress){
          task.off("completed");
          let downloadSize = progress.sizes[0]
          console.info('====>downloadSize:' + downloadSize)
          let fileSize = config.ends - config.begins + 1
          console.info('====>fileSize:'+ fileSize)
          expect(downloadSize).assertEqual(fileSize)
          done();
        }
        task.on("completed", onCompletedCallback)
        await task.start()
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0140 create err: " + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Callback_0160
     * @tc.name    SUB_Misc_REQUEST_Create_Callback_0160
     * @tc.desc      Create a download Task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_create_Callback_0160", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://cidownload.openharmony.cn/version/Master_Version/OpenHarmony_5.0.2.45/20240924_092847/version-Master_Version-OpenHarmony_5.0.2.45-20240924_092847-hispark_taurus_Linux_weekly.tar.gz',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_create_Callback_0160.txt",
        network: request.agent.Network.WIFI,
        index: 0,
        begins: 233332586,
        ends: -1,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_create_Callback_0160 is starting---------------------");
      request.agent.create(globalThis.abilityContext, config, async (err, task) => {
        try{
          if (err) {
            console.info("====>SUB_Misc_REQUEST_create_Callback_0160 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          task.on("completed", (progress) => {
            task.off("completed");
            let downloadSize = progress.sizes[0];
            console.info('====>downloadSize:' + downloadSize);
            expect(downloadSize).assertEqual(100);
            console.info("====>----------SUB_Misc_REQUEST_create_Callback_0160 is end---------------");
            done();
          });
          await task.start();
        }catch(err){
          console.info("====>SUB_Misc_REQUEST_create_Callback_0160 create err: " + JSON.stringify(err));
          done();
        }
      });
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0160
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0160
     * @tc.desc      Create a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0160", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://cidownload.openharmony.cn/version/Master_Version/OpenHarmony_5.0.2.45/20240924_092847/version-Master_Version-OpenHarmony_5.0.2.45-20240924_092847-hispark_taurus_Linux_weekly.tar.gz',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0160.txt",
        network: request.agent.Network.WIFI,
        index: 0,
        begins: 233332586,
        ends: -1,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0160 is starting---------------------");

      try{
        let task = await request.agent.create(globalThis.abilityContext, config);
        async function onCompletedCallback(progress){
          task.off("completed");
          let downloadSize = progress.sizes[0];
          console.info('====>downloadSize:' + downloadSize);
          expect(downloadSize).assertEqual(100);
          done();
        }
        task.on("completed", onCompletedCallback);
        await task.start();
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0160 create err: " + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Callback_0170
     * @tc.name    SUB_Misc_REQUEST_Create_Callback_0170
     * @tc.desc      Create a download Task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_create_Callback_0170", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://cidownload.openharmony.cn/version/Master_Version/OpenHarmony_5.0.2.45/20240924_092847/version-Master_Version-OpenHarmony_5.0.2.45-20240924_092847-hispark_taurus_Linux_weekly.tar.gz',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_create_Callback_0170.txt",
        network: request.agent.Network.WIFI,
        index: 0,
        begins: 30,
        ends: 60,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_create_Callback_0170 is starting---------------------");
      request.agent.create(globalThis.abilityContext, config, async (err, task) => {
        try{
          if (err) {
            console.info("====>SUB_Misc_REQUEST_create_Callback_0170 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          task.on("completed", (progress) => {
            task.off("completed");
            let downloadSize = progress.sizes[0];
            console.info('====>downloadSize:' + downloadSize);
            let fileSize = config.ends - config.begins + 1;
            console.info('====>fileSize:'+ fileSize);
            expect(downloadSize).assertEqual(fileSize);
            console.info("====>-----------------SUB_Misc_REQUEST_create_Callback_0170 is end--------------------");
            done();
          });
          await task.start();
        }catch(err){
          console.info("====>SUB_Misc_REQUEST_create_Callback_0170 create err: " + JSON.stringify(err));
          done();
        }
      });
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0170
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0170
     * @tc.desc      Create a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0170", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://cidownload.openharmony.cn/version/Master_Version/OpenHarmony_5.0.2.45/20240924_092847/version-Master_Version-OpenHarmony_5.0.2.45-20240924_092847-hispark_taurus_Linux_weekly.tar.gz',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0170.txt",
        network: request.agent.Network.WIFI,
        index: 0,
        begins: 30,
        ends: 60,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0170 is starting---------------------");

      try{
        let task = await request.agent.create(globalThis.abilityContext, config)
        async function onCompletedCallback(progress){
          task.off("completed");
          let downloadSize = progress.sizes[0];
          console.info('====>downloadSize:' + downloadSize);
          let fileSize = config.ends - config.begins + 1;
          console.info('====>fileSize:'+ fileSize);
          expect(downloadSize).assertEqual(fileSize);
          done();
        }
        task.on("completed", onCompletedCallback);
        await task.start();
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0170 create err: " + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Callback_0180
     * @tc.name    SUB_Misc_REQUEST_Create_Callback_0180
     * @tc.desc      Create a download Task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_create_Callback_0180", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://cidownload.openharmony.cn/version/Master_Version/OpenHarmony_5.0.2.45/20240924_092847/version-Master_Version-OpenHarmony_5.0.2.45-20240924_092847-hispark_taurus_Linux_weekly.tar.gz',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_create_Callback_0180.txt",
        network: request.agent.Network.WIFI,
        index: 0,
        begins: 60,
        ends: 30,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_create_Callback_0180 is starting---------------------");
      request.agent.create(globalThis.abilityContext, config, async (err, task) => {
        try{
          if (err) {
            console.info("====>SUB_Misc_REQUEST_create_Callback_0180 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          task.on("failed", (progress) => {
            task.off("failed");
            console.info('====>upload task failed.' + JSON.stringify(progress));
            expect(progress.state).assertEqual(65);
            done();
          });
          await task.start();
        }catch(err){
          console.info("====>SUB_Misc_REQUEST_create_Callback_0170 create err: " + JSON.stringify(err));
          done();
        }
      });
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0180
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0180
     * @tc.desc      Create a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0180", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://cidownload.openharmony.cn/version/Master_Version/OpenHarmony_5.0.2.45/20240924_092847/version-Master_Version-OpenHarmony_5.0.2.45-20240924_092847-hispark_taurus_Linux_weekly.tar.gz',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0180.txt",
        network: request.agent.Network.WIFI,
        index: 0,
        begins: 60,
        ends: 30,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0180 is starting---------------------");
      try{
        let task = await request.agent.create(globalThis.abilityContext, config);
        let createOffCallback = (progress) => {
          console.info('====>upload task failed.' + JSON.stringify(progress));
          task.off("failed");
          expect(progress.state).assertEqual(65);
          done();
        };
        task.on("failed", createOffCallback);
        await task.start();
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0180 create err: " + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Callback_0090
     * @tc.name    SUB_Misc_REQUEST_Create_Callback_0090
     * @tc.desc      Create a download Task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_create_Callback_0090", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: undefined,
        description: undefined,
        mode: undefined,
        overwrite: undefined,
        method: undefined,
        data: undefined,
        saveas: undefined,
        network: undefined,
        metered: undefined,
        roaming: undefined,
        retry: undefined,
        redirect: undefined,
        index: undefined,
        begins: undefined,
        ends: undefined,
        gauge: undefined,
        precise: undefined,
        token: undefined
      };
      console.info("====>-------------------SUB_Misc_REQUEST_create_Callback_0090 is starting---------------------");
      try{
        request.agent.create(globalThis.abilityContext, config, async(err, task) => {
          if (err) {
            console.info("====>SUB_Misc_REQUEST_create_Callback_0090 create err: " + JSON.stringify(err));
            done();
          }
          task.start(async (err) => {
            if (err) {
              console.error(`====>SUB_Misc_REQUEST_create_Callback_0090 Failed to start the download task, Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              return;
            }
            console.info(`====>SUB_Misc_REQUEST_create_Callback_0090 Succeeded in starting a download task.`);
            expect(true).assertEqual(true);
            await request.agent.remove(task.tid);
            console.info("====>----------------SUB_Misc_REQUEST_create_Callback_0090 is end-------------------");
            done();
          });
        });
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_create_Callback_0090 create err: " + JSON.stringify(err));
        done();
      }
    })


    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0090
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0090
     * @tc.desc      Create a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0090", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: undefined,
        description: undefined,
        mode: undefined,
        overwrite: undefined,
        method: undefined,
        data: undefined,
        saveas: undefined,
        network: undefined,
        metered: undefined,
        roaming: undefined,
        retry: undefined,
        redirect: undefined,
        index: undefined,
        begins: undefined,
        ends: undefined,
        gauge: undefined,
        precise: undefined,
        token: undefined
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0180 is starting---------------------");
      try{
        request.agent.create(globalThis.abilityContext, config).then(async (task)=> {
          task.start(async (err) => {
            if (err) {
              console.error(`====>SUB_Misc_REQUEST_Create_Promise_0180 Failed to start the download task, Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              return;
            }
            console.info(`====>SUB_Misc_REQUEST_Create_Promise_0180 Succeeded in starting a download task.`);
            expect(true).assertEqual(true);
            await request.agent.remove(task.tid);
            console.info("====>------------------SUB_Misc_REQUEST_Create_Promise_0180 is end-------------------");
            done();
          });
        }).catch((err) => {
          console.info("====>SUB_Misc_REQUEST_Create_Promise_0180 create err: " + JSON.stringify(err));
          done();
        });
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0180 create err: " + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Download_Callback_0020
     * @tc.name    SUB_Misc_REQUEST_Remove_Download_Callback_0020
     * @tc.desc      remove the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Callback_0020', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Download_Callback_0020 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        overwrite: true,
        saveas: './SUB_Misc_REQUEST_Remove_Download_Callback_0020.txt',
        network: request.agent.Network.ANY,
      };
      let a='a';
      let callback = err => {
        try {
          if(err){
            console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0020 remove err: " + JSON.stringify(err));
            expect().assertFail();
          }
          expect(task !== undefined).assertEqual(true);
          console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0020 remove success: " + task);
          done();
          console.info("====>-----------------SUB_Misc_REQUEST_Remove_Download_Callback_0020 end--------------------");
        } catch (err) {
          console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0020 remove fail: " + JSON.stringify(err));
          done();
        }
      };
      let task = await request.agent.create(globalThis.abilityContext, config);
      try {
        // @ts-ignore
        request.agent.remove(task.tid, a, callback);
      } catch (error) {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0020 catch error: " + JSON.stringify(error));
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Download_Promise_0020
     * @tc.name    SUB_Misc_REQUEST_Remove_Download_Promise_0020
     * @tc.desc      remove the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Promise_0020', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Download_Promise_0020 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        overwrite: true,
        saveas: './SUB_Misc_REQUEST_Remove_Download_Promise_0020.txt',
        network: request.agent.Network.ANY,
      };
      let a='a';
      let task = await request.agent.create(globalThis.abilityContext, config);
      // @ts-ignore
      await request.agent.remove(task.tid,a).then(()=>{
        expect(true).assertEqual(true);
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0020 remove success: " + task);}
      ).catch ((err)=>{
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0020 catch error: " + JSON.stringify(err));
        expect().assertFail();
      })
      console.info("====>---------------SUB_Misc_REQUEST_Remove_Download_Promise_0020 end-------------------");
      done();
    });

    /**
     * @tc.number    SUB_MISC_REQUEST_DOWNLOAD_removeNormal_callback_0030
     * @tc.name    SUB_MISC_REQUEST_DOWNLOAD_removeNormal_callback_0030
     * @tc.desc      remove the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MISC_REQUEST_DOWNLOAD_removeNormal_callback_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_removeNormal_callback_0030 is starting-----------------------");
      try {
        // @ts-ignore
        request.agent.remove(true, (err) => {
          try {
            if(err){
              console.info("====>SUB_MISC_REQUEST_DOWNLOAD_removeNormal_callback_0030 err.message: " + err.message);
              console.info("====>SUB_MISC_REQUEST_DOWNLOAD_removeNormal_callback_0030 err.code: " + err.code);
              expect(err.code).assertEqual(401);
            }else{
              expect().assertFail();
            }
            done();
          }catch (err){
            console.info("====>SUB_MISC_REQUEST_DOWNLOAD_removeNormal_callback_0030 remove fail: " + JSON.stringify(err));
            done();
          }
        });
      }catch (err){
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_removeNormal_callback_0030 remove fail: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Download_Promise_0030
     * @tc.name    SUB_Misc_REQUEST_Remove_Download_Promise_0030
     * @tc.desc      remove the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Promise_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Download_Promise_0030 is starting-----------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0030 remove");
        // @ts-ignore
        await request.agent.remove(true);
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0030 catch error: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }
      console.info("====>---------------SUB_Misc_REQUEST_Remove_Download_Promise_0030 end--------------------");
      done();
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Download_Promise_0040
     * @tc.name    SUB_Misc_REQUEST_Remove_Download_Promise_0040
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Promise_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Download_Promise_0040 is starting-----------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0040 remove");
        // @ts-ignore
        await request.agent.remove(1);
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0040 catch error: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }
      console.info("====>---------------SUB_Misc_REQUEST_Remove_Download_Promise_0040 end-------------------");
      done();
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Download_Callback_0040
     * @tc.name    SUB_Misc_REQUEST_Remove_Download_Callback_0040
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Callback_0040', 0, async function (done) {
      console.info("====>------------SUB_Misc_REQUEST_Remove_Download_Callback_0040 is starting-----------------");
      try {
        // @ts-ignore
        request.agent.remove(1, (err) => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0040 err.message: " + err.message);
              console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0040 err.code: " + err.code);
              expect(err.code).assertEqual(401);
            }else{
              expect().assertFail();
            }
            done();
          }catch (err){
            console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0040 remove fail: " + JSON.stringify(err));
            done();
          }
        });
      }catch (err){
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0040 remove fail: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Download_Callback_0050
     * @tc.name    SUB_Misc_REQUEST_Remove_Download_Callback_0050
     * @tc.desc      remove the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Callback_0050', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Download_Callback_0050 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        overwrite: true,
        saveas: './SUB_Misc_REQUEST_Remove_Download_Callback_0050.txt',
        network: request.agent.Network.ANY,
      };
      let task = await request.agent.create(globalThis.abilityContext, config);
      request.agent.remove(task.tid, (err) => {
        try {
          if (err) {
            console.error(`====>SUB_Misc_REQUEST_Remove_Download_Callback_0050 Failed to removing first a download task, Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
          request.agent.remove(task.tid, (err) => {
            try {
              if(err){
                console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0050 err.message: " + err.message);
                console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0050 err.code: " + err.code);
                expect(err.code).assertEqual(21900006);
                done();
              }else{
                console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0050 remove second not err: ");
                expect().assertFail();
              }
              done();
            }catch (err){
              console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0050 remove second fail: " + JSON.stringify(err));
              console.info("====>-------------SUB_Misc_REQUEST_Remove_Download_Callback_0050 end------------------");
              done();
            }
          });
        } catch (err) {
          console.info("====>SUB_Misc_REQUEST_Remove_Download_Callback_0050 remove first fail: " + JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Download_Promise_0050
     * @tc.name    SUB_Misc_REQUEST_Remove_Download_Promise_0050
     * @tc.desc      remove the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Promise_0050', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Download_Promise_0050 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Remove_Download_Promise_0050.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
      };
      try {
        let task = await request.agent.create(globalThis.abilityContext, config);
        await request.agent.remove(task.tid);
        await sleep(10);
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0050 remove first: " + task);
        await request.agent.remove(task.tid);
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0050 remove second: " + task);
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0050 catch error: " + JSON.stringify(err));
        console.info("====>----------------SUB_Misc_REQUEST_Remove_Download_Promise_0050 end------------------");
        expect(err.code).assertEqual(21900006);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Download_Promise_0060
     * @tc.name    SUB_Misc_REQUEST_Remove_Download_Promise_0060
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Promise_0060', 0, async function (done) {
      console.info("====>---------------SUB_Misc_REQUEST_Remove_Download_Promise_0060 is starting-------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0060 remove");
        await request.agent.remove('abc');
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0060 catch error: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900006);
      }
      console.info("====>-------------------SUB_Misc_REQUEST_Remove_Download_Promise_0060 end-------------------");
      done();
    });

    /**
     * @tc.number    SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0060
     * @tc.name    SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0060
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0060', 0, async function (done) {
      console.info("====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0060 is starting-----------------------");
      request.agent.remove('abc', (err) => {
        try {
          if(err){
            console.info("====>SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0060 err.message: " + err.message);
            console.info("====>SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0060 err.code: " + err.code);
            expect(err.code).assertEqual(21900006);
          }else{
            expect().assertFail();
          }
          done();
        }catch (err){
          console.info("====>SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0060 remove fail: " + JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0030
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0030
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0030", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: '//gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0030.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0030 is starting---------------------");
      try{
        request.agent.create(globalThis.abilityContext, config).then(async (task)=> {
          task.start(async (err) => {
            if (err) {
              console.error(`====>SUB_Misc_REQUEST_Create_Promise_0030  Failed to start the download task, Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              return;
            }
            console.info(`====>SUB_Misc_REQUEST_Create_Promise_0030 Succeeded in starting a download task.`);
            expect(true).assertEqual(true);
            await request.agent.remove(task.tid);
            console.info("====>--------------------SUB_Misc_REQUEST_Create_Promise_0030 is end---------------------");
            done();
          });
        }).catch((err) => {
          console.info("====>SUB_Misc_REQUEST_Create_Promise_0030 create err: " + JSON.stringify(err));
          console.info("====>--------------------SUB_Misc_REQUEST_Create_Promise_0030 is end---------------------");
          done();
        });
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0030 create err: " + JSON.stringify(err));
        console.info("====>--------------------SUB_Misc_REQUEST_Create_Promise_0030 is end---------------------");
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0040
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0040
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0040", 0, async function (done) {
      let config = {
        action: 3,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0040.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0040 is starting---------------------");
      try{
        request.agent.create(globalThis.abilityContext, config).then(async (task)=> {
          task.start(async (err) => {
            if (err) {
              console.error(`====>SUB_Misc_REQUEST_Create_Promise_0040  Failed to start the download task, Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              return;
            }
            console.info(`====>SUB_Misc_REQUEST_Create_Promise_0040 Succeeded in starting a download task.`);
            expect(true).assertEqual(true);
            await request.agent.remove(task.tid);
            console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0040 is end--------------------");
            done();
          });
        }).catch((err) => {
          console.info("====>SUB_Misc_REQUEST_Create_Promise_0040 create err: " + JSON.stringify(err));
          console.info("====>--------------------SUB_Misc_REQUEST_Create_Promise_0040 is end---------------------");
          done();
        });
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0040 create err: " + JSON.stringify(err));
        console.info("====>--------------------SUB_Misc_REQUEST_Create_Promise_0040 is end-----------------------");
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Download_Promise_0020
     * @tc.name    SUB_Misc_REQUEST_Create_Download_Promise_0020
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Download_Promise_0020", 0, async function (done) {
      let config = {};
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Download_Promise_0020 is starting---------------------");
      try{
        // @ts-ignore
        request.agent.create(globalThis.abilityContext, config).then(async (task)=> {
          task.start(async (err) => {
            if (err) {
              console.error(`====>SUB_Misc_REQUEST_Create_Download_Promise_0020  Failed to start the download task, Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              return;
            }
            console.info(`====>SUB_Misc_REQUEST_Create_Download_Promise_0020 Succeeded in starting a download task.`);
            expect(true).assertEqual(true);
            await request.agent.remove(task.tid);
            console.info("====>-----------------SUB_Misc_REQUEST_Create_Download_Promise_0020 is end-----------------");
            done();
          });
        }).catch((err) => {
          console.info("====>SUB_Misc_REQUEST_Create_Download_Promise_0020 create err: " + JSON.stringify(err));
          console.info("====>-------------SUB_Misc_REQUEST_Create_Download_Promise_0020 is end------------------");
          done();
        });
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Download_Promise_0020 create err: " + JSON.stringify(err));
        console.info("====>-----------------SUB_Misc_REQUEST_Create_Download_Promise_0020 is end--------------------");
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0130
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0130
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0130", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: 0,
        overwrite: true,
        saveas: "./SSUB_Misc_REQUEST_Create_Promise_0130.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0130 is starting---------------------");
      try{
        request.agent.create(globalThis.abilityContext, config).then(async (task)=> {
          task.start(async (err) => {
            if (err) {
              console.error(`====>SUB_Misc_REQUEST_Create_Promise_0130    Failed to start the download task, Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            }
            console.info(`====>SUB_Misc_REQUEST_Create_Promise_0130 Succeeded in starting a download task.`);
            expect(true).assertEqual(true);
            await request.agent.remove(task.tid);
            done();
          });
        }).catch((err) => {
          console.info("====>SUB_Misc_REQUEST_Create_Promise_0130 create err: " + JSON.stringify(err));
          console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0130 is end---------------------");
          done();
        });
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0130 create err: " + JSON.stringify(err));
        console.info("====>--------------------SUB_Misc_REQUEST_Create_Promise_0130 is end---------------------");
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Callback_0060
     * @tc.name    SUB_Misc_REQUEST_Create_Callback_0060
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Callback_0060", 0, async function (done) {
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: 1,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Callback_0060.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Callback_0060 is starting---------------------");
      try{
        request.agent.create(globalThis.abilityContext, config, (err, task) => {
          if (err) {
            console.error(`====>SUB_Misc_REQUEST_Create_Callback_0060 Failed to create a download task, Code: ${err.code}, message: ${err.message}`);
            return;
          }
          task.start((err) => {
            if (err) {
              console.error(`====>SUB_Misc_REQUEST_Create_Callback_0060  Failed to start the download task, Code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              return;
            }
            console.info(`====>SUB_Misc_REQUEST_Create_Callback_0060 Succeeded in starting a download task.`);
            expect(true).assertEqual(true);
            request.agent.remove(task.tid);
            console.info("====>----------------SUB_Misc_REQUEST_Create_Callback_0060 is end---------------------");
            done();
          });
        })
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Callback_0060 create err: " + JSON.stringify(err));
        done();
      }
    })//mode1

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Download_Callback_0050
     * @tc.name    SUB_Misc_REQUEST_Create_Download_Callback_0050
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Download_Callback_0050", 0, async function (done) {
      let config = {};
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Download_Callback_0050 is starting---------------------");
      try{
        // @ts-ignore
        request.agent.create(globalThis.abilityContext, config, (err, task) => {
          if (err) {
            console.error(`====>SUB_Misc_REQUEST_Create_Download_Callback_0050 Failed to create a download task, Code: ${err.code}, message: ${err.message}`);
            return;
          }
          console.info(`====>SUB_Misc_REQUEST_Create_Download_Callback_0050 Succeeded in creating a download task`);
        });
        expect().assertFail();
      }catch(err){
        expect(err.code).assertEqual(401);
        console.info("====>SUB_Misc_REQUEST_Create_Download_Callback_0050 create err: " + JSON.stringify(err));
        console.info("====>----------------SUB_Misc_REQUEST_Create_Download_Callback_0050 is end------------------");
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Callback_0070
     * @tc.name    SUB_Misc_REQUEST_Create_Callback_0070
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Callback_0070", 0, async function (done) {
      let urls = 'x';
      for (let i = 0; i < 2030; i++){
        urls += 'x';
      }
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://' + urls + '/test.apk',
        title: 'createTest',
        description: "XTS download test!",
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Callback_0070.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Callback_0070 is start ---------------------");
      request.agent.create(globalThis.abilityContext, config, async (err, task) => {
        try {
          if(err){
            console.info(`====>SUB_Misc_REQUEST_Create_Callback_0070 task creat fail: ` + JSON.stringify(err));
            expect().assertFail();
          }
          console.info(`====>SUB_Misc_REQUEST_Create_Callback_0070 Succeeded download task length: ` + task.config.url.length);
          await request.agent.remove(task.tid);
          done();
        } catch (err) {
          console.info(`====>SUB_Misc_REQUEST_Create_Callback_0070 Succeeded in starting a download task.` + JSON.stringify(err));
          done();
        }
      });
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0070
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0070
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0070", 0, async function (done) {
      let urls = 'x';
      for (let i = 0; i < 2030; i++){
        urls += 'x';
      }
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://' + urls + '/test.apk',
        title: 'createTest',
        description: "XTS download test!",
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0070.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------SUB_Misc_REQUEST_Create_Promise_0070 is starting----------------");
      try{
        let task = await request.agent.create(globalThis.abilityContext, config);
        console.info(`====>SUB_Misc_REQUEST_Create_Promise_0070 Succeeded download task length: ` + task.config.url.length);
        await request.agent.remove(task.tid);
        expect(true).assertTrue();
        done();
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0070 create err: " + JSON.stringify(err));
        expect().assertFail();
        console.info("-----------------------SUB_Misc_REQUEST_Create_Promise_0070 is end-----------------------");
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Callback_0080
     * @tc.name    SUB_Misc_REQUEST_Create_Callback_0080
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Callback_0080", 0, async function (done) {
      let urls = 'x';
      for (let i = 0; i < 2031; i++){
        urls += 'x';
      }
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://' + urls + '/test.apk',
        title: 'createTest',
        description: "XTS download test!",
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Callback_0080.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Callback_0080 is start ---------------------");
      try{
        request.agent.create(globalThis.abilityContext, config, (err, task) => {
          try {
            console.info(`====>SUB_Misc_REQUEST_Create_Callback_0080 Succeeded in starting a download task.`);
            expect().assertFail();
          } catch (err) {
            console.info(`====>SUB_Misc_REQUEST_Create_Callback_0080 Succeeded in starting a download task.` + JSON.stringify(err));
            request.agent.remove(task.tid);
            done();
          }
        });
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Callback_0080 create err: " + JSON.stringify(err));
        console.info("-----------------------SUB_Misc_REQUEST_Create_Callback_0080 is end-----------------------");
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0080
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0080
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0080", 0, async function (done) {
      let urls = 'x';
      for (let i = 0; i < 2031; i++){
        urls += 'x';
      }
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://' + urls + '/test.apk',
        title: 'createTest',
        description: "XTS download test!",
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0080.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------SUB_Misc_REQUEST_Create_Promise_0080 is starting----------------");
      try{
        await request.agent.create(globalThis.abilityContext, config);
        console.info(`====>SUB_Misc_REQUEST_Create_Promise_0080 Succeeded in starting a download task.`);
        expect().assertFail();
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0080 create err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.info("-----------------------SUB_Misc_REQUEST_Create_Promise_0080 is end-----------------------");
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0110
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0110
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0110", 0, async function (done) {
      let des = 'x';
      for (let i = 0; i < 1025; i++){
        des += 'x';
      }
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: des,
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0110.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------SUB_Misc_REQUEST_Create_Promise_0110 is starting----------------");
      try{
        await request.agent.create(globalThis.abilityContext, config);
        console.info(`====>SUB_Misc_REQUEST_Create_Promise_0110 Succeeded in starting a download task.`);
        expect().assertFail();
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0110 create err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.info("-----------------------SUB_Misc_REQUEST_Create_Promise_0110 is end-----------------------");
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Callback_0110
     * @tc.name    SUB_Misc_REQUEST_Create_Callback_0110
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Callback_0110", 0, async function (done) {
      let des = 'x';
      for (let i = 0; i < 1025; i++){
        des += 'x';
      }
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: des,
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Callback_0110.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Callback_0110 is start ---------------------");
      try{
        request.agent.create(globalThis.abilityContext, config, (err, task) => {
          try {
            console.info(`====>SUB_Misc_REQUEST_Create_Callback_0110 Succeeded in starting a download task.`);
            expect().assertFail();
          } catch (err) {
            console.info(`====>SUB_Misc_REQUEST_Create_Callback_0110 Succeeded in starting a download task.` + JSON.stringify(err));
            request.agent.remove(task.tid);
            done();
          }
        });
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Callback_0110 create err: " + JSON.stringify(err));
        console.info("-----------------------SUB_Misc_REQUEST_Create_Callback_0110 is end-----------------------");
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Promise_0150
     * @tc.name    SUB_Misc_REQUEST_Create_Promise_0150
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0150", 0, async function (done) {
      let tit = 'x';
      for (let i = 0; i < 257; i++){
        tit += 'x';
      }
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: tit,
        description: 'Sample code for create task',
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0150.txt",
        network: request.agent.Network.WIFI,
      };

      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0150 is starting---------------------");
      try{
        await request.agent.create(globalThis.abilityContext, config);
        console.info(`====>SUB_Misc_REQUEST_Create_Promise_0150 Succeeded in starting a download task.`);
        expect().assertFail();
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0150 create err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.info("-----------------------SUB_Misc_REQUEST_Create_Promise_0150 is end-----------------------");
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Callback_0150
     * @tc.name    SUB_Misc_REQUEST_Create_Callback_0150
     * @tc.desc      remove a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Misc_REQUEST_Create_Callback_0150", 0, async function (done) {
      let tit = 'x';
      for (let i = 0; i < 257; i++){
        tit += 'x';
      }
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: tit,
        description: 'Sample code for create task',
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Callback_0150.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Callback_0150 is start---------------------");
      try{
        request.agent.create(globalThis.abilityContext, config, (err, task) => {
          try {
            console.info(`====>SUB_Misc_REQUEST_Create_Callback_0150 Succeeded in starting a download task.`);
            expect().assertFail();
          } catch (err) {
            console.info(`====>SUB_Misc_REQUEST_Create_Callback_0150 Succeeded in starting a download task.` + JSON.stringify(err));
            request.agent.remove(task.tid);
            done();
          }
        });
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Callback_0150 create err: " + JSON.stringify(err));
        console.info("====>-----------------SUB_Misc_REQUEST_Create_Callback_0150 is end-------------------");
        expect(err.code).assertEqual(401);
        done();
      }
    })

  });
}
