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
  fileio, FILE_CONTENT, prepareFile, nextFileName, isIntNum,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioTruncate() {
describe('fileio_truncate', function () {

  /**
   * @tc.name   fileio_truncate_async_000
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0000
   * @tc.desc   Test truncate() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_truncate_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_truncate_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let truncateLen = 5;

    try {
      fileio.truncate(fpath, truncateLen, function (err) {
        let fd = fileio.openSync(fpath, 0o2);
        expect(isIntNum(fd)).assertTrue();
        let len = fileio.readSync(fd, new ArrayBuffer(4096));
        expect(len == truncateLen).assertTrue();
        expect(fileio.closeSync(fd) == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileio_truncate_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });
  
  /**
   * @tc.name   fileio_truncate_async_001
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0100
   * @tc.desc   Test truncate() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_truncate_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_truncate_async_001');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let truncateLen = 2;

    try {
      fileio
        .truncate(fpath, truncateLen)
        .then(function (err) {
          expect(err == null).assertTrue();
          let fd = fileio.openSync(fpath, 0o2);
          expect(isIntNum(fd)).assertTrue();
          let len = fileio.readSync(fd, new ArrayBuffer(4096));
          expect(len == truncateLen).assertTrue();
          expect(fileio.closeSync(fd) == null).assertTrue();
          expect(fileio.unlinkSync(fpath) == null).assertTrue();
          done();
        })
        .catch(function (e) {
          console.log('catch ' + e);
        });
    } catch (e) {
      console.log('fileio_truncate_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_truncate_async_002
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0200
   * @tc.desc   Test truncate() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_truncate_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_truncate_async_002');
    let truncateLen = 2;

    try {
      fileio.truncate(fpath, truncateLen, function (err) {
        done();
      });
    } catch (e) {
      expect(!!e).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_truncate_async_003
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0300
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_truncate_async_003', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_truncate_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.truncate(fpath, undefined);
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_truncate_async_003 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_truncate_async_004
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0400
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_truncate_async_004', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_truncate_async_004');
    expect(prepareFile(fpath, 'truncate')).assertTrue();

    try {
      fileio.truncate(fpath, undefined, (err) => {
        if (err) {
          console.log('fileio_truncate_async_004 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let fd = fileio.openSync(fpath, 0o2);
        expect(isIntNum(fd)).assertTrue();
        let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
        done();
      });
    } catch(e) {
      console.log('fileio_truncate_async_004 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_truncate_async_005
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0500
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_truncate_async_005', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_truncate_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.truncate(fpath);
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_truncate_async_005 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_truncate_sync_000
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0000
   * @tc.desc   Test truncateSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_truncate_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_truncate_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      expect(fileio.truncateSync(fpath) == null).assertTrue();
      expect(fileio.statSync(fpath).size == 0).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_truncate_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_truncate_sync_001
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0100
   * @tc.desc   Test truncateSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_truncate_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_truncate_sync_001');

    try {
      fileio.truncateSync(fpath);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_truncate_sync_001 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_test_truncate_sync_002
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0200
   * @tc.desc   Test truncateSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_truncate_sync_002', Level.LEVEL0, function () {
    try {
      fileio.truncateSync();
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_truncate_sync_002 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_test_truncate_sync_003
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0300
   * @tc.desc   Test the truncateSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_truncate_sync_003', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_truncate_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.truncateSync(fpath, undefined);
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_truncate_sync_003 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_truncate_error_001
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_001
   * @tc.desc   Test truncate() interface with empty string path. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_001', Level.LEVEL2, async function () {
    try {
      await fileio.truncate("");
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_truncate_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_truncate_error_002
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_002
   * @tc.desc   Test truncate() interface with null path. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_002', Level.LEVEL2, async function () {
    try {
      await fileio.truncate(null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_truncate_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_truncate_error_003
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_003
   * @tc.desc   Test truncate() interface with undefined path. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_003', Level.LEVEL2, async function () {
    try {
      await fileio.truncate(undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_truncate_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_truncate_error_004
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_004
   * @tc.desc   Test truncate() interface with null len. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_004', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_truncate_error_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      await fileio.truncate(fpath, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_truncate_error_004: ' + e.message + ', code: ' + e.code);
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.name   fileio_truncate_error_005
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_005
   * @tc.desc   Test truncate() interface with undefined len. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_005', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_truncate_error_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      await fileio.truncate(fpath, undefined);
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_truncate_error_005: ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  // Test cases for truncate(path: string, callback: AsyncCallback<void>): void
  /**
   * @tc.name   fileio_truncate_error_006
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_006
   * @tc.desc   Test truncate() interface with empty string path. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_006', Level.LEVEL2, async function (done) {
    try {
      fileio.truncate("", function (err) {
        if (err) {
          console.log('fileio_truncate_error_006: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_truncate_error_006: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_truncate_error_007
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_007
   * @tc.desc   Test truncate() interface with null path. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_007', Level.LEVEL2, async function (done) {
    try {
      fileio.truncate(null, function (err) {
        if (err) {
          console.log('fileio_truncate_error_007: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid path').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_truncate_error_007: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_truncate_error_008
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_008
   * @tc.desc   Test truncate() interface with undefined path. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_008', Level.LEVEL2, async function (done) {
    try {
      fileio.truncate(undefined, function (err) {
        if (err) {
          console.log('fileio_truncate_error_008: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid path').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_truncate_error_008: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  // Test cases for truncate(path: string, len: number, callback: AsyncCallback<void>): void
  /**
   * @tc.name   fileio_truncate_error_009
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_009
   * @tc.desc   Test truncate() interface with empty string path. Callback with len.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_009', Level.LEVEL2, async function (done) {
    try {
      fileio.truncate("", 5, function (err) {
        if (err) {
          console.log('fileio_truncate_error_009: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_truncate_error_009: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_truncate_error_010
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_010
   * @tc.desc   Test truncate() interface with null path. Callback with len.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_010', Level.LEVEL2, async function (done) {
    try {
      fileio.truncate(null, 5, function (err) {
        if (err) {
          console.log('fileio_truncate_error_010: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid path').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_truncate_error_010: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_truncate_error_011
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_011
   * @tc.desc   Test truncate() interface with undefined path. Callback with len.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_011', Level.LEVEL2, async function (done) {
    try {
      fileio.truncate(undefined, 5, function (err) {
        if (err) {
          console.log('fileio_truncate_error_011: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid path').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_truncate_error_011: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_truncate_error_012
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_012
   * @tc.desc   Test truncate() interface with null len. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_012', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_truncate_error_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.truncate(fpath, null, function (err) {
        if (err) {
          console.log('fileio_truncate_error_012: ' + err.message + ', code: ' + err.code);
        }
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileio_truncate_error_012: ' + e.message + ', code: ' + e.code);
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_truncate_error_013
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ERROR_013
   * @tc.desc   Test truncate() interface with undefined len. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_error_013', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_truncate_error_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.truncate(fpath, undefined, function (err) {
        if (err) {
          console.log('fileio_truncate_error_013: ' + err.message + ', code: ' + err.code);
          expect(false).assertTrue();
        }
        let fd = fileio.openSync(fpath, 0o2);
        expect(isIntNum(fd)).assertTrue();
        let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileio_truncate_error_013: ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  // Test cases for truncateSync(path: string, len?: number): void
  /**
   * @tc.name   fileio_truncate_sync_error_001
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_ERROR_001
   * @tc.desc   Test truncateSync() interface with empty string path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_sync_error_001', Level.LEVEL2, async function () {
    try {
      fileio.truncateSync("");
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_truncate_sync_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_truncate_sync_error_002
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_ERROR_002
   * @tc.desc   Test truncateSync() interface with null path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_sync_error_002', Level.LEVEL2, async function () {
    try {
      fileio.truncateSync(null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_truncate_sync_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_truncate_sync_error_003
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_ERROR_003
   * @tc.desc   Test truncateSync() interface with undefined path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_sync_error_003', Level.LEVEL2, async function () {
    try {
      fileio.truncateSync(undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_truncate_sync_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_truncate_sync_error_004
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_ERROR_004
   * @tc.desc   Test truncateSync() interface with null len.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_sync_error_004', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_truncate_sync_error_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.truncateSync(fpath, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_truncate_sync_error_004: ' + e.message + ', code: ' + e.code);
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.name   fileio_truncate_sync_error_005
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_ERROR_005
   * @tc.desc   Test truncateSync() interface with undefined len.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_truncate_sync_error_005', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_truncate_sync_error_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.truncateSync(fpath, undefined);
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_truncate_sync_error_005: ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}
