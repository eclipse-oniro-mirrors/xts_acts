/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import fileUri from '@ohos.file.fileuri';
import fileShare from "@ohos.fileshare";
import fs from '@ohos.file.fs';
import type wantConstant from '@ohos.app.ability.wantConstant';
import { AsyncCallback } from "@ohos.base"
import { BusinessError } from "@ohos.base"
let domain: int = 0x0000;
let tag: string = 'testTag';

export const FILE_CONTENT = "Hello World!";

export default function fileuriTest() {
  describe('fileuriTest', (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    beforeAll(() => {
      try {
        fs.mkdirSync("/data/storage/el2/base/haps/", true);
      }catch(e: BusinessError) {
        hilog.info(domain, tag, `Fileuri test has failed for ${JSON.stringify(e)}`);
      }
    })

    /**
     * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0000
     * @tc.name test_FileUri_GetUriFromPath_static_000
     * @tc.desc Function of API, get Uri from Path. Test normal function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('test_FileUri_GetUriFromPath_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let path = "/data/storage/el2/base/haps/entry/files/sync.jpg";
        let uri = fileUri.getUriFromPath(path);
        let result = "file://ohos.acts.storage.fileuri.static/data/storage/el2/base/haps/entry/files/sync.jpg"
        hilog.info(domain, tag, "test_FileUri_GetUriFromPath_static_000 uri: %{public}s", uri);
        hilog.info(domain, tag, "test_FileUri_GetUriFromPath_static_000 result: %{public}s", result);
        expect(uri != "").assertTrue();
        expect(uri == result).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, `test_FileUri_GetUriFromPath_static_000 has failed for ${JSON.stringify(e)}`);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0100
     * @tc.name test_FileUri_GetUriFromPath_static_001
     * @tc.desc Function of API, get Uri from Path. Test path is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('test_FileUri_GetUriFromPath_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let uri = fileUri.getUriFromPath("");
        let result = "file://ohos.acts.storage.fileuri.static"
        hilog.info(domain, tag, "test_FileUri_GetUriFromPath_static_001 uri: %{public}s", uri);
        hilog.info(domain, tag, "test_FileUri_GetUriFromPath_static_001 result: %{public}s", result);
        expect(uri != "").assertTrue();
        expect(uri == result).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, `test_FileUri_GetUriFromPath_static_001 has failed for ${JSON.stringify(e)}`);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_FileUri_Name_0000
     * @tc.name test_Parameter_Name_static_000
     * @tc.desc Get the file name of uri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('test_Parameter_Name_static_000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', "test_Parameter_Name_000 START");
        try {
          let name = 'sync_000.txt';
          let path = '/data/storage/el2/base/haps/sync_000.txt';
          let uri = fileUri.getUriFromPath(path);
          let fileFromPath = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          hilog.info(domain, tag, 'openSync success');
          fs.writeSync(fileFromPath.fd, FILE_CONTENT);
          let fileUriObject = new fileUri.FileUri(path);
          expect(name === fileUriObject.name).assertTrue();
          await fs.close(fileFromPath);
          hilog.info(domain, tag, 'file1 close success');
          let fileFromUri = fs.openSync(path, fs.OpenMode.READ_ONLY);
          let readLen = fs.readSync(fileFromUri.fd, new ArrayBuffer(32), { offset: 0 });
          expect(readLen === FILE_CONTENT.length).assertTrue();
          await fs.close(fileFromUri);
          await fs.unlink(path);
          done();
        } catch (err) {
          hilog.info(domain, tag, `unknown error: ${err}`);
          const error = err as BusinessError;
          hilog.info(domain, tag, 'Expected failure: code = %{public}d, message = %{public}s',
            error.code, error.message);
          expect(false).assertTrue();
          done();
        }
        hilog.info(domain, tag, '%{public}s', "test_Parameter_Name_000 END");
      });

    /**
     * @tc.number SUB_STORAGE_FileUri_Name_0001
     * @tc.name test_Parameter_Name_static_001
     * @tc.desc Get the file name of uri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('test_Parameter_Name_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', "test_Parameter_Name_001 START");

        try {
          const uri : String = fileUri.getUriFromPath("");
          hilog.info(domain, tag, '%{public}s', uri);
          const fileUriObject01 = new fileUri.FileUri(uri);
          hilog.info(domain, tag, '%{public}s', "fileUriObject01.name START");
          hilog.info(domain, tag, 'fileUriObject01.name: = %{public}s', fileUriObject01.name);
          expect(fileUriObject01.name === '').assertTrue();
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', 'test_Parameter_Name_001 has failed for ' + err);
          const error = err as BusinessError;
          hilog.info(domain, tag, 'Expected failure: code = %{public}d, message = %{public}s',
            error.code, error.message);
          expect(false).assertTrue();
          done();
        }
        hilog.info(domain, tag, '%{public}s', "test_Parameter_Name_001 END");
      });

    hilog.info(domain, tag, '%{public}s', 'fileuriTest end');
  })
}
