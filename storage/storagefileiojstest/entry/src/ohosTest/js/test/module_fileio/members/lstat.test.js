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
  fileio, FILE_CONTENT, prepareFile, nextFileName, isIntNum, isBigInt, isBoolean,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioLstat() {
describe('fileio_lstat', function () {

  /**
   * @tc.name   fileio_lstat_sync_000
   * @tc.number SUB_DF_FILEIO_LSTAT_SYNC_0000
   * @tc.desc   Test Lstat.lstatSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat !== null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_sync_001
   * @tc.number SUB_DF_FILEIO_LSTAT_SYNC_0010
   * @tc.desc   Test Lstat.lstatSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_sync_001');

    try {
      fileio.lstatSync(fpath);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_lstat_sync_001 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_lstat_dev_000
   * @tc.number SUB_DF_FILEIO_LSTAT_DEV_0000
   * @tc.desc   Test the dev member of class Lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_dev_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_dev_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.dev)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_dev_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_ino_000
   * @tc.number SUB_DF_FILEIO_LSTAT_INO_0000
   * @tc.desc   Test the ino member of class Lstat
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_ino_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_ino_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.lstatSync(fpath);
      expect(isBigInt(stat.ino)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_ino_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_mode_000
   * @tc.number SUB_DF_FILEIO_LSTAT_MODE_0000
   * @tc.desc   Test the mode member of class Lstat
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_mode_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_mode_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.mode)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_mode_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_nlink_000
   * @tc.number SUB_DF_FILEIO_LSTAT_NLINK_0000
   * @tc.desc   Test the nlink member of class Lstat
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_nlink_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_nlink_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.nlink)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_nlink_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_uid_000
   * @tc.number SUB_DF_FILEIO_LSTAT_UID_0000
   * @tc.desc   Test the uid member of class Lstat
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_uid_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_uid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.uid)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_uid_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_gid_000
   * @tc.number SUB_DF_FILEIO_LSTAT_GID_0000
   * @tc.desc   Test the gid member of class Lstat
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_gid_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_gid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.gid)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_gid_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_rdev_000
   * @tc.number SUB_DF_FILEIO_LSTAT_RDEV_0000
   * @tc.desc   Test the rdev member of class Lstat
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_rdev_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_rdev_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.rdev)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_rdev_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_size_000
   * @tc.number SUB_DF_FILEIO_LSTAT_SIZE_0000
   * @tc.desc   Test the size member of class Lstat
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_size_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_size_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.size)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_size_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_blocks_000
   * @tc.number SUB_DF_FILEIO_LSTAT_BLOCKS_0000
   * @tc.desc   Test the blocks member of class Lstat
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_blocks_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_blocks_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.blocks)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_blocks_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_atime_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ATIME_0000
   * @tc.desc   Test the atime member of class Lstat
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_atime_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_atime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.atime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_atime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_mtime_000
   * @tc.number SUB_DF_FILEIO_LSTAT_MTIME_0000
   * @tc.desc   Test the mtime member of class Lstat
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_mtime_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_mtime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.mtime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_mtime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_ctime_000
   * @tc.number SUB_DF_FILEIO_LSTAT_CTIME_0000
   * @tc.desc   Test the ctime member of class Lstat
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_ctime_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_ctime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.ctime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_ctime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_block_device_000
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_BLOCK_DEVICE_0000
   * @tc.desc   Test the isBlockDevice() method of class Lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_block_device_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_block_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isBoolean(stat.isBlockDevice())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_block_device_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_block_device_001
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_BLOCK_DEVICE_0010
   * @tc.desc   Test the isBlockDevice() method of class Lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_block_device_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_block_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isBlockDevice() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_block_device_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_lstat_is_block_device_002
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_BLOCK_DEVICE_0020
   * @tc.desc   Test Lstat.isBlockDevice() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_lstat_is_block_device_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_lstat_is_block_device_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isBlockDevice(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_character_device_000
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_CHARACTER_DEVICE_0000
   * @tc.desc   Test Lstat.isCharacterDevice() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_character_device_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_character_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isBoolean(stat.isCharacterDevice())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_character_device_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_character_device_001
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_CHARACTER_DEVICE_0010
   * @tc.desc   Test Lstat.isCharacterDevice() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_character_device_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_character_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isCharacterDevice() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_character_device_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_lstat_is_character_device_002
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_CHARACTER_DEVICE_0020
   * @tc.desc   Test Lstat.isCharacterDevice() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_lstat_is_character_device_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_lstat_is_character_device_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isCharacterDevice(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_directory_000
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_DIRECTORY_0000
   * @tc.desc   Test Lstat.isDirectory() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_directory_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_directory_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isBoolean(stat.isDirectory())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_directory_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_directory_001
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_DIRECTORY_0010
   * @tc.desc   Test Lstat.isDirectory() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_directory_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_directory_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isDirectory() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_directory_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_directory_002
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_DIRECTORY_0020
   * @tc.desc   Test Lstat.isDirectory() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_directory_002', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_lstat_is_directory_002') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = fileio.lstatSync(dpath);
      expect(stat.isDirectory()).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_directory_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_directory_003
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_DIRECTORY_0030
   * @tc.desc   Test Lstat.isDirectory() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_directory_003', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_lstat_is_directory_003') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = fileio.lstatSync(dpath);
      expect(stat.isDirectory(-1)).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_fifo_000
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FIFO_0000
   * @tc.desc   Test Lstat.isFIFO() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_fifo_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_fifo_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isBoolean(stat.isFIFO())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_fifo_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_fifo_001
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FIFO_0010
   * @tc.desc   Test Lstat.isFIFO() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_fifo_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_fifo_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isFIFO() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_fifo_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_lstat_is_fifo_002
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FIFO_0020
   * @tc.desc   Test Lstat.isFIFO() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_lstat_is_fifo_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_lstat_is_fifo_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isFIFO(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_file_000
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FILE_0000
   * @tc.desc   Test Lstat.isFile() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_file_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_file_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isBoolean(stat.isFile())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_file_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_file_001
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FILE_0010
   * @tc.desc   Test Lstat.isFile() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_file_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_file_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isFile()).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_file_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_file_002
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FILE_0020
   * @tc.desc   Test Lstat.isFile() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_file_002', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_lstat_is_file_002');

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = fileio.lstatSync(dpath);
      expect(stat.isFile() === false).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_file_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_lstat_is_file_003
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_FILE_0030
   * @tc.desc   Test Lstat.isFile() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_lstat_is_file_003', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_test_lstat_is_file_003');

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = fileio.lstatSync(dpath);
      expect(stat.isFile(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_socket_000
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_SOCKET_0000
   * @tc.desc   Test Lstat.isSocket() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_socket_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_socket_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isBoolean(stat.isSocket())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_socket_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_socket_001
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_SOCKET_0010
   * @tc.desc   Test Lstat.isSocket() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_socket_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_socket_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isSocket() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_socket_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_lstat_is_socket_002
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_SOCKET_0020
   * @tc.desc   Test Lstat.isSocket() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_lstat_is_socket_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_lstat_is_socket_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isSocket(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_symbolic_link_000
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_SYMBOLIC_LINK_0000
   * @tc.desc   Test Lstat.isSymbolicLink() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_symbolic_link_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_symbolic_link_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isBoolean(stat.isSymbolicLink())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_symbolic_link_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_is_symbolic_link_001
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_SYMBOLIC_LINK_0010
   * @tc.desc   Test Lstat.isSymbolicLink() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_is_symbolic_link_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_lstat_is_symbolic_link_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isSymbolicLink() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_lstat_is_symbolic_link_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_lstat_is_symbolic_link_002
   * @tc.number SUB_DF_FILEIO_LSTAT_IS_SYMBOLIC_LINK_0020
   * @tc.desc   Test Lstat.isSymbolicLink() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_lstat_is_symbolic_link_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_lstat_is_symbolic_link_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(stat.isSymbolicLink(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_0000
   * @tc.desc   Test Stat.lstatAsync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.lstat(fpath).then((stat) => {
        expect(stat !== null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
      });
      done();
    } catch (e) {
      console.log('fileio_lstat_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_001
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_0010
   * @tc.desc   Test Stat.lstatAsync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.lstat(fpath, function (error) {
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileio_lstat_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_002
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_0020
   * @tc.desc   Test Stat.lstatAsync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_002');

    try {
      fileio.lstat(fpath, function (err) {
        done();
      });
    } catch (e) {
      console.log('fileio_lstat_async_002 has failed for ' + e);
      expect(!!e).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_dev_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_DEV_0000
   * @tc.desc   Test the dev member of class Lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_dev_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_dev_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isIntNum(stat.dev)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_dev_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_ino_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_INO_0000
   * @tc.desc   Test the ino member of class Lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_ino_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_ino_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isBigInt(stat.ino)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_ino_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_mode_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_MODE_0000
   * @tc.desc   Test the mode member of class Lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_mode_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_mode_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isIntNum(stat.mode)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_mode_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_nlink_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_NLINK_0000
   * @tc.desc   Test the nlink member of class Lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_nlink_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_nlink_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isIntNum(stat.nlink)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_nlink_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_uid_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_UID_0000
   * @tc.desc   Test the uid member of class Lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_uid_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_uid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isIntNum(stat.uid)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_uid_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_gid_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_GID_0000
   * @tc.desc   Test the gid member of class Lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_gid_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_gid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isIntNum(stat.gid)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_gid_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_rdev_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_RDEV_0000
   * @tc.desc   Test the rdev member of class Lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_rdev_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_rdev_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isIntNum(stat.rdev)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_rdev_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_size_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_SIZE_0000
   * @tc.desc   Test the size member of class lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_size_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_size_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isIntNum(stat.size)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_size_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_blocks_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_BLOCKS_0000
   * @tc.desc   Test the blocks member of class lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_blocks_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_blocks_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isIntNum(stat.blocks)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_blocks_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_atime_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_ATIME_0000
   * @tc.desc   Test the atime member of class lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_atime_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_atime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isIntNum(stat.atime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_atime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_mtime_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_MTIME_0000
   * @tc.desc   Test the mtime member of class lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_mtime_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_mtime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isIntNum(stat.mtime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_mtime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_ctime_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_CTIME_0000
   * @tc.desc   Test the ctime member of class lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_ctime_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_ctime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isIntNum(stat.ctime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_ctime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_block_device_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_BLOCK_DEVICE_0000
   * @tc.desc   Test the isBlockDevice method of class lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_block_device_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_block_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isBoolean(stat.isBlockDevice())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_block_device_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_block_device_001
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_BLOCK_DEVICE_0010
   * @tc.desc   Test the isBlockDevice method of class lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_block_device_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_block_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(stat.isBlockDevice() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_block_device_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_character_device_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_CHARACTER_DEVICE_0000
   * @tc.desc   Test the isCharacterDevice method of class lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_character_device_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_character_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isBoolean(stat.isCharacterDevice())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_character_device_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_character_device_001
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_CHARACTER_DEVICE_0010
   * @tc.desc   Test the isCharacterDevice method of class lstat.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_character_device_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_character_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(stat.isCharacterDevice() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_character_device_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_directory_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_DIRECTORY_0000
   * @tc.desc   Test lstat.isDirectory() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_directory_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_directory_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isBoolean(stat.isDirectory())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_directory_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_directory_001
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_DIRECTORY_0010
   * @tc.desc   Test lstat.isDirectory() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_directory_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_directory_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(stat.isDirectory() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_directory_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_directory_002
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_DIRECTORY_0020
   * @tc.desc   Test lstat.isDirectory() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_directory_002', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_lstat_async_is_directory_002') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = await fileio.lstat(dpath);
      expect(stat.isDirectory()).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_directory_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_fifo_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_FIFO_0000
   * @tc.desc   Test lstat.isFIFO() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_fifo_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_fifo_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isBoolean(stat.isFIFO())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_fifo_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_fifo_001
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_FIFO_0010
   * @tc.desc   Test lstat.isFIFO() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_fifo_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_fifo_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(stat.isFIFO() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_fifo_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_file_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_FILE_0000
   * @tc.desc   Test lstat.isFile() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_file_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_file_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isBoolean(stat.isFile())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_file_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_file_001
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_FILE_0010
   * @tc.desc   Test lstat.isFile() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_file_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_file_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(stat.isFile()).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_file_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_file_002
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_FILE_0020
   * @tc.desc   Test lstat.isFile() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_file_002', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_lstat_async_is_file_002');

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = await fileio.lstat(dpath);
      expect(stat.isFile() === false).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_file_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_socket_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_SOCKET_0000
   * @tc.desc   Test lstat.isSocket() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_socket_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_socket_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isBoolean(stat.isSocket())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_socket_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_socket_001
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_SOCKET_0010
   * @tc.desc   Test lstat.isSocket() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_socket_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_socket_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(stat.isSocket() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_socket_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_symbolic_link_000
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_SYMBOLIC_LINK_0000
   * @tc.desc   Test lstat.isSymbolicLink() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_symbolic_link_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_symbolic_link_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(isBoolean(stat.isSymbolicLink())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_symbolic_link_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_lstat_async_is_symbolic_link_001
   * @tc.number SUB_DF_FILEIO_LSTAT_ASYNC_IS_SYMBOLIC_LINK_0010
   * @tc.desc   Test lstat.isSymbolicLink() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_lstat_async_is_symbolic_link_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_lstat_async_is_symbolic_link_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.lstat(fpath);
      expect(stat.isSymbolicLink() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_lstat_async_is_symbolic_link_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_append_file_sync_000
   * @tc.number SUB_DF_FILEIO_APPEND_FILE_SYNC_0010
   * @tc.desc   Test lstat.lstatSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_append_file_sync_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_append_file_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.lstatSync(fpath);
      expect(isIntNum(stat.size)).assertTrue();

      let fd = fileio.openSync(fpath, 0o2002);
      expect(isIntNum(fd)).assertTrue();

      expect(fileio.writeSync(fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();

      stat = fileio.lstatSync(fpath);
      expect(stat.size == FILE_CONTENT.length * 2).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_append_file_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
    done();
  });
});}
