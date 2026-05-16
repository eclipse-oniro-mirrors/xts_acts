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

export default function fileIORename() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_rename", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_rename start');

    /**
     * @tc.name   fileIO_test_rename_sync_static_000
     * @tc.number SUB_DF_FILEIO_RENAME_SYNC_0000
     * @tc.desc   Test renameSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_sync_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_rename_sync_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let newf = fpath + 'test';
        fs.renameSync(fpath, newf);
        expect(fs.accessSync(newf)).assertTrue();
        fs.unlinkSync(newf);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_sync_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_sync_static_001
     * @tc.number SUB_DF_FILEIO_RENAME_SYNC_0100
     * @tc.desc   Test renameSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_sync_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_rename_sync_static_001');
        let newf = fpath + 'test';
        fs.renameSync(fpath, newf);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_sync_static_001 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_sync_static_002
     * @tc.number SUB_DF_FILEIO_RENAME_SYNC_0200
     * @tc.desc   Test renameSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_sync_static_002 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_test_rename_sync_static_002');
        let fpath = dpath + '/file_000';
        fs.mkdirSync(dpath);
        fs.mkdirSync(dpath + '/dir_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let newf = dpath + '/dir_000/newFileName';
        fs.renameSync(fpath, newf);
        expect(fs.accessSync(newf)).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_sync_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_sync_static_003
     * @tc.number SUB_DF_FILEIO_RENAME_SYNC_0300
     * @tc.desc   Test renameSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_sync_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_rename_sync_static_003');
      let fpathTarget = fpath + await Utils.randomString(250);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.renameSync(fpath, fpathTarget);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_sync_static_003 has failed for' + JSON.stringify(e));
        expect(e.code == 13900030 && e.message == 'File name too long').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_sync_static_004
     * @tc.number SUB_DF_FILEIO_RENAME_SYNC_0400
     * @tc.desc   Test rename() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_sync_static_004 start');
      try {
        fs.renameSync('/data', '/data_new');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_sync_static_004 has failed for' + JSON.stringify(e));
        expect(e.code == 13900012 && e.message == 'Permission denied').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_async_static_000
     * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0000
     * @tc.desc   Test rename() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_000 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_rename_async_static_000');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let newf = fpath + '123';
        await fs.rename(fpath, newf);
        expect(fs.accessSync(newf)).assertTrue();
        fs.unlinkSync(newf);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_000 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_async_static_001
     * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0100
     * @tc.desc   Test rename() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_001 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_rename_async_static_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let newf = fpath + 'aaa';
        fs.rename(fpath, newf, (err: BusinessError<void> | null) => {
          expect(fs.accessSync(newf)).assertTrue();
          fs.unlinkSync(newf);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_async_static_002
     * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0200
     * @tc.desc   Test rename() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_002 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_rename_async_static_002');
        let newf = fpath + 'test';
        await fs.rename(fpath, newf);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_002 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_async_static_003
     * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0300
     * @tc.desc   Test rename() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_003 start');
      try {
        let fpath = await Utils.nextFileName('fileIO_test_rename_async_static_003');
        let newf = fpath + 'test';
        fs.rename(fpath, newf, (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_003 has error for' + JSON.stringify(err));
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_async_static_004
     * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0400
     * @tc.desc   Test rename() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_004 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_test_rename_async_static_004');
        let fpath = dpath + '/file_001';
        fs.mkdirSync(dpath);
        fs.mkdirSync(dpath + '/dir_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let newf = dpath + '/dir_001/newFileName';
        await fs.rename(fpath, newf);
        expect(fs.accessSync(newf)).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_async_static_005
     * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0500
     * @tc.desc   Test rename() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_005 start');
      try {
        let dpath = await Utils.nextFileName('fileIO_test_rename_async_static_005');
        let fpath = dpath + '/file_001';
        fs.mkdirSync(dpath);
        fs.mkdirSync(dpath + '/dir_001');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
        let newf = dpath + '/dir_001/newFileName';
        fs.rename(fpath, newf, (err: BusinessError<void> | null) => {
          expect(fs.accessSync(newf)).assertTrue();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_async_static_006
     * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0600
     * @tc.desc   Test rename() interfaces. Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_rename_async_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fpathTarget = fpath + await Utils.randomString(250);
        await fs.rename(fpath, fpathTarget);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_006 has failed for' + JSON.stringify(e));
        expect(e.code == 13900030 && e.message == 'File name too long').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_async_static_007
     * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0700
     * @tc.desc   Test rename() interfaces. Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_test_rename_async_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fpathTarget = fpath + await Utils.randomString(250);
        fs.rename(fpath, fpathTarget, (err: BusinessError<void> | null) => {
          if(err?.code != 0){
            fs.unlinkSync(fpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_007 has error for' + JSON.stringify(err));
            expect(err?.code == 13900030 && err?.message == 'File name too long').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_rename_async_static_008
     * @tc.number SUB_DF_FILEIO_RENAME_ASYNC_0800
     * @tc.desc   Test rename() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_rename_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      try {
        await fs.rename('/data', '/data_new');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_rename_async_static_008 has failed for' + JSON.stringify(e));
        expect(e.code == 13900012 && e.message == 'Permission denied').assertTrue();
        done();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_rename end');

}