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

export default function fileioRead() {
describe('fileio_read', function () {

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0000
   * @tc.name fileio_test_read_sync_000
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_read_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let len = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(len == FILE_CONTENT.length).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_read_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0100
   * @tc.name fileio_test_read_sync_001
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_sync_001', Level.LEVEL0, async function () {
    let bufLen = 5;
    expect(FILE_CONTENT.length > bufLen).assertTrue();
    let fpath = await nextFileName('fileio_test_read_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let len = fileio.readSync(fd, new ArrayBuffer(bufLen), {
        offset: 1,
      });
      expect(len == bufLen - 1).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_read_sync_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0200
   * @tc.name fileio_test_read_sync_002
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_sync_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_read_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let len = fileio.readSync(fd, new ArrayBuffer(4096), {
        length: 1,
      });
      expect(len == 1).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_read_sync_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0300
   * @tc.name fileio_test_read_sync_003
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_sync_003', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_read_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let len = fileio.readSync(fd, new ArrayBuffer(4096), {
        position: 1,
      });
      expect(len == FILE_CONTENT.length - 1).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_read_sync_003 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0400
   * @tc.name fileio_test_read_sync_004
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_sync_004', Level.LEVEL0, async function () {
    let fd;
    const invalidOffset = 99999;
    let fpath = await nextFileName('fileio_test_read_sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      fileio.readSync(fd, new ArrayBuffer(4096), {
        offset: invalidOffset,
      });
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0500
   * @tc.name fileio_test_read_sync_005
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_sync_005', Level.LEVEL0, async function () {
    let fd;
    const invalidLength = 9999;
    let fpath = await nextFileName('fileio_test_read_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      fileio.readSync(fd, new ArrayBuffer(4096), {
        length: invalidLength,
      });
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });
  
  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0600
   * @tc.name fileio_test_read_sync_006
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_sync_006', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_read_sync_006');
    let fd;

    try {
      fileio.readSync(-1, new ArrayBuffer(4096));
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_read_sync_006 has failed for ' + e);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0700
   * @tc.name fileio_test_read_sync_007
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_sync_007', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_read_sync_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let len = fileio.readSync(fd, new ArrayBuffer(4096), {
        position: 1,
      });
      expect(len == FILE_CONTENT.length - 1).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_read_sync_007 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0800
   * @tc.name fileio_test_read_sync_008
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_sync_008', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_read_sync_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let invalidPos = FILE_CONTENT.length + 1;
      let len = fileio.readSync(fd, new ArrayBuffer(4096), {
        position: invalidPos,
      });
      expect(len == 0).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_read_sync_008 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0900
   * @tc.name fileio_test_read_sync_009
   * @tc.desc Test readSync() interfaces.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_read_sync_009', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_read_sync_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let readLen1 = fileio.readSync(fd, new ArrayBuffer(16), undefined);
      expect(readLen1 == FILE_CONTENT.length).assertTrue();
      let readLen2 = fileio.readSync(fd, new ArrayBuffer(8), undefined);
      expect(readLen2 == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_read_sync_009 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_1000
   * @tc.name fileio_test_read_sync_010
   * @tc.desc Test readSync() interfaces.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_read_sync_010', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_read_sync_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let readLen1 = fileio.readSync(fd, new ArrayBuffer(16), {
        offset: undefined,
        position: undefined,
        length: undefined,
      });
      expect(readLen1 == FILE_CONTENT.length).assertTrue();
      let readLen2 = fileio.readSync(fd, new ArrayBuffer(8), {
        offset: undefined,
        position: undefined,
        length: undefined,
      });
      expect(readLen2 == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_read_sync_010 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0000
   * @tc.name fileio_test_read_async_000
   * @tc.desc Test read() interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let res = await fileio.read(fd, new ArrayBuffer(4096));
      expect(res.bytesRead == FILE_CONTENT.length).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_read_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0100
   * @tc.name fileio_test_read_async_001
   * @tc.desc Test read() interfaces. Callback.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      fileio.read(fd, new ArrayBuffer(4096), async function (err, data) {
        expect(data.bytesRead == FILE_CONTENT.length).assertTrue();
        expect(fileio.closeSync(fd) == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileio_test_read_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0200
   * @tc.name fileio_test_read_async_002
   * @tc.desc Test read() interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      let readout = await fileio.read(fd, new ArrayBuffer(4096));
      expect(readout.buffer.byteLength == 4096).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_read_async_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0300
   * @tc.name fileio_test_read_async_003
   * @tc.desc Test read() interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      let readout = await fileio.read(fd, new ArrayBuffer(4096), {
        offset: 1,
      });
      expect(readout.bytesRead == FILE_CONTENT.length).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_read_async_003 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0400
   * @tc.name fileio_test_read_async_004
   * @tc.desc Test read() interface. Promise.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_async_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      let readout = await fileio.read(fd, new ArrayBuffer(4096), {
        offset: 1,
        length: 3,
      });
      expect(readout.bytesRead == 3).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_read_async_004 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0500
   * @tc.name fileio_test_read_async_005
   * @tc.desc Test read() interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_async_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      let readout = await fileio.read(fd, new ArrayBuffer(5), {
        offset: 1,
      });
      expect(readout.bytesRead == 4).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_read_async_005 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0600
   * @tc.name fileio_test_read_async_006
   * @tc.desc Test read() interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_async_006', Level.LEVEL0, async function (done) {
    let fd;
    const invalidOffset = 999;
    let fpath = await nextFileName('fileio_test_read_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      await fileio.read(fd, new ArrayBuffer(4096), {
        offset: invalidOffset,
      });
      throw new Error('invalid offset');
    } catch (e) {
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0700
   * @tc.name fileio_test_read_async_007
   * @tc.desc Test read() interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_async_007', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let fd;

    try {
      fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let invalidPos = FILE_CONTENT.length + 1;
      let err = await fileio.read(fd, new ArrayBuffer(4096), {
        offset: 1,
        position: invalidPos,
      });
      expect(!!err).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_read_async_007 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0800
   * @tc.name fileio_test_read_async_008
   * @tc.desc Test read() interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_async_008', Level.LEVEL0, async function (done) {
    try {
      await fileio.read(-1, new ArrayBuffer(4096));
      expect(null).assertFail();
    } catch (e) {
      console.info('fileio_test_read_async_008 has failed for ' + e);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0900
   * @tc.name fileio_test_read_async_009
   * @tc.desc Test read() interfaces. Promise.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_read_async_009', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let readRes1 = await fileio.read(fd, new ArrayBuffer(16), undefined);
      expect(readRes1.bytesRead == FILE_CONTENT.length).assertTrue();
      expect(readRes1.offset == 0).assertTrue();
      let readRes2 = await fileio.read(fd, new ArrayBuffer(8), undefined);
      expect(readRes2.bytesRead == 0).assertTrue();
      expect(readRes2.offset == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_read_async_009 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_1000
   * @tc.name fileio_test_read_async_010
   * @tc.desc Test read() interfaces. Callback.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_read_async_010', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      fileio.read(fd, new ArrayBuffer(16), undefined, (err, readRes1) => {
        if(err) {
          console.log('fileio_test_read_async_010 err package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(readRes1.bytesRead == FILE_CONTENT.length).assertTrue();
        expect(readRes1.offset == 0).assertTrue();
        fileio.read(fd, new ArrayBuffer(8), undefined, (err, readRes2) => {
          if(err) {
            console.log('fileio_test_read_async_010 err package2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(readRes2.bytesRead == 0).assertTrue();
          expect(readRes2.offset == 0).assertTrue();
          fileio.closeSync(fd);
          fileio.unlinkSync(fpath);
          done();
        });
      });
    } catch (e) {
      console.log('fileio_test_read_async_010 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_1100
   * @tc.name fileio_test_read_async_011
   * @tc.desc Test read() interfaces. Promise.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_read_async_011', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let readRes1 = await fileio.read(fd, new ArrayBuffer(4096), {
        offset: undefined,
        length: undefined,
      });
      expect(readRes1.bytesRead == FILE_CONTENT.length).assertTrue();
      expect(readRes1.offset == 0).assertTrue();
      let readRes2 = await fileio.read(fd, new ArrayBuffer(4096), {
        offset: undefined,
        length: undefined,
      });
      expect(readRes2.bytesRead == 0).assertTrue();
      expect(readRes2.offset == 0).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_read_async_011 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_1200
   * @tc.name fileio_test_read_async_012
   * @tc.desc Test read() interfaces. Callback.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_read_async_012', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      fileio.read(fd, new ArrayBuffer(16), {
        offset: undefined,
        length: undefined,
        }, (err, readRes1) => {
          if(err) {
            console.log('fileio_test_read_async_012 err package1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(readRes1.bytesRead == FILE_CONTENT.length).assertTrue();
          expect(readRes1.offset == 0).assertTrue();
          fileio.read(fd, new ArrayBuffer(8), {
            offset: undefined,
            length: undefined,
            }, (err, readRes2) => {
            if (err) {
              console.log('fileio_test_read_async_012 err package2: ' + JSON.stringify(err));
              expect(false).assertTrue();
            }
            expect(readRes2.bytesRead == 0).assertTrue();
            expect(readRes2.offset == 0).assertTrue();
            fileio.closeSync(fd);
            fileio.unlinkSync(fpath);
            done();
        });
      });
    } catch (e) {
      console.log('fileio_test_read_async_012 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_READOUT_OFFSET_0000
   * @tc.name fileio_test_read_async_readout_offset_000
   * @tc.desc Test read() ReadOut.offset interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_read_async_readout_offset_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_read_async_readout_offset_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      let readout = await fileio.read(fd, new ArrayBuffer(4096), {
        offset: 1,
      });
      expect(readout.offset == 1).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_read_async_readout_offset_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });
});
}
