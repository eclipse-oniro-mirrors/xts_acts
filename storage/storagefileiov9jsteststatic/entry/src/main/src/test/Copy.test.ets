import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base'
import fileUri from '@ohos.file.fileuri';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';
export const CONTENT = 'hello!!!';

export function prepare2GFile(fpath: string) {
  try {
    let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE)
    fs.truncateSync(file.fd)
    let bf = new ArrayBuffer(1024 * 1024 * 20);
    for (let i = 0; i < 100; i++) {
      let offset = bf.byteLength * i;
      let writeLen = fs.writeSync(file.fd, bf, { offset: offset, length: bf.byteLength, encoding: 'utf-8' });
    }
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
    return true
  }
  catch (e) {
    hilog.info(domain, tag, '%{public}s', 'prepare2GFile end error' + JSON.stringify(e));
    return false
  }
}

export default function fileIOCopy() {
  describe('fileIO_fs_copy', (): void => {

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0100
     * @tc.name fileIO_copy_async_static_001
     * @tc.desc Test copy() interfaces.Promise.
     * Test file copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_copy_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_001');
      let fpathTarget = await Utils.nextFileName('dst');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpathTarget, CONTENT)).assertTrue();

      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      let progressListener = (progress: fs.Progress) => {
        hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options: fs.CopyOptions = {
        "progressListener" : progressListener
      }
      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal, options);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0200
     * @tc.name fileIO_copy_async_static_002
     * @tc.desc Test copy() interfaces.Promise.
     * Test file copied successfully by path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_copy_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_002');
      let fpathTarget = fpath + 'dst';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpathTarget, CONTENT)).assertTrue();
      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0300
     * @tc.name fileIO_copy_async_static_003
     * @tc.desc Test copy() interfaces.Promise.
     * The path point to nothing, no such file.Contains progressListener, processedSize, and totalSize parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_copy_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_003');
      let fpathTarget = fpath + 'dst';
      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      let progressListener = (progress: fs.Progress) => {
        hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options: fs.CopyOptions = {
        "progressListener" : progressListener
      }

      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal, options);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_003 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0400
     * @tc.name fileIO_copy_async_static_004
     * @tc.desc Test copy() interfaces.Promise.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_copy_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_004');
      let fpathTarget = fpath + 'dst';
      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0700
     * @tc.name fileIO_copy_async_static_007
     * @tc.desc Test copy() interfaces.callback.
     * Test file copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_copy_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_007');
      let destpath = fpath + 'dest';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(fpath);
      let dstDirUri = fileUri.getUriFromPath(destpath);

      try {
        let progressListener = (progress: fs.Progress) =>  {
          hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
        };
        let options: fs.CopyOptions = {
          "progressListener" : progressListener
        }
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_007 start');
        fs.copy(srcDirUri, dstDirUri, options, (err: BusinessError<void> | null) => {
          let stat1 = fs.statSync(fpath);
          hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_007 stat1' + stat1.size);
          let stat2 = fs.statSync(destpath);
          hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_007 stat2' + stat2.size);
          expect(stat1.size == stat2.size).assertTrue();
          fs.unlinkSync(fpath);
          fs.unlinkSync(destpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0800
     * @tc.name fileIO_copy_async_static_008
     * @tc.desc Test copy() interfaces.
     * Test file copied successfully by path.callback without options.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_copy_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_008');
      let destpath = fpath + 'dest';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(fpath);
      let dstDirUri = fileUri.getUriFromPath(destpath);

      try {
        fs.copy(srcDirUri, dstDirUri, (err: BusinessError<void> | null) => {
          let stat1 = fs.statSync(fpath);
          let stat2 = fs.statSync(destpath);
          expect(stat1.size == stat2.size).assertTrue();
          fs.unlinkSync(fpath);
          fs.unlinkSync(destpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_008 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0900
     * @tc.name fileIO_copy_async_static_009
     * @tc.desc Test copy() interfaces.callback.
     * The path point to nothing, no such file.Contains progressListener, processedSize, and totalSize parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_copy_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_009');
      let destpath = fpath + 'dest';
      let srcDirUri = fileUri.getUriFromPath(fpath);
      let dstDirUri = fileUri.getUriFromPath(destpath);

      try {
        let progressListener = (progress: fs.Progress) => {
          hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
        };
        let options: fs.CopyOptions = {
          "progressListener" : progressListener
        }
        fs.copy(srcDirUri, dstDirUri, options, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_009 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1100
     * @tc.name fileIO_copy_async_static_011
     * @tc.desc Test copy() interfaces.callback
     * Test directory copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_copy_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_copy_async_static_011');
      let ddpath = dpath + '/srcDir_first';
      let dmpath = dpath + '/srcDir_second';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dmpath);
      let ffpath = ddpath + '/srcFile_first_01';
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(ddpath);
      let dstDirUri = fileUri.getUriFromPath(dmpath);

      try {
        let progressListener = (progress: fs.Progress) => {
          hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
        };
        let options: fs.CopyOptions = {
          "progressListener" : progressListener
        }
        fs.copy(srcDirUri, dstDirUri, options, (err: BusinessError<void> | null) => {
          let result1 = fs.listFileSync(ddpath);
          let result2 = fs.listFileSync(dmpath);
          expect(result1.length == result2.length).assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_011 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1200
     * @tc.name fileIO_copy_async_static_012
     * @tc.desc Test copy() interfaces.
     * Test directory copied successfully by path.callback without options.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_copy_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_copy_async_static_012');
      let ddpath = dpath + '/srcDir_first';
      let dmpath = dpath + '/srcDir_second';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dmpath);
      let ffpath = ddpath + '/srcFile_first_01';
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(ddpath);
      let dstDirUri = fileUri.getUriFromPath(dmpath);

      try {
        fs.copy(srcDirUri, dstDirUri, (err: BusinessError<void> | null) => {
          let result1 = fs.listFileSync(ddpath);
          let result2 = fs.listFileSync(dmpath);
          expect(result1.length == result2.length).assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_012 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1300
     * @tc.name fileIO_copy_async_static_013
     * @tc.desc Test copy() interfaces.Promise.
     * Test directory copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_copy_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_copy_async_static_013');
      let ddpath = dpath + '/srcDir_first';
      let dmpath = dpath + '/srcDir_second';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dmpath);
      let ffpath = ddpath + '/srcFile_first_01';
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(ddpath);
      let dstDirUri = fileUri.getUriFromPath(dmpath);

      try {
        let progressListener = (progress: fs.Progress) => {
          hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
        };
        let options: fs.CopyOptions = {
          "progressListener" : progressListener
        }
        await fs.copy(srcDirUri, dstDirUri, options);
        let result1 = fs.listFileSync(ddpath);
        let result2 = fs.listFileSync(dmpath);
        expect(result1.length == result2.length).assertTrue();
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_013 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1400
     * @tc.name fileIO_copy_async_static_014
     * @tc.desc Test copy() interfaces.
     * Test directory copied successfully by path.Promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_copy_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_copy_async_static_014');
      let ddpath = dpath + '/srcDir_first';
      let dmpath = dpath + '/srcDir_second';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dmpath);
      let ffpath = ddpath + '/srcFile_first_01';
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(ddpath);
      let dstDirUri = fileUri.getUriFromPath(dmpath);

      try {
        await fs.copy(srcDirUri, dstDirUri);
        let result1 = fs.listFileSync(ddpath);
        let result2 = fs.listFileSync(dmpath);
        expect(result1.length == result2.length).assertTrue();
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_014 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1500
     * @tc.name fileIO_copy_async_static_015
     * @tc.desc Test copy() interfaces.
     * Test file copied successfully by path.Promise without CopyOptions, TaskSignal.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_copy_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_015');
      let destpath = fpath + 'dest';
      expect(prepare2GFile(fpath)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(fpath);
      let dstDirUri = fileUri.getUriFromPath(destpath);
      let copySignal = new fs.TaskSignal;
      copySignal.onCancel();
      let stat1 = fs.statSync(fpath);
      hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_015 stat1: ' + stat1);
      let progressListener = (progress: fs.Progress) => {
        hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
        if (progress.processedSize / progress.totalSize > 0.1) {
          copySignal.cancel();
        }
      };

      let options: fs.CopyOptions = {
        "progressListener" : progressListener,
        "copySignal" : copySignal,
      };
      try {
        await fs.copy(srcDirUri, dstDirUri, options);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_015 end error' + JSON.stringify(e));
        let stat2 = fs.statSync(destpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_015 stat2: ' + stat2);
        expect(stat2.size < stat1.size).assertTrue();
        expect(e.code == 13900049 && e.message == 'Operation canceled').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1600
     * @tc.name fileIO_copy_async_static_016
     * @tc.desc Test copy() interfaces.
     * Test file copied successfully by path.callback without CopyOptions, TaskSignal.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_copy_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_016');
      let destpath = fpath + 'dest';
      expect(prepare2GFile(fpath)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(fpath);
      let dstDirUri = fileUri.getUriFromPath(destpath);
      let copySignal = new fs.TaskSignal;
      copySignal.onCancel();
      let stat1 = fs.statSync(fpath);
      hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_016 stat1: ' + stat1);
      let progressListener = (progress: fs.Progress) => {
        hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
        if (progress.processedSize / progress.totalSize > 0.1) {
          copySignal.cancel();
        }
      };

      let options: fs.CopyOptions = {
        "progressListener" : progressListener,
        "copySignal" : copySignal,
      };
      try {
        fs.copy(srcDirUri, dstDirUri, options, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_016 error package: ' + JSON.stringify(err));
            let stat2 = fs.statSync(destpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_016 stat2: ' + stat2.size);
            expect(err?.code == 13900049 && err?.message == 'Operation canceled').assertTrue();
            expect(stat2.size < stat1.size).assertTrue();
          }
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_016 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1800
     * @tc.name fileIO_copy_async_static_018
     * @tc.desc Test copy() interfaces.
     * Invalid argument.callback without options.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_copy_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_018');
      let destpath = fpath + 'dest';
      let srcDirUri = fileUri.getUriFromPath(fpath);
      let dstDirUri = fileUri.getUriFromPath(destpath);

      try {
        fs.copy(srcDirUri, dstDirUri, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_018 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_018 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}