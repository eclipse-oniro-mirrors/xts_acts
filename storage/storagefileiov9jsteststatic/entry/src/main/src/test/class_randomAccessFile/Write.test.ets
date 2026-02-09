/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base'
import { WriteOptions } from '@ohos.file.fs';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIORandomAccessFileWrite() {
  describe('fileIO_randomAccessFile_write', (): void => {

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_static_000
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_sync_static_0000
     * @tc.desc   Test writeSync() interface. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 4096;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_sync_static_000 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_static_001
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_sync_static_0100
     * @tc.desc   Test writeSync() interface. When the offset is 1. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_sync_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 20;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), { offset: 1 });
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_sync_static_001 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_static_002
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_sync_static_0200
     * @tc.desc   Test writeSync() interface. When the offset is 1. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_sync_static_002');

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let randomaccessfile = fs.createRandomAccessFileSync(file);
        let length = 20;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), { offset: 1 });
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.close();
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_sync_static_002 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_static_003
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_sync_static_0300
     * @tc.desc   Test writeSync() interface. When the offset is 1 and length is 10. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_sync_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 20;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), { offset: 1, length: 10 });
        expect(bytesWritten == 10).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_sync_static_003 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_static_004
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_sync_static_0400
     * @tc.desc   Test writeSync() interface. When the offset is 5. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_sync_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 20;
        let options: 	WriteOptions = {
          offset: 5
        }
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), options);
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        let readLength = randomaccessfile.readSync(new ArrayBuffer(4096));
        let offsetValue = options.offset?? 0;
        let len = length + offsetValue;
        expect(readLength == len).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_sync_static_004 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_static_005
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_sync_static_0500
     * @tc.desc   Test writeSync() interface. When offset equals buffer length. Test write data synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_sync_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 4096;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), { offset: length });
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_sync_static_005 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_static_006
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_sync_static_0600
     * @tc.desc   Test writeSync() interface. When offset+length>buffer.size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_sync_static_006');
      let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let length = 4095;

      try {
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(4096), { offset: 5, length: 4095 });
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_sync_static_006 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_static_007
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_sync_static_0700
     * @tc.desc   Test writeSync() interface. When the offset is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_sync_static_007');
      let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let length = 4096;
        let bytesWritten = randomaccessfile.writeSync(new ArrayBuffer(length), { offset: length + 1 });
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_sync_static_007 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_static_008
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_sync_static_0800
     * @tc.desc   Test writeSync() interface. When the offset is negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_write_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_sync_static_008');
      let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY);
      let randomaccessfile = fs.createRandomAccessFileSync(file);

      try {
        randomaccessfile.writeSync(new ArrayBuffer(4096), { offset: -1 });
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_sync_static_008 has failed for ' + JSON.stringify(err));
        randomaccessfile.close();
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_static_009
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_sync_static_0900
     * @tc.desc   Test writeSync() interface. The "length" of option must > 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_write_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_sync_static_009');
      let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let length = 100;
        randomaccessfile.writeSync(new ArrayBuffer(length), { offset: 1, length: -1 });
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_sync_static_009 has failed for ' + JSON.stringify(err));
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_sync_static_010
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_sync_static_1000
     * @tc.desc   Test writeSync() interface. When the length is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_write_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_sync_static_010');
      let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let length = 4096;
        randomaccessfile.writeSync(new ArrayBuffer(length), { length: length + 1 });
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_sync_static_010 has failed for ' + JSON.stringify(err));
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_000
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_0000
     * @tc.desc   Test write() interface. return in promise mode. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_000');

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        fs.createRandomAccessFile(file, (err: BusinessError|null, randomaccessfile: fs.RandomAccessFile|undefined) => {
          let length = 4096;
          randomaccessfile?.write(new ArrayBuffer(length)).then((bytesWritten: long) => {
            expect(bytesWritten == length).assertTrue();
          }).catch((err: Error): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'create randomAccessFile failed with error message: ' +  err.message + ", error code: " + err.code);
          }).finally(() => {
            randomaccessfile?.close();
            fs.unlinkSync(fpath);
          });
          done();
        });
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_000 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_001
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_0100
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_001');

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY);
        let randomaccessfile = await fs.createRandomAccessFile(file);
        let length = 20;
        randomaccessfile.write(new ArrayBuffer(length), { offset: 1 }, (err: BusinessError | null, bytesWritten: long | undefined) => {
          expect(bytesWritten == length).assertTrue();
          randomaccessfile.close();
          fs.closeSync(file.fd);
          fs.unlinkSync(fpath);
          done();
        });
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_001 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_002
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_0200
     * @tc.desc   Test write() interface. return in promise mode. When the offset is 1. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_002');

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 20;
        let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length), { offset: 1 });
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_002 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_003
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_0300
     * @tc.desc   Test write() interface. return in promise mode. When the offset is 1 and length is 10. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_003');

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 20;
        let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length), { offset: 1, length: 10 });
        expect(bytesWritten == 10).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_003 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_004
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_0400
     * @tc.desc   Test write() interface. return in promise mode. When the offset is 5. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 20;
        let options: WriteOptions = {
          offset: 5
        }
        let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length), options);
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.setFilePointer(0);
        let readLength = await randomaccessfile.read(new ArrayBuffer(4096));
        let offsetValue = options.offset?? 0;
        let len = length + offsetValue;
        expect(readLength == len).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_004 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_005
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_0500
     * @tc.desc   Test write() interface. return in promise mode. When offset equals buffer length. Test write data asynchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let length = 4096;
        let bytesWritten = await randomaccessfile.write(new ArrayBuffer(length), { offset: length });
        expect(bytesWritten == length).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_005 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_006
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_0600
     * @tc.desc   Test write() interface. return in promise mode. When offset+length>buffer.size. Write correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_006');
      let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let length = 4096;
        await randomaccessfile.write(new ArrayBuffer(length), { offset: 5, length: 4095 });
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_006 has failed for ' + JSON.stringify(err));
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == 'Invalide argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_007
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_0700
     * @tc.desc   Test write() interface. return in callback mode. When the offset is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_007');
      let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let length = 4096;
        randomaccessfile.write(new ArrayBuffer(length), { offset: length + 1 }, (err: BusinessError | null, bytesWritten: long | undefined) => {
          expect(bytesWritten == length).assertTrue();
          randomaccessfile.close();
          fs.unlinkSync(fpath);
          done();
        });
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_007 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_008
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_0800
     * @tc.desc   Test write() interface. return in promise mode. When the offset is negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_write_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_008');
      let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY);
      let randomaccessfile = await fs.createRandomAccessFile(file);

      try {
        await randomaccessfile.write(new ArrayBuffer(4096), { offset: -1 });
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_008 has failed for ' + JSON.stringify(err));
        randomaccessfile.close();
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_009
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_0900
     * @tc.desc   Test write() interface. return in promise mode. The "length" of option must > 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_write_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_009');
      let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let length = 100;
        await randomaccessfile.write(new ArrayBuffer(length), { offset: 1, length: -1 });
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_009 has failed for ' + JSON.stringify(err));
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_010
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_1000
     * @tc.desc   Test write() interface. return in promise mode. When the length is greater than the buffer length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_randomaccessfile_write_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_010');
      let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let length = 4096;
        await randomaccessfile.write(new ArrayBuffer(length), { length: length + 1 });
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_010 has failed for ' + JSON.stringify(err));
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_randomaccessfile_write_async_static_011
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_write_async_static_1100
     * @tc.desc   Test write() interface. return in callback mode. When the offset is 1. Test write data asynchronously and checkout filePointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_write_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_write_async_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY);
        let randomaccessfile = await fs.createRandomAccessFile(file);
        let length = 20;
        let initOffset = 1;
        randomaccessfile.write(new ArrayBuffer(length), { offset: initOffset }, (err: BusinessError | null, bytesWritten: long | undefined) => {
          expect(bytesWritten == length).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_011 randomaccessfile.filePointer' + randomaccessfile.filePointer);
          if(bytesWritten){
            expect(randomaccessfile.filePointer == (bytesWritten! + initOffset)).assertTrue();
          }
          randomaccessfile.close();
          fs.closeSync(file.fd);
          fs.unlinkSync(fpath);
          done();
        });
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_write_async_static_011 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });
  });
}
