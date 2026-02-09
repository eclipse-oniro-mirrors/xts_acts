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

export default function fileIORmdir() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_rmdir", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_rmdir start');

    /**
     * @tc.name   fileIO_test_rmdir_sync_static_000
     * @tc.number SUB_STORAGE_FILEIO_RMDIR_SYNC_0000
     * @tc.desc   Test rmdirSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rmdir_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_sync_static_000 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_test_rmdir_sync_static_000d');
        let fpath = dpath + '/rmdir_sync_000';
        let ffpath = dpath + '/rmdir_sync_000_1';
        let ddpath = dpath + '/rmdir_sync_000_1d';
        let fffpath = ddpath + '/rmdir_sync_000';
        fs.mkdirSync(dpath);
        fs.mkdirSync(ddpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
        expect(await Utils.prepareFile(fffpath, FILE_CONTENT)).assertTrue();
        expect(fs.accessSync(ddpath)).assertTrue();
        expect(fs.accessSync(fffpath)).assertTrue();
        fs.rmdirSync(dpath);
        expect(!fs.accessSync(dpath)).assertTrue();
        expect(!fs.accessSync(ddpath)).assertTrue();
        expect(!fs.accessSync(fffpath)).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_sync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rmdir_sync_static_001
     * @tc.number SUB_STORAGE_FILEIO_RMDIR_SYNC_0100
     * @tc.desc   Test rmdirSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rmdir_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_sync_static_001 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_test_rmdir_sync_static_001');
        fs.rmdirSync(dpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_sync_static_001 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rmdir_sync_static_002
     * @tc.number SUB_STORAGE_FILEIO_RMDIR_SYNC_0200
     * @tc.desc   Test rmdirSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rmdir_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_sync_static_002 start');
      try {
        let dpath = await Utils.nextFileName('../cache/fileIO_test_rmdir_sync_static_002');
        fs.mkdirSync(dpath);
        expect(fs.accessSync(dpath)).assertTrue();
        fs.rmdirSync(dpath);
        expect(!fs.accessSync(dpath)).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_sync_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rmdir_async_static_000
     * @tc.number SUB_STORAGE_FILEIO_RMDIR_ASYNC_0000
     * @tc.desc   Test rmdir() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rmdir_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_async_static_000 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_test_rmdir_async_static_000d');
        let fpath = dpath + '/rmdir_sync_000';
        let ffpath = dpath + '/rmdir_sync_000_1';
        let ddpath = dpath + '/rmdir_sync_000_1d';
        let fffpath = ddpath + '/rmdir_sync_000';
        fs.mkdirSync(dpath);
        fs.mkdirSync(ddpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
        expect(await Utils.prepareFile(fffpath, FILE_CONTENT)).assertTrue();
        expect(fs.accessSync(ddpath)).assertTrue();
        expect(fs.accessSync(fffpath)).assertTrue();
        await fs.rmdir(dpath);
        expect(!fs.accessSync(dpath)).assertTrue();
        expect(!fs.accessSync(ddpath)).assertTrue();
        expect(!fs.accessSync(fffpath)).assertTrue();
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rmdir_async_static_001
     * @tc.number SUB_STORAGE_FILEIO_RMDIR_ASYNC_0100
     * @tc.desc   Test rmdir() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rmdir_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_async_static_001 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_test_rmdir_async_static_001d');
        let fpath = dpath + '/rmdir_sync_000';
        let ffpath = dpath + '/rmdir_sync_000_1';
        let ddpath = dpath + '/rmdir_sync_000_1d';
        let fffpath = ddpath + '/rmdir_sync_000';
        fs.mkdirSync(dpath);
        fs.mkdirSync(ddpath);
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
        expect(await Utils.prepareFile(fffpath, FILE_CONTENT)).assertTrue();
        expect(fs.accessSync(ddpath)).assertTrue();
        expect(fs.accessSync(fffpath)).assertTrue();
        fs.rmdir(dpath, (err: BusinessError<void> | null) => {
          expect(!fs.accessSync(dpath)).assertTrue();
          expect(!fs.accessSync(ddpath)).assertTrue();
          expect(!fs.accessSync(fffpath)).assertTrue();
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rmdir_async_static_002
     * @tc.number SUB_STORAGE_FILEIO_RMDIR_ASYNC_0200
     * @tc.desc   Test rmdir() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rmdir_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_async_static_002 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_test_rmdir_async_static_002');
        await fs.rmdir(dpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_async_static_002 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_rmdir_async_static_003
     * @tc.number SUB_STORAGE_FILEIO_RMDIR_ASYNC_0300
     * @tc.desc   Test rmdir() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rmdir_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_async_static_003 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_test_rmdir_async_static_003');
        fs.rmdir(dpath, (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_async_static_003 has error for' + JSON.stringify(err));
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_async_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rmdir_async_static_004
     * @tc.number SUB_STORAGE_FILEIO_RMDIR_ASYNC_0400
     * @tc.desc   Test rmdirSync() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rmdir_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_async_static_004 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_test_rmdir_async_static_004');
        fs.mkdirSync(dpath);
        expect(fs.accessSync(dpath)).assertTrue();
        await fs.rmdir(dpath);
        expect(!fs.accessSync(dpath)).assertTrue();
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rmdir_async_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_rmdir end');

}