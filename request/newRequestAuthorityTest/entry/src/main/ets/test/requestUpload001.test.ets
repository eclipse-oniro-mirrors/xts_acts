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

import Server from '../common/Server'
import hilog from '@ohos.hilog';
import request from "@ohos.request";
import fileio from '@ohos.fileio'
import commonEvent from '@ohos.commonEventManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestUploadOnetJSUnitTest() {
  describe('requestUploadOneJSUnit', function () {
    beforeAll(function (done) {
      try {
        console.info('====>beforeAll: startServer');
        new Server().startServer();
        console.info('====>beforeAll: startServer success!');
        let pathDir = globalThis.abilityContext.cacheDir;
        let filePath = pathDir + `/test.txt`;
        let fd = fileio.openSync(filePath, 0o100 | 0o2, 0o666);
        let content = ''.padEnd(1 * 1024, 'Hello world!');
        fileio.writeSync(fd, content);
        fileio.closeSync(fd);
        console.info('====>beforeAll: text.txt file generate');
        done();
      } catch (err) {
        console.info('====>beforeAll: text.txt file generate failed' + err);
        done();
      }
    })

    let attachments = [{
      name: "uploadTest",
      value: {
        path: "./test.txt",
        filename: "test.txt",
        mimetype: "application/octet-stream"
      }
    }];

    let config = {
      action: request.agent.Action.UPLOAD,
      url: 'http://127.0.0.1:8080',
      title: 'uploadTest',
      description: 'Sample code for event listening',
      mode: request.agent.Mode.BACKGROUND,
      overwrite: true,
      method: "POST",
      data: attachments,
      saveas: "./",
      network: request.agent.Network.ANY,
      metered: false,
      roaming: true,
      retry: true,
      redirect: true,
      index: 0,
      begins: 0,
      ends: -1,
      gauge: false,
      precise: false,
      token: "it is a secret"
    };

    let sleep = function (timeout) {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    /**
     * @tc.number SUB_REQUEST_On_Upload_Pause_0100
     * @tc.name SUB_REQUEST_On_Upload_Pause_0100
     * @tc.desc download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_On_Upload_Pause_0100', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_On_Upload_Pause_0100 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
        let on_pauseCallback = async (pro) => {
          task.off('pause', on_pauseCallback);
          try {
            await request.agent.remove(task.tid);
          } catch (err) {
            console.info('====>SUB_REQUEST_On_Upload_Pause_0100 task not remove: ' + JSON.stringify(task.tid));
          }
          expect(true).assertTrue();
          console.info('====>SUB_REQUEST_On_Upload_Pause_0100 background onPause success');
          done();
        }
        try {
          if (err) {
            console.info('====>SUB_REQUEST_On_Upload_Pause_0100 create err: ' + JSON.stringify(err.message));
            expect().assertFail();
            done();
          }
          task.on('pause', on_pauseCallback);
          task.start(async (err) =>{
            try {
              if(err){
                console.info('====>SUB_REQUEST_On_Upload_Pause_0100 task.start err' + JSON.stringify(err.message));
                expect().assertFail();
                done();
              }
              await task.pause();
              console.info('====>SUB_REQUEST_On_Upload_Pause_0100 task.start success');
            } catch (err) {
              console.info('====>SUB_REQUEST_On_Upload_Pause_0100 task start failed: ' + JSON.stringify(err));
              done();
            }
          });
        } catch (err) {
          console.info('====>SUB_REQUEST_On_Upload_Pause_0100 catch err: ' + JSON.stringify(err));
          done();
        }
      });
      
    });

    /**
     * @tc.number SUB_REQUEST_On_Upload_Pause_0200
     * @tc.name SUB_REQUEST_On_Upload_Pause_0200
     * @tc.desc download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_On_Upload_Pause_0200', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_On_Upload_Pause_0200 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_pauseCallback = async (pro) => {
            task.off('pause', on_pauseCallback);
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info('====>SUB_REQUEST_On_Upload_Pause_0200 task not remove: ' + JSON.stringify(task.tid));
            }
            expect(true).assertTrue();
            console.info('====>SUB_REQUEST_On_Upload_Pause_0200 background onPause success');
            done();
          }
          try {
            if (err) {
              console.info('====>SUB_REQUEST_On_Upload_Pause_0200 create err: ' + JSON.stringify(err));
              expect().assertFail();
            }
            let a = 'addParameter'
            // @ts-ignore
            task.on('pause', on_pauseCallback, a);
            task.start(async (err) =>{
              try {
                if(err){
                  console.info('====>SUB_REQUEST_On_Upload_Pause_0200 task.start err' + JSON.stringify(err));
                  expect().assertFail();
                }
                await task.pause();
                console.info('====>SUB_REQUEST_On_Upload_Pause_0200 task.start success');
              } catch (err) {
                console.info('====>SUB_REQUEST_On_Upload_Pause_0200 task start failed: ' + JSON.stringify(err));
              }
            });
          } catch (err) {
            console.info('====>SUB_REQUEST_On_Upload_Pause_0200 catch err: ' + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info('====>SUB_REQUEST_On_Upload_Pause_0200 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Upload_Pause_0100
     * @tc.name SUB_REQUEST_Off_Upload_Pause_0100
     * @tc.desc Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Upload_Pause_0100', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_Off_Upload_Pause_0100 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      let arr = new Array();
      let arr1 = [0, 1, 2];
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Upload_Pause_0100 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1) => {
            task.off('pause', pro1)
            console.info("====>SUB_REQUEST_Off_Upload_Pause_0100 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2) => {
            task.off('pause', pro2)
            console.info("====>SUB_REQUEST_Off_Upload_Pause_0100 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3) => {
            try {
              task.off('pause', pro3)
              console.info("====>SUB_REQUEST_Off_Upload_Pause_0100 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Upload_Pause_0100 task3 pause on arr: " + JSON.stringify(arr));
              expect(arr.join()).assertEqual(arr1.join());
              try {
                await request.agent.remove(task.tid);
              } catch (err) {
                console.info('====>SUB_REQUEST_Off_Upload_Pause_0100 task not remove: ' + JSON.stringify(task.tid));
              }
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Upload_Pause_0100 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('pause', pro1);
          task.on('pause', pro2);
          task.on('pause', pro3);
          task.start(async (err) =>{
            try {
              if(err){
                console.info('====>SUB_REQUEST_Off_Upload_Pause_0100 task.start err' + JSON.stringify(err));
                expect().assertFail();
              }
              await task.pause();
              console.info('====>SUB_REQUEST_Off_Upload_Pause_0100 task.start success');
            } catch (err) {
              console.info('====>SUB_REQUEST_Off_Upload_Pause_0100 task start failed: ' + JSON.stringify(err));
            }
          });
          console.info("====>SUB_REQUEST_Off_Upload_Pause_0100 task.start");
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Upload_Pause_0100 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Upload_Pause_0200
     * @tc.name SUB_REQUEST_Off_Upload_Pause_0200
     * @tc.desc Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Upload_Pause_0200', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_Upload_backgroundOnPause_0500 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      let arr = new Array();
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Upload_Pause_0200 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1) => {
            console.info("====>SUB_REQUEST_Off_Upload_Pause_0200 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2) => {
            console.info("====>SUB_REQUEST_Off_Upload_Pause_0200 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3) => {
            try {
              task.off('pause', pro3)
              console.info("====>SUB_REQUEST_Off_Upload_Pause_0200 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Upload_Pause_0200 task3 pause on arr: " + JSON.stringify(arr));
              expect(arr[0]).assertEqual(2);
              try {
                await request.agent.remove(task.tid);
              } catch (err) {
                console.info('====>SUB_REQUEST_Off_Upload_Pause_0200 task not remove: ' + JSON.stringify(task.tid));
              }
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Upload_Pause_0200 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('pause', pro1);
          task.on('pause', pro2);
          task.off('pause');
          task.on('pause', pro3);
          task.start(async (err) =>{
            try {
              if(err){
                console.info('====>SUB_REQUEST_Off_Upload_Pause_0200 task.start err' + JSON.stringify(err));
                expect().assertFail();
              }
              await task.pause();
              console.info('====>SUB_REQUEST_Off_Upload_Pause_0200 task.start success');
            } catch (err) {
              console.info('====>SUB_REQUEST_Off_Upload_Pause_0200 task start failed: ' + JSON.stringify(err));
            }
          });
          console.info("====>SUB_REQUEST_Off_Upload_Pause_0200 task.start");
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Upload_Pause_0200 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Callback_0020
     * @tc.name    SUB_Misc_REQUEST_Create_Upload_Callback_0020
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Callback_0020', 0, async function (done) {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0020 is starting-----------------------");
      let config_ = {};
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task)=>{
          console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0020 downloadTask: " + task);
          try{
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0020 create err: " + JSON.stringify(err));
            expect().assertFail();
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0020 create success: " + task);
          }catch(error){
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0020 create fail: " + JSON.stringify(error));
          }
          await request.agent.remove(task.tid);
          console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0020 end-----------------------");
          done();
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0020 parameter create fail: " + JSON.stringify(err));
        console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0020 end-----------------------");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Promise_0020
     * @tc.name    SUB_Misc_REQUEST_Create_Upload_Promise_0020
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Promise_0020', 0, async function (done) {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Upload_Promise_0020 is starting-----------------------");
      let config_ = {};
      try {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0020 downloadTask");
        //@ts-ignore
        let task = await request.agent.create(globalThis.abilityContext, config_);
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0020 parameter create fail: " + JSON.stringify(err));
        console.info("====>------------------SUB_Misc_REQUEST_Create_Upload_Promise_0020 end-----------------------");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Callback_0050
     * @tc.name    SUB_Misc_REQUEST_Create_Upload_Callback_0050
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Callback_0050', 0, async function (done) {
      console.info("====>---------------SUB_Misc_REQUEST_Create_Upload_Callback_0050 is starting------------------");
      try {
        //@ts-ignore
        request.agent.create(config, async (err, task)=>{
          console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0050 downloadTask: " + task);
          try{
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0050 create err: " + JSON.stringify(err));
            expect().assertFail();
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0050 create success: " + task);
          }catch(error){
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0050 create fail: " + JSON.stringify(error));
          }
          await request.agent.remove(task.tid);
          console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0050 end-----------------------");
          done();
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0050 parameter create fail: " + JSON.stringify(err));
        console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0050 end-----------------------");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Promise_0050
     * @tc.name    SUB_Misc_REQUEST_Create_Upload_Promise_0050
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Promise_0050', 0, async function (done) {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Upload_Promise_0050 is starting-----------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0050 downloadTask");
        //@ts-ignore
        request.agent.create(config);
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0050 parameter create fail: " + JSON.stringify(err));
        console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Promise_0050 end-----------------------");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Callback_0020
     * @tc.name    SUB_Misc_REQUEST_Remove_Upload_Callback_0020
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Callback_0020', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0020 is starting-----------------------");
      try {
        let task = await request.agent.create(globalThis.abilityContext, config);
        // @ts-ignore
        request.agent.remove(task.tid, 'a' ,(err) => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0020 remove err: " + JSON.stringify(err));
              expect().assertFail();
            }
            expect(task !== undefined).assertEqual(true);
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0020 remove success: " + task);
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0020 remove fail: " + JSON.stringify(err));
          }
        });
        done();
      } catch (error) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0020 catch error: " + JSON.stringify(error));
        console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0020 end-----------------------");
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Promise_0020
     * @tc.name    SUB_Misc_REQUEST_Remove_Upload_Promise_0020
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Promise_0020', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0020 is starting-----------------------");
      try {
        let task = await request.agent.create(globalThis.abilityContext, config);
        //@ts-ignore
        await request.agent.remove(task.tid, 'a');
        expect(true).assertEqual(true);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0020 remove success: " + task);
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0020 catch error: " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0020 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Callback_0030
     * @tc.name    SUB_Misc_REQUEST_Remove_Upload_Callback_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Callback_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0030 is starting-----------------------");
      try {
        // @ts-ignore
        request.agent.remove(true, (err) => {
          try {
            expect().assertFail();
          }catch (err){
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0030 remove fail: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0030 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0030 err.code: " + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Promise_0030
     * @tc.name    SUB_Misc_REQUEST_Remove_Upload_Promise_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Promise_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0030 is starting-----------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0030 remove");
        // @ts-ignore
        await request.agent.remove(true);
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0030 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0030 err.code: " + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
      console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0030 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Callback_0040
     * @tc.name    SUB_Misc_REQUEST_Remove_Upload_Callback_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Callback_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0040 is starting-----------------------");
      try {
        // @ts-ignore
        request.agent.remove(1, (err) => {
          try {
            expect().assertFail();
          }catch (err){
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0040 remove fail: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0040 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0040 err.code: " + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Promise_0040
     * @tc.name    SUB_Misc_REQUEST_Remove_Upload_Promise_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Promise_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0040 is starting-----------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0040 remove");
        // @ts-ignore
        await request.agent.remove(1);
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0040 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0040 err.code: " + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
      console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0040 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Callback_0050
     * @tc.name    SUB_Misc_REQUEST_Remove_Upload_Callback_0050
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Callback_0050', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0050 is starting-----------------------");
      try {
        request.agent.remove('abc', (err) => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0050 remove fail: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900006);
              done();
            }else{
              console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0050 remove abc err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            }
          }catch (err){
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0050 remove catch fail: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0050 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0050 err.code: " + err.code);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Promise_0050
     * @tc.name    SUB_Misc_REQUEST_Remove_Upload_Promise_0050
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Promise_0050', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0050 is starting-----------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0050 remove");
        await request.agent.remove('abc');
        expect().assertFail();        
        console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0050 end-----------------------");
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0050 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0050 err.code: " + err.code);
        expect(err.code).assertEqual(21900006);
        done();
      }
    });


    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Callback_0060
     * @tc.name    SUB_Misc_REQUEST_Remove_Upload_Callback_0060
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Callback_0060', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0060 is starting-----------------------");
      let task = await request.agent.create(globalThis.abilityContext, config);
      request.agent.remove(task.tid, (err) => {
        try {
          if(err){
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0060 remove err: " + JSON.stringify(err));
            expect().assertFail();
          }
          expect(task !== undefined).assertEqual(true);
          try {
            request.agent.remove(task.tid, (err) => {
              if(err){
                console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0060 remove second err: " + JSON.stringify(err));
                expect(err.code).assertEqual(21900006);
                done();
              }else{
                console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0060 remove second: " + JSON.stringify(err));
                expect().assertFail();
                done();
              }
            });
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0060 remove second catch err: " + JSON.stringify(err));
            done();
          }
        } catch (err) {
          console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0060 remove fail: " + JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Promise_0060
     * @tc.name    SUB_Misc_REQUEST_Remove_Upload_Promise_0060
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Promise_0060', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0060 is starting-----------------------");
      try {
        let task = await request.agent.create(globalThis.abilityContext, config);
        await request.agent.remove(task.tid);
        await sleep(100);
        await request.agent.remove(task.tid);
        expect().assertFail();
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0060 remove success: " + task);
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0060 catch error: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900006);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_On_Upload_Progress_0010
     * @tc.name SUB_Misc_REQUEST_On_Upload_Progress_0010
     * @tc.desc  download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Progress_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Progress_0010 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_progressCallback = async (pro) => {
            task.off('progress', on_progressCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0010 pro: " + JSON.stringify(pro));
            expect(true).assertTrue();
            await sleep(100);
            done();
          }

          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            //@ts-ignore
            task.on('progress',  on_progressCallback, 'a');
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0010 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Progress_0010
     * @tc.name    SUB_Misc_REQUEST_Off_Upload_Progress_0010
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Progress_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Progress_0010 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 on_progressCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            //@ts-ignore
            task.off('progress', on_progressCallback, 'a');
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 offProgress success flag: " + flag);
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 offProgress success flag: " + flag);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 offProgress fail err: " + JSON.stringify(err));
              }
              done();
            }, 100)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 catch err: " + JSON.stringify(err));
            await sleep(100);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 create catch err: " + JSON.stringify(err));
        await sleep(100);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Off_Upload_Progress_0020
     * @tc.name SUB_Misc_REQUEST_Off_Upload_Progress_0020
     * @tc.desc download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Progress_0020', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Progress_0020 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;

      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0020 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro) => {
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0020 on_progressCallback1 flag1: " + flag1);
          }
          try {
            if (err) {
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0020 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            task.on('progress', on_progressCallback1);
            task.off('progress', on_progressCallback);
            task.on('completed', (pro)=>{
              try{
                task.off('progress');
                task.off('completed');
                expect(flag).assertTrue();
                expect(flag1).assertFalse();
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0020 offProgress success flag: " + flag);
                done();
              }catch(err){
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0020 offProgress fail err: " + JSON.stringify(err));
                done();
              }
            })  
            await task.start();                      
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0020 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0020 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Progress_0030
     * @tc.name    SUB_Misc_REQUEST_On_Upload_Progress_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Progress_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Progress_0030 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      let arr1 = [0, 1, 2];
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', (pro1) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 pro1: " + JSON.stringify(pro1));
              arr.push(0);
            });
            task.on('progress', (pro2) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 pro2: " + JSON.stringify(pro2));
              arr.push(1);
            });
            task.on('progress', (pro3) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 pro3: " + JSON.stringify(pro3));
              arr.push(2);
            });
            task.on('completed', (pro)=>{
              try{
                task.off('progress');
                task.off('completed');
                expect(arr.slice(0,3).join()).assertEqual(arr1.join());
                console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 offProgress success");
                done();
              }catch(err){
                console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 offProgress fail err: " + JSON.stringify(err));
                done();
              }
            })  
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Progress_0030
     * @tc.name    SUB_Misc_REQUEST_Off_Upload_Progress_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Progress_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Progress_0030 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_progressCallback1 =async (pro1) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 pro1: " + JSON.stringify(pro1));
            arr.push(1);
          }
          let on_progressCallback2 =async (pro2) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 pro2: " + JSON.stringify(pro2));
            arr.push(2);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback1);
            task.on('progress', on_progressCallback2);
            task.off('progress');
            task.on('completed', (pro)=>{
              try{
                task.off('completed');
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 task progress on arr: " + JSON.stringify(arr));
                expect(arr.length).assertEqual(0);
                done();
              }catch(err){
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 offProgress fail err: " + JSON.stringify(err));
                done();
              }
            })  
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Progress_0040
     * @tc.name    SUB_Misc_REQUEST_On_Upload_Progress_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Progress_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Progress_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_progressCallback = async (pro) => {
            task.off('progress', on_progressCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0040 pro: " +  JSON.stringify(pro));
            expect(true).assertTrue();
            await sleep(100);
            done();
          }

          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0040 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Progress_0040
     * @tc.name    SUB_Misc_REQUEST_Off_Upload_Progress_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Progress_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Progress_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0040 on_progressCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            task.off('progress', on_progressCallback);
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0040 offProgress success flag: " + flag);
            task.on('completed', (pro)=>{
              try{
                task.off('completed');
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 task progress on");
                expect(flag).assertTrue();
                done();
              }catch(err){
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 offProgress fail err: " + JSON.stringify(err));
                done();
              }
            })  
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0040 catch err: " + JSON.stringify(err));
            await sleep(100);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0040 create catch err: " + JSON.stringify(err));
        await sleep(100);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_On_Upload_Completed_0010
     * @tc.name SUB_Misc_REQUEST_On_Upload_Completed_0010
     * @tc.desc  download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Completed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Completed_001 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_completedCallback =async (pro) => {
            task.off('completed', on_completedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_001 pro: " + JSON.stringify(pro));
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_001 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            //@ts-ignore
            task.on('completed', on_completedCallback, 'a');
            await task.start();
            await sleep(100);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_001 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_001 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Completed_0010
     * @tc.name    SUB_Misc_REQUEST_Off_Upload_Completed_0010
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Completed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Completed_0010 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_offCompletedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 on_offCompletedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_offCompletedCallback);
            //@ts-ignore
            task.off('completed', on_offCompletedCallback, 'a');
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 offCompleted success flag: " + flag);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 offCompleted fail err: " + JSON.stringify(err));
              }
              done();
            }, 100)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 catch err: " + JSON.stringify(err));
            await sleep(100);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 create catch err: " + JSON.stringify(err));
        await sleep(100);
        done();
      }
    });

    /**
     * @tc.number    SUB_REQUEST_Off_Upload_Completed_0200
     * @tc.name    SUB_REQUEST_Off_Upload_Completed_0200
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Upload_Completed_0200', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_Off_Upload_Completed_0200 is starting-----------------------");
      let flag = true;
      let on_offCompletedCallback1 =async (pro1: request.agent.Progress) => {
        flag = false;
        console.info("====>SUB_REQUEST_Off_Upload_Completed_0200 pro1: " + JSON.stringify(pro1));
      }

      let on_offCompletedCallback2 =async (pro2: request.agent.Progress) => {
        console.info("====>SUB_REQUEST_Off_Upload_Completed_0200 pro2: " + JSON.stringify(pro2));
      }
      try {
        let task1: request.agent.Task = await request.agent.create(globalThis.abilityContext, config);
        let task2: request.agent.Task = await request.agent.create(globalThis.abilityContext, config);
        console.info("====>SUB_REQUEST_Off_Upload_Completed_0200 create task1 and task2 success");
        task1.on('completed', on_offCompletedCallback1);
        task2.on('completed', on_offCompletedCallback2);
        console.info("====>SUB_REQUEST_Off_Upload_Completed_0200 task1.on and task2.on success");
        task1.off('completed', on_offCompletedCallback1);
        console.info("====>SUB_REQUEST_Off_Upload_Completed_0200 off completed success");
        task2.on('completed', (pro)=>{
          try{
            task2.off('completed');
            console.info("====>SUB_REQUEST_Off_Upload_Completed_0200 task progress on arr: ");
            expect(flag).assertTrue();
            done();
          }catch(err){
            console.info("====>SUB_REQUEST_Off_Upload_Completed_0200 offProgress fail err: " + JSON.stringify(err));
            done();
          }
        })  
        await task1.start();
        await task2.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Upload_Completed_0200 create catch err: " + JSON.stringify(err.message));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Completed_0030
     * @tc.name    SUB_Misc_REQUEST_On_Upload_Completed_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Completed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Completed_0030 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', (pro1) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 pro1: " + JSON.stringify(pro1));
              arr.push(0);
            });
            task.on('completed', (pro2) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 pro2: " + JSON.stringify(pro2));
              arr.push(1);
            });
            task.on('completed', (pro3) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 pro3: " + JSON.stringify(pro3));
              arr.push(2);
            });
            task.off('completed');
            let t = setTimeout(async ()=>{
              try{
                task.off('completed')
                expect(arr.length).assertEqual(0);
                await request.agent.remove(task.tid);
                console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 end!");
                done();
              }catch(err){
                console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030  err: " + JSON.stringify(err));
                done();
              }
            }, 5000);            
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Completed_0030
     * @tc.name    SUB_Misc_REQUEST_Off_Upload_Completed_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Completed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Completed_0030 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_offCompletedCallback1 =async (pro1) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 pro1: " + JSON.stringify(pro1));
            arr.push(1);
          }
          let on_offCompletedCallback2 =async (pro2) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 pro2: " + JSON.stringify(pro2));
            arr.push(2);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_offCompletedCallback1);
            task.on('completed', on_offCompletedCallback2);
            task.off('completed');
            let t = setTimeout(async ()=>{
              try{
                expect(arr.length).assertEqual(0);
                await request.agent.remove(task.tid);
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 end!");
                done();
              }catch(err){
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030  err: " + JSON.stringify(err));
                done();
              }
            }, 5000);    
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Completed_0040
     * @tc.name    SUB_Misc_REQUEST_On_Upload_Completed_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Completed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Completed_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_completedCallback =async (pro) => {
            task.off('completed', on_completedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 pro: " + JSON.stringify(pro));
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            await sleep(100);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Completed_0040
     * @tc.name    SUB_Misc_REQUEST_Off_Upload_Completed_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Completed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Completed_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_offCompletedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 on_offCompletedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_offCompletedCallback);
            task.off('completed', on_offCompletedCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 offCompleted success flag: " + flag);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 offCompleted fail err: " + JSON.stringify(err));
              }
              done();
            }, 5000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 catch err: " + JSON.stringify(err));
            await sleep(100);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 create catch err: " + JSON.stringify(err));
        await sleep(100);
        done();
      }
    });

    /**
     *
     * @tc.number SUB_Misc_REQUEST_On_Upload_Failed_0010
     * @tc.name SUB_Misc_REQUEST_On_Upload_Failed_0010
     * @tc.desc  download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Failed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Failed_0010 is starting-----------------------");
      let config_ = config;
      config_.url = 'http://127.0.0.1';
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_failedCallback = async (pro) => {
            task.off('failed', on_failedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0010 pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(65);
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            //@ts-ignore
            task.on('failed', on_failedCallback, 'a');
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0010 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Failed_0010
     * @tc.name    SUB_Misc_REQUEST_Off_Upload_Failed_0010
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Failed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Failed_0010 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_failedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 on_failedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            //@ts-ignore
            task.off('failed', on_failedCallback, 'a');
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 offFailed success flag: " + flag);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 offFailed fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 100);
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Off_Upload_Failed_0020
     * @tc.name SUB_Misc_REQUEST_Off_Upload_Failed_0020
     * @tc.desc download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Failed_0020', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Failed_0020 is starting-----------------------");
      let config_ = config
      config_.url = 'http://127.0.0.1';
      config_.mode = request.agent.Mode.FOREGROUND;

      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0020 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro) => {
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0020 on_progressCallback1 flag1: " + flag1);
          }
          try {
            if (err) {
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0020 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_progressCallback);
            task.on('failed', on_progressCallback1);
            task.off('failed', on_progressCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                task.off('failed');
                clearTimeout(t);
                expect(flag).assertTrue();
                expect(flag1).assertFalse();
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0020 offProgress success flag: " + flag);
                done();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0020 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
                done();
              }
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0020 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0020 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Failed_0030
     * @tc.name    SUB_Misc_REQUEST_On_Upload_Failed_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Failed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Failed_0030 is starting-----------------------");
      let config_ = config
      config_.url = 'http://127.0.0.1';
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      let arr1 = [0, 1, 2];
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', (pro1) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 pro1: " + JSON.stringify(pro1));
              arr.push(0);
            });
            task.on('failed', (pro2) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 pro2: " + JSON.stringify(pro2));
              arr.push(1);
            });
            task.on('failed', (pro3) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 pro3: " + JSON.stringify(pro3));
              arr.push(2);
            });
            let t = setTimeout(async ()=>{
              try{
                task.off('failed')
                expect(arr.join()).assertEqual(arr1.join());
                console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 end!");
                done();
              }catch(err){
                console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030  err: " + JSON.stringify(err));
                done();
              }
            }, 3000);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Failed_0030
     * @tc.name    SUB_Misc_REQUEST_Off_Upload_Failed_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Failed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Failed_0030 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_offCompletedCallback1 =async (pro1) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 pro1: " + JSON.stringify(pro1));
            arr.push(1);
          }
          let on_offCompletedCallback2 =async (pro2) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 pro2: " + JSON.stringify(pro2));
            arr.push(2);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_offCompletedCallback1);
            task.on('failed', on_offCompletedCallback2);
            task.off('failed');
            await task.start();
            await sleep(100);
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 task failed on arr: " + JSON.stringify(arr));
            expect(arr.length).assertEqual(0);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Failed_0040
     * @tc.name    SUB_Misc_REQUEST_On_Upload_Failed_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Failed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Failed_0040 is starting-----------------------");
      let config_ = config
      config_.url = 'http://127.0.0.1';
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_failedCallback = async (pro) => {
            task.off('failed', on_failedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0040 pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(65);
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Failed_0040
     * @tc.name    SUB_Misc_REQUEST_Off_Upload_Failed_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Failed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Failed_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_failedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 on_failedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            task.off('failed', on_failedCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 offFailed success flag: " + flag);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 offFailed fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 100);
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Callback_0060
     * @tc.name    SUB_Misc_REQUEST_Create_Upload_Callback_0060
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Callback_0060', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0060 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      request.agent.create(globalThis.abilityContext, config_, async (err, task1)=>{
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0060 uploadTask: " + task1);
        try{
          if(err){
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0060 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          request.agent.create(globalThis.abilityContext, config_, async (err, task2)=>{
            try {
              if(err){
                console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0060 create err: " + JSON.stringify(err));
                expect().assertFail();
              }
              await request.agent.remove(task1.tid);
              console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0060 task1 remove");
              await request.agent.remove(task2.tid);
              console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0060 task2 remove");
              expect(true).assertTrue()
              done();
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0060 catch err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            }
          });
        }catch(error){
          console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0060 create fail: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Promise_0060
     * @tc.name    SUB_Misc_REQUEST_Create_Upload_Promise_0060
     * @tc.desc      Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Promise_0060', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Promise_0060 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let task1 = await request.agent.create(globalThis.abilityContext, config_);
        let task2 = await request.agent.create(globalThis.abilityContext, config_);
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0060 task1 and task2 create success");
        await request.agent.remove(task1.tid);
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0060 task1 remove");
        await request.agent.remove(task2.tid);
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0060 task2 remove");
        expect(true).assertTrue()
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0060 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_On_Upload_Failed_0500
     * @tc.name SUB_REQUEST_On_Upload_Failed_0500
     * @tc.desc download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_On_Upload_Failed_0500', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_On_Upload_Failed_0500 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_failedCallback = async (pro) => {
            task.off('failed', on_failedCallback);
            expect(true).assertTrue();
            console.info('====>SUB_REQUEST_On_Upload_Failed_0500 background onFailed success');
            done();
          }
          try {
            if (err) {
              console.info('====>SUB_REQUEST_On_Upload_Failed_0500 create err: ' + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            await task.start();
            console.info('====>SUB_REQUEST_On_Upload_Failed_0500 task.start success');
          } catch (err) {
            console.info('====>SUB_REQUEST_On_Upload_Failed_0500 catch err: ' + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info('====>SUB_REQUEST_On_Upload_Failed_0500 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_On_Upload_Failed_0600
     * @tc.name SUB_REQUEST_On_Upload_Failed_0600
     * @tc.desc download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_On_Upload_Failed_0600', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_On_Upload_Failed_0600 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_failedCallback = async (pro) => {
            task.off('failed', on_failedCallback);
            expect(true).assertTrue();
            console.info('====>SUB_REQUEST_On_Upload_Failed_0600 background onFailed success');
            done();
          }
          try {
            if (err) {
              console.info('====>SUB_REQUEST_On_Upload_Failed_0600 create err: ' + JSON.stringify(err));
              expect().assertFail();
            }
            let a = 'addParameter'
            // @ts-ignore
            task.on('failed', on_failedCallback, a);
            await task.start();
          } catch (err) {
            console.info('====>SUB_REQUEST_On_Upload_Failed_0600 catch err: ' + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info('====>SUB_REQUEST_On_Upload_Failed_0600 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Upload_Failed_0500
     * @tc.name SUB_REQUEST_Off_Upload_Failed_0500
     * @tc.desc Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Upload_Failed_0500', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_Off_Upload_Failed_0500 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      let arr = new Array();
      let arr1 = [0, 1, 2];
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Upload_Failed_0500 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1) => {
            task.off('failed', pro1)
            console.info("====>SUB_REQUEST_Off_Upload_Failed_0500 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2) => {
            task.off('failed', pro2)
            console.info("====>SUB_REQUEST_Off_Upload_Failed_0500 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3) => {
            try {
              task.off('failed', pro3)
              console.info("====>SUB_REQUEST_Off_Upload_Failed_0500 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Upload_Failed_0500 task3 failed on arr: " + JSON.stringify(arr));
              expect(arr.join()).assertEqual(arr1.join());
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Upload_Failed_0500 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('failed', pro1);
          task.on('failed', pro2);
          task.on('failed', pro3);
          await task.start();
          console.info("====>SUB_REQUEST_Off_Upload_Failed_0500 task.start");
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Upload_Failed_0500 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Upload_Failed_0600
     * @tc.name SUB_REQUEST_Off_Upload_Failed_0600
     * @tc.desc Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Upload_Failed_0600', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_Upload_backgroundOnFailed_0500 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      let arr = new Array();
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Upload_Failed_0600 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1) => {
            console.info("====>SUB_REQUEST_Off_Upload_Failed_0600 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2) => {
            console.info("====>SUB_REQUEST_Off_Upload_Failed_0600 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3) => {
            try {
              task.off('failed', pro3)
              console.info("====>SUB_REQUEST_Off_Upload_Failed_0600 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Upload_Failed_0600 task3 failed on arr: " + JSON.stringify(arr));
              expect(arr[0]).assertEqual(2);
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Upload_Failed_0600 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('failed', pro1);
          task.on('failed', pro2);
          task.off('failed');
          task.on('failed', pro3);
          await task.start();
          console.info("====>SUB_REQUEST_Off_Upload_Failed_0600 task.start");
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Upload_Failed_0600 create catch err: " + JSON.stringify(err));
        done();
      }
    });    

    /**
     * @tc.number SUB_REQUEST_On_Upload_Remove_0100
     * @tc.name SUB_REQUEST_On_Upload_Remove_0100
     * @tc.desc download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_On_Upload_Remove_0100', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_On_Upload_Remove_0100 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_removeCallback = async (pro) => {
            try {
              task.off('remove', on_removeCallback);
              expect(true).assertTrue();
              console.info('====>SUB_REQUEST_On_Upload_Remove_0100 on_removeCallback success');
              done();
            } catch (err) {
              console.info('====>SUB_REQUEST_On_Upload_Remove_0100 task not remove: ' + JSON.stringify(task.tid));
              done();
            }

          }
          try {
            if (err) {
              console.info('====>SUB_REQUEST_On_Upload_Remove_0100 create err: ' + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('remove', on_removeCallback);
            request.agent.remove(task.tid)
          } catch (err) {
            console.info('====>SUB_REQUEST_On_Upload_Remove_0100 catch err: ' + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info('====>SUB_REQUEST_On_Upload_Remove_0100 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_On_Upload_Remove_0200
     * @tc.name SUB_REQUEST_On_Upload_Remove_0200
     * @tc.desc download task
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_On_Upload_Remove_0200', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_On_Upload_Remove_0200 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_pauseCallback = async (pro) => {
            try {
              task.off('remove', on_pauseCallback);
              expect(true).assertTrue();
              console.info('====>SUB_REQUEST_On_Upload_Remove_0200 background onPause success');
              done();
            } catch (err) {
              console.info('====>SUB_REQUEST_On_Upload_Remove_0200 task not remove: ' + JSON.stringify(task.tid));
              done();
            }
          }
          try {
            if (err) {
              console.info('====>SUB_REQUEST_On_Upload_Remove_0200 create err: ' + JSON.stringify(err));
              expect().assertFail();
            }
            let a = 'addParameter'
            // @ts-ignore
            task.on('remove', on_pauseCallback, a);
            await request.agent.remove(task.tid);
          } catch (err) {
            console.info('====>SUB_REQUEST_On_Upload_Remove_0200 catch err: ' + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info('====>SUB_REQUEST_On_Upload_Remove_0200 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Upload_Remove_0100
     * @tc.name SUB_REQUEST_Off_Upload_Remove_0100
     * @tc.desc Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Upload_Remove_0100', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_Off_Upload_Remove_0100 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      let arr = new Array();
      let arr1 = [0, 1, 2];
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Upload_Remove_0100 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1) => {
            task.off('remove', pro1)
            console.info("====>SUB_REQUEST_Off_Upload_Remove_0100 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2) => {
            task.off('remove', pro2)
            console.info("====>SUB_REQUEST_Off_Upload_Remove_0100 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3) => {
            try {
              task.off('remove', pro3)
              console.info("====>SUB_REQUEST_Off_Upload_Remove_0100 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Upload_Remove_0100 task3 remove on arr: " + JSON.stringify(arr));
              expect(arr.join()).assertEqual(arr1.join());
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Upload_Remove_0100 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('remove', pro1);
          task.on('remove', pro2);
          task.on('remove', pro3);
          await request.agent.remove(task.tid);
          console.info("====>SUB_REQUEST_Off_Upload_Remove_0100 task.start");
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Upload_Remove_0100 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Upload_Remove_0200
     * @tc.name SUB_REQUEST_Off_Upload_Remove_0200
     * @tc.desc Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Upload_Remove_0200', 0, async function (done) {
      console.info('====>-----------------------SUB_REQUEST_Off_Upload_Remove_0200 is starting-----------------------');
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      let arr = new Array();
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Upload_Remove_0200 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1) => {
            console.info("====>SUB_REQUEST_Off_Upload_Remove_0200 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2) => {
            console.info("====>SUB_REQUEST_Off_Upload_Remove_0200 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3) => {
            try {
              task.off('remove', pro3)
              console.info("====>SUB_REQUEST_Off_Upload_Remove_0200 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Upload_Remove_0200 task3 remove on arr: " + JSON.stringify(arr));
              expect(arr[0]).assertEqual(2);
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Upload_Remove_0200 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('remove', pro1);
          task.on('remove', pro2);
          task.off('remove');
          task.on('remove', pro3);
          await request.agent.remove(task.tid);
          console.info("====>SUB_REQUEST_Off_Upload_Remove_0200 task.start");
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Upload_Remove_0200 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Upload_broadcastEvent_0200
     * @tc.name SUB_REQUEST_Upload_broadcastEvent_0200
     * @tc.desc Starts a upload session.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Upload_broadcastEvent_0200', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_Upload_broadcastEvent_0200 is starting-----------------------");
      let config_ = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND,
        method: "POST",
        data: attachments,
      };

      function unSubscriberCallback (err){
        console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        try {
          console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 subscriberCallback data:"
          + JSON.stringify(data));
          commonEvent.unsubscribe(subscriber, unSubscriberCallback);
          console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 data.code: " + data.code);
          expect(data.code).assertEqual(65);
          done();
        } catch (err) {
          console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 subscriberCallback error: " + JSON.stringify(err));
          done();
        }
      }
      var commonEventSubscribeInfo = {
        events: [ request.agent.BroadcastEvent.COMPLETE ]
      }
      var subscriber;
      commonEvent.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 subscriber data:" + data);
        commonEvent.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 subscriber finish");
      })

      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          try {
            if(err){
              console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            await task.start();
            console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 task start");
          } catch (err) {
            console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 catch err: " + JSON.stringify(err));
          }
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Upload_broadcastEvent_0200 create catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
    });

  })
}
