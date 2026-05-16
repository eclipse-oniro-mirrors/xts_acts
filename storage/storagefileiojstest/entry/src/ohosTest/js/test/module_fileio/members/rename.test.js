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

export default function fileioRename() {
describe('fileio_rename', function () {

  /**
   * @tc.name   fileio_test_rename_async_000
   * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0000
   * @tc.desc   Test renameAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_rename_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_rename_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let newf = fpath + '123';
      fileio.rename(fpath, newf)
        .then(function (err) {
          expect(fileio.accessSync(newf) == null).assertTrue();
          expect(err == null).assertTrue();
          expect(fileio.unlinkSync(newf) == null).assertTrue();
        })
        .catch(function (e) {
          expect(e == null).assertTrue();
        })
      done();
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_rename_async_001
   * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0010
   * @tc.desc   Test renameAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_rename_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_rename_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let newf = fpath + 'aaa';
      fileio.rename(fpath, newf, function (err) {
        expect(fileio.accessSync(newf) == null).assertTrue();
        expect(fileio.unlinkSync(newf) == null).assertTrue();
        done();
      })
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_rename_async_002
   * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0020
   * @tc.desc   Test renameAsync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_rename_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_rename_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.access(fpath).then(function (err) {
        let newf = fpath + '123';
        fileio.rename(fpath, newf)
          .then(function (err) {
            expect(fileio.accessSync(newf) == null).assertTrue();
            expect(err == null).assertTrue();
            expect(fileio.unlinkSync(newf) == null).assertTrue();
          })
      })
        .catch(function (e) {
          expect(e == null).assertTrue();
        })
      done();
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_rename_promise_error_001
   * @tc.number SUB_DF_FILEIO_RENAME_PROMISE_ERROR_001
   * @tc.desc   Test rename() interface with empty string oldPath. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_promise_error_001', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_rename_promise_error_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.rename("", fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_rename_promise_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
    }
    fileio.unlinkSync(fpath);
  });

  /**
   * @tc.name   fileio_test_rename_promise_error_002
   * @tc.number SUB_DF_FILEIO_RENAME_PROMISE_ERROR_002
   * @tc.desc   Test rename() interface with null oldPath. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_promise_error_002', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_rename_promise_error_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.rename(null, fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_rename_promise_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid src').assertTrue();
    }
    fileio.unlinkSync(fpath);
  });

  /**
   * @tc.name   fileio_test_rename_promise_error_003
   * @tc.number SUB_DF_FILEIO_RENAME_PROMISE_ERROR_003
   * @tc.desc   Test rename() interface with undefined oldPath. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_promise_error_003', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_rename_promise_error_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.rename(undefined, fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_rename_promise_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid src').assertTrue();
    }
    fileio.unlinkSync(fpath);
  });

  /**
   * @tc.name   fileio_test_rename_promise_error_004
   * @tc.number SUB_DF_FILEIO_RENAME_PROMISE_ERROR_004
   * @tc.desc   Test rename() interface with empty string newPath. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_promise_error_004', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_rename_promise_error_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.rename(fpath, "");
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_rename_promise_error_004: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
    }
    fileio.unlinkSync(fpath);
  });

  /**
   * @tc.name   fileio_test_rename_promise_error_005
   * @tc.number SUB_DF_FILEIO_RENAME_PROMISE_ERROR_005
   * @tc.desc   Test rename() interface with null newPath. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_promise_error_005', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_rename_promise_error_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.rename(fpath, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_rename_promise_error_005: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid dest').assertTrue();
    }
    fileio.unlinkSync(fpath);
  });

  /**
   * @tc.name   fileio_test_rename_promise_error_006
   * @tc.number SUB_DF_FILEIO_RENAME_PROMISE_ERROR_006
   * @tc.desc   Test rename() interface with undefined newPath. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_promise_error_006', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_rename_promise_error_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.rename(fpath, undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_rename_promise_error_006: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid dest').assertTrue();
    }
    fileio.unlinkSync(fpath);
  });

  /**
   * @tc.name   fileio_test_rename_callback_error_001
   * @tc.number SUB_DF_FILEIO_RENAME_CALLBACK_ERROR_001
   * @tc.desc   Test rename() interface with empty string oldPath. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_callback_error_001', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_test_rename_callback_error_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.rename("", fpath, function (err) {
        if (err) {
          console.log('fileio_test_rename_callback_error_001: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          fileio.unlinkSync(fpath);
          done();
        } else {
          expect(false).assertTrue();
          fileio.unlinkSync(fpath);
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_rename_callback_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_rename_callback_error_002
   * @tc.number SUB_DF_FILEIO_RENAME_CALLBACK_ERROR_002
   * @tc.desc   Test rename() interface with null oldPath. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_callback_error_002', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_test_rename_callback_error_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.rename(null, fpath, function (err) {
        if (err) {
          console.log('fileio_test_rename_callback_error_002: ' + err.message + ', code: ' + err.code);
          fileio.unlinkSync(fpath);
          done();
        } else {
          expect(false).assertTrue();
          fileio.unlinkSync(fpath);
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_rename_callback_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid src').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_rename_callback_error_003
   * @tc.number SUB_DF_FILEIO_RENAME_CALLBACK_ERROR_003
   * @tc.desc   Test rename() interface with undefined oldPath. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_callback_error_003', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_test_rename_callback_error_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.rename(undefined, fpath, function (err) {
        if (err) {
          console.log('fileio_test_rename_callback_error_003: ' + err.message + ', code: ' + err.code);
          fileio.unlinkSync(fpath);
          done();
        } else {
          expect(false).assertTrue();
          fileio.unlinkSync(fpath);
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_rename_callback_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid src').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_rename_callback_error_004
   * @tc.number SUB_DF_FILEIO_RENAME_CALLBACK_ERROR_004
   * @tc.desc   Test rename() interface with empty string newPath. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_callback_error_004', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_test_rename_callback_error_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.rename(fpath, "", function (err) {
        if (err) {
          console.log('fileio_test_rename_callback_error_004: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          fileio.unlinkSync(fpath);
          done();
        } else {
          expect(false).assertTrue();
          fileio.unlinkSync(fpath);
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_rename_callback_error_004: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_rename_callback_error_005
   * @tc.number SUB_DF_FILEIO_RENAME_CALLBACK_ERROR_005
   * @tc.desc   Test rename() interface with null newPath. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_callback_error_005', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_test_rename_callback_error_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.rename(fpath, null, function (err) {
        if (err) {
          console.log('fileio_test_rename_callback_error_005: ' + err.message + ', code: ' + err.code);
          fileio.unlinkSync(fpath);
          done();
        } else {
          expect(false).assertTrue();
          fileio.unlinkSync(fpath);
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_rename_callback_error_005: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid dest').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_rename_callback_error_006
   * @tc.number SUB_DF_FILEIO_RENAME_CALLBACK_ERROR_006
   * @tc.desc   Test rename() interface with undefined newPath. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_rename_callback_error_006', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_test_rename_callback_error_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.rename(fpath, undefined, function (err) {
        if (err) {
          console.log('fileio_test_rename_callback_error_006: ' + err.message + ', code: ' + err.code);
          fileio.unlinkSync(fpath);
          done();
        } else {
          expect(false).assertTrue();
          fileio.unlinkSync(fpath);
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_rename_callback_error_006: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid dest').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });
});}
