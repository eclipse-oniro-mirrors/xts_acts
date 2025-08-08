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
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import { driveFn, genRadomStr, getPermission, sleep, } from '../common';
import common from '@ohos.app.ability.common';

export default function deleteAssetsChangeRequestTest() {
  describe('deleteAssetsChangeRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper:ESObject  = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    const createFileUriList = async (count: number)  => {
      const uriList: Array<string> = new Array();
      try {
        for (let i = 0; i < count; i++) {
          let title = genRadomStr(10);
          let asset:ESObject = await helper.createAsset(title + '.jpg');
          let fd:ESObject = await asset.open('rw');
          await asset.close(fd);
          uriList.push(asset.uri);
        }
        return uriList;
      } catch (error) {
        console.error(`createFileUriList failed with error: ${error}`);
        return uriList;
      }
    };

    const createFileObjList = async (count: number) => {
      const objList: Array<photoAccessHelper.PhotoAsset> = new Array();
      try {
        for (let i = 0; i < count; i++) {
          let title = genRadomStr(10);
          let asset:ESObject = await helper.createAsset(title + '.jpg');
          let fd:ESObject = await asset.open('rw');
          await asset.close(fd);
          objList.push(asset);
        }
        return objList;
      } catch (error) {
        console.error(`createFileObjList failed with error: ${error}`);
        return objList;
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
    it('delete_assets_uri_change_request_000', 0, async (done: Function) => {
      const testNum = 'delete_assets_uri_change_request_000';
      try {
        let uriList = await createFileUriList(1);
        console.info(`${testNum} uriList: ${JSON.stringify(uriList)}`)
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, uriList);
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
    it('delete_assets_uri_change_request_001', 2, async (done: Function) => {
      const testNum = 'delete_assets_uri_change_request_001';
      try {
        let uriList = await createFileUriList(5);
        console.info(`${testNum} uriList: ${JSON.stringify(uriList)}`)
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, uriList);
        console.info(`${testNum} succeed to delete assets by uri`)
        done();
      } catch (error) {
        console.error(`${testNum} failed with error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_DELETE_ASSETS_URI_CHANGE_REQUEST_0200
     * @tc.name      : delete_assets_uri_change_request_002
     * @tc.desc      : delete  assets by []
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
        it('delete_assets_uri_change_request_002', 2, async (done: Function) => {
          const testNum = 'delete_assets_uri_change_request_002';
          try {
            const uriList: Array<string> = new Array();
            console.info(`${testNum} uriList: ${JSON.stringify(uriList)}`)
            await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, uriList);
            console.info(`${testNum} succeed to delete assets by uri`)
            expect(false).assertTrue();
            done();
          } catch (error) {
            console.error(`${testNum} failed with error: ${error}, ${error.code}`);
            expect(error.code).assertEqual('401')
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
    it('delete_assets_obj_change_request_000', 2, async (done: Function) => {
      const testNum = 'delete_assets_obj_change_request_000';
      try {
        let objList = await createFileUriList(1);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, objList);
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
    it('delete_assets_obj_change_request_001', 2, async (done: Function) => {
      const testNum = 'delete_assets_obj_change_request_001';
      try {
        let objList = await createFileUriList(5);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, objList);
        console.info(`${testNum} succeed to delete assets`);
        done();
      } catch (error) {
        console.error(`${testNum} failed with error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_DELETE_ASSETS_OBJ_CHANGE_REQUEST_0200
     * @tc.name      : delete_assets_obj_change_request_002
     * @tc.desc      : delete empty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('delete_assets_obj_change_request_002', 2, async (done: Function) => {
      const testNum = 'delete_assets_obj_change_request_002';
      try {
        const objList: Array<photoAccessHelper.PhotoAsset> = new Array();
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, objList);
        console.info(`${testNum} succeed to delete assets,`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed with error: ${error}, ${error.code}`);
        expect(error.code).assertEqual('401')
        done();
      }
    });
  });
}