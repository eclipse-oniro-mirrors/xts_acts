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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import filemanagement from 'libfilemanagement.so';
import fs from '@ohos.file.fs';
import { fileUri } from '@kit.CoreFileKit';

const ERR_OK = 0;

export default function FileManagementFileUri(){
  describe('FileManagementFileUri', async () => {

    beforeAll(async () => {
      let filepath1 = "/data/storage/el2/base/files/test1.txt";
      let filepath2 = "/data/storage/el2/base/files/test2.txt";
      fs.openSync(filepath1,0o100);
      fs.openSync(filepath2,0o100);
      new fileUri.FileUri(filepath1);
      new fileUri.FileUri(filepath2);
    })

    /**
     * @tc.number SUB_FILEURI_ERRCODE_ERR_OK_0100
     * @tc.name FileUriErrCodeErrOk001
     * @tc.desc test ERR_OK
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriErrCodeErrOk001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriErrCodeErrOk001 start====");
        let result : number = filemanagement.FileUriErrCodeErrOk();
        console.info("====>FileUriErrCodeErrOk001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriErrCodeErrOk001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_ERRCODE_ERR_INVALIDPARAMETER_0100
     * @tc.name FileUriErrCodeErrInvalidParameter001
     * @tc.desc test ERR_INVALID_PARAMETER
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriErrCodeErrInvalidParameter001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriErrCodeErrInvalidParameter001 start====");
        let result : number = filemanagement.FileUriErrCodeErrInvalidParameter();
        console.info("====>FileUriErrCodeErrInvalidParameter001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriErrCodeErrInvalidParameter001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_ERRCODE_ERR_UNKNOWN_0100
     * @tc.name FileUriErrCodeErrUnknown001
     * @tc.desc test ERR_UNKNOWN
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriErrCodeErrUnknown001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriErrCodeErrUnknown001 start====");
        let result : number = filemanagement.FileUriErrCodeErrUnknown();
        console.info("====>FileUriErrCodeErrUnknown001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriErrCodeErrUnknown001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_ERRCODE_ERR_ENOENT_0100
     * @tc.name FileUriErrCodeErrEnoent001
     * @tc.desc test ERR_ENOENT
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriErrCodeErrEnoent001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriErrCodeErrEnoent001 start====");
        let result : number = filemanagement.FileUriErrCodeErrEnoent();
        console.info("====>FileUriErrCodeErrEnoent001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriErrCodeErrEnoent001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_GETURIFROMPATH_0100
     * @tc.name FileUriGetUriFromPath001
     * @tc.desc test OH_FileUri_GetUriFromPath
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriGetUriFromPath001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriGetUriFromPath001 start====");
        let result : number = filemanagement.FileUriErrCodeErrOk();
        console.info("====>FileUriGetUriFromPath001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriGetUriFromPath001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_GETURIFROMPATH_0200
     * @tc.name FileUriGetUriFromPath002
     * @tc.desc test OH_FileUri_GetUriFromPath
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriGetUriFromPath002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriGetUriFromPath002 start====");
        let result : number = filemanagement.FileUriErrCodeErrInvalidParameter();
        console.info("====>FileUriGetUriFromPath002 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriGetUriFromPath002 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_GETURIFROMPATH_0300
     * @tc.name FileUriGetUriFromPath003
     * @tc.desc test OH_FileUri_GetUriFromPath
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriGetUriFromPath003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriGetUriFromPath003 start====");
        let result : number = filemanagement.FileUriErrCodeErrUnknown();
        console.info("====>FileUriGetUriFromPath003 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriGetUriFromPath003 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_GETPATHFROMURI_0100
     * @tc.name FileUriGetPathFromUri001
     * @tc.desc test OH_FileUri_GetPathFromUri
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriGetPathFromUri001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriGetPathFromUri001 start====");
        let result : number = filemanagement.FileUriGetPathFromUriErrOk();
        console.info("====>FileUriGetPathFromUri001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriGetPathFromUri001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_GETPATHFROMURI_0200
     * @tc.name FileUriGetPathFromUri002
     * @tc.desc test OH_FileUri_GetPathFromUri
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriGetPathFromUri002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriGetPathFromUri002 start====");
        let result : number = filemanagement.FileUriGetPathFromUriErrInvalidParameter();
        console.info("====>FileUriGetPathFromUri002 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriGetPathFromUri002 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_GETPATHFROMURI_0300
     * @tc.name FileUriGetPathFromUri003
     * @tc.desc test OH_FileUri_GetPathFromUri
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriGetPathFromUri003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriGetPathFromUri003 start====");
        let result : number = filemanagement.FileUriGetPathFromUriErrUnknown();
        console.info("====>FileUriGetPathFromUri003 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriGetPathFromUri003 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_GETFULLDIRECTORYURI_0100
     * @tc.name FileUriGetFullDirectoryUri001
     * @tc.desc test OH_FileUri_GetFullDirectoryUri
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriGetFullDirectoryUri001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriGetFullDirectoryUri001 start====");
        let result : number = filemanagement.FileUriGetFullDirectoryUriErrOk();
        console.info("====>FileUriGetFullDirectoryUri001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriGetFullDirectoryUri001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_GETFULLDIRECTORYURI_0200
     * @tc.name FileUriGetFullDirectoryUri002
     * @tc.desc test OH_FileUri_GetFullDirectoryUri
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriGetFullDirectoryUri002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriGetFullDirectoryUri002 start====");
        let result : number = filemanagement.FileUriGetFullDirectoryUriErrInvalidParameter();
        console.info("====>FileUriGetFullDirectoryUri002 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriGetFullDirectoryUri002 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_GETFULLDIRECTORYURI_0300
     * @tc.name FileUriGetFullDirectoryUri003
     * @tc.desc test OH_FileUri_GetFullDirectoryUri
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriGetFullDirectoryUri003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriGetFullDirectoryUri003 start====");
        let result : number = filemanagement.FileUriErrCodeErrEnoent();
        console.info("====>FileUriGetFullDirectoryUri003 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriGetFullDirectoryUri003 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_GETFILENAME_0100
     * @tc.name FileUriGetFileName001
     * @tc.desc test OH_FileUri_GetFileName
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriGetFileName001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriGetFileName001 start====");
        let result : number = filemanagement.FileUriGetFileNameErrOk();
        console.info("====>FileUriGetFileName001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriGetFileName001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEURI_GETFILENAME_0200
     * @tc.name FileUriGetFileName002
     * @tc.desc test OH_FileUri_GetFileName
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileUriGetFileName002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileUriGetFileName002 start====");
        let result : number = filemanagement.FileUriGetFileNameErrInvalidParameter();
        console.info("====>FileUriGetFileName002 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileUriGetFileName002 catch err: " + err);
      }
    });
  });
}