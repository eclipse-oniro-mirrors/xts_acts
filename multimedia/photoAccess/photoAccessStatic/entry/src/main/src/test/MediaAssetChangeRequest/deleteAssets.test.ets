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

import { describe, it, expect, TestType, Size, Level, Hypium } from "../../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';
import hilog from '@ohos.hilog'
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { genRadomStr } from '../Common.test.ets';

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function deleteAssets() {
  describe("deleteAssets", (): void => {

    /**
     * @tc.name   delete_assets_uri_change_request_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_DELETE_ASSETS_URI_CHANGE_REQUEST_STATIC_0200
     * @tc.desc   delete  assets by []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('delete_assets_uri_change_request_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'delete_assets_uri_change_request_static_002';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          const uriList: Array<string> = new Array<string>();
          console.info(`${testNum} uriList: ${JSON.stringify(uriList)}`)
          await photoAccessHelper.MediaAssetChangeRequest.deleteAssetsToTrashWithUris(appContext, uriList);
          console.info(`${testNum} succeed to delete assets by uri`)
          expect(false).assertTrue();
          done();
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed with error: ${error}, ${error.code}`);
          expect(error.code).assertEqual(401)
          done();
        }
      });

    /**
     * @tc.name   delete_assets_obj_change_request_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_DELETE_ASSETS_OBJ_CHANGE_REQUEST_STATIC_0200
     * @tc.desc   delete empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('delete_assets_obj_change_request_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'delete_assets_obj_change_request_static_002';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          const objList: Array<photoAccessHelper.PhotoAsset> = new Array<photoAccessHelper.PhotoAsset>();
          await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(appContext, objList);
          console.info(`${testNum} succeed to delete assets,`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed with error: ${error}, ${error.code}`);
          expect(error.code).assertEqual(401)
          done();
        }
      });
  })
  hilog.info(domain, tag, '%{public}s', 'MediaAssetChangeRequest end');
}