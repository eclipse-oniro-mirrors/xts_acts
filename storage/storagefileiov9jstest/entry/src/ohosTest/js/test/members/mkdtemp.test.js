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

import { fileIO, nextFileName, describe, it, expect } from '../Common';
import { TestType, Size, Level } from '@ohos/hypium';

export default function fileIOMkdtemp() {
describe('fileIO_fs_mkdtemp', function () {

  /**
   * @tc.name   fileIO_test_mkdtemp_sync_000
   * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0000
   * @tc.desc   Test mkdtempSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_sync_000', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_mkdtemp_sync_000');

    try {
      dpath = dpath + 'XXXXXX';
      let res = fileIO.mkdtempSync(dpath);
      expect(fileIO.accessSync(res)).assertTrue();
      fileIO.rmdirSync(res);
    } catch (e) {
      console.log('fileIO_test_mkdtemp_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_sync_001
   * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0100
   * @tc.desc   Test mkdtempSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_sync_001', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_mkdtemp_sync_000');

    try {
      fileIO.mkdtempSync(dpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdtemp_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_sync_002
   * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0200
   * @tc.desc   Test mkdtempSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_sync_002', Level.LEVEL0, async function () {

    try {
      fileIO.mkdtempSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdtemp_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_000
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0000
   * @tc.desc   Test mkdtemp() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdtemp_async_000');

    try {
      dpath = dpath + 'XXXXXX';
      let res = await fileIO.mkdtemp(dpath);
      expect(fileIO.accessSync(res)).assertTrue();
      fileIO.rmdirSync(res);
      done();
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_001
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0100
   * @tc.desc   Test mkdtemp() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_001', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdtemp_async_001');

    try {
      dpath = dpath + 'XXXXXX';
      fileIO.mkdtemp(dpath, (err, res) => {
        if (err) {
          console.log('fileIO_test_mkdtemp_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(res)).assertTrue();
        fileIO.rmdirSync(res);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_002
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0200
   * @tc.desc   Test mkdtemp() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_002', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdtemp_async_002');

    try {
      await fileIO.mkdtemp(dpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_003
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0300
   * @tc.desc   Test mkdtemp() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_003', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdtemp_async_003');

    try {
      fileIO.mkdtemp(dpath, (err) => {
        if (err) {
          console.log('fileIO_test_mkdtemp_async_003 error package: ' + JSON.stringify(err));
          expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_004
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0400
   * @tc.desc   Test mkdtemp() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_004', Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdtemp();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_005
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0500
   * @tc.desc   Test mkdtemp() interface. Callback, parameter is "".
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_005', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdtemp_async_005');

    try {
      fileIO.mkdtemp("", (err, res) => {
        if (err) {
          console.log('fileIO_test_mkdtemp_async_005 error package: ' + JSON.stringify(err));
          expect(err.code === 13900020).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_006
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0600
   * @tc.desc   Test mkdtemp() interface. Callback, parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_006', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdtemp_async_006');

    try {
      fileIO.mkdtemp(null, (err, res) => {
        if (err) {
          console.log('fileIO_test_mkdtemp_async_006 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_007
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0700
   * @tc.desc   Test mkdtemp() interface. Callback, parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_007', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdtemp_async_007');

    try {
      fileIO.mkdtemp(undefined, (err, res) => {
        if (err) {
          console.log('fileIO_test_mkdtemp_async_007 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_sync_003
   * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0300
   * @tc.desc   Test mkdtempSync() interface,parameter is "".
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_sync_003', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_mkdtemp_sync_003');

    try {
      let res = fileIO.mkdtempSync("");
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdtemp_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_sync_004
   * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0400
   * @tc.desc   Test mkdtempSync() interface,parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_sync_004', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_mkdtemp_sync_004');

    try {
      let res = fileIO.mkdtempSync(null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdtemp_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_sync_005
   * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0500
   * @tc.desc   Test mkdtempSync() interface,parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_sync_005', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_mkdtemp_sync_005');

    try {
      let res = fileIO.mkdtempSync(undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdtemp_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_Promise_005
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_Promise_0500
   * @tc.desc   Test mkdtemp() interface. Promise. Prefix is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_Promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdtemp("");
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_Promise_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_Promise_006
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_Promise_0600
   * @tc.desc   Test mkdtemp() interface. Promise. Prefix is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_Promise_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdtemp(null);
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_Promise_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_Promise_007
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_Promise_0700
   * @tc.desc   Test mkdtemp() interface. Promise. Prefix is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_Promise_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdtemp(undefined);
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_Promise_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_008
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0800
   * @tc.desc   Test mkdtemp() interface. Callback. Prefix is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdtemp("", (err) => {
      console.log('fileIO_test_mkdtemp_async_008 has err failed for ' + err.message + ', code: ' + err.code);
      expect(err.code).assertEqual(13900020);
      done();
      });
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_009
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0900
   * @tc.desc   Test mkdtemp() interface. Callback. Prefix is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdtemp(null, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdtemp_async_010
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_1000
   * @tc.desc   Test mkdtemp() interface. Callback. Prefix is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdtemp_async_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdtemp(undefined, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_mkdtemp_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code).assertEqual(13900020);
      done();
    }
  });
});
}
