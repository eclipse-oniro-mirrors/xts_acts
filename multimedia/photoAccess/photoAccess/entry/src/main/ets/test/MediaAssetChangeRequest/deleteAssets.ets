/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { genRadomStr, } from '../../../../../../../common';

export default function deleteAssetsChangeRequestTest() {
  describe('deleteAssetsChangeRequestTest', function () {
    let context = globalThis.abilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(context);

    const createFileUriList = async (count) => {
      try {
        const uriList: Array<string> = new Array();
        for (let i = 0; i < count; i++) {
          let title = genRadomStr(10);
          let asset = await helper.createAsset(title + '.jpg');
          let fd = await asset.open('rw');
          await asset.close(fd);
          uriList.push(asset.uri);
        }
        return uriList;
      } catch (error) {
        console.error(`createFileUriList failed with error: ${error}`);
      }
    };

    const createFileObjList = async (count) => {
      try {
        const objList: Array<photoAccessHelper.PhotoAsset> = new Array();
        for (let i = 0; i < count; i++) {
          let title = genRadomStr(10);
          let asset = await helper.createAsset(title + '.jpg');
          let fd = await asset.open('rw');
          await asset.close(fd);
          objList.push(asset);
        }
        return objList;
      } catch (error) {
        console.error(`createFileObjList failed with error: ${error}`);
      }
    };

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_DELETE_ASSETS_URI_CHANGE_REQUEST_0000
     * @tc.name      : delete_assets_uri_change_request_000
     * @tc.desc      : delete 1 asset by uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('delete_assets_uri_change_request_000', 0, async function (done) {
      const testNum = 'delete_assets_uri_change_request_000';
      try {
        let uriList = await createFileUriList(1);
        console.info(`${testNum} uriList: ${JSON.stringify(uriList)}`)
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(context, uriList);
        console.info(`${testNum} succeed to delete assets by uri`)
        done();
      } catch (error) {
        console.error(`${testNum} failed with error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_DELETE_ASSETS_URI_CHANGE_REQUEST_0100
     * @tc.name      : delete_assets_uri_change_request_001
     * @tc.desc      : delete 5 assets by uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('delete_assets_uri_change_request_001', 2, async function (done) {
      const testNum = 'delete_assets_uri_change_request_001';
      try {
        let uriList = await createFileUriList(5);
        console.info(`${testNum} uriList: ${JSON.stringify(uriList)}`)
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(context, uriList);
        console.info(`${testNum} succeed to delete assets by uri`)
        done();
      } catch (error) {
        console.error(`${testNum} failed with error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_DELETE_ASSETS_OBJ_CHANGE_REQUEST_0000
     * @tc.name      : delete_assets_obj_change_request_000
     * @tc.desc      : delete 1 asset by object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('delete_assets_obj_change_request_000', 2, async function (done) {
      const testNum = 'delete_assets_obj_change_request_000';
      try {
        let objList = await createFileUriList(1);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(context, objList);
        console.info(`${testNum} succeed to delete assets`);
        done();
      } catch (error) {
        console.error(`${testNum} failed with error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_DELETE_ASSETS_OBJ_CHANGE_REQUEST_0100
     * @tc.name      : delete_assets_obj_change_request_001
     * @tc.desc      : delete 5 assets by object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('delete_assets_obj_change_request_001', 2, async function (done) {
      const testNum = 'delete_assets_obj_change_request_001';
      try {
        let objList = await createFileUriList(5);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(context, objList);
        console.info(`${testNum} succeed to delete assets`);
        done();
      } catch (error) {
        console.error(`${testNum} failed with error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  });
}