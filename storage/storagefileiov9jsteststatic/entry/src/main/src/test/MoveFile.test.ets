import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOMoveFile() {
  describe('fileIO_fs_moveFile', (): void => {

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0000
     * @tc.name fileIO_test_moveFile_sync_static_000
     * @tc.desc Test moveFileSync() interface.
     * Move a single file, shall work properly in normal case.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveFile_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_000');
      let fpath = dpath + '/file_000.txt';
      let ddpath = dpath + '/dir_000';
      let ffpath = ddpath + '/file_000.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFileSync(fpath, ffpath);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0100
     * @tc.name fileIO_test_moveFile_sync_static_001
     * @tc.desc Test moveFileSync() interface.
     * A file with the same name already exists under the destination path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_001');
      let fpath = dpath + '/file_001.txt';
      let ddpath = dpath + '/dir_001';
      let ffpath = ddpath + '/file_001.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, ffpath);
        fs.moveFileSync(fpath, ffpath, 1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_001 end error' + JSON.stringify(e));
        expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0200
     * @tc.name fileIO_test_moveFile_sync_static_002
     * @tc.desc Test moveFileSync() interface.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_002');
      let fpath = dpath + '/file_002.txt';
      let ddpath = dpath + '/dir_002';
      let ffpath = ddpath + '/file_002.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);

      try {
        fs.moveFileSync(fpath, ffpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_002 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0400
     * @tc.name fileIO_test_moveFile_sync_static_004
     * @tc.desc Test moveFileSync() interface.
     * The path point to a directory, not a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_004');
      let ddpath = dpath + '/dir_003';
      fs.mkdirSync(dpath);

      try {
        fs.moveFileSync(dpath, ddpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0600
     * @tc.name fileIO_test_moveFile_sync_static_006
     * @tc.desc Test moveFileSync() interface.
     * Entry parameters increase forced movement when mode = 0.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_006');
      let fpath = dpath + '/file_004.txt';
      let ddpath = dpath + '/dir_004';
      let ffpath = ddpath + '/file_004.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath, '')).assertTrue();

      try {
        fs.moveFileSync(fpath, ffpath, 0);
        let str1 = fs.readTextSync(ffpath);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_006 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0700
     * @tc.name fileIO_test_moveFile_sync_static_007
     * @tc.desc Test moveFileSync() interface.
     * Undefined option arguments, use default mode = 0.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_007');
      let fpath = dpath + '/file_015.txt';
      let ddpath = dpath + '/dir_015';
      let ffpath = ddpath + '/file_015.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFileSync(fpath, ffpath, undefined);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0000
     * @tc.name fileIO_test_moveFile_async_static_000
     * @tc.desc Test moveFile() interface. Promise.
     * Move a single file, shall work properly in normal case.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveFile_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_000');
      let fpath = dpath + '/file_005.txt';
      let ddpath = dpath + '/dir_005';
      let ffpath = ddpath + '/file_005.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.moveFile(fpath, ffpath);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0100
     * @tc.name fileIO_test_moveFile_async_static_001
     * @tc.desc Test moveFile() interface. Callback.
     * Move a single file, shall work properly in normal case.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_001');
      let fpath = dpath + '/file_006.txt';
      let ddpath = dpath + '/dir_006';
      let ffpath = ddpath + '/file_006.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFile(fpath, ffpath, (err: BusinessError<void> | null) => {
          let stat = fs.statSync(ffpath);
          expect(stat.size == FILE_CONTENT.length).assertTrue();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0200
     * @tc.name fileIO_test_moveFile_async_static_002
     * @tc.desc Test moveFile() interface. Promise.
     * A file with the same name already exists under the destination path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_002');
      let fpath = dpath + '/file_007.txt';
      let ddpath = dpath + '/dir_007';
      let ffpath = ddpath + '/file_007.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, ffpath);
        await fs.moveFile(fpath, ffpath, 1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_002 end error' + JSON.stringify(e));
        expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0300
     * @tc.name fileIO_test_moveFile_async_static_003
     * @tc.desc Test moveFile() interface. Callback.
     * A file with the same name already exists under the destination path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_003');
      let fpath = dpath + '/file_008.txt';
      let ddpath = dpath + '/dir_008';
      let ffpath = ddpath + '/file_008.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, ffpath);
        fs.moveFile(fpath, ffpath, 1, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.rmdirSync(dpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_003 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900015 && err?.message == 'File exists').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0400
     * @tc.name fileIO_test_moveFile_async_static_004
     * @tc.desc Test moveFile() interface. Promise.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_004');
      let fpath = dpath + '/file_009.txt';
      let ddpath = dpath + '/dir_009';
      let ffpath = ddpath + '/file_009.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);

      try {
        await fs.moveFile(fpath, ffpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0500
     * @tc.name fileIO_test_moveFile_async_static_005
     * @tc.desc Test moveFile() interface. Callback.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_005');
      let fpath = dpath + '/file_010.txt';
      let ddpath = dpath + '/dir_010';
      let ffpath = ddpath + '/file_010.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);

      try {
        fs.moveFile(fpath, ffpath, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.rmdirSync(dpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_005 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_005 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0600
     * @tc.name fileIO_test_moveFile_async_static_006
     * @tc.desc Test moveFile() interface. Promise.
     * The path point to a directory, not a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_006');
      let ddpath = dpath + '/dir_011';
      fs.mkdirSync(dpath);

      try {
        await fs.moveFile(dpath, ddpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_006 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0700
     * @tc.name fileIO_test_moveFile_async_static_007
     * @tc.desc Test moveFile() interface. Callback.
     * The path point to a directory, not a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_007');
      let ddpath = dpath + '/dir_012';
      fs.mkdirSync(dpath);

      try {
        fs.moveFile(dpath, ddpath, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_007 error1' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            fs.rmdirSync(dpath);
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0900
     * @tc.name fileIO_test_moveFile_async_static_009
     * @tc.desc Test moveFile() interface. Promise.
     * Entry parameters increase forced movement when mode = 0.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_009');
      let fpath = dpath + '/file_013.txt';
      let ddpath = dpath + '/dir_013';
      let ffpath = ddpath + '/file_013.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath, '')).assertTrue();

      try {
        await fs.moveFile(fpath, ffpath, 0);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1000
     * @tc.name fileIO_test_moveFile_async_static_010
     * @tc.desc Test moveFile() interface. Callback.
     * Entry parameters increase forced movement when mode = 0.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_010');
      let fpath = dpath + '/file_014.txt';
      let ddpath = dpath + '/dir_014';
      let ffpath = ddpath + '/file_014.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath, '')).assertTrue();

      try {
        fs.moveFile(fpath, ffpath, 0, (err: BusinessError<void> | null) => {
          let stat = fs.statSync(ffpath);
          expect(stat.size == FILE_CONTENT.length).assertTrue();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_010 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1100
     * @tc.name fileIO_test_moveFile_async_static_011
     * @tc.desc Test moveFile() interface. Promise.
     * Undefined option arguments, use default mode = 0.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveFile_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_011');
      let fpath = dpath + '/file_016.txt';
      let ddpath = dpath + '/dir_016';
      let ffpath = ddpath + '/file_016.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath, '')).assertTrue();

      try {
        await fs.moveFile(fpath, ffpath, undefined);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_011 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}