import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { ConflictFiles } from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';
const DIRMODE_FILE_COPY_THROW_ERR = 0;
const DIRMODE_FILE_COPY_REPLACE = 1;
interface Dir {
  baseDir: string,
  srcDir: string,
  destDir: string
}

export async function readyFiles(testNum: string) : Promise<Dir> {
  return new Promise<Dir>((resolve, reject) => {
    let dpath = await Utils.nextFileName(testNum);
    try {
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let dddpath1 = ddpath1 + '/srcDir_first';
      let dddpath2 = ddpath2 + '/srcDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let fpath3 = dddpath2 + '/srcFile_first_01';
      let fpath4 = dddpath2 + '/destFile_second_01';
      let ffpath1 = dddpath1 + '/srcFile_second_01';
      let ffpath2 = dddpath1 + '/srcFile_second_02';
      let ddddpath1 = dddpath1 + '/srcDir_second';
      let ddddpath2 = dddpath2 + '/srcDir_first';
      let fffpath1 = ddddpath1 + '/srcFile_third_01';
      let fffpath2 = ddddpath1 + '/srcFile_third_02';
      let fffpath3 = ddddpath2 + '/srcFile_second_01';
      let fffpath4 = ddddpath2 + '/destFile_third_01';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath1);
      fs.mkdirSync(dddpath2);
      fs.mkdirSync(ddddpath1);
      fs.mkdirSync(ddddpath2);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();
      expect(await Utils.prepareFile(fpath2, await Utils.randomString(15))).assertTrue();
      expect(await Utils.prepareFile(fpath3, await Utils.randomString(20))).assertTrue();
      expect(await Utils.prepareFile(fpath4, await Utils.randomString(25))).assertTrue();
      expect(await Utils.prepareFile(ffpath1, await Utils.randomString(30))).assertTrue();
      expect(await Utils.prepareFile(ffpath2, await Utils.randomString(35))).assertTrue();
      expect(await Utils.prepareFile(fffpath1, await Utils.randomString(40))).assertTrue();
      expect(await Utils.prepareFile(fffpath2, await Utils.randomString(45))).assertTrue();
      expect(await Utils.prepareFile(fffpath3, await Utils.randomString(50))).assertTrue();
      expect(await Utils.prepareFile(fffpath4, await Utils.randomString(55))).assertTrue();
      let alldir: Dir = {
        baseDir: dpath,
        srcDir: ddpath1,
        destDir: ddpath2
      }
      resolve(alldir);
    } catch (e: BusinessError) {
      hilog.info(domain, tag, '%{public}s',
        testNum + 'failed to readyFiles for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      let alldir: Dir = {
        baseDir: dpath,
        srcDir: '',
        destDir: ''
      }
      resolve(alldir);
    }
  })
}

