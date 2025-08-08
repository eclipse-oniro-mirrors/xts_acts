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

import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
import request from '@ohos.request';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import fs from  '@ohos.file.fs';
import Server from '../common/Server'

export default function requestUploadConfigTest() {
  describe('requestUploadConfigTest', () => {
    let baseContext: common.Context;
    let uploadConfig:request.agent.Config = {
      action: request.agent.Action.UPLOAD,
      url: 'http://127.0.0.1:8080',
      network: request.agent.Network.WIFI,
      overwrite: true,
      method: 'POST',
      mode:request.agent.Mode.FOREGROUND
    };

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(async (done: Function) => {
      try {
        let context: common.Context | undefined = AppStorage.get('context');
        if (context !== undefined){
          baseContext = context;
          console.info('====>beforeAll baseContext:'+JSON.stringify(baseContext))
        } else {
          console.info('====>beforeAll baseContext is undefined')
        }
        console.info('====>beforeAll: startServer');
        new Server().startServer();
        console.info('====>beforeAll: startServer success!');

        let filesPath: Array<string> = [
          baseContext.cacheDir + '/test/MultiLevel.txt',
          baseContext.cacheDir + '/cacheNormal.txt',
          baseContext.cacheDir + '/Include spaces.txt',
          baseContext.filesDir + '/filesNormal.txt',
          baseContext.tempDir + '/tempNormal.txt',
          'data/storage/el1/base/el1BaseNormal.txt',
          'data/storage/el5/base/el5BaseNormal.txt'
        ]
        let index = 0
        let t = setInterval(()=>{
          let filePath = filesPath[index];
          let segments = filePath.split('/');
          let fileName = segments.pop();
          let fileDir = segments.join('/') + '/'
          try{
            let file = fs.statSync(fileDir);
          }catch(err){
            if(err.code === 13900002){
              console.info('====>beforeAll mkdir filePath:' + JSON.stringify(fileDir))
              fs.mkdirSync(fileDir,true)
            }
          }
          let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let content = ''.padEnd(1 * 1024, '1'.toString());
          fs.writeSync(file.fd, content);
          fs.closeSync(file);
          index++;
          if(index === filesPath.length){
            clearInterval(t);
            done();
          }
        }, 500)
      } catch (err) {
        console.info('====>beforeAll catch err:'+JSON.stringify(err))
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_0100
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_0100
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_0100 is starting-----------------------");
      let config:request.agent.Config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: './Include spaces.txt',
          filename: 'Include spaces.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_0100 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_0100 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_0200
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_0200
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_0200 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: './test/MultiLevel.txt',
          filename: 'MultiLevel.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_0200 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_0200 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_0200 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_0300
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_0300
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_0300', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_0300 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: './cacheNormal.txt',
          filename: 'cacheNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_0300 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_0300 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_0300 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_0400
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_0400
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_0400', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_0400 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: 'cacheNormal.txt',
          filename: 'cacheNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_0400 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_0400 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_0400 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_0500
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_0500
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_0500', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0100 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: 'test/MultiLevel.txt',
          filename: 'MultiLevel.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_0500 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_0500 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_0500 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_0600
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_0600
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_0600', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_0600 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: 'internal://cache/cacheNormal.txt',
          filename: 'cacheNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_0600 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_0600 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_0600 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_0700
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_0700
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_0700', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_0700 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: 'internal://files/filesNormal.txt',
          filename: 'filesNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_0700 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_0700 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_0700 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_0800
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_0800
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_0800', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_0800 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: 'internal://temp/tempNormal.txt',
          filename: 'tempNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_0800 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_0800 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_0800 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_0900
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_0900
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_0900', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_0900 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: '/data/storage/el1/base/el1BaseNormal.txt',
          filename: 'el1BaseNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_0900 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_0900 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_0900 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_1000
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_1000
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_1000', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_1000 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: '/dtat/storage/../../data/storage/el2/../el1/base/el1BaseNormal.txt',
          filename: 'el1BaseNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_1000 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_1000 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_1000 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_1100
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_1100
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_1100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_1100 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: 'file://com.acts.newRequestAuthority.test/data/storage/el1/base/el1BaseNormal.txt',
          filename: 'el1BaseNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_1100 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_1100 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_1100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_1200
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_1200
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_1200', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_1200 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: '/cacheNormal.txt',
          filename: 'cacheNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_1200 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_1200 pro: " + JSON.stringify(pro));
          expect().assertFail();
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_1200 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_1300
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_1300
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_1300', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0100 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: '/test/MultiLevel.txt',
          filename: 'MultiLevel.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_1300 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_1300 pro: " + JSON.stringify(pro));
          expect().assertFail();
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_1300 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_1400
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_1400
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_1400', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_1400 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: '/data/test 5.jpeg',
          filename: 'test 5.jpeg'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_1400 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_1400 pro: " + JSON.stringify(pro));
          expect().assertFail();
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_1400 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_1500
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_1500
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_1500', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_1500 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: '/data/storage/../../el2/base/test_0.txt',
          filename: 'test_0.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_1500 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_1500 pro: " + JSON.stringify(pro));
          expect().assertFail();
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_1500 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_1600
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_1600
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_1600', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_1600 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: 'file://com.ohos.inputmethodchoosedialog/data/storage/el1/base/el1BaseNormal.txt',
          filename: 'el1BaseNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_1600 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_1600 pro: " + JSON.stringify(pro));
          expect().assertFail();
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_1600 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_1800
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_1800
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_1800', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_1800 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: './',
          filename: 'cacheNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_1800 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_1800 pro: " + JSON.stringify(pro));
          expect().assertFail();
          done();
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_1800 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_UploadConfig_1900
     * @tc.name: SUB_REQUEST_Agent_UploadConfig_1900
     * @tc.desc: different upload path or upload file name of config
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_UploadConfig_1900', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_UploadConfig_1900 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: '/data/storage/el5/base/el5BaseNormal.txt',
          filename: 'el5BaseNormal.txt'
        }
      }]
      console.info("====>SUB_REQUEST_Agent_UploadConfig_1900 config: " + JSON.stringify(config));
      try {
        let on_completedCallback =(pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          console.info("====>SUB_REQUEST_Agent_UploadConfig_1900 pro: " + JSON.stringify(pro));
          expect(pro.state).assertEqual(64);
          done();
        }
        console.info("====>SUB_REQUEST_Agent_UploadConfig_1900 baseContext: " + JSON.stringify(baseContext));
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('completed', on_completedCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_UploadConfig_1900 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_contentType_0100
     * @tc.name: SUB_REQUEST_Agent_contentType_0100
     * @tc.desc: contentType is test name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_contentType_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_contentType_0100 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'uploadTest',
        value: {
          path: './test/MultiLevel.txt',
          filename: 'MultiLevel.txt',
          mimeType: 'application/octet-stream',
          contentType: "SUB_REQUEST_Agent_contentType_0100"
        }
      }]
      console.info("====>SUB_REQUEST_Agent_contentType_0100 config: " + JSON.stringify(config));
      try {
        let on_responseCallback = async (pro: request.agent.HttpResponse) => {
          task.off('response', on_responseCallback);
          try {
            let arr:Array<string> = [];
            for( let v of pro['headers'].values()){
              console.info("====>SUB_REQUEST_Agent_contentType_0100 headers value is: " + v[0]);
              arr.push(v[0]);
            }
            console.info("====>SUB_REQUEST_Agent_contentType_0100 arr: " + JSON.stringify(arr));
            expect(arr.includes('contentTypeTest0100')).assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_REQUEST_Agent_contentType_0100 response err: " + JSON.stringify(err));
            done();
          }
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('response', on_responseCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_contentType_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_REQUEST_Agent_contentType_0200
     * @tc.name: SUB_REQUEST_Agent_contentType_0200
     * @tc.desc: contentType is default.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_REQUEST_Agent_contentType_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Agent_contentType_0200 is starting-----------------------");
      let config = uploadConfig;
      config.data = [{
        name: 'SUB_REQUEST_Agent_contentType_0200',
        value: {
          path: './test/MultiLevel.txt',
          filename: 'MultiLevel.txt',
          mimeType: 'application/octet-stream',
        }
      }]
      console.info("====>SUB_REQUEST_Agent_contentType_0200 config: " + JSON.stringify(config));
      try {
        let on_responseCallback = async (pro: request.agent.HttpResponse) => {
          task.off('response', on_responseCallback);
          try {
            let arr:Array<string> = [];
            for( let v of pro['headers'].values()){
              console.info("====>SUB_REQUEST_Agent_contentType_0200 headers value is: " + v[0]);
              arr.push(v[0]);
            }
            console.info("====>SUB_REQUEST_Agent_contentType_0200 arr: " + JSON.stringify(arr));
            expect(arr.includes('contentTypeTest0200')).assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_REQUEST_Agent_contentType_0200 response err: " + JSON.stringify(err));
            done();
          }
        }

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('response', on_responseCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_REQUEST_Agent_contentType_0200 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

  });
};