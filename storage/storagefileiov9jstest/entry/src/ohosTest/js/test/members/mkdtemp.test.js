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
import { Level } from '@ohos/hypium';

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
});
}
