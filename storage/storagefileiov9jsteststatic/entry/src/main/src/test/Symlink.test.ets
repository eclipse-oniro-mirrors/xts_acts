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

export default function fileIOSymlink() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_symlink", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_symlink start');

    /**
     * @tc.name   fileIO_test_symlink_sync_static_000
     * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_0000
     * @tc.desc   Test symlinkSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_symlink_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_symlink_sync_static_000 start');
      let fpath = await Utils.nextFileName('fileIO_test_symlink_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fs.symlinkSync(fpath, fpath + 'link01');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_symlink_sync_static_000 has failed for' + JSON.stringify(e));
        expect(e.message == 'Permission denied').assertTrue();
        fs.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_symlink_async_static_001
     * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0100
     * @tc.desc   Test SymlinkAsync interfaces. await Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_symlink_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_symlink_async_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_symlink_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        await fs.symlink(fpath, fpath + 'link2');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_symlink_async_static_001 has failed for' + JSON.stringify(e));
        expect(e.message == 'Permission denied').assertTrue();
        fs.unlinkSync(fpath);
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_symlink_async_static_002
     * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0200
     * @tc.desc   Test SymlinkAsync interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_symlink_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_symlink_async_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.symlink(fpath,  fpath + 'link3', (err: BusinessError | null) => {
          if (err) {
            fs.unlinkSync(fpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_symlink_async_static_002 error: message: ' + err.message );
            expect(err.message == 'Permission denied').assertTrue();
            done();
          }
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_symlink_async_static_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });
  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_symlink end');
}