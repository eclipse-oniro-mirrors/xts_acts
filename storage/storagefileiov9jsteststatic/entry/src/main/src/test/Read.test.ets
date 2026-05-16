/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function fileIORead() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_read", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_read start');
    /**
     * @tc.name   fileIO_test_read_sync_static_000
     * @tc.number SUB_DF_FILEIO_READ_SYNC_0000
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_sync_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen1 = fs.readSync(file.fd, new ArrayBuffer(16));
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_000 readLen1: ' + readLen1);
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2 = fs.readSync(file.fd, new ArrayBuffer(8));
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_000 readLen2: ' + readLen2);
        expect(readLen2 == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_sync_static_001
     * @tc.number SUB_DF_FILEIO_READ_SYNC_0100
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_sync_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        const Length = 1;
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), {
          length: Length,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_001 readLen: ' + readLen);
        expect(readLen == 1).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_sync_static_002
     * @tc.number SUB_DF_FILEIO_READ_SYNC_0200
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_sync_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      const invalidLength = -1;
      let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
      try {
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.readSync(file.fd, new ArrayBuffer(4096), {
          length: invalidLength,
        });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_002 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_sync_static_003
     * @tc.number SUB_DF_FILEIO_READ_SYNC_0300
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_003 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_sync_static_003');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), {
          length: FILE_CONTENT.length.toLong() + 1,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_003 readLen: ' + readLen);
        expect(readLen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_sync_static_004
     * @tc.number SUB_DF_FILEIO_READ_SYNC_0400
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_004 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_sync_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
      try {
        const invalidLength1 = 4097;
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.readSync(file.fd, new ArrayBuffer(4096), {
          length: invalidLength1,
        });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_004 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_sync_static_005
     * @tc.number SUB_DF_FILEIO_READ_SYNC_0500
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_005 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_sync_static_005');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_005 readLen: ' + readLen);
        expect(readLen == FILE_CONTENT.length - 1).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_sync_static_006
     * @tc.number SUB_DF_FILEIO_READ_SYNC_0600
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_sync_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
      try {
        const invalidOffset = -1;
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_006 res: ' + res);
        expect(res).assertTrue();
        fs.readSync(file.fd, new ArrayBuffer(4096), {
          offset: invalidOffset,
        });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_006 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_sync_static_007
     * @tc.number SUB_DF_FILEIO_READ_SYNC_0700
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_007 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_sync_static_007');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), {
          offset: FILE_CONTENT.length.toLong() + 1,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_007 readLen: ' + readLen);
        expect(readLen == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_sync_static_008
     * @tc.number SUB_DF_FILEIO_READ_SYNC_0800
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_008 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_sync_static_008');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 1,
          length: FILE_CONTENT.length.toLong() - 1,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_008 readLen: ' + readLen);
        expect(readLen == FILE_CONTENT.length - 1).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_sync_static_009
     * @tc.number SUB_DF_FILEIO_READ_SYNC_0900
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_009 start');
      try {
        fs.readSync(-1, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_009 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_sync_static_011
     * @tc.number SUB_DF_FILEIO_READ_SYNC_1100
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_011 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_sync_static_011');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(16), undefined);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_011 readLen: ' + readLen);
        let readLen1 = fs.readSync(file.fd, new ArrayBuffer(8), undefined);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_011 readLen: ' + readLen1);
        expect(readLen == FILE_CONTENT.length).assertTrue();
        expect(readLen1 == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_sync_static_012
     * @tc.number SUB_DF_FILEIO_READ_SYNC_1200
     * @tc.desc   Test readSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_sync_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_012 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_sync_static_012');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(16), {
          offset: undefined,
          length: undefined,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_012 readLen: ' + readLen);
        let readLen1 = fs.readSync(file.fd, new ArrayBuffer(8), {
          offset: undefined,
          length: undefined,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_012 readLen: ' + readLen1);
        expect(readLen == FILE_CONTENT.length).assertTrue();
        expect(readLen1 == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_sync_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_000
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_0000
     * @tc.desc   Test read() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = await fs.read(file.fd, new ArrayBuffer(16));
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_000 readLen: ' + readLen);
        let readLen1 = await fs.read(file.fd, new ArrayBuffer(8));
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_000 readLen: ' + readLen1);
        expect(readLen == FILE_CONTENT.length).assertTrue();
        expect(readLen1 == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_001
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_0100
     * @tc.desc   Test read() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_001 res: ' + res);
        expect(res).assertTrue();
        fs.read(file.fd, new ArrayBuffer(16), (err: BusinessError | null, readLen1: long | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_001 readLen1: ' + readLen1);
          //expect(readlen1 == FILE_CONTENT.length).assertTrue();
          fs.read(file.fd, new ArrayBuffer(8), (err: BusinessError | null, readLen2: long | undefined) => {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_001 readLen2: ' + readLen2);
            expect(readLen2 == 0).assertTrue();
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            done();
          })
        })
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_002
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_0200
     * @tc.desc   Test read() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_read_async_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
      try {
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        await fs.read(file.fd, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_002 has failed for' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_003
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_0300
     * @tc.desc   Test read() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_003 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_003');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.read(file.fd, new ArrayBuffer(4096), (err: BusinessError | null, readLen: long | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_003 err111: ' + JSON.stringify(err));
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_003 readLen: ' + readLen);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_003 err: ' + JSON.stringify(err));
            fs.closeSync(file);
            fs.unlinkSync(fpath);
            expect(err?.code == 13900008 && err?.message == 'Bad file descriptor').assertTrue();
            done();
          }
        })
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_004
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_0400
     * @tc.desc   Test read() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_004 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_004');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = await fs.read(file.fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_004 readLen: ' + readLen);
        expect(readLen == FILE_CONTENT.length - 1).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_005
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_0500
     * @tc.desc   Test read() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_005 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_005');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_005 res: ' + res);
        expect(res).assertTrue();
        fs.read(file.fd, new ArrayBuffer(4096), {
          offset: 1,
        }, (err: BusinessError | null, readLen: long | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_005 readLen: ' + readLen);
          expect(readLen == FILE_CONTENT.length - 1).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_006
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_0600
     * @tc.desc   Test read() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_006 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_006');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let parlength = 3;
        let readLen = await fs.read(file.fd, new ArrayBuffer(4096), {
          length: parlength,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_006 readLen: ' + readLen);
        expect(readLen == parlength).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_007
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_0700
     * @tc.desc   Test read() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_007 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_007');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let parlength = 3;
        fs.read(file.fd, new ArrayBuffer(4096), {
          length: parlength,
        }, (err: BusinessError | null, readLen: long | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_007 readLen: ' + readLen);
          expect(readLen == parlength).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_008
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_0800
     * @tc.desc   Test read() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_008 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_008');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = await fs.read(file.fd, new ArrayBuffer(4096), {
          offset: FILE_CONTENT.length.toLong() + 1,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_008 readLen: ' + readLen);
        expect(readLen == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_009
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_0900
     * @tc.desc   Test read() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_009 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_009');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.read(file.fd, new ArrayBuffer(4096), {
          offset: FILE_CONTENT.length.toLong() + 1,
        }, (err: BusinessError | null, readLen: long | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_009 readLen: ' + readLen);
          expect(readLen == 0).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_009 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_010
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_1000
     * @tc.desc   Test read() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_010 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_010');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = await fs.read(file.fd, new ArrayBuffer(4096), {
          offset: 1,
          length: FILE_CONTENT.length.toLong(),
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_010 readLen: ' + readLen);
        expect(readLen == FILE_CONTENT.length - 1).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_011
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_1100
     * @tc.desc   Test read() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_011 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_011');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.read(file.fd, new ArrayBuffer(4096), {
          offset: 1,
          length: FILE_CONTENT.length.toLong(),
        }, (err: BusinessError | null, readLen: long | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_011 readLen: ' + readLen);
          expect(readLen == FILE_CONTENT.length -1).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_012
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_1200
     * @tc.desc   Test read() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_012 start');
      try {
        await fs.read(-1, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_012 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_013
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_1300
     * @tc.desc   Test read() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_013 start');
      try {
        fs.read(-1, new ArrayBuffer(4096), (err: BusinessError | null, readLen: long | undefined) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_013 error : ' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_013 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_014
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_1400
     * @tc.desc   Test read() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_014 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_014');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        const invalidOffset = -1;
        fs.read(file.fd, new ArrayBuffer(4096), {
          offset: invalidOffset
        }, (err: BusinessError | null, readLen: long | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_014 readLen: ' + readLen);
          expect(readLen == 0).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_014 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_015
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_1500
     * @tc.desc   Test read() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_015 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_015');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        const invalidLength = 4097;
        fs.read(file.fd, new ArrayBuffer(4096), {
          length: invalidLength
        }, (err: BusinessError | null, readLen: long | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_015 readLen: ' + readLen);
          //expect(false).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_015 has failed for' + JSON.stringify(e));
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_016
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_1600
     * @tc.desc   Test read() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_016 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_016');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen = await fs.read(file.fd, new ArrayBuffer(4096), {});
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_016 readLen: ' + readLen);
        expect(readLen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_016 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_017
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_1700
     * @tc.desc   Test read() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_017 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_017');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.read(file.fd, new ArrayBuffer(4096), {
        }, (err: BusinessError | null, readLen: long | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_017 readLen: ' + readLen);
          expect(readLen == FILE_CONTENT.length).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_017 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_018
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_1800
     * @tc.desc   Test read() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_018 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_018');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_018 res: ' + res);
        expect(res).assertTrue();
        const invalidLength = -1;
        await fs.read(file.fd, new ArrayBuffer(4096), {
          length: invalidLength,
        });
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_018 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_019
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_1900
     * @tc.desc   Test read() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_019 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_019');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        const invalidLength = -1;
        let readLen1 = await fs.read(file.fd, new ArrayBuffer(16), undefined);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_019 readLen1: ' + readLen1);
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2 = await fs.read(file.fd, new ArrayBuffer(8), undefined);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_019 readLen2: ' + readLen2);
        expect(readLen2 == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_019 has failed for' + JSON.stringify(e));
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_read_async_static_020
     * @tc.number SUB_DF_FILEIO_READ_ASYNC_2000
     * @tc.desc   Test read() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_read_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_020 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_read_async_static_020');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readLen1 = await fs.read(file.fd, new ArrayBuffer(4096),  {
          offset: undefined,
          length: undefined,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_020 readLen1: ' + readLen1);
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2 = await fs.read(file.fd, new ArrayBuffer(8), {
          offset: undefined,
          length: undefined,
        });
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_020 readLen2: ' + readLen2);
        expect(readLen2 == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_read_async_static_020 has failed for' + JSON.stringify(e));
        done();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'abilityTest end');

}