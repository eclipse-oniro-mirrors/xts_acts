/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum, describe, it, expect,
} from '../Common';
import { TestType, Size, Level } from '@ohos/hypium';

  export default function fileIOTruncate() {
  describe('fileIO_fs_truncate', function () {

  /**
   * @tc.name   fileIO_truncate_async_000
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0000
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let truncateLen = 5;

    try {
      await fileIO.truncate(fpath, truncateLen);
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == truncateLen).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_truncate_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_001
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0100
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let truncateLen = 5;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncate(file.fd, truncateLen, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == truncateLen).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_truncate_async_001 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_002
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0200
   * @tc.desc   Test the truncate() interface. Promise.then().catch
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_002');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let truncateLen = 2;

    try {
      fileIO.truncate(fpath, truncateLen).then(() => {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == truncateLen).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      }).catch((err) => {
        console.log('fileIO_truncate_async_002 error package: ' + JSON.stringify(err));
        expect(false).assertTrue();
      });
    } catch(e) {
      console.log('fileIO_truncate_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_003
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0300
   * @tc.desc   Test the truncate() interface. Promise.then().catch
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_003');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let truncateLen = 2;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncate(file.fd, truncateLen).then(() => {
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == truncateLen).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      }).catch((err) => {
        console.log('fileIO_truncate_async_003 error package: ' + JSON.stringify(err));
        expect(false).assertTrue();
      });
    } catch(e) {
      console.log('fileIO_truncate_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_004
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0400
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_004');
    let truncateLen = 2;

    try {
      fileIO.truncate(fpath, truncateLen, (err) => {
        if (err) {
          console.log('fileIO_truncate_async_004 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_005
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0500
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_005');
    let truncateLen = 2;

    try {
      await fileIO.truncate(fpath, truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_truncate_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_006
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0600
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncate(file.fd, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_006 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_truncate_async_006 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_007
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0700
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.truncate(fpath, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_007 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_truncate_async_008 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_008
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0800
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_truncate_async_008', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.truncate(fpath, undefined);
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_truncate_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_009
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0900
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_truncate_async_009', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_009');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncate(file.fd, undefined, (err) => {
        if (err) {
          console.log('fileIO_truncate_async_009 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch(e) {
      console.log('fileIO_truncate_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_010
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1000
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let truncateLen = 5;
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      fileIO.closeSync(file.fd);
      await fileIO.truncate(file.fd, truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_truncate_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900008 && e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_011
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1100
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let truncateLen = 5;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.closeSync(file.fd);
      fileIO.truncate(file.fd, truncateLen, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_011 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code === 13900008 && err.message == 'Bad file descriptor').assertTrue();
          fileIO.unlinkSync(fpath);
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_011 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_012
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1200
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_012');
    fileIO.mkdirSync(fpath);

    try {
      await fileIO.truncate(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_truncate_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900019 && e.message == 'Is a directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_013
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1300
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_013');
    fileIO.mkdirSync(fpath);

    try {
      fileIO.truncate(fpath, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_013 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code === 13900019 && err.message == 'Is a directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_013 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_014
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1400
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.truncate();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_truncate_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_015
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1500
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.truncate((err) => {
        if(err) {
          console.log('fileIO_truncate_async_015 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_015 has failed for '  + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_016
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1600
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let truncateLen = 2;
    try {
      await fileIO.truncate(null, truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_truncate_async_016 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_017
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1700
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let truncateLen = 2;
    try {
      await fileIO.truncate(undefined, truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_truncate_async_017 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_018
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1800
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_018');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    try {
      await fileIO.truncate(file.fd, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_truncate_async_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_019
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1900
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_019');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    try {
      await fileIO.truncate(file.fd, undefined);
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_truncate_async_019 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_020
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_2000
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_020');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let truncateLen = 5;
    try {
      await fileIO.truncate(file.fd, truncateLen);
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == truncateLen).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_truncate_async_020 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_021
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_2100
   * @tc.desc   Test the truncate() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let truncateLen = 5;
    try {
      await fileIO.truncate("", truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_truncate_async_021 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_022
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_2200
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    try {
      fileIO.truncate(null, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_022 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_022 has failed for '  + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_023
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_2300
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    try {
      fileIO.truncate(undefined, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_023 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_023 has failed for '  + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_024
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_2400
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    try {
      fileIO.truncate("", (err) => {
        if(err) {
          console.log('fileIO_truncate_async_024 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_024 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_025
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_2500
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_025');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      fileIO.truncate(file.fd, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_025 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_truncate_async_025 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_026
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_2600
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let truncateLen = 5;
    try {
      fileIO.truncate(null, truncateLen, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_026 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_026 has failed for '  + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_027
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_2700
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let truncateLen = 5;
    try {
      fileIO.truncate(undefined, truncateLen, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_027 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_027 has failed for '  + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_028
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_2800
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_025');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    try {
      fileIO.truncate(file.fd, null, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_028 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_028 has failed for '  + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_029
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_2900
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_029');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    try {
      fileIO.truncate(file.fd, undefined, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_029 error: {message: ' + err.message + ', code: ' + err.code + '}');
          done();
        }
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_truncate_async_029 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_030
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_3000
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_030');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let truncateLen = 5;
    try {
      fileIO.truncate(fpath, truncateLen, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_030 error: {message: ' + err.message + ', code: ' + err.code + '}');
          done();
        }
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == truncateLen).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_truncate_async_030 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_031
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_3100
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let truncateLen = 5;
    try {
      fileIO.truncate("", truncateLen, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_031 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_031 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_truncate_async_032
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_3200
   * @tc.desc   Test the truncate() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_truncate_async_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_032');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let truncateLen = 5;
    try {
      fileIO.truncate(file.fd, truncateLen, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_032 error: {message: ' + err.message + ', code: ' + err.code + '}');
          done();
        }
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == truncateLen).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_truncate_async_032 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_000
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0000
   * @tc.desc   Test the truncateSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.truncateSync(fpath);
      expect(fileIO.statSync(fpath).size == 0).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_truncate_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_001
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0100
   * @tc.desc   Test the truncateSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let truncateLen = 5;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncateSync(file.fd, truncateLen);
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == truncateLen).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_truncate_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_002
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0200
   * @tc.desc   Test the truncateSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_002');

    try {
      fileIO.truncateSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_003
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0300
   * @tc.desc   Test the truncateSync() interface. Invalid parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let truncateLen = 2;

    try {
      fileIO.truncateSync(-1, truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_004
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0400
   * @tc.desc   Test truncateSync() interfaces. Missing parameters.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {

    try {
      fileIO.truncateSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_005
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0500
   * @tc.desc   Test truncateSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_truncate_sync_005', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncateSync(file.fd, undefined);
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_truncate_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_006
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0600
   * @tc.desc   Test the truncateSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let truncateLen = 5;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.closeSync(file.fd);
      fileIO.truncateSync(file.fd, truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_007
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0700
   * @tc.desc   Test the truncateSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_007');
    fileIO.mkdirSync(fpath);

    try {
      fileIO.truncateSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900019 && e.message == 'Is a directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_008
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0800
   * @tc.desc   Test the truncateSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let truncateLen = 5;
    try {
      fileIO.truncateSync(null, truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_009
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0900
   * @tc.desc   Test the truncateSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let truncateLen = 5;
    try {
      fileIO.truncateSync(undefined, truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_010
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_1000
   * @tc.desc   Test the truncateSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let truncateLen = 5;
    try {
      fileIO.truncateSync("", truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_011
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_1100
   * @tc.desc   Test the truncateSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    try {
      fileIO.truncateSync(file.fd, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_truncate_sync_012
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_1200
   * @tc.desc   Test the truncateSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_truncate_sync_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    try {
      fileIO.truncateSync(file.fd, undefined);
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_truncate_sync_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
})
}
