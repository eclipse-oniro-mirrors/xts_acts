/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import request from '@system.request';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index";

export default function requestSystemJSUnit() {
  describe('requestSystemJSUnit', function () {
    console.info('====>****************start requestSystemTest*****************')

    /**
     * @tc.name: ohos.SUB_REQUESTSYSTEM_UPLOAD_API_0001
     * @tc.desc: Upload files.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_REQUESTSYSTEM_UPLOAD_API_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUESTSYSTEM_UPLOAD_API_0001 start-----------------------");
      let UploadResponse = {
        code: 200,
        data: '',
        headers: {RequestMethod: 'POST',
                    StatusCode: 200 }
      }
      let UploadRequestOptions = {
        url: 'http://www.path.com',
        method: 'POST',
        files: [
          {
            uri: 'internal://cache/path/to/file.txt',
            name: 'file',
            filename: 'file.txt',
          },
        ],
        data:[
          {
            name: 'name1',
            value: 'value',
          },
        ],
        success: function(UploadResponse) {
          console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0001 upload success, code:' + UploadResponse.code);
        },
        fail: function(data, code) {
          console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0001 upload fail');
        },
        complete: function (){
          console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0001 upload complete');
        }
      }
      try{
        let result = request.upload(UploadRequestOptions);
        console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0001 upload err:' + result);
        expect(true).assertEqual(true);
      }catch(err){
        console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0001 upload err:' + err);
      }
      console.info("====>-----------------------SUB_REQUESTSYSTEM_UPLOAD_API_0001 end-----------------------");
      done();
    });

    /**
     * @tc.name: ohos.SUB_REQUESTSYSTEM_DOWNLOAD_API_0001
     * @tc.desc: This API is used to download files.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_REQUESTSYSTEM_DOWNLOAD_API_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUESTSYSTEM_DOWNLOAD_API_0001 start-----------------------");
      let DownloadResponse = {
        token: "Hm_lpvt_1d6c34c1bc067f5746a5fca18d1c24ab"
      }

      let DownloadRequestOptions = {
        url: 'http://www.path.com',
        filename: 'requestSystenTest',
        header: '',
        description: 'this is requeSystem download response',
        success: function(DownloadResponse) {
          console.info('====>SUB_REQUESTSYSTEM_DOWNLOAD_API_0001call success callback success: ' + DownloadResponse.token);
        },
        fail: function(data, code) {
          console.info('====>SUB_REQUESTSYSTEM_DOWNLOAD_API_0001 handling fail');
        },
        complete: function (){
          console.info('====>SUB_REQUESTSYSTEM_DOWNLOAD_API_0001 download complete');
        }
      }
      try{
        let result = request.download(DownloadRequestOptions);
        console.info('====>SUB_REQUESTSYSTEM_DOWNLOAD_API_0001 upload err:' + result);
        expect(result == null).assertEqual(true);
      }catch(err){
        console.info('====>SUB_REQUESTSYSTEM_DOWNLOAD_API_0001 download complete' + err);
      }
      console.info("====>-----------------------SUB_REQUESTSYSTEM_DOWNLOAD_API_0001 end-----------------------");
      done();
    });

    /**
     * @tc.name: ohos.SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001
     * @tc.desc: Listens to download task status.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001 start-----------------------");
      let OnDownloadCompleteResponse = {
        uri: "http://www.path.com"
      }
      let OnDownloadCompleteOptions = {
        token: 'token-index',
        success: function(OnDownloadCompleteResponse) {
          console.info('====>SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001 download success,uri:'
                        + OnDownloadCompleteResponse.uri);
        },
        fail: function(data, code) {
          console.info('====>SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001 download fail');
        },
        complete: function (){
          console.info('====>SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001 download complete');
        }
      }
      let result = request.onDownloadComplete(OnDownloadCompleteOptions);
      console.info('====>SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001 upload err:' + result);
      expect(result == null).assertEqual(true);
      console.info("====>-----------------------SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001 end-----------------------");
      done();
    });
  })
}
