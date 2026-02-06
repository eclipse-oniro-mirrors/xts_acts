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
import { describe, it, expect, Level } from '@ohos/hypium'
import {
  albumType,
  albumSubtype,
  photoKeys,
  fetchOption,
  pushCreateAsset,
  getFileAsset,
  createMovingPhoto,
  createShootingModeAssetBatch
} from '../common'
import common from '@ohos.app.ability.common'
import { dataSharePredicates } from '@kit.ArkData'

export default function albumGetAssetsTest () {
  describe('albumGetAssetsTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext)
    let getAlbum = async (testNum: string, type: photoAccessHelper.AlbumType, subtype: photoAccessHelper.AlbumSubtype, key: string = '', value: string | number = '') => {
      let predicatesAlbum: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      if (key == '' && value == '') {
        predicatesAlbum.orderByAsc('album_id');
      } else {
        predicatesAlbum.orderByAsc('album_id')
        .equalTo(key, value);
        console.info(testNum + ` ${key} = ${value}`);
      }
      let fetchOptionsAlbum: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicatesAlbum
      };
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
      await helper.getAlbums(type, subtype, fetchOptionsAlbum);
      console.info(testNum + ` get album count is : ${albumFetchResult.getCount()}`);
      let album: photoAccessHelper.Album = await albumFetchResult.getLastObject();
      albumFetchResult.close();
      return album;
    }

    //callback
    /**
     * @tc.name   album_getAssets_callback_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0000
     * @tc.desc   Video album getAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getAssets_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getAssets_callback_000';
      try {
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.VIDEO);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumGetAssetsCb01.mp4');
        album.getAssets(fetchOps, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(fetchResult.getCount()).assertEqual(1);
              fetchResult.close();
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
     * @tc.name   album_getAssets_callback_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0100
     * @tc.desc   album getAssets File that does not exist,error code is 14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_getAssets_callback_001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'album_getAssets_callback_001';
      try {
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.IMAGE);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps: ESObject = 123123;
        album.getAssets(fetchOps, async (err, fetchResult) => {
          fetchResult.close();
        })
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code === '14000011').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   album_getAssets_callback_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0200
     * @tc.desc   album getAssets undefined,error code is 14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_getAssets_callback_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'album_getAssets_callback_002';
      try {
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.IMAGE);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps: ESObject = undefined;
        album.getAssets(fetchOps, async (err, fetchResult) => {
          fetchResult.close();
        })
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code === '14000011').assertTrue();
        done();
      }
    });

    /**
      * @tc.number  SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0300
      * @tc.name    album_getAssets_callback_003
      * @tc.desc    favorite album getAssets
      * @tc.size    MEDIUM
      * @tc.type    Function
      * @tc.level   Level 0
    */
    it('album_getAssets_callback_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getAssets_callback_003';
      try {
        let assetNames: Array<string> = [
          'album_getAssets_callback_03.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await asset.setFavorite(true);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('display_name', assetNames[0])
        .and()
        .equalTo('hidden', 0)
        .orderByAsc('media_type');
        let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['is_favorite'],
            predicates: predicates
        };
        const album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.FAVORITE);
        album.getAssets(fetchOptions, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err.code} ${err.message}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} asset count : ${fetchResult.getCount()}`);
              expect(fetchResult.getCount() == 1).assertTrue();
              fetchResult.close();
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
      * @tc.number  SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0400
      * @tc.name    album_getAssets_callback_004
      * @tc.desc    trash album getAssets
      * @tc.size    MEDIUM
      * @tc.type    Function
      * @tc.level   Level 0
    */
    it('album_getAssets_callback_004', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getAssets_callback_004';
      try {
        let assetNames: Array<string> = [
          'album_getAssets_callback_04.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('display_name', assetNames[0])
        .orderByDesc('media_type');
        let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['is_favorite'],
            predicates: predicates
        };
        const album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.TRASH);
        album.getAssets(fetchOptions, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err.code} ${err.message}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} asset count : ${fetchResult.getCount()}`);
              expect(fetchResult.getCount() == 1).assertTrue();
              fetchResult.close();
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
      * @tc.number  SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0500
      * @tc.name    album_getAssets_callback_005
      * @tc.desc    hidden album getAssets
      * @tc.size    MEDIUM
      * @tc.type    Function
      * @tc.level   Level 0
    */
    it('album_getAssets_callback_005', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getAssets_callback_005';
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper.getHiddenAlbums(photoAccessHelper.HiddenPhotosDisplayMode.ASSETS_MODE);
        console.info(testNum + 'album count is : ' + fetchResult.getCount());
        let album: photoAccessHelper.Album = await fetchResult.getLastObject();
        fetchResult.close();
        let assetNames: Array<string> = [
          'album_getAssets_callback_05.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await asset.setHidden(true);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('display_name', assetNames[0])
        .orderByDesc('media_type')
        .limit(100, 0);
        let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['is_favorite'],
            predicates: predicates
        };
        album.getAssets(fetchOptions, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err.code} ${err.message}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} asset count : ${fetchResult.getCount()}`);
              expect(fetchResult.getCount() == 1).assertTrue();
              fetchResult.close();
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
      * @tc.number  SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0600
      * @tc.name    album_getAssets_callback_006
      * @tc.desc    image album getAssets
      * @tc.size    MEDIUM
      * @tc.type    Function
      * @tc.level   Level 0
    */
    it('album_getAssets_callback_006', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getAssets_callback_006';
      try {
        let assetNames: Array<string> = [
          'album_getAssets_callback_06.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('display_name', assetNames[0])
        .orderByDesc('media_type');
        let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['is_favorite'],
            predicates: predicates
        };
        const album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.IMAGE);
        album.getAssets(fetchOptions, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err.code} ${err.message}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} asset count : ${fetchResult.getCount()}`);
              expect(fetchResult.getCount() == 1).assertTrue();
              fetchResult.close();
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
      * @tc.number  SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0700
      * @tc.name    album_getAssets_callback_007
      * @tc.desc    user album getAssets
      * @tc.size    MEDIUM
      * @tc.type    Function
      * @tc.level   Level 0
    */
    it('album_getAssets_callback_007', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getAssets_callback_007';
      try {
        const album = await helper.createAlbum(testNum);
        let assetNames: Array<string> = [
          'album_getAssets_callback_07.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetNames[0]);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
        await album.addAssets([asset]);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('display_name', assetNames[0])
        .orderByDesc('media_type');
        let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['is_favorite'],
            predicates: predicates
        };
        album.getAssets(fetchOptions, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err.code} ${err.message}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} asset count : ${fetchResult.getCount()}`);
              expect(fetchResult.getCount() == 1).assertTrue();
              fetchResult.close();
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
      * @tc.number  SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0800
      * @tc.name    album_getAssets_callback_008
      * @tc.desc    source album getAssets
      * @tc.size    MEDIUM
      * @tc.type    Function
      * @tc.level   Level 0
    */
    it('album_getAssets_callback_008', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getAssets_callback_008';
      try {
        let assetNames: Array<string> = [
          'album_getAssets_callback_08.jpg'
        ]
        await pushCreateAsset(testContext, assetNames);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('display_name', assetNames[0])
        .in('subtype', [0,10]);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        album.getAssets(fetchOptions, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err.code} ${err.message}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} asset count : ${fetchResult.getCount()}`);
              expect(fetchResult.getCount() == 1).assertTrue();
              fetchResult.close();
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
      * @tc.number  SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0900
      * @tc.name    album_getAssets_callback_009
      * @tc.desc    moving photo album getAssets
      * @tc.size    MEDIUM
      * @tc.type    Function
      * @tc.level   Level 0
    */
    it('album_getAssets_callback_009', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getAssets_callback_009';
      try {
        let assetNames: Array<string> = [
          'album_getAssets_callback_09'
        ]
        let displayName: string = assetNames[0] + '.jpg'
        await createMovingPhoto(testNum, testContext, assetNames[0]);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('display_name', displayName)
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SMART, albumSubtype.SHOOTING_MODE, 'album_name', '4');
        album.getAssets(fetchOptions, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err.code} ${err.message}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} asset count : ${fetchResult.getCount()}`);
              expect(fetchResult.getCount() == 1).assertTrue();
              fetchResult.close();
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
      * @tc.number  SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_1000
      * @tc.name    album_getAssets_callback_010
      * @tc.desc    shooting mode album getAssets
      * @tc.size    MEDIUM
      * @tc.type    Function
      * @tc.level   Level 0
    */
    it('album_getAssets_callback_010', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getAssets_callback_010';
      try {
        let assetNames: Array<string> = [
          'album_getAssets_callback_101.jpg',
          'album_getAssets_callback_102.jpg',
          'album_getAssets_callback_103.jpg',
          'album_getAssets_callback_104.jpg',
          'album_getAssets_callback_105.jpg',
          'album_getAssets_callback_106.jpg',
          'album_getAssets_callback_107.dng',
        ];
        let shootingModeAssets: Array<string> = [
          'stm_renxiang.jpg', 'stm_daguangquan.jpg', 'stm_yejing.jpg',
          'stm_gaoxiangsu.jpg', 'stm_quanjing.jpg', 'stm_zipai.jpg', 'stm_RAW.dng'
        ]
        let shootingModeAlbumNames: Array<string> = ['1', '2', '3', '8', '10', '12', '13'];
        for (let i = 0; i < assetNames.length; i++) {
          await createShootingModeAssetBatch(testNum, testContext, [assetNames[i]], shootingModeAssets[i]);
          let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
          predicates.equalTo('display_name', assetNames[i])
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
          };
          let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SMART, albumSubtype.SHOOTING_MODE, 'album_name', shootingModeAlbumNames[i]);
          console.info(`${testNum} start get ${shootingModeAlbumNames[i]} asset!`);
          album.getAssets(fetchOptions, async (err, fetchResult) => {
            try {
              if (err) {
                console.info(`${testNum} err: ${err.code} ${err.message}`);
                expect(false).assertTrue();
                done();
              } else {
                let asset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
                console.info(`${testNum} asset count : ${fetchResult.getCount()}`);
                expect(fetchResult.getCount() == 1).assertTrue();
                expect(asset.displayName == assetNames[i]).assertTrue();
                fetchResult.close();
              }
            } catch (error) {
              console.info(`${testNum} error: ${error}`);
              done();
            }
          })
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    //promise
    /**
     * @tc.name   album_getAssets_promise_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_0000
     * @tc.desc   Video album getAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getAssets_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getAssets_promise_000';
      try {
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.VIDEO);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumGetAssetsPro01.mp4');
        const curFetchResult = await album.getAssets(fetchOps);
        expect(curFetchResult.getCount()).assertEqual(1);
        curFetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   album_getAssets_promise_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_0100
     * @tc.desc   getAssets File that does not exist album,error code is 14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_getAssets_promise_001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'album_getAssets_promise_001';
      try {
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.IMAGE);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps: ESObject = 123123;
        album.getAssets(fetchOps);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code === '14000011').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   album_getAssets_promise_002
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_0200
     * @tc.desc   album getAssets undefined,error code is 14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_getAssets_promise_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'album_getAssets_promise_002';
      try {
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.IMAGE);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps: ESObject = undefined;
        album.getAssets(fetchOps);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code === '14000011').assertTrue();
        done();
      }
    });
  })
}
