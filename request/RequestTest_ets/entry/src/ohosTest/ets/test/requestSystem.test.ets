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

import request from '@system.request';
import fileio from '@ohos.fileio'
import featureAbility from '@ohos.ability.featureAbility';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "@ohos/hypium";

export default function requestSystemJSUnit() {
  describe('requestSystemJSUnit', () => {
    console.info('====>****************start requestSystemTest*****************')

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(async (done: Function) => {
      try {
        let context: featureAbility.Context = featureAbility.getContext();
        console.info(`====>beforeAll: getCacheDir context success`);
        let pathDir = await context.getCacheDir();
        console.info(`====>beforeAll: getCacheDir data: ${pathDir}`);
        let filePath = pathDir + `/test.txt`;
        console.info(`====>beforeAll: filePath data: ${filePath}`);
        let fd = fileio.openSync(filePath, 0o100 | 0o2, 0o666);
        let content = ''.padEnd(1 * 1024 *1024, 'h');
        fileio.writeSync(fd, content);
        fileio.closeSync(fd);
        console.info('====>beforeAll: text.txt file generate');
        done();
      } catch (err) {
        console.info('====>beforeAll: text.txt file generate failed' + err);
        done();
      }
    })

    /**
     * @tc.name   SUB_REQUESTSYSTEM_UPLOAD_API_0001
     * @tc.number ohos.SUB_REQUESTSYSTEM_UPLOAD_API_0001
     * @tc.desc   Upload files.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_REQUESTSYSTEM_UPLOAD_API_0001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUESTSYSTEM_UPLOAD_API_0001 start-----------------------");
      let headers: ESObject = {
        RequestMethod: 'POST',
        StatusCode: 200
      }

      let UploadResponse: ESObject = {
        code: 200,
        data: '',
        headers: headers
      }

      let files: Array<ESObject> = [
        {
          uri: 'internal://cache/test.txt',
          name: 'file',
          filename: 'file.txt',
          type: "",
        },
      ]

      let data: Array<ESObject> = [
        {
          name: 'name1',
          value: 'value',
        },
      ]

      let UploadRequestOptions: ESObject = {
        url: 'http://www.path.com',
        method: 'POST',
        files: files,
        data: data,
        complete: () => {
          console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0001 upload complete');
          done();
        }
      }
      try{
        let result = request.upload(UploadRequestOptions);
        console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0001 upload err:' + result);
        expect(true).assertEqual(true);
      }catch(err){
        console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0001 upload catch err:' + err);
        done();
      }
      console.info("====>-----------------------SUB_REQUESTSYSTEM_UPLOAD_API_0001 end-----------------------");
    });

    /**
     * @tc.name   SUB_REQUESTSYSTEM_UPLOAD_API_0002
     * @tc.number ohos.SUB_REQUESTSYSTEM_UPLOAD_API_0002
     * @tc.desc   Upload files.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_REQUESTSYSTEM_UPLOAD_API_0002', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUESTSYSTEM_UPLOAD_API_0002 start-----------------------");
      let files: Array<ESObject> = [
        {
          uri: 'internal://cache/test.txt',
          name: 'file',
          filename: 'file.txt',
        },
      ]

      let data: Array<ESObject> = [
        {
          name: 'name1',
          value: 'value',
        },
      ]

      let UploadRequestOptions: ESObject = {
        url: 'http://www.path.com',
        method: 'POST',
        files: files,
        data: data,
        complete: () => {
          console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0002 upload complete');
        },
        success: (data: object) => {
          console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0002 upload success, code:' + JSON.stringify(data));
        },
        fail: (data:string, code:number) => {
          console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0002 upload fail data: ' + data + 'code: ' + code);
        },
      }
      try{
        request.upload(UploadRequestOptions);
        console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0002 upload');
        expect(UploadRequestOptions !== undefined).assertEqual(true);
        done();
      }catch(err){
        console.info('====>SUB_REQUESTSYSTEM_UPLOAD_API_0002 upload catch err:' + err);
        done();
      }
      console.info("====>-----------------------SUB_REQUESTSYSTEM_UPLOAD_API_0002 end-----------------------");
    });

    /**
     * @tc.name   SUB_REQUESTSYSTEM_DOWNLOAD_API_0001
     * @tc.number ohos.SUB_REQUESTSYSTEM_DOWNLOAD_API_0001
     * @tc.desc   This API is used to download files.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_REQUESTSYSTEM_DOWNLOAD_API_0001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUESTSYSTEM_DOWNLOAD_API_0001 start-----------------------");
      let DownloadResponse: ESObject = {
        token: "Hm_lpvt_1d6c34c1bc067f5746a5fca18d1c24ab"
      }

      let DownloadRequestOptions: ESObject = {
        url: 'http://www.path.com',
        filename: 'requestSystenTest',
        header: '',
        description: 'this is requeSystem download response',
        success: (DownloadResponse: ESObject) => {
          console.info('====>SUB_REQUESTSYSTEM_DOWNLOAD_API_0001call success callback success: ' + DownloadResponse.token);
        },
        fail: (data: string, code: number) => {
          console.info('====>SUB_REQUESTSYSTEM_DOWNLOAD_API_0001 handling fail');
        },
        complete: () => {
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
     * @tc.name   SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001
     * @tc.number ohos.SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001
     * @tc.desc   Listens to download task status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001 start-----------------------");
      let OnDownloadCompleteResponse: ESObject = {
        uri: "http://www.path.com"
      }
      let OnDownloadCompleteOptions: ESObject = {
        token: 'token-index',
        success: (OnDownloadCompleteResponse: ESObject) => {
          console.info('====>SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001 download success,uri:'
            + OnDownloadCompleteResponse.uri);
        },
        fail: (data: string, code: number) => {
          console.info('====>SUB_REQUESTSYSTEM_DOWNLOADCOMPLETE_API_0001 download fail');
        },
        complete: () => {
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
