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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect,
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIODup() {
  describe('fileIO_fs_dup', function () {

  /**
   * @tc.name   fileIO_test_dup_sync_000
   * @tc.number SUB_DF_FILEIO_DUP_SYNC_0000
   * @tc.desc   Test dup() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_dup_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_dup_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let newFile = fileIO.dup(file.fd);
      expect(newFile.path == fpath).assertTrue();
      let bytesWritten = fileIO.writeSync(newFile.fd, new ArrayBuffer(20));
      expect(bytesWritten == 20).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == 0).assertTrue();
      fileIO.closeSync(file);
      fileIO.closeSync(newFile);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_dup_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_dup_sync_001
   * @tc.number SUB_DF_FILEIO_DUP_SYNC_0100
   * @tc.desc   Test dup() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_dup_sync_001', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_dup_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let newFile;

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      newFile = fileIO.dup(file.fd);
      fileIO.closeSync(file);
      expect(newFile.path == fpath).assertTrue();
      let readlen = fileIO.readSync(newFile.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.writeSync(newFile.fd, FILE_CONTENT);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(newFile);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_dup_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_dup_sync_002
   * @tc.number SUB_DF_FILEIO_DUP_SYNC_0200
   * @tc.desc   Test dup() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_dup_sync_002', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_dup_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let newFile;

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      newFile = fileIO.dup(file.fd);
      fileIO.closeSync(file);
      expect(newFile.path == fpath).assertTrue();
      let bytesWritten = fileIO.writeSync(newFile.fd, FILE_CONTENT);
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      fileIO.readSync(newFile.fd, new ArrayBuffer(4096));
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(newFile);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_dup_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_dup_sync_003
   * @tc.number SUB_DF_FILEIO_DUP_SYNC_0300
   * @tc.desc   Test dup() interfaces. Missing parameters.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_dup_sync_003', Level.LEVEL3, function () {
    try {
      fileIO.dup();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_dup_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_dup_sync_004
   * @tc.number SUB_DF_FILEIO_DUP_SYNC_0400
   * @tc.desc   Test dup() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_dup_sync_004', Level.LEVEL3, async function () {

    try {
      fileIO.dup(-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_dup_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_dup_sync_005
   * @tc.number SUB_DF_FILEIO_DUP_SYNC_0500
   * @tc.desc   Test dup() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_dup_sync_005', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_dup_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let fd = file.fd;
      fileIO.closeSync(file);
      let newFile = fileIO.dup(fd);
      fileIO.writeSync(newFile.fd, new ArrayBuffer(20));
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_dup_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });
});
}
