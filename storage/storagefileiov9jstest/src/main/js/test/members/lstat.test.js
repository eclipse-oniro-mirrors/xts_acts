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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum, isBigInt,
  describe, it, expect,
} from '../Common';

export default function fileIOLstat() {
describe('fileIO_fs_lstat', function () {

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_SYNC_0000
   * @tc.name fileIO_lstat_sync_000
   * @tc.desc Test lstatSync() interface.
   * Enter the path parameter to get the file stat.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_lstat_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(stat !== null).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_SYNC_0100
   * @tc.name fileIO_lstat_sync_001
   * @tc.desc Test lstatSync() interface.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_sync_001');

    try {
      fileIO.lstatSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_lstat_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_SYNC_0200
   * @tc.name fileIO_lstat_sync_002
   * @tc.desc Test lstatSync() interface.
   * Missing parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_sync_002', 0, async function () {

    try {
      fileIO.lstatSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_lstat_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_INO_0000
   * @tc.name fileIO_lstat_ino_000
   * @tc.desc Test the ino member of class Stat.
   * Enter the path parameter to get stat.ino of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_ino_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_ino_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileIO.lstatSync(fpath);
      expect(isBigInt(stat.ino)).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_ino_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_MODE_0000
   * @tc.name fileIO_lstat_mode_000
   * @tc.desc Test the mode member of class Stat.
   * Enter the path parameter to get stat.mode of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_mode_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_mode_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(isIntNum(stat.mode)).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_mode_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_UID_0000
   * @tc.name fileIO_lstat_uid_000
   * @tc.desc Test the uid member of class Stat.
   * Enter the path parameter to get stat.uid of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_uid_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_uid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(isIntNum(stat.uid)).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_uid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_GID_0000
   * @tc.name fileIO_lstat_gid_000
   * @tc.desc Test the gid member of class Stat.
   * Enter the path parameter to get stat.gid of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_gid_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_gid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(isIntNum(stat.gid)).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_gid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_SIZE_0000
   * @tc.name fileIO_lstat_size_000
   * @tc.desc Test the size member of class Stat.
   * Enter the path parameter to get stat.size of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_size_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_size_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try { 
      let stat = fileIO.lstatSync(fpath);
      expect(isIntNum(stat.size)).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_size_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ATIME_0000
   * @tc.name fileIO_lstat_atime_000
   * @tc.desc Test the atime member of class Stat.
   * Enter the path or parameter to get stat.atime of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_atime_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_atime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(isIntNum(stat.atime)).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_atime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_MTIME_0000
   * @tc.name fileIO_lstat_mtime_000
   * @tc.desc Test the mtime member of class Stat.
   * Enter the path parameter to get stat.mtime of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_mtime_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_mtime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(isIntNum(stat.mtime)).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_mtime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_CTIME_0000
   * @tc.name fileIO_lstat_ctime_000
   * @tc.desc Test the ctime member of class Stat.
   * Enter the path parameter to get stat.ctime of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_ctime_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_ctime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(isIntNum(stat.ctime)).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_BLOCK_DEVICE_0000
   * @tc.name fileIO_lstat_is_block_device_000
   * @tc.desc Test Lstat.isBlockDevice() interface.
   * This interface shall not treat a normal file as a block special device.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_block_device_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_is_block_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(stat.isBlockDevice() === false).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_is_block_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_BLOCK_DEVICE_0100
   * @tc.name fileIO_test_lstat_is_block_device_001
   * @tc.desc Test Lstat.isBlockDevice() interface.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_lstat_is_block_device_001', 0, async function () {
    let fpath = await nextFileName('fileIO_test_lstat_is_block_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstatSync(fpath).isBlockDevice(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_lstat_is_block_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_CHARACTER_DEVICE_0000
   * @tc.name fileIO_lstat_is_character_device_000
   * @tc.desc Test Lstat.isCharacterDevice() interface.
   * This interface shall not treat a normal file as a character special device.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_character_device_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_is_character_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(stat.isCharacterDevice() === false).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_is_character_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_CHARACTER_DEVICE_0100
   * @tc.name fileIO_lstat_is_character_device_001
   * @tc.desc Test Lstat.isCharacterDevice() interface.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_lstat_is_character_device_001', 0, async function () {
    let fpath = await nextFileName('fileIO_test_lstat_is_character_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstatSync(fpath).isCharacterDevice(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_lstat_is_character_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_DIRECTORY_0000
   * @tc.name fileIO_lstat_is_directory_000
   * @tc.desc Test Lstat.isDirectory() interface.
   * This interface shall not treat a normal file as a directory.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_directory_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_is_directory_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(stat.isDirectory() === false).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_is_directory_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_DIRECTORY_0100
   * @tc.name fileIO_lstat_is_directory_001
   * @tc.desc Test Lstat.isDirectory() interface.
   * This interface shall treat a directory as a directory.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_directory_001', 0, async function () {
    let dpath = await nextFileName('fileIO_lstat_is_directory_001') + 'd';

    try {
      fileIO.mkdirSync(dpath);
      let stat = fileIO.lstatSync(dpath);
      expect(stat.isDirectory() === true).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_lstat_is_directory_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_DIRECTORY_0200
   * @tc.name fileIO_lstat_is_directory_002
   * @tc.desc Test Lstat.isDirectory() interface.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_directory_002', 0, async function () {
    let dpath = await nextFileName('fileIO_lstat_is_directory_002') + 'd';

    try {
      fileIO.mkdirSync(dpath);
      fileIO.lstatSync(dpath).isDirectory(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_lstat_is_directory_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FIFO_0000
   * @tc.name fileIO_lstat_is_fifo_000
   * @tc.desc Test Lstat.isFIFO() interface.
   * This interface shall not treat a normal file as a FIFO.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_fifo_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_is_fifo_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(stat.isFIFO() === false).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_is_fifo_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FIFO_0100
   * @tc.name fileIO_lstat_is_fifo_001
   * @tc.desc Test Lstat.isFIFO() interface.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_lstat_is_fifo_002', 0, async function () {
    let fpath = await nextFileName('fileIO_test_lstat_is_fifo_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstatSync(fpath).isFIFO(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_lstat_is_fifo_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FILE_0000
   * @tc.name fileIO_lstat_is_file_000
   * @tc.desc Test Lstat.isFile() interface.
   * This interface shall treat a normal file as a normal file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_file_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_is_file_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(stat.isFile() === true).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_is_file_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FILE_0100
   * @tc.name fileIO_lstat_is_file_001
   * @tc.desc Test Lstat.isFile() interface.
   * This interface shall not treat a directory as a normal file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_file_001', 0, async function () {
    let dpath = await nextFileName('fileIO_lstat_is_file_001');

    try {
      fileIO.mkdirSync(dpath);
      let stat = fileIO.lstatSync(dpath);
      expect(stat.isFile() === false).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_lstat_is_file_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FILE_0200
   * @tc.name fileIO_test_lstat_is_file_002
   * @tc.desc Test Lstat.isFile() interface.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_lstat_is_file_002', 0, async function () {
    let dpath = await nextFileName('fileIO_test_lstat_is_file_002');

    try {
      fileIO.mkdirSync(dpath);
      fileIO.lstatSync(dpath).isFile(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_lstat_is_file_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_SOCKET_0000
   * @tc.name fileIO_lstat_is_socket_000
   * @tc.desc Test Lstat.isSocket() interface.
   * This interface shall not treat a file as a socket.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_socket_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_is_socket_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(stat.isSocket() === false).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_lstat_is_socket_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_SOCKET_0100
   * @tc.name fileIO_lstat_is_socket_001
   * @tc.desc Test Lstat.isSocket() interface.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_socket_001', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_is_socket_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstatSync(fpath).isSocket(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_lstat_is_socket_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_SYMBOLIC_LINK_0000
   * @tc.name fileIO_lstat_is_symbolic_link_000
   * @tc.desc Test Lstat.isSymbolicLink() interface.
   * This interface shall not treat a normal file as a symbolic link.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_symbolic_link_000', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_is_symbolic_link_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(stat.isSymbolicLink() === false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_lstat_is_symbolic_link_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_SYMBOLIC_LINK_0100
   * @tc.name fileIO_lstat_is_symbolic_link_001
   * @tc.desc Test Lstat.isSymbolicLink() interface.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_is_symbolic_link_001', 0, async function () {
    let fpath = await nextFileName('fileIO_lstat_is_symbolic_link_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstatSync(fpath).isSymbolicLink(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_lstat_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_0000
   * @tc.name fileIO_lstat_async_000
   * @tc.desc Test lstat() interface. Promise.then().catch()
   * Enter the path parameter to get the file stat.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_lstat_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath).then((stat) => {
        expect(stat !== null).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      }).catch((err) => {
        console.log('fileIO_lstat_async_000 error package: ' + JSON.stringify(err));
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_0100
   * @tc.name fileIO_lstat_async_001
   * @tc.desc Test lstat() interface. Callback.
   * Enter the path or parameter to get the file stat.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err) => {
        if(err) {
          console.log('fileIO_lstat_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_0200
   * @tc.name fileIO_lstat_async_002
   * @tc.desc Test lstat() interface. Promise.
   * Enter the path or parameter to get the file stat.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(stat !== null).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_0300
   * @tc.name fileIO_lstat_async_003
   * @tc.desc Test lstat() interface.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_003');

    try {
      fileIO.lstat(fpath, (err) => {
        if (err) {
          console.log('fileIO_lstat_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_lstat_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_0400
   * @tc.name fileIO_lstat_async_004
   * @tc.desc Test lstat() interface. Promise.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_004');

    try {
      await fileIO.lstat(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_lstat_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_INO_0000
   * @tc.name fileIO_lstat_async_ino_000
   * @tc.desc Test the ino member of class Stat. Promise.
   * Enter the path parameter to get stat.ino of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_ino_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_ino_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(isBigInt(stat.ino)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_ino_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_INO_0100
   * @tc.name fileIO_lstat_async_ino_001
   * @tc.desc Test the ino member of class Stat. Callback.
   * Enter the path parameter to get stat.ino of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_ino_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_ino_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_lstat_async_ino_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      expect(isBigInt(stat.ino)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_ino_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_MODE_0000
   * @tc.name fileIO_lstat_async_mode_000
   * @tc.desc Test the mode member of class Stat. Promise.
   * Enter the path or parameter to get stat.mode of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_mode_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_mode_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(isIntNum(stat.mode)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_mode_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_MODE_0100
   * @tc.name fileIO_lstat_async_mode_001
   * @tc.desc Test the mode member of class Stat. Callback.
   * Enter the path or parameter to get stat.mode of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_mode_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_mode_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_lstat_async_mode_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.mode)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_mode_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_UID_0000
   * @tc.name fileIO_lstat_async_uid_000
   * @tc.desc Test the uid member of class Stat. Promise.
   * Enter the path parameter to get stat.uid of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_uid_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_uid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(isIntNum(stat.uid)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_uid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_UID_0100
   * @tc.name fileIO_lstat_async_uid_001
   * @tc.desc Test the uid member of class Stat. Callback.
   * Enter the path parameter to get stat.uid of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_uid_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_uid_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_lstat_async_uid_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.uid)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_uid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_GID_0000
   * @tc.name fileIO_lstat_async_gid_000
   * @tc.desc Test the gid member of class Stat. Promise.
   * Enter the path parameter to get stat.gid of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_gid_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_gid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(isIntNum(stat.gid)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_gid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_GID_0100
   * @tc.name fileIO_lstat_async_gid_001
   * @tc.desc Test the gid member of class Stat. Callback.
   * Enter the path parameter to get stat.gid of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_gid_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_gid_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_gid_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.gid)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_gid_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_SIZE_0000
   * @tc.name fileIO_lstat_async_size_000
   * @tc.desc Test the size member of class Stat. Promise.
   * Enter the path parameter to get stat.size of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_size_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_size_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(isIntNum(stat.size)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_size_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_SIZE_0100
   * @tc.name fileIO_lstat_async_size_001
   * @tc.desc Test the size member of class Stat. Callback.
   * Enter the path parameter to get stat.size of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_size_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_size_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_size_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.size)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_size_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_ATIME_0000
   * @tc.name fileIO_lstat_async_atime_000
   * @tc.desc Test the atime member of class Stat. Promise.
   * Enter the path parameter to get stat.atime of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_atime_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_atime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(isIntNum(stat.atime)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_atime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_ATIME_0100
   * @tc.name fileIO_lstat_async_atime_001
   * @tc.desc Test the atime member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.atime of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_atime_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_atime_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_atime_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.atime)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_atime_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_MTIME_0000
   * @tc.name fileIO_lstat_async_mtime_000
   * @tc.desc Test the mtime member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.mtime of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_mtime_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_mtime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(isIntNum(stat.mtime)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_mtime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_MTIME_0100
   * @tc.name fileIO_lstat_async_mtime_001
   * @tc.desc Test the mtime member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.mtime of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_mtime_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_mtime_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_mtime_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.mtime)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_mtime_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_CTIME_0000
   * @tc.name fileIO_lstat_async_ctime_000
   * @tc.desc Test the ctime member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.ctime of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_ctime_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_ctime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(isIntNum(stat.ctime)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_CTIME_0100
   * @tc.name fileIO_lstat_async_ctime_001
   * @tc.desc Test the ctime member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.ctime of the file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_ctime_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_ctime_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_ctime_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.ctime)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_BLOCK_DEVICE_0000
   * @tc.name fileIO_lstat_async_is_block_device_000
   * @tc.desc Test the isBlockDevice() method of class Stat. Promise.
   * This interface shall not treat a normal file as a block special device.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_block_device_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_block_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(stat.isBlockDevice() === false).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_is_block_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_BLOCK_DEVICE_0010
   * @tc.name fileIO_lstat_async_is_block_device_001
   * @tc.desc Test the isBlockDevice() method of class Stat. Callback.
   * This interface shall not treat a normal file as a block special device.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_block_device_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_block_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_is_block_device_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isBlockDevice() === false).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_is_block_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_CHARACTER_DEVICE_0000
   * @tc.name fileIO_lstat_async_is_character_device_000
   * @tc.desc Test the isCharacterDevice() method of class Stat. Promise.
   * This interface shall not treat a normal file as a character special device.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_character_device_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_character_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(stat.isCharacterDevice() === false).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_is_character_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_CHARACTER_DEVICE_0010
   * @tc.name fileIO_lstat_async_is_character_device_001
   * @tc.desc Test the isCharacterDevice() method of class Stat. Callback.
   * This interface shall not treat a normal file as a character special device.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_character_device_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_character_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_is_character_device_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isCharacterDevice() === false).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_is_character_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_DIRECTORY_0000
   * @tc.name fileIO_lstat_async_is_directory_000
   * @tc.desc Test the isDirectory() method of class Stat. Promise.
   * This interface shall not treat a normal file as a directory.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_directory_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_directory_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(stat.isDirectory() === false).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_is_directory_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_DIRECTORY_0010
   * @tc.name fileIO_lstat_async_is_directory_001
   * @tc.desc Test the isDirectory() method of class Stat. Promise.
   * This interface shall not treat a directory as a directory.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_directory_001', 0, async function (done) {
    let dpath = await nextFileName('fileIO_lstat_async_is_directory_001') + 'd';


    try {
      fileIO.mkdirSync(dpath);
      let stat = await fileIO.lstat(dpath);
      expect(stat.isDirectory() === true).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_is_directory_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_DIRECTORY_0020
   * @tc.name fileIO_lstat_async_is_directory_002
   * @tc.desc Test the isDirectory() method of class Stat. Callback.
   * This interface shall not treat a directory as a directory.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_directory_002', 0, async function (done) {
    let dpath = await nextFileName('fileIO_lstat_async_is_directory_002') + 'd';

    try {
      fileIO.mkdirSync(dpath);
      fileIO.lstat(dpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_is_directory_002 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isDirectory() === true).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_is_directory_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_FIFO_0000
   * @tc.name fileIO_lstat_async_is_fifo_000
   * @tc.desc Test the isFIFO() method of class Stat. Promise.
   * This interface shall not treat a normal file as a FIFO.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_fifo_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_fifo_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(stat.isFIFO() === false).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_is_fifo_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_FIFO_0010
   * @tc.name fileIO_lstat_async_is_fifo_001
   * @tc.desc Test the isFIFO() method of class Stat. Callback.
   * This interface shall not treat a normal file as a FIFO.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_fifo_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_fifo_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_is_character_device_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isFIFO() === false).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_is_fifo_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_FILE_0000
   * @tc.name fileIO_lstat_async_is_file_000
   * @tc.desc Test the isFile() method of class Stat. Promise.
   * This interface shall treat a normal file as a normal file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_file_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_file_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(stat.isFile() === true).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_is_file_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_FILE_0010
   * @tc.name fileIO_lstat_async_is_file_001
   * @tc.desc Test the isFile() method of class Stat. Callback.
   * This interface shall treat a normal file as a normal file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_file_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_file_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_is_file_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isFile() === true).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_is_file_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_FILE_0020
   * @tc.name fileIO_lstat_async_is_file_002
   * @tc.desc Test the isFile() method of class Stat. Promise.
   * This interface shall not treat a directory as a normal file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_file_002', 0, async function (done) {
    let dpath = await nextFileName('fileIO_lstat_async_is_file_002');

    try {
      fileIO.mkdirSync(dpath);
      let stat = await fileIO.lstat(dpath);
      expect(stat.isFile() === false).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_is_file_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_SOCKET_0000
   * @tc.name fileIO_lstat_async_is_socket_000
   * @tc.desc Test the isSocket() method of class Stat. Promise.
   * This interface shall not treat a file as a socket.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_socket_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_socket_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(stat.isSocket() === false).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_is_socket_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_SOCKET_0010
   * @tc.name fileIO_lstat_async_is_socket_001
   * @tc.desc Test the isSocket() method of class Stat. Callback.
   * This interface shall not treat a file as a socket.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_socket_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_socket_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_is_socket_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isSocket() === false).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_is_socket_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_SYMBOLIC_LINK_0000
   * @tc.name fileIO_lstat_async_is_symbolic_link_000
   * @tc.desc Test the isSymbolicLink() method of class Stat. Promise.
   * This interface shall not treat a normal file as a symbolic link.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_symbolic_link_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_symbolic_link_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.lstat(fpath);
      expect(stat.isSymbolicLink() === false).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_lstat_async_is_symbolic_link_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_SYMBOLIC_LINK_0100
   * @tc.name fileIO_lstat_async_is_symbolic_link_001
   * @tc.desc Test the isSymbolicLink() method of class Stat. Callback.
   * This interface shall not treat a normal file as a symbolic link.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_lstat_async_is_symbolic_link_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_lstat_async_is_symbolic_link_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.lstat(fpath, (err, stat) => {
        if (err) {
          console.log('fileIO_lstat_async_is_symbolic_link_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isSymbolicLink() === false).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_lstat_async_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_APPEND_FILE_SYNC_0010
   * @tc.name fileIO_test_append_file_sync_000
   * @tc.desc Test lstat.lstatSync() interface.
   * Modify the file, view the file status changes by path.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_append_file_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_test_append_file_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.lstatSync(fpath);
      expect(isIntNum(stat.size)).assertTrue();

      let file = fileIO.openSync(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();

      expect(fileIO.writeSync(file.fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);

      stat = fileIO.lstatSync(fpath);
      expect(stat.size == FILE_CONTENT.length * 2).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_append_file_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
})
}
