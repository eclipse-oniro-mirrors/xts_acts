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
import commonEvent from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

export default function requestSpecialUnitTest() {
  describe('requestSpecialJSTest', () => {
    console.info('====>################################request download Test start');
    let baseContext: common.Context;

    let removeTasks = async () =>{
      console.info("====>removeTasks start");
      let filter: request.agent.Filter = {
        state: request.agent.State.REMOVED,
      };
      let tasksId1:Array<string>  = await request.agent.search();
      console.info("====>removeTasks tasksId1.length: " + tasksId1.length);
      let tasksId2:Array<string>  = await request.agent.search(filter);
      console.info("====>removeTasks tasksId2.length: " + tasksId2.length);
      let tasksId =  tasksId1.filter(item => !tasksId2.includes(item));
      console.info("====>removeTasks tasksId.length: " + tasksId.length);
      for (let i = 0; i < tasksId.length; i++){
        try {
          await request.agent.remove(tasksId[i]);
          console.info("====>removeTasks times: " + i);
        }catch (err) {
          console.info("====>removeTasks err times: " + i);
          console.info("====>removeTasks err: " + JSON.stringify(err));
        }
      }
    }
    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll((done: Function) => {
      try {
        let context: common.Context | undefined = AppStorage.get('context');
        if (context !== undefined){
          baseContext = context;
          console.info('====>beforeAll requestDownloadTwoJSUnit baseContext:'+JSON.stringify(baseContext))
          done();
        } else {
          console.info('====>beforeAll requestDownloadTwoJSUnit baseContext is undefined')
          done();
        }
      } catch (err) {
        console.info('====>beforeAll requestDownloadTwoJSUnit catch err:'+JSON.stringify(err))
        done();
      }
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(async (done: Function) => {
      console.info('====>beforeEach removeTasks start');
      await removeTasks();
      console.info('====>beforeEach removeTasks end');
      done();
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(async (done: Function) => {
      console.info('====>afterEach removeTasks start');
      await removeTasks();
      console.info('====>afterEach removeTasks end');
      done();
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(async (done: Function) => {
      console.info('====>afterAll removeTasks start');
      await removeTasks();
      done();
    });

    /**
     * @tc.number SUB_REQUEST_Download_broadcastEvent_0200
     * @tc.name SUB_REQUEST_Download_broadcastEvent_0200
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Download_broadcastEvent_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Download_broadcastEvent_0200 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://xxxxxxxx/test.apk',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        saveas: './SUB_REQUEST_Download_broadcastEvent_0200.txt',
        network: request.agent.Network.ANY,
      };

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        try {
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 subscriberCallback data:"
            + JSON.stringify(data));
          commonEvent.unsubscribe(subscriber, unSubscriberCallback);
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 data.code: " + data.code);
          expect(data.code).assertEqual(65);
          done();
        } catch (err) {
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 subscriberCallback error: " + JSON.stringify(err));
          done();
        }
      }
      let commonEventSubscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: [ request.agent.BroadcastEvent.COMPLETE ]
      }
      let subscriber: ESObject;
      commonEvent.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 subscriber data:" + data);
        commonEvent.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 subscriber finish");
      })

      try {
        request.agent.create(baseContext, config, async (err, task) => {
          try {
            if(err){
              console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            await task.start();
            console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 task start");
          } catch (err) {
            console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 catch err: " + JSON.stringify(err));
          }
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 create catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_ErrorDetailed_0500
     * @tc.name: SUB_Request_Agent_ErrorDetailed_0500
     * @tc.desc: incorrect error of DNS
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_ErrorDetailed_0500', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_Request_Agent_ErrorDetailed_0500 is starting-----------------------');
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://singnn.com',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ErrorDetailed_0500',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('failed', async (pro: request.agent.Progress) => {
          try {
            task.off('failed');
            console.info('====>SUB_Request_Agent_ErrorDetailed_0500 failed pro: ' + JSON.stringify(pro));
            let info:request.agent.TaskInfo = await request.agent.show(task.tid);
            console.info('====>SUB_Request_Agent_ErrorDetailed_0500 info: ' + JSON.stringify(info));
            expect(info.faults).assertEqual(80);
            done();
          } catch (err) {
            console.info('====>SUB_Request_Agent_ErrorDetailed_0500 err: ' + JSON.stringify(err));
          }
        })
        await task.start();
        console.info('====>SUB_Request_Agent_ErrorDetailed_0500 create success');
      } catch (err) {
        console.info('====>SUB_Request_Agent_ErrorDetailed_0500 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number Download_Test_0300
     * @tc.desc Called when the current download session fails.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Download_Test_0300', Level.LEVEL0, async (done: Function) => {
      console.info("====>---------------------Download_Test_0300 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/Download_Test_0300.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/Download_Test_0300.txt`);
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
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
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

    /*
     * @tc.number: SUB_Request_Agent_CreateTaskErrorCode_Callback_0100
     * @tc.name: SUB_Request_Agent_CreateTaskErrorCode_Callback_0100
     * @tc.desc: create full tasks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_CreateTaskErrorCode_Callback_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0400 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'SUB_Request_Agent_CreateTaskErrorCode_Callback_0100',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.BACKGROUND
      };
      try {
        for (let i = 0; i < 1002; i++){
          request.agent.create(baseContext, config, async (err:BusinessError ,task: request.agent.Task) =>{
            try {
              if(err){
                console.info("====>SUB_Request_Agent_CreateTaskErrorCode_Callback_0100 create err: " + JSON.stringify(err));
                expect(err.code).assertEqual(21900004);
                done();
              } else {
                console.info("====>SUB_Request_Agent_CreateTaskErrorCode_Callback_0100 create times: " + i);
              }
            }catch (err) {
              console.info("====>SUB_Request_Agent_CreateTaskErrorCode_Callback_0100 create catch err: " + JSON.stringify(err));
              done();
            }
          });
        }
      } catch (err) {
        console.info("====>SUB_Request_Agent_CreateTaskErrorCode_Callback_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_CreateTaskErrorCode_promise_0100
     * @tc.name: SUB_Request_Agent_CreateTaskErrorCode_promise_0100
     * @tc.desc: create full tasks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_CreateTaskErrorCode_promise_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0400 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'SUB_Request_Agent_CreateTaskErrorCode_promise_0100',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.BACKGROUND
      };
      try {
        for (let i = 0; i < 1002; i++){
          console.info("====>SUB_Request_Agent_CreateTaskErrorCode_promise_0100 create times: " + i);
          await request.agent.create(baseContext, config);
        }
        console.info("====>SUB_Request_Agent_CreateTaskErrorCode_promise_0100 create over");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_CreateTaskErrorCode_promise_0100 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900004);
        done();
      }
    });

  });
}
