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

import {
  fileio, FILE_CONTENT, prepareFile, nextFileName,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioFdatasync() {
describe('fileio_fdatasync', async function () {

  /**
   * @tc.name   fileio_test_fdatasync_async_000
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0000
   * @tc.desc   Test fdatasync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fdatasync_async_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_fdatasync_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o666);
      fileio.fdatasync(fd, function (err) {
        expect(fileio.closeSync(fd) == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
      });
    } catch (e) {
      console.log('fileio_test_fdatasync_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_fdatasync_async_001
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0010
   * @tc.desc   Test fdatasync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fdatasync_async_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_fdatasync_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o666);
      fileio
        .fdatasync(fd)
        .then(function (err) {
          expect(fileio.closeSync(fd) == null).assertTrue();
          expect(fileio.unlinkSync(fpath) == null).assertTrue();
        })
        .catch(function (err) {
          expect(null).assertFail();
        });
    } catch (e) {
      console.log('fileio_test_fdatasync_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

   /**
    * @tc.name   fileio_test_fdatasync_async_002
    * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0020
    * @tc.desc   Test fdatasync() interfaces.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_fdatasync_async_002', Level.LEVEL0, async function (done) {
    try {
      let fd = -1;
      await fileio.fdatasync(fd);
      expect(null).assertFail();
      done()
    } catch (e) {
      console.info('fileio_test_fdatasync_async_002 has failed for ' + e);
      done();
    }
  });

  /**
    * @tc.name   fileio_test_fdatasync_async_003
    * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0030
    * @tc.desc   Test fdatasync() interfaces.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_fdatasync_async_003', Level.LEVEL0, async function (done) {
    try {
      await fileio.fdatasync(null);
      expect(null).assertFail();
      done()
    } catch (e) {
      console.info('fileio_test_fdatasync_async_003 has failed for ' + e);
      expect(e.message == 'Invalid fd').assertTrue();
      done();
    }
  });

  /**
    * @tc.name   fileio_test_fdatasync_async_004
    * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0040
    * @tc.desc   Test fdatasync() interfaces.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_fdatasync_async_004', Level.LEVEL0, async function (done) {
    try {
      await fileio.fdatasync(undefined);
      expect(null).assertFail();
      done()
    } catch (e) {
      console.info('fileio_test_fdatasync_async_004 has failed for ' + e);
      expect(e.message == 'Invalid fd').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_fdatasync_async_005
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0500
   * @tc.desc   Test fdatasync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fdatasync_async_005', Level.LEVEL0, async function () {
    try {
      fileio.fdatasync(null, function (err) {
        if (err) {
          console.log('fileio_test_fdatasync_async_005 has failed for ' + err);
          expect(err.message == 'Invalid fd').assertTrue();
        }
      });
    } catch (e) {
      console.log('fileio_test_fdatasync_async_005 has failed for ' + e);
      expect(e.message == 'Invalid fd').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_fdatasync_async_006
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0600
   * @tc.desc   Test fdatasync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fdatasync_async_006', Level.LEVEL0, async function () {
    try {
      fileio.fdatasync(undefined, function (err) {
        if (err) {
          console.log('fileio_test_fdatasync_async_006 has failed for ' + err);
          expect(err.message == 'Invalid fd').assertTrue();
        }
      });
    } catch (e) {
      console.log('fileio_test_fdatasync_async_006 has failed for ' + e);
      expect(e.message == 'Invalid fd').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_fdatasync_sync_000
   * @tc.number SUB_DF_FILEIO_FDATASYNC_SYNC_0000
   * @tc.desc   Test fdatasyncSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fdatasync_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_fdatasync_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o666);
      expect(fileio.fdatasyncSync(fd) == null).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_fdatasync_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });
  
  /**
   * @tc.name   fileio_test_fdatasync_sync_001
   * @tc.number SUB_DF_FILEIO_FDATASYNC_SYNC_0010
   * @tc.desc   Test fdatasyncSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fdatasync_sync_001', Level.LEVEL0, async function () {
    try {
      fileio.fdatasyncSync(-1);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_fdatasync_sync_001 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_test_fdatasync_sync_002
   * @tc.number SUB_DF_FILEIO_FDATASYNC_SYNC_0020
   * @tc.desc   Test fdatasyncSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fdatasync_sync_002', Level.LEVEL0, async function () {
    try {
      fileio.fdatasyncSync(null);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_fdatasync_sync_002 has failed for ' + e);
      expect(e.message == 'Invalid fd').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_fdatasync_sync_003
   * @tc.number SUB_DF_FILEIO_FDATASYNC_SYNC_0030
   * @tc.desc   Test fdatasyncSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fdatasync_sync_003', Level.LEVEL0, async function () {
    try {
      fileio.fdatasyncSync(undefined);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_fdatasync_sync_003 has failed for ' + e);
      expect(e.message == 'Invalid fd').assertTrue();
    }
  });
});
}
