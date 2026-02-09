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

import {
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect, randomString
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIOCopyfile() {
describe('fileIO_fs_copyfile', function () {

  /**
   * @tc.name   fileIO_copy_file_sync_000
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0000
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_copy_file_sync_000');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, fpathTarget);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
    } catch (e) {
      console.log('fileIO_copy_file_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_001
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0100
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_copy_file_sync_001');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.copyFileSync(file.fd, fpathTarget);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
    } catch (e) {
      console.log('fileIO_copy_file_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_002
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0200
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_copy_file_sync_002');
    let fpathTarget = fpath + 'tgt';

    try {
      fileIO.copyFileSync(fpath, fpathTarget);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_003
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0300
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_copy_file_sync_003', Level.LEVEL3, function () {

    try {
      fileIO.copyFileSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_004
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0400
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_004', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_copy_file_sync_004');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, fpathTarget, '0');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_005
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0500
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_005', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_copy_file_sync_005');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let fileTgt = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.copyFileSync(file.fd, fileTgt.fd);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.closeSync(file);
      fileIO.closeSync(fileTgt);
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
    } catch (e) {
      console.log('fileIO_copy_file_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_006
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0600
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_006', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_copy_file_sync_006');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let fileTgt = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      fileIO.copyFileSync(fpath, fileTgt.fd);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.closeSync(fileTgt);
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
    } catch (e) {
      console.log('fileIO_copy_file_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_007
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0700
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_007', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_sync_007');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, fpathTarget, 1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_008
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0800
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_008', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_copy_file_sync_008');
    let fpathTarget = fpath + randomString(250);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, fpathTarget);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_sync_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900030 && e.message == 'File name too long').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_009
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0900
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_copy_file_sync_009', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_copy_file_sync_009');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, fpathTarget, undefined);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
    } catch (e) {
      console.log('fileIO_copy_file_sync_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_000
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0000
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_000');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyFile(fpath, fpathTarget);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileIO_copy_file_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_001
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0100
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_001');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, fpathTarget, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileIO.statSync(fpath);
        let stat2 = fileIO.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fileIO.unlinkSync(fpath);
        fileIO.unlinkSync(fpathTarget);
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_002
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0200
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_002');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
      await fileIO.copyFile(file.fd, fpathTarget);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileIO_copy_file_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_003
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0300
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_003');
    let fpathTarget = fpath + 'tgt';

    try {
      await fileIO.copyFile(fpath, fpathTarget);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_004
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0400
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_004');
    let fpathTarget = fpath + 'tgt';

    try {
      fileIO.copyFile(fpath, fpathTarget, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_005
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0500
   * @tc.desc   Test copyFile() interfaces. Promise.then().catch()
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_005');
    let fpathTarget = fpath + 'tgt';

    try {
      fileIO.copyFile(fpath, fpathTarget).then(() => {
        expect(false).assertTrue();
      }).catch((err) => {
        console.log('fileIO_copy_file_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
        expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_006
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0600
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_006', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_006');

    try {
      await fileIO.copyFile(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_007
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0700
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_007', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_007');

    try {
      fileIO.copyFile(fpath, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_008
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0800
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_008', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_008');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyFile(fpath, fpathTarget, 0);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileIO_copy_file_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_009
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0900
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_009', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_009');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, fpathTarget, 0, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_007 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileIO.statSync(fpath);
        let stat2 = fileIO.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fileIO.unlinkSync(fpath);
        fileIO.unlinkSync(fpathTarget);
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_010
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1000
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_010', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_010');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, fpathTarget, 1, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_011
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1100
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_011', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_011');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyFile(fpath, fpathTarget, '0');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_012
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1200
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_012', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_012');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let fileTgt = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      await fileIO.copyFile(file.fd, fileTgt.fd);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.closeSync(file);
      fileIO.closeSync(fileTgt);
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileIO_copy_file_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_013
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1300
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_013', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_012');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let fileTgt = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.copyFile(file.fd, fileTgt.fd, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_013 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileIO.statSync(fpath);
        let stat2 = fileIO.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fileIO.closeSync(file);
        fileIO.closeSync(fileTgt);
        fileIO.unlinkSync(fpath);
        fileIO.unlinkSync(fpathTarget);
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_014
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1400
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_014', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_014');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpathTarget, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpathTarget, fileIO.OpenMode.READ_WRITE);
      await fileIO.copyFile(fpath, file.fd, 0);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileIO_copy_file_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_015
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1500
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_015', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_014');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      fileIO.copyFile(fpath, file.fd, 0, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_013 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileIO.statSync(fpath);
        let stat2 = fileIO.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        fileIO.unlinkSync(fpathTarget);
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_016
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1600
   * @tc.desc   Test copyFile() interfaces. Promise
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_016', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_016');
    let fpathTarget = fpath + randomString(250);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyFile(fpath, fpathTarget);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_async_016 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900030 && e.message == 'File name too long').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_017
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1700
   * @tc.desc   Test copyFile() interfaces. Callback
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_017', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_017');
    let fpathTarget = fpath + randomString(250);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, fpathTarget, (err) => {
        if (err) {
          fileIO.unlinkSync(fpath);
          console.log('fileIO_copy_file_async_017 error: {message: ' + err.message + ', code: ' + err.code);
          expect(err.code == 13900030 && err.message == 'File name too long').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_017 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_018
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1800
   * @tc.desc   Test copyFile() interfaces. Promise
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_copy_file_async_018', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_018');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyFile(fpath, fpathTarget, undefined);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileIO_copy_file_async_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_019
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1900
   * @tc.desc   Test copyFile() interfaces. Callback
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_copy_file_async_019', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_019');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, fpathTarget, undefined, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_019 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileIO.statSync(fpath);
        let stat2 = fileIO.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fileIO.unlinkSync(fpath);
        fileIO.unlinkSync(fpathTarget);
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_019 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}
