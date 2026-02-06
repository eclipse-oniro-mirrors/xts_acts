import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOFdatasync() {
  describe('fileIO_fs_fdatasync', (): void => {

    /**
     * @tc.number SUB_DF_FILEIO_FDATASYNC_SYNC_0000
     * @tc.name fileIO_test_fdatasync_sync_static_000
     * @tc.desc Test fdatasyncSync() interfaces.
     * Open the file in read-write mode, and synchronize the file content data.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_fdatasync_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdatasync_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.fdatasyncSync(file.fd);
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdatasync_sync_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FDATASYNC_SYNC_0100
     * @tc.name fileIO_test_fdatasync_sync_static_001
     * @tc.desc Test fdatasyncSync() interfaces. Invalid fd parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_fdatasync_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {

      try {
        fs.fdatasyncSync(-1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdatasync_sync_static_001 end error' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0000
     * @tc.name fileIO_test_fdatasync_async_static_000
     * @tc.desc Test fdatasync() interfaces. Callback.
     * Open the file in read-write mode, and synchronize the file content data.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_fdatasync_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdatasync_async_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.fdatasync(file.fd, (err: BusinessError<void> | null) => {
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdatasync_async_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0100
     * @tc.name fileIO_test_fdatasync_async_static_001
     * @tc.desc Test fdatasync() interfaces. Promise.then().catch().
     * Open the file in read-write mode, and synchronize the file content data.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_fdatasync_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdatasync_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.fdatasync(file.fd).then(() => {
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        }).catch((err: ()=>void): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdatasync_async_static_001 error' + JSON.stringify(err));
          expect(false).assertTrue();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdatasync_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0200
     * @tc.name fileIO_test_fdatasync_async_static_002
     * @tc.desc Test fdatasync() interfaces. await Promise.
     * Open the file in read-write mode, and synchronize the file content data.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_fdatasync_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdatasync_async_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        await fs.fdatasync(file.fd);
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdatasync_async_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0300
     * @tc.name fileIO_test_fdatasync_async_static_003
     * @tc.desc Test fdatasync() interfaces. await Promise.
     * Invalid fd parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_fdatasync_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {

      try {
        await fs.fdatasync(-1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdatasync_async_static_003 end error' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0400
     * @tc.name fileIO_test_fdatasync_async_static_004
     * @tc.desc Test fdatasync() interfaces. Callback.
     * Invalid fd parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_fdatasync_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {

      try {
        fs.fdatasync(-1, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdatasync_async_static_004 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900008 && err?.message == 'Bad file descriptor').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdatasync_async_static_004 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0500
     * @tc.name fileIO_test_fdatasync_async_static_005
     * @tc.desc Test fdatasync() interfaces. Promise.then().catch()
     * Invalid fd parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_fdatasync_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {

      try {
        fs.fdatasync(-1).then(() => {
          expect(false).assertTrue();
        }).catch((err: BusinessError): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdatasync_async_static_005 error: {message: ' + JSON.stringify(err) + '}');
          expect(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdatasync_async_static_005 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}