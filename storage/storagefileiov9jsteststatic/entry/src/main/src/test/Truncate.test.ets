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
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function fileIOTruncate() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_truncate", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_truncate start');
    /**
     * @tc.name   fileIO_truncate_async_static_000
     * @tc.number SUB_DF_fileIO_truncate_async_static_0000
     * @tc.desc   Test the truncate() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_truncate_async_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let truncateLen = 5;
        await fs.truncate(fpath, truncateLen);
        let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_000 res: ' + res);
        expect(res).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == truncateLen).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_truncate_async_static_001
     * @tc.number SUB_DF_fileIO_truncate_async_static_0100
     * @tc.desc   Test the truncate() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_truncate_async_static_001');
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_001 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let truncateLen = 5;
        let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_001 res: ' + res);
        expect(res).assertTrue();
        fs.truncate(file.fd, truncateLen, (err: BusinessError<void> | null) => {
          let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
          expect(readLen == truncateLen).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_truncate_async_static_002
     * @tc.number SUB_DF_fileIO_truncate_async_static_0200
     * @tc.desc   Test the truncate() interface. Promise.then().catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_truncate_async_static_002');
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_002 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let truncateLen = 2;
        fs.truncate(fpath, truncateLen).then(() => {
          let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
          let res = await Utils.isIntNum(file.fd);
          hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_002 res: ' + res);
          expect(res).assertTrue();
          let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
          expect(readLen == truncateLen).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        }).catch((err: Error): Promise<void> => {
          console.log('fileIO_truncate_async_static_002 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_truncate_async_static_003
     * @tc.number SUB_DF_fileIO_truncate_async_static_0300
     * @tc.desc   Test the truncate() interface. Promise.then().catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_003 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_truncate_async_static_003');
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_003 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let truncateLen = 2;
        let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
        fs.truncate(file.fd, truncateLen).then(() => {
          let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
          expect(readLen == truncateLen).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        }).catch((err: Error): Promise<void> => {
          console.log('fileIO_truncate_async_static_003 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_truncate_async_static_004
     * @tc.number SUB_DF_fileIO_truncate_async_static_0400
     * @tc.desc   Test the truncate() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_004 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_truncate_async_static_004');
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_004 fpath: ' + fpath);
        let truncateLen = 2;
        fs.truncate(fpath, truncateLen, (err: BusinessError<void> | null) => {
          if (err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_004 has failed for' + JSON.stringify(err));
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_truncate_async_static_005
     * @tc.number SUB_DF_fileIO_truncate_async_static_0500
     * @tc.desc   Test the truncate() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_005 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_truncate_async_static_005');
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_005 fpath: ' + fpath);
        let truncateLen = 2;
        let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
        await fs.truncate(fpath, truncateLen);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_005 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_truncate_async_static_006
     * @tc.number SUB_DF_fileIO_truncate_async_static_0600
     * @tc.desc   Test the truncate() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_006 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_truncate_async_static_006');
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_006 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let truncateLen = 0;
        let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_006 res: ' + res);
        expect(res).assertTrue();
        fs.truncate(file.fd, truncateLen, (err: BusinessError<void> | null) => {
          let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
          expect(readLen == truncateLen).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_truncate_async_static_007
     * @tc.number SUB_DF_fileIO_truncate_async_static_0700
     * @tc.desc   Test the truncate() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_007 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_truncate_async_static_007');
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_007 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let truncateLen = 0;
        fs.truncate(fpath, truncateLen, (err: BusinessError<void> | null) => {
          let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
          let res = await Utils.isIntNum(file.fd);
          hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_007 res: ' + res);
          expect(res).assertTrue();
          let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
          expect(readLen == truncateLen).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_truncate_async_static_008
     * @tc.number SUB_DF_fileIO_truncate_async_static_0800
     * @tc.desc   Test the truncate() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_008 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_truncate_async_static_008');
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_008 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let truncateLen = 0;
        await fs.truncate(fpath, undefined);
        let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_008 res: ' + res);
        expect(res).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == truncateLen).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_truncate_async_static_011
     * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1100
     * @tc.desc   Test the truncate() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_011 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_truncate_async_static_011');
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_011 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let truncateLen = 5;
        let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_011 res: ' + res);
        expect(res).assertTrue();
        fs.closeSync(file.fd);
        fs.truncate(file.fd, truncateLen, (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_011 has failed for' + JSON.stringify(err));
            expect(err?.code == 13900008 && err?.message == 'Bad file descriptor').assertTrue();
            fs.unlinkSync(fpath);
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_truncate_async_static_012
     * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1200
     * @tc.desc   Test the truncate() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_012 start');
      let fpath = await Utils.nextFileName('fileIO_truncate_async_static_012');
      hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_012 fpath: ' + fpath);
      try {
        fs.mkdirSync(fpath);
        let truncateLen = 5;
        await fs.truncate(fpath, truncateLen);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_012 has failed for' + JSON.stringify(e));
        expect(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_truncate_async_static_013
     * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_1300
     * @tc.desc   Test the truncate() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_truncate_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_truncate_async_static_013');
      try {
        fs.mkdirSync(fpath);
        let truncateLen = 5;
        await fs.truncate(fpath);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_truncate_async_static_013 has failed for' + JSON.stringify(e));
        expect(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_truncate_sync_static_000
     * @tc.number SUB_DF_fileIO_truncate_sync_static_0000
     * @tc.desc   Test the truncateSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_truncate_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_truncate_sync_static_000');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_000 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        fs.truncateSync(fpath);
        expect(fs.statSync(fpath).size == 0).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_truncate_sync_static_001
     * @tc.number SUB_DF_fileIO_truncate_sync_static_0100
     * @tc.desc   Test the truncateSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_truncate_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_truncate_sync_static_001');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_001 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let truncateLen = 5;
        let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_001 res: ' + res);
        expect(res).assertTrue();
        fs.truncateSync(file.fd, truncateLen);
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == truncateLen).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_truncate_sync_static_002
     * @tc.number SUB_DF_fileIO_truncate_sync_static_0200
     * @tc.desc   Test the truncateSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_truncate_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_truncate_sync_static_002');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_002 fpath: ' + fpath);
        fs.truncateSync(fpath);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_002 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_truncate_sync_static_003
     * @tc.number SUB_DF_fileIO_truncate_sync_static_0300
     * @tc.desc   Test the truncateSync() interface. Invalid parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_truncate_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_003 start');
      try {
        let truncateLen = 2;
        fs.truncateSync(-1, truncateLen);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_003 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_truncate_sync_static_005
     * @tc.number SUB_DF_fileIO_truncate_sync_static_0500
     * @tc.desc   Test truncateSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_truncate_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_005 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_truncate_sync_static_005');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_005 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_005 res: ' + res);
        expect(res).assertTrue();
        fs.truncateSync(file.fd, undefined);
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_truncate_sync_static_006
     * @tc.number SUB_DF_fileIO_truncate_sync_static_0600
     * @tc.desc   Test the truncateSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_truncate_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_006 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_truncate_sync_static_006');
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_006 fpath: ' + fpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let truncateLen = 5;
        let file = fs.openSync(fpath,fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(file.fd);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_006 res: ' + res);
        expect(res).assertTrue();
        fs.closeSync(file.fd);
        fs.truncateSync(file.fd, truncateLen);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_006 has failed for' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_truncate_sync_static_007
     * @tc.number SUB_DF_fileIO_truncate_sync_static_0700
     * @tc.desc   Test the truncateSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_truncate_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_test_truncate_sync_static_007');
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_007 fpath: ' + fpath);
      try {
        fs.mkdirSync(fpath);
        fs.truncateSync(fpath);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_truncate_sync_static_007 has failed for' + JSON.stringify(e));
        expect(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
      }
    });
  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_truncate end');
}