import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function fileIOUnlink() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_unlink", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_unlink start');

    /**
     * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_0100
     * @tc.name fileIO_test_unlink_sync_static_001
     * @tc.desc Test unlinkSync() interfaces.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_unlink_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_sync_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_unlink_sync_static_001');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_sync_static_001 fpath: ' + fpath);
        fs.unlinkSync(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_sync_static_001 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_0200
     * @tc.name fileIO_test_unlink_sync_static_002
     * @tc.desc Test unlinkSync() interfaces.
     * Delete the file by path, verify the normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_unlink_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_sync_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_unlink_sync_static_002');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_sync_static_002 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(fs.accessSync(fpath)).assertTrue();
        fs.unlinkSync(fpath);
        expect(!fs.accessSync(fpath)).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_sync_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_UNLINK_SYNC_0300
     * @tc.name fileIO_test_unlink_sync_static_003
     * @tc.desc Test unlinkSync() interfaces.
     * The path refers to a directory, not a file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_unlink_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_sync_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_unlink_sync_static_003');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_sync_static_003 fpath: ' + fpath);
      fs.mkdirSync(fpath);
      try {
        fs.unlinkSync(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_sync_static_003 has failed for' + JSON.stringify(e));
        expect(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FileIO_UNLINK_ASYNC_0000
     * @tc.name fileIO_test_unlink_async_static_000
     * @tc.desc Test unlinkAsync() interfaces. Promise.
     * Delete the file by path, verify the normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_unlink_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_unlink_async_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(fs.accessSync(fpath)).assertTrue();
        await fs.unlink(fpath);
        expect(!fs.accessSync(fpath)).assertTrue();
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FileIO_UNLINK_ASYNC_0100
     * @tc.name fileIO_test_unlink_async_static_001
     * @tc.desc Test unlinkAsync() interfaces. Callback.
     * Delete the file by path, verify the normal function.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_unlink_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_unlink_async_static_001');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_001 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(fs.accessSync(fpath)).assertTrue();
        fs.unlink(fpath, (err: BusinessError<void> | null) => {
          expect(!fs.accessSync(fpath)).assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FileIO_UNLINK_ASYNC_0200
     * @tc.name fileIO_test_unlink_async_static_002
     * @tc.desc Test unlink() interfaces. Callback.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_unlink_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_unlink_async_static_002');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_002 fpath: ' + fpath);
        fs.unlink(fpath, (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_002 has failed for' + JSON.stringify(err));
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FileIO_UNLINK_ASYNC_0300
     * @tc.name fileIO_test_unlink_async_static_003
     * @tc.desc Test unlink() interfaces. Promise.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_unlink_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_003 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_unlink_async_static_003');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_003 fpath: ' + fpath);
        await fs.unlink(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_003 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_UNLINK_ASYNC_0400
     * @tc.name fileIO_test_unlink_async_static_004
     * @tc.desc Test unlink() interfaces. Promise.
     * The path refers to a directory, not a file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_unlink_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_004 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_unlink_async_static_004');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_004 fpath: ' + fpath);
        fs.mkdirSync(fpath);
        await fs.unlink(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_004 has failed for' + JSON.stringify(e));
        expect(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_UNLINK_ASYNC_0500
     * @tc.name fileIO_test_unlink_async_static_005
     * @tc.desc Test unlink() interfaces. Callback.
     * The path refers to a directory, not a file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_unlink_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_005 start');
      let fpath = await Utils.nextFileName('fileIO_test_unlink_async_static_005');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_005 fpath: ' + fpath);
      fs.mkdirSync(fpath);
      try {
        fs.unlink(fpath, (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            fs.rmdirSync(fpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_005 has failed for' + JSON.stringify(err));
            expect(err?.code == 13900019 && err?.message == 'Is a directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_unlink_async_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_unlink end');

}