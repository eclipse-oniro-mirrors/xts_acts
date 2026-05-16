/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import fs from '@ohos.file.fs'
import request from "@ohos.request";
import commonEvent from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { WifiConnectStatus } from '../common/WifiConnectStatus';

export default function requestSupplementalUploadTest() {
  describe('requestSupplementalUploadJSTest', () => {
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
        let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let content = ''.padEnd(1 * 1024, 'Hello world');
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
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
    beforeEach(async (done: Function) => {
      console.info('====>beforeEach WifiConnectStatus start');
      await WifiConnectStatus();
      console.info('====>beforeEach WifiConnectStatus wend');
      done();
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

    let File: request.File = {
      filename: 'test',
      name: 'test',
      uri: 'internal://cache/test.txt',
      type: 'txt'
    }

    let uploadConfig: request.UploadConfig = {
      url: 'http://127.0.0.1:8080',
      header: {
        'Accept': '*/*',
      },
      method: 'POST',
      files: [File],
      data: [{
        name: 'name',
        value: '123'
      }]
    };

    /**
     * @tc.name   SUB_Request_upload_Supplemental_0100
     * @tc.number SUB_Request_upload_Supplemental_0100
     * @tc.desc   uploadFile param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_0100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_0100 is starting-----------------------");
      try{
        request.uploadFile(undefined, undefined, async (err, uploadTask)=>{
          try{
            console.info("====>SUB_Request_upload_Supplemental_0100 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_upload_Supplemental_0100 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_0100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_0200
     * @tc.number SUB_Request_upload_Supplemental_0200
     * @tc.desc   callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_0200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_0200 is starting-----------------------");
      try{
        request.uploadFile(null, null, async (err, uploadTask)=>{
          try{
            console.info("====>SUB_Request_upload_Supplemental_0200 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_upload_Supplemental_0200 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_0200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_0300
     * @tc.number SUB_Request_upload_Supplemental_0300
     * @tc.desc   promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_0300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_0300 is starting-----------------------");
      try{
        await request.uploadFile(undefined, undefined);
        console.info("====>SUB_Request_upload_Supplemental_0300 uploadFile success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_0300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_0400
     * @tc.number SUB_Request_upload_Supplemental_0400
     * @tc.desc   promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_0400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_0400 is starting-----------------------");
      try{
        await request.uploadFile(null, null);
        console.info("====>SUB_Request_upload_Supplemental_0400 uploadFile success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_0400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_0500
     * @tc.number SUB_Request_upload_Supplemental_0500
     * @tc.desc   callback files data is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_0500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_0500 is starting-----------------------");
      let uploadConfig: request.UploadConfig = {
        url: 'http://127.0.0.1:8080',
        header: {
          'Accept': '*/*',
        },
        method: 'POST',
        files: [],
        data: []
      };
      try{
        request.uploadFile(baseContext, uploadConfig, async (err, uploadTask)=>{
          try{
            console.info("====>SUB_Request_upload_Supplemental_0500 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_upload_Supplemental_0500 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_0500 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_0600
     * @tc.number SUB_Request_upload_Supplemental_0600
     * @tc.desc   promise files data is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_0600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_0600 is starting-----------------------");
      let uploadConfig: request.UploadConfig = {
        url: 'http://127.0.0.1:8080',
        header: {
          'Accept': '*/*',
        },
        method: 'POST',
        files: [],
        data: []
      };
      try{
        await request.uploadFile(baseContext, uploadConfig,);
        console.info("====>SUB_Request_upload_Supplemental_0600 uploadFile success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_0600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_0700
     * @tc.number SUB_Request_upload_Supplemental_0700
     * @tc.desc   downloadFile on param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_0700', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_0700 is starting-----------------------");
      try{
        let uploadTask: request.UploadTask = await request.uploadFile(baseContext, uploadConfig);
        uploadTask.on(undefined, () => {});
        console.info("====>SUB_Request_upload_Supplemental_0700 on success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_0700 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_0800
     * @tc.number SUB_Request_upload_Supplemental_0800
     * @tc.desc   uploadTask on param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_0800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_0800 is starting-----------------------");
      try{
        let uploadTask: request.UploadTask = await request.uploadFile(baseContext, uploadConfig);
        uploadTask.on(null, () => {});
        console.info("====>SUB_Request_upload_Supplemental_0800 on success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_0800 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_0900
     * @tc.number SUB_Request_upload_Supplemental_0900
     * @tc.desc   uploadTask off param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_0900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_0900 is starting-----------------------");
      try{
        let uploadTask: request.UploadTask = await request.uploadFile(baseContext, uploadConfig);
        uploadTask.off(undefined);
        console.info("====>SUB_Request_upload_Supplemental_0900 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_0900 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_1000
     * @tc.number SUB_Request_upload_Supplemental_1000
     * @tc.desc   uploadTask off param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_1000', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_1000 is starting-----------------------");
      try{
        let uploadTask: request.UploadTask = await request.uploadFile(baseContext, uploadConfig);
        uploadTask.off(null);
        console.info("====>SUB_Request_upload_Supplemental_1000 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_1000 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_1100
     * @tc.number SUB_Request_upload_Supplemental_1100
     * @tc.desc   uploadTask off param is undefined and callback is not empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_1100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_1100 is starting-----------------------");
      try{
        let uploadTask: request.UploadTask = await request.uploadFile(baseContext, uploadConfig);
        uploadTask.off(undefined, () => {});
        console.info("====>SUB_Request_upload_Supplemental_1100 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_1100 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_1200
     * @tc.number SUB_Request_upload_Supplemental_1200
     * @tc.desc   uploadTask off param is null and callback is not empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_upload_Supplemental_1200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_upload_Supplemental_1200 is starting-----------------------");
      try{
        let uploadTask: request.UploadTask = await request.uploadFile(baseContext, uploadConfig);
        uploadTask.off(null, () => {});
        console.info("====>SUB_Request_upload_Supplemental_1200 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_upload_Supplemental_1200 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_1300
     * @tc.number SUB_Request_upload_Supplemental_1300
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_upload_Supplemental_1300', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_upload_Supplemental_1300 is starting-----------------------");
      let attachments: Array<request.agent.FormItem> = [{
        name: "uploadTest",
        value: {
          path: "./test.txt",
          filename: "test.txt",
          mimeType: "application/octet-stream",
          contentType: ""
        }
      }];

      let config: request.agent.Config = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        network: request.agent.Network.ANY,
        method: "POST",
        data: attachments,
        redirect: false,
        multipart: true
      };

      try {
        request.agent.create(baseContext, config, async (err, task) => {
          let on_offCompletedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_offCompletedCallback);
              console.info("====>SUB_Request_upload_Supplemental_1300 pro.state: " + pro.state);
              expect(pro.state === 64).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_upload_Supplemental_1300 create err: " + JSON.stringify(err));
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_upload_Supplemental_1300 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_offCompletedCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Request_upload_Supplemental_1300 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_upload_Supplemental_1300 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_1400
     * @tc.number SUB_Request_upload_Supplemental_1400
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_upload_Supplemental_1400', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_upload_Supplemental_1400 is starting-----------------------");
      let attachments: Array<request.agent.FormItem> = [{
        name: "uploadTest",
        value: {
          path: "./test.txt",
          filename: "test.txt",
          mimeType: "",
        }
      }];
      let notification: request.agent.Notification = {
        text: '',
        title: ''
      }

      let config: request.agent.Config = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        network: request.agent.Network.ANY,
        method: "POST",
        data: attachments,
        notification: notification,
        multipart: false
      };

      try {
        request.agent.create(baseContext, config, async (err, task) => {
          let on_offCompletedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_offCompletedCallback);
              console.info("====>SUB_Request_upload_Supplemental_1400 pro.state: " + pro.state);
              expect(pro.state === 64).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_upload_Supplemental_1400 create err: " + JSON.stringify(err));
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_upload_Supplemental_1400 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_offCompletedCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Request_upload_Supplemental_1400 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_upload_Supplemental_1400 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_1500
     * @tc.number SUB_Request_upload_Supplemental_1500
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_upload_Supplemental_1500', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_upload_Supplemental_1500 is starting-----------------------");
      let attachments: Array<request.agent.FormItem> = [{
        name: "uploadTest",
        value: {
          path: "./test.txt",
          filename: "test.txt",
          contentType: ''
        }
      }];

      let config: request.agent.Config = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        network: request.agent.Network.ANY,
        method: "POST",
        data: attachments,
        redirect: false,
      };

      try {
        let task = await request.agent.create(baseContext, config);
        let on_offCompletedCallback = (pro: request.agent.Progress) => {
          try {
            task.off('completed', on_offCompletedCallback);
            console.info("====>SUB_Request_upload_Supplemental_1500 pro.state: " + pro.state);
            expect(pro.state === 64).assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_Request_upload_Supplemental_1500 create err: " + JSON.stringify(err));
          }
        }
        task.on('completed', on_offCompletedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_Request_upload_Supplemental_1500 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_upload_Supplemental_1600
     * @tc.number SUB_Request_upload_Supplemental_1600
     * @tc.desc   Starts a upload session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_upload_Supplemental_1600', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_upload_Supplemental_1600 is starting-----------------------");
      let attachments: Array<request.agent.FormItem> = [{
        name: "",
        value:''
      }];

      let config: request.agent.Config = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        network: request.agent.Network.ANY,
        method: "POST",
        data: attachments,
        redirect: false,
      };

      try {
        await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_upload_Supplemental_1600 create success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_upload_Supplemental_1600 create catch err: " + JSON.stringify(err.code));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

  })
}
