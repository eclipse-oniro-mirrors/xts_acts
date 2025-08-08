import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base'
import { WriteOptions } from '@ohos.file.fs';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOStreamWrite() {
  describe('fileIO_fs_stream_write', (): void => {

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0000
     * @tc.name fileIO_test_stream_write_sync_static_000
     * @tc.desc Test the writeSync() interface of class Stream.
     * Create a file stream in r+ mode, writing an ArrayBuffer.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten1 = sr.writeSync(FILE_CONTENT);
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = sr.writeSync(new ArrayBuffer(FILE_CONTENT.length));
        expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), { offset: 0 });
        expect(readLen == FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_000 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0100
     * @tc.name fileIO_test_stream_write_sync_static_001
     * @tc.desc Test the writeSync() interface of class Stream.
     * Create a file stream in r+ mode, writing a string.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(FILE_CONTENT);
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_001 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0200
     * @tc.name fileIO_test_stream_write_sync_static_002
     * @tc.desc Test the writeSync() interface of class Stream.
     * Create a file stream in r+ mode, writing a string with offset = 1.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(FILE_CONTENT, { offset: 1 });
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_002 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0300
     * @tc.name fileIO_test_stream_write_sync_static_003
     * @tc.desc Test the writeSync() interface of class Stream.
     * Write a string with invalide offset = -1.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sr = fs.createStreamSync(fpath, 'r+');
      let option: WriteOptions = {
        offset: -1,
      }
      try {
        expect(sr !== null).assertTrue();
        sr.writeSync(new ArrayBuffer(4096), option);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        sr.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_003 has failed for ' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0400
     * @tc.name fileIO_test_stream_write_sync_static_004
     * @tc.desc Test the writeSync() interface of class Stream.
     * Create a file stream in r+ mode, writing a string with encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let writeOption: WriteOptions = {
          encoding: 'utf-8'
        };
        let bytesWritten = sr.writeSync(FILE_CONTENT, writeOption);
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_004 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0500
     * @tc.name fileIO_test_stream_write_sync_static_005
     * @tc.desc Test the writeSync() interface of class Stream.
     * Create a file stream in r+ mode, writing a string with length = 5.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(FILE_CONTENT, { length: 5 });
        expect(bytesWritten == 5).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_005 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0600
     * @tc.name fileIO_test_stream_write_sync_static_006
     * @tc.desc Test the writeSync() interface of class Stream.
     * Write an ArrayBuffer with invalid length > size of ArrayBuffer(4096).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sr = fs.createStreamSync(fpath, 'r+');

      try {
        expect(sr !== null).assertTrue();
        const invalidLength = 4097;
        sr.writeSync(new ArrayBuffer(4096), { length: invalidLength });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        sr.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_006 has failed for ' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0700
     * @tc.name fileIO_test_stream_write_sync_static_007
     * @tc.desc Test the writeSync() interface of class Stream.
     * Write a string with invalid length = 9999.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sr = fs.createStreamSync(fpath, 'r+');
      const invalidLength = 9999;

      try {
        expect(sr !== null).assertTrue();
        sr.writeSync(FILE_CONTENT, { length: invalidLength });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        sr.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_007 has failed for ' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0800
     * @tc.name fileIO_test_stream_write_sync_static_008
     * @tc.desc Test the writeSync() interface of class Stream.
     * Create a file stream in r+ mode, writing an ArrayBuffer with offset = 1, length = 4096 and encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(new ArrayBuffer(4096), {
          offset: 1,
          length: 4096,
          encoding: 'utf-8'
        });
        expect(bytesWritten == 4096).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_008 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0900
     * @tc.name fileIO_test_stream_write_sync_static_009
     * @tc.desc Test the writeSync() interface of class Stream.
     * Create a file stream in r+ mode, writing a string with offset = 1, length = 11 and encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_009');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(FILE_CONTENT, {
          offset: 1,
          length: FILE_CONTENT.length,
          encoding: 'utf-8'
        });
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_009 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_1000
     * @tc.name fileIO_test_stream_write_sync_static_010
     * @tc.desc Test the writeSync() interface of class Stream.
     * Create a file stream in r+ mode, writing a string with empty option.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(FILE_CONTENT, {});
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_010 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_1100
     * @tc.name fileIO_test_stream_write_sync_static_011
     * @tc.desc Test the writeSync() interface of class Stream.
     * Undefined option arguments, use default options.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(new ArrayBuffer(4096), undefined);
        expect(bytesWritten == 4096).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_011 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_1200
     * @tc.name fileIO_test_stream_write_sync_static_012
     * @tc.desc Test the writeSync() interface of class Stream.
     * Undefined option arguments, use default options.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_sync_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_sync_static_012');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(new ArrayBuffer(4096), {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        expect(bytesWritten == 4096).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_sync_static_012 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0000
     * @tc.name fileIO_test_stream_write_async_static_000
     * @tc.desc Test the write() interface of class Stream. Promise.
     * Create a file stream in r+ mode, writing an ArrayBuffer.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten1 = await sr.write(FILE_CONTENT);
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await sr.write(new ArrayBuffer(FILE_CONTENT.length));
        expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), { offset: 0 });
        expect(readLen == FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_000 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0100
     * @tc.name fileIO_test_stream_write_async_static_001
     * @tc.desc Test the write() interface of class Stream. Callback.
     * Create a file stream in r+ mode, writing an ArrayBuffer.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.write(FILE_CONTENT, (err, bytesWritten1) => {
          expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
          sr.write(new ArrayBuffer(FILE_CONTENT.length), (err: BusinessError | null, bytesWritten2: number | undefined) => {
            expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
            let readLen = sr.readSync(new ArrayBuffer(4096), { offset: 0 });
            expect(readLen == FILE_CONTENT.length * 2).assertTrue();
            sr.closeSync();
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_001 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0200
     * @tc.name fileIO_test_stream_write_async_static_002
     * @tc.desc Test the write() interface of class Stream. Promise.
     * Create a file stream in r+ mode, writing a string.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = await sr.write(FILE_CONTENT);
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_002 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0300
     * @tc.name fileIO_test_stream_write_async_static_003
     * @tc.desc Test the write() interface of class Stream. Callback.
     * Create a file stream in r+ mode, writing a string.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.write(FILE_CONTENT, (err: BusinessError | null, bytesWritten: number | undefined) => {
          expect(bytesWritten == FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_003 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0400
     * @tc.name fileIO_test_stream_write_async_static_004
     * @tc.desc Test the write() interface of class Stream. Promise.
     * Create a file stream in r+ mode, writing a string with offset = 1.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = await sr.write(FILE_CONTENT, { offset: 1 });
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_004 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0500
     * @tc.name fileIO_test_stream_write_async_static_005
     * @tc.desc Test the write() interface of class Stream. Callback.
     * Create a file stream in r+ mode, writing a string with offset = 1.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.write(FILE_CONTENT, {
          offset: 1
        }, (err: BusinessError | null, bytesWritten: number | undefined) => {
          expect(bytesWritten == FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_005 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0600
     * @tc.name fileIO_test_stream_write_async_static_006
     * @tc.desc Test the write() interface of class Stream. Callback.
     * Write a string with invalide offset = -1.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sr = fs.createStreamSync(fpath, 'r+');
      const invalidOffset = -1;

      try{
        expect(sr !== null).assertTrue();
        sr.write(new ArrayBuffer(4096), {
          offset: invalidOffset
        }, (err: BusinessError<void> | null) => {
          sr.closeSync();
          fs.unlinkSync(fpath);
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_006 has failed for ' + JSON.stringify(err));
          expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_006 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0700
     * @tc.name fileIO_test_stream_write_async_static_007
     * @tc.desc Test the write() interface of class Stream. Promise.
     * Create a file stream in r+ mode, writing a string with encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = await sr.write(FILE_CONTENT, { encoding: 'utf-8' });
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_007 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0800
     * @tc.name fileIO_test_stream_write_async_static_008
     * @tc.desc Test the write() interface of class Stream. Promise.
     * Create a file stream in r+ mode, writing a string with encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.write(FILE_CONTENT, {
          encoding: 'utf-8'
        }, (err, bytesWritten) => {
          expect(bytesWritten == FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_008 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0900
     * @tc.name fileIO_test_stream_write_async_static_009
     * @tc.desc Test the write() interface of class Stream. Promise.
     * Create a file stream in r+ mode, writing a string with length = 5.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_009');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = await sr.write(FILE_CONTENT, { length: 5 });
        expect(bytesWritten == 5).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_009 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1000
     * @tc.name fileIO_test_stream_write_async_static_010
     * @tc.desc Test the write() interface of class Stream. Callback.
     * Create a file stream in r+ mode, writing a string with length = 5.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.write(FILE_CONTENT, {
          length: 5
        }, (err: BusinessError | null, bytesWritten: number | undefined) => {
          expect(bytesWritten == 5).assertTrue();
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_010 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1100
     * @tc.name fileIO_test_stream_write_async_static_011
     * @tc.desc Test the write() interface of class Stream. Callback.
     * Write an ArrayBuffer with invalid length > size of ArrayBuffer(4096).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sr = fs.createStreamSync(fpath, 'r+');
      const invalidLength = 4097;

      try{
        expect(sr !== null).assertTrue();
        sr.write(new ArrayBuffer(4096), {
          length: invalidLength
        }, (err: BusinessError<void> | null) => {
          sr.closeSync();
          fs.unlinkSync(fpath);
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_011 has failed for ' + JSON.stringify(err));
          expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_011 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1200
     * @tc.name fileIO_test_stream_write_async_static_012
     * @tc.desc Test the write() interface of class Stream. Callback.
     * Write a string with invalid length = 9999.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_012');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sr = fs.createStreamSync(fpath, 'r+');
      const invalidLength = 9999;

      try{
        expect(sr !== null).assertTrue();
        sr.write(FILE_CONTENT, {
          length: invalidLength
        }, (err: BusinessError<void> | null) => {
          sr.closeSync();
          fs.unlinkSync(fpath);
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_012 has failed for22222 ' + JSON.stringify(err));
          expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_012 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1300
     * @tc.name fileIO_test_stream_write_async_static_013
     * @tc.desc Test the write() interface of class Stream. Promise.
     * Create a file stream in r+ mode, writing an ArrayBuffer with offset = 1, length = 4096 and encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_013');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = await sr.write(new ArrayBuffer(4096), {
          offset: 1,
          length: 4096,
          encoding: 'utf-8'
        });
        expect(bytesWritten == 4096).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_013 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1400
     * @tc.name fileIO_test_stream_write_async_static_014
     * @tc.desc Test the write() interface of class Stream. Callback.
     * Create a file stream in r+ mode, writing an ArrayBuffer with offset = 1, length = 4096 and encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_014');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.write(new ArrayBuffer(4096), {
          offset: 1,
          length: 4096,
          encoding: 'utf-8'
        }, (err: BusinessError | null, bytesWritten: number | undefined) => {
          expect(bytesWritten == 4096).assertTrue();
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_014 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1500
     * @tc.name fileIO_test_stream_write_async_static_015
     * @tc.desc Test the write() interface of class Stream. Promise.
     * Create a file stream in r+ mode, writing a string with offset = 1, length = 4096 and encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_015');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = await sr.write(FILE_CONTENT, {
          offset: 1,
          length: FILE_CONTENT.length,
          encoding: 'utf-8'
        });
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_015 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1600
     * @tc.name fileIO_test_stream_write_async_static_016
     * @tc.desc Test the write() interface of class Stream. Callback.
     * Create a file stream in r+ mode, writing a string with offset = 1, length = 4096 and encoding = 'utf-8'.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_016');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.write(FILE_CONTENT, {
          offset: 1,
          length: FILE_CONTENT.length,
          encoding: 'utf-8'
        }, (err: BusinessError | null, bytesWritten: number | undefined) => {
          expect(bytesWritten == FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_016 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1700
     * @tc.name fileIO_test_stream_write_async_static_017
     * @tc.desc Test the write() interface of class Stream. Promise.
     * Create a file stream in r+ mode, writing a string with empty option.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_017');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten = await sr.write(FILE_CONTENT, {});
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_017 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1800
     * @tc.name fileIO_test_stream_write_async_static_018
     * @tc.desc Test the write() interface of class Stream. Callback.
     * Create a file stream in r+ mode, writing a string with empty option.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_018');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.write(FILE_CONTENT, {
        }, (err: BusinessError | null, bytesWritten: number | undefined) => {
          expect(bytesWritten == FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_018 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1900
     * @tc.name fileIO_test_stream_write_async_static_019
     * @tc.desc Test the write() interface of class Stream. Promise.
     * Undefined option arguments, use default options.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_019');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten1 = await sr.write(FILE_CONTENT, undefined);
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await sr.write(new ArrayBuffer(FILE_CONTENT.length), undefined);
        expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), { offset: 0 });
        expect(readLen == FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_019 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });


    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_2000
     * @tc.name fileIO_test_stream_write_async_static_020
     * @tc.desc Test the write() interface of class Stream. Promise.
     * Undefined option arguments, use default options.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_020');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let bytesWritten1 = await sr.write(FILE_CONTENT, {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await sr.write(new ArrayBuffer(FILE_CONTENT.length), {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), { offset: 0 });
        expect(readLen == FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_020 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_2100
     * @tc.name fileIO_test_stream_write_async_static_021
     * @tc.desc Test the write() interface of class Stream. Callback.
     * Undefined option arguments, use default options.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_stream_write_async_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_write_async_static_021');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.write(FILE_CONTENT, {
          offset: undefined,
          length: undefined,
          encoding: undefined
        }, (err, bytesWritten1) => {
          expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
          sr.write(new ArrayBuffer(FILE_CONTENT.length), {
            offset: undefined,
            length: undefined,
            encoding: undefined
          }, (err: BusinessError | null, bytesWritten2: number | undefined) => {
            expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
            let readLen = sr.readSync(new ArrayBuffer(4096), { offset: 0 });
            expect(readLen == FILE_CONTENT.length * 2).assertTrue();
            sr.closeSync();
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_write_async_static_021 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}
