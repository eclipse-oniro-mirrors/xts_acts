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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect,
} from '../Common';

export default function fileIOUnlink() {
describe('fileIO_fs_unlink', function () {

  /**
   * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_0000
   * @tc.name fileIO_test_unlink_sync_000
   * @tc.desc Test unlinkSync() interfaces.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_unlink_sync_000', 0, function () {
    try {
      fileIO.unlinkSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_unlink_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_0100
   * @tc.name fileIO_test_unlink_sync_001
   * @tc.desc Test unlinkSync() interfaces.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_unlink_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIOTest');

    try {
      fileIO.unlinkSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_unlink_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_0200
   * @tc.name fileIO_test_unlink_sync_002
   * @tc.desc Test unlinkSync() interfaces.
   * Delete the file by path, verify the normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_unlink_sync_002', 0, async function () {
    let fpath = await nextFileName('fileIO_test_unlink_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      expect(fileIO.accessSync(fpath)).assertTrue();
      fileIO.unlinkSync(fpath);
      expect(!fileIO.accessSync(fpath)).assertTrue();
    } catch (e) {
      console.log('fileIO_test_unlink_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_UNLINK_ASYNC_0000
   * @tc.name fileIO_test_unlink_async_000
   * @tc.desc Test unlinkAsync() interfaces. Promise.
   * Delete the file by path, verify the normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_unlink_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_unlink_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      expect(fileIO.accessSync(fpath)).assertTrue();
      await fileIO.unlink(fpath);
      expect(!fileIO.accessSync(fpath)).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_unlink_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_UNLINK_ASYNC_0100
   * @tc.name fileIO_test_unlink_async_001
   * @tc.desc Test unlinkAsync() interfaces. Callback.
   * Delete the file by path, verify the normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_unlink_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_unlink_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      expect(fileIO.accessSync(fpath)).assertTrue();
      fileIO.unlink(fpath, (err) => {
        if (err) {
          console.log('fileIO_test_unlink_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(!fileIO.accessSync(fpath)).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_test_unlink_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
  
  /**
   * @tc.number SUB_DF_FileIO_UNLINK_ASYNC_0200
   * @tc.name fileIO_test_unlink_async_002
   * @tc.desc Test unlink() interfaces. Callback.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_unlink_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIOTest');

    try {
      fileIO.unlink(fpath, (err) => {
        if (err) {
          console.log('fileIO_test_unlink_async_002 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_unlink_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_UNLINK_ASYNC_0300
   * @tc.name fileIO_test_unlink_async_003
   * @tc.desc Test unlink() interfaces. Promise.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_unlink_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileIOTest');

    try {
      await fileIO.unlink(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_unlink_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_UNLINK_ASYNC_0400
   * @tc.name fileIO_test_unlink_async_004
   * @tc.desc Test unlink() interfaces. Promise.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_unlink_async_004', 0, async function (done) {

    try {
      await fileIO.unlink();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_unlink_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
});
}
