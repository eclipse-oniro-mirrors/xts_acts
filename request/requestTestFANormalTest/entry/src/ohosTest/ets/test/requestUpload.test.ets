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
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function requestUploadNormalJSUnit() {
  describe('requestUploadNormalJSUnit', () => {
    console.info('====>################################request upload Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(async (done: Function) => {
      console.info('====>beforeAll: Prerequisites are executed.');
      try {
        let pathDir: string = await featureAbility.getContext().getCacheDir();;
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
      filename: 'test.txt',
      name: 'test.txt',
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
     * @tc.name   SUB_Misc_Request_UploadManagement_0002
     * @tc.number SUB_Misc_Request_UploadManagement_0002
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_Request_UploadManagement_0002', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Misc_Request_UploadManagement_0002 is starting-----------------------");
      try {
        await request.upload(uploadConfig);
        expect().assertFail();
        console.info("====>SUB_Misc_Request_UploadManagement_0002 uploadFile success");
        done();
      } catch (err) {
        console.info("====>SUB_Misc_Request_UploadManagement_0002 create err: " + JSON.stringify(err));
        console.info("====>SUB_Misc_Request_UploadManagement_0002 create err: " + err);
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_Request_UploadManagement_Callback_0002
     * @tc.number SUB_Misc_Request_UploadManagement_Callback_0002
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_Request_UploadManagement_Callback_0002', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Misc_Request_UploadManagement_Callback_0002 is starting-----------------------");
      request.upload(uploadConfig, (err, uploadTask)=>{
        try {
          if (err) {
            console.info("====>SUB_Misc_Request_UploadManagement_Callback_0002 create err: " + JSON.stringify(err));
            console.info("====>SUB_Misc_Request_UploadManagement_Callback_0002 create err: " + err);
            expect(err.code).assertEqual(201);
            done();
          } else {
            console.error("====>SUB_Misc_Request_UploadManagement_Callback_0002 create success without permission");
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.error("====>SUB_Misc_Request_UploadManagement_Callback_0002 create err: " + JSON.stringify(err));
          done();
        }
      })
    });

  })
}
