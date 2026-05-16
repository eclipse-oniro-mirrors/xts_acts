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

export default function fileIOFsync() {
  describe('fileIO_fs_fsync', (): void => {

    /**
     * @tc.name   fileIO_test_fsync_sync_static_000
     * @tc.number SUB_DF_FILEIO_FSYNC_SYNC_0000
     * @tc.desc   Test fsyncSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fsync_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fsync_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.fsyncSync(file.fd);
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fsync_sync_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fsync_sync_static_001
     * @tc.number SUB_DF_FILEIO_FSYNC_SYNC_0100
     * @tc.desc   Test fsyncSync() interface. Invalid fd parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fsync_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {

      try {
        fs.fsyncSync(-1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fsync_sync_static_001 end error' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fsync_async_static_000
     * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0000
     * @tc.desc   Test fsync() interface. await Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fsync_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fsync_async_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        await fs.fsync(file.fd);
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fsync_async_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fsync_async_static_001
     * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0100
     * @tc.desc   Test fsync() interface. Promise.then().catch()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fsync_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fsync_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.fsync(file.fd).then(() => {
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          done();
        }).catch((err: Error): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_fsync_async_static_001 error' + JSON.stringify(err));
          expect(false).assertTrue();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fsync_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fsync_async_static_002
     * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0200
     * @tc.desc   Test fsync() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fsync_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fsync_sync_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.fsync(file.fd, (err: BusinessError<void> | null) => {
          fs.closeSync(file);
          fs.unlinkSync(fpath);
        });
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fsync_async_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fsync_async_static_003
     * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0300
     * @tc.desc   Test fsync() interface. await Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fsync_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {

      try {
        await fs.fsync(-1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fsync_async_static_003 end error' + JSON.stringify(e))
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_fsync_async_static_004
     * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0400
     * @tc.desc   Test fsync() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fsync_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {

      try {
        fs.fsync(-1, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_fsync_async_static_004 error: {message: ' + err?.message + ', code: ' + err?.code + '}')
            expect(err?.code == 13900008 && err?.message == 'Bad file descriptor').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fsync_async_static_004 end error' + JSON.stringify(e))
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fsync_async_static_005
     * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0500
     * @tc.desc   Test fsync() interface. Promise.then().catch()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fsync_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {

      try {
        fs.fsync(-1).then(() => {
          expect(false).assertTrue();
        }).catch((err: Error): Promise<void> => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_fsync_async_static_005 error: {message: ' + JSON.stringify(err) + '}');
            expect(err?.code == 13900008 && err?.message == 'Bad file descriptor').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fsync_async_static_005 end error' + JSON.stringify(e))
        expect(false).assertTrue();
      }
    });
  });
}