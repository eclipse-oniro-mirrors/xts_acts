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
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOAccess() {
  describe('fileIO_fs_access', (): void => {

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_000
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0000
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_000');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        expect(fs.accessSync(fpath)).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_001
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0100
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async ():void => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_000');

      try {
        let ret = fs.accessSync(fpath);
        expect(ret === false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_003
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0300
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_003');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.EXIST);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_004
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0400
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_004');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.WRITE);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_004 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_005
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0500
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_005');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.READ);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_005 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_006
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0600
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_006');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.READ_WRITE);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_005 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_007
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0700
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_007');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.EXIST, fs.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_008
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0800
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_008');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.WRITE, fs.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_008 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_009
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0900
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_009');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.READ, fs.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_010
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1000
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Sync_Static_010');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.READ_WRITE, fs.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_010 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_011
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1100
     * @tc.desc   Test accessSync() interface with empty string path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      try {
        let ret = fs.accessSync('');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_011 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_012
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1200
     * @tc.desc   Test accessSync() interface with empty string path and EXIST mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      try {
        let ret = fs.accessSync('', fs.AccessModeType.EXIST);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_012 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_013
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1300
     * @tc.desc   Test accessSync() interface with empty string path and READ mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      try {
        let ret = fs.accessSync('', fs.AccessModeType.READ);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_013 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_014
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1400
     * @tc.desc   Test accessSync() interface with empty string path and WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      try {
        let ret = fs.accessSync('', fs.AccessModeType.WRITE);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_014 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_Static_015
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1500
     * @tc.desc   Test accessSync() interface with empty string path and READ_WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_Static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      try {
        let ret = fs.accessSync('', fs.AccessModeType.READ_WRITE);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Sync_Static_015 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_000
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0000
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_FileIO_Access_Async_Static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_000');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath);
        expect(ret === true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_001
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0100
     * @tc.desc   Test access() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_FileIO_Access_Async_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_001');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        const ret: boolean | undefined = await fs.access(fpath);
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_001 ret：' + ret);
                  expect(ret === true).assertTrue();
                  let file = fs.openSync(fpath);
                  let res = await Utils.isIntNum(file.fd);
                  expect(res).assertTrue();
                  let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
                  expect(readlen == FILE_CONTENT.length).assertTrue();
                  fs.closeSync(file);
                  fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_002
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0200
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_FileIO_Access_Async_Static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_002');

      try {
        let ret = await fs.access(fpath);
        expect(ret === false).assertTrue();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_003
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0300
     * @tc.desc   Test access() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_FileIO_Access_Async_Static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_003');

      try {
        fs.access(fpath, (err: BusinessError | null, ret: boolean | undefined) => {
          expect(ret === false).assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_006
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0600
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_006');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.EXIST);
        expect(ret === true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_006 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_007
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0700
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_007');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.WRITE);
        expect(ret === true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_008
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0800
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_008');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.READ);
        expect(ret === true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_008 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_009
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0900
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_009');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.READ_WRITE);
        expect(ret === true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_010
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1000
     * @tc.desc   Test access() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_010');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.EXIST, fs.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_010 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_011
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1100
     * @tc.desc   Test access() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_011');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.WRITE, fs.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_011 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_012
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1200
     * @tc.desc   Test access() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_012');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.READ, fs.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_012 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_013
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1300
     * @tc.desc   Test access() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_013');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.READ_WRITE, fs.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fs.openSync(fpath);
        let res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let readlen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_013 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_014
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1400
     * @tc.desc   Test access() interface with empty string path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let ret = await fs.access('');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_014 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_015
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1500
     * @tc.desc   Test access() interface with empty string path and mode parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let ret = await fs.access('', fs.AccessModeType.EXIST);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_015 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_016
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1600
     * @tc.desc   Test access() interface with empty string path and READ mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let ret = await fs.access('', fs.AccessModeType.READ);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_016 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_017
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1700
     * @tc.desc   Test access() interface with empty string path and WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let ret = await fs.access('', fs.AccessModeType.WRITE);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_017 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_018
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1800
     * @tc.desc   Test access() interface with empty string path and READ_WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let ret = await fs.access('', fs.AccessModeType.READ_WRITE);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_018 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_019
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1900
     * @tc.desc   Test access() interface with empty string path using callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      try {
        fs.access('', (err: BusinessError | null, ret: boolean | undefined) => {
          if (err) {
            expect(err.code === 13900020).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_019 error code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_021
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_2100
     * @tc.desc   Test access() interface with callback. Returns true for existing file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_021');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        fs.access(fpath, (err: BusinessError | null, ret: boolean | undefined) => {
          if (err?.code !=0) {
            hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_021 callback error: ' + JSON.stringify(err));
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_021 ret: ' + ret);
            expect(ret === true).assertTrue();
            fs.unlinkSync(fpath);
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_021 error: ' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_Static_022
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_2200
     * @tc.desc   Test access() interface with callback. Returns false for non-existing file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_Static_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Access_Async_Static_022');

      try {
        fs.access(fpath, (err: BusinessError | null, ret: boolean | undefined) => {
          if (err?.code !=0) {
            hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_022 callback error: ' + JSON.stringify(err));
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_022 ret: ' + ret);
            expect(ret === false).assertTrue();
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Access_Async_Static_022 error: ' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Async_Access_With_Flag_000
     * @tc.number SUB_DF_FILEIO_ASYNC_ACCESS_WITH_FLAG_0000
     * @tc.desc   Test access(path, mode, flag) interface with empty string path and EXIST mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Async_Access_With_Flag_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let ret = await fs.access('', fs.AccessModeType.EXIST, fs.AccessFlagType.LOCAL);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_000 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Async_Access_With_Flag_001
     * @tc.number SUB_DF_FILEIO_ASYNC_ACCESS_WITH_FLAG_0100
     * @tc.desc   Test access(path, mode, flag) interface with empty string path and READ mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Async_Access_With_Flag_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let ret = await fs.access('', fs.AccessModeType.READ, fs.AccessFlagType.LOCAL);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_001 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Async_Access_With_Flag_002
     * @tc.number SUB_DF_FILEIO_ASYNC_ACCESS_WITH_FLAG_0200
     * @tc.desc   Test access(path, mode, flag) interface with empty string path and WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Async_Access_With_Flag_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let ret = await fs.access('', fs.AccessModeType.WRITE, fs.AccessFlagType.LOCAL);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_002 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Async_Access_With_Flag_003
     * @tc.number SUB_DF_FILEIO_ASYNC_ACCESS_WITH_FLAG_0300
     * @tc.desc   Test access(path, mode, flag) interface with empty string path and READ_WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Async_Access_With_Flag_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let ret = await fs.access('', fs.AccessModeType.READ_WRITE, fs.AccessFlagType.LOCAL);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_003 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Async_Access_With_Flag_004
     * @tc.number SUB_DF_FILEIO_ASYNC_ACCESS_WITH_FLAG_0400
     * @tc.desc   Test access(path, mode, flag) interface with non-existing file and EXIST mode. Returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Async_Access_With_Flag_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Async_Access_With_Flag_004');

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.EXIST, fs.AccessFlagType.LOCAL);
        expect(ret === false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_004 ret: ' + ret);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_004 error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Async_Access_With_Flag_005
     * @tc.number SUB_DF_FILEIO_ASYNC_ACCESS_WITH_FLAG_0500
     * @tc.desc   Test access(path, mode, flag) interface with non-existing file and READ mode. Returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Async_Access_With_Flag_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Async_Access_With_Flag_005');

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.READ, fs.AccessFlagType.LOCAL);
        expect(ret === false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_005 ret: ' + ret);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_005 error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Async_Access_With_Flag_006
     * @tc.number SUB_DF_FILEIO_ASYNC_ACCESS_WITH_FLAG_0600
     * @tc.desc   Test access(path, mode, flag) interface with non-existing file and WRITE mode. Returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Async_Access_With_Flag_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Async_Access_With_Flag_006');

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.WRITE, fs.AccessFlagType.LOCAL);
        expect(ret === false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_006 ret: ' + ret);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_006 error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Async_Access_With_Flag_007
     * @tc.number SUB_DF_FILEIO_ASYNC_ACCESS_WITH_FLAG_0700
     * @tc.desc   Test access(path, mode, flag) interface with non-existing file and READ_WRITE mode. Returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Async_Access_With_Flag_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('test_FileIO_Async_Access_With_Flag_007');

      try {
        let ret = await fs.access(fpath, fs.AccessModeType.READ_WRITE, fs.AccessFlagType.LOCAL);
        expect(ret === false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_007 ret: ' + ret);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Async_Access_With_Flag_007 error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Sync_Access_With_Flag_000
     * @tc.number SUB_DF_FILEIO_SYNC_ACCESS_WITH_FLAG_0000
     * @tc.desc   Test accessSync(path, mode, flag) interface with empty string path and EXIST mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Sync_Access_With_Flag_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      try {
        let ret = fs.accessSync('', fs.AccessModeType.EXIST, fs.AccessFlagType.LOCAL);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_000 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Sync_Access_With_Flag_001
     * @tc.number SUB_DF_FILEIO_SYNC_ACCESS_WITH_FLAG_0100
     * @tc.desc   Test accessSync(path, mode, flag) interface with empty string path and READ mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Sync_Access_With_Flag_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      try {
        let ret = fs.accessSync('', fs.AccessModeType.READ, fs.AccessFlagType.LOCAL);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_001 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Sync_Access_With_Flag_002
     * @tc.number SUB_DF_FILEIO_SYNC_ACCESS_WITH_FLAG_0200
     * @tc.desc   Test accessSync(path, mode, flag) interface with empty string path and WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Sync_Access_With_Flag_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      try {
        let ret = fs.accessSync('', fs.AccessModeType.WRITE, fs.AccessFlagType.LOCAL);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_002 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Sync_Access_With_Flag_003
     * @tc.number SUB_DF_FILEIO_SYNC_ACCESS_WITH_FLAG_0300
     * @tc.desc   Test accessSync(path, mode, flag) interface with empty string path and READ_WRITE mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Sync_Access_With_Flag_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      try {
        let ret = fs.accessSync('', fs.AccessModeType.READ_WRITE, fs.AccessFlagType.LOCAL);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_003 error code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Sync_Access_With_Flag_004
     * @tc.number SUB_DF_FILEIO_SYNC_ACCESS_WITH_FLAG_0400
     * @tc.desc   Test accessSync(path, mode, flag) interface with non-existing file and EXIST mode. Returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Sync_Access_With_Flag_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      let fpath = await Utils.nextFileName('test_FileIO_Sync_Access_With_Flag_004');

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.EXIST, fs.AccessFlagType.LOCAL);
        expect(ret === false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_004 ret: ' + ret);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_004 error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Sync_Access_With_Flag_005
     * @tc.number SUB_DF_FILEIO_SYNC_ACCESS_WITH_FLAG_0500
     * @tc.desc   Test accessSync(path, mode, flag) interface with non-existing file and READ mode. Returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Sync_Access_With_Flag_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      let fpath = await Utils.nextFileName('test_FileIO_Sync_Access_With_Flag_005');

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.READ, fs.AccessFlagType.LOCAL);
        expect(ret === false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_005 ret: ' + ret);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_005 error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Sync_Access_With_Flag_006
     * @tc.number SUB_DF_FILEIO_SYNC_ACCESS_WITH_FLAG_0600
     * @tc.desc   Test accessSync(path, mode, flag) interface with non-existing file and WRITE mode. Returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Sync_Access_With_Flag_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      let fpath = await Utils.nextFileName('test_FileIO_Sync_Access_With_Flag_006');

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.WRITE, fs.AccessFlagType.LOCAL);
        expect(ret === false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_006 ret: ' + ret);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_006 error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Sync_Access_With_Flag_007
     * @tc.number SUB_DF_FILEIO_SYNC_ACCESS_WITH_FLAG_0700
     * @tc.desc   Test accessSync(path, mode, flag) interface with non-existing file and READ_WRITE mode. Returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Sync_Access_With_Flag_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): void => {
      let fpath = await Utils.nextFileName('test_FileIO_Sync_Access_With_Flag_007');

      try {
        let ret = fs.accessSync(fpath, fs.AccessModeType.READ_WRITE, fs.AccessFlagType.LOCAL);
        expect(ret === false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_007 ret: ' + ret);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'test_FileIO_Sync_Access_With_Flag_007 error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}