import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOAccess() {
  describe('fileIO_fs_access', (): void => {

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0000
     * @tc.name test_FileIO_Access_Sync_Static_000
     * @tc.desc Test accessSync() interface.
     * This interface shall work properly in normal case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_FileIO_Access_Sync_Static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_000');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        expect(fs.accessSync(fpath)).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0100
     * @tc.name test_FileIO_Access_Sync_Static_001
     * @tc.desc Test accessSync() interface.
     * The test file is not exist.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_FileIO_Access_Sync_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_000');

      try {
        let ret = fs.accessSync(fpath);
        expect(ret === false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0300
     * @tc.name test_FileIO_Access_Sync_Static_003
     * @tc.desc Test accessSync() interface.
     * Test that the file is exist, AccessModeType = EXIST
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_FileIO_Access_Sync_Static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_003');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.EXIST);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0400
     * @tc.name test_FileIO_Access_Sync_Static_004
     * @tc.desc Test accessSync() interface.
     * Test that the file is exist, AccessModeType = WRITE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_FileIO_Access_Sync_Static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_004');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.WRITE);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_004 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0500
     * @tc.name test_FileIO_Access_Sync_Static_005
     * @tc.desc Test accessSync() interface.
     * Test that the file is exist, AccessModeType = READ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_FileIO_Access_Sync_Static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_005');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.READ);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_005 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0600
     * @tc.name test_FileIO_Access_Sync_Static_006
     * @tc.desc Test accessSync() interface.
     * Test that the file is exist, AccessModeType = READ_WRITE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_FileIO_Access_Sync_Static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_006');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.READ_WRITE);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_005 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0700
     * @tc.name test_FileIO_Access_Sync_Static_007
     * @tc.desc Test accessSync() interface.
     * Test that the file is exist, AccessFlagType.LOCAL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_FileIO_Access_Sync_Static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_007');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.EXIST, fs.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0000
     * @tc.name test_FileIO_Access_Async_Static_000
     * @tc.desc Test access() interface. Promise.
     * Use promise to test that the file is exist. Sync method reads data from file.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_FileIO_Access_Async_Static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_000');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath);
        expect(ret === true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0100
     * @tc.name test_FileIO_Access_Async_Static_001
     * @tc.desc Test access() interface. Callback.
     * Use callback to test that the file is exist. Sync method reads data from file.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_FileIO_Access_Async_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_001');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        fs.access(fpath, (err: BusinessError | null, ret: boolean | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_001 ret：' + ret);
          expect(ret === true).assertTrue();
          let file = fs.openSync(fpath);
          let res = await Utils.isIntNum(file.fd);
          expect(res).assertTrue();
          let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
          expect(readlen == FILE_CONTENT.length).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
        });
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0200
     * @tc.name test_FileIO_Access_Async_Static_002
     * @tc.desc Test access() interface. Promise.
     * Async test file does not exist.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_FileIO_Access_Async_Static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_002');

      try {
        let ret = await fs.access(fpath);
        expect(ret === false).assertTrue();
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0300
     * @tc.name test_FileIO_Access_Async_Static_003
     * @tc.desc Test access() interface. Callback.
     * Async test file does not exist.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_FileIO_Access_Async_Static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_003');

      try {
        fs.access(fpath, (err: BusinessError | null, ret: boolean | undefined) => {
          expect(ret === false).assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0600
     * @tc.name test_FileIO_Access_Async_Static_006
     * @tc.desc Test access() interface. Promise.
     * Use promise to test that the file is exist. AccessModeType = EXIST.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_FileIO_Access_Async_Static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_006');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.EXIST);
        expect(ret === true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_006 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0700
     * @tc.name test_FileIO_Access_Async_Static_007
     * @tc.desc Test access() interface. Promise.
     * Use promise to test that the file is exist. AccessModeType = WRITE.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_FileIO_Access_Async_Static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_007');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.WRITE);
        expect(ret === true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0800
     * @tc.name test_FileIO_Access_Async_Static_008
     * @tc.desc Test access() interface. Promise.
     * Use promise to test that the file is exist. AccessModeType = READ.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_FileIO_Access_Async_Static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_008');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.READ);
        expect(ret === true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_008 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0900
     * @tc.name test_FileIO_Access_Async_Static_009
     * @tc.desc Test access() interface. Promise.
     * Use promise to test that the file is exist. AccessModeType = READ_WRITE.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_FileIO_Access_Async_Static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_009');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.READ_WRITE);
        expect(ret === true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}