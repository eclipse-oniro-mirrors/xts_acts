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

const ERR_OK = 0;

export default function FileManagementFileIO(){
  describe('FileManagementFileIO', async () => {

    /**
     * @tc.number SUB_FILEIO_ERRCODE_ERR_OK_0100
     * @tc.name FileIOErrCodeErrOK001
     * @tc.desc test ERR_OK
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileIOErrCodeErrOK001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileIOErrCodeErrOK001 start====");
        let result : number = filemanagement.FileIOErrCodeErrOK();
        console.info("====>FileIOErrCodeErrOK001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileIOErrCodeErrOK001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEIO_ERRCODE_ERR_ENOENT_0100
     * @tc.name FileIOErrCodeErrEnoent001
     * @tc.desc test ERR_ENOENT
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileIOErrCodeErrEnoent001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileIOErrCodeErrEnoent001 start====");
        let result : number = filemanagement.FileIOErrCodeErrEnoent();
        console.info("====>FileIOErrCodeErrEnoent001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileIOErrCodeErrEnoent001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEIO_ERRCODE_ERR_INVALIDPARAMETER_0100
     * @tc.name FileIOErrCodeErrInvalidParameter001
     * @tc.desc test ERR_INVALID_PARAMETER
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileIOErrCodeErrInvalidParameter001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileIOErrCodeErrInvalidParameter001 start====");
        let result : number = filemanagement.FileIOErrCodeErrInvalidParameter();
        console.info("====>FileIOErrCodeErrInvalidParameter001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileIOErrCodeErrInvalidParameter001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEIO_GETFILELOCATION_LOCAL_0100
     * @tc.name FileIOFileLocationLocal001
     * @tc.desc test OH_FileIO_GetFileLocation
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileIOFileLocationLocal001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileIOFileLocationLocal001 start====");
        let result : number = filemanagement.FileIOFileLocationLocal();
        console.info("====>FileIOFileLocationLocal001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileIOFileLocationLocal001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEIO_GETFILELOCATION_CLOUD_0100
     * @tc.name FileIOFileLocationCloud001
     * @tc.desc test OH_FileIO_GetFileLocation
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileIOFileLocationCloud001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileIOFileLocationCloud001 start====");
        let result : number = filemanagement.FileIOFileLocationCloud();
        console.info("====>FileIOFileLocationCloud001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileIOFileLocationCloud001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEIO_GETFILELOCATION_LOCALANDCLOUD_0100
     * @tc.name FileIOFileLocationLocalAndCloud001
     * @tc.desc test OH_FileIO_GetFileLocation
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileIOFileLocationLocalAndCloud001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileIOFileLocationLocalAndCloud001 start====");
        let result : number = filemanagement.FileIOFileLocationLocalAndCloud();
        console.info("====>FileIOFileLocationLocalAndCloud001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileIOFileLocationLocalAndCloud001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEIO_GETFILELOCATION_0100
     * @tc.name FileIOGetFileLocation001
     * @tc.desc test OH_FileIO_GetFileLocation
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileIOGetFileLocation001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileIOGetFileLocation001 start====");
        let result : number = filemanagement.FileIOFileLocation("ERR_OK");
        console.info("====>FileIOGetFileLocation001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileIOGetFileLocation001 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEIO_GETFILELOCATION_0200
     * @tc.name FileIOGetFileLocation002
     * @tc.desc test OH_FileIO_GetFileLocation
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileIOGetFileLocation002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileIOGetFileLocation002 start====");
        let result : number = filemanagement.FileIOFileLocation("ERR_INVALID_PARAMETER");
        console.info("====>FileIOGetFileLocation002 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileIOGetFileLocation002 catch err: " + err);
      }
    });

    /**
     * @tc.number SUB_FILEIO_GETFILELOCATION_0300
     * @tc.name FileIOGetFileLocation003
     * @tc.desc test OH_FileIO_GetFileLocation
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('FileIOGetFileLocation003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileIOGetFileLocation003 start====");
        let result : number = filemanagement.FileIOFileLocation("ERR_ENOENT");
        console.info("====>FileIOGetFileLocation003 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>FileIOGetFileLocation003 catch err: " + err);
      }
    });
  });
}