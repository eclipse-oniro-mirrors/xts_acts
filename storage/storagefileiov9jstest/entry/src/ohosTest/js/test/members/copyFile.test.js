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
   * @tc.name   fileIO_copy_file_sync_010
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_1000
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_010', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_sync_010');
    let fpathTarget = fpath + 'tgt';

    try {
      fileIO.copyFileSync(null, fpathTarget, 1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_sync_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_011
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_1100
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_011', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_sync_011');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(undefined, fpathTarget, 1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_sync_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_012
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_1200
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_012', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_sync_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, null, 1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_sync_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_013
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_1300
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_013', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_sync_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, undefined, 1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_sync_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_014
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_1400
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_014', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_sync_014');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, fpathTarget, null);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_sync_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_015
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_1500
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_015', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_sync_015');
    let fpathTarget = fpath + 'tgt';

    try {
      fileIO.copyFileSync("", fpathTarget, 1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_sync_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_016
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_1600
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_016', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_sync_016');
    let fpathTarget = fpath + 'tgt';

    try {
      fileIO.copyFileSync(125, fpathTarget, 1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_sync_016 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_017
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_1700
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_017', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_sync_017');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, "", 1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_sync_017 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_sync_018
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_1800
   * @tc.desc   Test copyFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_sync_018', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_sync_018');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, 225, 1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_sync_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
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

  /**
   * @tc.name   fileIO_copy_file_async_020
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_2000
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_020', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_020');
    let fpathTarget = fpath + 'tgt';

    try {
      await fileIO.copyFile(null, fpathTarget, 0);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_async_020 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_021
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_2100
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_021', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_021');
    let fpathTarget = fpath + 'tgt';

    try {
      await fileIO.copyFile(undefined, fpathTarget, 0);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_async_021 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_022
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_2200
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_022', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_022');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyFile(fpath, null, 0);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_async_022 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_023
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_2300
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_023', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_023');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyFile(fpath, undefined, 0);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_async_023 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_024
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_2400
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_024', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_024');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyFile(fpath, fpathTarget, null);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_async_024 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_025
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_2500
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_025', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_025');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyFile(fpath, fpathTarget, undefined);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      console.log('fileIO_copy_file_async_025 stat1.size ' + stat1.size + ', stat2.size: ' + stat2.size);
      expect(stat1.size == stat2.size).assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileIO_copy_file_async_025 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_026
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_2600
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_026', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_026');
    let fpathTarget = fpath + 'tgt';

    try {
      await fileIO.copyFile("", fpathTarget, 0);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_async_026 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_027
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_2700
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_027', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_027');
    let fpathTarget = fpath + 'tgt';

    try {
      await fileIO.copyFile("fpath", fpathTarget, 0);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_async_027 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_028
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_2800
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_028', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_028');
    let fpathTarget = fpath + 'tgt';

    try {
      await fileIO.copyFile(125, fpathTarget, 0);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_file_async_028 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900008 && e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_029
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_2900
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_029', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_029');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyFile(fpath, "", 0);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_async_029 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_030
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_3000
   * @tc.desc   Test copyFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_030', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_030');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyFile(fpath, 126, 0);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_async_030 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900008 && e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_031
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_3100
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_031', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_031');
    let fpathTarget = fpath + 'tgt';

    try {
      fileIO.copyFile(null, fpathTarget, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_031 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_031 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_032
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_3200
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_032', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_032');
    let fpathTarget = fpath + 'tgt';

    try {
      fileIO.copyFile(undefined, fpathTarget, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_032 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_032 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_033
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_3300
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_033', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_033');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, null, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_033 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_async_033 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_034
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_3400
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_034', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_034');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, undefined, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_034 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_file_async_034 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_035
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_3500
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_035', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_035');
    let fpathTarget = fpath + 'tgt';

    try {
      fileIO.copyFile("fpath", fpathTarget, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_035 error package: ' + JSON.stringify(err));
          expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_035 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_036
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_3600
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_036', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_036');
    let fpathTarget = fpath + 'tgt';

    try {
      fileIO.copyFile("", fpathTarget, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_036 error package: ' + JSON.stringify(err));
          expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_036 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_037
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_3700
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_037', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_037');
    let fpathTarget = fpath + 'tgt';

    try {
      fileIO.copyFile(188, fpathTarget, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_037 error package: ' + JSON.stringify(err));
          expect(err.code === 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done()
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_037 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_038
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_3800
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_038', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_038');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, "", (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_038 error package: ' + JSON.stringify(err));
          expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_038 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_039
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_3900
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_039', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_039');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, 144, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_039 error package: ' + JSON.stringify(err));
          expect(err.code === 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done()
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_039 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_040
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_4000
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_040', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_040');
    let fpathTarget = fpath + 'tgt';
    let file = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      fileIO.copyFile(null, file.fd, 0, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_040 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_040 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_041
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_4100
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_041', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_041');
    let fpathTarget = fpath + 'tgt';
    let file = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      fileIO.copyFile(undefined, file.fd, 0, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_041 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_041 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_042
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_4200
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_042', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_042');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, null, 0, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_042 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_042 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_043
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_4300
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_043', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_043');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, undefined, 0, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_043 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_043 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_044
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_4400
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_044', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_044');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      fileIO.copyFile(fpath, file.fd, null, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_044 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_044 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_045
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_4500
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_045', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_045');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      fileIO.copyFile(fpath, file.fd, undefined, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_045 error package: ' + JSON.stringify(err));
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
      console.log('fileIO_copy_file_async_045 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_046
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_4600
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_046', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_046');
    let fpathTarget = fpath + 'tgt';
    let file = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      fileIO.copyFile("fpath", file.fd, 0, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_046 error package: ' + JSON.stringify(err));
          expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
          done()
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_046 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_047
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_4700
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_047', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_047');
    let fpathTarget = fpath + 'tgt';
    let file = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      fileIO.copyFile("", file.fd, 0, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_047 error package: ' + JSON.stringify(err));
          expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
          done()
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_047 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_048
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_4800
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_048', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_048');
    let fpathTarget = fpath + 'tgt';
    let file = fileIO.openSync(fpathTarget, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      fileIO.copyFile(111, file.fd, 0, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_048 error package: ' + JSON.stringify(err));
          expect(err.code === 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done()
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_048 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_049
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_4900
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_049', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_049');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, "", 0, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_049 error package: ' + JSON.stringify(err));
          expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
          done()
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_049 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_file_async_050
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_5000
   * @tc.desc   Test copyFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_copy_file_async_050', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_file_async_050');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFile(fpath, 222, 0, (err) => {
        if (err) {
          console.log('fileIO_copy_file_async_050 error package: ' + JSON.stringify(err));
          expect(err.code === 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done()
        }
      });
    } catch (e) {
      console.log('fileIO_copy_file_async_050 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });
});
}
