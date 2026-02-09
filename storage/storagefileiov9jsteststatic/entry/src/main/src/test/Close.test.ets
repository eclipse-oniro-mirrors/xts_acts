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
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOClose() {
  describe('fileIO_fs_close', (): void => {

    /**
     * @tc.name   fileIO_test_close_sync_static_000
     * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0000
     * @tc.desc   Test closeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_close_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_close_sync_static_000');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.closeSync(file.fd);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_sync_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_close_sync_static_001
     * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0100
     * @tc.desc   Test closeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_close_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_close_sync_static_001');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_sync_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_close_sync_static_002
     * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0200
     * @tc.desc   Test closeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_close_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_close_sync_static_001');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let fd = file.fd;
        fs.closeSync(file);
        fs.closeSync(fd);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_sync_static_002 end error: ' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_close_sync_static_005
     * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0500
     * @tc.desc   Test closeSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_close_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {

      try {
        fs.closeSync(-1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_sync_static_005 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_close_async_static_000
     * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0000
     * @tc.desc   Test close() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_close_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_close_async_static_000');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.close(file.fd, (err: BusinessError<void> | null) => {
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_async_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_close_async_static_001
     * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0100
     * @tc.desc   Test close() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_close_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_close_async_static_001');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.close(file, (err: BusinessError<void> | null) => {
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_close_async_static_002
     * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0200
     * @tc.desc   Test close() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_close_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_close_async_static_002');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        await fs.close(file.fd);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_async_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_close_async_static_003
     * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0300
     * @tc.desc   Test close() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_close_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_close_async_static_003');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        await fs.close(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_async_static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_close_async_static_004
     * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0400
     * @tc.desc   Test close() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_close_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_close_async_static_004');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let fd = file.fd;
        await fs.close(file);
        await fs.close(fd);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_async_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_close_async_static_007
     * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0700
     * @tc.desc   Test close() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_close_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {

      try {
        await fs.close(-1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_async_static_007 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_close_async_static_009
     * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0900
     * @tc.desc   Test close() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_close_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_close_async_static_006');
      await Utils.prepareFile(fpath, FILE_CONTENT);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let fd = file.fd;
        fs.close(file, (err) => {
          if (err) {
            console.log('fileIO_test_close_async_static_009 error package: ' + JSON.stringify(err));
          }
        })
        fs.close(fd, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_async_static_009  error：' + err?.message + ', code: ' + err?.code + '}');
            fs.unlinkSync(fpath);
            expect(err?.code == 13900008 && err?.message == 'Bad file descriptor').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_close_async_static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}