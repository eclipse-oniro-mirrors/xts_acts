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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import { sleep, getPermission, fetchOption, photoKeys, pushCreateAsset, driveFn } from '../common'
import common from '@ohos.app.ability.common'

export default function createAssetRequestTest() {

  describe('createAssetRequestTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);


    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_0000
     * @tc.name      : create_asset_request_000
     * @tc.desc      : create image without options
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('create_asset_request_000', Level.LEVEL0, async (done: Function) => {
      let testNum = 'create_asset_request_000';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        let fetchResult = await helper.getAssets(fetchOps);
        let count = fetchResult.getCount();

        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024));
        await helper.applyChanges(assetChangeRequest);

        fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(count + 1);
        console.info(`${testNum} succeed to create image without options`);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_0100
     * @tc.name      : create_asset_request_001
     * @tc.desc      : create image with options
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('create_asset_request_001', Level.LEVEL2, async (done: Function) => {
      let testNum = 'create_asset_request_001';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        let fetchResult = await helper.getAssets(fetchOps);
        let count = fetchResult.getCount();

        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testImage'
        }
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024));
        await helper.applyChanges(assetChangeRequest);

        fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(count + 1);
        console.info(`${testNum} succeed to create image with options`);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_0200
     * @tc.name      : create_asset_request_002
     * @tc.desc      : create video without options
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('create_asset_request_002', Level.LEVEL2, async (done: Function) => {
      let testNum = 'create_asset_request_002';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        let fetchResult = await helper.getAssets(fetchOps);
        let count = fetchResult.getCount();

        let photoType = photoAccessHelper.PhotoType.VIDEO;
        let extension = 'mp4';
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(4096));
        await helper.applyChanges(assetChangeRequest);

        fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(count + 1);
        console.info(`${testNum} succeed to create video without options`);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_0300
     * @tc.name      : create_asset_request_003
     * @tc.desc      : create video with options
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('create_asset_request_003', Level.LEVEL2, async (done: Function) => {
      let testNum = 'create_asset_request_003';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        let fetchResult = await helper.getAssets(fetchOps);
        let count = fetchResult.getCount();

        let photoType = photoAccessHelper.PhotoType.VIDEO;
        let extension = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testVideo'
        }
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(4096));
        await helper.applyChanges(assetChangeRequest);

        fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(count + 1);
        console.info(`${testNum} succeed to create video with options`);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }) 

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_0400
    * @tc.name      : create_asset_request_004
    * @tc.desc      : create image with extension as ''
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
      it('create_asset_request_004', Level.LEVEL2, async (done: Function) => {
        let testNum = 'create_asset_request_004';
        try {
          let photoType =  photoAccessHelper.PhotoType.IMAGE;
          let extension = '';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testImage'
          }
          let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
          console.info(`${testNum} succeed to create image with options`);
          expect(false).assertTrue()
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}, ${error.code}`);
          expect(error.code).assertEqual('401')
          done();
        }
      })    

  })
}