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
import featureAbility from '@ohos.ability.featureAbility'
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function requestDownloadNormalJSUnit() {
  describe('requestDownloadNormalJSUnit', () => {
    console.info('====>################################request download Test start');

    let baseContext: common.Context;
    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(() => {
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
    beforeEach(async (done: Function) => {
      console.info('====>beforeEach: Prerequisites is executed.');
      await setDownLoadConfig();
      done();
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(() => {
      console.info('====>afterAll: Test suite-level cleanup condition is executed');
    });

    let downloadConfig: request.DownloadConfig;
    let setDownLoadConfig = async () => {
      let downloadFilePath = await featureAbility.getContext().getFilesDir();
      downloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: `${downloadFilePath}/`,
        title: 'XTS download test!',
        background: false
      }
    }

    /**
     * @tc.name   SUB_Misc_Request_DownloadManagement_0002
     * @tc.number SUB_Misc_Request_DownloadManagement_0002
     * @tc.desc   Get mimetype of the download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_Request_DownloadManagement_0002', Level.LEVEL0, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_DownloadManagement_0002 is starting---------------------");
      downloadConfig.filePath += 'SUB_Misc_Request_DownloadManagement_0002.txt';
      let flag = false;
      let filePath: string | undefined = downloadConfig.filePath;
      try {
        await request.download(downloadConfig);
        expect().assertFail();
        console.info("====>SUB_Misc_Request_DownloadManagement_0002 downloadFile success");
        done();
      } catch (err) {
        console.info("====>SUB_Misc_Request_DownloadManagement_0002 error: " + JSON.stringify(err));
        console.info("====>SUB_Misc_Request_DownloadManagement_0002 error: " + err);
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_Request_DownloadManagement_Callback_0002
     * @tc.number SUB_Misc_Request_DownloadManagement_Callback_0002
     * @tc.desc   Get mimetype of the download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_Request_DownloadManagement_Callback_0002', Level.LEVEL2, async (done: Function) => {
      console.info("====>---------------------SUB_Misc_Request_DownloadManagement_Callback_0002 is starting---------------------");
      downloadConfig.filePath += 'SUB_Misc_Request_DownloadManagement_Callback_0002.txt';
      let flag = false;
      let filePath: string | undefined = downloadConfig.filePath;
      request.download(downloadConfig, (err, downloadTask) => {
        try {
          if (err) {
            console.info("====>SUB_Misc_Request_DownloadManagement_Callback_0002 create err: " + JSON.stringify(err));
            console.info("====>SUB_Misc_Request_DownloadManagement_Callback_0002 create err: " + err);
            expect(err.code).assertEqual(201);
            done();
          } else {
            console.error("====>SUB_Misc_Request_DownloadManagement_Callback_0002 create success without permission");
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.error("====>SUB_Misc_Request_DownloadManagement_Callback_0002 create err: " + JSON.stringify(err));
          done();
        }
      });
    });

  });
}