export default function fileIOCopyDir() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_copyDir", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_copyDir start');
    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0000
     * @tc.name fileIO_test_copyDir_sync_static_000
     * @tc.desc Test copyDirSync() interface.
     * There is no target folder(src) under path dest. Mode is DIRMODE_FILE_COPY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_000 start');
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_sync_static_000');
      let ddpath = dpath + '/srcDir_first';
      let ffpath = ddpath + '/srcFile_first_01';
      let ffpath2 = ddpath + '/srcFile_first_02';
      let dddpath = ddpath + '/srcDir_second';
      let fffpath = dddpath + '/srcFile_second_01';
      let ddpath2 = dpath + '/destDir_first';
      let ffpath3 = ddpath2 + '/destFile_first_01';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath);
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyDirSync(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE);
        let stat1 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
        expect(stat1.size == FILE_CONTENT.length).assertTrue();
        let stat2 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
        expect(stat2.size == FILE_CONTENT.length).assertTrue();
        expect(fs.accessSync(ddpath)).assertTrue();
        expect(fs.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
        let stat3 = fs.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
        expect(stat3.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_000 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0100
     * @tc.name fileIO_test_copyDir_sync_static_001
     * @tc.desc Test copyDirSync() interface.
     * There is a file with a different name from the source folder in the target folder. Mode is DIRMODE_FILE_COPY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_001 start');
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_sync_static_001');
      let ddpath = dpath + '/srcDir_first';
      let ffpath = ddpath + '/srcFile_first_01';
      let ffpath2 = ddpath + '/srcFile_first_02';
      let dddpath = ddpath + '/srcDir_second';
      let fffpath = dddpath + '/srcFile_second_01';
      let ddpath2 = dpath + '/destDir_first';
      let ffpath3 = ddpath2 + '/destFile_first_01';
      let dddpath2= ddpath2 + '/srcDir_first';
      let fffpath2 = dddpath2 + '/destFile_second_01';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath);
      fs.mkdirSync(dddpath2);
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath2, FILE_CONTENT)).assertTrue();

      try {
        fs.copyDirSync(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE);
        let stat1 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
        expect(stat1.size == FILE_CONTENT.length).assertTrue();
        let stat2 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
        expect(stat2.size == FILE_CONTENT.length).assertTrue();
        expect(fs.accessSync(ddpath)).assertTrue();
        expect(fs.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
        let stat3 = fs.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
        expect(stat3.size == FILE_CONTENT.length).assertTrue();
        let stat4 = fs.statSync(ddpath2 + '/srcDir_first/destFile_second_01');
        expect(stat4.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_001 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0200
     * @tc.name fileIO_test_copyDir_sync_static_002
     * @tc.desc Test copyDirSync() interface.
     * There is a file with the same name as the source folder in the target folder. Mode is DIRMODE_FILE_COPY_THROW_ERR.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_copyDir_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_002 start');
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_sync_static_002');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_002 dpath ' + JSON.stringify(dpath));

      try {
        let dirnet1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirnet1.length == 4).assertTrue();
        fs.copyDirSync(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_THROW_ERR);
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_002 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        expect(fs.accessSync(dpath.srcDir)).assertTrue();
        let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
        expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
        fs.rmdirSync(dpath.baseDir);
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0300
     * @tc.name fileIO_test_copyDir_sync_static_003
     * @tc.desc Test copyDirSync() interface.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_COPY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_copyDir_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_003 start');
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_sync_static_003');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_003 dpath ' + JSON.stringify(dpath));

      try {
        let dirnet1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirnet1.length == 4).assertTrue();
        let stat1 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat2 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        fs.copyDirSync(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_REPLACE);
        expect(fs.accessSync(dpath.srcDir)).assertTrue();
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        fs.rmdirSync(dpath.baseDir);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_003 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0400
     * @tc.name fileIO_test_copyDir_sync_static_004
     * @tc.desc Test copyDirSync() interface.
     * Invalid mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_004 start');
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_sync_static_004');
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let dddpath1 = ddpath1 + '/srcDir_first';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath1);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();

      try {
        const INVALIDE_MODE = -1;
        fs.copyDirSync(ddpath1, ddpath2, INVALIDE_MODE);
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_004 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIRSYNC_0500
     * @tc.name fileIO_test_copyDir_sync_static_005
     * @tc.desc Test copyDirSync() interface.
     * The path point to a file, not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_005 start');
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_sync_static_005');
      let fpath = dpath + '/file_000.txt';
      let ddpath = dpath + '/dir_000';
      let ffpath = ddpath + '/file_000.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyDirSync(fpath, ffpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIRSYNC_0600
     * @tc.name fileIO_test_copyDir_sync_static_006
     * @tc.desc Test copyDirSync() interface.
     * Invalid path. Can not move the same path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_006 start');
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_sync_static_006');
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let dddpath1 = ddpath1 + '/srcDir_first';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath1);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();

      try {
        fs.copyDirSync(ddpath1, ddpath1, DIRMODE_FILE_COPY_THROW_ERR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIRSYNC_0700
     * @tc.name fileIO_test_copyDir_sync_static_007
     * @tc.desc Test copyDirSync() interface.
     * Invalid path. Can not move subPath.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_007 start');
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_sync_static_007');
      let ddpath1 = dpath + '/srcDir';
      let dddpath1 = ddpath1 + '/srcDir_first';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let ffpath1 = dddpath1 + '/srcFile_second_01';
      let ffpath2 = dddpath1 + '/srcFile_second_02';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(dddpath1);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();
      expect(await Utils.prepareFile(fpath2, await Utils.randomString(15))).assertTrue();
      expect(await Utils.prepareFile(ffpath1, await Utils.randomString(20))).assertTrue();
      expect(await Utils.prepareFile(ffpath2, await Utils.randomString(25))).assertTrue();

      try {
        fs.copyDirSync(ddpath1, dddpath1, DIRMODE_FILE_COPY_THROW_ERR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_007 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0800
     * @tc.name fileIO_test_copyDir_sync_static_008
     * @tc.desc Test copyDirSync() interface.
     * There is no target folder(src) under path dest. Mode is undefined.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_008 start');
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_sync_static_008');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_008 dpath ' + JSON.stringify(dpath));

      try {
        let dirnet1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirnet1.length == 4).assertTrue();
        fs.copyDirSync(dpath.srcDir, dpath.destDir, undefined);
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_sync_static_008 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        expect(fs.accessSync(dpath.srcDir)).assertTrue();
        let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
        expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
        fs.rmdirSync(dpath.baseDir);
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0000
     * @tc.name fileIO_test_copyDir_async_static_000
     * @tc.desc Test copyDir() interface.Promise.
     * There is no target folder(src) under path dest. Mode is DIRMODE_FILE_COPY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_000 start');
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_async_static_000');
      let ddpath = dpath + '/srcDir_first';
      let ffpath = ddpath + '/srcFile_first_01';
      let ffpath2 = ddpath + '/srcFile_first_02';
      let dddpath = ddpath + '/srcDir_second';
      let fffpath = dddpath + '/srcFile_second_01';
      let ddpath2 = dpath + '/destDir_first';
      let ffpath3 = ddpath2 + '/destFile_first_01';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath);
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE);
        let stat1 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
        expect(stat1.size == FILE_CONTENT.length).assertTrue();
        let stat2 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
        expect(stat2.size == FILE_CONTENT.length).assertTrue();
        expect(fs.accessSync(ddpath)).assertTrue();
        expect(fs.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
        let stat3 = fs.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
        expect(stat3.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_000 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0100
     * @tc.name fileIO_test_copyDir_async_static_001
     * @tc.desc Test copyDir() interface.Callback.
     * There is no target folder(src) under path dest. Mode is DIRMODE_FILE_COPY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_async_static_001');
      let ddpath = dpath + '/srcDir_first';
      let ffpath = ddpath + '/srcFile_first_01';
      let ffpath2 = ddpath + '/srcFile_first_02';
      let dddpath = ddpath + '/srcDir_second';
      let fffpath = dddpath + '/srcFile_second_01';
      let ddpath2 = dpath + '/destDir_first';
      let ffpath3 = ddpath2 + '/destFile_first_01';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath);
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE, (err: BusinessError<void>|null): void => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_001 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          let stat1 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
          expect(stat1.size == FILE_CONTENT.length).assertTrue();
          let stat2 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
          expect(stat2.size == FILE_CONTENT.length).assertTrue();
          expect(fs.accessSync(ddpath)).assertTrue();
          expect(fs.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
          let stat3 = fs.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
          expect(stat3.size == FILE_CONTENT.length).assertTrue();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_001 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0200
     * @tc.name fileIO_test_copyDir_async_static_002
     * @tc.desc Test copyDir() interface.Promise.
     * There is a file with a different name from the source folder in the target folder. Mode is DIRMODE_FILE_COPY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_async_static_002');
      let ddpath = dpath + '/srcDir_first';
      let ffpath = ddpath + '/srcFile_first_01';
      let ffpath2 = ddpath + '/srcFile_first_02';
      let dddpath = ddpath + '/srcDir_second';
      let fffpath = dddpath + '/srcFile_second_01';
      let ddpath2 = dpath + '/destDir_first';
      let ffpath3 = ddpath2 + '/destFile_first_01';
      let dddpath2= ddpath2 + '/srcDir_first';
      let fffpath2 = dddpath2 + '/destFile_second_01';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath);
      fs.mkdirSync(dddpath2);
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath2, FILE_CONTENT)).assertTrue();

      try {
        await fs.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE);
        let stat1 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
        expect(stat1.size == FILE_CONTENT.length).assertTrue();
        let stat2 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
        expect(stat2.size == FILE_CONTENT.length).assertTrue();
        expect(fs.accessSync(ddpath)).assertTrue();
        expect(fs.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
        let stat3 = fs.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
        expect(stat3.size == FILE_CONTENT.length).assertTrue();
        let stat4 = fs.statSync(ddpath2 + '/srcDir_first/destFile_second_01');
        expect(stat4.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_002 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0300
     * @tc.name fileIO_test_copyDir_async_static_003
     * @tc.desc Test copyDir() interface.Callback.
     * There is a file with a different name from the source folder in the target folder. Mode is DIRMODE_FILE_COPY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_async_static_003');
      let ddpath = dpath + '/srcDir_first';
      let ffpath = ddpath + '/srcFile_first_01';
      let ffpath2 = ddpath + '/srcFile_first_02';
      let dddpath = ddpath + '/srcDir_second';
      let fffpath = dddpath + '/srcFile_second_01';
      let ddpath2 = dpath + '/destDir_first';
      let ffpath3 = ddpath2 + '/destFile_first_01';
      let dddpath2= ddpath2 + '/srcDir_first';
      let fffpath2 = dddpath2 + '/destFile_second_01';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath);
      fs.mkdirSync(dddpath2);
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath2, FILE_CONTENT)).assertTrue();

      try {
        fs.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE, (err: BusinessError<void>|null): void => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_003 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          let stat1 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
          expect(stat1.size == FILE_CONTENT.length).assertTrue();
          let stat2 = fs.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
          expect(stat2.size == FILE_CONTENT.length).assertTrue();
          expect(fs.accessSync(ddpath)).assertTrue();
          expect(fs.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
          let stat3 = fs.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
          expect(stat3.size == FILE_CONTENT.length).assertTrue();
          let stat4 = fs.statSync(ddpath2 + '/srcDir_first/destFile_second_01');
          expect(stat4.size == FILE_CONTENT.length).assertTrue();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_003 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0400
     * @tc.name fileIO_test_copyDir_async_static_004
     * @tc.desc Test copyDir() interface.Promise.
     * There is a file with the same name as the source folder in the target folder. Mode is DIRMODE_FILE_COPY_THROW_ERR.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_async_static_004');

      try {
        let dirnet1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirnet1.length == 4).assertTrue();
        await fs.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_THROW_ERR);
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_004 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        expect(fs.accessSync(dpath.srcDir)).assertTrue();
        let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
        expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
        fs.rmdirSync(dpath.baseDir);
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0500
     * @tc.name fileIO_test_copyDir_async_static_005
     * @tc.desc Test copyDir() interface.Callback.
     * There is a file with the same name as the source folder in the target folder. Mode is DIRMODE_FILE_COPY_THROW_ERR.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_async_static_005');

      try {
        let dirnet1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirnet1.length == 4).assertTrue();
        fs.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_THROW_ERR, (err: BusinessError<void>|null): void => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_005 error:' + JSON.stringify(err));
            let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
            expect(dirent2.length == 8).assertTrue();
            expect(fs.accessSync(dpath.srcDir)).assertTrue();
            let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
            let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
            let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
            let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
            expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
            expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
            expect(fs.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
            expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
            expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
            expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
            expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
            expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
            expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
            fs.rmdirSync(dpath.baseDir);
            expect(err?.code == 13900015 && err?.message == 'File exists').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0600
     * @tc.name fileIO_test_copyDir_async_static_006
     * @tc.desc Test copyDir() interface.Promise.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_COPY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_async_static_006');

      try {
        let dirnet1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirnet1.length == 4).assertTrue();
        let stat1 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat2 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        await fs.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_REPLACE);
        expect(fs.accessSync(dpath.srcDir)).assertTrue();
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        fs.rmdirSync(dpath.baseDir);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_006 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0700
     * @tc.name fileIO_test_copyDir_async_static_007
     * @tc.desc Test copyDir() interface.Callback.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_COPY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_async_static_007');

      try {
        let dirnet1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirnet1.length == 4).assertTrue();
        let stat1 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat2 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        fs.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_REPLACE, (err: BusinessError<void>|null): void => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_007 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fs.accessSync(dpath.srcDir)).assertTrue();
          let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
          expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
          let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
          expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
          expect(fs.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
          expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
          expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
          expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
          expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
          expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
          let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
          expect(dirent2.length == 8).assertTrue();
          fs.rmdirSync(dpath.baseDir);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_007 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0800
     * @tc.name fileIO_test_copyDir_async_static_008
     * @tc.desc Test copyDir() interface.Promise.
     * Invalid mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_async_static_008');

      try {
        const INVALIDE_MODE = -1;
        await fs.copyDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE);
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_008 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        fs.rmdirSync(dpath.baseDir);
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0900
     * @tc.name fileIO_test_copyDir_async_static_009
     * @tc.desc Test copyDir() interface.Callback.
     * Invalid mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_async_static_009');

      try {
        const INVALIDE_MODE = -1;
        fs.copyDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE, (err: BusinessError<void>|null): void => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_009 err package ' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            fs.rmdirSync(dpath.baseDir);
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_009 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1000
     * @tc.name fileIO_test_copyDir_async_static_010
     * @tc.desc Test copyDir() interface.Promise.
     * The path point to a file, not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_async_static_010');

      try {
        await fs.copyDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01');
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_010 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        fs.rmdirSync(dpath.baseDir);
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1100
     * @tc.name fileIO_test_copyDir_async_static_011
     * @tc.desc Test copyDir() interface.Callback.
     * The path point to a file, not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_async_static_011');

      try {
        fs.copyDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01', (err: BusinessError<void>|null): void => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_011 err package ' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            fs.rmdirSync(dpath.baseDir);
            done();

          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_011 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1200
     * @tc.name fileIO_test_copyDir_async_static_012
     * @tc.desc Test copyDir() interface.
     * Invalid path.Can not move the same path.Promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_async_static_012');

      try {
        await fs.copyDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_COPY_REPLACE);
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_012 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        fs.rmdirSync(dpath.baseDir);
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1300
     * @tc.name fileIO_test_copyDir_async_static_013
     * @tc.desc Test copyDir() interface.
     * Invalid path.Can not move the same path.Callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_async_static_013');

      try {
        fs.copyDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_COPY_REPLACE, (err: BusinessError<void>|null): void => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_013 err package ' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            fs.rmdirSync(dpath.baseDir);
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_013 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1400
     * @tc.name fileIO_test_copyDir_async_static_014
     * @tc.desc Test copyDir() interface.
     * Invalid path.Can not move subPath.Promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_async_static_014');
      let ddpath = dpath + '/srcDir_first';
      let dddpath = ddpath + '/srcDir_second';
      let ddddpath = dddpath + '/srcDir_third';
      let dddddpath = ddddpath + '/srcDir_fourth';
      let qfile = dddddpath + '/file.png';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dddpath);
      fs.mkdirSync(ddddpath);
      fs.mkdirSync(dddddpath);
      expect(await Utils.prepareFile(qfile, FILE_CONTENT)).assertTrue();

      try {
        await fs.copyDir(ddpath, dddddpath, DIRMODE_FILE_COPY_REPLACE);
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_014 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        fs.rmdirSync(dpath);
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1500
     * @tc.name fileIO_test_copyDir_async_static_015
     * @tc.desc Test copyDir() interface.
     * Invalid path.Can not move subPath.Callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_copyDir_async_static_015');
      let ddpath = dpath + '/srcDir_first';
      let dddpath = ddpath + '/srcDir_second';
      let ddddpath = dddpath + '/srcDir_third';
      let dddddpath = ddddpath + '/srcDir_fourth';
      let qfile = dddddpath + '/file.png';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dddpath);
      fs.mkdirSync(ddddpath);
      fs.mkdirSync(dddddpath);
      expect(await Utils.prepareFile(qfile, FILE_CONTENT)).assertTrue();

      try {
        fs.copyDir(ddpath, dddddpath, DIRMODE_FILE_COPY_REPLACE, (err: BusinessError<void>|null): void => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_015 err package ' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            fs.rmdirSync(dpath);
            done();

          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_015 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1600
     * @tc.name fileIO_test_copyDir_async_static_016
     * @tc.desc Test copyDir() interface.Promise.
     * There is no target folder(src) under path dest. Mode is undefined.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_copyDir_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let dpath: Dir = await readyFiles('fileIO_test_copyDir_async_static_016');

      try {
        let dirnet1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirnet1.length == 4).assertTrue();
        await fs.copyDir(dpath.srcDir, dpath.destDir, undefined);
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_copyDir_async_static_016 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        expect(fs.accessSync(dpath.srcDir)).assertTrue();
        let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
        expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
        fs.rmdirSync(dpath.baseDir);
        done();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_copyDir end');

}