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
const RAND_READ_BASELINE = 3.5;
const RAND_WRITE_BASELINE = 0.5;
const SEQUENCE_READ_BASELINE = 15;
const SEQUENCE_WRITE_BASELINE = 5;
export async function IOfunc(file: fs.File, bf: number, total: number, rand: boolean, read: boolean, promise: boolean) : Promise<number> {
  return new Promise<number>((resolve, reject) => {
    let startTime: number = 0;
    try {
      let array = new ArrayBuffer(bf);
      let count = total / bf;
      startTime = new Date().getTime();
      for (let i = 0; i < count; i++) {
        let offset: number = i * bf;
        if (rand) {
          offset = Math.floor(Math.random() * (total - bf));
        }
        if (promise) {
          if (read) {
            fs.read(file.fd, array, { length: bf, offset: offset }).then((readLen) => {
            }).catch((e: BusinessError) : Promise<void> => {
              hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_promise has failed for ' + e.message + ', code: ' + e.code);
              resolve(-1);
            });
          } else {
            fs.write(file.fd, array, { length: bf, offset: offset, encoding: 'utf-8' }).then((writeLen) => {
            }).catch((e: BusinessError) : Promise<void> => {
              hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_promise has failed for ' + e.message + ', code: ' + e.code);
              resolve(-1);
            });
          }
        } else {
          if (read) {
            fs.read(file.fd, array, { length: bf, offset: offset }, (err: BusinessError | null, readLen: number | undefined) => {
              if (err?.code != 0) {
                hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_callback has failed for ' + err?.message + ', code: ' + err?.code);
                resolve(-1);
              }
            });
          } else {
            fs.write(file.fd, array, { length: bf, offset: offset, encoding: 'utf-8' }, (err: BusinessError | null, writeLen: number | undefined) => {
              if (err?.code != 0) {
                hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_callback has failed for ' + err?.message + ', code: ' + err?.code);
                resolve(-1);
              }
            });
          }
        }
      }
      fs.fsyncSync(file.fd);
    } catch (e: BusinessError) {
      hilog.info(domain, tag, '%{public}s', 'FileIO_fs_filerw_test has failed for ' + e.message + ', code: ' + e.code);
    } finally {
      let endTime = new Date().getTime();
      hilog.info(domain, tag, '%{public}s', 'FileIO_fs_filerw_test finally '+ JSON.stringify(endTime));
      let interval = endTime - startTime;
      let average = total * 1000 / interval;
      let averagerate = average / 0x100000;
      resolve(averagerate);
    }
  })
}

export default function FileIOFilerw_test() {
  describe('FileIO_fs_filerw_test', (): void => {
    hilog.info(domain, tag, '%{public}s', 'FileIO_fs_filerw_test start');

    /**
     * @tc.number SUB_DF_FILEIO_FILERW_READ_RANDOM_PROMISE_0000
     * @tc.name fileIO_test_read_random_promise_static_000
     * @tc.desc Test the read() interface. promise.
     * Open the file, file read() in the random way.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_read_random_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_random_promise_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_random_promise_static_000');
      expect(await Utils.prepare200MFile(fpath)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1400, 0x1400000, true, true, true);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_random_promise_static_000 RAND_READ Rate is ' + averagerate + " M/s");
        expect(averagerate > RAND_READ_BASELINE).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_random_promise_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FILERW_WRITE_RANDOM_PROMISE_0000
     * @tc.name fileIO_test_write_random_promise_static_000
     * @tc.desc Test the write() interface. promise.
     * Open the file, file write() in the random way.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_write_random_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_random_promise_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_random_promise_static_000');
      expect(await Utils.prepare200MFile(fpath)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1400, 0x1400000, true, false, true);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_random_promise_static_000 RAND_WRITE Rate is ' + averagerate + " M/s");
        expect(averagerate > RAND_WRITE_BASELINE).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_random_promise_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FILERW_READ_SEQUENCE_PROMISE_0000
     * @tc.name fileIO_test_read_sequence_promise_static_000
     * @tc.desc Test the read() interface. promise.
     * Open the file, file read() in the sequence way.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_read_sequence_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sequence_promise_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_sequence_promise_static_000');
      expect(await Utils.prepare200MFile(fpath)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1400, 0x1400000, false, true, true);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sequence_promise_static_000 SEQUENCE_READ Rate is ' + averagerate + " M/s");
        expect(averagerate > SEQUENCE_READ_BASELINE).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sequence_promise_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FILERW_WRITE_SEQUENCE_PROMISE_0000
     * @tc.name fileIO_test_write_sequence_promise_static_000
     * @tc.desc Test the write() interface. promise.
     * Open the file, file write() in the sequence way.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_write_sequence_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sequence_promise_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sequence_promise_static_000');
      expect(await Utils.prepare200MFile(fpath)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1400, 0x1400000, false, false, true);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sequence_promise_static_000 SEQUENCE_WRITE Rate is ' + averagerate + " M/s");
        expect(averagerate > SEQUENCE_WRITE_BASELINE).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sequence_promise_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FILERW_READ_RANDOM_CALLBACK_0000
     * @tc.name fileIO_test_read_random_callback_static_000
     * @tc.desc Test the read() interface. callback.
     * Open the file, file read() in the random way.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_read_random_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_random_callback_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_random_callback_static_000');
      expect(await Utils.prepare200MFile(fpath)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1400, 0x1400000, true, true, false);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_random_callback_static_000 RAND_READ Rate is ' + averagerate + " M/s");
        expect(averagerate > RAND_READ_BASELINE).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_random_callback_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FILERW_WRITE_RANDOM_CALLBACK_0000
     * @tc.name fileIO_test_write_random_callback_static_000
     * @tc.desc Test the write() interface. callback.
     * Open the file, file write() in the random way.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_write_random_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_random_callback_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_random_callback_static_000');
      expect(await Utils.prepare200MFile(fpath)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1400, 0x1400000, true, false, false);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_random_callback_static_000 RAND_WRITE Rate is ' + averagerate + " M/s");
        expect(averagerate > RAND_WRITE_BASELINE).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_random_callback_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FILERW_READ_SEQUENCE_CALLBACK_0000
     * @tc.name fileIO_test_read_sequence_callback_static_000
     * @tc.desc Test the read() interface. callback.
     * Open the file, file read() in the sequence way.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_read_sequence_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sequence_callback_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_sequence_callback_static_000');
      expect(await Utils.prepare200MFile(fpath)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1400, 0x1400000, false, true, false);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sequence_callback_static_000 SEQUENCE_READ Rate is ' + averagerate + " M/s");
        expect(averagerate > SEQUENCE_READ_BASELINE).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sequence_callback_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_FILEIO_FILERW_WRITE_SEQUENCE_CALLBACK_0000
     * @tc.name fileIO_test_write_sequence_callback_static_000
     * @tc.desc Test the write() interface. callback.
     * Open the file, file write() in the sequence way.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_write_sequence_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sequence_callback_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sequence_callback_static_000');
      expect(await Utils.prepare200MFile(fpath)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1400, 0x1400000, false, false, false);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sequence_callback_static_000 SEQUENCE_WRITE Rate is ' + averagerate + " M/s");
        expect(averagerate > SEQUENCE_WRITE_BASELINE).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sequence_callback_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    hilog.info(domain, tag, '%{public}s', 'FileIO_fs_filerw_test end');
  });
}