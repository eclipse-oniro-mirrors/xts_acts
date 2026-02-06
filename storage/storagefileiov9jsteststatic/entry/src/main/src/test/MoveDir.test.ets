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
const DIRMODE_DIRECTORY_THROW_ERR  = 0;
const DIRMODE_FILE_THROW_ERR = 1;
const DIRMODE_FILE_REPLACE = 2;
const DIRMODE_DIRECTORY_REPLACE = 3;
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

export default function fileIOMoveDir() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_moveDir", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_moveDir start');

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0000
     * @tc.name fileIO_test_moveDir_sync_static_000
     * @tc.desc Test moveDirSync() interface.
     * There is no target folder(src) under path dest.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_000 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_sync_static_000');
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let dddpath = ddpath1 + '/srcDir_first';
      let ffpath1 = dddpath + '/srcFile_second_01';
      let ffpath2 = dddpath + '/srcFile_second_02';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();
      expect(await Utils.prepareFile(fpath2, await Utils.randomString(15))).assertTrue();
      expect(await Utils.prepareFile(ffpath1, await Utils.randomString(20))).assertTrue();
      expect(await Utils.prepareFile(ffpath2, await Utils.randomString(25))).assertTrue();
      try {
        let stat1 = fs.statSync(fpath1);
        let stat2 = fs.statSync(ffpath1);
        fs.moveDirSync(ddpath1, ddpath2);
        expect(fs.accessSync(ddpath1)).assertFalse();
        expect(fs.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
        expect(fs.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        let stat3 = fs.statSync(ddpath2 + '/srcDir/srcFile_first_01');
        expect(stat1.size == stat3.size).assertTrue();
        let stat4 = fs.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size == stat4.size).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0100
     * @tc.name fileIO_test_moveDir_sync_static_001
     * @tc.desc Test moveDirSync() interface.
     * There is a target folder(src) under path dest but it is empty.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_001 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_sync_static_001');
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let dddpath2 = ddpath2 + '/srcDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let dddpath1 = ddpath1 + '/srcDir_first';
      let ffpath1 = dddpath1 + '/srcFile_second_01';
      let ffpath2 = dddpath1 + '/srcFile_second_02';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath1);
      fs.mkdirSync(dddpath2);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();
      expect(await Utils.prepareFile(fpath2, await Utils.randomString(15))).assertTrue();
      expect(await Utils.prepareFile(ffpath1, await Utils.randomString(20))).assertTrue();
      expect(await Utils.prepareFile(ffpath2, await Utils.randomString(25))).assertTrue();
      try {
        let stat1 = fs.statSync(fpath1);
        let stat2 = fs.statSync(ffpath1);
        fs.moveDirSync(ddpath1, ddpath2);
        expect(fs.accessSync(ddpath1)).assertFalse();
        expect(fs.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
        expect(fs.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        let stat3 = fs.statSync(ddpath2 + '/srcDir/srcFile_first_01');
        expect(stat1.size == stat3.size).assertTrue();
        let stat4 = fs.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size == stat4.size).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0200
     * @tc.name fileIO_test_moveDir_sync_static_002
     * @tc.desc Test moveDirSync() interface.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_DIRECTORY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_002 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_sync_static_002');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_002 dpath ' + JSON.stringify(dpath));
      try {
        let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let dirent1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent1.length == 4).assertTrue();
        fs.moveDirSync(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_REPLACE);
        expect(fs.accessSync(dpath.srcDir)).assertFalse();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertFalse();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertFalse();
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        expect(stat1.size == stat3.size).assertTrue();
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size == stat4.size).assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 6).assertTrue();
        fs.rmdirSync(dpath.baseDir);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0300
     * @tc.name fileIO_test_moveDir_sync_static_003
     * @tc.desc Test moveDirSync() interface.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_003 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_sync_static_003');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_003 dpath ' + JSON.stringify(dpath));
      try {
        let stat1 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat2 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        let dirent1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent1.length == 4).assertTrue();
        fs.moveDirSync(dpath.srcDir, dpath.destDir, DIRMODE_FILE_REPLACE);
        expect(fs.accessSync(dpath.srcDir)).assertFalse();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        fs.rmdirSync(dpath.baseDir);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0400
     * @tc.name fileIO_test_moveDir_sync_static_004
     * @tc.desc Test moveDirSync() interface.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_THROW_ERR.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_004 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_sync_static_004');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_004 dpath ' + JSON.stringify(dpath));
      try {
        let dirnet1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirnet1.length == 4).assertTrue();
        fs.moveDirSync(dpath.srcDir, dpath.destDir, DIRMODE_FILE_THROW_ERR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_004 has failed for' + e.message + ', code: ' + e.code);
        let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        fs.rmdirSync(dpath.baseDir);
        expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0500
     * @tc.name fileIO_test_moveDir_sync_static_005
     * @tc.desc Test moveDirSync() interface.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_DIRECTORY_THROW_ERR.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_005 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_sync_static_005');
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let dddpath1 = ddpath1 + '/srcDir_first';
      let dddpath2 = ddpath2 + '/srcDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let fpath3 = dddpath2 + '/srcFile_first_01';
      let fpath4 = dddpath2 + '/destFile_first_01';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath1);
      fs.mkdirSync(dddpath2);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();
      expect(await Utils.prepareFile(fpath2, await Utils.randomString(15))).assertTrue();
      expect(await Utils.prepareFile(fpath3, await Utils.randomString(20))).assertTrue();
      expect(await Utils.prepareFile(fpath4, await Utils.randomString(25))).assertTrue();

      try {
        fs.moveDirSync(ddpath1, ddpath2, DIRMODE_DIRECTORY_THROW_ERR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_005 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath);
        expect(e.code == 13900032 && e.message == 'Directory not empty').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0600
     * @tc.name fileIO_test_moveDir_sync_static_006
     * @tc.desc Test moveDirSync() interface.
     * Src is empty and there is a target folder(src) under path dest but it is empty.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_006 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_sync_static_006');
      let fpath = dpath + '/file_006.txt';
      let ddpath = dpath + '/dir_006';
      let ddpath2 = dpath + '/dir2_006';
      let ffpath3 = ddpath2 + '/new.txt';
      let dddpath3= ddpath2 + '/dir_006';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath3);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      try {
        fs.moveDirSync(ddpath, ddpath2, DIRMODE_FILE_REPLACE);
        expect(fs.accessSync(ddpath)).assertFalse();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_006 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0700
     * @tc.name fileIO_test_moveDir_sync_static_007
     * @tc.desc Test moveDirSync() interface.
     * Src is empty and there is no target folder(src) under path dest.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_007 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_sync_static_007');
      let fpath = dpath + '/file_007.txt';
      let ddpath = dpath + '/dir_007';
      let ddpath2 = dpath + '/dir2_007';
      let ffpath3 = ddpath2 + '/new.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      try {
        fs.moveDirSync(ddpath, ddpath2, DIRMODE_FILE_REPLACE);
        expect(fs.accessSync(ddpath)).assertFalse();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_007 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0800
     * @tc.name fileIO_test_moveDir_sync_static_008
     * @tc.desc Test moveDirSync() interface.
     * Invalid mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_008 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_sync_static_008');
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
        fs.moveDirSync(ddpath1, ddpath2, INVALIDE_MODE);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_008 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0900
     * @tc.name fileIO_test_moveDir_sync_static_009
     * @tc.desc Test moveDirSync() interface.
     * The path point to a file, not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_009 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_sync_static_009');
      let fpath = dpath + '/file_000.txt';
      let ddpath = dpath + '/dir_000';
      let ffpath = ddpath + '/file_000.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.moveDirSync(fpath, ffpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_009 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1000
     * @tc.name fileIO_test_moveDir_sync_static_010
     * @tc.desc Test moveDirSync() interface.
     * Invalid path. Can not move the same path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_010 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_sync_static_010');
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
        fs.moveDirSync(ddpath1, ddpath1, DIRMODE_FILE_THROW_ERR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_010 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1100
     * @tc.name fileIO_test_moveDir_sync_static_011
     * @tc.desc Test moveDirSync() interface.
     * Invalid path. Can not move subPath.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_011 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_sync_static_011');
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
        fs.moveDirSync(ddpath1, dddpath1, DIRMODE_FILE_THROW_ERR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_011 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1200
     * @tc.name fileIO_test_moveDir_sync_static_012
     * @tc.desc Test moveDirSync() interface.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_DIRECTORY_THROW_ERR.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_sync_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_012 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_sync_static_012');
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let dddpath1 = ddpath1 + '/srcDir_first';
      let dddpath2 = ddpath2 + '/srcDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let fpath3 = dddpath2 + '/srcFile_first_01';
      let fpath4 = dddpath2 + '/destFile_first_01';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath1);
      fs.mkdirSync(dddpath2);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();
      expect(await Utils.prepareFile(fpath2, await Utils.randomString(15))).assertTrue();
      expect(await Utils.prepareFile(fpath3, await Utils.randomString(20))).assertTrue();
      expect(await Utils.prepareFile(fpath4, await Utils.randomString(25))).assertTrue();
      try {
        fs.moveDirSync(ddpath1, ddpath2, DIRMODE_DIRECTORY_THROW_ERR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_sync_static_012 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath);
        expect(e.code == 13900032 && e.message == 'Directory not empty').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0000
     * @tc.name fileIO_test_moveDir_async_static_000
     * @tc.desc Test moveDir() interface.Promise.
     * There is no target folder(src) under path dest.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_000 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_async_static_000');
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let dddpath = ddpath1 + '/srcDir_first';
      let ffpath1 = dddpath + '/srcFile_second_01';
      let ffpath2 = dddpath + '/srcFile_second_02';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();
      expect(await Utils.prepareFile(fpath2, await Utils.randomString(15))).assertTrue();
      expect(await Utils.prepareFile(ffpath1, await Utils.randomString(20))).assertTrue();
      expect(await Utils.prepareFile(ffpath2, await Utils.randomString(25))).assertTrue();
      try {
        let stat1 = fs.statSync(fpath1);
        let stat2 = fs.statSync(ffpath1);
        await fs.moveDir(ddpath1, ddpath2);
        expect(fs.accessSync(ddpath1)).assertFalse();
        expect(fs.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
        expect(fs.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        let stat3 = fs.statSync(ddpath2 + '/srcDir/srcFile_first_01');
        expect(stat1.size == stat3.size).assertTrue();
        let stat4 = fs.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size == stat4.size).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

     /**
     * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0100
     * @tc.name fileIO_test_moveDir_async_static_001
     * @tc.desc Test moveDir() interface.Callback.
     * There is no target folder(src) under path dest.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_001 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_async_static_001');
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let dddpath = ddpath1 + '/srcDir_first';
      let ffpath1 = dddpath + '/srcFile_second_01';
      let ffpath2 = dddpath + '/srcFile_second_02';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();
      expect(await Utils.prepareFile(fpath2, await Utils.randomString(15))).assertTrue();
      expect(await Utils.prepareFile(ffpath1, await Utils.randomString(20))).assertTrue();
      expect(await Utils.prepareFile(ffpath2, await Utils.randomString(25))).assertTrue();
      try {
        let stat1 = fs.statSync(fpath1);
        let stat2 = fs.statSync(ffpath1);
        fs.moveDir(ddpath1, ddpath2, (err: BusinessError<void>|null): void=> {
            if (err?.code != 0) {
              hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_001 error for' + JSON.stringify(err));
              expect(false).assertTrue();
            }
            expect(fs.accessSync(ddpath1)).assertFalse();
            expect(fs.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
            expect(fs.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
            let stat3 = fs.statSync(ddpath2 + '/srcDir/srcFile_first_01');
            expect(stat1.size == stat3.size).assertTrue();
            let stat4 = fs.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
            expect(stat2.size == stat4.size).assertTrue();
            fs.rmdirSync(dpath);
            done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0200
     * @tc.name fileIO_test_moveDir_async_static_002
     * @tc.desc Test moveDir() interface.Promise.
     * There is a target folder(src) under path dest but it is empty.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_002 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_async_static_002');
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let dddpath2 = ddpath2 + '/srcDir';
      let dddpath1 = ddpath1 + '/srcDir_first';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let ffpath1 = dddpath1 + '/srcFile_second_01';
      let ffpath2 = dddpath1 + '/srcFile_second_02';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath1);
      fs.mkdirSync(dddpath2);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();
      expect(await Utils.prepareFile(fpath2, await Utils.randomString(15))).assertTrue();
      expect(await Utils.prepareFile(ffpath1, await Utils.randomString(20))).assertTrue();
      expect(await Utils.prepareFile(ffpath2, await Utils.randomString(25))).assertTrue();
      try {
        let stat1 = fs.statSync(fpath1);
        let stat2 = fs.statSync(ffpath1);
        await fs.moveDir(ddpath1, ddpath2);
        expect(fs.accessSync(ddpath1)).assertFalse();
        expect(fs.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
        expect(fs.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        let stat3 = fs.statSync(ddpath2 + '/srcDir/srcFile_first_01');
        expect(stat1.size == stat3.size).assertTrue();
        let stat4 = fs.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size == stat4.size).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

     /**
     * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0300
     * @tc.name fileIO_test_moveDir_async_static_003
     * @tc.desc Test moveDir() interface.Callback.
     * There is a target folder(src) under path dest but it is empty.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_003 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_async_static_003');
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let dddpath2 = ddpath2 + '/srcDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let dddpath1 = ddpath1 + '/srcDir_first';
      let ffpath1 = dddpath1 + '/srcFile_second_01';
      let ffpath2 = dddpath1 + '/srcFile_second_02';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath1);
      fs.mkdirSync(dddpath2);
      expect(await Utils.prepareFile(fpath1, await Utils.randomString(10))).assertTrue();
      expect(await Utils.prepareFile(fpath2, await Utils.randomString(15))).assertTrue();
      expect(await Utils.prepareFile(ffpath1, await Utils.randomString(20))).assertTrue();
      expect(await Utils.prepareFile(ffpath2, await Utils.randomString(25))).assertTrue();
      try {
        let stat1 = fs.statSync(fpath1);
        let stat2 = fs.statSync(ffpath1);
        fs.moveDir(ddpath1, ddpath2, (err: BusinessError<void>|null): void => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_003 error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fs.accessSync(ddpath1)).assertFalse();
          expect(fs.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
          expect(fs.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
          let stat3 = fs.statSync(ddpath2 + '/srcDir/srcFile_first_01');
          expect(stat1.size == stat3.size).assertTrue();
          let stat4 = fs.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
          expect(stat2.size == stat4.size).assertTrue();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0400
     * @tc.name fileIO_test_moveDir_async_static_004
     * @tc.desc Test moveFile() interface.Promise.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_DIRECTORY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_004 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_004');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_004 dpath ' + JSON.stringify(dpath));
      try {
        let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let dirent1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent1.length == 4).assertTrue();
        await fs.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_REPLACE);
        expect(fs.accessSync(dpath.srcDir)).assertFalse();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertFalse();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertFalse();
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        expect(stat1.size == stat3.size).assertTrue();
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size == stat4.size).assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 6).assertTrue();
        fs.rmdirSync(dpath.baseDir);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_004 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0500
     * @tc.name fileIO_test_moveDir_async_static_005
     * @tc.desc Test moveFile() interface.Callback.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_DIRECTORY_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_005 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_005');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_005 dpath ' + JSON.stringify(dpath));
      try {
        let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let dirent1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent1.length == 4).assertTrue();
        fs.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_REPLACE, (err: BusinessError<void>|null): void => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_005 has failed for' + err?.message + ', code: ' + err?.code);
            expect(false).assertTrue();
          }
          expect(fs.accessSync(dpath.srcDir)).assertFalse();
          expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertFalse();
          expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertFalse();
          let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
          expect(stat1.size == stat3.size).assertTrue();
          let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
          expect(stat2.size == stat4.size).assertTrue();
          let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_005 dirent2' + dirent2);
          expect(dirent2.length == 6).assertTrue();
          fs.rmdirSync(dpath.baseDir);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_005 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0600
     * @tc.name fileIO_test_moveDir_async_static_006
     * @tc.desc Test moveFile() interface.Promise.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_006 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_006');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_006 dpath ' + JSON.stringify(dpath));
      try {
        let stat1 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat2 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        let dirent1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent1.length == 4).assertTrue();
        await fs.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_REPLACE);
        expect(fs.accessSync(dpath.srcDir)).assertFalse();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        fs.rmdirSync(dpath.baseDir);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_006 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0700
     * @tc.name fileIO_test_moveDir_async_static_007
     * @tc.desc Test moveFile() interface.Callback.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_REPLACE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_007 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_007');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_007 dpath ' + JSON.stringify(dpath));
      try {
        let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let dirent1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent1.length == 4).assertTrue();
        fs.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_REPLACE, (err: BusinessError<void>|null): void => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_007 has failed for' + err?.message + ', code: ' + err?.code);
            expect(false).assertTrue();
          }
          expect(fs.accessSync(dpath.srcDir)).assertFalse();
          expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
          expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
          let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
          expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
          expect(stat3.size == 10).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_007 stat3.size ' + stat3.size +'   '+ stat1.size );
          let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
          expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
          expect(stat4.size == 30).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_007 stat4.size ' + stat4.size +'   '+ stat2.size);
          let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
          expect(dirent2.length == 8).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_007 dirent2.length ' + dirent2.length);
          fs.rmdirSync(dpath.baseDir);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_007 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_0800
     * @tc.name fileIO_test_moveDir_async_static_008
     * @tc.desc Test moveFile() interface.Promise.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_THROW_ERR.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_008 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_008');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_008 dpath ' + JSON.stringify(dpath));
      try {
        let dirnet1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirnet1.length == 4).assertTrue();
        await fs.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_THROW_ERR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_008 has failed for' + e.message + ', code: ' + e.code);
        let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
        let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        fs.rmdirSync(dpath.baseDir);
        expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_0900
     * @tc.name fileIO_test_moveDir_async_static_009
     * @tc.desc Test moveFile() interface.Callback.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_THROW_ERR.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_009 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_009');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_009 dpath ' + JSON.stringify(dpath));
      try {
        let dirent1 = fs.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent1.length == 4).assertTrue();
        fs.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_THROW_ERR, (err: BusinessError<void>|null): void => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_009 has failed for' + err?.message + ', code: ' + err?.code);
            let stat1 = fs.statSync(dpath.srcDir + '/srcFile_first_01');
            let stat2 = fs.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
            let stat3 = fs.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
            expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
            let stat4 = fs.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
            expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
            expect(fs.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
            expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
            expect(fs.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
            expect(fs.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
            let dirent2 = fs.listFileSync(dpath.destDir, {recursion : true});
            expect(dirent2.length == 8).assertTrue();
            fs.rmdirSync(dpath.baseDir);
            expect(err?.code == 13900015 && err?.message == 'File exists').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_009 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_1000
     * @tc.name fileIO_test_moveDir_async_static_010
     * @tc.desc Test moveFile() interface.Promise.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_DIRECTORY_THROW_ERR.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_010 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_010');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_010 dpath ' + JSON.stringify(dpath));
      try {
        await fs.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_THROW_ERR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_010 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath.baseDir);
        expect(e.code == 13900032 && e.message == 'Directory not empty').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_1100
     * @tc.name fileIO_test_moveDir_async_static_011
     * @tc.desc Test moveFile() interface.Callback.
     * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_DIRECTORY_THROW_ERR.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_011 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_011');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_011 dpath ' + JSON.stringify(dpath));
      try {
        fs.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_THROW_ERR, (err: BusinessError<void>|null): void => {
          if(err?.code != 0){
            fs.rmdirSync(dpath.baseDir);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_011 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900032 && err?.message == 'Directory not empty').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_011 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_1200
     * @tc.name fileIO_test_moveDir_async_static_012
     * @tc.desc Test moveFile() interface.Promise.
     * Src is empty and there is a target folder(src) under path dest but it is empty.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_012 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_async_static_012');
      let fpath = dpath + '/file_006.txt';
      let ddpath = dpath + '/dir_006';
      let ddpath2 = dpath + '/dir2_006';
      let ffpath3 = ddpath2 + '/new.txt';
      let dddpath3= ddpath2 + '/dir_006';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath3);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      try {
        await fs.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE);
        expect(fs.accessSync(ddpath)).assertFalse();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_012 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_1300
     * @tc.name fileIO_test_moveDir_async_static_013
     * @tc.desc Test moveFile() interface.Callback.
     * Src is empty and there is a target folder(src) under path dest but it is empty.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_013 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_async_static_013');
      let fpath = dpath + '/file_006.txt';
      let ddpath = dpath + '/dir_006';
      let ddpath2 = dpath + '/dir2_006';
      let ffpath3 = ddpath2 + '/new.txt';
      let dddpath3= ddpath2 + '/dir_006';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(dddpath3);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      try {
        fs.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE, (err: BusinessError<void>|null): void => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_013 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(false).assertTrue();
          }
          expect(fs.accessSync(ddpath)).assertFalse();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_012 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_1400
     * @tc.name fileIO_test_moveDir_async_static_014
     * @tc.desc Test moveFile() interface.Promise.
     * Src is empty and there is no target folder(src) under path dest.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_014 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_async_static_014');
      let fpath = dpath + '/file_007.txt';
      let ddpath = dpath + '/dir_007';
      let ddpath2 = dpath + '/dir2_007';
      let ffpath3 = ddpath2 + '/new.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      try {
        await fs.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE);
        expect(fs.accessSync(ddpath)).assertFalse();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_014 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_1500
     * @tc.name fileIO_test_moveDir_async_static_015
     * @tc.desc Test moveFile() interface.CallBack.
     * Src is empty and there is no target folder(src) under path dest.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_015 start');
      let dpath = await Utils.nextFileName('fileIO_test_moveDir_async_static_015');
      let fpath = dpath + '/file_007.txt';
      let ddpath = dpath + '/dir_007';
      let ddpath2 = dpath + '/dir2_007';
      let ffpath3 = ddpath2 + '/new.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(ddpath2);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      try {
        fs.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE, (err: BusinessError<void>|null): void => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_015 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(false).assertTrue();
          }
          expect(fs.accessSync(ddpath)).assertFalse();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_015 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_1600
     * @tc.name fileIO_test_moveDir_async_static_016
     * @tc.desc Test moveFile() interface.Promise.
     * Invalid mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_016 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_016');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_016 dpath ' + JSON.stringify(dpath));
      try {
        const INVALIDE_MODE = -1;
        await fs.moveDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_016 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath.baseDir);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_1700
     * @tc.name fileIO_test_moveDir_async_static_017
     * @tc.desc Test moveFile() interface.Callback.
     * Invalid mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_017 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_017');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_017 dpath ' + JSON.stringify(dpath));
      try {
        const INVALIDE_MODE = 4;
        fs.moveDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE, (err: BusinessError<void>|null): void => {
          if(err?.code != 0){
            fs.rmdirSync(dpath.baseDir);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_017 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_017 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_1800
     * @tc.name fileIO_test_moveDir_async_static_018
     * @tc.desc Test moveFile() interface.Promise.
     * Invalid path.The path point to a file, not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_018 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_018');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_018 dpath ' + JSON.stringify(dpath));
      try {
        await fs.moveDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_018 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath.baseDir);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_1900
     * @tc.name fileIO_test_moveDir_async_static_019
     * @tc.desc Test moveFile() interface.Callback.
     * Invalid path.The path point to a file, not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_019 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_019');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_019 dpath ' + JSON.stringify(dpath));
      try {
        fs.moveDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01', (err: BusinessError<void>|null): void => {
          if(err?.code != 0){
            fs.rmdirSync(dpath.baseDir);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_017 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_019 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_2000
     * @tc.name fileIO_test_moveDir_async_static_020
     * @tc.desc Test moveFile() interface.Promise.
     * Invalid path. Can not move the same path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_020 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_020');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_020 dpath ' + JSON.stringify(dpath));
      try {
        await fs.moveDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_THROW_ERR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_020 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath.baseDir);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

     /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_2100
     * @tc.name fileIO_test_moveDir_async_static_021
     * @tc.desc Test moveFile() interface.Callback.
     * Invalid path.Can not move the same path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_021 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_021');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_021 dpath ' + JSON.stringify(dpath));
      try {
        fs.moveDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_THROW_ERR, (err: BusinessError<void>|null): void => {
          if(err?.code != 0){
            fs.rmdirSync(dpath.baseDir);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_021 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_021 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_2200
     * @tc.name fileIO_test_moveDir_async_static_022
     * @tc.desc Test moveFile() interface.Promise.
     * Invalid path. Can not move subPath.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_022 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_022');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_022 dpath ' + JSON.stringify(dpath));
      try {
        await fs.moveDir(dpath.srcDir, dpath.srcDir + '/srcDir_first', DIRMODE_FILE_THROW_ERR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_022 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath.baseDir);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

     /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_2300
     * @tc.name fileIO_test_moveDir_async_static_023
     * @tc.desc Test moveFile() interface.Callback.
     * Invalid path.Can not move subPath.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_023 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_023');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_023 dpath ' + JSON.stringify(dpath));
      try {
        fs.moveDir(dpath.srcDir, dpath.srcDir + '/srcDir_first', DIRMODE_FILE_THROW_ERR, (err: BusinessError<void>|null): void => {
          if(err?.code != 0){
            fs.rmdirSync(dpath.baseDir);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_023 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_023 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_MOVEDIRASYNC_2400
     * @tc.name fileIO_test_moveDir_async_static_024
     * @tc.desc Test moveFile() interface. Promise.
     * Undefined option arguments, use default mode = DIRMODE_DIRECTORY_THROW_ERR.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_moveDir_async_static_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_024 start');
      let dpath: Dir = await readyFiles('fileIO_test_moveDir_async_static_024');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_024 dpath ' + JSON.stringify(dpath));
      try {
        await fs.moveDir(dpath.srcDir, dpath.destDir, undefined);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveDir_async_static_024 has failed for' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath.baseDir);
        expect(e.code == 13900032 && e.message == 'Directory not empty').assertTrue();
        done();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_moveDir end');

}