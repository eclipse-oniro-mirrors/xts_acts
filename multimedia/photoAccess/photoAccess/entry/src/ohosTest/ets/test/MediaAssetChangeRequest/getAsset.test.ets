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
import common from '@ohos.app.ability.common';
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import { getPermission,driveFn ,sleep, fetchOption, photoKeys, getAssetCountByMediaSuffix } from '../common';

export default function getAssetChangeRequestTest() {
  describe('getAssetChangeRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let imageNameList: Array<string> = [];
    let videoNameList: Array<string> = [];

    const createAllTypeAssets = async (testNum: string) => {
      try {
        let imageType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let videoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let imageUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.jpg";
        let videoUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.mp4";
        let options: photoAccessHelper.CreateOptions = {
          title: 'testMediaSuffixAsset'
        }
        // create image asset
        let imageTypeList: Array<string> = await helper.getSupportedPhotoFormats(photoAccessHelper.PhotoType.IMAGE);
        console.log(`${testNum} :: imageTypeList len = ${imageTypeList.length}`);
        for (let i = 0; i < imageTypeList.length; i++) {
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, imageType, imageTypeList[i], options);
          assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageUri);
          await helper.applyChanges(assetChangeRequest);
          console.log(`${testNum} :: createAsset imageType = ${imageTypeList[i]} success !`)
          let assetName: string = 'testMediaSuffixAsset.' + imageTypeList[i];
          imageNameList.push(assetName);
        }
        // create video asset
        let videoTypeList: Array<string> = await helper.getSupportedPhotoFormats(photoAccessHelper.PhotoType.VIDEO);
        console.log(`${testNum} :: videoTypeList len = ${videoTypeList.length}`);
        for (let j = 0; j < videoTypeList.length; j++) {
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, videoType, videoTypeList[j], options);
          assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoUri);
          await helper.applyChanges(assetChangeRequest);
          console.log(`${testNum} :: createAsset videoType = ${videoTypeList[j]} success !`)
          let assetName: string = 'testMediaSuffixAsset.' + videoTypeList[j];
          videoNameList.push(assetName);
        }
      } catch (error) {
        console.error(`${testNum} :: createAsset failed ! error = ${error}`);
      }
    }

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
      await createAllTypeAssets("getAsset_by_mediaSuffix_test_001");
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_ASSET_CHANGE_REQUEST_0000
     * @tc.name      : get_asset_change_request_000
     * @tc.desc      : get asset in MediaAssetChangeRequest
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('get_asset_change_request_000', Level.LEVEL0, async (done: Function) => {
      let testNum = 'get_asset_change_request_000';
      try {
        let asset = await helper.createAsset(testNum + '.jpg');
        let fd = await asset.open('rw');
        await asset.close(fd);

        let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        expect(assetChangeRequest.getAsset().uri).assertEqual(asset.uri);
        expect(assetChangeRequest.getAsset().photoType).assertEqual(asset.photoType);
        expect(assetChangeRequest.getAsset().displayName).assertEqual(asset.displayName);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_ASSET_CHANGE_REQUEST_0100
     * @tc.name      : get_asset_change_request_001
     * @tc.desc      : get asset before/after applyChanges
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_asset_change_request_001', Level.LEVEL2, async (done: Function) => {
      let testNum = 'get_asset_change_request_001';
      try {
        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        expect(assetChangeRequest.getAsset()).assertEqual(null);

        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1000));
        await helper.applyChanges(assetChangeRequest);
        let asset = assetChangeRequest.getAsset();
        if (asset === null || asset === undefined || !asset.uri.match('file://media/Photo')) {
          console.error(`${testNum} failed to get asset after applyChanges`);
          expect(false).assertTrue();
        }
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_getAsset_By_MediaSuffix_001
     * @tc.name      : get_asset_by_mediaSuffix_jpg_001
     * @tc.desc      : get asset by jpg suffix
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("get_asset_by_mediaSuffix_jpg_001", Level.LEVEL2, async (done: Function) => {
      const testNum: string = "get_asset_by_mediaSuffix_jpg_001";
      try {
        let assetCountFormatJpg: number = await getAssetCountByMediaSuffix(testNum, helper, "jpg");
        const ops: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.MEDIA_SUFFIX, "jpg");
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(ops);
        console.log(`${testNum} :: fetchResult is undefined ? ${fetchResult === undefined}`);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResult count = ${fetchResult.getCount()}, assetCountFormatJpg = ${assetCountFormatJpg}`);
        expect(fetchResult.getCount()).assertEqual(assetCountFormatJpg);
        done();
      } catch (error) {
        console.error(`${testNum} :: getAsset By jpg failed ! error = ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_getAsset_By_MediaSuffix_002
     * @tc.name      : get_asset_by_mediaSuffix_mp4_001
     * @tc.desc      : get asset by mp4 suffix
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("get_asset_by_mediaSuffix_mp4_001", Level.LEVEL2, async (done: Function) => {
      const testNum: string = "get_asset_by_mediaSuffix_mp4_001";
      try {
        const ops: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.MEDIA_SUFFIX, "mp4");
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(ops);
        console.log(`${testNum} :: fetchResult is undefined ? ${fetchResult === undefined}`);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResult count = ${fetchResult.getCount()}`);
        let videoTypeList: Array<string> = await helper.getSupportedPhotoFormats(photoAccessHelper.PhotoType.VIDEO);
        // device not support mp4
        if (!videoTypeList.includes("mp4")) {
          console.log(`${testNum} :: This device not support video format mp4 !`);
          expect(fetchResult.getCount()).assertEqual(0);
        } else {
          let videoCount: number = await getAssetCountByMediaSuffix(testNum, helper, "mp4");
          expect(fetchResult.getCount()).assertEqual(videoCount);
        }
        done();
      } catch (error) {
        console.error(`${testNum} :: getAsset By jpg failed ! error = ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_getAsset_By_MediaSuffix_003
     * @tc.name      : getAsset_allTypes_imageAndVideo_test_001
     * @tc.desc      : get allType asset mediaSuffix
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("getAsset_allTypes_imageAndVideo_test_001", Level.LEVEL0, async (done: Function) => {
      let testNum: string = "getAsset_allTypes_imageAndVideo_test_001";
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let assetNameList: Array<string> = [...imageNameList, ...videoNameList];
        predicates.in(photoKeys.DISPLAY_NAME, assetNameList);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [
            photoKeys.DISPLAY_NAME,
            photoKeys.MEDIA_SUFFIX
          ],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResult not equal to undefined .`);
        expect(fetchResult.getCount()).assertEqual(assetNameList.length);
        console.log(`${testNum} :: fetchResult count = ${fetchResult.getCount()}, assetNameList len = ${assetNameList.length}`);
        let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        for (let i = 0; i < photoAssetList.length; i++) {
          let photoAsset: photoAccessHelper.PhotoAsset = photoAssetList[i];
          let suffix: string = (photoAsset.displayName).substring(((photoAsset.displayName).lastIndexOf(".") + 1), photoAsset.displayName.length);
          console.log(`${testNum} :: get PhotoAsset ${photoAsset.displayName} mediaSuffix = ${suffix}`);
          let mediaSuffix: string = photoAsset.get(photoAccessHelper.PhotoKeys.MEDIA_SUFFIX).toString();
          console.log(`${testNum} :: get  get PhotoAsset suffix key value = ${mediaSuffix}`);
          expect(mediaSuffix).assertEqual(suffix);
        }
        done();
      } catch (error) {
        console.log(`${testNum} :: get allTypes image and video failed ! error = ${error} `);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_getAsset_By_MediaSuffix_004
     * @tc.name      : getAsset_orderByMediaSuffixAsc_test_001
     * @tc.desc      : get allType image orderBy mediaSuffix Asc
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("getAsset_orderByMediaSuffixAsc_test_001", Level.LEVEL0, async (done: Function) => {
      let testNum: string = "getAsset_orderByMediaSuffixAsc_test_001";
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(photoKeys.DISPLAY_NAME, imageNameList);
        predicates.orderByAsc(photoKeys.MEDIA_SUFFIX);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [
            photoKeys.DISPLAY_NAME,
            photoKeys.MEDIA_SUFFIX
          ],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResult not equal to undefined .`);
        expect(fetchResult.getCount()).assertEqual(imageNameList.length);
        console.log(`${testNum} :: fetchResult count = ${fetchResult.getCount()}, assetNameList len = ${imageNameList.length}`);
        let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        let imageNameSortList: Array<string> = imageNameList.sort();
        for (let i = 0; i < photoAssetList.length; i++) {
          let photoAsset: photoAccessHelper.PhotoAsset = photoAssetList[i];
          console.log(`${testNum} :: expect ${photoAsset.get(photoKeys.DISPLAY_NAME)} equals to ${imageNameSortList[i]}`);
          expect(photoAsset.get(photoKeys.DISPLAY_NAME).toString()).assertEqual(imageNameSortList[i]);
        }
        done();
      } catch (error) {
        console.log(`${testNum} :: order image by Asc  failed ! error = ${error} `);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_getAsset_By_MediaSuffix_005
     * @tc.name      : getAsset_orderByMediaSuffixDesc_test_002
     * @tc.desc      : get allType image orderBy mediaSuffix Desc
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("getAsset_orderByMediaSuffixDesc_test_002", Level.LEVEL0, async (done: Function) => {
      let testNum: string = "getAsset_orderByMediaSuffixDesc_test_002";
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(photoKeys.DISPLAY_NAME, imageNameList);
        predicates.orderByDesc(photoKeys.MEDIA_SUFFIX);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [
            photoKeys.DISPLAY_NAME,
            photoKeys.MEDIA_SUFFIX
          ],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResult not equal to undefined .`);
        expect(fetchResult.getCount()).assertEqual(imageNameList.length);
        console.log(`${testNum} :: fetchResult count = ${fetchResult.getCount()}, assetNameList len = ${imageNameList.length}`);
        let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        let imageNameSortList: Array<string> = imageNameList.sort();
        console.log(`${testNum} :: `)
        for (let i = 0; i < photoAssetList.length; i++) {
          let photoAsset: photoAccessHelper.PhotoAsset = photoAssetList[i];
          console.log(`${testNum} :: expect ${photoAsset.get(photoKeys.DISPLAY_NAME)} equals to ${imageNameSortList[imageNameSortList.length - i - 1]}`);
          expect(photoAsset.get(photoKeys.DISPLAY_NAME).toString()).assertEqual(imageNameSortList[imageNameSortList.length - i - 1]);
        }
        done();
      } catch (error) {
        console.log(`${testNum} :: order image by Desc  failed ! error = ${error} `);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_getAsset_By_MediaSuffix_006
     * @tc.name      : getAsset_orderByMediaSuffixAsc_test_003
     * @tc.desc      : get allType video orderBy mediaSuffix Asc
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("getAsset_orderByMediaSuffixAsc_test_003", Level.LEVEL0, async (done: Function) => {
      let testNum: string = "getAsset_orderByMediaSuffixAsc_test_003";
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(photoKeys.DISPLAY_NAME, videoNameList);
        predicates.orderByAsc(photoKeys.MEDIA_SUFFIX);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [
            photoKeys.DISPLAY_NAME,
            photoKeys.MEDIA_SUFFIX
          ],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResult not equal to undefined .`);
        expect(fetchResult.getCount()).assertEqual(videoNameList.length);
        console.log(`${testNum} :: fetchResult count = ${fetchResult.getCount()}, assetNameList len = ${videoNameList.length}`);
        let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        let videoNameSortList: Array<string> = videoNameList.sort();
        for (let i = 0; i < photoAssetList.length; i++) {
          let photoAsset: photoAccessHelper.PhotoAsset = photoAssetList[i];
          console.log(`${testNum} :: expect ${photoAsset.get(photoKeys.DISPLAY_NAME)} equals to ${videoNameSortList[i]}`);
          expect(photoAsset.get(photoKeys.DISPLAY_NAME).toString()).assertEqual(videoNameSortList[i]);
        }
        done();
      } catch (error) {
        console.log(`${testNum} :: order video by Asc  failed ! error = ${error} `);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_getAsset_By_MediaSuffix_007
     * @tc.name      : getAsset_orderByMediaSuffixDesc_test_004
     * @tc.desc      : get allType video orderBy mediaSuffix Desc
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("getAsset_orderByMediaSuffixDesc_test_004", Level.LEVEL0, async (done: Function) => {
      let testNum: string = "getAsset_orderByMediaSuffixDesc_test_004";
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(photoKeys.DISPLAY_NAME, videoNameList);
        predicates.orderByDesc(photoKeys.MEDIA_SUFFIX);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [
            photoKeys.DISPLAY_NAME,
            photoKeys.MEDIA_SUFFIX
          ],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResult not equal to undefined .`);
        expect(fetchResult.getCount()).assertEqual(videoNameList.length);
        console.log(`${testNum} :: fetchResult count = ${fetchResult.getCount()}, assetNameList len = ${videoNameList.length}`);
        let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        let videoNameSortList: Array<string> = videoNameList.sort();
        console.log(`${testNum} :: `)
        for (let i = 0; i < photoAssetList.length; i++) {
          let photoAsset: photoAccessHelper.PhotoAsset = photoAssetList[i];
          console.log(`${testNum} :: expect ${photoAsset.get(photoKeys.DISPLAY_NAME)} equals to ${videoNameSortList[videoNameSortList.length - i - 1]}`);
          expect(photoAsset.get(photoKeys.DISPLAY_NAME).toString()).assertEqual(videoNameSortList[videoNameSortList.length - i - 1]);
        }
        done();
      } catch (error) {
        console.log(`${testNum} :: order video by Desc  failed ! error = ${error} `);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_getAsset_By_MediaSuffix_008
     * @tc.name      : getAsset_orderByMediaSuffixAsc_test_005
     * @tc.desc      : get allType image & video orderBy mediaSuffix Asc
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("getAsset_orderByMediaSuffixAsc_test_005", Level.LEVEL0, async (done: Function) => {
      let testNum: string = "getAsset_orderByMediaSuffixAsc_test_005";
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let assetNameList: Array<string> = [...imageNameList, ...videoNameList];
        predicates.in(photoKeys.DISPLAY_NAME, assetNameList);
        predicates.orderByAsc(photoKeys.MEDIA_SUFFIX);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [
            photoKeys.DISPLAY_NAME,
            photoKeys.MEDIA_SUFFIX
          ],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResult not equal to undefined .`);
        expect(fetchResult.getCount()).assertEqual(assetNameList.length);
        console.log(`${testNum} :: fetchResult count = ${fetchResult.getCount()}, assetNameList len = ${assetNameList.length}`);
        let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        let assetNameSortList: Array<string> = assetNameList.sort();
        console.log(`${testNum} :: `)
        for (let i = 0; i < photoAssetList.length; i++) {
          let photoAsset: photoAccessHelper.PhotoAsset = photoAssetList[i];
          console.log(`${testNum} :: expect ${photoAsset.get(photoKeys.DISPLAY_NAME)} equals to ${assetNameSortList[i]}`);
          expect(photoAsset.get(photoKeys.DISPLAY_NAME).toString()).assertEqual(assetNameSortList[i]);
        }
        done();
      } catch (error) {
        console.log(`${testNum} :: order video by Desc  failed ! error = ${error} `);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_getAsset_By_MediaSuffix_009
     * @tc.name      : getAsset_orderByMediaSuffixDesc_test_006
     * @tc.desc      : get allType image & video orderBy mediaSuffix Desc
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("getAsset_orderByMediaSuffixDesc_test_006", Level.LEVEL0, async (done: Function) => {
      let testNum: string = "getAsset_orderByMediaSuffixDesc_test_006";
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let assetNameList: Array<string> = [...imageNameList, ...videoNameList];
        predicates.in(photoKeys.DISPLAY_NAME, assetNameList);
        predicates.orderByDesc(photoKeys.MEDIA_SUFFIX);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [
            photoKeys.DISPLAY_NAME,
            photoKeys.MEDIA_SUFFIX
          ],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResult not equal to undefined .`);
        expect(fetchResult.getCount()).assertEqual(assetNameList.length);
        console.log(`${testNum} :: fetchResult count = ${fetchResult.getCount()}, assetNameList len = ${assetNameList.length}`);
        let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        let assetNameSortList: Array<string> = assetNameList.sort();
        for (let i = 0; i < photoAssetList.length; i++) {
          let photoAsset: photoAccessHelper.PhotoAsset = photoAssetList[i];
          console.log(`${testNum} :: expect ${photoAsset.get(photoKeys.DISPLAY_NAME)} equals to ${assetNameSortList[assetNameSortList.length - i - 1]}`);
          expect(photoAsset.get(photoKeys.DISPLAY_NAME).toString()).assertEqual(assetNameSortList[assetNameSortList.length - i - 1]);
        }
        done();
      } catch (error) {
        console.log(`${testNum} :: order video by Desc  failed ! error = ${error} `);
        expect(false).assertTrue();
        done();
      }
    })

  })
}