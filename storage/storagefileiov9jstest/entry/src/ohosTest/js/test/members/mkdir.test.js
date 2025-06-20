/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { 
  fileIO, nextFileName, describe, it, expect, prepareFile, FILE_CONTENT,
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIOMkdir() {
describe('fileIO_fs_mkdir', function () {

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0000
   * @tc.name fileIO_test_mkdir_sync_000
   * @tc.desc Test mkdirSync() interfaces.
   * Create a directory, verify normal function.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_mkdir_sync_000', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_mkdir_sync_000') + 'd';

    try {
      fileIO.mkdirSync(dpath);
      expect(fileIO.accessSync(dpath)).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0100
   * @tc.name fileIO_test_mkdir_sync_001
   * @tc.desc Test mkdirSync() interfaces.
   * The directory has been existed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_mkdir_sync_001', Level.LEVEL0, async function () {

    try {
      fileIO.mkdirSync('/');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0200
   * @tc.name fileIO_test_mkdir_sync_002
   * @tc.desc Test mkdirSync() interfaces.
   * The path is empty.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_mkdir_sync_002', Level.LEVEL0, async function () {

    try {
      fileIO.mkdirSync('');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0300
   * @tc.name fileIO_test_mkdir_sync_003
   * @tc.desc Test mkdirSync() interfaces.
   * The path has pointed to a file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_mkdir_sync_003', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_mkdir_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.mkdirSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0000
   * @tc.name fileIO_test_mkdir_async_000
   * @tc.desc Test mkdir() interfaces. Promise.
   * Create a directory, verify normal function.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_mkdir_async_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdir_async_000') + 'd';

    try {
      await fileIO.mkdir(dpath);
      expect(fileIO.accessSync(dpath)).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0100
   * @tc.name fileIO_test_mkdir_async_001
   * @tc.desc Test mkdir() interfaces. Callback.
   * Create a directory, verify normal function.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_mkdir_async_001', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdir_async_001') + 'd';

    try {
      fileIO.mkdir(dpath, (err) => {
        if(err) {
          console.log('fileIO_test_mkdir_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0200
   * @tc.name fileIO_test_mkdir_async_002
   * @tc.desc Test mkdir() interfaces. Promise.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_mkdir_async_002', Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdir();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0300
   * @tc.name fileIO_test_mkdir_async_003
   * @tc.desc Test mkdir() interfaces. Callback.
   * The directory has been existed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_mkdir_async_003', Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdir('/', (err) => {
        if(err) {
          console.log('fileIO_test_mkdir_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0400
   * @tc.name fileIO_test_mkdir_async_004
   * @tc.desc Test mkdir() interfaces. Promise.
   * The path has pointed to a file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_mkdir_async_004', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_mkdir_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.mkdir(fpath);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_mkdir_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
    }
  });
})
}
