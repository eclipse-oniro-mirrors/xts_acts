/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function fileIOStat() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_stat", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_stat start');

    /**
     * @tc.name   fileIO_stat_sync_static_001
     * @tc.number SUB_DF_fileIO_stat_sync_static_0100
     * @tc.desc   Test statSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_static_001');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_static_001 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        expect(stat !== null).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(stat2 !== null).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_static_002
     * @tc.number SUB_DF_fileIO_stat_sync_static_0200
     * @tc.desc   Test statSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_static_002');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_static_002 fpath: ' + fpath);
        let stat = fs.statSync(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_static_002 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_static_003
     * @tc.number SUB_DF_fileIO_stat_sync_static_0300
     * @tc.desc   Test statSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_stat_sync_static_003');
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_static_003 fpath: ' + fpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.closeSync(file.fd);
        let stat = fs.statSync(file.fd);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_static_003 has failed for' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_ino_static_000
     * @tc.number SUB_DF_fileIO_stat_sync_ino_static_0000
     * @tc.desc   Test the ino member of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_ino_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_ino_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_ino_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_ino_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_ino_static_000 stat.ino: ' + stat.ino);
        expect(await Utils.isBigInt(stat.ino)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(await Utils.isBigInt(stat2.ino)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_ino_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_mode_static_000
     * @tc.number SUB_DF_fileIO_stat_sync_mode_static_0000
     * @tc.desc   Test the mode member of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_mode_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_mode_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_mode_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_mode_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_mode_static_000 stat.mode: ' + stat.mode);
        expect(await Utils.isIntNum(stat.mode)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(await Utils.isIntNum(stat2.mode)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_mode_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_uid_static_000
     * @tc.number SUB_DF_fileIO_stat_sync_uid_static_0000
     * @tc.desc   Test the uid member of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_uid_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_uid_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_uid_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_uid_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_uid_static_000 stat.uid: ' + stat.uid);
        expect(await Utils.isIntNum(stat.uid)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(await Utils.isIntNum(stat2.uid)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_uid_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_gid_static_000
     * @tc.number SUB_DF_fileIO_stat_sync_gid_static_0000
     * @tc.desc   Test the gid member of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_gid_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_gid_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_gid_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_gid_static_000 stat.gid: ' + stat.gid);
        expect(await Utils.isIntNum(stat.gid)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(await Utils.isIntNum(stat2.gid)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_gid_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_size_static_000
     * @tc.number SUB_DF_fileIO_stat_sync_size_static_0000
     * @tc.desc   Test the size member of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_size_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_size_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_size_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_size_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_size_static_000 stat.size: ' + stat.size);
        expect(await Utils.isIntNum(stat.size)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(await Utils.isIntNum(stat2.size)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_size_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_atime_static_000
     * @tc.number SUB_DF_fileIO_stat_sync_atime_static_0000
     * @tc.desc   Test the atime member of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_atime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_atime_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_atime_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_atime_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_atime_static_000 stat.atime: ' + stat.atime);
        expect(await Utils.isIntNum(stat.atime)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(await Utils.isIntNum(stat2.atime)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_atime_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_mtime_static_000
     * @tc.number SUB_DF_fileIO_stat_sync_mtime_static_0000
     * @tc.desc   Test the mtime member of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_mtime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_mtime_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_mtime_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_mtime_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_mtime_static_000 stat.mtime: ' + stat.mtime);
        expect(await Utils.isIntNum(stat.mtime)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(await Utils.isIntNum(stat2.mtime)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_mtime_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_ctime_static_000
     * @tc.number SUB_DF_fileIO_stat_sync_ctime_static_0000
     * @tc.desc   Test the ctime member of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_ctime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_ctime_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_ctime_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_ctime_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_ctime_static_000 stat.ctime: ' + stat.ctime);
        expect(await Utils.isIntNum(stat.ctime)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(await Utils.isIntNum(stat2.ctime)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_ctime_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_is_block_device_static_000
     * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISBLOCKDEVICE_0000
     * @tc.desc   Test the isBlockDevice() method of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_is_block_device_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_block_device_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_is_block_device_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_block_device_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        expect(stat.isBlockDevice() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(stat2.isBlockDevice() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_block_device_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_is_character_device_static_000
     * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISCHARACTER_DEVICE_0000
     * @tc.desc   Test the isCharacterDevice() method of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_is_character_device_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_character_device_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_is_character_device_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_character_device_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        expect(stat.isCharacterDevice() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(stat2.isCharacterDevice() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_character_device_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_is_directory_static_000
     * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISDIRECTORY_0000
     * @tc.desc   Test the isDirectory() method of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_is_directory_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_directory_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_is_directory_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_directory_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        expect(stat.isDirectory() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(stat2.isDirectory() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_directory_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_is_directory_static_001
     * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISDIRECTORY_0100
     * @tc.desc   Test the isDirectory() method of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_is_directory_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_directory_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_is_directory_static_001');
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_directory_static_001 fpath: ' + fpath);
        fs.mkdirSync(fpath);
        let stat = fs.statSync(fpath);
        expect(stat.isDirectory() === true).assertTrue();

        let file = fs.openSync(fpath, fs.OpenMode.DIR);
        let stat2 = fs.statSync(file.fd);
        expect(stat2.isDirectory() === true).assertTrue();
        fs.closeSync(file);
        fs.rmdirSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_directory_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_is_fifo_static_000
     * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFIFO_0000
     * @tc.desc   Test the isFIFO() method of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_is_fifo_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_fifo_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_is_fifo_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        expect(stat.isFIFO() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(stat2.isFIFO() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_fifo_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_is_file_static_000
     * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFILE_0000
     * @tc.desc   Test the isFile() method of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_is_file_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_file_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_is_file_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        expect(stat.isFile() === true).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(stat2.isFile() === true).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_file_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_is_file_static_001
     * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFILE_0100
     * @tc.desc   Test the isFile() method of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_is_file_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_file_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_is_file_static_001');
        fs.mkdirSync(fpath);
        let stat = fs.statSync(fpath);
        expect(stat.isFile() === false).assertTrue();

        let file = fs.openSync(fpath, fs.OpenMode.DIR);
        let stat2 = fs.statSync(file.fd);
        expect(stat2.isFile() === false).assertTrue();
        fs.closeSync(file);
        fs.rmdirSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_directory_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_is_socket_static_000
     * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSOCKET_0000
     * @tc.desc   Test the isSocket() method of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_is_socket_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_socket_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_is_socket_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        expect(stat.isSocket() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(stat2.isSocket() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_socket_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_is_symbolic_link_static_000
     * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSYMBOLICLINK_0000
     * @tc.desc   Test the isSymbolicLink() method of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_is_symbolic_link_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_symbolic_link_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_is_symbolic_link_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let stat = fs.statSync(fpath);
        expect(stat.isSymbolicLink() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(stat2.isSymbolicLink() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_is_symbolic_link_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_static_000
     * @tc.number SUB_DF_fileIO_stat_async_static_0000
     * @tc.desc   Test stat() interface. Promise.then().catch()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        await fs.stat(fpath).then((statres: fs.Stat) => {
          expect(statres !== null).assertTrue();
          let file = fs.openSync(fpath);
          await fs.stat(file.fd).then((stat2: fs.Stat) => {
            expect(stat2 !== null).assertTrue();
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            done();
          }).catch((err: Error): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_000 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          });
        }).catch((err: Error): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_000 has error for' + JSON.stringify(err));
          expect(false).assertTrue();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_static_001
     * @tc.number SUB_DF_fileIO_stat_async_static_0100
     * @tc.desc   Test stat() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(res !== null).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(stat2 !== null).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_static_002
     * @tc.number SUB_DF_fileIO_stat_async_static_0200
     * @tc.desc   Test stat() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_static_002');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          expect(statres !== null).assertTrue();
        });
        let file = fs.openSync(fpath);
        fs.stat(fpath, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          expect(stat2 !== null).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_static_003
     * @tc.number SUB_DF_fileIO_stat_async_static_0300
     * @tc.desc   Test stat() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_003 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_static_003');
        await fs.stat(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_003 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_static_004
     * @tc.number SUB_DF_fileIO_stat_async_static_0400
     * @tc.desc   Test stat() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_004 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_static_004');
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if (err?.code != 0) {
            console.log('fileIO_stat_async_static_004 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_static_005
     * @tc.number SUB_DF_fileIO_stat_async_static_0500
     * @tc.desc   Test stat() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_005 start');
      try {
        await fs.stat(-1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_005 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_static_006
     * @tc.number SUB_DF_fileIO_stat_async_static_0600
     * @tc.desc   Test stat() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_004 start');
      try {
        fs.stat(-1, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if (err?.code != 0) {
            console.log('fileIO_stat_async_static_006 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_static_007
     * @tc.number SUB_DF_fileIO_stat_async_static_0700
     * @tc.desc   Test stat() interface. Promise.then().catch()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_stat_async_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.closeSync(file.fd);
        await fs.stat(file.fd);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_007 has failed for' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        fs.unlinkSync(fpath);
        done();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_static_008
     * @tc.number SUB_DF_fileIO_stat_async_static_0800
     * @tc.desc   Test stat() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_008 start');
      let fpath = await Utils.nextFileName('fileIO_stat_async_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.closeSync(file.fd);
        fs.stat(file.fd, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if (err?.code != 0) {
            console.log('fileIO_stat_async_static_008 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900008 && err?.message == 'Bad file descriptor').assertTrue();
            fs.unlinkSync(fpath);
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_ino_static_000
     * @tc.number SUB_DF_fileIO_stat_async_ino_static_0000
     * @tc.desc   Test the ino member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_ino_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ino_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_ino_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(await Utils.isBigInt(res.ino)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(await Utils.isBigInt(stat2.ino)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ino_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_ino_static_001
     * @tc.number SUB_DF_fileIO_stat_async_ino_static_0100
     * @tc.desc   Test the ino member of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_ino_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ino_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_ino_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          expect(typeof statres?.ino == 'bigint').assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          expect(typeof stat2?.ino == 'bigint').assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ino_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_mode_static_000
     * @tc.number SUB_DF_fileIO_stat_async_mode_static_0000
     * @tc.desc   Test the mode member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_mode_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mode_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_mode_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(await Utils.isIntNum(res.mode)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(await Utils.isIntNum(stat2.mode)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mode_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_mode_static_001
     * @tc.number SUB_DF_fileIO_stat_async_mode_static_0100
     * @tc.desc   Test the mode member of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_mode_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mode_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_mode_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          expect(typeof statres?.mode == 'long').assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          expect(typeof stat2?.mode == 'long').assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mode_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_uid_static_000
     * @tc.number SUB_DF_fileIO_stat_async_uid_static_0000
     * @tc.desc   Test the uid member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_uid_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_uid_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_uid_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(await Utils.isIntNum(res.uid)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(await Utils.isIntNum(stat2.uid)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_uid_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_uid_static_001
     * @tc.number SUB_DF_fileIO_stat_async_uid_static_0100
     * @tc.desc   Test the uid member of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_uid_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_uid_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_uid_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          expect(typeof statres?.uid == 'long').assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          expect(typeof stat2?.uid == 'long').assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_uid_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_gid_static_000
     * @tc.number SUB_DF_fileIO_stat_async_gid_static_0000
     * @tc.desc   Test the gid member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_gid_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_gid_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_gid_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(await Utils.isIntNum(res.gid)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(await Utils.isIntNum(stat2.gid)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_gid_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_gid_static_001
     * @tc.number SUB_DF_fileIO_stat_async_gid_static_0100
     * @tc.desc   Test the gid member of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_gid_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_gid_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_gid_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          expect(typeof statres?.gid == 'long').assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          expect(typeof stat2?.gid == 'long').assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_gid_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_size_static_000
     * @tc.number SUB_DF_fileIO_stat_async_size_static_0000
     * @tc.desc   Test the size member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_size_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_size_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_size_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(await Utils.isIntNum(res.size)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(await Utils.isIntNum(stat2.size)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_size_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_size_static_001
     * @tc.number SUB_DF_fileIO_stat_async_size_static_0100
     * @tc.desc   Test the size member of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_size_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_size_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_size_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          expect(typeof statres?.size == 'long').assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          expect(typeof stat2?.size == 'long').assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_size_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_atime_static_000
     * @tc.number SUB_DF_fileIO_stat_async_atime_static_0000
     * @tc.desc   Test the atime member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_atime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_atime_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_atime_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(await Utils.isIntNum(res.atime)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(await Utils.isIntNum(stat2.atime)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_atime_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_atime_static_001
     * @tc.number SUB_DF_fileIO_stat_async_atime_static_0100
     * @tc.desc   Test the atime member of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_atime_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_atime_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_atime_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          expect(typeof statres?.atime == 'long').assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          expect(typeof stat2?.atime == 'long').assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_atime_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_mtime_static_000
     * @tc.number SUB_DF_fileIO_stat_async_mtime_static_0000
     * @tc.desc   Test the mtime member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_mtime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mtime_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_mtime_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(await Utils.isIntNum(res.mtime)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(await Utils.isIntNum(stat2.mtime)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mtime_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_mtime_static_001
     * @tc.number SUB_DF_fileIO_stat_async_mtime_static_0100
     * @tc.desc   Test the mtime member of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_mtime_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mtime_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_mtime_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          expect(typeof statres?.mtime == 'long').assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          expect(typeof stat2?.mtime == 'long').assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mtime_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_ctime_static_000
     * @tc.number SUB_DF_fileIO_stat_async_ctime_static_0000
     * @tc.desc   Test the ctime member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_ctime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ctime_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_ctime_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(await Utils.isIntNum(res.ctime)).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(await Utils.isIntNum(stat2.ctime)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ctime_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_ctime_static_001
     * @tc.number SUB_DF_fileIO_stat_async_ctime_static_0100
     * @tc.desc   Test the ctime member of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_ctime_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ctime_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_ctime_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          expect(typeof statres?.ctime == 'long').assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          expect(typeof stat2?.ctime == 'long').assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ctime_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_block_device_static_000
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISBLOCKDEVICE_0000
     * @tc.desc   Test the isBlockDevice() method of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_block_device_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_block_device_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_block_device_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(res.isBlockDevice() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(stat2.isBlockDevice() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_block_device_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_block_device_static_001
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISBLOCKDEVICE_0100
     * @tc.desc   Test the isBlockDevice() method of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_block_device_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_block_device_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_block_device_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_block_device_static_001 error1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(statres?.isBlockDevice() === false).assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_block_device_static_001 error2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(stat2?.isBlockDevice() === false).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_block_device_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_character_device_static_000
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISCHARACTERDEVICE_0000
     * @tc.desc   Test the isCharacterDevice() method of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_character_device_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_character_device_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_character_device_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(res.isCharacterDevice() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(stat2.isCharacterDevice() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_character_device_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_character_device_static_001
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISCHARACTERDEVICE_0100
     * @tc.desc   Test the isCharacterDevice() method of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_character_device_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_character_device_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_character_device_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_character_device_static_001 error1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(statres?.isCharacterDevice() === false).assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_character_device_static_001 error2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(stat2?.isCharacterDevice() === false).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_character_device_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_directory_static_000
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISDIRECTORY_0000
     * @tc.desc   Test the isDirectory() method of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_directory_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_directory_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_directory_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(res.isDirectory() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(stat2.isDirectory() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_directory_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_directory_static_001
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISDIRECTORY_0100
     * @tc.desc   Test the isDirectory() method of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_directory_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_directory_static_001 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_stat_async_is_directory_static_001');
        fs.mkdirSync(dpath);
        let res = await fs.stat(dpath);
        expect(res.isDirectory() === true).assertTrue();

        let file = fs.openSync(dpath, fs.OpenMode.DIR);
        let stat2 = await fs.stat(file.fd);
        expect(stat2.isDirectory() === true).assertTrue();
        fs.closeSync(file);
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_directory_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_directory_static_002
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISDIRECTORY_0200
     * @tc.desc   Test the isDirectory() method of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_directory_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_directory_static_002 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_stat_async_is_directory_static_002');
        fs.mkdirSync(dpath);
        fs.stat(dpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_directory_static_002 error1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(statres?.isDirectory() === true).assertTrue();
        })
        let file = fs.openSync(dpath, fs.OpenMode.DIR);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_directory_static_002 error2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(stat2?.isDirectory() === true).assertTrue();
          fs.closeSync(file);
          fs.rmdirSync(dpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_character_device_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_fifo_static_000
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFIFO_0000
     * @tc.desc   Test the isFIFO() method of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_fifo_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_fifo_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_fifo_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(res.isFIFO() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(stat2.isFIFO() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_fifo_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_fifo_static_001
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFIFO_0100
     * @tc.desc   Test the isFIFO() method of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_fifo_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_fifo_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_fifo_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_fifo_static_001 error1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(statres?.isFIFO() === false).assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_fifo_static_001 error2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(stat2?.isFIFO() === false).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_fifo_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_file_static_000
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFILE_0000
     * @tc.desc   Test the isFile() method of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_file_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_file_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_file_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(res.isFile() === true).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(stat2.isFile() === true).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_file_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_file_static_001
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFILE_0100
     * @tc.desc   Test the isFile() method of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_file_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_file_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_file_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_file_static_001 error1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(statres?.isFile() === true).assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_file_static_001 error2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(stat2?.isFile() === true).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_file_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_file_static_002
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFILE_0200
     * @tc.desc   Test the isFile() method of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_file_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_file_static_002 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_stat_async_is_file_static_002');
        fs.mkdirSync(dpath);
        let res = await fs.stat(dpath);
        expect(res.isFile() === false).assertTrue();

        let file = fs.openSync(dpath, fs.OpenMode.DIR);
        let stat2 = await fs.stat(file.fd);
        expect(stat2.isFile() === false).assertTrue();
        fs.closeSync(file);
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_file_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_socket_static_000
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSOCKET_0000
     * @tc.desc   Test the isSocket() method of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_socket_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_socket_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_socket_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(res.isSocket() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(stat2.isSocket() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_socket_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_socket_static_001
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSOCKET_0100
     * @tc.desc   Test the isSocket() method of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_socket_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_socket_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_socket_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_socket_static_001 error1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(statres?.isSocket() === false).assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_socket_static_001 error2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(stat2?.isSocket() === false).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_socket_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_symbolic_link_static_000
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSYMBOLICLINK_0000
     * @tc.desc   Test the isSymbolicLink() method of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_symbolic_link_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_symbolic_link_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_symbolic_link_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(res.isSymbolicLink() === false).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(stat2.isSymbolicLink() === false).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_symbolic_link_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_is_symbolic_link_static_001
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSYMBOLICLINK_0100
     * @tc.desc   Test the isSymbolicLink() method of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_is_symbolic_link_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_symbolic_link_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_is_symbolic_link_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_symbolic_link_static_001 error1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(statres?.isSymbolicLink() === false).assertTrue();
        });
        await Utils.msSleep(3000);
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_symbolic_link_static_001 error2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(stat2?.isSymbolicLink() === false).assertTrue();
          fs.closeSync(file);
          await Utils.msSleep(2000);
          hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_symbolic_link_static_001 unlink start');
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_symbolic_link_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_append_file_sync_static_000
     * @tc.number SUB_DF_FILEIO_STAT_SYNC_APPEND_FILE_SYNC_0000
     * @tc.desc   Test statSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_append_file_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_append_file_sync_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_append_file_sync_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = fs.statSync(fpath);
        expect(await Utils.isIntNum(res.size)).assertTrue();

        let file = fs.openSync(fpath, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        expect(fs.writeSync(file.fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);

        let stat2 = fs.statSync(fpath);
        expect(stat2.size == FILE_CONTENT.length * 2).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_append_file_sync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_append_file_sync_static_001
     * @tc.number SUB_DF_FILEIO_STAT_SYNC_APPEND_FILE_SYNC_0100
     * @tc.desc   Test statSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_append_file_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_append_file_sync_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_append_file_sync_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        let res = fs.statSync(file.fd);
        expect(await Utils.isIntNum(res.size)).assertTrue();
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        expect(fs.writeSync(file.fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);

        let file2 = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let stat2 = fs.statSync(file2.fd);
        expect(stat2.size == FILE_CONTENT.length * 2).assertTrue();
        fs.closeSync(file2);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_append_file_sync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_location_static_000
     * @tc.number SUB_DF_FILEIO_STAT_ASYNC_LOCATION_0000
     * @tc.desc   Test the location member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_stat_async_location_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_stat_async_location_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.stat(fpath);
        expect(stat.location == 1).assertTrue();
        expect(fs.LocationType.LOCAL == 1).assertTrue();
        expect(fs.LocationType.CLOUD == 2).assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(stat2.location == 1).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_is_symbolic_link_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_atimeNs_static_000
     * @tc.number SUB_DF_fileIO_stat_sync_atimeNs_static_0000
     * @tc.desc   Test the atimeNs of class statSync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_atimeNs_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_atimeNs_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_atimeNs_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = fs.statSync(fpath);
        expect(typeof res.atimeNs == 'bigint').assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(typeof stat2.atimeNs == 'bigint').assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_atimeNs_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_atimeNs_static_001
     * @tc.number SUB_DF_fileIO_stat_async_atimeNs_static_0100
     * @tc.desc   Test the atimeNs member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_atimeNs_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_atimeNs_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_atimeNs_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(typeof res.atimeNs == 'bigint').assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(typeof stat2.atimeNs == 'bigint').assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_atimeNs_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_atimeNs_static_002
     * @tc.number SUB_DF_fileIO_stat_async_atimeNs_static_0200
     * @tc.desc   Test the atimeNs member of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_atimeNs_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_atimeNs_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_atimeNs_static_002');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_atimeNs_static_002 error1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof statres?.atimeNs == 'bigint').assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_atimeNs_static_002 error2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof stat2?.atimeNs == 'bigint').assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_atimeNs_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_mtimeNs_static_000
     * @tc.number SUB_DF_fileIO_stat_sync_mtimeNs_static_0000
     * @tc.desc   Test the mtimeNs of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_mtimeNs_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_mtimeNs_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_mtimeNs_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = fs.statSync(fpath);
        expect(typeof res.mtimeNs == 'bigint').assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(typeof stat2.mtimeNs == 'bigint').assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_mtimeNs_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_mtimeNs_static_001
     * @tc.number SUB_DF_fileIO_stat_async_mtimeNs_static_0100
     * @tc.desc   Test the mtimeNs member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_mtimeNs_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mtimeNs_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_mtimeNs_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(typeof res.mtimeNs == 'bigint').assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(typeof stat2.mtimeNs == 'bigint').assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mtimeNs_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_mtimeNs_static_002
     * @tc.number SUB_DF_fileIO_stat_async_mtimeNs_static_0200
     * @tc.desc   Test the mtimeNs member of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_mtimeNs_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mtimeNs_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_mtimeNs_static_002');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mtimeNs_static_002 error1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof statres?.mtimeNs == 'bigint').assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mtimeNs_static_002 error2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof stat2?.mtimeNs == 'bigint').assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_mtimeNs_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_sync_ctimeNs_static_000
     * @tc.number SUB_DF_fileIO_stat_sync_ctimeNs_static_0000
     * @tc.desc   Test the ctimeNs of class Stat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_sync_ctimeNs_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_ctimeNs_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_sync_ctimeNs_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = fs.statSync(fpath);
        expect(typeof res.ctimeNs == 'bigint').assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = fs.statSync(file.fd);
        expect(typeof stat2.ctimeNs == 'bigint').assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_sync_ctimeNs_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_ctimeNs_static_001
     * @tc.number SUB_DF_fileIO_stat_async_ctimeNs_static_0100
     * @tc.desc   Test the ctimeNs member of class Stat. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_ctimeNs_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ctimeNs_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_ctimeNs_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let res = await fs.stat(fpath);
        expect(typeof res.ctimeNs == 'bigint').assertTrue();

        let file = fs.openSync(fpath);
        let stat2 = await fs.stat(file.fd);
        expect(typeof stat2.ctimeNs == 'bigint').assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ctimeNs_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_stat_async_ctimeNs_static_002
     * @tc.number SUB_DF_fileIO_stat_async_ctimeNs_static_0200
     * @tc.desc   Test the ctimeNs member of class Stat. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_stat_async_ctimeNs_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ctimeNs_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_stat_async_ctimeNs_static_002');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.stat(fpath, (err: BusinessError | null, statres: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ctimeNs_static_002 error1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof statres?.ctimeNs == 'bigint').assertTrue();
        })
        let file = fs.openSync(fpath);
        fs.stat(file.fd, (err: BusinessError | null, stat2: fs.Stat | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ctimeNs_static_002 error2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof stat2?.ctimeNs == 'bigint').assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_stat_async_ctimeNs_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_stat end');

}