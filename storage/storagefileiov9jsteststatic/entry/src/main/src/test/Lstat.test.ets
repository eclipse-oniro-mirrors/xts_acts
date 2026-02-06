import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOLstat() {
  describe('fileIO_fs_lstat', (): void => {

    /**
     * @tc.number SUB_DF_fileIO_lstat_sync_static_0000
     * @tc.name fileIO_lstat_sync_static_000
     * @tc.desc Test lstatSync() interface.
     * Enter the path parameter to get the file stat.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_lstat_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(stat !== null).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_sync_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_sync_static_0100
     * @tc.name fileIO_lstat_sync_static_001
     * @tc.desc Test lstatSync() interface.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_sync_static_001');

      try {
        fs.lstatSync(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_sync_static_001 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_ino_static_0000
     * @tc.name fileIO_lstat_ino_static_000
     * @tc.desc Test the ino member of class Stat.
     * Enter the path parameter to get stat.ino of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_ino_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_ino_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(await Utils.isBigInt(stat.ino)).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_ino_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_mode_static_0000
     * @tc.name fileIO_lstat_mode_static_000
     * @tc.desc Test the mode member of class Stat.
     * Enter the path parameter to get stat.mode of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_mode_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_mode_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(await Utils.isIntNum(stat.mode)).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_mode_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_uid_static_0000
     * @tc.name fileIO_lstat_uid_static_000
     * @tc.desc Test the uid member of class Stat.
     * Enter the path parameter to get stat.uid of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_uid_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_uid_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(await Utils.isIntNum(stat.uid)).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_uid_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_LSTAT_GID_0000
     * @tc.name fileIO_lstat_gid_static_000
     * @tc.desc Test the gid member of class Stat.
     * Enter the path parameter to get stat.gid of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_gid_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_gid_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(await Utils.isIntNum(stat.gid)).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_gid_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_LSTAT_SIZE_0000
     * @tc.name fileIO_lstat_size_static_000
     * @tc.desc Test the size member of class Stat.
     * Enter the path parameter to get stat.size of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_size_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_size_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(await Utils.isIntNum(stat.size)).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_size_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_LSTAT_ATIME_0000
     * @tc.name fileIO_lstat_atime_static_000
     * @tc.desc Test the atime member of class Stat.
     * Enter the path or parameter to get stat.atime of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_atime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_atime_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(await Utils.isIntNum(stat.atime)).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_atime_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_LSTAT_MTIME_0000
     * @tc.name fileIO_lstat_mtime_static_000
     * @tc.desc Test the mtime member of class Stat.
     * Enter the path parameter to get stat.mtime of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_mtime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_mtime_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(await Utils.isIntNum(stat.mtime)).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_mtime_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_LSTAT_CTIME_0000
     * @tc.name fileIO_lstat_ctime_static_000
     * @tc.desc Test the ctime member of class Stat.
     * Enter the path parameter to get stat.ctime of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_ctime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_ctime_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(await Utils.isIntNum(stat.ctime)).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_ctime_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_is_block_device_static_0000
     * @tc.name fileIO_lstat_is_block_device_static_000
     * @tc.desc Test Lstat.isBlockDevice() interface.
     * This interface shall not treat a normal file as a block special device.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_is_block_device_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_is_block_device_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(stat.isBlockDevice() === false).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_is_block_device_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_is_character_device_static_0000
     * @tc.name fileIO_lstat_is_character_device_static_000
     * @tc.desc Test Lstat.isCharacterDevice() interface.
     * This interface shall not treat a normal file as a character special device.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_is_character_device_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_is_character_device_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(stat.isCharacterDevice() === false).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_is_character_device_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_is_directory_static_0000
     * @tc.name fileIO_lstat_is_directory_static_000
     * @tc.desc Test Lstat.isDirectory() interface.
     * This interface shall not treat a normal file as a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_is_directory_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_is_directory_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(stat.isDirectory() === false).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_is_directory_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_is_directory_static_0100
     * @tc.name fileIO_lstat_is_directory_static_001
     * @tc.desc Test Lstat.isDirectory() interface.
     * This interface shall treat a directory as a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_is_directory_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_lstat_is_directory_static_001');

      try {
        fs.mkdirSync(dpath);
        let stat = fs.lstatSync(dpath);
        expect(stat.isDirectory() === true).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_is_directory_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_is_fifo_static_0000
     * @tc.name fileIO_lstat_is_fifo_static_000
     * @tc.desc Test Lstat.isFIFO() interface.
     * This interface shall not treat a normal file as a FIFO.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_is_fifo_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_is_fifo_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(stat.isFIFO() === false).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_is_fifo_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_is_file_static_0000
     * @tc.name fileIO_lstat_is_file_static_000
     * @tc.desc Test Lstat.isFile() interface.
     * This interface shall treat a normal file as a normal file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_is_file_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_is_file_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(stat.isFile() === true).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_is_file_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_is_file_static_0100
     * @tc.name fileIO_lstat_is_file_static_001
     * @tc.desc Test Lstat.isFile() interface.
     * This interface shall not treat a directory as a normal file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_is_file_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_lstat_is_file_static_001');

      try {
        fs.mkdirSync(dpath);
        let stat = fs.lstatSync(dpath);
        expect(stat.isFile() === false).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_is_file_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_is_socket_static_0000
     * @tc.name fileIO_lstat_is_socket_static_000
     * @tc.desc Test Lstat.isSocket() interface.
     * This interface shall not treat a file as a socket.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_is_socket_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_is_socket_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(stat.isSocket() === false).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_is_socket_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_is_symbolic_link_static_0000
     * @tc.name fileIO_lstat_is_symbolic_link_static_000
     * @tc.desc Test Lstat.isSymbolicLink() interface.
     * This interface shall not treat a normal file as a symbolic link.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_is_symbolic_link_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_is_symbolic_link_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(stat.isSymbolicLink() === false).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_is_symbolic_link_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_static_0000
     * @tc.name fileIO_lstat_async_static_000
     * @tc.desc Test lstat() interface. Promise.then().catch()
     * Enter the path parameter to get the file stat.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_lstat_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath).then((stat: fs.Stat) => {
          expect(stat !== null).assertTrue();
          fs.unlinkSync(fpath);
          done();
        }).catch((err: ()=>void): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_static_000 has error' + JSON.stringify(err));
          expect(false).assertTrue();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_static_0100
     * @tc.name fileIO_lstat_async_static_001
     * @tc.desc Test lstat() interface. Callback.
     * Enter the path or parameter to get the file stat.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError<void> | null) => {
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_static_0200
     * @tc.name fileIO_lstat_async_static_002
     * @tc.desc Test lstat() interface. Promise.
     * Enter the path or parameter to get the file stat.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(stat !== null).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_static_0300
     * @tc.name fileIO_lstat_async_static_003
     * @tc.desc Test lstat() interface.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_static_003');

      try {
        fs.lstat(fpath, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_static_003 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_static_0400
     * @tc.name fileIO_lstat_async_static_004
     * @tc.desc Test lstat() interface. Promise.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_static_004');

      try {
        await fs.lstat(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_ino_static_0000
     * @tc.name fileIO_lstat_async_ino_static_000
     * @tc.desc Test the ino member of class Stat. Promise.
     * Enter the path parameter to get stat.ino of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_ino_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_ino_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(await Utils.isBigInt(stat.ino)).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_ino_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_ino_static_0100
     * @tc.name fileIO_lstat_async_ino_static_001
     * @tc.desc Test the ino member of class Stat. Callback.
     * Enter the path parameter to get stat.ino of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_ino_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_ino_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(typeof stat?.ino == 'bigint').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_ino_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_mode_static_0000
     * @tc.name fileIO_lstat_async_mode_static_000
     * @tc.desc Test the mode member of class Stat. Promise.
     * Enter the path or parameter to get stat.mode of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_mode_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_mode_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(await Utils.isIntNum(stat.mode)).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_mode_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_mode_static_0100
     * @tc.name fileIO_lstat_async_mode_static_001
     * @tc.desc Test the mode member of class Stat. Callback.
     * Enter the path or parameter to get stat.mode of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_mode_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_mode_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(typeof stat?.mode == 'number').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_mode_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_uid_static_0000
     * @tc.name fileIO_lstat_async_uid_static_000
     * @tc.desc Test the uid member of class Stat. Promise.
     * Enter the path parameter to get stat.uid of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_uid_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_uid_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(await Utils.isIntNum(stat.uid)).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_uid_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_uid_static_0100
     * @tc.name fileIO_lstat_async_uid_static_001
     * @tc.desc Test the uid member of class Stat. Callback.
     * Enter the path parameter to get stat.uid of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_uid_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_uid_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(typeof stat?.uid == 'number').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_uid_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_gid_static_0000
     * @tc.name fileIO_lstat_async_gid_static_000
     * @tc.desc Test the gid member of class Stat. Promise.
     * Enter the path parameter to get stat.gid of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_gid_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_gid_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(await Utils.isIntNum(stat.gid)).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_gid_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_gid_static_0100
     * @tc.name fileIO_lstat_async_gid_static_001
     * @tc.desc Test the gid member of class Stat. Callback.
     * Enter the path parameter to get stat.gid of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_gid_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_gid_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(typeof stat?.gid == 'number').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_gid_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_size_static_0000
     * @tc.name fileIO_lstat_async_size_static_000
     * @tc.desc Test the size member of class Stat. Promise.
     * Enter the path parameter to get stat.size of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_size_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_size_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(await Utils.isIntNum(stat.size)).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_size_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_size_static_0100
     * @tc.name fileIO_lstat_async_size_static_001
     * @tc.desc Test the size member of class Stat. Callback.
     * Enter the path parameter to get stat.size of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_size_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_size_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(typeof stat?.size == 'number').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_size_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_atime_static_0000
     * @tc.name fileIO_lstat_async_atime_static_000
     * @tc.desc Test the atime member of class Stat. Promise.
     * Enter the path parameter to get stat.atime of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_atime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_atime_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(await Utils.isIntNum(stat.atime)).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_atime_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_atime_static_0100
     * @tc.name fileIO_lstat_async_atime_static_001
     * @tc.desc Test the atime member of class Stat. Callback.
     * Enter the path or fd parameter to get stat.atime of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_atime_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_atime_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(typeof stat?.atime == 'number').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_atime_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_mtime_static_0000
     * @tc.name fileIO_lstat_async_mtime_static_000
     * @tc.desc Test the mtime member of class Stat. Promise.
     * Enter the path or fd parameter to get stat.mtime of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_mtime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_mtime_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(await Utils.isIntNum(stat.mtime)).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_mtime_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_mtime_static_0100
     * @tc.name fileIO_lstat_async_mtime_static_001
     * @tc.desc Test the mtime member of class Stat. Callback.
     * Enter the path or fd parameter to get stat.mtime of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_mtime_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_mtime_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(typeof stat?.mtime == 'number').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_mtime_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_ctime_static_0000
     * @tc.name fileIO_lstat_async_ctime_static_000
     * @tc.desc Test the ctime member of class Stat. Promise.
     * Enter the path or fd parameter to get stat.ctime of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_ctime_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_ctime_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(await Utils.isIntNum(stat.ctime)).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_ctime_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_ctime_static_0100
     * @tc.name fileIO_lstat_async_ctime_static_001
     * @tc.desc Test the ctime member of class Stat. Callback.
     * Enter the path or fd parameter to get stat.ctime of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_ctime_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_ctime_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(typeof stat?.ctime == 'number').assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_ctime_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_block_device_static_0000
     * @tc.name fileIO_lstat_async_is_block_device_static_000
     * @tc.desc Test the isBlockDevice() method of class Stat. Promise.
     * This interface shall not treat a normal file as a block special device.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_block_device_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_block_device_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(stat.isBlockDevice() === false).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_block_device_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_block_device_static_0010
     * @tc.name fileIO_lstat_async_is_block_device_static_001
     * @tc.desc Test the isBlockDevice() method of class Stat. Callback.
     * This interface shall not treat a normal file as a block special device.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_block_device_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_block_device_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(stat?.isBlockDevice() === false).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_block_device_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_character_device_static_0000
     * @tc.name fileIO_lstat_async_is_character_device_static_000
     * @tc.desc Test the isCharacterDevice() method of class Stat. Promise.
     * This interface shall not treat a normal file as a character special device.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_character_device_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_character_device_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(stat.isCharacterDevice() === false).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_character_device_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_character_device_static_0010
     * @tc.name fileIO_lstat_async_is_character_device_static_001
     * @tc.desc Test the isCharacterDevice() method of class Stat. Callback.
     * This interface shall not treat a normal file as a character special device.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_character_device_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_character_device_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(stat?.isCharacterDevice() === false).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_character_device_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_directory_static_0000
     * @tc.name fileIO_lstat_async_is_directory_static_000
     * @tc.desc Test the isDirectory() method of class Stat. Promise.
     * This interface shall not treat a normal file as a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_directory_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_directory_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(stat.isDirectory() === false).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_directory_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_directory_static_0010
     * @tc.name fileIO_lstat_async_is_directory_static_001
     * @tc.desc Test the isDirectory() method of class Stat. Promise.
     * This interface shall not treat a directory as a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_directory_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_lstat_async_is_directory_static_001');


      try {
        fs.mkdirSync(dpath);
        let stat = await fs.lstat(dpath);
        expect(stat.isDirectory() === true).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_directory_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_directory_static_0020
     * @tc.name fileIO_lstat_async_is_directory_static_002
     * @tc.desc Test the isDirectory() method of class Stat. Callback.
     * This interface shall not treat a directory as a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_directory_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_lstat_async_is_directory_static_002');

      try {
        fs.mkdirSync(dpath);
        fs.lstat(dpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(stat?.isDirectory() === true).assertTrue();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_directory_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_fifo_static_0000
     * @tc.name fileIO_lstat_async_is_fifo_static_000
     * @tc.desc Test the isFIFO() method of class Stat. Promise.
     * This interface shall not treat a normal file as a FIFO.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_fifo_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_fifo_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(stat.isFIFO() === false).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_fifo_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_fifo_static_0010
     * @tc.name fileIO_lstat_async_is_fifo_static_001
     * @tc.desc Test the isFIFO() method of class Stat. Callback.
     * This interface shall not treat a normal file as a FIFO.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_fifo_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_fifo_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(stat?.isFIFO() === false).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_fifo_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_file_static_0000
     * @tc.name fileIO_lstat_async_is_file_static_000
     * @tc.desc Test the isFile() method of class Stat. Promise.
     * This interface shall treat a normal file as a normal file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_file_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_file_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(stat.isFile() === true).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_file_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_file_static_0010
     * @tc.name fileIO_lstat_async_is_file_static_001
     * @tc.desc Test the isFile() method of class Stat. Callback.
     * This interface shall treat a normal file as a normal file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_file_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_file_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(stat?.isFile() === true).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_file_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_file_static_0020
     * @tc.name fileIO_lstat_async_is_file_static_002
     * @tc.desc Test the isFile() method of class Stat. Promise.
     * This interface shall not treat a directory as a normal file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_file_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_lstat_async_is_file_static_002');

      try {
        fs.mkdirSync(dpath);
        let stat = await fs.lstat(dpath);
        expect(stat.isFile() === false).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_file_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_socket_static_0000
     * @tc.name fileIO_lstat_async_is_socket_static_000
     * @tc.desc Test the isSocket() method of class Stat. Promise.
     * This interface shall not treat a file as a socket.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_socket_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_socket_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(stat.isSocket() === false).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_socket_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_socket_static_0010
     * @tc.name fileIO_lstat_async_is_socket_static_001
     * @tc.desc Test the isSocket() method of class Stat. Callback.
     * This interface shall not treat a file as a socket.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_socket_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_socket_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(stat?.isSocket() === false).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_socket_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_symbolic_link_static_0000
     * @tc.name fileIO_lstat_async_is_symbolic_link_static_000
     * @tc.desc Test the isSymbolicLink() method of class Stat. Promise.
     * This interface shall not treat a normal file as a symbolic link.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_symbolic_link_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_symbolic_link_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = await fs.lstat(fpath);
        expect(stat.isSymbolicLink() === false).assertTrue();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_symbolic_link_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_fileIO_lstat_async_is_symbolic_link_static_0100
     * @tc.name fileIO_lstat_async_is_symbolic_link_static_001
     * @tc.desc Test the isSymbolicLink() method of class Stat. Callback.
     * This interface shall not treat a normal file as a symbolic link.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_lstat_async_is_symbolic_link_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_lstat_async_is_symbolic_link_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.lstat(fpath, (err: BusinessError | null, stat: fs.Stat | undefined) => {
          expect(stat?.isSymbolicLink() === false).assertTrue();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_lstat_async_is_symbolic_link_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_APPEND_FILE_SYNC_0010
     * @tc.name fileIO_test_append_file_sync_static_000
     * @tc.desc Test lstat.lstatSync() interface.
     * Modify the file, view the file status changes by path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_append_file_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_append_file_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.lstatSync(fpath);
        expect(await Utils.isIntNum(stat.size)).assertTrue();

        let file = fs.openSync(fpath, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();

        expect(fs.writeSync(file.fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);

        stat = fs.lstatSync(fpath);
        expect(stat.size == FILE_CONTENT.length * 2).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_append_file_sync_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}