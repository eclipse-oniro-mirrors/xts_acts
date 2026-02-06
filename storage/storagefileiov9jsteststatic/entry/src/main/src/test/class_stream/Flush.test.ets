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

import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOStreamFlush() {
  describe('fileIO_fs_stream_flush', (): void => {

    /**
     * @tc.name   fileIO_test_stream_flush_sync_static_000
     * @tc.number SUB_DF_FILEIO_STREAM_FLUSH_SYNC_0000
     * @tc.desc   Test the flushSync() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_flush_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_flush_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        expect(sr.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sr.flushSync();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_flush_sync_static_000 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_flush_async_static_000
     * @tc.number SUB_DF_FILEIO_STREAM_FLUSH_ASYNC_0000
     * @tc.desc   Test the flush() interface of class Stream. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_flush_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_flush_async_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        expect(sr.writeSync(FILE_CONTENT) === FILE_CONTENT.length).assertTrue();
        await sr.flush()
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_flush_async_static_000 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_flush_async_static_001
     * @tc.number SUB_DF_FILEIO_STREAM_FLUSH_ASYNC_0100
     * @tc.desc   Test the flush() interface of class Stream. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_flush_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_flush_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        expect(sr.writeSync(FILE_CONTENT) === FILE_CONTENT.length).assertTrue();
        sr.flush((err) => {
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        })
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_flush_async_static_001 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}
