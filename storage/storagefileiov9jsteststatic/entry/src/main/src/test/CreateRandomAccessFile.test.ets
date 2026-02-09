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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base'
import Hash from '@ohos.file.hash';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
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
     * @tc.name   fileIO_create_randomaccessfile_sync_static_000
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0000
     * @tc.desc   Test createRandomAccessFileSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_000 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_001
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0100
     * @tc.desc   Test createRandomAccessFileSync() interface. filePointer = 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_001 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_002
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0200
     * @tc.desc   Test createRandomAccessFileSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_002 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_003
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0300
     * @tc.desc   Test createRandomAccessFileSync() interface. filePointer = 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_003 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_004
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0400
     * @tc.desc   Test createRandomAccessFileSync() interface. No such file or directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_004');

      try {
        fs.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_004 end error' + JSON.stringify(err));
        expect(err.code == 13900002 && err.message == "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_005
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0500
     * @tc.desc   Test createRandomAccessFileSync() interface. No such file or directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        fs.createRandomAccessFileSync("", fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_005 end error' + JSON.stringify(err));
        expect(err.code == 13900002 && err.message == "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_006
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0600
     * @tc.desc   Test createRandomAccessFileSync() interface. No such file or directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE, undefined);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.setFilePointer(5);
        expect(randomaccessfile.filePointer == 5).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_006 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_007
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0700
     * @tc.desc   Test createRandomAccessFileSync() interface. No such file or directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, undefined);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.setFilePointer(5);
        expect(randomaccessfile.filePointer == 5).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_007 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_008
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0800
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=OpenMode.CREATE | OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_008 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_009
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0900
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=-1. Invalid Mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_static_009', Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_009');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        fs.createRandomAccessFileSync(fpath, -1);
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_009 end error' + JSON.stringify(err));
        fs.unlinkSync(fpath);
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_010
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1000
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=OpenMode.TRUNC | OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_010 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_011
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1100
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=OpenMode.APPEND | OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_011 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_012
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1200
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=OpenMode.DIR | OpenMode.READ_WRITE. Not a directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_static_012', Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_012');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        fs.createRandomAccessFileSync(fpath, fs.OpenMode.DIR | fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_012 end error' + JSON.stringify(err));
        expect(err.code == 13900018 && err.message == "Not a directory").assertTrue();
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_013
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1300
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=OpenMode.NOFOLLOW | OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_013 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_014
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1400
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=OpenMode.SYNC | OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_014 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_015
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_1500
     * @tc.desc   Test createRandomAccessFileSync() interface. flags=OpenMode.DIR | OpenMode.READ_WRITE. Invalid filepath.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_015');
      fs.mkdirSync(dpath);

      try {
        fs.createRandomAccessFileSync(dpath, fs.OpenMode.DIR | fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_015 end error' + JSON.stringify(err));
        expect(err.code == 13900019 && err.message == "Is a directory").assertTrue();
        fs.rmdirSync(dpath);
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_016
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1600
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_016 start');
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_016');
      let wapth1 = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_01601');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let readfile = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
      let writefile = fs.openSync(wapth1, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY);

      try {
        let stat = fs.statSync(fpath);
        let randomAccessFile1 = fs.createRandomAccessFileSync(readfile);
        let rs = randomAccessFile1.getReadStream();
        let randomAccessFile2 = fs.createRandomAccessFileSync(writefile);
        let ws = randomAccessFile2.getWriteStream();
        rs.on('data', (emitData: buffer.Buffer|string) => {
          let a = emitData;
          if (a == undefined) {
            return;
          }
          if(a instanceof Record){
            return;
          }
          const data:string = a.toString();
          let readlength = data.length;
          expect(readlength == stat.size).assertTrue();
          ws.write(data);
        });
       await Utils.msSleep(2000);
       let Witebytes = ws.bytesWritten;
       expect(stat.size == Witebytes).assertTrue();
       randomAccessFile1.close();
       randomAccessFile2.close();
       rs.close();
       ws.close();
       done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_016 has failed for ' + err);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_017
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1700
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_017 start');
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_017');
      let wapth1 = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_01701');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let stat = fs.statSync(fpath);
        let size = stat.size;
        let randomaccessfile1 = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:0, end:size/4});
        let rs = randomaccessfile1.getReadStream();
        let randomaccessfile2 = fs.createRandomAccessFileSync(wapth1, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:0});
        let ws = randomaccessfile2.getWriteStream();
        rs.on('data', (emitData: buffer.Buffer|string) => {
          let a = emitData;
          if (a == undefined) {
            return;
          }
          if(a instanceof Record){
            return;
          }
          const data:string = a.toString();
          let readlength = data.length;
          expect(readlength == 2).assertTrue();
          ws.write(data);
        });
        await Utils.msSleep(2000);
        let Witebytes = ws.bytesWritten;
        let stat2 = fs.statSync(wapth1);
        expect(stat2.size == Witebytes).assertTrue();
        randomaccessfile1.close();
        randomaccessfile2.close();
        rs.close();
        ws.close();
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_017 has failed for ' + err);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_sync_static_018
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_SYNC_1800
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_sync_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_018 start');
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_018');
      let wapth1 = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_01801');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let size = fs.statSync(fpath).size;

      try {
        let randomaccessfile1 = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:1, end:9});
        let rs = randomaccessfile1.getReadStream();
        let randomaccessfile2 = fs.createRandomAccessFileSync(wapth1, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:1});
        let ws = randomaccessfile2.getWriteStream();
        rs.on('data', (emitData: buffer.Buffer|string) => {
          let a = emitData;
          if (a == undefined) {
            return;
          }
          if(a instanceof Record){
            return;
          }
          const data:string = a.toString();
          let readlength = data.length;
          expect(readlength == 8).assertTrue();
          ws.write(data);
        });
        await Utils.msSleep(2000);
        let Witebytes = ws.bytesWritten;
        let stat2 = fs.statSync(wapth1);
        expect(stat2.size == Witebytes +1).assertTrue();
        randomaccessfile1.close();
        randomaccessfile2.close();
        rs.close();
        ws.close();
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_018 has failed for ' + err);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_000
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0000
     * @tc.desc   Test createRandomAccessFile() interface. return in promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_000 end error' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_001
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0100
     * @tc.desc   Test createRandomAccessFile() interface. filePointer = 10. return in callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {

      try {
        let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_001');
        fs.createRandomAccessFile(fpath, 0o102, (err: BusinessError|null, randomaccessfile: fs.RandomAccessFile|undefined) => {
          expect(typeof randomaccessfile?.fd == 'int').assertTrue();
          randomaccessfile?.setFilePointer(10);
          let filePointer = randomaccessfile?.filePointer;
          expect(filePointer == 10).assertTrue();
          randomaccessfile?.close();
          fs.unlinkSync(fpath);
          done();
        });
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_001 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_002
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0200
     * @tc.desc   Test createRandomAccessFile() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_002');

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        fs.createRandomAccessFile(file, (err: BusinessError|null, randomaccessfile: fs.RandomAccessFile|undefined) => {
          expect(typeof randomaccessfile?.fd == 'int').assertTrue();
          randomaccessfile?.close();
          fs.closeSync(file.fd);
          fs.unlinkSync(fpath);
          done();
        });
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_002 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_003
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0300
     * @tc.desc   Test createRandomAccessFile() interface. filePointer = 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_003 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_004
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0400
     * @tc.desc   Test createRandomAccessFile() interface. No such file or directory. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_004');

      try {
        await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_004 end error' + JSON.stringify(err));
        expect(err.code == 13900002 && err.message == "No such file or directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_005
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0500
     * @tc.desc   Test createRandomAccessFile() interface. No such file or directory. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      try {
        await fs.createRandomAccessFile("", fs.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_005 end error' + JSON.stringify(err));
        expect(err.code == 13900002 && err.message == "No such file or directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_006
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0600
     * @tc.desc   Test createRandomAccessFile() interface. return in promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_006');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, undefined);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_006 end error' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_007
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0700
     * @tc.desc   Test createRandomAccessFile() interface. Missing Parameter. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_007 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_008
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0800
     * @tc.desc   Test createRandomAccessFile() interface. flags=OpenMode.CREATE | OpenMode.READ_WRITE);
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_008');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, (err: BusinessError|null, randomaccessfile: fs.RandomAccessFile|undefined) =>{
          expect(typeof randomaccessfile?.fd == 'int').assertTrue();
          randomaccessfile?.close();
          fs.unlinkSync(fpath);
          done();
        });
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_008 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_009
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_0900
     * @tc.desc   Test createRandomAccessFile() interface. flags=-1. Invalid Mode. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_static_009', Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_009');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        await fs.createRandomAccessFile(fpath, -1);
        expect(false).assertTrue();
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_009 end error' + JSON.stringify(err));
        expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
        fs.unlinkSync(fpath);
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_010
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1000
     * @tc.desc   Test createRandomAccessFile() interface. flags=OpenMode.TRUNC | OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_010 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_011
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1100
     * @tc.desc   Test createRandomAccessFile() interface. flags=OpenMode.APPEND | OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_011 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_012
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1200
     * @tc.desc   Test createRandomAccessFile() interface. flags=OpenMode.DIR | OpenMode.READ_WRITE. Not a directory. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_static_012', Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_012');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        await fs.createRandomAccessFile(fpath, fs.OpenMode.DIR | fs.OpenMode.READ_WRITE);
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_012 end error' + JSON.stringify(err));
        expect(err.code == 13900018 && err.message == "Not a directory").assertTrue();
        fs.unlinkSync(fpath);
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_013
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1300
     * @tc.desc   Test createRandomAccessFile() interface. flags=OpenMode.NOFOLLOW | OpenMode.READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_013 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_014
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1400
     * @tc.desc   Test createRandomAccessFile() interface. flags=OpenMode.SYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_014 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_015
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1500
     * @tc.desc   Test createRandomAccessFile() interface. flags=OpenMode.DIR | OpenMode.READ_WRITE. Invalid filepath. return in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_create_randomaccessfile_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_015') + 'd';
      fs.mkdirSync(dpath);

      try {
        await fs.createRandomAccessFile(dpath, fs.OpenMode.DIR | fs.OpenMode.READ_WRITE);
      } catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_015 end error' + JSON.stringify(err));
        fs.rmdirSync(dpath);
        expect(err.code == 13900019 && err.message == "Is a directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_016
     * @tc.number SUB_STORAGE_FILEIO_CREATE_RANDOMACCESSFILE_ASYNC_1600
     * @tc.desc   Test createRandomAccessFileSync() interface. RandomAccessFileOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_016');
      let wpath1 = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_01601');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let size = fs.statSync(fpath).size;

      try {
        let randomaccessfile1 = await fs.createRandomAccessFile(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:1, end:size});
        let rs = randomaccessfile1.getReadStream();
        let randomaccessfile2 = await fs.createRandomAccessFile(wpath1, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, {start:0});
        let ws = randomaccessfile2.getWriteStream();
        rs.on('data', (emitData: buffer.Buffer|string) => {
          let a = emitData;
          if (a == undefined) {
            return;
          }
          if(a instanceof Record){
            return;
          }
          const data:string = a.toString();
          let readlength = data.length;
          expect(readlength == 10).assertTrue();
          ws.write(data);
        });
        await Utils.msSleep(3000);
        let Witebytes = ws.bytesWritten;
        let stat2 = fs.statSync(wpath1);
        expect(stat2.size == Witebytes).assertTrue();
        randomaccessfile1.close();
        randomaccessfile2.close();
        rs.close();
        ws.close();
        done();
      } catch (err) {
        console.info('fileIO_create_randomaccessfile_async_static_016 has failed for ' + err);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_017
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1700
     * @tc.desc   Test createRandomAccessFile() interface. return in promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_async_static_017');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        let randomaccessfile = await fs.createRandomAccessFile(fpath, fs.OpenMode.READ_WRITE, undefined);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
        done();
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_017 end error' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_018
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1800
     * @tc.desc   Test createRandomAccessFile() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      try {
        fs.createRandomAccessFile("", (err: BusinessError|null, randomaccessfile: fs.RandomAccessFile|undefined) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_018 err: ' + err?.code);
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
          }
          done();
        });
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_018 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_create_randomaccessfile_async_static_019
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_async_static_1900
     * @tc.desc   Test createRandomAccessFile() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_create_randomaccessfile_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      try {
        fs.createRandomAccessFile("", fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE, (err: BusinessError|null, randomaccessfile: fs.RandomAccessFile|undefined) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_019 err: ' + err?.code);
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
          }
          done();
        });
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_async_static_019 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });
  });
}