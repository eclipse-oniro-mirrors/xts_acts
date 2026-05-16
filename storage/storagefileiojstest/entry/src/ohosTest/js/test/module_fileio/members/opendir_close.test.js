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

import { fileio, nextFileName, describe, it, expect } from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioOpendirClose() {
describe('fileio_opendir_close', function () {

  /**
   * @tc.name   fileio_dir_open_close_sync_000
   * @tc.number SUB_DF_FILEIO_OPEN_CLOSEDIR_SYNC_0000
   * @tc.desc   Test opendirSync() and Dir.closeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_dir_open_close_sync_000', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_dir_open_close_sync_000') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let dd = fileio.opendirSync(dpath);
      expect(dd !== null).assertTrue();
      expect(dd.closeSync() == null).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_dir_open_close_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_dir_open_close_sync_001
   * @tc.number SUB_DF_FILEIO_OPEN_CLOSEDIR_SYNC_0010
   * @tc.desc   Test opendirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_dir_open_close_sync_001', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_dir_open_close_sync_001') + 'd';

    try {
      fileio.opendirSync(dpath);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_dir_open_close_sync_001 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_dir_open_close_async_000
   * @tc.number SUB_DF_FILEIO_OPEN_CLOSEDIR_ASYNC_0000
   * @tc.desc   Test opendirAsync() and Dir.closeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_dir_open_close_async_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_open_close_async_000') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let dd = await fileio.opendir(dpath);
      expect(dd !== null).assertTrue();
      expect(dd.closeSync() == null).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_dir_open_close_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_dir_open_close_async_001
   * @tc.number SUB_DF_FILEIO_OPEN_CLOSEDIR_ASYNC_0010
   * @tc.desc   Test opendirAsync() and Dir.closeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_dir_open_close_async_001', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_open_close_async_001') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      fileio.opendir(dpath, function (error, dd) {
        expect(dd !== null).assertTrue();
        expect(dd.closeSync() == null).assertTrue();
        expect(fileio.rmdirSync(dpath) == null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileio_dir_open_close_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_opendir_empty_string_000
   * @tc.number SUB_DF_FILEIO_OPENDIR_EMPTY_STRING_0000
   * @tc.desc   Test opendir() with empty string parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_opendir_empty_string_000', Level.LEVEL0, async function () {
    try {
      await fileio.opendir('');
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_opendir_empty_string_000 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_opendir_null_000
   * @tc.number SUB_DF_FILEIO_OPENDIR_NULL_0000
   * @tc.desc   Test opendir() with null parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_opendir_null_000', Level.LEVEL0, async function () {
    try {
      await fileio.opendir(null);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_opendir_null_000 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_opendir_undefined_000
   * @tc.number SUB_DF_FILEIO_OPENDIR_UNDEFINED_0000
   * @tc.desc   Test opendir() with undefined parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_opendir_undefined_000', Level.LEVEL0, async function () {
    try {
      await fileio.opendir(undefined);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_opendir_undefined_000 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_opendir_callback_empty_string_000
   * @tc.number SUB_DF_FILEIO_OPENDIR_CALLBACK_EMPTY_STRING_0000
   * @tc.desc   Test opendir(callback) with empty string parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_opendir_callback_empty_string_000', Level.LEVEL0, async function (done) {
    try {
      fileio.opendir('', function (error, dd) {
        expect(error !== null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileio_opendir_callback_empty_string_000 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_opendir_callback_null_000
   * @tc.number SUB_DF_FILEIO_OPENDIR_CALLBACK_NULL_0000
   * @tc.desc   Test opendir(callback) with null parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_opendir_callback_null_000', Level.LEVEL0, async function (done) {
    try {
      fileio.opendir(null, function (error, dd) {
        if (error) {
          console.log('fileio_opendir_callback_null_000 err: ' + error);
          expect(error.message == 'Invalid path').assertTrue();
          done();
        }
        expect(null).assertFail();
        done();
      });
    } catch (e) {
      console.log('fileio_opendir_callback_null_000 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_opendir_callback_undefined_000
   * @tc.number SUB_DF_FILEIO_OPENDIR_CALLBACK_UNDEFINED_0000
   * @tc.desc   Test opendir(callback) with undefined parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_opendir_callback_undefined_000', Level.LEVEL0, async function (done) {
    try {
      fileio.opendir(undefined, function (error, dd) {
        if (error) {
          console.log('fileio_opendir_callback_undefined_000 err: ' + error);
          expect(error.message == 'Invalid path').assertTrue();
          done();
        }
        expect(null).assertFail();
        done();
      });
    } catch (e) {
      console.log('fileio_opendir_callback_undefined_000 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_opendirSync_empty_string_000
   * @tc.number SUB_DF_FILEIO_OPENDIRSYNC_EMPTY_STRING_0000
   * @tc.desc   Test opendirSync() with empty string parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_opendirSync_empty_string_000', Level.LEVEL0, async function () {
    try {
      fileio.opendirSync('');
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_opendirSync_empty_string_000 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_opendirSync_null_000
   * @tc.number SUB_DF_FILEIO_OPENDIRSYNC_NULL_0000
   * @tc.desc   Test opendirSync() with null parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_opendirSync_null_000', Level.LEVEL0, async function () {
    try {
      fileio.opendirSync(null);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_opendirSync_null_000 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_opendirSync_undefined_000
   * @tc.number SUB_DF_FILEIO_OPENDIRSYNC_UNDEFINED_0000
   * @tc.desc   Test opendirSync() with undefined parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_opendirSync_undefined_000', Level.LEVEL0, async function () {
    try {
      fileio.opendirSync(undefined);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_opendirSync_undefined_000 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });
});
}
