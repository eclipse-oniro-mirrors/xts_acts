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

import { describe, it, expect, TestType, Size, Level, Hypium } from "../../../hypium/index";
import Utils from './Util.test';
import hilog from '@ohos.hilog'
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function GetPhotoAccessHelper() {
  describe("GetPhotoAccessHelper", (): void => {
    hilog.info(domain, tag, '%{public}s', 'GetPhotoAccessHelper start');

    /**
     * @tc.name   getPhotoAccessHelper_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_STATIC_0000
     * @tc.desc   Obtains a photoAccess instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getPhotoAccessHelper_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, "getPhotoAccessHelper_static_000", 'test begin');
        try {
          let appContext: Context = Hypium.get("context") as Context;
          const helper = photoAccessHelper.getPhotoAccessHelper(appContext);
          expect(helper !== undefined).assertTrue();
          done();
          hilog.info(0x0000, 'testTag', 'getPhotoAccessHelper_static_000 end');
        } catch (err: Error) {
          hilog.info(0x0000, 'testTag', 'getPhotoAccessHelper_static_000 failed' + err.name + err.message);
          expect(false).assertTrue();
          done();
        }
      })
  })
  hilog.info(domain, tag, '%{public}s', 'GetPhotoAccessHelper end');
}