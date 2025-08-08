import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIORandomAccessFileRead() {
  describe('fileIO_randomAccessFile_read', (): void => {

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_sync_static_0000
     * @tc.name fileIO_randomaccessfile_read_sync_static_000
     * @tc.desc Test readSync() interface. Test to read data synchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_sync_static_000', Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_sync_static_000');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let randomaccessfile = fs.createRandomAccessFileSync(file);
        let length = 4096;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        let readLength = randomaccessfile.readSync(new ArrayBuffer(length));
        expect(readLength == length).assertTrue();
        randomaccessfile.close();
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_sync_static_000 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_sync_static_0100
     * @tc.name fileIO_randomaccessfile_read_sync_static_001
     * @tc.desc Test readSync() interface. When the offset is 1. Test to read data synchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_sync_static_001', Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_sync_static_001');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 20;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        let readLength = randomaccessfile.readSync(new ArrayBuffer(length), { offset: 1 });
        expect(readLength == length - 1).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_sync_static_001 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_sync_static_0300
     * @tc.name fileIO_randomaccessfile_read_sync_static_003
     * @tc.desc Test readSync() interface. When the offset is 1 and the length is 5. Test to read data synchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_sync_static_003', Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_sync_static_003');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 20;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        let readLength = randomaccessfile.readSync(new ArrayBuffer(length), { offset: 1, length: 5 });
        expect(readLength == 5).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_sync_static_003 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_sync_static_0400
     * @tc.name fileIO_randomaccessfile_read_sync_static_004
     * @tc.desc Test readSync() interface. When offset equals buffer length. Test to read data synchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_sync_static_004', Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_sync_static_004');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 4096;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        let readLength = randomaccessfile.readSync(new ArrayBuffer(length), { offset: length });
        expect(readLength == 0).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_sync_static_004 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_sync_static_0600
     * @tc.name fileIO_randomaccessfile_read_sync_static_006
     * @tc.desc Test readSync() interface. When the offset is negative.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_sync_static_006', Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_sync_static_006');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let randomaccessfile = fs.createRandomAccessFileSync(file);

      try {
        randomaccessfile.readSync(new ArrayBuffer(4096), { offset: -1 });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_sync_static_006 has failed for ' + err);
        randomaccessfile.close();
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_sync_static_0700
     * @tc.name fileIO_randomaccessfile_read_sync_static_007
     * @tc.desc Test readSync() interface. When offset+length>buffer.size, read file_content.length - offset
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_sync_static_007', Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_sync_static_007');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let randomaccessfile = fs.createRandomAccessFileSync(file);

      try {
        let readLength = randomaccessfile.readSync(new ArrayBuffer(4096), { offset: 1, length: 4096 });
        expect(readLength == FILE_CONTENT.length - 1).assertTrue();
        randomaccessfile.close();
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_sync_static_007 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_sync_static_0800
     * @tc.name fileIO_randomaccessfile_read_sync_static_008
     * @tc.desc Test readSync() interface. When the offset is greater than the buffer length.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_sync_static_008', Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_sync_static_008');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let length = 4096;
        let readLength = randomaccessfile.readSync(new ArrayBuffer(length), { offset: length + 1 });
        expect(readLength == 0).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_sync_static_008 has failed for ' + err);
        expect(false).assertTrue();

      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_sync_static_0900
     * @tc.name fileIO_randomaccessfile_read_sync_static_009
     * @tc.desc Test readSync() interface. When the length is greater than the buffer length.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_sync_static_009', Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_sync_static_009');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let length = 4096;
        randomaccessfile.readSync(new ArrayBuffer(length), { length: length + 1 });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_sync_static_009 has failed for ' + err);
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_1000
     * @tc.name fileIO_randomaccessfile_read_sync_static_010
     * @tc.desc Test readSync() interface. The "length" of option must > 0.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_sync_static_010', Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_sync_static_010');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let randomaccessfile: fs.RandomAccessFile;

      try {
        randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 4096;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        randomaccessfile.readSync(new ArrayBuffer(16), { offset: 13, length: -1 });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_sync_static_010 has failed for ' + err);
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_1200
     * @tc.name fileIO_randomaccessfile_read_sync_static_012
     * @tc.desc Test readSync() interface. When the offset is negative.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_sync_static_012', Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_sync_static_012');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        randomaccessfile.readSync(new ArrayBuffer(4096), { offset: -1 });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_sync_static_012 has failed for ' + err);
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_SYNC_1400
     * @tc.name fileIO_randomaccessfile_read_sync_static_014
     * @tc.desc Test readSync() interface. When the offset is 1 and the length is 5. Test to read data synchronously and filePointer after reading.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_sync_static_014', Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_sync_static_014');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 20;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        expect(randomaccessfile.filePointer == bytesWritten);
        randomaccessfile.setFilePointer(0);
        let initOffset = 1;
        let readLength = randomaccessfile.readSync(new ArrayBuffer(length), { offset: initOffset, length: 5 });
        expect(readLength == 5).assertTrue();
        expect(randomaccessfile.filePointer == initOffset + readLength);
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_sync_static_014 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_async_static_0000
     * @tc.name fileIO_randomaccessfile_read_async_static_000
     * @tc.desc Test read() interface. return in callback mode. Test to read data asynchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_000', Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_000');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 4096;
        let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        randomaccessfile.read(new ArrayBuffer(length), (err: BusinessError | null, readLength: number | undefined) => {
          expect(readLength == length).assertTrue();
          randomaccessfile.close();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_000 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_async_static_0100
     * @tc.name fileIO_randomaccessfile_read_async_static_001
     * @tc.desc Test read() interface. return in promise mode. When the offset is 1. Test to read data asynchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_001', Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_001');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, (err: BusinessError | null, randomaccessfile: fs.RandomAccessFile | undefined) => {
          let length = 20;
          let bytesWritten = randomaccessfile?.writeSync(new ArrayBuffer(length));
          expect(bytesWritten == length).assertTrue();
          randomaccessfile?.setFilePointer(0);
          randomaccessfile?.read(new ArrayBuffer(length), { offset: 1 }).then((readLength: number) => {
            hilog.info(domain, tag, '%{public}s', "fileIO_randomaccessfile_read_async_static_001 readLength: " + readLength);
            expect(readLength == length - 1).assertTrue();
          }).catch((err: BusinessError): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "fileIO_randomaccessfile_read_async_static_001 failed with error message: " + err.message + ", error code: " + err.code);
          }).finally(() => {
            randomaccessfile?.close();
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_001 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_async_static_0200
     * @tc.name fileIO_randomaccessfile_read_async_static_002
     * @tc.desc Test read() interface. return in promise mode. When the offset is 1. Test to read data asynchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_002', Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_002');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let randomaccessfile = await fs.createRandomAccessFile(file);
        let length = 20;
        let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        let readLength = await randomaccessfile.read(new ArrayBuffer(length), { offset: 1 });
        expect(readLength == length - 1).assertTrue();
        randomaccessfile.close();
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_002 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_async_static_0300
     * @tc.name fileIO_randomaccessfile_read_async_static_003
     * @tc.desc Test read() interface. return in callback mode. When the offset is 1 and the length is 5. Test to read data asynchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_003', Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_003');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 20;
        let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        randomaccessfile.read(new ArrayBuffer(length), { offset: 1, length: 5 }, (err: BusinessError | null, readLength: number | undefined) => {
          expect(readLength == 5).assertTrue();
          randomaccessfile.close();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_003 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_async_static_0400
     * @tc.name fileIO_randomaccessfile_read_async_static_004
     * @tc.desc Test read() interface. return in promise mode. When offset equals buffer length. Test to read data asynchronously.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_004', Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_004');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 4096;
        let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        let readLength = await randomaccessfile.read(new ArrayBuffer(length), { offset: length });
        expect(readLength == 0).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_004 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_async_static_0500
     * @tc.name fileIO_randomaccessfile_read_async_static_005
     * @tc.desc Test read() interface. return in callback mode. When the offset is negative.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_005', Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_005');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        randomaccessfile.read(new ArrayBuffer(4096), { offset: -1 }, (err: BusinessError | null, readLength: number | undefined) => {
          expect(err?.code == 13900020 && err?.message == "Invalid argument").assertTrue();
          randomaccessfile.close();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_005 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_async_static_0600
     * @tc.name fileIO_randomaccessfile_read_async_static_006
     * @tc.desc Test read() interface. return in promise mode. When the offset is negative.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_006', Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_006');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        await randomaccessfile.read(new ArrayBuffer(4096), { offset: -1 });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_006 has failed for ' + err);
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_async_static_0700
     * @tc.name fileIO_randomaccessfile_read_async_static_007
     * @tc.desc Test read() interface. return in promise mode. When offset+length>buffer.size, read file_content.length - offset
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_007', Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_007');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let readLength = await randomaccessfile.read(new ArrayBuffer(4096), { offset: 1, length: 4096 });
        expect(readLength== FILE_CONTENT.length - 1).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(true).assertTrue();
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_007 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_async_static_0800
     * @tc.name fileIO_randomaccessfile_read_async_static_008
     * @tc.desc Test read() interface. return in callback mode. When the offset is greater than the buffer length.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_008', Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_008');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_ONLY);
      let randomaccessfile = await fs.createRandomAccessFile(file);

      try {
        let length = 4096;
        randomaccessfile.read(new ArrayBuffer(length), { offset: length + 1 }, (err: BusinessError | null, readLength: number | undefined) => {
          expect(readLength == 0).assertTrue();
          randomaccessfile.close();
          fs.closeSync(file.fd);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_008 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_read_async_static_0900
     * @tc.name fileIO_randomaccessfile_read_async_static_009
     * @tc.desc Test read() interface. return in promise mode. When the length is greater than the buffer length.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_009', Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_009');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let length = 4096;
        await randomaccessfile.read(new ArrayBuffer(length), { length: length + 1 });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_009 has failed for ' + err);
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_1000
     * @tc.name fileIO_randomaccessfile_read_async_static_010
     * @tc.desc Test read() interface. return in promise mode. The "length" of option must > 0.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_010', Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_010');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let randomaccessfile: fs.RandomAccessFile;

      try {
        randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 4096;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        await randomaccessfile.read(new ArrayBuffer(16), { offset: 13, length: -1 });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_010 has failed for ' + err);
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_1200
     * @tc.name fileIO_randomaccessfile_read_async_static_012
     * @tc.desc Test read() interface. return in promise mode. When the offset is negative.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_012', Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_012');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        await randomaccessfile.read(new ArrayBuffer(4096), { offset: -1 });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_012 has failed for ' + err);
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_1400
     * @tc.name fileIO_randomaccessfile_read_async_static_014
     * @tc.desc Test read() interface. return in callback mode. Test to read data asynchronously and checkout filePointer.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_014', Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_014');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 4096;
        let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        expect(randomaccessfile.filePointer == bytesWritten).assertTrue();
        randomaccessfile.setFilePointer(0);
        randomaccessfile.read(new ArrayBuffer(length), (err: BusinessError | null, readLength: number | undefined) => {
          expect(readLength == length).assertTrue();
          expect(randomaccessfile.filePointer == readLength).assertTrue();
          randomaccessfile.close();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_014 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_READ_ASYNC_1500
     * @tc.name fileIO_randomaccessfile_read_async_static_015
     * @tc.desc Test read() interface. return in promise mode. When the offset is 1. Test to read data asynchronously and checkout filePointer.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_read_async_static_015', Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_read_async_static_015');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, (err: BusinessError | null, randomaccessfile: fs.RandomAccessFile | undefined) => {
          let length = 20;
          let bytesWritten = randomaccessfile?.writeSync(new ArrayBuffer(length));
          expect(bytesWritten == length).assertTrue();
          randomaccessfile?.setFilePointer(31);
          randomaccessfile?.setFilePointer(0);
          let initOffset = 1;
          randomaccessfile?.read(new ArrayBuffer(length), { offset: initOffset }).then((readLength: number) => {
            hilog.info(domain, tag, '%{public}s', "fileIO_randomaccessfile_read_async_static_015 readLength: " + readLength);
            expect(readLength == length - 1).assertTrue();
            expect(randomaccessfile?.filePointer == readLength + initOffset).assertTrue();
          }).catch((err: BusinessError): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "fileIO_randomaccessfile_read_async_static_015 failed with error message: " + err.message + ", error code: " + err.code);
          }).finally(() => {
            randomaccessfile?.close();
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_read_async_static_015 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

  });
}