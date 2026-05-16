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

export default function fileioOpen() {
describe('fileio_open', function () {

  /**
   * @tc.name   fileio_test_open_sync_000
   * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0000
   * @tc.desc   Test openSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_sync_000', Level.LEVEL0, function () {
    try {
      fileio.openSync('/', 0o102, 0o666);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_open_sync_000 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_test_open_async_000
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0000
   * @tc.desc   Test openASync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.access(fpath).then(function (err) {
        fileio.open(fpath, 0, 0o0400, function (err, fd) {
          fileio.read(fd, new ArrayBuffer(4096))
            .then(function (res) {
              expect(res.bytesRead == FILE_CONTENT.length).assertTrue();
              fileio.closeSync(fd);
              fileio.unlinkSync(fpath);
              done();
            });
        });
      });
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_001
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0100
   * @tc.desc   Test openASync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.open(fpath, 0, 0o0400, function (err, fd) {
        fileio.read(fd, new ArrayBuffer(4096))
          .then(function (res) {
            expect(res.bytesRead == FILE_CONTENT.length).assertTrue();
            fileio.closeSync(fd);
            fileio.unlinkSync(fpath);
            done();
          });
      });
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_002
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0200
   * @tc.desc   Test openASync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.open(fpath, 0, function (err, fd) {
        fileio.read(fd, new ArrayBuffer(4096))
          .then(function (res) {
            expect(res.bytesRead == FILE_CONTENT.length).assertTrue();
            fileio.closeSync(fd);
            fileio.unlinkSync(fpath);
            done();
          });
      });
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_003
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0300
   * @tc.desc   Test openASync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.open(fpath, 0o2, function (err, fd) {
        fileio.read(fd, new ArrayBuffer(4096))
          .then(function (res) {
            expect(res.bytesRead == FILE_CONTENT.length).assertTrue();
            fileio.closeSync(fd);
            fileio.unlinkSync(fpath);
            done();
          });
      });
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_004
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0400
   * @tc.desc   Test openASync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_async_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.open(fpath)
        .then(function (fd) {
          fileio.read(fd, new ArrayBuffer(4096))
            .then(function (res) {
              expect(res.bytesRead == FILE_CONTENT.length).assertTrue();
              fileio.closeSync(fd);
              fileio.unlinkSync(fpath);
            });
        })
        .catch(function (err) {
          expect(err == null).assertTrue();
        })
      done();
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_005
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0500
   * @tc.desc   Test openASync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_async_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      await fileio.open(fpath, 0o0)
        .then(function (fd) {
          fileio.read(fd, new ArrayBuffer(4096))
            .then(function (res) {
              expect(res.bytesRead == FILE_CONTENT.length).assertTrue();
              fileio.closeSync(fd);
              fileio.unlinkSync(fpath);
            })
        })
        .catch(function (err) {
          expect(err == null).assertTrue();
        })
      done();
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_006
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0600
   * @tc.desc   Test openASync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_async_006', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      await fileio.open(fpath, 0o2, 0o0200)
        .then(function (fd) {
          fileio.read(fd, new ArrayBuffer(4096))
            .then(function (res) {
              expect(res.bytesRead == FILE_CONTENT.length).assertTrue();
              fileio.closeSync(fd);
              fileio.unlinkSync(fpath);
            });
        })
        .catch(function (err) {
          expect(err == null).assertTrue();
        })
      done();
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_007
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0700
   * @tc.desc   Test openASync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_async_007', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_007');
    try {
      fileio.open(fpath, 0o0101, 0o0222, function (err, fd) {
        expect(fd !== null).assertTrue();
        fileio.writeSync(fd, FILE_CONTENT, {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(fileio.closeSync(fd) !== null).assertTrue();
        expect(fileio.unlinkSync(fpath) !== null).assertTrue();
        done();
      });
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_008
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0800
   * @tc.desc   Test openASync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_async_008', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_008');
    try {
      fileio.open(fpath, 0o100, 0o0444, function (err, fd) {
        expect(fd !== null).assertTrue();
        expect(fileio.closeSync(fd) !== null).assertTrue();
        expect(fileio.unlinkSync(fpath) !== null).assertTrue();
        done();
      });
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_009
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0900
   * @tc.desc   Test openASync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_async_009', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_009');
    try {
      fileio.open(fpath, 0o2101, 0o0222, function (err, fd) {
        expect(fd !== null).assertTrue();
        let wri = fileio.writeSync(fd, 'hello1', {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(wri !== null).assertTrue();
        let writ = fileio.writeSync(fd, 'hello2', {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(writ !== null).assertTrue();
        expect(fileio.closeSync(fd) !== null).assertTrue();
        expect(fileio.unlinkSync(fpath) !== null).assertTrue();
        done();
      });
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_010
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1000
   * @tc.desc   Test open() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_010', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.open(fpath, undefined, undefined, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_010 error: ' + e);
          expect(false).assertTrue();
        }
        expect(isIntNum(fd)).assertTrue();
        let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
        expect(readLen == FILE_CONTENT.length).assertTrue();
        fileio.write(fd, FILE_CONTENT, (err, bytesWritten) => {
          if (err) {
            fileio.closeSync(fd);
            fileio.unlinkSync(fpath);
            console.log('fileIO_test_open_async_010 error package: ' + err);
            expect(err.message == 'Bad file descriptor').assertTrue();
            done();
          } else {
            expect(false).assertTrue();
          }
        });
      });
    } catch (e) {
      console.log('fileio_test_open_async_010 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_011
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1100
   * @tc.desc   Test open() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_011', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let fd;

    try {
      fd = await fileio.open(fpath, undefined, undefined);
      expect(isIntNum(fd)).assertTrue();
      let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(readLen == FILE_CONTENT.length).assertTrue();
      fileio.writeSync(fd, FILE_CONTENT);
      expect(false).assertTrue();
    } catch (e) {
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      console.log('fileio_test_open_async_011 has failed for' + e);
      expect(e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_012
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1200
   * @tc.desc   Test openASync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_open_async_012', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.open(fpath, (err, fd) => {
        expect(fd !== null).assertTrue();
        expect(fileio.closeSync(fd) !== null).assertTrue();
        expect(fileio.unlinkSync(fpath) !== null).assertTrue();
        done();
      });
    } catch (e) {
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_035
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_3500
   * @tc.desc   Test open(path, callback) interface. The first parameter is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_open_async_035', Level.LEVEL2, async function (done) {
    try {
      fileio.open('', (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_035 error: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_035 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_036
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_3600
   * @tc.desc   Test open(path, callback) interface. The first parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_open_async_036', Level.LEVEL2, async function (done) {
    try {
      fileio.open(null, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_036 error: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid path').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_036 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_037
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_3700
   * @tc.desc   Test open(path, callback) interface. The first parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileio_test_open_async_037', Level.LEVEL2, async function (done) {
    try {
      fileio.open(undefined, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_037 error: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid path').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_037 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_013
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1300
   * @tc.desc   Test open() interfaces. The first parameter is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_013', Level.LEVEL3, async function (done) {
    try {
      await fileio.open('', 0o2, 0o0200);
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_open_async_013 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_014
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1400
   * @tc.desc   Test open() interfaces. The first parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MmediumTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_014', Level.LEVEL3, async function (done) {
    try {
      await fileio.open(null, 0o2, 0o0200);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_open_async_014 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_015
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1500
   * @tc.desc   Test open() interfaces. The first parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_015', Level.LEVEL3, async function (done) {
    try {
      await fileio.open(undefined, 0o2, 0o0200);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_open_async_015 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_016
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1600
   * @tc.desc   Test open() interfaces. The second parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_016', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_016');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = await fileio.open(fpath, null, 0o0200);
      expect(isIntNum(fd)).assertTrue();
      fileio.closeSync(fd);
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_open_async_016 has failed for ' + e);
      expect(e.message == 'Invalid flags').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_017
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1700
   * @tc.desc   Test open() interfaces. The second parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_017', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_017');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = await fileio.open(fpath, undefined, 0o0200);
      expect(isIntNum(fd)).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_open_async_017 has failed for ' + e);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_018
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1800
   * @tc.desc   Test open() interfaces. The third parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_018', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_018');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      await fileio.open(fpath, 0o2, null);
      expect(false).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_open_async_018 has failed for ' + e);
      expect(e.message == 'Invalid mode').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_019
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1900
   * @tc.desc   Test open() interfaces. The third parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_019', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_019');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = await fileio.open(fpath, 0o2, undefined);
      expect(isIntNum(fd)).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_open_async_019 has failed for ' + e);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_020
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2000
   * @tc.desc   Test open(path, callback) interfaces. The first parameter is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_020', Level.LEVEL3, async function (done) {
    try {
      fileio.open('', (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_020 error: ' + err);
          expect(err !== null).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_020 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_021
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2100
   * @tc.desc   Test open(path, callback) interfaces. The first parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_021', Level.LEVEL3, async function (done) {
    try {
      fileio.open(null, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_021 error: ' + err);
          expect(err.message == 'Invalid path').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_021 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_022
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2200
   * @tc.desc   Test open(path, callback) interfaces. The first parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_022', Level.LEVEL3, async function (done) {
    try {
      fileio.open(undefined, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_022 error: ' + err);
          expect(err !== null).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_022 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_023
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2300
   * @tc.desc   Test open(path, flags, callback) interfaces. The first parameter is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_023', Level.LEVEL3, async function (done) {
    try {
      fileio.open('', 0o2, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_023 error: ' + err);
          expect(err.message == 'No such file or directory').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_023 has failed for ' + e);
      expect(e !== null).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_024
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2400
   * @tc.desc   Test open(path, flags, callback) interfaces. The first parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_024', Level.LEVEL3, async function (done) {
    try {
      fileio.open(null, 0o2, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_024 error: ' + err);
          expect(err !== null).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_024 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_025
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2500
   * @tc.desc   Test open(path, flags, callback) interfaces. The first parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_025', Level.LEVEL3, async function (done) {
    try {
      fileio.open(undefined, 0o2, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_025 error: ' + err);
          expect(err !== null).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_025 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_026
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2600
   * @tc.desc   Test open(path, flags, callback) interfaces. The second parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_026', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_026');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.open(fpath, null, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_026 error: ' + err);
          expect(err.message == 'Invalid flags').assertTrue();
          fileio.unlinkSync(fpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_026 has failed for ' + e);
      expect(e.message == 'Invalid flags').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_027
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2700
   * @tc.desc   Test open(path, flags, callback) interfaces. The second parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_027', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_027');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.open(fpath, undefined, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_027 error: ' + err);
          expect(false).assertTrue();
        } else {
          expect(isIntNum(fd)).assertTrue();
          fileio.closeSync(fd);
          fileio.unlinkSync(fpath);
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_027 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_028
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2800
   * @tc.desc   Test open(path, flags, mode, callback) interfaces. The first parameter is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_028', Level.LEVEL3, async function (done) {
    try {
      fileio.open('', 0o2, 0o0200, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_028 error: ' + err);
          expect(err.message == 'No such file or directory').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_028 has failed for ' + e);
      expect(e !== null).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_029
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2900
   * @tc.desc   Test open(path, flags, mode, callback) interfaces. The first parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_029', Level.LEVEL3, async function (done) {
    try {
      fileio.open(null, 0o2, 0o0200, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_029 error: ' + err);
          expect(err !== null).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_029 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_030
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_3000
   * @tc.desc   Test open(path, flags, mode, callback) interfaces. The first parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_030', Level.LEVEL3, async function (done) {
    try {
      fileio.open(undefined, 0o2, 0o0200, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_030 error: ' + err);
          expect(err !== null).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_030 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_031
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_3100
   * @tc.desc   Test open(path, flags, mode, callback) interfaces. The second parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_031', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_031');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.open(fpath, null, 0o0200, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_031 error: ' + err);
          expect(false).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_031 has failed for ' + e);
      expect(e.message == 'Invalid flags').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_032
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_3200
   * @tc.desc   Test open(path, flags, mode, callback) interfaces. The second parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
     @tc.level  LEVEL3
   */
  it('fileio_test_open_async_032', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_032');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.open(fpath, undefined, 0o0200, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_032 error: ' + err);
          expect(false).assertTrue();
        } else {
          expect(isIntNum(fd)).assertTrue();
          fileio.closeSync(fd);
          fileio.unlinkSync(fpath);
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_032 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_033
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_3300
   * @tc.desc   Test open(path, flags, mode, callback) interfaces. The third parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_033', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_033');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.open(fpath, 0o2, null, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_033 error: ' + err);
          expect(false).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_033 has failed for ' + e);
      expect(e.message == 'Invalid mode').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.name   fileio_test_open_async_034
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_3400
   * @tc.desc   Test open(path, flags, mode, callback) interfaces. The third parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_async_034', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_open_async_034');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.open(fpath, 0o2, undefined, (err, fd) => {
        if (err) {
          console.log('fileio_test_open_async_034 error: ' + err);
          expect(false).assertTrue();
        } else {
          expect(isIntNum(fd)).assertTrue();
          fileio.closeSync(fd);
          fileio.unlinkSync(fpath);
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_open_async_034 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_open_sync_001
   * @tc.number SUB_DF_FILEIO_TEST_OPEN_SYNC_0100
   * @tc.desc   Test openSync() interfaces. The first parameter is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_sync_001', Level.LEVEL3, function () {
    try {
      fileio.openSync('', 0o2, 0o0200);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_open_sync_001 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_open_sync_002
   * @tc.number SUB_DF_FILEIO_TEST_OPEN_SYNC_0200
   * @tc.desc   Test openSync() interfaces. The first parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_sync_002', Level.LEVEL3, function () {
    try {
      fileio.openSync(null, 0o2, 0o0200);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_open_sync_002 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_open_sync_003
   * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0300
   * @tc.desc   Test openSync() interfaces. The first parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_sync_003', Level.LEVEL3, function () {
    try {
      fileio.openSync(undefined, 0o2, 0o0200);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_open_sync_003 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_open_sync_004
   * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0400
   * @tc.desc   Test openSync() interfaces. The third parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_sync_004', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_open_sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.openSync(fpath, 0o2, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_open_sync_004 has failed for ' + e);
      fileio.unlinkSync(fpath);
      expect(e.message == 'Invalid mode').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_open_sync_005
   * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0500
   * @tc.desc   Test openSync() interfaces. The third parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_open_sync_005', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_open_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = fileio.openSync(fpath, 0o2, undefined);
      expect(isIntNum(fd)).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_open_sync_005 has failed for ' + e);
      expect(false).assertTrue();
    }
  });
  });
}
