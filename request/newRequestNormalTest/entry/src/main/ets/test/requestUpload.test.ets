/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestUploadNormalJSUnit() {
  describe('requestUploadNormalJSUnit', function () {
    console.info('====>################################request upload Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(async function (done) {
      console.info('====>beforeAll: Prerequisites are executed.');
      try {
        console.info('beforeAll====>------------text.txt file generate start----------------');
        let pathDir = globalThis.abilityContext.cacheDir;
        let filePath = pathDir + `/test.txt`;
        let fd = fileio.openSync(filePath, 0o100 | 0o2, 0o666);
        let content = ''.padEnd(1 * 1024 *1024, 'h');
        fileio.writeSync(fd, content);
        fileio.closeSync(fd);
        console.info('====>beforeAll: text.txt file generate success');
        done();
      } catch (err) {
        console.info('====>beforeAll: abilityDelegator.executeShellCommand err or text.txt file generate failed: ' + err);
        done();
      }
    });

    let RequestData = {
      name: 'name',
      value: '123'
    }
    let File = {
      filename: 'test',
      name: 'test',
      uri: 'internal://cache/test.txt',
      type: 'txt'
    }
    let uploadConfig = {
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
     * @tc.number SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010
     * @tc.name SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010', 0, async function (done) {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Promise_Upload_Callback_0010 is starting-----------------------");
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
        url: 'http://192.168.217.58',
        title: 'uploadTest',
        description: 'Sample code for event listening',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        method: "POST",
        data: attachments,
      };

      request.agent.create(globalThis.abilityContext, config, async (err, task) => {
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
     * @tc.number SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010
     * @tc.name SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010', 0, async function (done) {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010 is starting-----------------------");
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
        url: 'http://192.168.217.58',
        title: 'uploadTest',
        description: 'Sample code for event listening',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        method: "POST",
        data: attachments,
      };

      try {
        var task = await request.agent.create(globalThis.abilityContext, config);
        expect().assertFail();
        console.info("====>SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010 create success: " + task);
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Promise_Upload_Promise_0010 catch error: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_Request_UploadManagement_0001
     * @tc.name SUB_Misc_Request_UploadManagement_0001
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_UploadManagement_0001', 0, async (done: Function) => {
      console.info("-----------------------SUB_Misc_Request_UploadManagement_0001 is starting-----------------------");
      try {
        await request.uploadFile(globalThis.abilityContext, uploadConfig);
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
     * @tc.number SUB_Misc_Request_UploadManagement_Callback_0001
     * @tc.name SUB_Misc_Request_UploadManagement_Callback_0001
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_UploadManagement_Callback_0001', 0, async (done: Function) => {
      console.info("-----------------------SUB_Misc_Request_UploadManagement_Callback_0001 is starting-----------------------");
      try {
        request.uploadFile(globalThis.abilityContext, uploadConfig, (err, uploadTask)=>{
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
