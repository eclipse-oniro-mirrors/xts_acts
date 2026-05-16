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
import { TestType, Size, Level } from '@ohos/hypium';

export default function fileIOMkdir() {
describe('fileIO_fs_mkdir', function () {

  /**
   * @tc.name   fileIO_test_mkdir_sync_000
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0000
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
   * @tc.name   fileIO_test_mkdir_sync_001
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0100
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_001', Level.LEVEL0, async function () {

    try {
      fileIO.mkdirSync('/');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900015 && e.message == 'File exists').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_002
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0200
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_002', Level.LEVEL0, async function () {

    try {
      fileIO.mkdirSync('');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_003
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0300
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_003', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_mkdir_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.mkdirSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900015 && e.message == 'File exists').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_004
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0400
   * @tc.desc   Test mkdirSync() interface. Path is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

    try {
      fileIO.mkdirSync(null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_005
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0500
   * @tc.desc   Test mkdirSync() interface. Path is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

    try {
      fileIO.mkdirSync(undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_006
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0600
   * @tc.desc   Test mkdirSync() interface with recursion. Path is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

    try {
      fileIO.mkdirSync("", true);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900002);
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_007
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0700
   * @tc.desc   Test mkdirSync() interface with recursion. Path is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

    try {
      fileIO.mkdirSync(null, true);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_008
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_0800
   * @tc.desc   Test mkdirSync() interface with recursion. Path is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

    try {
      fileIO.mkdirSync(undefined, true);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_000
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0000
   * @tc.desc   Test mkdir() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
   * @tc.name   fileIO_test_mkdir_async_001
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0100
   * @tc.desc   Test mkdir() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
   * @tc.name   fileIO_test_mkdir_async_002
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0200
   * @tc.desc   Test mkdir() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_002', Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdir();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_003
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0300
   * @tc.desc   Test mkdir() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_003', Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdir('/', (err) => {
        if(err) {
          console.log('fileIO_test_mkdir_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code === 13900015 && err.message == 'File exists').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_004
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0400
   * @tc.desc   Test mkdir() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
      expect(e.code === 13900015 && e.message == 'File exists').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_005
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0500
   * @tc.desc   Test mkdir() interface. Promise. Path is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdir("");
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900002);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_006
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0600
   * @tc.desc   Test mkdir() interface. Promise. Path is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdir(null);
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_007
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0700
   * @tc.desc   Test mkdir() interface. Promise. Path is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdir(undefined);
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_008
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0800
   * @tc.desc   Test mkdir() interface. Promise with recursion. Path is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdir("", true);
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900002);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_009
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_0900
   * @tc.desc   Test mkdir() interface. Promise with recursion. Path is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdir(null, true);
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_010
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_1000
   * @tc.desc   Test mkdir() interface. Promise with recursion. Path is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdir(undefined, true);
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_011
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_1100
   * @tc.desc   Test mkdir() interface. Callback. Path is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdir("", (err) => {
      console.log('fileIO_test_mkdir_async_011 has err failed for ' + err.message + ', code: ' + err.code);
      expect(err.code).assertEqual(13900002);
      done();
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_012
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_1200
   * @tc.desc   Test mkdir() interface. Callback. Path is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdir(null, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_013
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_1300
   * @tc.desc   Test mkdir() interface. Callback. Path is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdir(undefined, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_014
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_1400
   * @tc.desc   Test mkdir() interface. Callback with recursion. Path is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdir("", true, (err) => {
      console.log('fileIO_test_mkdir_async_014 has err failed for ' + err.message + ', code: ' + err.code);
      expect(err.code).assertEqual(13900002);
      done();
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_015
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_1500
   * @tc.desc   Test mkdir() interface. Callback with recursion. Path is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdir(null, true, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_016
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_1600
   * @tc.desc   Test mkdir() interface. Callback with recursion. Path is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdir(undefined, true, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_016 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });
})
}
