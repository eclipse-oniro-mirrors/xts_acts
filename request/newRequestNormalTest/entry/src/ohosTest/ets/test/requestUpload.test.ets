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

import fileio from '@ohos.fileio';
import request from "@ohos.request";
import common from '@ohos.app.ability.common';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function requestUploadNormalJSUnit() {
  describe('requestUploadNormalJSUnit', () => {
    console.info('====>################################request upload Test start');

    let baseContext: common.Context;
    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(async (done: Function) => {
      console.info('====>beforeAll: Prerequisites are executed.');
      try {
        console.info('beforeAll====>------------text.txt file generate start----------------');
        let context: common.Context | undefined = AppStorage.get('context');
        if (context !== undefined){
          baseContext = context;
          console.info('====>beforeAll requestUploadNormalJSUnit baseContext:'+JSON.stringify(baseContext))
        } else {
          console.info('====>beforeAll requestUploadNormalJSUnit baseContext is undefined')
        }
        let pathDir: string = baseContext.cacheDir;
        let filePath = pathDir + `/test.txt`;
        let fd = fileio.openSync(filePath, 0o100 | 0o2, 0o666);
        let content = ''.padEnd(10, 'h');
        fileio.writeSync(fd, content);
        fileio.closeSync(fd);
        console.info('====>beforeAll: text.txt file generate success');
        done();
      } catch (err) {
        console.info('====>beforeAll: abilityDelegator.executeShellCommand err or text.txt file generate failed: ' + err);
        done();
      }
    });

    let RequestData: ESObject = {
      name: 'name',
      value: '123'
    }
    let File: ESObject = {
      filename: 'test',
      name: 'test',
      uri: 'internal://cache/test.txt',
      type: 'txt'
    }
    let uploadConfig: request.UploadConfig = {
      url: 'http://127.0.0.1',
      header: {
        headers: 'http'
      },
      method: 'POST',
      files: [File],
      data: [RequestData]
    };

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

    /**
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010
     * @tc.number SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010', Level.LEVEL1, async (done: Function) => {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010 is starting-----------------------");
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
        url: 'http://192.168.217.58',
        title: 'uploadTest',
        description: 'Sample code for event listening',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        method: "POST",
        data: attachments,
      };

      request.agent.create(baseContext, config, async (err, task) => {
        console.info("====>SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010 downloadTask: " + task);
        try {
          if (err) {
            console.info("====>SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010 create err: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          } else {
            expect().assertFail();
            console.info("====>SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010 create success: " + task);
            done();
          }
        } catch (error) {
          console.info("====>SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010 fail: " + JSON.stringify(error));
          done();
        }
      });
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010
     * @tc.number SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010 is starting-----------------------");
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
        url: 'http://192.168.217.58',
        title: 'uploadTest',
        description: 'Sample code for event listening',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        method: "POST",
        data: attachments,
      };

      try {
        let task = await request.agent.create(baseContext, config);
        expect().assertFail();
        console.info("====>SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010 create success: " + task);
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010 catch error: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_Request_UploadManagement_0001
     * @tc.number SUB_Misc_Request_UploadManagement_0001
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_Request_UploadManagement_0001', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Misc_Request_UploadManagement_0001 is starting-----------------------");
      try {
        await request.uploadFile(baseContext, uploadConfig);
        expect().assertFail();
        console.info("====>SUB_Misc_Request_UploadManagement_0001 uploadFile success");
        done();
      } catch (err) {
        console.info("====>SUB_Misc_Request_UploadManagement_0001 create err: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_Request_UploadManagement_Callback_0001
     * @tc.number SUB_Misc_Request_UploadManagement_Callback_0001
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_Request_UploadManagement_Callback_0001', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Misc_Request_UploadManagement_Callback_0001 is starting-----------------------");
      try {
        request.uploadFile(baseContext, uploadConfig, (err, uploadTask)=>{
          if (err) {
            console.info("====>SUB_Misc_Request_UploadManagement_Callback_0001 create err: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          } else {
            console.error("====>SUB_Misc_Request_UploadManagement_Callback_0001 create success without permission");
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.error("====>SUB_Misc_Request_UploadManagement_Callback_0001 create err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

  })
}
