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

export default function fileIOMkdtemp() {
  describe('fileIO_fs_mkdtemp', (): void => {

    /**
     * @tc.name   fileIO_test_mkdtemp_sync_static_000
     * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0000
     * @tc.desc   Test mkdtempSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mkdtemp_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_sync_static_000');

      try {
        dpath = dpath + 'XXXXXX';
        let res = fs.mkdtempSync(dpath);
        expect(fs.accessSync(res)).assertTrue();
        fs.rmdirSync(res);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_sync_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mkdtemp_sync_static_001
     * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0100
     * @tc.desc   Test mkdtempSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mkdtemp_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_sync_static_000');

      try {
        fs.mkdtempSync(dpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_sync_static_001 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mkdtemp_async_static_000
     * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0000
     * @tc.desc   Test mkdtemp() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mkdtemp_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_async_static_000');

      try {
        dpath = dpath + 'XXXXXX';
        let res = await fs.mkdtemp(dpath);
        expect(fs.accessSync(res)).assertTrue();
        fs.rmdirSync(res);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mkdtemp_async_static_001
     * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0100
     * @tc.desc   Test mkdtemp() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mkdtemp_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_async_static_001');

      try {
        dpath = dpath + 'XXXXXX';
        fs.mkdtemp(dpath, (err: BusinessError | null, res: string | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_001 res' + res);
          // expect(fs.accessSync(res)).assertTrue();
          // fs.rmdirSync(res);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mkdtemp_async_static_002
     * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0200
     * @tc.desc   Test mkdtemp() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mkdtemp_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_async_static_002');

      try {
        await fs.mkdtemp(dpath);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_002 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_mkdtemp_async_static_003
     * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0300
     * @tc.desc   Test mkdtemp() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mkdtemp_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_mkdtemp_async_static_003');

      try {
        fs.mkdtemp(dpath, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_003 error package: ' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_mkdtemp_async_static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}