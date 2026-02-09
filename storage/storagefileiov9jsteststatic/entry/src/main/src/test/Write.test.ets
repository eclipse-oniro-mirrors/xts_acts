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
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function fileIOWrite() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_write", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_write start');

    /**
     * @tc.name   fileIO_test_write_sync_static_000
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0000
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten1 = fs.writeSync(file.fd, FILE_CONTENT);
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = fs.writeSync(file.fd, new ArrayBuffer(FILE_CONTENT.length));
        expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
        expect(readLen == FILE_CONTENT.length * 2).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_001
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0100
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = fs.writeSync(file.fd, FILE_CONTENT, {
          encoding: 'utf-8',
        });
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_002
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0200
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = fs.writeSync(file.fd, FILE_CONTENT, {
          offset: 1,
        });
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_003
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0300
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = fs.writeSync(file.fd, FILE_CONTENT, {
          length: 1,
        });
        expect(bytesWritten == 1).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_004
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0400
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_004 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = fs.writeSync(file.fd, FILE_CONTENT, {
          offset: 1,
          length: 1,
        });
        expect(bytesWritten == 1).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_005
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0500
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_005 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = fs.writeSync(file.fd, FILE_CONTENT, {
          offset: 1,
          length: 5,
          encoding: 'utf-8',
        });
        expect(bytesWritten == 5).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_006
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0600
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      const invalidLength = 9999;
      let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = fs.writeSync(file.fd, FILE_CONTENT, { length: invalidLength });
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_006 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_007
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0700
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_007 start');
      try {
        fs.writeSync(-1, FILE_CONTENT);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_007 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_008
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0800
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_008 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = fs.writeSync(file.fd, new ArrayBuffer(4096));
        expect(bytesWritten == 4096).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_009
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0900
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_009 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_009');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      const invalidLength = 4097;
      let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.writeSync(file.fd, new ArrayBuffer(4096), { length: invalidLength });
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_009 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_010
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_1000
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_010 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      const invalidOffset = -1;
      let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.writeSync(file.fd, FILE_CONTENT, { offset: invalidOffset });
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_010 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_011
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_1100
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_011 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten1 = fs.writeSync(file.fd, FILE_CONTENT, undefined);
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = fs.writeSync(file.fd, new ArrayBuffer(FILE_CONTENT.length), undefined);
        expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
        expect(readLen == FILE_CONTENT.length * 2).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_sync_static_012
     * @tc.number SUB_DF_FILEIO_WRITE_SYNC_1200
     * @tc.desc   Test writeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_sync_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_012 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_sync_static_012');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten1 = fs.writeSync(file.fd, FILE_CONTENT, {
          offset: undefined,
          length: undefined,
          encoding: undefined,
        });
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = fs.writeSync(file.fd, new ArrayBuffer(FILE_CONTENT.length), {
          offset: undefined,
          length: undefined,
          encoding: undefined,
        });
        expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
        expect(readLen == FILE_CONTENT.length * 2).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_sync_static_012 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_000
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0000
     * @tc.desc   Test write() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten1 = await fs.write(file.fd, FILE_CONTENT);
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await fs.write(file.fd, new ArrayBuffer(FILE_CONTENT.length));
        expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
        expect(readLen == FILE_CONTENT.length * 2).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_001
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0100
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_001 file.fd ' + file.fd);
        fs.write(file.fd, FILE_CONTENT, {}, (err: BusinessError | null, bytesWritten1: long | undefined) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_001 has error1 for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
          fs.write(file.fd, FILE_CONTENT, {}, (err: BusinessError | null, bytesWritten2: long | undefined) => {
            if (err?.code != 0) {
              hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_001 has error2 for' + JSON.stringify(err));
              expect(false).assertTrue();
            }
            expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
            let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
            expect(readLen == FILE_CONTENT.length * 2).assertTrue();
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_002
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0200
     * @tc.desc   Test write() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        await fs.write(file.fd, FILE_CONTENT);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_002 has failed for' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_003
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0300
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, FILE_CONTENT, {length: 3},(err: BusinessError<void> | null) => {
          if(err?.code != 0){
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_003 has failed for' + JSON.stringify(err));
            expect(err?.code == 13900008 && err?.message == 'Bad file descriptor').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_004
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0400
     * @tc.desc   Test write() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_004 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = await fs.write(file.fd, FILE_CONTENT, {
          length: 3,
        });
        expect(bytesWritten == 3).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_005
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0500
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_005 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, FILE_CONTENT, {
          length: 3,
        }, (err: BusinessError | null, bytesWritten: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_005 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten == 3).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_006
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0600
     * @tc.desc   Test write() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = await fs.write(file.fd, FILE_CONTENT, {
          offset: 5,
        });
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_007
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0700
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, FILE_CONTENT, {
          offset: 5,
        }, (err: BusinessError | null, bytesWritten: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_007 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten == FILE_CONTENT.length).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_008
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0800
     * @tc.desc   Test write() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_008 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = await fs.write(file.fd, FILE_CONTENT, {
          length: 3,
          offset: 5,
        });
        expect(bytesWritten == 3).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_009
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0900
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_009 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_009');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, FILE_CONTENT, {
          length: 3,
          offset: 5,
        }, (err: BusinessError | null, bytesWritten: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_009 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten == 3).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_009 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_010
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1000
     * @tc.desc   Test write() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_010 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = await fs.write(file.fd, FILE_CONTENT, {
          length: 4,
          offset: 5,
          encoding: 'utf-8',
        });
        expect(bytesWritten == 4).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_011
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1100
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_011 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, FILE_CONTENT, {
          length: 5,
          offset: 5,
          encoding: 'utf-8',
        }, (err: BusinessError | null, bytesWritten: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_011 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten == 5).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_012
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1200
     * @tc.desc   Test write() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_012 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_012');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = await fs.write(file.fd, new ArrayBuffer(4096));
        expect(bytesWritten == 4096).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_012 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_013
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1300
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_013 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_013');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, new ArrayBuffer(4096), {}, (err: BusinessError | null, bytesWritten: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_013 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten == 4096).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_013 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_014
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1400
     * @tc.desc   Test write() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_014 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_014');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten = await fs.write(file.fd, FILE_CONTENT, {});
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_014 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_015
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1500
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_015 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_015');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, new ArrayBuffer(4096), {
        }, (err: BusinessError | null, bytesWritten: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_015 has error for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten == 4096).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_015 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_016
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1600
     * @tc.desc   Test write() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_016 start');
      try {
        await fs.write(-1, FILE_CONTENT);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_016 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_017
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1700
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_017 start');
      try {
        fs.write(-1, FILE_CONTENT, {length: 5},(err: BusinessError | null, bytesWritten: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_017 has error for' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_017 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_018
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1800
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_018 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_018');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
      const invalidLength = 9999;
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, FILE_CONTENT, {
          length: invalidLength,
        }, (err: BusinessError | null, bytesWritten: long | undefined) => {
          if(err?.code != 0){
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_018 has error for' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_018 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_019
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1900
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_019 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_019');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
      const invalidLength = 4097;
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, new ArrayBuffer(4096), {
          length: invalidLength,
        }, (err: BusinessError | null, bytesWritten: long | undefined) => {
          if(err?.code != 0){
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_019 has error for' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_019 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_020
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_2000
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_020 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_020');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
      const invalidOffset = -1;
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, new ArrayBuffer(4096), {
          offset: invalidOffset,
        }, (err: BusinessError | null, bytesWritten: long | undefined) => {
          if(err?.code != 0){
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_020 has error for' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_020 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_021
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_2100
     * @tc.desc   Test write() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_021 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_021');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten1 = await fs.write(file.fd, FILE_CONTENT, undefined);
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await fs.write(file.fd, new ArrayBuffer(FILE_CONTENT.length), undefined);
        expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
        expect(readLen == FILE_CONTENT.length * 2).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_021 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_023
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_2300
     * @tc.desc   Test write() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_023 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_023');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let bytesWritten1 = await fs.write(file.fd, FILE_CONTENT, {
          length: undefined,
          offset: undefined,
          encoding: undefined,
        });
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await fs.write(file.fd, new ArrayBuffer(FILE_CONTENT.length), {
          length: undefined,
          offset: undefined,
          encoding: undefined,
        });
        expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
        expect(readLen == FILE_CONTENT.length * 2).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_023 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_async_static_024
     * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_2400
     * @tc.desc   Test write() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_async_static_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_024 start');
      let fpath = await Utils.nextFileName('fileIO_test_write_async_static_024');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.write(file.fd, FILE_CONTENT, {
          length: undefined,
          offset: undefined,
          encoding: undefined,
        }, (err: BusinessError | null, bytesWritten1: long | undefined) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_024 has error1 for' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
          fs.write(file.fd, FILE_CONTENT, {
            length: undefined,
            offset: undefined,
            encoding: undefined,
          }, (err: BusinessError | null, bytesWritten2: long | undefined) => {
            if (err?.code != 0) {
              hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_024 has error2 for' + JSON.stringify(err));
              expect(false).assertTrue();
            }
            expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
            let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
            expect(readLen == FILE_CONTENT.length * 2).assertTrue();
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_write_async_static_024 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_write end');

}