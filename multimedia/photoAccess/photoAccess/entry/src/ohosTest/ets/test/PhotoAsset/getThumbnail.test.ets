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
import image from '@ohos.multimedia.image';
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { photoKeys, fetchOption, getFileAsset, getPermission, driveFn, sleep, pushCreateAsset, createMovingPhoto, albumSubtype, albumType } from '../common'
import common from '@ohos.app.ability.common';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import fileio from "@ohos.fileio";

export default function getThumbnailTest() {

  const fileNameList = ["getThumb.jpg", "getThumb.mp4"];

  describe('getThumbnailTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper:ESObject  = photoAccessHelper.getPhotoAccessHelper(testContext);
    let getAsset = async (testNum: string, key: string, value: string | number) => {
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(key, value);
      const ops: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(ops);
      console.info(`${testNum} asset count is: ${fetchResult.getCount()}`);
      const asset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
      fetchResult.close();
      return asset
    }
    let getAlbum = async (testNum: string, type: photoAccessHelper.AlbumType, subtype: photoAccessHelper.AlbumSubtype) => {
      let predicatesAlbum: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptionsAlbum: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicatesAlbum
      };
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
      await helper.getAlbums(type, subtype, fetchOptionsAlbum);
      console.info(testNum + ' album count is ' + albumFetchResult.getCount());
      let album: photoAccessHelper.Album = await albumFetchResult.getLastObject();
      return album;
    }
    let getAlbumAssets = async (testNum: string, album: photoAccessHelper.Album, key: string, value: string | number) => {
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(key, value);
      const ops: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      const fetchResult = await album.getAssets(ops);
      console.info(`${testNum} asset count is: ${fetchResult.getCount()}`);
      const asset = await fetchResult.getLastObject();
      fetchResult.close();
      return asset
    }
     let getThumbnailCallback1 = async(done: Function, testNum: string, fetchOps: ESObject) => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        asset.getThumbnail(async (err, pixelMap) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const info = await pixelMap.getImageInfo();
              const defaultSize: ESObject = { width: 256, height: 256 };
              expect(info.size.width).assertEqual(defaultSize.width);
              expect(info.size.height).assertEqual(defaultSize.height);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

     let getThumbnailCallback2 = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject, expectSize: ESObject) => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        asset.getThumbnail(size, async (err, pixelMap) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const info = await pixelMap.getImageInfo();
              expect(info.size.width).assertEqual(expectSize.width);
              expect(info.size.height).assertEqual(expectSize.height);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

     let getThumbnailCallbackAbnormal = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        asset.getThumbnail(size, async (err, pixelMap) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
          } else {
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    }

     let getThumbnailCallbackNormal = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject) =>  {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        asset.getThumbnail(size, async (err, pixelMap) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
          } else {
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

     let getThumbnailPromise1= async(done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        const pixelMap = await asset.getThumbnail();
        console.info(`${testNum} pixelMap: ${pixelMap}`);
        const info = await pixelMap.getImageInfo();
        const defaultSize: ESObject = { width: 256, height: 256 };
        expect(info.size.width).assertEqual(defaultSize.width);
        expect(info.size.height).assertEqual(defaultSize.height);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

     let getThumbnailPromise2 = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: image.Size, expectSize: ESObject) => {
      try {
        let asset: photoAccessHelper.PhotoAsset;
        asset = await getFileAsset(testContext, testNum, fetchOps);
        let pixelMap: image.PixelMap;
        pixelMap = await asset.getThumbnail(size);
        console.info(`${testNum} pixelMap: ${pixelMap}`);
        const info = await pixelMap.getImageInfo();
        expect(info.size.width).assertEqual(expectSize.width);
        expect(info.size.height).assertEqual(expectSize.height);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

     let getThumbnailPromiseAbnormal = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject) => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await asset.getThumbnail(size);
        expect(false).assertTrue()
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    }

    let getThumbnailPromiseNormal = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject) => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await asset.getThumbnail(size);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
      await pushCreateAsset(testContext, fileNameList);
    });

    //callback
    //image
    /**
     * @tc.name   getThumbnail_callback_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0000
     * @tc.desc   getThumbnail(image) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_000';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      await getThumbnailCallback1(done, testNum, fetchOps);
    });

    /**
     * @tc.name   getThumbnail_callback_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0100
     * @tc.desc   getThumbnail(image) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_callback_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 128, height: 128
      };
      const expectSize: ESObject = {
        width: 128, height: 128
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0200
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_002';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 1, height: 1024
      };
      const expectSize: ESObject = {
        width: 1, height: 1024
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0300
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_003';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 1024, height: 1
      };
      const expectSize: ESObject = {
        width: 1024, height: 1
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_004
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0400
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 1024, height: 1024
      };
      const expectSize: ESObject = {
        width: 1024, height: 1024
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_005
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0500
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_005';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 1, height: 1
      };
      const expectSize: ESObject = {
        width: 1, height: 1
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_006
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0600
     * @tc.desc   getThumbnail(image) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_006';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        height: 128
      };
      const expectSize: ESObject = {
        width: 256, height: 128
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_007
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0700
     * @tc.desc   getThumbnail(image) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_007';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 128
      };
      const expectSize: ESObject = {
        width: 128, height: 256
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_008
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0800
     * @tc.desc   getThumbnail(image) by undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_008';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = undefined;
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.name   getThumbnail_callback_009
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0900
     * @tc.desc   getThumbnail(image) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_009';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 0, height: 0
      };
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.name   getThumbnail_callback_010
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1000
     * @tc.desc   getThumbnail(image) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_010', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_010';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: -1, height: -1
      };
      await getThumbnailCallbackNormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.name   getThumbnail_callback_011
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1100
     * @tc.desc   getThumbnail(image) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_011', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_011';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 99999, height: 99999
      };
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });

    //video
    /**
     * @tc.name   getThumbnail_callback_012
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1200
     * @tc.desc   getThumbnail(video) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_callback_012', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_012';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      await getThumbnailCallback1(done, testNum, fetchOps);
    });

    /**
     * @tc.name   getThumbnail_callback_013
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1300
     * @tc.desc   getThumbnail(video) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_callback_013', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_013';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 128, height: 128
      };
      const expectSize: ESObject = {
        width: 128, height: 128
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_014
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1400
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_014', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_014';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 1, height: 1024
      };
      const expectSize: ESObject = {
        width: 1, height: 1024
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_015
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1500
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_015', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_015';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 1024, height: 1
      };
      const expectSize: ESObject = {
        width: 1024, height: 1
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_016
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1600
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_016', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_016';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 1024, height: 1024
      };
      const expectSize: ESObject = {
        width: 1024, height: 1024
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_017
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1700
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_017', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_017';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 1, height: 1
      };
      const expectSize: ESObject = {
        width: 1, height: 1
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_018
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1800
     * @tc.desc   getThumbnail(video) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_018', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_018';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        height: 128
      };
      const expectSize: ESObject = {
        width: 256, height: 128
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_019
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1900
     * @tc.desc   getThumbnail(video) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_019', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_019';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 128
      };
      const expectSize: ESObject = {
        width: 128, height: 256
      };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_callback_020
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2000
     * @tc.desc   getThumbnail(video) by undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_020', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_020';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = undefined;
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.name   getThumbnail_callback_021
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2100
     * @tc.desc   getThumbnail(video) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_021', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_021';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 0, height: 0
      };
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.name   getThumbnail_callback_022
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2200
     * @tc.desc   getThumbnail(video) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_022', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_022';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: -1, height: -1
      };
      await getThumbnailCallbackNormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.name   getThumbnail_callback_023
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2300
     * @tc.desc   getThumbnail(video) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_023', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_023';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 99999, height: 99999
      };
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2400
     * @tc.name   getThumbnail_callback_024
     * @tc.desc   getThumbnail(moving photo) by no size
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getThumbnail_callback_024', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_024';
      const title = 'getThumbnail_callback_24';
      await createMovingPhoto(testNum, testContext, title)
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.TITLE, title);
      try {
        await getThumbnailCallback1(done, testNum, fetchOps);
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2500
     * @tc.name   getThumbnail_callback_025
     * @tc.desc   getThumbnail(trash asset) by no size
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getThumbnail_callback_025', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_025';
      const displayNames = ['getThumbnail_callback_25.jpg'];
      try {
        await pushCreateAsset(testContext, displayNames);
        let asset: photoAccessHelper.PhotoAsset = await getAsset(testNum, photoKeys.DISPLAY_NAME, displayNames[0]);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
        let tAlbum: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.TRASH);
        asset = await getAlbumAssets(testNum, tAlbum, photoKeys.DISPLAY_NAME, displayNames[0]);
        asset.getThumbnail(async (err, pixelMap) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const info = await pixelMap.getImageInfo();
              const defaultSize: ESObject = { width: 256, height: 256 };
              expect(info.size.width).assertEqual(defaultSize.width);
              expect(info.size.height).assertEqual(defaultSize.height);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2600
     * @tc.name   getThumbnail_callback_026
     * @tc.desc   getThumbnail(hidden asset) by no size
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getThumbnail_callback_026', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_026';
      const displayNames = ['getThumbnail_callback_26.jpg'];
      try {
        await pushCreateAsset(testContext, displayNames);
        let asset: photoAccessHelper.PhotoAsset = await getAsset(testNum, photoKeys.DISPLAY_NAME, displayNames[0]);
        await asset.setHidden(true);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper.getHiddenAlbums(photoAccessHelper.HiddenPhotosDisplayMode.ASSETS_MODE);
        console.info(testNum + 'album count is : ' + fetchResult.getCount());
        let album: photoAccessHelper.Album = await fetchResult.getLastObject();
        asset = await getAlbumAssets(testNum, album, photoKeys.DISPLAY_NAME, displayNames[0]);
        asset.getThumbnail(async (err, pixelMap) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const info = await pixelMap.getImageInfo();
              const defaultSize: ESObject = { width: 256, height: 256 };
              expect(info.size.width).assertEqual(defaultSize.width);
              expect(info.size.height).assertEqual(defaultSize.height);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2700
     * @tc.name   getThumbnail_callback_027
     * @tc.desc   getThumbnail(deleted asset) by no size
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getThumbnail_callback_027', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_027';
      const displayNames = ['getThumbnail_callback_27.jpg'];
      try {
        await pushCreateAsset(testContext, displayNames);
        let asset: photoAccessHelper.PhotoAsset = await getAsset(testNum, photoKeys.DISPLAY_NAME, displayNames[0]);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
        let tAlbum: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.TRASH);
        asset = await getAlbumAssets(testNum, tAlbum, photoKeys.DISPLAY_NAME, displayNames[0]);
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(tAlbum);
        albumChangeRequest.deleteAssets([asset]);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} delete asset success`);
        await sleep(1000);
        for (let i = 0; i < 20; i++) {
          asset.getThumbnail(async (err, pixelMap) => {
            try {
              if (err) {
                console.info(`${testNum} err: ${err.code}`);
                expect(err.code == 3).assertTrue();
              } else {
                const info = await pixelMap.getImageInfo();
                console.info(`${testNum} size: ${info.size.width} ${info.size.height}`);
                // expect(false).assertTrue();
              }
            } catch (error) {
              console.info(`${testNum} error: ${error.code}`);
            }
          })
          await sleep(500);
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2800
     * @tc.name   getThumbnail_callback_028
     * @tc.desc   getThumbnail(damaged asset) by no size
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getThumbnail_callback_028', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_028';
      const displayNames = ['getThumbnail_callback_28.jpg'];
      try {
        let asset: photoAccessHelper.PhotoAsset = await helper.createAsset(displayNames[0]);
        let fd = await asset.open('rw');
        await fileio.write(fd, '1111');
        await asset.close(fd);
        asset.getThumbnail(async (err, pixelMap) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err.code}`);
              expect(err.code == 3).assertTrue();
            } else {
              expect(false).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error.code}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2900
     * @tc.name   getThumbnail_callback_029
     * @tc.desc   getThumbnail(moving photo) by { width: 128, height: 128 }
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getThumbnail_callback_029', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_029';
      const title = 'getThumbnail_callback_29';
      await createMovingPhoto(testNum, testContext, title)
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.TITLE, title);
      const size: ESObject = {
        width: 128, height: 128
      };
      const expectSize: ESObject = {
        width: 128, height: 128
      };
      try {
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_3000
     * @tc.name   getThumbnail_callback_030
     * @tc.desc   getThumbnail(trash asset) by { width: 128, height: 128 }
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getThumbnail_callback_030', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_030';
      const displayNames = ['getThumbnail_callback_030.jpg'];
      try {
        await pushCreateAsset(testContext, displayNames);
        let asset: photoAccessHelper.PhotoAsset = await getAsset(testNum, photoKeys.DISPLAY_NAME, displayNames[0]);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
        let tAlbum: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.TRASH);
        asset = await getAlbumAssets(testNum, tAlbum, photoKeys.DISPLAY_NAME, displayNames[0]);
        const size: image.Size = {
          width: 128, height: 128
        };
        asset.getThumbnail(size, async (err, pixelMap) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const info = await pixelMap.getImageInfo();
              expect(info.size.width).assertEqual(size.width);
              expect(info.size.height).assertEqual(size.height);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_3100
     * @tc.name   getThumbnail_callback_031
     * @tc.desc   getThumbnail(hidden asset) by { width: 128, height: 128 }
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getThumbnail_callback_031', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_031';
      const displayNames = ['getThumbnail_callback_31.jpg'];
      try {
        await pushCreateAsset(testContext, displayNames);
        let asset: photoAccessHelper.PhotoAsset = await getAsset(testNum, photoKeys.DISPLAY_NAME, displayNames[0]);
        await asset.setHidden(true);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper.getHiddenAlbums(photoAccessHelper.HiddenPhotosDisplayMode.ASSETS_MODE);
        console.info(testNum + 'album count is : ' + fetchResult.getCount());
        let album: photoAccessHelper.Album = await fetchResult.getLastObject();
        asset = await getAlbumAssets(testNum, album, photoKeys.DISPLAY_NAME, displayNames[0]);
        const size: image.Size = {
          width: 128, height: 128
        };
        asset.getThumbnail(size, async (err, pixelMap) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const info = await pixelMap.getImageInfo();
              expect(info.size.width).assertEqual(size.width);
              expect(info.size.height).assertEqual(size.height);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_3200
     * @tc.name   getThumbnail_callback_032
     * @tc.desc   getThumbnail(damaged asset) by { width: 128, height: 128 }
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('getThumbnail_callback_032', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_callback_032';
      const displayNames = ['getThumbnail_callback_32.jpg'];
      try {
        let asset: photoAccessHelper.PhotoAsset = await helper.createAsset(displayNames[0]);
        let fd = await asset.open('rw');
        await fileio.write(fd, '1111');
        await asset.close(fd);
        const size: image.Size = {
          width: 128, height: 128
        };
        asset.getThumbnail(size, async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err.code}`);
              expect(err.code == 3).assertTrue();
            } else {
              expect(false).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error.code}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_3300
     * @tc.name   getThumbnail_callback_033
     * @tc.desc   getThumbnail(deleted asset) by { width: 128, height: 128 }
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getThumbnail_callback_033', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_callback_033';
      const displayNames = ['getThumbnail_callback_33.jpg'];
      try {
        await pushCreateAsset(testContext, displayNames);
        let asset: photoAccessHelper.PhotoAsset = await getAsset(testNum, photoKeys.DISPLAY_NAME, displayNames[0]);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
        let tAlbum: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.TRASH);
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(tAlbum);
        albumChangeRequest.deleteAssets([asset]);
        await helper.applyChanges(albumChangeRequest);
        const size: image.Size = {
          width: 128, height: 128
        };
        await sleep(1000);
        asset.getThumbnail(size, async (err, pixelMap) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err.code}`);
              expect(err.code == 3).assertTrue();
            } else {
              const info = await pixelMap.getImageInfo();
              console.info(`${testNum} size: ${info.size.width} ${info.size.height}`);
              // expect(false).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    //promise
    //image
    /**
     * @tc.name   getThumbnail_promise_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0000
     * @tc.desc   getThumbnail(image) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_promise_000';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      await getThumbnailPromise1(done, testNum, fetchOps);
    });

    /**
     * @tc.name   getThumbnail_promise_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0100
     * @tc.desc   getThumbnail(image) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_promise_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 128, height: 128
      };
      const expectSize: ESObject = {
        width: 128, height: 128
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_002
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0200
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_002';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 1, height: 1024
      };
      const expectSize: ESObject = {
        width: 1, height: 1024
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_003
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0300
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_003';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 1024, height: 1
      };
      const expectSize: ESObject = {
        width: 1024, height: 1
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_004
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0400
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 1024, height: 1024
      };
      const expectSize: ESObject = {
        width: 1024, height: 1024
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_005
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0500
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_005';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 1, height: 1
      };
      const expectSize: ESObject = {
        width: 1, height: 1
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_006
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0600
     * @tc.desc   getThumbnail(image) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_006';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: undefined, height: 128
      };
      const expectSize: ESObject = {
        width: 256, height: 128
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_007
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0700
     * @tc.desc   getThumbnail(image) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_007';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 128, height: undefined
      };
      const expectSize: ESObject = {
        width: 128, height: 256
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_008
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0800
     * @tc.desc   getThumbnail(image) by undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_008';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = undefined;
      const expectSize: ESObject = {
        width: 256, height: 256
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_009
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0900
     * @tc.desc   getThumbnail(image) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_009';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 0, height: 0
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.name   getThumbnail_promise_010
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1000
     * @tc.desc   getThumbnail(image) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_010', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_010';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: -1, height: -1
      };
      await getThumbnailPromiseNormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.name   getThumbnail_promise_011
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1100
     * @tc.desc   getThumbnail(image) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_011', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_011';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: ESObject = {
        width: 99999, height: 99999
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
    });

    //video
    /**
     * @tc.name   getThumbnail_promise_012
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1200
     * @tc.desc   getThumbnail(video) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_012', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_promise_012';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      await getThumbnailPromise1(done, testNum, fetchOps);
    });

    /**
     * @tc.name   getThumbnail_promise_013
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1300
     * @tc.desc   getThumbnail(video) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_013', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_promise_013';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 128, height: 128
      };
      const expectSize: ESObject = {
        width: 128, height: 128
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_014
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1400
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_014', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_014';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 1, height: 1024
      };
      const expectSize: ESObject = {
        width: 1, height: 1024
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_015
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1500
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_015', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_015';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 1024, height: 1
      };
      const expectSize: ESObject = {
        width: 1024, height: 1
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_016
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1600
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_016', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_016';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 1024, height: 1024
      };
      const expectSize: ESObject = {
        width: 1024, height: 1024
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_017
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1700
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_017', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_017';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 1, height: 1
      };
      const expectSize: ESObject = {
        width: 1, height: 1
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_018
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1800
     * @tc.desc   getThumbnail(video) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_018', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_018';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: undefined, height: 128
      };
      const expectSize: ESObject = {
        width: 256, height: 128
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_019
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1900
     * @tc.desc   getThumbnail(video) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_019', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_019';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 128, height: undefined
      };
      const expectSize: ESObject = {
        width: 128, height: 256
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_020
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_2000
     * @tc.desc   getThumbnail(video) by undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_020', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_020';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = undefined;
      const expectSize: ESObject = {
        width: 256, height: 256
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_021
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_2100
     * @tc.desc   getThumbnail(video) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_021', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_021';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 0, height: 0
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.name   getThumbnail_promise_022
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_2200
     * @tc.desc   getThumbnail(video) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_022', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_022';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: -1, height: -1
      };
      await getThumbnailPromiseNormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.name   getThumbnail_promise_023
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_2300
     * @tc.desc   getThumbnail(video) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_023', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_023';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.mp4');
      const size: ESObject = {
        width: 99999, height: 99999
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
    });
  })
}
