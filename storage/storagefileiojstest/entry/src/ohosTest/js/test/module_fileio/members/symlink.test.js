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

export default function fileioSymlink() {
describe('fileio_symlink', function () {

  /**
   * @tc.name   fileio_test_symlink_sync_000
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_0000
   * @tc.desc   Test SymlinkSync interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_symlink_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_symlink_sync_000');

    try {
      fileio.symlinkSync(fpath, fpath + 'aaaa');
      expect(false).assertTrue();
    } catch (e) {
      console.info('fileio_test_symlink_sync_000 has failed for ' + e);
      expect(e.message == 'Permission denied').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_symlink_async_000
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0000
   * @tc.desc   Test SymlinkAsync interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_symlink_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_symlink_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.symlink(fpath, fpath + '1067');
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.info('fileio_test_symlink_async_000 has failed for ' + e);
      expect(e.message == 'Permission denied').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });
  
  /**
   * @tc.name   fileio_test_symlink_async_001
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0010
   * @tc.desc   Test SymlinkAsync interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_symlink_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_symlink_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.symlink(fpath, fpath + 'pass2', (err) => {
        if (err) {
          console.log('fileio_test_symlink_async_001 error: message: ' + err.message );
          expect(err.message == 'Permission denied').assertTrue();
          fileio.unlinkSync(fpath);
          done();
        }
        done();
      });
    } catch (e) {
      console.info('fileio_test_symlink_async_001 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_promise_error_001
   * @tc.number SUB_DF_FILEIO_SYMLINK_PROMISE_ERROR_001
   * @tc.desc   Test symlink() interface with empty string target. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
   it('fileio_symlink_promise_error_001', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_promise_error_001');
    try {
      await fileio.symlink("", fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_promise_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_promise_error_002
   * @tc.number SUB_DF_FILEIO_SYMLINK_PROMISE_ERROR_002
   * @tc.desc   Test symlink() interface with null target. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_promise_error_002', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_promise_error_002');
    try {
      await fileio.symlink(null, fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_promise_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid src').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_promise_error_003
   * @tc.number SUB_DF_FILEIO_SYMLINK_PROMISE_ERROR_003
   * @tc.desc   Test symlink() interface with undefined target. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_promise_error_003', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_promise_error_003');
    try {
      await fileio.symlink(undefined, fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_promise_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid src').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_promise_error_004
   * @tc.number SUB_DF_FILEIO_SYMLINK_PROMISE_ERROR_004
   * @tc.desc   Test symlink() interface with empty string srcPath. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_promise_error_004', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_p_promise_error_004');
    try {
      await fileio.symlink(fpath, "");
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_promise_error_004: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_promise_error_005
   * @tc.number SUB_DF_FILEIO_SYMLINK_PROMISE_ERROR_005
   * @tc.desc   Test symlink() interface with null srcPath. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_promise_error_005', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_promise_error_005');
    try {
      await fileio.symlink(fpath, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_promise_error_005: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid dest').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_promise_error_006
   * @tc.number SUB_DF_FILEIO_SYMLINK_PROMISE_ERROR_006
   * @tc.desc   Test symlink() interface with undefined srcPath. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_promise_error_006', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_promise_error_006');
    try {
      await fileio.symlink(fpath, undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_promise_error_006: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid dest').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_callback_error_001
   * @tc.number SUB_DF_FILEIO_SYMLINK_CALLBACK_ERROR_001
   * @tc.desc   Test symlink() interface with empty string target. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_callback_error_001', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_symlink_callback_error_001');
    try {
      fileio.symlink("", fpath, function (err) {
        if (err) {
          console.log('fileio_symlink_callback_error_001: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_symlink_callback_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_symlink_callback_error_002
   * @tc.number SUB_DF_FILEIO_SYMLINK_CALLBACK_ERROR_002
   * @tc.desc   Test symlink() interface with null target. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_callback_error_002', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_symlink_callback_error_002');
    try {
      fileio.symlink(null, fpath, function (err) {
        if (err) {
          console.log('fileio_symlink_callback_error_002: ' + err.message + ', code: ' + errerr.code);
          expect(err.message == 'Invalid src').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_symlink_callback_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid src').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_symlink_callback_error_003
   * @tc.number SUB_DF_FILEIO_SYMLINK_CALLBACK_ERROR_003
   * @tc.desc   Test symlink() interface with undefined target. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_callback_error_003', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_symlink_callback_error_003');
    try {
      fileio.symlink(undefined, fpath, function (err) {
        if (err) {
          console.log('fileio_symlink_callback_error_003: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid src').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_symlink_callback_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid src').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_symlink_callback_error_004
   * @tc.number SUB_DF_FILEIO_SYMLINK_CALLBACK_ERROR_004
   * @tc.desc   Test symlink() interface with empty string srcPath. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_callback_error_004', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_symlink_callback_error_004');
    try {
      fileio.symlink(fpath, "", function (err) {
        if (err) {
          console.log('fileio_symlink_callback_error_004: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_symlink_callback_error_004: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_symlink_callback_error_005
   * @tc.number SUB_DF_FILEIO_SYMLINK_CALLBACK_ERROR_005
   * @tc.desc   Test symlink() interface with null srcPath. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_callback_error_005', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_symlink_callback_error_005');
    try {
      fileio.symlink(fpath, null, function (err) {
        if (err) {
          console.log('fileio_symlink_callback_error_005: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid dest').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_symlink_callback_error_005: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid dest').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_symlink_callback_error_006
   * @tc.number SUB_DF_FILEIO_SYMLINK_CALLBACK_ERROR_006
   * @tc.desc   Test symlink() interface with undefined srcPath. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_callback_error_006', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_symlink_callback_error_006');
    try {
      fileio.symlink(fpath, undefined, function (err) {
        if (err) {
          console.log('fileio_symlink_callback_error_006: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid dest').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_symlink_callback_error_006: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid dest').assertTrue();
      done();
    }
  });

  // Test cases for symlinkSync(target: string, srcPath: string): void
  /**
   * @tc.name   fileio_symlink_sync_error_001
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_ERROR_001
   * @tc.desc   Test symlinkSync() interface with empty string target.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_sync_error_001', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_sync_error_001');
    try {
      fileio.symlinkSync("", fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_sync_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_sync_error_002
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_ERROR_002
   * @tc.desc   Test symlinkSync() interface with null target.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_sync_error_002', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_sync_error_002');
    try {
      fileio.symlinkSync(null, fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_sync_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid src').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_sync_error_003
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_ERROR_003
   * @tc.desc   Test symlinkSync() interface with undefined target.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_sync_error_003', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_sync_error_003');
    try {
      fileio.symlinkSync(undefined, fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_sync_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid src').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_sync_error_004
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_ERROR_004
   * @tc.desc   Test symlinkSync() interface with empty string srcPath.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_sync_error_004', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_sync_error_004');
    try {
      fileio.symlinkSync(fpath, "");
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_sync_error_004: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_sync_error_005
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_ERROR_005
   * @tc.desc   Test symlinkSync() interface with null srcPath.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_sync_error_005', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_sync_error_005');
    try {
      fileio.symlinkSync(fpath, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_sync_error_005: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid dest').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_symlink_sync_error_006
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_ERROR_006
   * @tc.desc   Test symlinkSync() interface with undefined srcPath.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_symlink_sync_error_006', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_symlink_sync_error_006');
    try {
      fileio.symlinkSync(fpath, undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_symlink_sync_error_006: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid dest').assertTrue();
    }
  });
});
}
