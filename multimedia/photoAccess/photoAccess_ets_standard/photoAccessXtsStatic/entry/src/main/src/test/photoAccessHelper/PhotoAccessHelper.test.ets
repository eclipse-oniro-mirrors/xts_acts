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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll, Hypium } from '../../../../hypium'
import { createUserAlbum, fetchOption, getPermission, LOG_TAG, sleep } from '../common';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { Context } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'getAssetsTest';

export default function getAssetsTest(): void {
  describe('getAssetsTest', () => {
    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
      await createUserAlbum(testContext, TAG, 'PhotoSetTitleTestSupp');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0100
     * @tc.desc   callback, image, fetchColumns -> abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0100';
      console.info(TAG, testName);
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['0'],
          predicates: predicates
        };
        helper!.getAssets(fetchOptions, (error: BusinessError<void> | null,
          fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
          if(error !== undefined){
            expect(error!.code == 13900020).assertTrue();
            done();
          }else if (fetchResult !== undefined) {
            fetchResult.close();
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0200
     * @tc.desc   callback, image, fetchOps -> fetchColumns''覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0200';
      console.info(TAG, testName);
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [''],
          predicates: predicates
        };
        helper!.getAssets(fetchOptions, (error: BusinessError<void> | null,
          fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
          if(error !== undefined){
            expect(error!.code == 13900020).assertTrue();
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0300
     * @tc.desc   callback, image, fetchOps ->fetchColumns空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0300';
      console.info(TAG, testName);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        helper!.getAssets(fetchOptions, (error: BusinessError<void> | null,
          fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
          console.info(TAG, `getAssets success`);
          expect(fetchResult !== undefined).assertTrue();
          fetchResult!.close();
          done();
        });
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0400
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0400
     * @tc.desc   callback, image, fetchOps ->fetchColumns非空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_STATIC_0400';
      console.info(TAG, testName);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      try {
        helper!.getAssets(fetchOptions, (error: BusinessError<void> | null,
          fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
          console.info(TAG, `getAssets success`);
          expect(fetchResult != undefined).assertTrue();
          fetchResult!.close();
          done();
        });
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0100
     * @tc.desc   promise, image, fetchOps -> normal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0100';
      console.info(TAG, testName);
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      let extension: string = 'jpg';
      let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null= photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      let fileUri = testContext.filesDir + '/test_mov_1.jpg';
      if (assetChangeRequest !== null) {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        await helper!.applyChanges(assetChangeRequest);
      }
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult = await helper!.getAssets(fetchOptions);
        console.info(TAG, `getAssets success`);
        expect(fetchResult.getCount() > 0).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0200
     * @tc.desc   promise, image, fetchOps -> abnormal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0200';
      console.info(TAG, testName);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['0'],
        predicates: predicates
      };
      try {
        await helper!.getAssets(fetchOptions);
        console.info(TAG, `getAssets success`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0300
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0300
     * @tc.desc   promise, image, fetchOps -> abnormal fetchColumns and new predicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0300';
      console.info(TAG, testName);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['invalid'],
        predicates: predicates
      };
      try {
        await helper!.getAssets(fetchOptions);
        console.info(TAG, `getAssets success`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0400
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0400
     * @tc.desc   promise, video, fetchOps -> normal video name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0400';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      try {
        let fetchResult = await helper!.getAssets(fetchOptions);
        console.info(TAG, `getAssets success`);
        expect(fetchResult != undefined).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0500
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0500
     * @tc.desc   promise, video, fetchOps -> abnormal fetchColumns空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_STATIC_0500';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        await helper!.getAssets(fetchOptions);
        console.info(TAG, `getAssets success`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0100
     * @tc.desc   burstKey not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let burstKey: string = "666";
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await
        helper!.getBurstAssets(burstKey, fetchOptions);
        console.info(TAG, testName + ' getBurstAssets success, count: ' + fetchResult.getCount());
        expect(fetchResult.getCount() === 0).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0200
     * @tc.desc   burstKey->normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let burstKey: string = "e719d696-09fa-44f8-8e9e-ec3f215aa62a";
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getBurstAssets(burstKey, fetchOptions);
        console.info(TAG, testName + ' getBurstAssets success, count: ' + fetchResult.getCount());
        expect(fetchResult != undefined).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0300
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0300
     * @tc.desc   burstKey->photoKeys获取-normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0300';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let burstKey: string = photoAccessHelper.PhotoKeys.SUM_SIZE;
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await
        helper!.getBurstAssets(burstKey, fetchOptions);
        console.info(TAG, testName + ' getBurstAssets success, count: ' + fetchResult.getCount());
        expect(fetchResult != undefined).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0400
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0400
     * @tc.desc   getBurstAssets-fetchColumns''覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0400';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let burstKey: string = 'e719d696-09fa-44f8-8e9e-ec3f215aa62a';
        await helper!.getBurstAssets(burstKey, fetchOptions);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0100
     * @tc.desc    fetchOps->normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0100';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        try {
          let fetchResult =
            await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE,
              fetchOptions)
          console.info(TAG, testName + ' getBurstAssets success, count: ' + fetchResult.getCount());
          expect(fetchResult != undefined).assertTrue();
          fetchResult.close();
          done();
        } catch (error) {
          console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0200
     * @tc.desc   fetchColumns->''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0200';
        try {
          let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [''],
            predicates: predicates
          };
          let fetchResult = await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE, fetchOptions)
          expect(fetchResult != undefined).assertTrue();
          fetchResult.close();
          done();
        } catch (error) {
          console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0300
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0300
     * @tc.desc   album->fetchColumns-'uri'覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0300';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri'],
          predicates: predicates
        };
        try {
          let fetchResult =
            await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.FAVORITE,
              fetchOptions)
          console.info(TAG, testName + ' getBurstAssets success, count: ' + fetchResult.getCount());
          expect(fetchResult != undefined).assertTrue();
          fetchResult.close();
          done();
        } catch (error) {
          console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0400
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0400
     * @tc.desc   subType-Image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0400', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_OPTION_STATIC_0400';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri'],
          predicates: predicates
        };
        try {
          let fetchResult =
            await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE,
              fetchOptions)
          console.info(TAG, testName + ' getBurstAssets success, count: ' + fetchResult.getCount());
          expect(fetchResult != undefined).assertTrue();
          fetchResult.close();
          done();
        } catch (error) {
          console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number   SUB_MULTMEDIA_SUB_APPLY_CHANGES_STATIC_0100
     * @tc.name     SUB_MULTMEDIA_SUB_APPLY_CHANGES_STATIC_0100
     * @tc.desc     applyChanges-401
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MULTMEDIA_SUB_APPLY_CHANGES_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_MULTMEDIA_SUB_APPLY_CHANGES_STATIC_0100";
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let testFileName: string = '';
        let assetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, testFileName);
        await helper!.applyChanges(assetChangeRequest!);
        console.info(TAG, testName, `applyChanges success:`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0100
     * @tc.desc   promise, image, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0100';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let uri: string = await helper!.createAsset(photoType, extension, options);
        expect(uri.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0200
     * @tc.desc   promise, image, extension->无效extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0200';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'invalid';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let uri: string = await helper!.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0300
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0300
     * @tc.desc   promise, image, extension->extension空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0300';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = '';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let uri: string = await helper!.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0400
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0400
     * @tc.desc   promise, video, extension->extension-mp4-normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0400';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let uri: string = await helper!.createAsset(photoType, extension, options);
        expect(uri.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0500
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0500
     * @tc.desc   promise, video, extension->extension-jpg-401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0500';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let uri: string = await helper!.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0600
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0600
     * @tc.desc   promise, image, with options,normal-subtype-MOVING_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_PROMISE_STATIC_0600';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
        }
        let uri: string = await helper!.createAsset(photoType, extension, options);
        expect(uri.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0100
     * @tc.desc   callback, image, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0100';
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = 'jpg';
          helper!.createAsset(photoType, extension, (error: BusinessError<void> | null, uri: string | undefined) => {
            expect(uri!.length > 0).assertTrue();
            done();
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0200
     * @tc.desc   callback, image, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0200';
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          helper!.createAsset(photoType, 'invalid', (error: BusinessError<void> | null, uri: string | undefined) => {
            if(error !== undefined){
              expect(Number(error!.code)).assertEqual(401);
              done();
            }else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0300
     * @tc.desc   callback, video, extension->mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0300';
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = 'mp4';
          helper!.createAsset(photoType, extension, (error: BusinessError<void> | null, uri: string | undefined) => {
            expect(uri!.length > 0).assertTrue();
            done();
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0400
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0400
     * @tc.desc   callback, video, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0400', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_CALLBACK_STATIC_0400';
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          helper!.createAsset(photoType, 'jpg', (error: BusinessError<void> | null, uri: string | undefined) => {
            if(error !== undefined){
              expect(Number(error!.code)).assertEqual(401);
              done();
            }else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0100
     * @tc.desc   callback, image, with options, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0100';
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let options: photoAccessHelper.CreateOptions = {
            title: 'testPhoto',
          }
          helper!.createAsset(photoType, 'jpg', options,
            (error: BusinessError<void> | null, uri: string | undefined) => {
              expect(uri !== undefined).assertTrue();
              done();
            });
        } catch (error) {
          console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0200
     * @tc.desc   callback, video- extension->mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0200';
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = 'mp4';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testPhoto',
            subtype: photoAccessHelper.PhotoSubtype.DEFAULT
          }
          helper!.createAsset(photoType, extension, options,
            (error: BusinessError<void> | null, uri: string | undefined) => {
              expect(uri!.length > 0).assertTrue();
              done();
            });
        } catch (error) {
          console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
          expect().assertFail();
          done();
        }

      })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0300
     * @tc.desc   callback, image- extension->mp4-401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0300';
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = 'mp4';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testPhoto',
          }
          helper!.createAsset(photoType, extension, options,
            (error: BusinessError<void> | null, uri: string | undefined) => {
              if(error != undefined){
                expect(Number(error.code)).assertEqual(401);
                done();
              }else {
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0400
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0400
     * @tc.desc   callback, video- extension->jpg-401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0400', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_OPT_CALLBACK_STATIC_0400';
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = 'jpg';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testPhoto',
          }
          helper!.createAsset(photoType, extension, options,
            (error: BusinessError<void> | null, uri: string | undefined) => {
              if(error != undefined){
                expect(Number(error.code)).assertEqual(401);
                done();
              }else {
                expect().assertFail();
                done();
              }
            })
        } catch (error) {
          console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_STATIC_0100
     * @tc.desc   callback, System-Image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_STATIC_0100';
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE,
          (err: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult != undefined).assertTrue();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_STATIC_0200
     * @tc.desc   callback, SYSTEM-FAVORITE,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_STATIC_0200';
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.FAVORITE,
          (err: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult != undefined).assertTrue();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPT_CALLBACK_STATIC_0100
     * @tc.desc   callback, fetchColumns->空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPT_CALLBACK_STATIC_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPT_CALLBACK_STATIC_0100';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        try {
          helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE, fetchOptions,
            (error: BusinessError<void> | null, fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
              expect(fetchResult !== undefined).assertTrue();
              done();
            });
        } catch (error) {
          console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPT_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPT_CALLBACK_STATIC_0200
     * @tc.desc   callback,, fetchColumns->非空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPT_CALLBACK_STATIC_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPT_CALLBACK_STATIC_0200';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri'],
          predicates: predicates
        };
        try {
          helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE, fetchOptions,
            (error: BusinessError<void> | null, fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
              expect(fetchResult !== undefined).assertTrue();
              done();
            });
        } catch (error) {
          console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_STATIC_0100
     * @tc.desc   PhotoAccessHelper.registerChange-normal-返回值属性覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_STATIC_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_STATIC_0100';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        try {
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await helper!.getAssets(fetchOptions);
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          let isCallbackTriggered = false;
          let onCallback = (changeData: photoAccessHelper.ChangeData) => {
            console.info(TAG, testName, 'onCallback success, changeData111: ' + JSON.stringify(changeData));
            isCallbackTriggered = true;
            expect(changeData.type == 1).assertTrue();
            expect(changeData.uris.length > 0).assertTrue();
            expect(changeData.extraUris != undefined).assertTrue();
            expect(changeData.sharedPhotoAssets != undefined).assertTrue();
            expect(changeData.sharedAlbumAssets != undefined).assertTrue();
            expect(changeData.sharedExtraPhotoAssets != undefined).assertTrue();
            done();
          }
          helper!.registerChange(photoAsset.uri, false, onCallback);
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
            new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
          let newTitle: string = 'newTitle22';
          assetChangeRequest.setTitle(newTitle);
          await helper!.applyChanges(assetChangeRequest);
          await sleep(1000)
          helper!.unRegisterChange(photoAsset.uri, onCallback);
          expect(isCallbackTriggered).assertTrue();
        } catch (error) {
          console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_STATIC_0100
     * @tc.desc   PhotoAccessHelper.unRegisterChange-第一个参数''覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_STATIC_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_STATIC_0100';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        try {
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await helper!.getAssets(fetchOptions);
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          let isCallbackTriggered = false;
          let onCallback1 = (changeData: photoAccessHelper.ChangeData) => {
            isCallbackTriggered = true;
            console.info(TAG, testName, 'onCallback1 on', changeData.type);
            expect(changeData.type === 1).assertTrue();
            done();
          }
          helper!.registerChange(photoAsset.uri, false, onCallback1);
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
            new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
          let newTitle: string = 'newTitle22';
          assetChangeRequest.setTitle(newTitle);
          await helper!.applyChanges(assetChangeRequest);
          await sleep(1000)
          helper!.unRegisterChange(photoAsset.uri, onCallback1);
          expect(isCallbackTriggered).assertTrue();
          done();
        } catch (error) {
          console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.name   SUB_MULTMEDIA_ON_PHOTO_ALBUM_CHANGE_STATIC_0100
     * @tc.number SUB_MULTMEDIA_ON_PHOTO_ALBUM_CHANGE_STATIC_0100
     * @tc.desc   PhotoAccessHelper.on_photoAlbumChange-返回值所有属性覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_ON_PHOTO_ALBUM_CHANGE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_ON_PHOTO_ALBUM_CHANGE_STATIC_0100';
      let onCallback = (changeData: photoAccessHelper.AlbumChangeInfos) => {
        console.info(TAG, testName, ' album onCallback success, changData: ' + JSON.stringify(changeData));
        expect(changeData.type == 0).assertTrue();
        expect(changeData.albumChangeDatas != undefined).assertTrue();
        expect(changeData.isForRecheck).assertFalse();
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        helper!.onPhotoAlbumChange(onCallback);
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName' + new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        helper!.offPhotoAlbumChange(onCallback);
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect().assertFail()
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_OFF_PHOTO_ALBUM_CHANGE_STATIC_0100
     * @tc.number SUB_MULTMEDIA_OFF_PHOTO_ALBUM_CHANGE_STATIC_0100
     * @tc.desc   PhotoAccessHelper.off_photoAlbumChange-normal-返回值所有属性覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_OFF_PHOTO_ALBUM_CHANGE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_OFF_PHOTO_ALBUM_CHANGE_STATIC_0100';
      let onCallback = (changeData: photoAccessHelper.AlbumChangeInfos) => {
        console.info(TAG, testName, ' album onCallback success, changData: ' + JSON.stringify(changeData));
        expect(changeData.type == 0).assertTrue();
        expect(changeData.albumChangeDatas != undefined).assertTrue();
        expect(changeData.isForRecheck).assertFalse();
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        helper!.onPhotoAlbumChange(onCallback);
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName' + new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        helper!.offPhotoAlbumChange(onCallback);
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect().assertFail()
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_ON_PHOTO_CHANGE_STATIC_0100
     * @tc.number SUB_MULTMEDIA_ON_PHOTO_CHANGE_STATIC_0100
     * @tc.desc   PhotoAccessHelper.on_photoChange-返回值所有属性覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_ON_PHOTO_CHANGE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_ON_PHOTO_CHANGE_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG, testName, 'onCallback success, changData: ' + JSON.stringify(changeData));
        expect(changeData.type == 1).assertTrue();
        expect(changeData.assetChangeDatas != undefined).assertTrue();
        expect(changeData.isForRecheck).assertFalse();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await album.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        helper!.onPhotoChange(onCallback);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(newTitle);
        await helper!.applyChanges(assetChangeRequest);
        await sleep(1000)
        helper!.offPhotoChange(onCallback);
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect().assertFail()
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_OFF_PHOTO_CHANGE_STATIC_0100
     * @tc.number SUB_MULTMEDIA_OFF_PHOTO_CHANGE_STATIC_0100
     * @tc.desc   PhotoAccessHelper.off_photoChange-返回值所有属性覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_OFF_PHOTO_CHANGE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_OFF_PHOTO_CHANGE_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG, testName, 'onCallback success, changData: ' + JSON.stringify(changeData));
        expect(changeData.type == 1).assertTrue();
        expect(changeData.assetChangeDatas != undefined).assertTrue();
        expect(changeData.isForRecheck).assertFalse();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await album.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        helper!.onPhotoChange(onCallback);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(newTitle);
        await helper!.applyChanges(assetChangeRequest);
        await sleep(1000)
        helper!.offPhotoChange(onCallback);
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect().assertFail()
        done();
      }
    });
    /**
     * @tc.number   SUB_MULTMEDIA_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_STATIC_0100
     * @tc.name     SUB_MULTMEDIA_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_STATIC_0100
     * @tc.desc     onSinglePhotoAlbumChange-返回值属性覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MULTMEDIA_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_MULTMEDIA_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_STATIC_0100";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let onCallback = (changeData: photoAccessHelper.AlbumChangeInfos) => {
        console.info(TAG, testName, 'onCallback1 success, changeData: ' + JSON.stringify(changeData));
        expect(changeData.type == 2).assertTrue();
        expect(changeData.isForRecheck).assertFalse();
        expect(changeData.albumChangeDatas != undefined).assertTrue()
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await album.getAssets(fetchOptions);
        helper!.onSinglePhotoAlbumChange(album, onCallback);
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName' + new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        helper!.offSinglePhotoAlbumChange(album, onCallback);
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_MULTMEDIA_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_STATIC_0100
     * @tc.name     SUB_MULTMEDIA_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_STATIC_0100
     * @tc.desc     offSinglePhotoAlbumChange-no prams
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MULTMEDIA_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_MULTMEDIA_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_STATIC_0100";
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let isChange1: boolean = false;
        let onCallback = (changeData: photoAccessHelper.AlbumChangeInfos) => {
          console.info(TAG, testName, 'onCallback1 success, changeData: ' + JSON.stringify(changeData));
          isChange1 = true;
          done();
        }
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await album.getAssets(fetchOptions);
        helper!.onSinglePhotoAlbumChange(album, onCallback);
        helper!.offSinglePhotoAlbumChange();
        expect(!isChange1).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_MULTMEDIA_ON_SINGLE_PHOTO_CHANGE_TEST_STATIC_0100
     * @tc.name     SUB_MULTMEDIA_ON_SINGLE_PHOTO_CHANGE_TEST_STATIC_0100
     * @tc.desc     onSinglePhotoChange-返回值属性覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MULTMEDIA_ON_SINGLE_PHOTO_CHANGE_TEST_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_MULTMEDIA_ON_SINGLE_PHOTO_CHANGE_TEST_STATIC_0100";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG, testName, 'onCallback1 success, changeData: ' + JSON.stringify(changeData));
        expect(changeData.type == 1).assertTrue();
        expect(changeData.isForRecheck).assertFalse();
        expect(changeData.assetChangeDatas != undefined).assertTrue();
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await album.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        helper!.onSinglePhotoChange(asset, onCallback);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(newTitle);
        await helper!.applyChanges(assetChangeRequest);
        helper!.offSinglePhotoChange(asset, onCallback);
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   SUB_MULTMEDIA_OFF_SINGLE_PHOTO_CHANGE_TEST_STATIC_0100
     * @tc.name     SUB_MULTMEDIA_OFF_SINGLE_PHOTO_CHANGE_TEST_STATIC_0100
     * @tc.desc     offSinglePhotoChange-normal
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MULTMEDIA_OFF_SINGLE_PHOTO_CHANGE_TEST_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_MULTMEDIA_OFF_SINGLE_PHOTO_CHANGE_TEST_STATIC_0100";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      let extension: string = 'jpg';
      let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null= photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      let fileUri = testContext.filesDir + '/test_mov_1.jpg';
      if (assetChangeRequest !== null) {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        await helper!.applyChanges(assetChangeRequest);
      }
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG, testName, 'onCallback1 success, changeData: ' + JSON.stringify(changeData));
        expect(changeData.type == 1).assertTrue();
        expect(changeData.isForRecheck).assertFalse();
        expect(changeData.assetChangeDatas != undefined).assertTrue();
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await album.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        helper!.onSinglePhotoChange(asset, onCallback);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(newTitle);
        await helper!.applyChanges(assetChangeRequest);
        helper!.offSinglePhotoChange(asset, onCallback);
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
  })
}