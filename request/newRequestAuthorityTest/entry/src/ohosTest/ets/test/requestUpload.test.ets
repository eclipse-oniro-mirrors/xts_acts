/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import fileio from '@ohos.fileio'
import request from "@ohos.request";
import commonEvent from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

export default function requestUploadJSUnit() {
  describe('requestUploadJSUnit', () => {
    console.info('====>################################request upload Test start');
    
    let baseContext: common.Context;
    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll((done: Function) => {
      try {
        console.info('====>beforeAll: startServer');
        new Server().startServer();
        console.info('====>beforeAll: startServer success!');
        let context: common.Context | undefined = AppStorage.get('context');
        if (context !== undefined){
          baseContext = context;
          console.info('====>beforeAll requestUploadJSUnit baseContext:'+JSON.stringify(baseContext))
        } else {
          console.info('====>beforeAll requestUploadJSUnit baseContext is undefined')
        }
        let pathDir: string = baseContext.cacheDir;
        let filePath = pathDir + `/test.txt`;
        let fd = fileio.openSync(filePath, 0o100 | 0o2, 0o666);
        let content = ''.padEnd(1 * 1024, 'Hello world');
        fileio.writeSync(fd, content);
        fileio.closeSync(fd);
        console.info('====>beforeAll: text.txt file generate');
        done();
      } catch (err) {
        console.info('====>beforeAll: text.txt file generate failed: ' + err);
        done();
      }
    })

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

    let attachments: Array<request.agent.FormItem> = [{
      name: "uploadTest",
      value: {
        path: "./test.txt",
        filename: "test.txt",
        mimeType: "application/octet-stream"
      }
    }];

    let config: request.agent.Config = {
      action: request.agent.Action.UPLOAD,
      url: 'http://127.0.0.1:8080',
      title: 'uploadTest',
      description: 'Sample code for event listening',
      mode: request.agent.Mode.BACKGROUND,
      overwrite: true,
      method: "POST",
      data: attachments,
      saveas: "./",
      network: request.agent.Network.CELLULAR,
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

    let sleep = (timeout: number): Promise<null> => {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Callback_0010
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Misc_REQUEST_Create_Upload_Callback_0010', Level.LEVEL0, async (done: Function) => {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0010 is starting-----------------------");
      request.agent.create(baseContext, config, async (err, task)=>{
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0010 uploadTask: " + task);
        try{
          if(err){
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0010 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          expect(task !== undefined).assertEqual(true);
          console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0010 create success: " + task);
          await request.agent.remove(task.tid);
          console.info("-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0010 end-----------------------");
          done();
        }catch(error){
          console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0010 create fail: " + JSON.stringify(error));
          await request.agent.remove(task.tid);
          done();
        }

      });
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Promise_0010
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Misc_REQUEST_Create_Upload_Promise_0010', Level.LEVEL0, async (done: Function) => {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Upload_Promise_0010 is starting-----------------------");
      let task: request.agent.Task | undefined;
      try {
        task = await request.agent.create(baseContext, config);
        expect(task !== undefined).assertEqual(true);
        await request.agent.remove(task.tid);
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0010 create success: " + task);
        console.info("-----------------------SUB_Misc_REQUEST_Create_Upload_Promise_0010 end-----------------------");
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0010 catch error: " + JSON.stringify(err));
        if(task !== undefined){
          await request.agent.remove(task.tid);
          console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0010 agent.remove success");
        }
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Remove_Upload_Callback_0010
     * @tc.desc Delete the upload task.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Callback_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0010 is starting-----------------------");
      try {
        let task = await request.agent.create(baseContext, config);
        request.agent.remove(task.tid, err => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0010 remove err: " + JSON.stringify(err));
              expect().assertFail();
            }
            expect(task !== undefined).assertEqual(true);
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0010 remove success: " + task);
            console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0010 end-----------------------");
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0010 remove fail: " + JSON.stringify(err));
            done();
          }
        });
      } catch (error) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0010 catch error: " + JSON.stringify(error));
        expect().assertFail();
        done();
      }

    });

    /**
     * @tc.number SUB_Misc_REQUEST_Remove_Upload_Promise_0010
     * @tc.desc Delete the upload task.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Promise_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0010 is starting-----------------------");
      try {
        let task = await request.agent.create(baseContext, config);
        await request.agent.remove(task.tid);
        expect(true).assertEqual(true);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0010 remove success: " + task);
        console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0010 end-----------------------");
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0010 catch error: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Start_Upload_Callback_0010
     * @tc.desc Suspend the upload task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Start_Upload_Callback_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Start_Upload_Callback_0010 is starting-----------------------");
      request.agent.create(baseContext, config, async (err, task)=>{
        console.info("====>SUB_Misc_REQUEST_Start_Upload_Callback_0010 uploadTask: " + JSON.stringify(task));
        task.start(async err => {
          try{
            if(err){
              console.info("====>SUB_Misc_REQUEST_Start_Upload_Callback_0010 upload start err: " + JSON.stringify(err));
              expect().assertFail();
            }
            expect(true).assertEqual(true);
            console.info("====>SUB_Misc_REQUEST_Start_Upload_Callback_0010 upload start success: " + task);
            console.info("-----------------------SUB_Misc_REQUEST_Start_Upload_Callback_0010 end-----------------------");
            await sleep(100);
            done();
          }catch(err){
            console.info("====>SUB_Misc_REQUEST_Start_Upload_Callback_0010 catch err: " + JSON.stringify(err));
            done();
          }
        });
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Start_Upload_Promise_0010
     * @tc.desc Suspend the upload task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Start_Upload_Promise_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Start_Upload_Promise_0010 is starting-----------------------");
      try {
        let task = await request.agent.create(baseContext, config);
        await task.start();
        expect(true).assertEqual(true);
        console.info("====>SUB_Misc_REQUEST_Start_Upload_Promise_0010 upload start success: " + JSON.stringify(task));
        console.info("-----------------------SUB_Misc_REQUEST_Start_Upload_Promise_0010 end-----------------------");
        await sleep(100);
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Start_Upload_Promise_0010 upload start err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Pause_Upload_Callback_0010
     * @tc.desc Restore the upload task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Pause_Upload_Callback_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Pause_Upload_Callback_0010 is starting-----------------------");
      request.agent.create(baseContext, config, async (err, task)=>{
        console.info("====>SUB_Misc_REQUEST_Pause_Upload_Callback_0010 uploadTask: " + JSON.stringify(task));
        task.start(err => {
          console.info("====>SUB_Misc_REQUEST_Pause_Upload_Callback_0010 upload start: " + JSON.stringify(err));
          task.pause(async err => {
            try{
              if(err){
                console.info("====>SUB_Misc_REQUEST_Pause_Upload_Callback_0010 upload pause err: " + JSON.stringify(err));
                expect().assertFail();
              }
              expect(true).assertEqual(true);
              console.info("====>SUB_Misc_REQUEST_Pause_Upload_Callback_0010 upload pause success: " + task);
              console.info("-----------------------SUB_Misc_REQUEST_Pause_Upload_Callback_0010 end-----------------------");
              await sleep(100);
              done();
            }catch(err){
              console.info("====>SUB_Misc_REQUEST_Pause_Upload_Callback_0010 catch err: " + JSON.stringify(err));
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Pause_Upload_Promise_0010
     * @tc.desc Restore the upload task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Pause_Upload_Promise_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Pause_Upload_Promise_0010 is starting-----------------------");
      let task = await request.agent.create(baseContext, config);
      console.info("====>SUB_Misc_REQUEST_Pause_Upload_Promise_0010 create task: " + JSON.stringify(task));
      task.start(async err => {
        try {
          console.info("====>SUB_Misc_REQUEST_Pause_Upload_Promise_0010 upload start: " + JSON.stringify(err));
          await task.pause();
          expect(true).assertEqual(true);
          console.info("====>SUB_Misc_REQUEST_Pause_Upload_Promise_0010 upload pause success: " + task);
          console.info("-----------------------SUB_Misc_REQUEST_Pause_Upload_Promise_0010 end-----------------------");
          done();
        } catch (err) {
          console.info("====>SUB_Misc_REQUEST_Pause_Upload_Promise_0010 upload pause err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Resume_Upload_Callback_0010
     * @tc.desc Get the upload task info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Resume_Upload_Callback_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Resume_Upload_Callback_0010 is starting-----------------------");
      request.agent.create(baseContext, config, async (err, task)=>{
        console.info("====>SUB_Misc_REQUEST_Resume_Upload_Callback_0010 uploadTask: " + JSON.stringify(task));
        task.start(err => {
          console.info("====>SUB_Misc_REQUEST_Resume_Upload_Callback_0010 start: " + JSON.stringify(err));
          task.pause(err => {
            console.info("====>SUB_Misc_REQUEST_Resume_Upload_Callback_0010 pause: " + JSON.stringify(err));
            task.resume(async err => {
              try{
                if(err){
                  console.info("====>SUB_Misc_REQUEST_Resume_Upload_Callback_0010 upload resume err: " + JSON.stringify(err));
                  expect().assertFail();
                }
                expect(true).assertEqual(true);
                console.info("====>SUB_Misc_REQUEST_Resume_Upload_Callback_0010 upload resume success: " + task);
                console.info("-----------------------SUB_Misc_REQUEST_Resume_Upload_Callback_0010 end-----------------------");
                await sleep(100);
                done();
              }catch(err){
                console.info("====>SUB_Misc_REQUEST_Resume_Upload_Callback_0010 catch err: " + JSON.stringify(err));
                done();
              }
            })
          })
        });
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Resume_Upload_Promise_0010
     * @tc.desc Get the upload task info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Resume_Upload_Promise_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Resume_Upload_Promise_0010 is starting-----------------------");
      let task = await request.agent.create(baseContext, config);
      console.info("====>SUB_Misc_REQUEST_Resume_Upload_Promise_0010 create task: " + JSON.stringify(task));
      task.start(err => {
        console.info("====>SUB_Misc_REQUEST_Resume_Upload_Promise_0010 start: " + JSON.stringify(err));
        task.pause(async err => {
          console.info("====>SUB_Misc_REQUEST_Resume_Upload_Promise_0010 pause: " + JSON.stringify(err));
          try {
            await task.resume();
            expect(true).assertEqual(true);
            console.info("====>SUB_Misc_REQUEST_Resume_Upload_Promise_0010 upload resume success: " + task);
            console.info("-----------------------SUB_Misc_REQUEST_Resume_Upload_Promise_0010 end-----------------------");
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Resume_Upload_Promise_0010 upload resume err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Stop_Upload_Callback_0010
     * @tc.desc Get the upload task info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_Misc_REQUEST_Stop_Upload_Callback_0010', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Stop_Upload_Callback_0010 is starting-----------------------");
      request.agent.create(baseContext, config, async (err, task)=>{
        console.info("====>SUB_Misc_REQUEST_Stop_Upload_Callback_0010 uploadTask: " + JSON.stringify(task));
        task.start(err => {
          console.info("====>SUB_Misc_REQUEST_Stop_Upload_Callback_0010 start: " + JSON.stringify(err));
          task.stop(async err => {
            try{
              if(err){
                console.info("====>SUB_Misc_REQUEST_Stop_Upload_Callback_0010 upload stop err: " + JSON.stringify(err));
                expect().assertFail() ;
              }
              expect(true).assertEqual(true);
              console.info("====>SUB_Misc_REQUEST_Stop_Upload_Callback_0010 upload stop success: " + task);
              console.info("-----------------------SUB_Misc_REQUEST_Stop_Upload_Callback_0010 end-----------------------");
              await sleep(100);
              done();
            }catch(err){
              console.info("====>SUB_Misc_REQUEST_Stop_Upload_Callback_0010 catch err: " + JSON.stringify(err));
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Stop_Upload_Promise_0010
     * @tc.desc Get the upload task info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_Misc_REQUEST_Stop_Upload_Promise_0010', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Stop_Upload_Promise_0010 is starting-----------------------");
      let task = await request.agent.create(baseContext, config);
      console.info("====>SUB_Misc_REQUEST_Stop_Upload_Promise_0010 create task: " + JSON.stringify(task));
      task.start(async err => {
        console.info("====>SUB_Misc_REQUEST_Stop_Upload_Promise_0010 start: " + JSON.stringify(err));
        try {
          await task.stop();
          expect(true).assertEqual(true);
          console.info("====>SUB_Misc_REQUEST_Stop_Upload_Promise_0010 upload stop success: " + task);
          done();
        } catch (err) {
          console.info("====>SUB_Misc_REQUEST_Stop_Upload_Promise_0010 upload stop err: " + JSON.stringify(err));
          await sleep(100);
          done();
        }
      })
    });

    /*
    * @tc.number: SUB_REQUEST_Agent_UploadConfig_1700
    * @tc.name: SUB_REQUEST_Agent_UploadConfig_1700
    * @tc.desc: different upload path or upload file name of config
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 2
    */
    it('SUB_REQUEST_Agent_UploadConfig_1700', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_1700 is starting-----------------------");
      let value: ESObject = {
        path: undefined,
        filename: 'el1BaseNormal.txt'
      }

      let att: Array<ESObject> = [{
        name: 'uploadTest',
        value: value
      }]

      let config_: request.agent. Config = JSON.parse(JSON.stringify(config));
      config_.data = att
      console.info("====>SUB_REQUEST_Agent_UploadConfig_1700 config: " + JSON.stringify(config_));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_1700 pro: " + JSON.stringify(pro));
          expect().assertFail();
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config_);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_1700 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Upload_broadcastEvent_0100
     * @tc.name SUB_REQUEST_Upload_broadcastEvent_0100
     * @tc.desc monitor complete task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Upload_broadcastEvent_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Upload_broadcastEvent_0100 is starting-----------------------");
      let attachments: Array<request.agent.FormItem> = [
        {
          name: "uploadTest",
          value: {
            path: "./test.txt",
            filename: "test.txt",
            mimeType: "application/octet-stream"
          }
       },
        {
          name: "uploadTest1",
          value: 'broadcastEventUploadTest'
        }
      ];
      let config:request.agent.Config = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        title: 'createTest',
        description: 'XTS download test!',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.FOREGROUND,
        method: "POST",
        data:attachments,
      };

      let task: request.agent.Task;
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) =>{
        try {
          console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 subscriberCallback data:"
            + JSON.stringify(data));
          commonEvent.unsubscribe(subscriber, unSubscriberCallback);
          console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 data.code: " + data.code);
          expect(data.code).assertEqual(64);
          done();
        } catch (err) {
          console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 subscriberCallback error: " + JSON.stringify(err));
          done();
        }
      }
      let commonEventSubscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: [ request.agent.BroadcastEvent.COMPLETE ]
      }
      let subscriber: ESObject;
      commonEvent.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 subscriber data:" + data);
        commonEvent.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 subscriber finish");
      })

      try {
        request.agent.create(baseContext, config, async (err, t) => {
          try {
            if(err){
              console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task = t;
            await task.start();
            console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 task start");
          } catch (err) {
            console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 catch err: " + JSON.stringify(err));
          }
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Upload_broadcastEvent_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
    });

  })
}
