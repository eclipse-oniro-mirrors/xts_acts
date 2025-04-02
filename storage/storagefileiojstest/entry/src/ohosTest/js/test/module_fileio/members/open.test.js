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

export default function fileioOpen() {
describe('fileio_open', function () {

  /**
   * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0000
   * @tc.name fileio_test_open_sync_000
   * @tc.desc Test openSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_open_sync_000', 0, function () {
    try {
      fileio.openSync('/', 0o102, 0o666);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_open_sync_000 has failed for ' + e);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0000
   * @tc.name fileio_test_open_async_000
   * @tc.desc Test openASync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_open_async_000', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0100
   * @tc.name fileio_test_open_async_001
   * @tc.desc Test openASync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_open_async_001', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0200
   * @tc.name fileio_test_open_async_002
   * @tc.desc Test openASync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_open_async_002', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0300
   * @tc.name fileio_test_open_async_003
   * @tc.desc Test openASync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_open_async_003', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0400
   * @tc.name fileio_test_open_async_004
   * @tc.desc Test openASync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_open_async_004', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0500
   * @tc.name fileio_test_open_async_005
   * @tc.desc Test openASync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_open_async_005', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0600
   * @tc.name fileio_test_open_async_006
   * @tc.desc Test openASync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_open_async_006', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0700
   * @tc.name fileio_test_open_async_007
   * @tc.desc Test openASync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_open_async_007', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0800
   * @tc.name fileio_test_open_async_008
   * @tc.desc Test openASync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_open_async_008', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0900
   * @tc.name fileio_test_open_async_009
   * @tc.desc Test openASync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_open_async_009', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1000
   * @tc.name fileio_test_open_async_010
   * @tc.desc Test open() interfaces.
   * Use default: flag = O_RDONLY, mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_open_async_010', 3, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1100
   * @tc.name fileio_test_open_async_011
   * @tc.desc Test open() interfaces.
   * Use default: flag = O_RDONLY, mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_open_async_011', 3, async function (done) {
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
});
}
