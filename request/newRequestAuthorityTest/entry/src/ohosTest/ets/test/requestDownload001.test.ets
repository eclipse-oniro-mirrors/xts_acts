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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';

export default function requestDownloadOneJSUnitTest() {
  describe('requestDownloadOneJSUnit', () => {
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
          console.info('====>beforeAll requestDownloadOneJSUnit baseContext:'+JSON.stringify(baseContext))
          done();
        } else {
          console.info('====>beforeAll requestDownloadOneJSUnit baseContext is undefined')
          done();
        }
      } catch (err) {
        console.info('====>beforeAll requestDownloadOneJSUnit catch err:'+JSON.stringify(err))
        done();
      }
    });

    let sleep = (timeout: number): Promise<ESObject> => {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    /**
     * @tc.name   SUB_Misc_REQUEST_create_Callback_0140
     * @tc.number SUB_Misc_REQUEST_Create_Callback_0140
     * @tc.desc   Create a download Task.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_create_Callback_0140", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
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
      request.agent.create(baseContext, config, async (err, task) => {
        try{
          if (err) {
            console.info("====>SUB_Misc_REQUEST_create_Callback_0140 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          task.on("completed", (progress) => {
            task.off("completed");
            let downloadSize = progress.sizes[0];
            try {
              console.info('====>downloadSize:' + downloadSize);
              if (config.ends !== undefined && config.begins !== undefined){
                let fileSize = config.ends - config.begins + 1;
                console.info('====>fileSize:'+ fileSize);
                expect(downloadSize).assertEqual(fileSize);
                console.info("====>----------SUB_Misc_REQUEST_create_Callback_0140 is end---------------");
                done();
              } else {
                console.info("====>SUB_Misc_REQUEST_create_Callback_0140 config.ends or config.begins is undefined");
                expect().assertFail();
                done();
              }
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_create_Callback_0140 catch err: " + JSON.stringify(err));
              done();
            }
          });
          await task.start();
        }catch(err){
          console.info("====>SUB_Misc_REQUEST_create_Callback_0140 create err: " + JSON.stringify(err));
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0140
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0140
     * @tc.desc   Create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0140", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
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
        let task = await request.agent.create(baseContext, config)
        let onCompletedCallback = (progress: request.agent.Progress) => {
          task.off("completed");
          let downloadSize = progress.sizes[0]
          try {
            console.info('====>downloadSize:' + downloadSize);
            if (config.ends !== undefined && config.begins !== undefined){
              let fileSize = config.ends - config.begins + 1
              console.info('====>fileSize:'+ fileSize)
              expect(downloadSize).assertEqual(fileSize)
              done();
            } else {
              console.info("====>SUB_Misc_REQUEST_Create_Promise_0140 config.ends or config.begins is undefined");
              expect().assertFail();
              done();
            }
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Create_Promise_0140 catch err: " + JSON.stringify(err));
            done();
          }
        }
        task.on("completed", onCompletedCallback)
        await task.start()
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0140 create err: " + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.name   SUB_Misc_REQUEST_create_Callback_0160
     * @tc.number SUB_Misc_REQUEST_Create_Callback_0160
     * @tc.desc   Create a download Task.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_create_Callback_0160", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
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
      request.agent.create(baseContext, config, async (err, task) => {
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
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0160
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0160
     * @tc.desc   Create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0160", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
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
        let task = await request.agent.create(baseContext, config);
        let onCompletedCallback = (progress: request.agent.Progress) => {
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
     * @tc.name   SUB_Misc_REQUEST_create_Callback_0170
     * @tc.number SUB_Misc_REQUEST_Create_Callback_0170
     * @tc.desc   Create a download Task.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_create_Callback_0170", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
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
      request.agent.create(baseContext, config, async (err, task) => {
        try{
          if (err) {
            console.info("====>SUB_Misc_REQUEST_create_Callback_0170 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          task.on("completed", (progress) => {
            task.off("completed");
            let downloadSize = progress.sizes[0];
            try {
              console.info('====>downloadSize:' + downloadSize);
              if (config.ends !== undefined && config.begins !== undefined){
                let fileSize = config.ends - config.begins + 1;
                console.info('====>fileSize:'+ fileSize);
                expect(downloadSize).assertEqual(fileSize);
                console.info("====>-----------------SUB_Misc_REQUEST_create_Callback_0170 is end--------------------");
                done();
              } else {
                console.info("====>SUB_Misc_REQUEST_create_Callback_0170 config.ends or config.begins is undefined");
                expect().assertFail();
                done();
              }
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_create_Callback_0170 catch err: " + JSON.stringify(err));
              done();
            }
          });
          await task.start();
        }catch(err){
          console.info("====>SUB_Misc_REQUEST_create_Callback_0170 create err: " + JSON.stringify(err));
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0170
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0170
     * @tc.desc   Create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0170", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
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
        let task = await request.agent.create(baseContext, config)
        let onCompletedCallback = (progress: request.agent.Progress) => {
          task.off("completed");
          let downloadSize = progress.sizes[0];
          try {
            console.info('====>downloadSize:' + downloadSize);
            if (config.ends !== undefined && config.begins !== undefined){
              let fileSize = config.ends - config.begins + 1;
              console.info('====>fileSize:'+ fileSize);
              expect(downloadSize).assertEqual(fileSize);
              done();
            } else {
              console.info("====>SUB_Misc_REQUEST_create_Callback_0170 config.ends or config.begins is undefined");
              expect().assertFail();
              done();
            }
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_create_Callback_0170 catch err: " + JSON.stringify(err));
            done();
          }
        }
        task.on("completed", onCompletedCallback);
        await task.start();
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0170 create err: " + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.name   SUB_Misc_REQUEST_create_Callback_0180
     * @tc.number SUB_Misc_REQUEST_Create_Callback_0180
     * @tc.desc   Create a download Task.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_create_Callback_0180", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
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
      request.agent.create(baseContext, config, async (err, task) => {
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
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0180
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0180
     * @tc.desc   Create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0180", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
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
        let task = await request.agent.create(baseContext, config);
        let createOffCallback = (progress: request.agent.Progress) => {
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
     * @tc.name   SUB_Misc_REQUEST_create_Callback_0090
     * @tc.number SUB_Misc_REQUEST_Create_Callback_0090
     * @tc.desc   Create a download Task.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_create_Callback_0090", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
        request.agent.create(baseContext, config, async(err, task) => {
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
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0090
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0090
     * @tc.desc   Create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0090", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
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
        request.agent.create(baseContext, config).then(async (task)=> {
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
        }).catch((err: BusinessError) => {
          console.info("====>SUB_Misc_REQUEST_Create_Promise_0180 create err: " + JSON.stringify(err));
          done();
        });
      }catch(err){
        console.info("====>SUB_Misc_REQUEST_Create_Promise_0180 create err: " + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.name   SUB_Misc_REQUEST_Remove_Download_Callback_0050
     * @tc.number SUB_Misc_REQUEST_Remove_Download_Callback_0050
     * @tc.desc   remove the download task.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Callback_0050', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Download_Callback_0050 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        overwrite: true,
        saveas: './SUB_Misc_REQUEST_Remove_Download_Callback_0050.txt',
        network: request.agent.Network.ANY,
      };
      let task = await request.agent.create(baseContext, config);
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
     * @tc.name   SUB_Misc_REQUEST_Remove_Download_Promise_0050
     * @tc.number SUB_Misc_REQUEST_Remove_Download_Promise_0050
     * @tc.desc   remove the download task.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Promise_0050', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Download_Promise_0050 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Remove_Download_Promise_0050.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
      };
      try {
        let task = await request.agent.create(baseContext, config);
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
     * @tc.name   SUB_Misc_REQUEST_Remove_Download_Promise_0060
     * @tc.number SUB_Misc_REQUEST_Remove_Download_Promise_0060
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Promise_0060', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0060
     * @tc.number SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0060
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0060', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0070
     * @tc.number SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0070
     * @tc.desc   error param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0070', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0070 is starting-----------------------");
      try {
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0070 remove");
        request.agent.remove(undefined, (err: BusinessError) => {
          try {
            console.info("====>SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0070 create callback");
            expect().assertFail();
            done();
          }catch (err) {
            console.info("====>SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0070 err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_remove_callback_0070 catch error: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Remove_Download_Promise_0070
     * @tc.number SUB_Misc_REQUEST_Remove_Download_Promise_0070
     * @tc.desc   error param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_REQUEST_Remove_Download_Promise_0070', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Download_Promise_0070 is starting-----------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0070 remove");
        await request.agent.remove(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Download_Promise_0070 catch error: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0030
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0030
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0030", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
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
        request.agent.create(baseContext, config).then(async (task)=> {
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
        }).catch((err: BusinessError) => {
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
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0040
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0040
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0040", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
        action: 3,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0040.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0040 is starting---------------------");
      try{
        request.agent.create(baseContext, config).then(async (task)=> {
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
        }).catch((err: BusinessError) => {
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
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0130
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0130
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0130", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: 0,
        overwrite: true,
        saveas: "./SSUB_Misc_REQUEST_Create_Promise_0130.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0130 is starting---------------------");
      try{
        request.agent.create(baseContext, config).then(async (task)=> {
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
        }).catch((err: BusinessError) => {
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
     * @tc.name   SUB_Misc_REQUEST_Create_Callback_0060
     * @tc.number SUB_Misc_REQUEST_Create_Callback_0060
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Callback_0060", Level.LEVEL2, async (done: Function) => {
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: 1,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Callback_0060.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Callback_0060 is starting---------------------");
      try{
        request.agent.create(baseContext, config, (err, task) => {
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
    })

    /**
     * @tc.name   SUB_Misc_REQUEST_Create_Callback_0070
     * @tc.number SUB_Misc_REQUEST_Create_Callback_0070
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Callback_0070", Level.LEVEL2, async (done: Function) => {
      let urls = 'x';
      for (let i = 0; i < 8174; i++){
        urls += 'x';
      }
      let config: request.agent.Config = {
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
      request.agent.create(baseContext, config, async (err, task) => {
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
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0070
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0070
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0070", Level.LEVEL2, async (done: Function) => {
      let urls = 'x';
      for (let i = 0; i < 8174; i++){
        urls += 'x';
      }
      let config: request.agent.Config = {
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
        let task = await request.agent.create(baseContext, config);
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
     * @tc.name   SUB_Misc_REQUEST_Create_Callback_0080
     * @tc.number SUB_Misc_REQUEST_Create_Callback_0080
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Callback_0080", Level.LEVEL2, async (done: Function) => {
      let urls = 'x';
      for (let i = 0; i < 8175; i++){
        urls += 'x';
      }
      let config: request.agent.Config = {
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
        request.agent.create(baseContext, config, (err, task) => {
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
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0080
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0080
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0080", Level.LEVEL2, async (done: Function) => {
      let urls = 'x';
      for (let i = 0; i < 8175; i++){
        urls += 'x';
      }
      let config: request.agent.Config = {
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
        await request.agent.create(baseContext, config);
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
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0110
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0110
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0110", Level.LEVEL2, async (done: Function) => {
      let des = 'x';
      for (let i = 0; i < 1025; i++){
        des += 'x';
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: des,
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0110.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------SUB_Misc_REQUEST_Create_Promise_0110 is starting----------------");
      try{
        await request.agent.create(baseContext, config);
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
     * @tc.name   SUB_Misc_REQUEST_Create_Callback_0110
     * @tc.number SUB_Misc_REQUEST_Create_Callback_0110
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Callback_0110", Level.LEVEL2, async (done: Function) => {
      let des = 'x';
      for (let i = 0; i < 1025; i++){
        des += 'x';
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: des,
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Callback_0110.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Callback_0110 is start ---------------------");
      try{
        request.agent.create(baseContext, config, (err, task) => {
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
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_0150
     * @tc.number SUB_Misc_REQUEST_Create_Promise_0150
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Promise_0150", Level.LEVEL2, async (done: Function) => {
      let tit = 'x';
      for (let i = 0; i < 257; i++){
        tit += 'x';
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: tit,
        description: 'Sample code for create task',
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Promise_0150.txt",
        network: request.agent.Network.WIFI,
      };

      console.info("====>-------------------SUB_Misc_REQUEST_Create_Promise_0150 is starting---------------------");
      try{
        await request.agent.create(baseContext, config);
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
     * @tc.name   SUB_Misc_REQUEST_Create_Callback_0150
     * @tc.number SUB_Misc_REQUEST_Create_Callback_0150
     * @tc.desc   remove a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Misc_REQUEST_Create_Callback_0150", Level.LEVEL2, async (done: Function) => {
      let tit = 'x';
      for (let i = 0; i < 257; i++){
        tit += 'x';
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: tit,
        description: 'Sample code for create task',
        mode: request.agent.Mode.BACKGROUND,
        overwrite: true,
        saveas: "./SUB_Misc_REQUEST_Create_Callback_0150.txt",
        network: request.agent.Network.WIFI,
      };
      console.info("====>-------------------SUB_Misc_REQUEST_Create_Callback_0150 is start---------------------");
      try{
        request.agent.create(baseContext, config, (err, task) => {
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
