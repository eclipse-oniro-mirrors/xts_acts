/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import fileUri from '@ohos.file.fileuri';
import fileShare from "@ohos.fileshare";
import fs from '@ohos.file.fs';
import type wantConstant from '@ohos.app.ability.wantConstant';
import { AsyncCallback } from "@ohos.base"
import { BusinessError } from "@ohos.base"
let domain: int = 0x0000;
let tag: string = 'testTag';

export const CONTENT = "Hello World!";

export default function GetpathTest() {
  describe('getpathTest', (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileUri_GetPath_0100
     * @tc.name test_Fileuri_Getpath_static_001
     * @tc.desc Function of API, get realPath with docs uri. Test normal function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('test_Fileuri_Getpath_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fileuristr = "file://docs/storage/users/cuurrenUser/Docments/test.txt";
      try {
        let uriOBJ = new fileUri.FileUri(fileuristr);
        expect(uriOBJ !== null && uriOBJ !== undefined).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, `test_Fileuri_Getpath_static_001 has failed for ${JSON.stringify(e)}`);
        expect(false).assertTrue();
      }
    });
    hilog.info(domain, tag, '%{public}s', 'fileuriTest end');
  })
}
