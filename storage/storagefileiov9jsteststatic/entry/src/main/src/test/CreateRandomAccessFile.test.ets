import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base'
import Hash from '@ohos.file.hash';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';
export const wpath = 'data/storage/el2/base/write.txt';

export function initReadfile(fpath: string) {
  let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
  let arr_names = ['a'];
  for (let times = 0; times < 1; times++){
    let charCode = 'a'.charCodeAt(0);
    for(let i = 0; i < 26; i++){
      arr_names.fill(String.fromCharCode(charCode));
      hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_000 earr_names:' + arr_names);
      fs.writeSync(file.fd, arr_names.join(''));
      charCode++;
    }
  }
  let writefile = fs.openSync(wpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
  fs.closeSync(writefile);
}

export default function fileIOCreateRandomAccessFile() {
  describe('fileIO_create_randomAccessFile', (): void => {

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0000
     * @tc.name fileIO_create_randomaccessfile_sync_static_000
     * @tc.desc Test createRandomAccessFileSync() interface.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_000');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();
      let fpath1 = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_000123');
      initReadfile(fpath1);

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_000 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0100
     * @tc.name fileIO_create_randomaccessfile_sync_static_001
     * @tc.desc Test createRandomAccessFileSync() interface. filePointer = 5.
     * Create RandomAccessFile object to access file from filePointer location.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.setFilePointer(5);
        expect(randomaccessfile.filePointer == 5).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_001 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0200
     * @tc.name fileIO_create_randomaccessfile_sync_static_002
     * @tc.desc Test createRandomAccessFileSync() interface.
     * Create RandomAccessFile object based on file descriptor to access file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_002');

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let randomaccessfile = fs.createRandomAccessFileSync(file);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_002 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0300
     * @tc.name fileIO_create_randomaccessfile_sync_static_003
     * @tc.desc Test createRandomAccessFileSync() interface. filePointer = 1.
     * Create RandomAccessFile object based on file descriptor to access file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_003');

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let randomaccessfile = fs.createRandomAccessFileSync(file);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.setFilePointer(1);
        expect(randomaccessfile.filePointer == 1).assertTrue();
        randomaccessfile.close();
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_003 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0400
     * @tc.name fileIO_create_randomaccessfile_sync_static_004
     * @tc.desc Test createRandomAccessFileSync() interface. No such file or directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_004', Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_004');

      try {
        fs.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_004 end error' + JSON.stringify(err));
        expect(err.code == 13900002 && err.message == "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0800
     * @tc.name fileIO_create_randomaccessfile_sync_static_008
     * @tc.desc Test createRandomAccessFileSync() interface. flags=OpenMode.CREATE | OpenMode.READ_WRITE.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_008');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_008 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0900
     * @tc.name fileIO_create_randomaccessfile_sync_static_009
     * @tc.desc Test createRandomAccessFileSync() interface. flags=-1. Invalid Mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_009', Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_009');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        fs.createRandomAccessFileSync(fpath, -1);
        expect(false).assertTrue();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_009 end error' + JSON.stringify(err));
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1000
     * @tc.name fileIO_create_randomaccessfile_sync_static_010
     * @tc.desc Test createRandomAccessFileSync() interface. flags=OpenMode.TRUNC | OpenMode.READ_WRITE.
     * If the file exists and the file is opened for write-only or read-write, trim its length to zero.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        let num = randomaccessfile.readSync(new ArrayBuffer(4096));
        expect(num == 0).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_010 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1100
     * @tc.name fileIO_create_randomaccessfile_sync_static_011
     * @tc.desc Test createRandomAccessFileSync() interface. flags=OpenMode.APPEND | OpenMode.READ_WRITE.
     * Open as append, subsequent writes will append to the end of the file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        let length = 100;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        let readLength = randomaccessfile.readSync(new ArrayBuffer(4096), { offset: 0 });
        expect(readLength == length + FILE_CONTENT.length).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_011 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1200
     * @tc.name fileIO_create_randomaccessfile_sync_static_012
     * @tc.desc Test createRandomAccessFileSync() interface. flags=OpenMode.DIR | OpenMode.READ_WRITE. Not a directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_012', Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_012');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        fs.createRandomAccessFileSync(fpath, fs.OpenMode.DIR | fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_012 end error' + JSON.stringify(err));
        expect(err.code == 13900018 && err.message == "Not a directory").assertTrue();
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1300
     * @tc.name fileIO_create_randomaccessfile_sync_static_013
     * @tc.desc Test createRandomAccessFileSync() interface. flags=OpenMode.NOFOLLOW | OpenMode.READ_WRITE.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_013');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.NOFOLLOW | fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_013 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1400
     * @tc.name fileIO_create_randomaccessfile_sync_static_014
     * @tc.desc Test createRandomAccessFileSync() interface. flags=OpenMode.SYNC | OpenMode.READ_WRITE.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_014');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.SYNC | fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_014 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1500
     * @tc.name fileIO_create_randomaccessfile_sync_static_015
     * @tc.desc Test createRandomAccessFileSync() interface. flags=OpenMode.DIR | OpenMode.READ_WRITE. Invalid filepath.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_015');
      fs.mkdirSync(dpath);

      try {
        fs.createRandomAccessFileSync(dpath, fs.OpenMode.DIR | fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_015 end error' + JSON.stringify(err));
        expect(err.code == 13900019 && err.message == "Is a directory").assertTrue();
        fs.rmdirSync(dpath);
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0000
     * @tc.name fileIO_create_randomaccessfile_async_static_000
     * @tc.desc Test createRandomAccessFile() interface. return in promise mode.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_000');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_000 end error' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0100
     * @tc.name fileIO_create_randomaccessfile_async_static_001
     * @tc.desc Test createRandomAccessFile() interface. filePointer = 10. return in callback mode.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {

      try {
        let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_001');
        fs.createRandomAccessFile(fpath, 0o102, (err: BusinessError|null, randomaccessfile: fs.RandomAccessFile|undefined) => {
          expect(typeof randomaccessfile?.fd == 'number').assertTrue();
          randomaccessfile?.setFilePointer(10);
          let filePointer = randomaccessfile?.filePointer;
          expect(filePointer == 10).assertTrue();
          randomaccessfile?.close();
          fs.unlinkSync(fpath);
          done();
        });
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_001 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0200
     * @tc.name fileIO_create_randomaccessfile_async_static_002
     * @tc.desc Test createRandomAccessFile() interface.
     * Create RandomAccessFile object based on file descriptor to access file. return in callback mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_002');

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        fs.createRandomAccessFile(file, (err: BusinessError|null, randomaccessfile: fs.RandomAccessFile|undefined) => {
          expect(typeof randomaccessfile?.fd == 'number').assertTrue();
          randomaccessfile?.close();
          fs.closeSync(file.fd);
          fs.unlinkSync(fpath);
          done();
        });
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_002 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0300
     * @tc.name fileIO_create_randomaccessfile_async_static_003
     * @tc.desc Test createRandomAccessFile() interface. filePointer = 1.
     * Create RandomAccessFile object based on file descriptor to access file. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_003');

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let randomaccessfile = await fs.createRandomAccessFile(file);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.setFilePointer(1);
        expect(randomaccessfile.filePointer == 1).assertTrue();
        randomaccessfile.close();
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
        done();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_003 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0400
     * @tc.name fileIO_create_randomaccessfile_async_static_004
     * @tc.desc Test createRandomAccessFile() interface. No such file or directory. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_004', Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_004');

      try {
        await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch(err: BusinessError) {
        console.info('fileIO_create_randomaccessfile_async_static_004 has failed for ' + err);
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_004 end error' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0700
     * @tc.name fileIO_create_randomaccessfile_async_static_007
     * @tc.desc Test createRandomAccessFile() interface. Missing Parameter. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_007');
      let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let randomaccessfile = await fs.createRandomAccessFile(file);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
        done();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_007 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0800
     * @tc.name fileIO_create_randomaccessfile_async_static_008
     * @tc.desc Test createRandomAccessFile() interface. flags=OpenMode.CREATE | OpenMode.READ_WRITE);
     * Create RandomAccessFile object to access file based on file path. return in callback mode.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_008');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, (err: BusinessError|null, randomaccessfile: fs.RandomAccessFile|undefined) =>{
          expect(typeof randomaccessfile?.fd == 'number').assertTrue();
          randomaccessfile?.close();
          fs.unlinkSync(fpath);
          done();
        });
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_008 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0900
     * @tc.name fileIO_create_randomaccessfile_async_static_009
     * @tc.desc Test createRandomAccessFile() interface. flags=-1. Invalid Mode. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_009', Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_009');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        await fs.createRandomAccessFile(fpath, -1);
        expect(false).assertTrue();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_009 end error' + JSON.stringify(err));
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        fs.unlinkSync(fpath);
        done();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1000
     * @tc.name fileIO_create_randomaccessfile_async_static_010
     * @tc.desc Test createRandomAccessFile() interface. flags=OpenMode.TRUNC | OpenMode.READ_WRITE.
     * If the file exists and the file is opened for write-only or read-write, trim its length to zero. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        let num = randomaccessfile.readSync(new ArrayBuffer(4096));
        expect(num == 0).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_010 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1100
     * @tc.name fileIO_create_randomaccessfile_async_static_011
     * @tc.desc Test createRandomAccessFile() interface. flags=OpenMode.APPEND | OpenMode.READ_WRITE.
     * Open as append, subsequent writes will append to the end of the file. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        let length = 100;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        let num = randomaccessfile.readSync(new ArrayBuffer(4096), { offset: 0 });
        expect(num == length + FILE_CONTENT.length).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_011 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1200
     * @tc.name fileIO_create_randomaccessfile_async_static_012
     * @tc.desc Test createRandomAccessFile() interface. flags=OpenMode.DIR | OpenMode.READ_WRITE. Not a directory. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_012', Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_012');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        await fs.createRandomAccessFile(fpath, fs.OpenMode.DIR | fs.OpenMode.READ_WRITE);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_012 end error' + JSON.stringify(err));
        expect(err.code == 13900018 && err.message == "Not a directory").assertTrue();
        fs.unlinkSync(fpath);
        done();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1300
     * @tc.name fileIO_create_randomaccessfile_async_static_013
     * @tc.desc Test createRandomAccessFile() interface. flags=OpenMode.NOFOLLOW | OpenMode.READ_WRITE.
     * Create RandomAccessFile object to access file based on file path. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_013');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.NOFOLLOW | fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_013 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1400
     * @tc.name fileIO_create_randomaccessfile_async_static_014
     * @tc.desc Test createRandomAccessFile() interface. flags=OpenMode.SYNC.
     * Create RandomAccessFile object to access file based on file path. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_014');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.SYNC | fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_014 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1500
     * @tc.name fileIO_create_randomaccessfile_async_static_015
     * @tc.desc Test createRandomAccessFile() interface. flags=OpenMode.DIR | OpenMode.READ_WRITE. Invalid filepath. return in promise mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_async_static_015', Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_015') + 'd';
      fs.mkdirSync(dpath);

      try {
        await fs.createRandomAccessFile(dpath, fs.OpenMode.DIR | fs.OpenMode.READ_WRITE);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_015 end error' + JSON.stringify(err));
        fs.rmdirSync(dpath);
        expect(err.code == 13900019 && err.message == "Is a directory").assertTrue();
        done();
      }
    });
  });
}