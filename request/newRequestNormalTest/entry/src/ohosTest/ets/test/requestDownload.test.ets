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
import fileio from '@ohos.fileio';
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function requestDownloadNormalJSUnit() {
  describe('requestDownloadNormalJSUnit', () => {
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
          console.info('====>beforeAll requestDownloadNormalJSUnit baseContext:'+JSON.stringify(baseContext))
          done();
        } else {
          console.info('====>beforeAll requestDownloadNormalJSUnit baseContext is undefined')
          done();
        }
      } catch (err) {
        console.info('====>beforeAll requestDownloadNormalJSUnit catch err:'+JSON.stringify(err))
        done();
      }
    });

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
     * @tc.number SUB_Misc_Request_DownloadManagement_0001
     * @tc.name SUB_Misc_Request_DownloadManagement_0001
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_DownloadManagement_0001', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_DownloadManagement_0001 is starting---------------------");
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: "downloadFilePath",
        title: 'XTS download test!',
      }
      try {
        await request.downloadFile(baseContext, downloadFileConfig);
        expect().assertFail();
        console.info("====>SUB_Misc_Request_DownloadManagement_0001 downloadFile success");
        done();
      } catch (err) {
        console.info("====>SUB_Misc_Request_DownloadManagement_0001 error: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_Request_DownloadManagement_Callback_0001
     * @tc.name SUB_Misc_Request_DownloadManagement_Callback_0001
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_Request_DownloadManagement_Callback_0001', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_DownloadManagement_Callback_0001 is starting---------------------");
      try {
        let downloadConfig: request.DownloadConfig = {
          url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
          header: {
            headers: 'http'
          },
          enableMetered: false,
          enableRoaming: false,
          description: 'XTS download test!',
          filePath: "SUB_Misc_Request_DownloadManagement_Callback_0001",
          title: 'XTS download test!',
        }
        request.downloadFile(baseContext, downloadConfig, (err, downloadTask) => {
          if (err) {
            console.info("====>SUB_Misc_Request_DownloadManagement_Callback_0001 create err: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          }else {
            console.error("====>SUB_Misc_Request_DownloadManagement_Callback_0001 create success without permission");
            expect().assertFail();
            done();
          }

        });
      } catch (err) {
        console.error("====>SUB_Misc_Request_DownloadManagement_Callback_0001 create err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Create_Promise_Download_Callback_0010
     * @tc.name SUB_Misc_REQUEST_Create_Promise_Download_Callback_0010
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_Misc_REQUEST_Create_Promise_Download_Callback_0010', Level.LEVEL1, async (done: Function) => {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Promise_Download_Callback_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Create_Promise_Download_Callback_0010.txt',
        mode: request.agent.Mode.BACKGROUND
      };

      request.agent.create(baseContext, config, async (err, task) => {
        console.info("====>SUB_Misc_REQUEST_Create_Promise_Download_Callback_0010 downloadTask: " + task);
        try {
          if (err) {
            console.info("====>SUB_Misc_REQUEST_Create_Promise_Download_Callback_0010 create err: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          } else {
            expect().assertFail();
            console.info("====>SUB_Misc_REQUEST_Create_Promise_Download_Callback_0010 create success: " + task);
            done();
          }
        } catch (error) {
          console.info("====>SUB_Misc_REQUEST_Create_Promise_Download_Callback_0010 fail: " + JSON.stringify(error));
          done();
        }
      });
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Create_Promise_Download_Promise_0010
     * @tc.name SUB_Misc_REQUEST_Create_Promise_Download_Promise_0010
     * @tc.desc Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_Misc_REQUEST_Create_Promise_Download_Promise_0010', Level.LEVEL0, async (done: Function) => {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Promise_Download_Promise_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Create_Promise_Download_Promise_0010.txt',
        mode: request.agent.Mode.BACKGROUND
      };

      try {
        let task = await request.agent.create(baseContext, config);
        expect().assertFail();
        console.info("====>SUB_Misc_REQUEST_Create_Promise_Download_Promise_0010 create success: " + task);
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Promise_Download_Promise_0010 catch error: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

  });
}