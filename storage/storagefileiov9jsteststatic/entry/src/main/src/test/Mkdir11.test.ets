import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOMkdir11() {
  describe('fileIO_fs_mkdir11', (): void => {

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0100
     * @tc.name fileIO_test_mkdir_sync_new_static_001
     * @tc.desc Test mkdirSync() interfaces.
     * Create a single level directory, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_mkdir_sync_new_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdir_sync_new_static_001');
      let dpath1 = dpath + '/d1/d2';

      try {
        fs.mkdirSync(dpath,false);
        expect(fs.accessSync(dpath)).assertTrue();
        fs.mkdirSync(dpath1,false);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_sync_new_static_001 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0200
     * @tc.name fileIO_test_mkdir_sync_new_static_002
     * @tc.desc Test mkdirSync() interfaces.
     * Create a multi-level directory, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_mkdir_sync_new_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdir_sync_new_static_002');
      let dpath1 = dpath + '/d1/d2';

      try {
        fs.mkdirSync(dpath,true);
        expect(fs.accessSync(dpath)).assertTrue();
        fs.mkdirSync(dpath1,true);
        expect(fs.accessSync(dpath1)).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_sync_new_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0300
     * @tc.name fileIO_test_mkdir_sync_new_static_003
     * @tc.desc Test mkdirSync() interfaces.
     * missing recursion parameter,use default recursion = false.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_sync_new_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdir_sync_new_static_003');
      let dpath1 = dpath + '/d1/d2';

      try {
        fs.mkdirSync(dpath);
        expect(fs.accessSync(dpath)).assertTrue();
        fs.mkdirSync(dpath1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_sync_new_static_003 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0500
     * @tc.name fileIO_test_mkdir_sync_new_static_005
     * @tc.desc Test mkdirSync() interfaces.
     * The path has pointed to a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_sync_new_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_mkdir_sync_new_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.mkdirSync(fpath,true);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_sync_new_static_005 end error' + JSON.stringify(e));
        expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0600
     * @tc.name fileIO_test_mkdir_sync_new_static_006
     * @tc.desc Test mkdirSync() interfaces.
     * The directory has been existed.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_sync_new_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        fs.mkdirSync('/',false);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_sync_new_static_006 end error' + JSON.stringify(e));
        expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0700
     * @tc.name fileIO_test_mkdir_sync_new_static_007
     * @tc.desc Test mkdirSync() interfaces.
     * The path is empty.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_sync_new_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        fs.mkdirSync('',false);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_sync_new_static_007 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0100
     * @tc.name fileIO_test_mkdir_async_new_static_001
     * @tc.desc Test mkdir() interfaces. Promise.
     * Create a single level directory, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdir_async_new_static_001');
      let dpath1 = dpath + '/d1/d2';

      try {
        await fs.mkdir(dpath,false);
        expect(fs.accessSync(dpath)).assertTrue();
        await fs.mkdir(dpath1,false);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_001 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0200
     * @tc.name fileIO_test_mkdir_async_new_static_002
     * @tc.desc Test mkdir() interfaces. Promise.
     * Create a multi-level directory, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdir_async_new_static_002');
      let dpath1 = dpath + '/d1/d2';

      try {
        await fs.mkdir(dpath,true);
        expect(fs.accessSync(dpath)).assertTrue();
        await fs.mkdir(dpath1,true);
        expect(fs.accessSync(dpath1)).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0300
     * @tc.name fileIO_test_mkdir_async_new_static_003
     * @tc.desc Test mkdir() interfaces. Promise.
     * missing recursion parameter,use default recursion = false.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdir_async_new_static_003');
      let dpath1 = dpath + '/d1/d2';

      try {
        await fs.mkdir(dpath);
        expect(fs.accessSync(dpath)).assertTrue();
        await fs.mkdir(dpath1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_003 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0500
     * @tc.name fileIO_test_mkdir_async_new_static_005
     * @tc.desc Test mkdir() interfaces. Promise.
     * The path has pointed to a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_mkdir_async_new_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.mkdir(fpath,true);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_005 end error' + JSON.stringify(e));
        expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0600
     * @tc.name fileIO_test_mkdir_async_new_static_006
     * @tc.desc Test mkdir() interfaces. Promise.
     * The directory has been existed.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      try {
        await fs.mkdir('/',false);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_006 end error' + JSON.stringify(e));
        expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0700
     * @tc.name fileIO_test_mkdir_async_new_static_007
     * @tc.desc Test mkdir() interfaces. Promise.
     * The path is empty.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      try {
        await fs.mkdir('',false);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_007 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0800
     * @tc.name fileIO_test_mkdir_async_new_static_008
     * @tc.desc Test mkdir() interfaces. Callback.
     * Create a single level directory, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdir_async_new_static_008');
      let dpath1 = dpath + '/d1/d2';

      try {
        fs.mkdir(dpath, false, (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_008 error1 package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fs.accessSync(dpath)).assertTrue();
          fs.mkdir(dpath1, false, (err: BusinessError<void> | null) => {
            if(err?.code != 0) {
              hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_008 error package: ' + JSON.stringify(err));
              fs.rmdirSync(dpath);
              expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
              done();
            }
          });
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_008 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0900
     * @tc.name fileIO_test_mkdir_async_new_static_009
     * @tc.desc Test mkdir() interfaces. Callback.
     * Create a multi-level directory, verify normal function.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdir_async_new_static_009');
      let dpath1 = dpath + '/d1/d2';

      try {
        fs.mkdir(dpath, true, (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_009 error1 package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fs.accessSync(dpath)).assertTrue();
          fs.mkdir(dpath1, true, (err: BusinessError<void> | null) => {
            if(err?.code != 0) {
              hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_009 error package: ' + JSON.stringify(err));
              expect(false).assertTrue();
            }
            expect(fs.accessSync(dpath1)).assertTrue();
            fs.rmdirSync(dpath);
            done();
          });
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_1000
     * @tc.name fileIO_test_mkdir_async_new_static_010
     * @tc.desc Test mkdir() interfaces. Callback.
     * missing recursion parameter,use default recursion = false.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdir_async_new_static_010');
      let dpath1 = dpath + '/d1/d2';

      try {
        fs.mkdir(dpath, (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_010 error1 package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fs.accessSync(dpath)).assertTrue();
          fs.mkdir(dpath1, (err: BusinessError<void> | null) => {
            if(err?.code != 0) {
              hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_010 error package: ' + JSON.stringify(err));
              fs.rmdirSync(dpath);
              expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
              done();
            }
          });
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_010 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_1200
     * @tc.name fileIO_test_mkdir_async_new_static_012
     * @tc.desc Test mkdir() interfaces. Callback.
     * The path has pointed to a file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_mkdir_async_new_static_012');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.mkdir(fpath, true, (err: BusinessError<void> | null) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_012 error package: ' + JSON.stringify(err));
            fs.unlinkSync(fpath);
            expect(err?.code == 13900015 && err?.message == 'File exists').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_012 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_1300
     * @tc.name fileIO_test_mkdir_async_new_static_013
     * @tc.desc Test mkdir() interfaces. Callback.
     * The directory has been existed.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      try {
        fs.mkdir('/', false, (err: BusinessError<void> | null) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_013 error package: ' + JSON.stringify(err));
            expect(err?.code == 13900015 && err?.message == 'File exists').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_013 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_1400
     * @tc.name fileIO_test_mkdir_async_new_static_014
     * @tc.desc Test mkdir() interfaces. Callback.
     * The path is empty.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_mkdir_async_new_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      try {
        fs.mkdir('', false, (err: BusinessError<void> | null) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_014 error package: ' + JSON.stringify(err));
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdir_async_new_static_014 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

  });
}