import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIODup() {
  describe('fileIO_fs_dup', (): void => {

    /**
     * @tc.number SUB_DF_FILEIO_DUP_SYNC_0000
     * @tc.name fileIO_test_dup_sync_static_000
     * @tc.desc Test dup() interfaces.
     * Verifing the old and new fds share the same file offset.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_dup_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_dup_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let newFile = fs.dup(file.fd);
        expect(newFile.path == fpath).assertTrue();
        let bytesWritten = fs.writeSync(newFile.fd, new ArrayBuffer(20));
        expect(bytesWritten == 20).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == 0).assertTrue();
        fs.closeSync(file);
        fs.closeSync(newFile);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_dup_sync_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_DUP_SYNC_0100
     * @tc.name fileIO_test_dup_sync_static_001
     * @tc.desc Test dup() interfaces.
     * Open the file in read-only mode, verifying the new fd is readable.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_dup_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_dup_sync_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let newFile = fs.dup(file.fd);
        fs.closeSync(file);
        expect(newFile.path == fpath).assertTrue();
        let readlen = fs.readSync(newFile.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.writeSync(newFile.fd, FILE_CONTENT);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_dup_sync_static_001 end error' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_DUP_SYNC_0200
     * @tc.name fileIO_test_dup_sync_static_002
     * @tc.desc Test dup() interfaces.
     * Open the file in write-only mode, verifying the new fd is writable.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_dup_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_dup_sync_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        let newFile = fs.dup(file.fd);
        fs.closeSync(file);
        expect(newFile.path == fpath).assertTrue();
        let bytesWritten = fs.writeSync(newFile.fd, FILE_CONTENT);
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        fs.readSync(newFile.fd, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_dup_sync_static_002 end error' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_DUP_SYNC_0400
     * @tc.name fileIO_test_dup_sync_static_004
     * @tc.desc Test dup() interfaces.
     * The file descriptor must be valid(fd > 0).
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_dup_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {

      try {
        fs.dup(-1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_dup_sync_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_DUP_SYNC_0500
     * @tc.name fileIO_test_dup_sync_static_005
     * @tc.desc Test dup() interfaces.
     * The file has been closed and the file descriptor is invalid.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_dup_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_dup_sync_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let fd = file.fd;
        fs.closeSync(file);
        let newFile = fs.dup(fd);
        fs.writeSync(newFile.fd, new ArrayBuffer(20));
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_dup_sync_static_005 end error' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });
  });
}