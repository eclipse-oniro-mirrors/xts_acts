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

import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIORandomAccessFileClose() {
  describe('fileIO_randomAccessFile_close', (): void => {

    /**
     * @tc.name   fileIO_randomaccessfile_close_sync_static_000
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_close_sync_static_0000
     * @tc.desc   Test close() interface. Close the RandomAccessFile object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_randomaccessfile_close_sync_static_000', Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_close_sync_static_000');

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_close_sync_static_000 has failed for ' + err);
        expect(false).assertTrue();
      }
    });

  });
}