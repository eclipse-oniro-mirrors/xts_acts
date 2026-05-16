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

import featureAbility from '@ohos.ability.featureAbility';
import {
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect,
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIOSymlink() {
describe('fileIO_fs_symlink', function () {

  /**
   * @tc.name   fileIO_test_symlink_sync_000
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_0000
   * @tc.desc   Test symlinkSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_symlink_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlinkSync(fpath, fpath + 'link0');
      expect(true).assertTrue();
    } catch (e) {
      console.log('fileIO_test_symlink_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Permission denied').assertTrue();
      fileIO.unlinkSync(fpath);
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_sync_001
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_0100
   * @tc.desc   Test symlinkSync() interface. Test first parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_symlink_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlinkSync(null, fpath + 'link');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_symlink_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_sync_002
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_0200
   * @tc.desc   Test symlinkSync() interface. Test first parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_sync_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_symlink_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlinkSync(undefined, fpath + 'link');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_symlink_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_sync_003
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_0300
   * @tc.desc   Test symlinkSync() interface. Test second parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_sync_003', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_symlink_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlinkSync(fpath, null);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_symlink_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name     fileIO_test_symlink_sync_004
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_0400
   * @tc.desc   Test symlinkSync() interface. Test second parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_sync_004', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_symlink_sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlinkSync(fpath, undefined);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_symlink_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_async_001
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0100
   * @tc.desc   Test SymlinkAsync interfaces. await Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.symlink(fpath, fpath + 'link2');
      expect(true).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_symlink_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Permission denied').assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_async_002
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0200
   * @tc.desc   Test SymlinkAsync interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlink(fpath,  fpath + 'link3', (err) => {
        if (err) {
          fileIO.unlinkSync(fpath);
          console.log('fileIO_test_symlink_async_002 error: message: ' + err.message );
          expect(err.message == 'Permission denied').assertTrue();
          done();
        }
        expect(true).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_test_symlink_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_async_003
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0300
   * @tc.desc   Test symlink() interface. Promise. Test first parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.symlink(null, fpath + 'link');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_symlink_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_async_004
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0400
   * @tc.desc   Test symlink() interface. Promise. Test first parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_async_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.symlink(undefined, fpath + 'link');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_symlink_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_async_005
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0500
   * @tc.desc   Test symlink() interface. Promise. Test second parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
   it('fileIO_test_symlink_async_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.symlink(fpath, null);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_symlink_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_async_006
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0600
   * @tc.desc   Test symlink() interface. Promise. Test second parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_async_006', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.symlink(fpath, undefined);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_symlink_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_async_007
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0700
   * @tc.desc   Test symlink() interface. Callback. Test first parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_async_007', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlink(null, fpath + 'link', (err) => {
        if (err) {
          console.log('fileIO_test_symlink_async_007 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_test_symlink_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_async_008
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0800
   * @tc.desc   Test symlink() interface. Callback. Test first parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_async_008', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlink(undefined, fpath + 'link', (err) => {
        if (err) {
          console.log('fileIO_test_symlink_async_008 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_test_symlink_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_async_009
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0900
   * @tc.desc   Test symlink() interface. Callback. Test second parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_async_009', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlink(fpath, null, (err) => {
        if (err) {
          console.log('fileIO_test_symlink_async_009 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_test_symlink_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_symlink_async_010
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_1000
   * @tc.desc   Test symlink() interface. Callback. Test second parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_symlink_async_010', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlink(fpath, undefined, (err) => {
        if (err) {
          console.log('fileIO_test_symlink_async_010 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_test_symlink_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
});
}
