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

import { describe, it, expect, TestType, Size, Level, Hypium } from "../../../hypium/index";
import Utils from './Util.test';
import hilog from '@ohos.hilog'
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function PhotoAccessHelperStaticTest() {
  describe("PhotoAccessHelperStaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'PhotoAccessHelperStaticTest start');

    /**
     * @tc.name   PhotoAccessHelperTestStatic001
     * @tc.number SUB_PHOTOACCESS_HELPER_PHOTO_ACCESS_HELPER_TEST_STATIC_0000
     * @tc.desc   Obtains a photoAccess instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("PhotoAccessHelperTestStatic001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', 'test list 111111');
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let path: string = appContext.filesDir;
          hilog.info(0x0000, 'testTag', 'test list appContext.filePath' + path);
          hilog.info(domain, tag, '%{public}s', 'PhotoAccessHelperStaticTest 111111111111');
          let helper = photoAccessHelper.getPhotoAccessHelper(appContext)
          hilog.info(domain, tag, '%{public}s', 'PhotoAccessHelperStaticTest 22222');
          let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
          hilog.info(domain, tag, '%{public}s', 'PhotoAccessHelperStaticTest 5555');
          let options: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
          };
          hilog.info(domain, tag, '%{public}s', 'PhotoAccessHelperStaticTest 3333');
          options.fetchColumns = new Array<string>();
          hilog.info(domain, tag, '%{public}s', 'PhotoAccessHelperStaticTest 444');
          options.predicates = predicates;
          hilog.info(domain, tag, '%{public}s', 'PhotoAccessHelperStaticTest 666');
          let result: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(options);
          hilog.info(domain, tag, '%{public}s', 'PhotoAccessHelperStaticTest 777');
          let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await result.getAllObjects();
          hilog.info(domain, tag, '%{public}s', 'PhotoAccessHelperStaticTest 8888');
          expect(photoAssetList.length).assertLarger(0.0)
          if (photoAssetList != undefined) {
            hilog.info(0x0000, 'testTag', 'getAssets photoAssetList length = ' + photoAssetList.length);
            hilog.info(0x0000, 'testTag', 'getAssets photoAsset uri = ' + photoAssetList[0].uri);
            hilog.info(0x0000, 'testTag', 'getAssets photoAsset displayName = ' + photoAssetList[0].displayName);
            hilog.info(0x0000, 'testTag', 'getAssets photoAsset photoType = ' + photoAssetList[0].photoType);
          }
          hilog.info(0x0000, 'testTag', 'PhotoAccessHelperStaticTest end');
          done();
        } catch (err) {
          hilog.info(0x0000, 'testTag', 'PhotoAccessHelperStaticTest failed' + err.name + err.message);
          expect(false).assertTrue();
          done();
        }
      })
  })
  hilog.info(domain, tag, '%{public}s', 'PhotoAccessHelperStaticTest end');
}