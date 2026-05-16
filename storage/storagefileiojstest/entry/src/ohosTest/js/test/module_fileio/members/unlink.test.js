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

export default function fileioUnlink() {
describe('fileio_unlink', function () {

  /**
   * @tc.name   fileio_test_unlink_sync_000
   * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_0000
   * @tc.desc   Test unlinkSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_unlink_sync_000', Level.LEVEL0, function () {
    try {
      fileio.unlinkSync();
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_unlink_sync_000 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_test_unlink_sync_001
   * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_0010
   * @tc.desc   Test unlinkSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_unlink_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIOTest');

    try {
      fileio.unlinkSync(fpath);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_unlink_sync_001 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_test_unlink_sync_002
   * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_0020
   * @tc.desc   Test unlinkSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_unlink_sync_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_unlink_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      expect(fileio.accessSync(fpath) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_unlink_sync_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_unlink_async_000
   * @tc.number SUB_DF_FileIO_UnlinkAync_0000
   * @tc.desc   Test unlinkAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_unlink_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIOTest');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      expect(await fileio.unlink(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_unlink_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_unlink_async_001
   * @tc.number SUB_DF_FileIO_UnlinkAync_0010
   * @tc.desc   Test unlinkAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_unlink_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIOTest');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.unlink(fpath, function (error) {
        done();
      });
    } catch (e) {
      console.log('fileio_test_unlink_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_unlink_async_002
   * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_0020
   * @tc.desc   Test unlink() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_unlink_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_unlink_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.unlink(fpath, function (err) {
        done();
      });
    } catch (e) {
      console.log('fileio_test_unlink_async_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_unlink_async_003
   * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_0030
   * @tc.desc   Test unlink() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_unlink_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_unlink_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.unlink(fpath).then(function (err) {
        done();
      });
    } catch (e) {
      console.log('fileio_test_unlink_async_003 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_unlink_promise_error_001
   * @tc.number SUB_DF_FILEIO_UNLINK_PROMISE_ERROR_001
   * @tc.desc   Test unlink() interface with empty string path. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_unlink_promise_error_001', Level.LEVEL2, async function () {
    try {
      await fileio.unlink("");
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_unlink_promise_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_unlink_promise_error_002
   * @tc.number SUB_DF_FILEIO_UNLINK_PROMISE_ERROR_002
   * @tc.desc   Test unlink() interface with null path. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_unlink_promise_error_002', Level.LEVEL2, async function () {
    try {
      await fileio.unlink(null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_unlink_promise_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_unlink_promise_error_003
   * @tc.number SUB_DF_FILEIO_UNLINK_PROMISE_ERROR_003
   * @tc.desc   Test unlink() interface with undefined path. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_unlink_promise_error_003', Level.LEVEL2, async function () {
    try {
      await fileio.unlink(undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_unlink_promise_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  // Test cases for unlink(path: string, callback: AsyncCallback<void>): void
  /**
   * @tc.name   fileio_unlink_callback_error_001
   * @tc.number SUB_DF_FILEIO_UNLINK_CALLBACK_ERROR_001
   * @tc.desc   Test unlink() interface with empty string path. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_unlink_callback_error_001', Level.LEVEL2, async function (done) {
    try {
      fileio.unlink("", function (err) {
        if (err) {
          console.log('fileio_unlink_callback_error_001: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_unlink_callback_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_unlink_callback_error_002
   * @tc.number SUB_DF_FILEIO_UNLINK_CALLBACK_ERROR_002
   * @tc.desc   Test unlink() interface with null path. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_unlink_callback_error_002', Level.LEVEL2, async function (done) {
    try {
      fileio.unlink(null, function (err) {
        if (err) {
          console.log('fileio_unlink_callback_error_002: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid path').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_unlink_callback_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_unlink_callback_error_003
   * @tc.number SUB_DF_FILEIO_UNLINK_CALLBACK_ERROR_003
   * @tc.desc   Test unlink() interface with undefined path. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_unlink_callback_error_003', Level.LEVEL2, async function (done) {
    try {
      fileio.unlink(undefined, function (err) {
        if (err) {
          console.log('fileio_unlink_callback_error_003: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid path').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_unlink_callback_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  // Test cases for unlinkSync(path: string): void
  /**
   * @tc.name   fileio_unlink_sync_error_001
   * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_ERROR_001
   * @tc.desc   Test unlinkSync() interface with empty string path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_unlink_sync_error_001', Level.LEVEL2, async function () {
    try {
      fileio.unlinkSync("");
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_unlink_sync_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_unlink_sync_error_002
   * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_ERROR_002
   * @tc.desc   Test unlinkSync() interface with null path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_unlink_sync_error_002', Level.LEVEL2, async function () {
    try {
      fileio.unlinkSync(null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_unlink_sync_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_unlink_sync_error_003
   * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_ERROR_003
   * @tc.desc   Test unlinkSync() interface with undefined path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_unlink_sync_error_003', Level.LEVEL2, async function () {
    try {
      fileio.unlinkSync(undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_unlink_sync_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });
});
}
