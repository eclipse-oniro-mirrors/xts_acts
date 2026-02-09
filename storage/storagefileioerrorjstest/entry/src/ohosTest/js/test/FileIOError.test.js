/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import fileio from '@ohos.fileio'
import {
  describe,
  it,
  expect,
  Level
}
from '@ohos/hypium'
import {
  FILE_CONTENT,
  prepareFile,
  fileName,
  nextFileName,
  isIntNum,
  isInclude
}
from './Common'

export default function FileIOError() {
describe('FileIOError', function () {

  /**
   * @tc.name   fileio_test_error_000
   * @tc.number SUB_STORAGE_FileIo_test_error_0000
   * @tc.desc   Function of API, delete file
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_error_000', Level.LEVEL0, async function (done) {
    let fpath = await fileName('fileio_test_error_000f');
    expect(prepareFile(fpath, 'hello')).assertTrue();
    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      fileio.rmdirSync(fpath);
    } 
    catch (err) {
      console.info('fileio_test_error_000 has failed for ' + err);
      expect(isInclude(err.message, 'Not a directory')).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_error_001
   * @tc.number SUB_STORAGE_FileIo_test_error_0100
   * @tc.desc   Function of API, flags=0o100. missing mode parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_error_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_error_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.openSync(fpath, 0o100);
    } 
    catch (err) {
      console.info('fileio_test_error_001 has failed for ' + err);
      expect(isInclude(err.message, 'called with O_CREAT/O_TMPFILE but no mode')).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_error_002
   * @tc.number SUB_STORAGE_FileIO_OpenSync_0200
   * @tc.desc   Function of API,  flags=0o302. The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_error_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_error_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.openSync(fpath, 0o302, 0o666);
    } 
    catch (err) {
      console.info('fileio_test_error_002 has failed for ' + err);
      expect(isInclude(err.message, 'File exists')).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_error_004
   * @tc.number SUB_STORAGE_FileIO_OpenSync_0400
   * @tc.desc   Function of API, flags=0o200000. Not a directory.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_error_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_error_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.openSync(fpath, 0o200000, 0o666);
    } 
    catch (err) {
      console.info('fileio_test_error_004 has failed for ' + err);
      expect(isInclude(err.message, 'Not a directory')).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });
});
}
