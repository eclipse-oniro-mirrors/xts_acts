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
    fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum, isBigInt,
    describe, it, expect,
  } from '../Common';

const LocationType = {
  'LOCAl': 1,
  'CLOUD': 2,
}

export default function fileIOStat() {
describe('fileIO_fs_stat', function () {

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_0000
   * @tc.name fileIO_stat_sync_000
   * @tc.desc Test statSync() interfaces.
   * Enter the path or fd parameter to get the file stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat !== null).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2 !== null).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_0100
   * @tc.name fileIO_stat_sync_001
   * @tc.desc Test statSync() interfaces.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_001');

    try {
      fileIO.statSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_stat_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_0200
   * @tc.name fileIO_stat_sync_002
   * @tc.desc Test statSync() interfaces. Missing parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
   it('fileIO_stat_sync_002', 0, async function () {

    try {
      fileIO.statSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_stat_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_INO_0000
   * @tc.name fileIO_stat_sync_ino_000
   * @tc.desc Test the ino member of class Stat.
   * Enter the path or fd parameter to get stat.ino of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_ino_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_ino_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isBigInt(stat.ino)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isBigInt(stat2.ino)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_ino_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_MODE_0000
   * @tc.name fileIO_stat_sync_mode_000
   * @tc.desc Test the mode member of class Stat.
   * Enter the path or fd parameter to get stat.mode of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_mode_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_mode_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.mode)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.mode)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_mode_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_UID_0000
   * @tc.name fileIO_stat_sync_uid_000
   * @tc.desc Test the uid member of class Stat.
   * Enter the path or fd parameter to get stat.uid of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_uid_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_uid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.uid)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.uid)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_uid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_GID_0000
   * @tc.name fileIO_stat_sync_gid_000
   * @tc.desc Test the gid member of class Stat.
   * Enter the path or fd parameter to get stat.gid of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_gid_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_gid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.gid)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.gid)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_gid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_SIZE_0000
   * @tc.name fileIO_stat_sync_size_000
   * @tc.desc Test the size member of class Stat.
   * Enter the path or fd parameter to get stat.size of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_size_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_size_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.size)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.size)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_size_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ATIME_0000
   * @tc.name fileIO_stat_sync_atime_000
   * @tc.desc Test the atime member of class Stat.
   * Enter the path or fd parameter to get stat.atime of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_atime_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_atime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.atime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.atime)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_atime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_MTIME_0000
   * @tc.name fileIO_stat_sync_mtime_000
   * @tc.desc Test the mtime member of class Stat.
   * Enter the path or fd parameter to get stat.mtime of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_mtime_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_mtime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.mtime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.mtime)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_mtime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_CTIME_0000
   * @tc.name fileIO_stat_sync_ctime_000
   * @tc.desc Test the ctime member of class Stat.
   * Enter the path or fd parameter to get stat.ctime of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_ctime_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_ctime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.ctime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.ctime)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISBLOCKDEVICE_0000
   * @tc.name fileIO_stat_sync_is_block_device_000
   * @tc.desc Test the isBlockDevice() method of class Stat.
   * This interface shall not treat a normal file as a block special device.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_block_device_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_block_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isBlockDevice() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isBlockDevice() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_block_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISBLOCKDEVICE_0100
   * @tc.name fileIO_stat_sync_is_block_device_001
   * @tc.desc Test the isBlockDevice() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_block_device_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_block_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.statSync(fpath).isBlockDevice(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_stat_sync_is_block_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISBLOCKDEVICE_0200
   * @tc.name fileIO_stat_sync_is_block_device_002
   * @tc.desc Test the isBlockDevice() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_block_device_002', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_block_device_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath);

    try {
      fileIO.statSync(file.fd).isBlockDevice(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_stat_sync_is_block_device_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISCHARACTER_DEVICE_0000
   * @tc.name fileIO_stat_sync_is_character_device_000
   * @tc.desc Test the isCharacterDevice() method of class Stat.
   * This interface shall not treat a normal file as a character special device.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_character_device_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_character_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isCharacterDevice() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isCharacterDevice() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_character_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISCHARACTER_DEVICE_0100
   * @tc.name fileIO_stat_sync_is_character_device_001
   * @tc.desc Test the isCharacterDevice() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_character_device_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_character_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.statSync(fpath).isCharacterDevice(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_stat_sync_is_character_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISCHARACTER_DEVICE_0200
   * @tc.name fileIO_stat_sync_is_character_device_002
   * @tc.desc Test the isCharacterDevice() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_character_device_002', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_character_device_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath);

    try {
      fileIO.statSync(file.fd).isCharacterDevice(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_stat_sync_is_character_device_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISDIRECTORY_0000
   * @tc.name fileIO_stat_sync_is_directory_000
   * @tc.desc Test the isDirectory() method of class Stat.
   * This interface shall not treat a normal file as a directory.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_directory_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_directory_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isDirectory() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isDirectory() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_directory_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISDIRECTORY_0100
   * @tc.name fileIO_stat_sync_is_directory_001
   * @tc.desc Test the isDirectory() method of class Stat.
   * This interface shall treat a directory as a directory.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_directory_001', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_directory_001');

    try {
      fileIO.mkdirSync(dpath);
      let stat = fileIO.statSync(dpath);
      expect(stat.isDirectory() === true).assertTrue();

      let file = fileIO.openSync(dpath, fileIO.OpenMode.DIR);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isDirectory() === true).assertTrue();
      fileIO.closeSync(file);
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_directory_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISDIRECTORY_0200
   * @tc.name fileIO_stat_sync_is_directory_002
   * @tc.desc Test the isDirectory() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_directory_002', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_directory_002') + 'd';

    try {
      fileIO.mkdirSync(dpath);
      fileIO.statSync(dpath).isDirectory(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_stat_sync_is_directory_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISDIRECTORY_0300
   * @tc.name fileIO_stat_sync_is_directory_003
   * @tc.desc Test the isDirectory() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_directory_003', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_directory_003') + 'd';
    fileIO.mkdirSync(dpath);
    let file = fileIO.openSync(dpath, fileIO.OpenMode.DIR);

    try {
      fileIO.statSync(file.fd).isDirectory(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.rmdirSync(dpath);
      console.log('fileIO_stat_sync_is_directory_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFIFO_0000
   * @tc.name fileIO_stat_sync_is_fifo_000
   * @tc.desc Test the isFIFO() method of class Stat.
   * This interface shall not treat a normal file as a FIFO.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_fifo_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_fifo_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isFIFO() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isFIFO() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_fifo_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFIFO_0100
   * @tc.name fileIO_stat_sync_is_fifo_001
   * @tc.desc Test the isFIFO() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_fifo_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_fifo_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.statSync(fpath).isFile(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_stat_sync_is_fifo_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFIFO_0200
   * @tc.name fileIO_stat_sync_is_fifo_002
   * @tc.desc Test the isFIFO() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_fifo_002', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_fifo_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath);

    try {
      fileIO.statSync(file.fd).isFile(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_stat_sync_is_fifo_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFILE_0000
   * @tc.name fileIO_stat_sync_is_file_000
   * @tc.desc Test the isFile() method of class Stat.
   * This interface shall treat a normal file as a normal file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_file_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_file_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isFile() === true).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isFile() === true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_file_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFILE_0100
   * @tc.name fileIO_stat_sync_is_file_002
   * @tc.desc Test the isFile() method of class Stat.
   * This interface shall not treat a directory as a normal file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_file_001', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_file_001');

    try {
      fileIO.mkdirSync(dpath);
      let stat = fileIO.statSync(dpath);
      expect(stat.isFile() === false).assertTrue();

      let file = fileIO.openSync(dpath, fileIO.OpenMode.DIR);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isFile() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_file_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFILE_0200
   * @tc.name fileIO_stat_sync_is_file_002
   * @tc.desc Test the isFile() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_file_002', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_file_002');

    try {
      fileIO.mkdirSync(dpath);
      fileIO.statSync(dpath).isFile(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_stat_sync_is_file_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFILE_0300
   * @tc.name fileIO_stat_sync_is_file_003
   * @tc.desc Test the isFile() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_file_003', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_file_003');
    fileIO.mkdirSync(dpath);
    let file = fileIO.openSync(dpath, fileIO.OpenMode.DIR);

    try {
      fileIO.statSync(file.fd).isFile(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.rmdirSync(dpath);
      console.log('fileIO_stat_sync_is_file_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSOCKET_0000
   * @tc.name fileIO_stat_sync_is_socket_000
   * @tc.desc Test the isSocket() method of class Stat.
   * This interface shall not treat a file as a socket.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_socket_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_socket_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isSocket() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isSocket() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_socket_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSOCKET_0100
   * @tc.name fileIO_stat_sync_is_socket_001
   * @tc.desc Test the isSocket() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_socket_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_socket_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.statSync(fpath).isSocket(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_stat_sync_is_socket_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSOCKET_0200
   * @tc.name fileIO_stat_sync_is_socket_002
   * @tc.desc Test the isSocket() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_socket_002', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_socket_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath);

    try {
      fileIO.statSync(file.fd).isSocket(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_stat_sync_is_socket_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSYMBOLICLINK_0000
   * @tc.name fileIO_stat_sync_is_symbolic_link_000
   * @tc.desc Test the isSymbolicLink() method of class Stat.
   * This interface shall not treat a normal file as a symbolic link.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_symbolic_link_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_symbolic_link_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isSymbolicLink() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isSymbolicLink() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_symbolic_link_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSYMBOLICLINK_0100
   * @tc.name fileIO_stat_sync_is_symbolic_link_001
   * @tc.desc Test the isSymbolicLink() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_symbolic_link_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_symbolic_link_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.statSync(fpath).isSymbolicLink(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_stat_sync_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSYMBOLICLINK_0200
   * @tc.name fileIO_stat_sync_is_symbolic_link_002
   * @tc.desc Test the isSymbolicLink() method of class Stat.
   * This interface does not require parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_sync_is_symbolic_link_002', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_symbolic_link_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath);

    try {
      fileIO.statSync(file.fd).isSymbolicLink(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_stat_sync_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_0000
   * @tc.name fileIO_stat_async_000
   * @tc.desc Test stat() interface. Promise.then().catch()
   * Enter the path or fd parameter to get the file stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat !== null).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2 !== null).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_0100
   * @tc.name fileIO_stat_async_001
   * @tc.desc Test stat() interface. Promise.
   * Enter the path or fd parameter to get the file stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat !== null).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2 !== null).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_0200
   * @tc.name fileIO_stat_async_002
   * @tc.desc Test stat() interface. Callback.
   * Enter the path or fd parameter to get the file stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_002 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat !== null).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_002 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat2 !== null).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_0300
   * @tc.name fileIO_stat_async_003
   * @tc.desc Test stat() interface. Promise.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_003');

    try {
      await fileIO.stat(fpath)
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_stat_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_0400
   * @tc.name fileIO_stat_async_004
   * @tc.desc Test stat() interface. Callback.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
   it('fileIO_stat_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_004');

    try {
      fileIO.stat(fpath, (err) => {
        if (err) {
          console.log('fileIO_stat_async_004 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_stat_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_0500
   * @tc.name fileIO_stat_async_005
   * @tc.desc Test stat() interface. Promise.
   * Invalid path or fd parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_005', 0, async function (done) {

    try {
      await fileIO.stat(-1)
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_stat_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_0600
   * @tc.name fileIO_stat_async_006
   * @tc.desc Test stat() interface. Callback.
   * Invalid path or fd parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_006', 0, async function (done) {

    try {
      fileIO.stat(-1, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_stat_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_INO_0000
   * @tc.name fileIO_stat_async_ino_000
   * @tc.desc Test the ino member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.ino of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_ino_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_ino_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isBigInt(stat.ino)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isBigInt(stat2.ino)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_ino_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_INO_0100
   * @tc.name fileIO_stat_async_ino_001
   * @tc.desc Test the ino member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.atime of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_ino_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_ino_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_ino_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isBigInt(stat.ino)).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_ino_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isBigInt(stat2.ino)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_ino_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_MODE_0000
   * @tc.name fileIO_stat_async_mode_000
   * @tc.desc Test the mode member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.mode of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_mode_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_mode_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.mode)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.mode)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_mode_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_MODE_0100
   * @tc.name fileIO_stat_async_mode_001
   * @tc.desc Test the mode member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.mode of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_mode_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_mode_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_mode_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.mode)).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_mode_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat2.mode)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_mode_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_UID_0000
   * @tc.name fileIO_stat_async_uid_000
   * @tc.desc Test the uid member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.uid of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_uid_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_uid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.uid)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.uid)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_uid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_UID_0100
   * @tc.name fileIO_stat_async_uid_001
   * @tc.desc Test the uid member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.uid of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_uid_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_uid_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_uid_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.uid)).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_uid_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat2.uid)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_uid_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });


  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_GID_0000
   * @tc.name fileIO_stat_async_gid_000
   * @tc.desc Test the gid member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.gid of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_gid_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_gid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.gid)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.gid)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_gid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_GID_0100
   * @tc.name fileIO_stat_async_gid_001
   * @tc.desc Test the gid member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.gid of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_gid_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_gid_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_gid_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.gid)).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_gid_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat2.gid)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_gid_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_SIZE_0000
   * @tc.name fileIO_stat_async_size_000
   * @tc.desc Test the size member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.size of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_size_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_size_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.size)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.size)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_size_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_SIZE_0100
   * @tc.name fileIO_stat_async_size_001
   * @tc.desc Test the size member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.size of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_size_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_size_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_size_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.size)).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_size_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat2.size)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_size_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ATIME_0000
   * @tc.name fileIO_stat_async_atime_000
   * @tc.desc Test the atime member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.atime of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_atime_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_atime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.atime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.atime)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_atime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ATIME_0100
   * @tc.name fileIO_stat_async_atime_001
   * @tc.desc Test the atime member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.atime of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_atime_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_atime_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_atime_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.atime)).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_atime_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat2.atime)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_atime_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_MTIME_0000
   * @tc.name fileIO_stat_async_mtime_000
   * @tc.desc Test the mtime member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.mtime of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_mtime_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_mtime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.mtime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.mtime)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_mtime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_MTIME_0100
   * @tc.name fileIO_stat_async_mtime_001
   * @tc.desc Test the mtime member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.mtime of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_mtime_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_mtime_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_mtime_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.mtime)).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_mtime_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat2.mtime)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_mtime_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_CTIME_0000
   * @tc.name fileIO_stat_async_ctime_000
   * @tc.desc Test the ctime member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.ctime of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_ctime_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_ctime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.ctime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.ctime)).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_CTIME_0100
   * @tc.name fileIO_stat_async_ctime_001
   * @tc.desc Test the ctime member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.ctime of the file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_ctime_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_ctime_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_ctime_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat.ctime)).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_ctime_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(isIntNum(stat2.ctime)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_ctime_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISBLOCKDEVICE_0000
   * @tc.name fileIO_stat_async_is_block_device_000
   * @tc.desc Test the isBlockDevice() method of class Stat. Promise.
   * This interface shall not treat a normal file as a block special device.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_block_device_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_block_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isBlockDevice() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isBlockDevice() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_block_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISBLOCKDEVICE_0100
   * @tc.name fileIO_stat_async_is_block_device_001
   * @tc.desc Test the isBlockDevice() method of class Stat. Callback.
   * This interface shall not treat a normal file as a block special device.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_block_device_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_block_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_is_block_device_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isBlockDevice() === false).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_is_block_device_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat2.isBlockDevice() === false).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_is_block_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISCHARACTERDEVICE_0000
   * @tc.name fileIO_stat_async_is_character_device_000
   * @tc.desc Test the isCharacterDevice() method of class Stat. Promise.
   * This interface shall not treat a normal file as a character special device.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_character_device_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_character_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isCharacterDevice() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isCharacterDevice() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_character_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISCHARACTERDEVICE_0100
   * @tc.name fileIO_stat_async_is_character_device_001
   * @tc.desc Test the isCharacterDevice() method of class Stat. Callback.
   * This interface shall not treat a normal file as a character special device.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_character_device_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_character_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_is_character_device_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isCharacterDevice() === false).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_is_character_device_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat2.isCharacterDevice() === false).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_is_character_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISDIRECTORY_0000
   * @tc.name fileIO_stat_async_is_directory_000
   * @tc.desc Test the isDirectory() method of class Stat. Promise.
   * This interface shall not treat a normal file as a directory.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_directory_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_directory_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isDirectory() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isDirectory() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_directory_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISDIRECTORY_0100
   * @tc.name fileIO_stat_async_is_directory_001
   * @tc.desc Test the isDirectory() method of class Stat. Promise.
   * This interface shall not treat a directory as a directory.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_directory_001', 0, async function (done) {
    let dpath = await nextFileName('fileIO_stat_async_is_directory_001') + 'd';

    try {
      fileIO.mkdirSync(dpath);
      let stat = await fileIO.stat(dpath);
      expect(stat.isDirectory() === true).assertTrue();

      let file = fileIO.openSync(dpath, fileIO.OpenMode.DIR);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isDirectory() === true).assertTrue();
      fileIO.closeSync(file);
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_directory_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISDIRECTORY_0200
   * @tc.name fileIO_stat_async_is_directory_002
   * @tc.desc Test the isDirectory() method of class Stat. Callback.
   * This interface shall not treat a directory as a directory.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_directory_002', 0, async function (done) {
    let dpath = await nextFileName('fileIO_stat_async_is_directory_002') + 'd';

    try {
      fileIO.mkdirSync(dpath);
      fileIO.stat(dpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_is_directory_002 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isDirectory() === true).assertTrue();
      });

      let file = fileIO.openSync(dpath, fileIO.OpenMode.DIR);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_is_directory_002 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat2.isDirectory() === true).assertTrue();
        fileIO.closeSync(file);
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_is_directory_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFIFO_0000
   * @tc.name fileIO_stat_async_is_fifo_000
   * @tc.desc Test the isFIFO() method of class Stat. Promise.
   * This interface shall not treat a normal file as a FIFO.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_fifo_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_fifo_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isFIFO() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isFIFO() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_fifo_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFIFO_0100
   * @tc.name fileIO_stat_async_is_fifo_001
   * @tc.desc Test the isFIFO() method of class Stat. Callback.
   * This interface shall not treat a normal file as a FIFO.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_fifo_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_fifo_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_is_fifo_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isFIFO() === false).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_is_fifo_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat2.isFIFO() === false).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_is_fifo_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFILE_0000
   * @tc.name fileIO_stat_async_is_file_000
   * @tc.desc Test the isFile() method of class Stat. Promise.
   * This interface shall treat a normal file as a normal file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_file_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_file_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isFile() === true).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isFile() === true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_file_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFILE_0100
   * @tc.name fileIO_stat_async_is_file_001
   * @tc.desc Test the isFile() method of class Stat. Callback.
   * This interface shall treat a normal file as a normal file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_file_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_file_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_is_file_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isFile() === true).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_is_file_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat2.isFile() === true).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_is_file_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFILE_0200
   * @tc.name fileIO_stat_async_is_file_002
   * @tc.desc Test the isFile() method of class Stat. Promise.
   * This interface shall not treat a directory as a normal file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_file_002', 0, async function (done) {
    let dpath = await nextFileName('fileIO_stat_async_is_file_002');

    try {
      fileIO.mkdirSync(dpath);
      let stat = await fileIO.stat(dpath);
      expect(stat.isFile() === false).assertTrue();

      let file = fileIO.openSync(dpath, fileIO.OpenMode.DIR);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isFile() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_file_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSOCKET_0000
   * @tc.name fileIO_stat_async_is_socket_000
   * @tc.desc Test the isSocket() method of class Stat. Promise.
   * This interface shall not treat a file as a socket.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_socket_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_socket_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isSocket() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isSocket() === false).assertTrue();
      fileIO.closeSync(file);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_socket_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSOCKET_0100
   * @tc.name fileIO_stat_async_is_socket_001
   * @tc.desc Test the isSocket() method of class Stat. Callback.
   * This interface shall not treat a file as a socket.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_socket_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_socket_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_is_socket_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isSocket() === false).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_is_socket_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat2.isSocket() === false).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_is_socket_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSYMBOLICLINK_0000
   * @tc.name fileIO_stat_async_is_symbolic_link_000
   * @tc.desc Test the isSymbolicLink() method of class Stat. Promise.
   * This interface shall not treat a normal file as a symbolic link.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_symbolic_link_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_symbolic_link_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isSymbolicLink() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isSymbolicLink() === false).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_symbolic_link_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSYMBOLICLINK_0100
   * @tc.name fileIO_stat_async_is_symbolic_link_001
   * @tc.desc Test the isSymbolicLink() method of class Stat. Callback.
   * This interface shall not treat a normal file as a symbolic link.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_is_symbolic_link_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_symbolic_link_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_is_symbolic_link_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.isSymbolicLink() === false).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_is_symbolic_link_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat2.isSymbolicLink() === false).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_APPEND_FILE_SYNC_0000
   * @tc.name fileIO_stat_sync_append_file_sync_000
   * @tc.desc Test statSync() interface.
   * Modify the file, view the file status changes by path.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_append_file_sync_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_append_file_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.size)).assertTrue();

      let file = fileIO.openSync(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      expect(fileIO.writeSync(file.fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);

      stat = fileIO.statSync(fpath);
      expect(stat.size == FILE_CONTENT.length * 2).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_append_file_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_APPEND_FILE_SYNC_0100
   * @tc.name fileIO_stat_sync_append_file_sync_001
   * @tc.desc Test statSync() interface.
   * Modify the file, view the file status changes by fd.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_append_file_sync_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_append_file_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE);
      let stat = fileIO.statSync(file.fd);
      expect(isIntNum(stat.size)).assertTrue();
      expect(isIntNum(file.fd)).assertTrue();
      expect(fileIO.writeSync(file.fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);

      let file2 = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      stat = fileIO.statSync(file2.fd);
      expect(stat.size == FILE_CONTENT.length * 2).assertTrue();
      fileIO.closeSync(file2);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_append_file_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_LOCATION_0000
   * @tc.name fileIO_stat_async_location_000
   * @tc.desc Test the location member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.location is LOCAl.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_location_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_location_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.location == 1).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.location == 1).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_location_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_LOCATION_0100
   * @tc.name fileIO_stat_async_location_001
   * @tc.desc Test the location member of class Stat. Callback.
   * Enter the path or fd parameter to get stat.location is LOCAl.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_location_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_location_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, (err, stat) => {
        if(err) {
          console.log('fileIO_stat_async_location_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat.location == 1).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, (err, stat2) => {
        if(err) {
          console.log('fileIO_stat_async_location_001 error package2: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(stat2.location == 1).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_location_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_LOCATION_0200
   * @tc.name fileIO_stat_async_location_002
   * @tc.desc Test the location member of class Stat. Promise.
   * Enter the path or fd parameter to get stat.location is CLOUD.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_stat_async_location_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_location_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath);
      let stat = await fileIO.stat(file.fd);
      let filelocation = LocationType.CLOUD;
      expect(filelocation == 2).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_location_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}