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
import {
  photoKeys,
  fetchOption,
  fetchAllOption,
  getFileAsset,
  sleep,
  getPermission,
  driveFn,
  pushCreateAsset,
  albumSubtype,
  albumType,
  createMovingPhoto
} from '../common'
import common from '@ohos.app.ability.common'
import { BusinessError } from '@ohos.base'
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { albumKeys } from '../common.ets'

export default function removeAssetsTest () {
  describe('removeAssetsTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let getAlbum = async (testNum: string, type: photoAccessHelper.AlbumType, subtype: photoAccessHelper.AlbumSubtype, key: string = '', value: string | number = '') => {
      let predicatesAlbum: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      if (key != '') {
        predicatesAlbum.equalTo(key, value);
      }
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
    let getUserAlbum = async (testNum: string, key: string, value: string | number) => {
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(key, value);
      const ops: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      console.info(`${testNum} queryOps: ${key} = ${value}`);
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, ops);
      console.info(`${testNum} user album count is: ${fetchResult.getCount()}`);
      let userAlbum: photoAccessHelper.Album = await fetchResult.getLastObject();
      return userAlbum;
    }

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    const helper:ESObject  = photoAccessHelper.getPhotoAccessHelper(testContext)

    //callback
    /**
     * @tc.name   removeAssets_callback_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0000
     * @tc.desc   user album remove image asset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('removeAssets_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'removeAssets_callback_000';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb01.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);
        // add asset to album will create a new asset
        await album.addAssets([asset]);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        fetchResult.close();
        album.removeAssets([newAsset], async (err:BusinessError) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult:ESObject = await album.getAssets(fetchOps);
              expect(fetchResult.getCount()).assertEqual(0);
              fetchResult.close()
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
    });

    /**
     * @tc.name   removeAssets_callback_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0200
     * @tc.desc   user album remove image&video asset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAssets_callback_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_002';
      try {
        const album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb03.jpg');
        const fetchOps2 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb01.mp4');
        const assetList: Array<photoAccessHelper.PhotoAsset> = new Array();
        const asset1 = await getFileAsset(testContext, testNum, fetchOps1);
        assetList.push(asset1);
        const asset2 = await getFileAsset(testContext, testNum, fetchOps2);
        assetList.push(asset2);
        await album.addAssets(assetList);
        const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchAllOption());
        expect(fetchResult.getCount()).assertEqual(2);
        let albumAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        fetchResult.close();
        // remove video & image
        album.removeAssets(albumAssetList, async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchAllOption());
              expect(fetchResult.getCount()).assertEqual(0);
              fetchResult.close()
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
    });

    /**
     * @tc.name   removeAssets_callback_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0300
     * @tc.desc   user album remove empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAssets_callback_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_003';
      try {
        const album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        album.removeAssets([], async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
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
    });

    /**
     * @tc.name   removeAssets_callback_004
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0400
     * @tc.desc   user album remove undefined array,error code 13900020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAssets_callback_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_004';
      try {
        const album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        album.removeAssets(undefined, async (err) => {
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(error.code === '13900020' || error.code === '401').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   removeAssets_callback_005
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0500
     * @tc.desc   user album image asset twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAssets_callback_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_005';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb04.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);

        await album.addAssets([asset]);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchAllOption());
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await album.removeAssets([newAsset]);
        album.removeAssets([newAsset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   removeAssets_callback_006
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0600
     * @tc.desc   user album remove [123123] array,error code 14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAssets_callback_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_006';
      try {
        const album: ESObject = await helper.createAlbum(testNum);
        album.removeAssets(['123123'], async (err: BusinessError) => {
          expect(false).assertTrue(); 
        })
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(error.code).assertEqual('14000011');
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0700
      * @tc.name   removeAssets_callback_007
      * @tc.desc   remove asset from favorite album,error code 13900020
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_007';
      try {
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.FAVORITE);
        let assetNames: Array<string> = [
          'removeAssets_callback_07.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await asset.setFavorite(true);
        console.info(`${testNum} setFavorite successed`);
        album.removeAssets([asset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(err.code == 13900020).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0800
      * @tc.name   removeAssets_callback_008
      * @tc.desc   remove asset from video album,error code 13900020
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_008';
      try {
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.VIDEO);
        let assetNames: Array<string> = [
          'removeAssets_callback_08.mp4'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(err.code == 13900020).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0900
      * @tc.name   removeAssets_callback_009
      * @tc.desc   remove asset from hidden album,error code 13900020
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_009';
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper.getHiddenAlbums(photoAccessHelper.HiddenPhotosDisplayMode.ASSETS_MODE);
        console.info(testNum + 'album count is : ' + fetchResult.getCount());
        let album: photoAccessHelper.Album = await fetchResult.getLastObject();
        let assetNames: Array<string> = [
          'removeAssets_callback_09.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await asset.setHidden(true);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(err.code == 13900020).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number  SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_1000
      * @tc.name    removeAssets_callback_010
      * @tc.desc    remove asset from trash album,error code 13900020
      * @tc.size    MEDIUM
      * @tc.type    Function
      * @tc.level   Level 2
    */
    it('removeAssets_callback_010', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_010';
      try {
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.TRASH);
        let assetNames: Array<string> = [
          'removeAssets_callback_10.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(err.code == 13900020).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_1100
      * @tc.name   removeAssets_callback_011
      * @tc.desc   remove asset from screenshot album,error code 13900020
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_011', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_011';
      try {
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.SCREENSHOT);
        let assetNames: Array<string> = [
          'removeAssets_callback_11.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(err.code == 13900020).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_1200
      * @tc.name   removeAssets_callback_012
      * @tc.desc   remove asset from camera album,error code 13900020
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_012', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_012';
      try {
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.CAMERA);
        let assetNames: Array<string> = [
          'removeAssets_callback_12.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(err.code == 13900020).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_1300
      * @tc.name   removeAssets_callback_013
      * @tc.desc   remove asset from image album,error code 13900020
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_013', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_013';
      try {
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.IMAGE);
        let assetNames: Array<string> = [
          'removeAssets_callback_13.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(err.code == 13900020).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_1400
      * @tc.name   removeAssets_callback_014
      * @tc.desc   remove asset from cloud enhancement album,error code 13900020
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_014', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_014';
      try {
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.CLOUD_ENHANCEMENT);
        let assetNames: Array<string> = [
          'removeAssets_callback_14.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(err.code == 13900020).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_1500
      * @tc.name   removeAssets_callback_015
      * @tc.desc   remove asset from source enhancement album,error code 13900020
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_015', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_015';
      try {
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        let assetNames: Array<string> = [
          'removeAssets_callback_15.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(err.code == 13900020).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_1600
      * @tc.name   removeAssets_callback_016
      * @tc.desc   remove moving photo asset from user album.
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 0
    */
    it('removeAssets_callback_016', Level.LEVEL0, async (done: Function) => {
      const testNum = 'removeAssets_callback_016';
      try {
        let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        let title: string = 'removeAssets_callback_16';
        let displayName: string = title + '.jpg'
        await createMovingPhoto(testNum, testContext, title)
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await album.addAssets([asset]);
        asset = await getAlbumAssets(testNum, album, photoKeys.DISPLAY_NAME, displayName);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(false).assertTrue();
          } else {
            album = await getAlbum(testNum, albumType.USER, albumSubtype.USER_GENERIC, albumKeys.ALBUM_NAME, testNum);
            const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
            const fetchResult = await album.getAssets(fetchOps);
            console.info(`${testNum} fetchResult count is : ${fetchResult.getCount()}`);
            expect(fetchResult.getCount() == 0).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_1700
      * @tc.name   removeAssets_callback_017
      * @tc.desc   remove trash asset from user album.
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_017', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_017';
      try {
        let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        let assetNames: Array<string> = [
          'removeAssets_callback_17.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await album.addAssets([asset]);
        asset = await getAlbumAssets(testNum, album, photoKeys.DISPLAY_NAME, assetNames[0]);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          console.info(`${testNum} Enter callback `);
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_1800
      * @tc.name   removeAssets_callback_018
      * @tc.desc   remove hidden asset from user album.
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_018', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_018';
      try {
        let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        let assetNames: Array<string> = [
          'removeAssets_callback_18.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await album.addAssets([asset]);
        asset = await getAlbumAssets(testNum, album, photoKeys.DISPLAY_NAME, assetNames[0]);
        await asset.setHidden(true);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          console.info(`${testNum} Enter callback `);
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_1900
      * @tc.name   removeAssets_callback_019
      * @tc.desc   remove permanently deleted asset from user album.
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_019', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_019';
      try {
        let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        let assetNames: Array<string> = [
          'removeAssets_callback_19.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await album.addAssets([asset]);
        asset = await getAlbumAssets(testNum, album, photoKeys.DISPLAY_NAME, assetNames[0]);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
        let tAlbum: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.TRASH);
        await tAlbum.deleteAssets([asset]);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          console.info(`${testNum} Enter callback `);
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(err.code == 14000011).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_2000
      * @tc.name   removeAssets_callback_020
      * @tc.desc   remove asset from user album，the assets that do not exist are placed before the assets that exist.
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 0
    */
    it('removeAssets_callback_020', Level.LEVEL0, async (done: Function) => {
      const testNum = 'removeAssets_callback_020';
      try {
        let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        let assetNames: Array<string> = [
          'removeAssets_callback_201.jpg',
          'removeAssets_callback_202.jpg',
          'removeAssets_callback_203.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        let assetList: Array<photoAccessHelper.PhotoAsset> = [];
        for (let i = 0; i < assetNames.length; i++) {
          await pushCreateAsset(testContext, [assetNames[i]]);
          console.info(`${testNum} ${assetNames[i]} create finished`);
          const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[i]);
          let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
          await album.addAssets([asset]);
          asset = await getAlbumAssets(testNum, album, photoKeys.DISPLAY_NAME, assetNames[i]);
          assetList.push(asset);
          await sleep(100);
        }
        let asset: photoAccessHelper.PhotoAsset = await getAlbumAssets(testNum, album, photoKeys.DISPLAY_NAME, assetNames[0]);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
        let tAlbum: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.TRASH);
        await tAlbum.deleteAssets([asset]);
        console.info(`${testNum} delete asset finished`);
        console.info(`${testNum} start remove asset`);
        album.removeAssets([asset], async (err:BusinessError) => {
          console.info(`${testNum} Enter callback `);
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(err.code == 14000011).assertTrue();
          } else {
            for (let i = 1; i < assetNames.length; i++) {
              album = await getAlbum(testNum, albumType.USER, albumSubtype.USER_GENERIC, albumKeys.ALBUM_NAME, testNum);
              const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[i]);
              const fetchResult = await album.getAssets(fetchOps);
              console.info(`${testNum} ${assetNames[i]} fetchResult count is : ${fetchResult.getCount()}`);
              // expect(fetchResult.getCount() == 0).assertTrue();
              await sleep(100);
            }
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_2100
      * @tc.name   removeAssets_callback_021
      * @tc.desc   remove repeat asset from user album.
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('removeAssets_callback_021', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_021';
      try {
        let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        let assetNames: Array<string> = [
          'removeAssets_callback_21.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await album.addAssets([asset]);
        console.info(`${testNum} start remove asset`);
        asset = await getAlbumAssets(testNum, album, photoKeys.DISPLAY_NAME, assetNames[0]);
        album.removeAssets([asset, asset], async (err:BusinessError) => {
          console.info(`${testNum} Enter callback `);
          if (err) {
            console.info(`${testNum} err: ${err.code}`);
            expect(false).assertTrue();
          } else {
            album = await getAlbum(testNum, albumType.USER, albumSubtype.USER_GENERIC, albumKeys.ALBUM_NAME, testNum);
            const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
            const fetchResult = await album.getAssets(fetchOps);
            console.info(`${testNum} fetchResult count is : ${fetchResult.getCount()}`);
            expect(fetchResult.getCount() == 0).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    //promise
    /**
     * @tc.name   removeAssets_promise_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0000
     * @tc.desc   user album remove image asset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('removeAssets_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'removeAssets_promise_000';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro01.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);

        await album.addAssets([asset]);
        let fetchResult:ESObject = await album.getAssets(fetchOps);
        console.info(`${testNum} count: ${fetchResult.getCount()}`);
        expect(fetchResult.getCount()).assertEqual(1);
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await album.removeAssets([newAsset]);
        fetchResult = await album.getAssets(fetchOps);
        console.info(`${testNum} count: ${fetchResult.getCount()}`);
        expect(fetchResult.getCount()).assertEqual(0);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   removeAssets_promise_002
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0200
     * @tc.desc   user album remove image&video asset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAssets_promise_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_promise_002';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro03.jpg');
        const fetchOps2 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro01.mp4');
        const assetList: Array<photoAccessHelper.PhotoAsset> = new Array();
        const asset1 = await getFileAsset(testContext, testNum, fetchOps1);
        assetList.push(asset1);
        const asset2 = await getFileAsset(testContext, testNum, fetchOps2);
        assetList.push(asset2);

        await album.addAssets(assetList);
        let fetchResult:ESObject = await album.getAssets(fetchAllOption());
        expect(fetchResult.getCount()).assertEqual(2);
        let albumAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        await album.removeAssets(albumAssetList);
        fetchResult = await album.getAssets(fetchAllOption());
        expect(fetchResult.getCount()).assertEqual(0);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   removeAssets_promise_003
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0300
     * @tc.desc   user album remove empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAssets_promise_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_promise_003';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        await album.removeAssets([]);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   removeAssets_promise_004
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0400
     * @tc.desc   user album remove undefined array,error code 13900020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAssets_promise_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_promise_004';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        await album.removeAssets(undefined);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(error.code === '13900020' || error.code === '401').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   removeAssets_promise_005
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0500
     * @tc.desc   remove image asset twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAssets_promise_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_promise_005';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro04.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);

        await album.addAssets([asset]);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchAllOption());
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await album.removeAssets([newAsset]);
        await album.removeAssets([newAsset]);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   removeAssets_promise_006
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0600
     * @tc.desc   user album remove 123123 array,error code 14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAssets_promise_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_promise_006';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        console.log(`${testNum} start`);
        await album.removeAssets([123123]);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(error.code).assertEqual('14000011');
        done();
      }
    });
  })
}
