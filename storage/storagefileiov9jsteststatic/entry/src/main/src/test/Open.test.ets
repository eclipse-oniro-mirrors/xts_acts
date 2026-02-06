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

export default function fileIOOpen() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_open", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_open start');

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0000
     * @tc.name fileIO_test_open_sync_static_000
     * @tc.desc Test openSync() interfaces. mode=0o0.
     * Open the file in read-only mode, verifying the file is readable.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_open_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0100
     * @tc.name fileIO_test_open_sync_static_001
     * @tc.desc Test openSync() interfaces. mode=0o1.
     * Open the file in write-only mode, verifying the file is writable.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = fs.writeSync(file.fd, FILE_CONTENT);
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0200
     * @tc.name fileIO_test_open_sync_static_002
     * @tc.desc Test openSync() interfaces. mode=0o2.
     * Open the file in read-write mode, verifying the file is readable and writable.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        let length = 20;
        let bytesWritten = fs.writeSync(file.fd, new ArrayBuffer(length), { offset: 0 });
        expect(bytesWritten == length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0300
     * @tc.name fileIO_test_open_sync_static_003
     * @tc.desc Test openSync() interfaces. mode=0o102.
     * If the path point to the file which does not exist, the file can be created.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_003');
      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0400
     * @tc.name fileIO_test_open_sync_static_004
     * @tc.desc Test openSync() interfaces. mode=0o1002.
     * If the file exists and the file is opened for read-write, trim its length to zero.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_004 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0500
     * @tc.name fileIO_test_open_sync_static_005
     * @tc.desc Test openSync() interfaces. mode=0o2002.
     * Open as append, subsequent writes will append to the end of the file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_005 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let length = 100;
        let bytesWritten = fs.writeSync(file.fd, new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
        expect(readLen == length + FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0600
     * @tc.name fileIO_test_open_sync_static_006
     * @tc.desc Test openSync() interfaces. mode=0o4002.
     * If the file is a special file, the opening and subsequent IOs perform non-blocking operations.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.NONBLOCK | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0700
     * @tc.name fileIO_test_open_sync_static_007
     * @tc.desc Test openSync() interfaces. mode=0o200000.
     * The path points to a directory.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_007 start');
      let dpath = await Utils.nextFileName('fileIO_test_open_sync_static_007');
      fs.mkdirSync(dpath);
      try {
        let file = fs.openSync(dpath, fs.OpenMode.DIR);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0800
     * @tc.name fileIO_test_open_sync_static_008
     * @tc.desc Test openSync() interfaces. mode=0o200000.
     * The path does not a directory, throw error.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_008 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.DIR);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_008 has failed for' + JSON.stringify(e));
        expect(e.code == 13900018 && e.message == 'Not a directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0900
     * @tc.name fileIO_test_open_sync_static_009
     * @tc.desc Test openSync() interfaces. mode=0o400002.
     * The path does not point to a symbolic link.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_009 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_009');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.NOFOLLOW | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_009 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_1000
     * @tc.name fileIO_test_open_sync_static_010
     * @tc.desc Test openSync() interfaces. mode=0o4010002.
     * Open the file in the way of synchronous IO.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_010 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.SYNC | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_1100
     * @tc.name fileIO_test_open_sync_static_011
     * @tc.desc Test openSync() interfaces. mode=0o200000.
     * The path refers to a directory, not a file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_011 start');
      let dpath = await Utils.nextFileName('fileIO_test_open_sync_static_011');
      fs.mkdirSync(dpath);
      try {
        let file = fs.openSync(dpath, fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_011 has failed for' + JSON.stringify(e));
        expect(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_1200
     * @tc.name fileIO_test_open_sync_static_012
     * @tc.desc Test openSync() interfaces.
     * Undefined option arguments, use default mode = 0o0.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_012 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_012');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file: fs.File;
      try {
        file = fs.openSync(fpath, undefined);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == FILE_CONTENT.length).assertTrue();
        fs.writeSync(file.fd, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_012 has failed for' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_SYNC_1300
     * @tc.name fileIO_test_open_sync_static_013
     * @tc.desc Test openSync() interfaces. mode=0o102.
     * File name too long.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_sync_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_013 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_sync_static_013');
      let fpath1 = fpath + await Utils.randomString(250);
      try {
        let file = fs.openSync(fpath1, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_sync_static_013 has failed for' + JSON.stringify(e));
        expect(e.code == 13900030 && e.message == 'File name too long').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0000
     * @tc.name fileIO_test_open_async_static_000
     * @tc.desc Test open() interfaces. mode=0o0. Promise.
     * Open the file in read-only mode, verifying the file is readable.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_open_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = await fs.open(fpath, fs.OpenMode.READ_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.read(file.fd, new ArrayBuffer(4096)).then((readLen: number) => {
          expect(readLen == FILE_CONTENT.length).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0100
     * @tc.name fileIO_test_open_async_static_001
     * @tc.desc Test open() interfaces. mode=0o0. Callback.
     * Open the file in read-only mode, verifying the file is readable.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.open(fpath, fs.OpenMode.READ_ONLY, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_001 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof file?.fd == 'number').assertTrue();
          fs.read(file!.fd, new ArrayBuffer(4096)).then((readLen: number) => {
            expect(readLen == FILE_CONTENT.length).assertTrue();
            fs.closeSync(file!);
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0200
     * @tc.name fileIO_test_open_async_static_002
     * @tc.desc Test open() interfaces. mode=0o1. Promise.
     * Open the file in write-only mode, verifying the file is writable.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let length = 20;
      try {
        let file = await fs.open(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, new ArrayBuffer(length)).then((bytesWritten: number) => {
          expect(bytesWritten == length).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0300
     * @tc.name fileIO_test_open_async_static_003
     * @tc.desc Test open() interfaces. mode=0o1. Callback.
     * Open the file in write-only mode, verifying the file is writable.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let length = 20;
      try {
        fs.open(fpath, fs.OpenMode.WRITE_ONLY, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_003 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof file?.fd == 'number').assertTrue();
          fs.write(file!.fd, new ArrayBuffer(length)).then((bytesWritten: number) => {
            expect(bytesWritten == length).assertTrue();
            fs.closeSync(file!);
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0400
     * @tc.name fileIO_test_open_async_static_004
     * @tc.desc Test open() interfaces. mode=0o2. Promise.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_004 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_004');
      try {
        await fs.open(fpath, fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_004 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0500
     * @tc.name fileIO_test_open_async_static_005
     * @tc.desc Test open() interfaces. mode=0o2. Callback.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_005 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_005');
      try {
        fs.open(fpath, fs.OpenMode.READ_WRITE, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_005 has error for' + JSON.stringify(err));
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0600
     * @tc.name fileIO_test_open_async_static_006
     * @tc.desc Test open() interfaces. mode=0o2. Promise.then().catch()
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_006');
      try {
        fs.open(fpath, fs.OpenMode.READ_WRITE).then(() => {
          expect(false).assertTrue();
        }).catch((err: BusinessError) : Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_006 has error for' + JSON.stringify(err));
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0700
     * @tc.name fileIO_test_open_async_static_007
     * @tc.desc Test open() interfaces. mode=0o102. Promise.
     * If the path point to the file which does not exist, the file can be created.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_007');
      try {
        let file = await fs.open(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0800
     * @tc.name fileIO_test_open_async_static_008
     * @tc.desc Test open() interfaces. mode=0o102. Callback.
     * If the path point to the file which does not exist, the file can be created.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_008 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_008');
      try {
        fs.open(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_008 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof file?.fd == 'number').assertTrue();
          fs.closeSync(file!);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0900
     * @tc.name fileIO_test_open_async_static_009
     * @tc.desc Test open() interfaces. mode=0o1002. Promise.
     * If the file exists and the file is opened for read-write, trim its length to zero.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_009 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_009');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = await fs.open(fpath, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.read(file.fd, new ArrayBuffer(4096)).then((readLen: number) => {
          expect(readLen == 0).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_009 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1000
     * @tc.name fileIO_test_open_async_static_010
     * @tc.desc Test open() interfaces. mode=0o1002. Callback.
     * If the file exists and the file is opened for read-write, trim its length to zero.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_010 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.open(fpath, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_010 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof file?.fd == 'number').assertTrue();
          fs.read(file!.fd, new ArrayBuffer(4096)).then((readLen: number) => {
            expect(readLen == 0).assertTrue();
            fs.closeSync(file!);
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1100
     * @tc.name fileIO_test_open_async_static_011
     * @tc.desc Test open() interfaces. mode=0o2002. Promise.
     * Open as append, subsequent writes will append to the end of the file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_011 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let length = 100;
      try {
        let file = await fs.open(fpath, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let writelen = fs.writeSync(file.fd, new ArrayBuffer(length));
        fs.read(file.fd, new ArrayBuffer(4096), { offset: 0 }).then((readLen: number) => {
          expect(readLen == length + FILE_CONTENT.length).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
        });
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1200
     * @tc.name fileIO_test_open_async_static_012
     * @tc.desc Test open() interfaces. mode=0o2002. Callback.
     * Open as append, subsequent writes will append to the end of the file.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_012 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_012');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let length = 100;
      try {
        fs.open(fpath, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_012 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof file?.fd == 'number').assertTrue();
          fs.writeSync(file!.fd, new ArrayBuffer(length));
          fs.read(file!.fd, new ArrayBuffer(4096), { offset: 0 }).then((readLen: number) => {
            expect(readLen == length + FILE_CONTENT.length).assertTrue();
            fs.closeSync(file!);
            fs.unlinkSync(fpath);
          });
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_012 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1300
     * @tc.name fileIO_test_open_async_static_013
     * @tc.desc Test open() interfaces. mode=0o4002. Promise.
     * If the file is a special file, the opening and subsequent IOs perform non-blocking operations.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_013 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_013');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = await fs.open(fpath, fs.OpenMode.NONBLOCK | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_013 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1400
     * @tc.name fileIO_test_open_async_static_014
     * @tc.desc Test open() interfaces. mode=0o4002. Callback.
     * If the file is a special file, the opening and subsequent IOs perform non-blocking operations.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_014 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_014');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.open(fpath, fs.OpenMode.NONBLOCK | fs.OpenMode.READ_WRITE, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_014 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof file?.fd == 'number').assertTrue();
          fs.closeSync(file!);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_014 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1500
     * @tc.name fileIO_test_open_async_static_015
     * @tc.desc Test open() interfaces. mode=0o200000. Promise.
     * The path points to a directory.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_015 start');
      let dpath = await Utils.nextFileName('fileIO_test_open_async_static_015');
      fs.mkdirSync(dpath);
      try {
        let file = await fs.open(dpath, fs.OpenMode.DIR);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_015 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1600
     * @tc.name fileIO_test_open_async_static_016
     * @tc.desc Test open() interfaces. mode=0o200000. Callback.
     * The path points to a directory.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_016 start');
      let dpath = await Utils.nextFileName('fileIO_test_open_async_static_016');
      fs.mkdirSync(dpath);
      try {
        fs.open(dpath, fs.OpenMode.DIR, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_016 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof file?.fd == 'number').assertTrue();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_016 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1700
     * @tc.name fileIO_test_open_async_static_017
     * @tc.desc Test open() interfaces. mode=0o200000. Promise.
     * The path does not point to a directory, throw error.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_017 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_017');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        await fs.open(fpath, fs.OpenMode.DIR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_017 has failed for' + JSON.stringify(e));
        expect(e.code == 13900018 && e.message == 'Not a directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1800
     * @tc.name fileIO_test_open_async_static_018
     * @tc.desc Test open() interfaces. mode=0o200000. Callback.
     * The path does not point to a directory, throw error.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_018 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_018');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.open(fpath, fs.OpenMode.DIR, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            fs.unlinkSync(fpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_018 has error for' + JSON.stringify(err));
            expect(err?.code == 13900018 && err?.message == 'Not a directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_018 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_1900
     * @tc.name fileIO_test_open_async_static_019
     * @tc.desc Test open() interfaces. mode=0o200000. Promise.then().catch().
     * The path does not point to a directory, throw error.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_019 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_019');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        await fs.open(fpath, fs.OpenMode.DIR).then(() => {
          expect(false).assertTrue();
        }).catch((err: BusinessError) : Promise<void> => {
          fs.unlinkSync(fpath);
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_019 has error for' + JSON.stringify(err));
          expect(err.code == 13900018 && err.message == 'Not a directory').assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_019 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2000
     * @tc.name fileIO_test_open_async_static_020
     * @tc.desc Test open() interfaces. mode=0o400002. Promise.
     * The path does not point to a symbolic link.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_020 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_020');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = await fs.open(fpath, fs.OpenMode.NOFOLLOW | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_020 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2100
     * @tc.name fileIO_test_open_async_static_021
     * @tc.desc Test open() interfaces. mode=0o400002. Callback.
     * The path does not point to a symbolic link.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_021 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_021');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.open(fpath, fs.OpenMode.NOFOLLOW | fs.OpenMode.READ_WRITE, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_021 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof file?.fd == 'number').assertTrue();
          fs.closeSync(file!);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_021 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2200
     * @tc.name fileIO_test_open_async_static_022
     * @tc.desc Test open() interfaces. mode=0o4010002. Promise.
     * Open the file in the way of synchronous IO.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_022 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_022');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = await fs.open(fpath, fs.OpenMode.SYNC | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_022 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2300
     * @tc.name fileIO_test_open_async_static_023
     * @tc.desc Test open() interfaces. mode=0o4010002. Callback.
     * Open the file in the way of synchronous IO.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_023 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_023');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.open(fpath, fs.OpenMode.SYNC | fs.OpenMode.READ_WRITE, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_023 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(typeof file?.fd == 'number').assertTrue();
          fs.closeSync(file!);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_023 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2400
     * @tc.name fileIO_test_open_async_static_024
     * @tc.desc Test open() interfaces. Promise.
     * The path refers to a file, not a directory.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_024 start');
      let dpath = await Utils.nextFileName('fileIO_test_open_async_static_024');
      fs.mkdirSync(dpath);
      try {
        await fs.open(dpath, fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_024 has failed for' + JSON.stringify(e));
        expect(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2500
     * @tc.name fileIO_test_open_async_static_025
     * @tc.desc Test open() interfaces. Callback.
     * The path refers to a file, not a directory.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_025 start');
      let dpath = await Utils.nextFileName('fileIO_test_open_async_static_025');
      fs.mkdirSync(dpath);
      try {
        fs.open(dpath, fs.OpenMode.READ_WRITE, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            fs.rmdirSync(dpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_025 has error for' + JSON.stringify(err));
            expect(err?.code == 13900019 && err?.message == 'Is a directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_025 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2600
     * @tc.name fileIO_test_open_async_static_026
     * @tc.desc Test open() interfaces. Promise.
     * Undefined option arguments, use default mode = 0o0.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_026 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_026');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file: fs.File;
      try {
        file = await fs.open(fpath, undefined);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == FILE_CONTENT.length).assertTrue();
        fs.writeSync(file.fd, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_026 has failed for' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2800
     * @tc.name fileIO_test_open_async_static_028
     * @tc.desc Test open() interfaces. mode=0o102. Promise.
     * File name too long.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_028 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_028');
      let fpath1 = fpath + await Utils.randomString(250);
      try {
        await fs.open(fpath1, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_028 has failed for' + JSON.stringify(e));
        expect(e.code == 13900030 && e.message == 'File name too long').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_2900
     * @tc.name fileIO_test_open_async_static_029
     * @tc.desc Test open() interfaces. mode=0o102. Callback.
     * File name too long.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_open_async_static_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_029 start');
      let fpath = await Utils.nextFileName('fileIO_test_open_async_static_029');
      let fpath1 = fpath + await Utils.randomString(250);
      try {
        fs.open(fpath1, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, (err: BusinessError | null, file: fs.File | undefined) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_029 has error for' + JSON.stringify(err));
            expect(err?.code == 13900030 && err?.message == 'File name too long').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_open_async_static_029 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_open end');

}