/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, Level, beforeEach, afterAll, afterEach } from '@ohos/hypium'
import {
  getPermission, driveFn, sleep, LOG_TAG, isEmpty
} from '../common'
import common from '@ohos.app.ability.common'
import { dataSharePredicates } from '@kit.ArkData';
import { JSON, uri } from '@kit.ArkTS';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { Driver, MatchPattern, ON } from '@kit.TestKit';

const TAG = LOG_TAG + 'PhotoGetAssetsSupp';

export async function getFd(pathName: string) {
  console.info(TAG, 'case come in getFd');
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  pathName = testContext.filesDir + "/" + pathName;
  console.log(TAG, 'pathName =' + pathName);
  let file = await fs.openSync(pathName);
  let fdNumber = file.fd;
  console.info(TAG, 'case getFd number is: ' + fdNumber);
  return fdNumber;
}

export default function PhotoGetAssetsTestSupp() {
  describe('PhotoGetAssetsTestSupp', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let PhAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let driver: Driver | undefined = Driver.create();
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(500);
      AppStorage.setOrCreate('emptyString', '');
    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('emptyString');
    });

    /**
     * @tc.number    SUB_PHOTO_VIEW_PICKER_SELECT_CALLBACK_00001
     * @tc.name      SUB_PHOTO_VIEW_PICKER_SELECT_CALLBACK_00001
     * @tc.desc      PhotoViewPicker.select-参数属性覆盖-true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_VIEW_PICKER_SELECT_CALLBACK_00001', Level.LEVEL0, async (done: Function) => {
      let testName= 'SUB_PHOTO_VIEW_PICKER_SELECT_CALLBACK_00001';
      try {
        let photoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
        photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
        photoSelectOptions.maxSelectNumber = 5;
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoSelectOptions.isEditSupported = true;
        photoSelectOptions.isOriginalSupported = true;
        photoSelectOptions.isDestroyedWithNavigation = true;
        photoSelectOptions.isReturnToPhotoBrowserEnabled = true;
        photoSelectOptions.subWindowName = "";
        photoSelectOptions.completeButtonText = 0;
        let phAsset = {albumUri :'',displayName:'',gridLevel:0} as photoAccessHelper.ContextRecoveryInfo;
        photoPicker.select(photoSelectOptions, (err: BusinessError, photoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info(TAG,testName,'PhotoViewPicker.select successfully, photoSelectResult uri: ' + JSON.stringify(photoSelectResult));
          expect(isEmpty(photoSelectResult)).assertFalse();
          done();
        });
        await sleep(3000);
        await driver?.click(400,550)
        await sleep(3000);
        let power = await driver?.waitForComponent(ON.text('完成', MatchPattern.EQUALS), 500);
        await power?.click();
      }
      catch (error) {
        console.error(TAG,`${testName} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_PHOTO_VIEW_PICKER_SELECT_CALLBACK_00002
     * @tc.name      SUB_PHOTO_VIEW_PICKER_SELECT_CALLBACK_00002
     * @tc.desc      PhotoViewPicker.select-第一个参数为null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_VIEW_PICKER_SELECT_CALLBACK_00002', Level.LEVEL0, async (done: Function) => {
      let testName= 'SUB_PHOTO_VIEW_PICKER_SELECT_CALLBACK_00002';
      try {
        let photoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
        photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
        photoSelectOptions.maxSelectNumber = 5;
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(null, (err: BusinessError, photoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info(TAG,testName,'PhotoViewPicker.select successfully, photoSelectResult uri: ' + JSON.stringify(photoSelectResult));
          expect().assertFail();
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testName} failed; error: ${error.code}`,JSON.stringify(error));
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_001
     * @tc.desc   PhotoAccessHelper.getAssets 属性fetchColumns''场景覆盖-13900020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let PhAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [''],
          predicates: predicates
        };
        PhAccessHelper.getAssets(fetchOptions, async () => {
          console.info(TAG, 'fetchResult success');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} - 测试失败：error=${error}, code=${error?.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_002
     * @tc.desc   PhotoAccessHelper.getAssets-null-14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let PhAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        PhAccessHelper.getAssets(null, async () => {
          console.info(TAG, 'fetchResult success');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} - 测试失败：error=${error}, code=${error?.code}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_003
     * @tc.desc   PhotoAccessHelper.getAssets-undefined-14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_CALLBACK_003';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let PhAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        PhAccessHelper.getAssets(undefined, async () => {
          console.info(TAG, 'fetchResult success');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} - 测试失败：error=${error}, code=${error?.code}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_001
     * @tc.desc   phAccessHelper.getAssets 属性fetchColumns''场景覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_001';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        await PhAccessHelper.getAssets(fetchOptions);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} - 测试失败：error=${error}, code=${error?.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_002
     * @tc.desc   phAccessHelper.getAssets   null 入参为null场景覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_002';
      try {
        await PhAccessHelper.getAssets(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} - 测试失败：error=${error}, code=${error?.code}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_003
     * @tc.desc   phAccessHelper.getAssets   undefined 入参为undefined场景覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_PROMISE_003';
      try {
        await PhAccessHelper.getAssets(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} - 测试失败：error=${error}, code=${error?.code}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_001
     * @tc.number SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_001
     * @tc.desc   AbsAlbum.getAssets 属性fetchColumns[]场景覆盖-14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_001';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let albumFetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
            albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        album.getAssets(fetchOptions, (err, albumFetchResult) => {
          if (albumFetchResult !== undefined) {
            console.info(TAG, 'album getAssets successfully, getCount: ' + albumFetchResult.getCount());
            done();
          } else {
            console.error(TAG, `album getAssets failed with error: ${err.code}, ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, `${testName} - 测试失败：error=${error}, code=${error?.code}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_002
     * @tc.number SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_002
     * @tc.desc   AbsAlbum.getAssets 属性fetchColumns非空数组场景覆盖-13900020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_002';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let albumFetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri', 'title'],
          predicates: predicates
        };
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri', 'title'],
          predicates: predicates
        };
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
            albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        album.getAssets(fetchOptions, (err, albumFetchResult) => {
          if (albumFetchResult !== undefined) {
            console.info(TAG, 'album getAssets successfully, getCount: ' + albumFetchResult.getCount());
            done();
          } else {
            console.error(TAG, `album getAssets failed with error: ${err.code}, ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, `${testName} - 测试失败：error=${error}, code=${error?.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_003
     * @tc.number SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_003
     * @tc.desc   AbsAlbum.getAssets 属性fetchColumns空值""场景覆盖-13900020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_ABS_ALBUM_GET_ASSETS_CALLBACK_003';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let albumFetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [''],
          predicates: predicates
        };
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [''],
          predicates: predicates
        };
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
            albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        album.getAssets(fetchOptions, (err, albumFetchResult) => {
          if (albumFetchResult !== undefined) {
            console.info(TAG, 'album getAssets successfully, getCount: ' + albumFetchResult.getCount());
            done();
          } else {
            console.error(TAG, `album getAssets failed with error: ${err.code}, ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, `${testName} - 测试失败：error=${error}, code=${error?.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_ABS_ALBUM_GET_ASSETS_PROMISE_001
     * @tc.number SUB_ABS_ALBUM_GET_ASSETS_PROMISE_001
     * @tc.desc   AbsAlbum.getAssets 属性fetchColumns空值""场景覆盖-13900020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABS_ALBUM_GET_ASSETS_PROMISE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_ABS_ALBUM_GET_ASSETS_PROMISE_001';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let albumFetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [''],
          predicates: predicates
        };
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [''],
          predicates: predicates
        };
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
            albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        album.getAssets(fetchOptions).then((albumFetchResult) => {
          console.info(TAG, 'album getAssets successfully, getCount: ' + albumFetchResult.getCount());
        }).catch((err: BusinessError) => {
          console.error(TAG, `album getAssets failed with error: ${err.code}, ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, `${testName} - 测试失败：error=${error}, code=${error?.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_001
     * @tc.desc   PhotoAccessHelper.getBurstAssets属性fetchColumns空值""场景覆盖-13900020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_001';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      let burstKey: string = "e719d696-09fa-44f8-8e9e-ec3f215aa62a";
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await
        PhAccessHelper.getBurstAssets(burstKey, fetchOptions);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} - getBurstAssets failed, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_002
     * @tc.desc   PhotoAccessHelper.getBurstAssets属性fetchColumns非空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_002';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      let burstKey: string = "e719d696-09fa-44f8-8e9e-ec3f215aa62a";
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await
        PhAccessHelper.getBurstAssets(burstKey, fetchOptions);
        expect(isEmpty(fetchResult)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, `${testName} - getBurstAssets failed, error: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_003
     * @tc.desc   PhotoAccessHelper.getBurstAssets-14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_PROMISE_003';
      let burstKey: string = "e719d696-09fa-44f8-8e9e-ec3f215aa62a";
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await
        PhAccessHelper.getBurstAssets(burstKey, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} - getBurstAssets failed, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_001
     * @tc.desc   PhotoAccessHelper.createAssets-第三个参数属性subtype枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_001';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      let extension: string = 'jpg';
      let options: photoAccessHelper.CreateOptions = {
        title: 'testPhoto',
        subtype: photoAccessHelper.PhotoSubtype.BURST
      }
      try {
        PhAccessHelper.createAsset(photoType, extension, options, (error) => {
          console.info(TAG, testName, 'createAsset successfully');
          expect(error == undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_002
     * @tc.desc   PhotoAccessHelper.createAssets-第三个参数属性subtype枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_002';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      let extension: string = 'jpg';
      let options: photoAccessHelper.CreateOptions = {
        title: 'testPhoto',
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      }
      try {
        PhAccessHelper.createAsset(photoType, extension, options, (error) => {
          console.info(TAG, testName, 'createAsset successfully');
          expect(error == undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_003
     * @tc.desc   PhotoAccessHelper.createAssets-第三个参数属性subtype枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_003';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      let extension: string = 'jpg';
      let options: photoAccessHelper.CreateOptions = {
        title: 'testPhoto',
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT
      }
      try {
        PhAccessHelper.createAsset(photoType, extension, options, (error) => {
          console.info(TAG, testName, 'createAsset successfully');
          expect(error == undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_004
     * @tc.desc   PhotoAccessHelper.createAssets-第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_004';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      let options: photoAccessHelper.CreateOptions = {
        title: 'testPhoto',
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT
      }
      try {
        PhAccessHelper.createAsset(photoType, null, options, (error) => {
          console.info(TAG, testName, 'createAsset successfully');
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_005
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_005
     * @tc.desc   PhotoAccessHelper.createAssets-第二个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_005';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      let options: photoAccessHelper.CreateOptions = {
        title: 'testPhoto',
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT
      }
      try {
        PhAccessHelper.createAsset(photoType, undefined, options, (error) => {
          console.info(TAG, testName, 'createAsset successfully');
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_006
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_006
     * @tc.desc   PhotoAccessHelper.createAssets-第二个参数为""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_006';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      let options: photoAccessHelper.CreateOptions = {
        title: 'testPhoto',
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT
      }
      try {
        PhAccessHelper.createAsset(photoType, "", options, (error) => {
          console.info(TAG, testName, 'createAsset successfully');
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_007
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_007
     * @tc.desc   PhotoAccessHelper.createAssets-401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_OPTIONS_007';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      let extension: string = 'txt';
      let options: photoAccessHelper.CreateOptions = {
        title: 'testPhoto',
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT
      }
      try {
        PhAccessHelper.createAsset(photoType, extension, options, (error) => {
          console.info(TAG, testName, 'createAsset successfully');
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_001
     * @tc.desc   PhotoAccessHelper.createAssets-第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_001';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      try {
        PhAccessHelper.createAsset(photoType, null, () => {
          console.info(TAG, testName, 'createAsset successfully');
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_002
     * @tc.desc   PhotoAccessHelper.createAssets-第二个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_002';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      try {
        PhAccessHelper.createAsset(photoType, undefined, () => {
          console.info(TAG, testName, 'createAsset successfully');
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_003
     * @tc.desc   PhotoAccessHelper.createAssets-第二个参数为""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_003';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      try {
        PhAccessHelper.createAsset(photoType, "", () => {
          console.info(TAG, testName, 'createAsset successfully');
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_004
     * @tc.desc   PhotoAccessHelper.createAssets-13900020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_CALLBACK_004';
      let photoType: photoAccessHelper.PhotoType = null as ESObject;
      let extension: string = "jpg";
      try {
        PhAccessHelper.createAsset(photoType, extension, (error) => {
          console.info(TAG, testName, 'createAsset successfully');
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_001
     * @tc.desc   PhotoAccessHelper.createAssets-第3个参数属性subtype枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_001';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
        }
        let uri: string = await PhAccessHelper.createAsset(photoType, extension, options);
        console.info(TAG, testName, 'createAsset uri ' + uri);
        console.info(TAG, testName, 'createAsset successfully');
        expect(uri.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_002
     * @tc.desc   PhotoAccessHelper.createAssets-第3个参数属性subtype枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_002';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT
        }
        let uri: string = await PhAccessHelper.createAsset(photoType, extension, options);
        console.info(TAG, testName, 'createAsset uri ' + uri);
        console.info(TAG, testName, 'createAsset successfully');
        expect(uri.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_003
     * @tc.desc   PhotoAccessHelper.createAssets-第3个参数属性subtype枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_003';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: photoAccessHelper.PhotoSubtype.BURST
        }
        let uri: string = await PhAccessHelper.createAsset(photoType, extension, options);
        console.info(TAG, testName, 'createAsset uri ' + uri);
        console.info(TAG, testName, 'createAsset successfully');
        expect(uri.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_004
     * @tc.desc   PhotoAccessHelper.createAssets-第2个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_004';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = null as ESObject;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: photoAccessHelper.PhotoSubtype.BURST
        }
        let uri: string = await PhAccessHelper.createAsset(photoType, extension, options);
        console.info(TAG, testName, 'createAsset uri ' + uri);
        console.info(TAG, testName, 'createAsset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_005
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_005
     * @tc.desc   PhotoAccessHelper.createAssets-第2个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_005';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = undefined as ESObject;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: photoAccessHelper.PhotoSubtype.BURST
        }
        let uri: string = await PhAccessHelper.createAsset(photoType, extension, options);
        console.info(TAG, testName, 'createAsset uri ' + uri);
        console.info(TAG, testName, 'createAsset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_006
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_006
     * @tc.desc   PhotoAccessHelper.createAssets-第2个参数""覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_006';
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = "";
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: photoAccessHelper.PhotoSubtype.BURST
        }
        let uri: string = await PhAccessHelper.createAsset(photoType, extension, options);
        console.info(TAG, testName, 'createAsset uri ' + uri);
        console.info(TAG, testName, 'createAsset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_007
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_007
     * @tc.desc   PhotoAccessHelper.createAssets-13900020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_ASSETS_PROMISE_007';
      try {
        let photoType: photoAccessHelper.PhotoType = null as ESObject;
        let extension: string = "jpg";
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: photoAccessHelper.PhotoSubtype.BURST
        }
        let uri: string = await PhAccessHelper.createAsset(photoType, extension, options);
        console.info(TAG, testName, 'createAsset uri ' + uri);
        console.info(TAG, testName, 'createAsset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createAsset failed002, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_001
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数属性fetchColumns空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_001';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('album_name', 'newAlbumName');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          fetchOptions, async (fetchResult) => {
            expect(isEmpty(fetchResult)).assertFalse();
          });
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_002
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数属性fetchColumns非空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_002';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('album_name', 'newAlbumName');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri'],
          predicates: predicates
        };
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          fetchOptions, async (fetchResult) => {
            expect(isEmpty(fetchResult)).assertFalse();
          });
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_003
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数属性fetchColumns""覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_003';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('album_name', 'newAlbumName');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [""],
          predicates: predicates
        };
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          fetchOptions, async (fetchResult) => {
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_004
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_004';
      try {
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          null, async (fetchResult) => {
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_005
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_005
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_005';
      try {
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          undefined, async (err, fetchResult) => {
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_006
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_006
     * @tc.desc   PhotoAccessHelper.getAlbums-第1个参数SYSTEM枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_006';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          fetchOptions, async (fetchResult) => {
            expect(isEmpty(fetchResult)).assertFalse();
          });
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_007
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_007
     * @tc.desc   PhotoAccessHelper.getAlbums-第2个参数FAVORITE枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_007';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.FAVORITE,
          fetchOptions, async (fetchResult) => {
            expect(isEmpty(fetchResult)).assertFalse();
          });
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_008
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_008
     * @tc.desc   PhotoAccessHelper.getAlbums-第2个参数VIDEO枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_008';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO,
          fetchOptions, async (fetchResult) => {
            expect(isEmpty(fetchResult)).assertFalse();
          });
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_009
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_009
     * @tc.desc   PhotoAccessHelper.getAlbums-第2个参数IMAGE枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_009';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE,
          fetchOptions, async (fetchResult) => {
            expect(isEmpty(fetchResult)).assertFalse();
          });
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0010
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0010
     * @tc.desc   PhotoAccessHelper.getAlbums-第2个参数ANY枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0010';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,
          fetchOptions, async (fetchResult) => {
            expect(isEmpty(fetchResult)).assertFalse();
          });
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0011
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0011
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数null覆盖 and 第二个参数枚举FAVORITE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0011';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.FAVORITE,
          null, async (fetchResult) => {
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0012
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0012
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数undefined覆盖 and 第二个参数枚举FAVORITE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0012';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.FAVORITE,
          undefined, async (fetchResult) => {
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0013
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0013
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数null覆盖 and 第二个参数枚举VIDEO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0013';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.VIDEO,
          null, async (fetchResult) => {
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0014
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0014
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数undefined覆盖 and 第二个参数枚举VIDEO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0014';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.VIDEO,
          undefined, async (fetchResult) => {
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0015
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0015
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数null覆盖 and 第二个参数枚举IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0015';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.IMAGE,
          null, async (fetchResult) => {
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0016
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0016
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数undefined覆盖 and 第二个参数枚举IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0016';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.IMAGE,
          undefined, async (fetchResult) => {
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0017
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0017
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数null覆盖 and 第二个参数枚举ANY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0017';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY,
          null, async (fetchResult) => {
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0018
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0018
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数undefined覆盖 and 第二个参数枚举ANY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_OPTIONS_0018';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY,
          undefined, async (fetchResult) => {
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_001
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数属性fetchColumns""覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_001';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [""],
          predicates: predicates
        };
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOptions);
          expect().assertFail();
          done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_002
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_002';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, null);
          expect().assertFail();
          done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_003
     * @tc.desc   PhotoAccessHelper.getAlbums-第3个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_PROMISE_003';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, undefined);
          expect().assertFail();
          done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_001
     * @tc.desc   PhotoAccessHelper.registerChange-第1个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_001';
      try {
        let onCallback = (changeData: photoAccessHelper.ChangeData) => {
          console.info('onCallback success, changeData: ' + JSON.stringify(changeData));
        }
        PhAccessHelper.registerChange(null, false, onCallback);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_002
     * @tc.desc   PhotoAccessHelper.registerChange-第1个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_002';
      try {
        let onCallback = (changeData: photoAccessHelper.ChangeData) => {
          console.info('onCallback success, changeData: ' + JSON.stringify(changeData));
        }
        PhAccessHelper.registerChange(undefined, false, onCallback);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_001
     * @tc.desc   PhotoAccessHelper.createDeleteRequest-第1个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_001';
      try {
        PhAccessHelper.createDeleteRequest(null, () => {
        });
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_002
     * @tc.desc   PhotoAccessHelper.createDeleteRequest-第1个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_002';
      try {
        PhAccessHelper.createDeleteRequest(undefined, () => {
        });
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_003
     * @tc.desc   PhotoAccessHelper.createDeleteRequest-第1个参数空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_003';
      try {
        PhAccessHelper.createDeleteRequest([], () => {
        });
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_004
     * @tc.desc   PhotoAccessHelper.createDeleteRequest-非空数组覆盖-13900020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_CALLBACK_004';
      try {
        PhAccessHelper.createDeleteRequest(['sss'], () => {
        });
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_001
     * @tc.desc   PhotoAccessHelper.createDeleteRequest-第1个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_001';
      try {
        await PhAccessHelper.createDeleteRequest(null);
        console.info('createDeleteRequest successfully');
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_002
     * @tc.desc   PhotoAccessHelper.createDeleteRequest-第1个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_002';
      try {
        await PhAccessHelper.createDeleteRequest(undefined);
        console.info('createDeleteRequest successfully');
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_003
     * @tc.desc   PhotoAccessHelper.createDeleteRequest-第1个参数空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_003';
      try {
        await PhAccessHelper.createDeleteRequest([]);
        console.info('createDeleteRequest successfully');
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_004
     * @tc.desc   PhotoAccessHelper.createDeleteRequest-第1个参数非空数组覆盖-13900020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_CREATE_DELETE_REQUEST_PROMISE_004';
      try {
        await PhAccessHelper.createDeleteRequest(["sss"]);
        console.info('createDeleteRequest successfully');
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_001
     * @tc.desc   PhotoAccessHelper.showAssetsCreationDialog-第1个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_001';
      try {
        let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
          {
            title: 'test2',
            fileNameExtension: 'jpg',
            photoType: photoAccessHelper.PhotoType.IMAGE,
            subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
          }
        ];
        let desFileUris: Array<string> = await PhAccessHelper.showAssetsCreationDialog(undefined, photoCreationConfigs);
        console.info('showAssetsCreationDialog success, data is ' + desFileUris);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_002
     * @tc.desc   PhotoAccessHelper.showAssetsCreationDialog-第2个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_002';
      try {
        let srcFileUris: Array<string> = [
          'ssssss'
        ];
        let desFileUris: Array<string> = await PhAccessHelper.showAssetsCreationDialog(srcFileUris, undefined);
        console.info('showAssetsCreationDialog success, data is ' + desFileUris);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_001
     * @tc.desc   PhotoAccessHelper.showAssetsCreationDialogEx-第1个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_001';
      try {
        let srcFileUris: Array<string> = [
          'ssssss'
        ];
        let creationSettings: Array<photoAccessHelper.CreationSetting> = [
          {
            title: 'test2',
            fileNameExtension: 'jpg',
            photoType: photoAccessHelper.PhotoType.IMAGE
          }
        ];
        let desFileUris: Array<string> = await PhAccessHelper.showAssetsCreationDialogEx(null, creationSettings);
        console.info('showAssetsCreationDialogEx success, data is ' + desFileUris);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_002
     * @tc.desc   PhotoAccessHelper.showAssetsCreationDialogEx-第1个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_002';
      try {
        let srcFileUris: Array<string> = [
          'ssssss'
        ];
        let creationSettings: Array<photoAccessHelper.CreationSetting> = [
          {
            title: 'test2',
            fileNameExtension: 'jpg',
            photoType: photoAccessHelper.PhotoType.IMAGE
          }
        ];
        let desFileUris: Array<string> = await PhAccessHelper.showAssetsCreationDialogEx(undefined, creationSettings);
        console.info('showAssetsCreationDialogEx success, data is ' + desFileUris);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_003
     * @tc.desc   PhotoAccessHelper.showAssetsCreationDialogEx-第1个参数空字符串覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_003';
      try {
        let srcFileUris: Array<string> = [
          'ssssss'
        ];
        let creationSettings: Array<photoAccessHelper.CreationSetting> = [
          {
            title: 'test2',
            fileNameExtension: 'jpg',
            photoType: photoAccessHelper.PhotoType.IMAGE
          }
        ];
        let desFileUris: Array<string> =
          await PhAccessHelper.showAssetsCreationDialogEx(AppStorage.get('emptyString'), creationSettings);
        console.info('showAssetsCreationDialogEx success, data is ' + desFileUris);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_004
     * @tc.desc   PhotoAccessHelper.showAssetsCreationDialogEx-第2个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_004';
      try {
        let srcFileUris: Array<string> = [
          'ssssss'
        ];
        let desFileUris: Array<string> = await PhAccessHelper.showAssetsCreationDialogEx(srcFileUris, null);
        console.info('showAssetsCreationDialogEx success, data is ' + desFileUris);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_005
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_005
     * @tc.desc   PhotoAccessHelper.showAssetsCreationDialogEx-第2个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_005';
      try {
        let srcFileUris: Array<string> = [
          'ssssss'
        ];
        let desFileUris: Array<string> = await PhAccessHelper.showAssetsCreationDialogEx(srcFileUris, undefined);
        console.info('showAssetsCreationDialogEx success, data is ' + desFileUris);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_006
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_006
     * @tc.desc   PhotoAccessHelper.showAssetsCreationDialogEx-第2个参数空字符串覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_006';
      try {
        let srcFileUris: Array<string> = [
          'ssssss'
        ];
        let desFileUris: Array<string> =
          await PhAccessHelper.showAssetsCreationDialogEx(srcFileUris, AppStorage.get('emptyString'));
        console.info('showAssetsCreationDialogEx success, data is ' + desFileUris);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_001
     * @tc.name     CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_001
     * @tc.desc     createAssetWithShortTermPermission-第1个参数属性photoType枚举覆盖VIDEO
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_001", Level.LEVEL0, (done: Function) => {
      const testName = "CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_001";
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: '123456',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.VIDEO,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      try {
        let res = PhAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
        console.info(TAG, testName, 'successfully', res);
        expect(isEmpty(res)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermission', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      } finally {
        done();
      }
    });
    /**
     * @tc.number   CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_003
     * @tc.name     CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_003
     * @tc.desc     createAssetWithShortTermPermission-第1个参数属性subtype枚举覆盖BURST
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_003", Level.LEVEL0, (done: Function) => {
      const testName = "CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_003";
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: '123456',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.VIDEO,
        subtype: photoAccessHelper.PhotoSubtype.BURST,
      };
      try {
        let res = PhAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
        console.info(TAG, testName, 'successfully', res);
        expect(isEmpty(res)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermission', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      } finally {
        done();
      }
    });
    /**
     * @tc.number   CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_001
     * @tc.name     CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_001
     * @tc.desc     createAssetWithShortTermPermissionEx-第1个参数属性photoType枚举覆盖VIDEO
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_001", Level.LEVEL0, (done: Function) => {
      const testName = "CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_001";
      let CreationSetting: photoAccessHelper.PhotoCreationConfig = {
        title: '123456',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.VIDEO,
        subtype: photoAccessHelper.PhotoSubtype.BURST,
      };
      try {
        let a = PhAccessHelper.createAssetWithShortTermPermissionEx(CreationSetting);
        console.info(TAG, testName, 'successfully', a);
        expect(CreationSetting != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermissionEx', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      } finally {
        done();
      }
    });
    /**
     * @tc.number   CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_002
     * @tc.name     CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_002
     * @tc.desc     createAssetWithShortTermPermissionEx-第1个参数属性photoType枚举覆盖IMAGE
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_002", Level.LEVEL0, (done: Function) => {
      const testName = "CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_002";
      let CreationSetting: photoAccessHelper.PhotoCreationConfig = {
        title: '123456',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE,
        subtype: photoAccessHelper.PhotoSubtype.BURST,
      };
      try {
        let a = PhAccessHelper.createAssetWithShortTermPermissionEx(CreationSetting);
        console.info(TAG, testName, 'successfully', a);
        expect(CreationSetting != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermissionEx', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      } finally {
        done();
      }
    });
    /**
     * @tc.number   CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_003
     * @tc.name     CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_003
     * @tc.desc     createAssetWithShortTermPermissionEx-第1个参数属性subtype枚举覆盖BURST
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_003", Level.LEVEL0, (done: Function) => {
      const testName = "CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_003";
      let CreationSetting: photoAccessHelper.PhotoCreationConfig = {
        title: 'BURST',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE,
        subtype: photoAccessHelper.PhotoSubtype.BURST,
      };
      try {
        let a = PhAccessHelper.createAssetWithShortTermPermissionEx(CreationSetting);
        console.info(TAG, testName, 'successfully', a);
        expect(CreationSetting != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermissionEx', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      } finally {
        done();
      }
    });

    /**
     * @tc.number   CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_005
     * @tc.name     CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_005
     * @tc.desc     createAssetWithShortTermPermissionEx-第1个参数null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_005", Level.LEVEL0, async (done: Function) => {
      const testName = "CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_005";
      try {
        await PhAccessHelper.createAssetWithShortTermPermissionEx(null);
        console.info(TAG, testName, 'successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermissionEx', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_006
     * @tc.name     CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_006
     * @tc.desc     createAssetWithShortTermPermissionEx-第1个参数undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_006", Level.LEVEL0, async (done: Function) => {
      const testName = "CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_EX_006";
      try {
        await PhAccessHelper.createAssetWithShortTermPermissionEx(undefined);
        console.info(TAG, testName, 'successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermissionEx', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_002
     * @tc.name     SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_002
     * @tc.desc     requestPhotoUrisReadPermission-空数组覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_002";
      try {
        let srcFileUris: Array<string> = [];
        let desFileUris: Array<string> = await PhAccessHelper.requestPhotoUrisReadPermission(srcFileUris);
        console.info(TAG, testName, 'requestPhotoUrisReadPermission success, data is ', JSON.stringify(desFileUris));
        expect(isEmpty(desFileUris)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, 'requestPhotoUrisReadPermission failed', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_APPLY_CHANGES_001
     * @tc.name     SUB_APPLY_CHANGES_001
     * @tc.desc     applyChanges-null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_APPLY_CHANGES_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_APPLY_CHANGES_001";
      try {
        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let assetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        await PhAccessHelper.applyChanges(null);
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
     * @tc.number   SUB_APPLY_CHANGES_002
     * @tc.name     SUB_APPLY_CHANGES_002
     * @tc.desc     applyChanges-undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_APPLY_CHANGES_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_APPLY_CHANGES_002";
      try {
        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let assetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        await PhAccessHelper.applyChanges(undefined);
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
     * @tc.number   SUB_APPLY_CHANGES_003
     * @tc.name     SUB_APPLY_CHANGES_003
     * @tc.desc     applyChanges-空字符串
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_APPLY_CHANGES_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_APPLY_CHANGES_003";
      try {
        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let assetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        await PhAccessHelper.applyChanges(AppStorage.get('emptyString'));
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
     * @tc.number   SUB_DELETE_ASSETS_TEST_004
     * @tc.name     SUB_DELETE_ASSETS_TEST_004
     * @tc.desc     deleteAssets-第二个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_DELETE_ASSETS_TEST_004", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_DELETE_ASSETS_TEST_004";
      try {
        let a = await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, null);
        console.info(TAG, testName, 'deleteAssets successfully', a);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed deleteAssets', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_DELETE_ASSETS_TEST_005
     * @tc.name     SUB_DELETE_ASSETS_TEST_005
     * @tc.desc     deleteAssets-第二个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_DELETE_ASSETS_TEST_005", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_DELETE_ASSETS_TEST_005";
      try {
        let a = await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, undefined);
        console.info(TAG, testName, 'deleteAssets successfully', a);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed deleteAssets', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_DELETE_ASSETS_TEST_006
     * @tc.name     SUB_DELETE_ASSETS_TEST_006
     * @tc.desc     deleteAssets-第二个参数为空字符串
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_DELETE_ASSETS_TEST_006", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_DELETE_ASSETS_TEST_006";
      try {
        let a =
          await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, AppStorage.get('emptyString'));
        console.info(TAG, testName, 'deleteAssets successfully', a);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed deleteAssets', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_001
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_001
     * @tc.desc     getAlbum-第一个参数为null-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_001";
      try {
        PhAccessHelper.getAlbums(null, photoAccessHelper.AlbumSubtype.CAMERA, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_002
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_002
     * @tc.desc     getAlbum-第一个参数为undefined-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_002";
      try {
        PhAccessHelper.getAlbums(undefined, photoAccessHelper.AlbumSubtype.CAMERA, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_003
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_003
     * @tc.desc     getAlbum-第一个参数为undefined-第二个参数为USER_GENERIC-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_003";
      try {
        PhAccessHelper.getAlbums(undefined, photoAccessHelper.AlbumSubtype.USER_GENERIC, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_004
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_004
     * @tc.desc     getAlbum-第一个参数为undefined-第二个参数为FAVORITE-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_004", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_004";
      try {
        PhAccessHelper.getAlbums(undefined, photoAccessHelper.AlbumSubtype.FAVORITE, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_005
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_005
     * @tc.desc     getAlbum-第一个参数为null-第二个参数为IMAGE-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_005", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_005";
      try {
        PhAccessHelper.getAlbums(null, photoAccessHelper.AlbumSubtype.IMAGE, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_006
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_006
     * @tc.desc     getAlbum-第一个参数为null-第二个参数为VIDEO-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_006", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_006";
      try {
        PhAccessHelper.getAlbums(null, photoAccessHelper.AlbumSubtype.VIDEO, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_007
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_007
     * @tc.desc     getAlbum-第二个参数为null-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_007", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_007";
      try {
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, null, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_008
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_008
     * @tc.desc     getAlbum-第二个参数为undefined-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_008", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_008";
      try {
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, undefined, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_009
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_009
     * @tc.desc     getAlbum-SYSTEM-第二个参数为undefined-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_009", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_009";
      try {
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, undefined, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_0010
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_0010
     * @tc.desc     getAlbum-SOURCE-第二个参数为undefined-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_0010", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_0010";
      try {
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SOURCE, undefined, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_0011
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_0011
     * @tc.desc     getAlbum-SMART-第二个参数为null-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_0011", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_0011";
      try {
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SMART, null, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_CALLBACK_TEST_0012
     * @tc.name     SUB_GET_ALBUM_CALLBACK_TEST_0012
     * @tc.desc     getAlbum-SOURCE-第二个参数为null-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_CALLBACK_TEST_0012", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_CALLBACK_TEST_0012";
      try {
        PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SOURCE, null, async (fetchResult) => {
          console.info(TAG, testName, 'getAlbum successfully');
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumsCallback Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_PHOTO_ASSERT_TEST_001
     * @tc.name     SUB_CREATE_PHOTO_ASSERT_TEST_001
     * @tc.desc     createPhotoAsset-第二个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_PHOTO_ASSERT_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_PHOTO_ASSERT_TEST_001";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let title: string = 'testPhoto';
        let uri: string = await PhAccessHelper.createPhotoAsset(photoType, null, title);
        console.info(TAG, testName, 'createPhotoAsset uri' + uri);
        console.info(TAG, testName, 'createPhotoAsset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_PHOTO_ASSERT_TEST_002
     * @tc.name     SUB_CREATE_PHOTO_ASSERT_TEST_002
     * @tc.desc     createPhotoAsset-第二个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_PHOTO_ASSERT_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_PHOTO_ASSERT_TEST_002";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let title: string = 'testPhoto';
        let uri: string = await PhAccessHelper.createPhotoAsset(photoType, undefined, title);
        console.info(TAG, testName, 'createPhotoAsset uri' + uri);
        console.info(TAG, testName, 'createPhotoAsset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_PHOTO_ASSERT_TEST_003
     * @tc.name     SUB_CREATE_PHOTO_ASSERT_TEST_003
     * @tc.desc     createPhotoAsset-第二个参数为空字符串
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_PHOTO_ASSERT_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_PHOTO_ASSERT_TEST_003";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let title: string = 'testPhoto';
        let uri: string = await PhAccessHelper.createPhotoAsset(photoType, AppStorage.get('emptyString'), title);
        console.info(TAG, testName, 'createPhotoAsset uri' + uri);
        console.info(TAG, testName, 'createPhotoAsset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_PHOTO_ASSERT_TEST_004
     * @tc.name     SUB_CREATE_PHOTO_ASSERT_TEST_004
     * @tc.desc     createPhotoAsset-第三个参数为空字符串
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_PHOTO_ASSERT_TEST_004", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_PHOTO_ASSERT_TEST_004";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let uri: string = await PhAccessHelper.createPhotoAsset(photoType, extension, AppStorage.get('emptyString'));
        console.info(TAG, testName, 'createPhotoAsset uri' + uri);
        console.info(TAG, testName, 'createPhotoAsset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_PHOTO_ASSERT_TEST_005
     * @tc.name     SUB_CREATE_PHOTO_ASSERT_TEST_005
     * @tc.desc     createPhotoAsset-第三个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_PHOTO_ASSERT_TEST_005", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_PHOTO_ASSERT_TEST_005";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let uri: string = await PhAccessHelper.createPhotoAsset(photoType, extension, null);
        console.info(TAG, testName, 'createPhotoAsset uri' + uri);
        console.info(TAG, testName, 'createPhotoAsset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_PHOTO_ASSERT_TEST_006
     * @tc.name     SUB_CREATE_PHOTO_ASSERT_TEST_006
     * @tc.desc     createPhotoAsset-第三个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_PHOTO_ASSERT_TEST_006", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_PHOTO_ASSERT_TEST_006";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let uri: string = await PhAccessHelper.createPhotoAsset(photoType, extension, undefined);
        console.info(TAG, testName, 'createPhotoAsset uri' + uri);
        console.info(TAG, testName, 'createPhotoAsset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed, error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_ID_BY_LPATH_TEST_001
     * @tc.name     SUB_GET_ALBUM_ID_BY_LPATH_TEST_001
     * @tc.desc     getAlbumIdByLpath-null-23800151
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_ID_BY_LPATH_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_ID_BY_LPATH_TEST_001";
      try {
        let albumId: number = await PhAccessHelper.getAlbumIdByLpath(null);
        console.info(TAG, testName, 'requestFile:: albumId: ', albumId);
        console.info(TAG, testName, 'getAlbumIdByLpath completed.');
        console.info(TAG, testName, `albumId : ${albumId}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumIdByLpath Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_ID_BY_LPATH_TEST_002
     * @tc.name     SUB_GET_ALBUM_ID_BY_LPATH_TEST_002
     * @tc.desc     getAlbumIdByLpath-undefined-23800151
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_ID_BY_LPATH_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_ID_BY_LPATH_TEST_002";
      try {
        let albumId: number = await PhAccessHelper.getAlbumIdByLpath(undefined);
        console.info(TAG, testName, 'requestFile:: albumId: ', albumId);
        console.info(TAG, testName, 'getAlbumIdByLpath completed.');
        console.info(TAG, testName, `albumId : ${albumId}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumIdByLpath Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_ID_BY_LPATH_TEST_003
     * @tc.name     SUB_GET_ALBUM_ID_BY_LPATH_TEST_003
     * @tc.desc     getAlbumIdByLpath-empty-23800151
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_ID_BY_LPATH_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_ID_BY_LPATH_TEST_003";
      try {
        let albumId: number = await PhAccessHelper.getAlbumIdByLpath('');
        console.info(TAG, testName, 'requestFile:: albumId: ', albumId);
        console.info(TAG, testName, 'getAlbumIdByLpath completed.');
        console.info(TAG, testName, `albumId : ${albumId}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumIdByLpath Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });

    /**
     * @tc.number   CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_004
     * @tc.name     CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_004
     * @tc.desc     createAssetWithShortTermPermission-第1个参数属性subtype枚举覆盖MOVING_PHOTO
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_004", Level.LEVEL0, (done: Function) => {
      const testName = "CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_004";
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: '123456',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.VIDEO,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO,
      };
      try {
        let res = PhAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
        console.info(TAG, testName, 'successfully', res);
        expect(isEmpty(res)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermission', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      } finally {
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_003
     * @tc.desc   PhotoAccessHelper.registerChange-第1个参数""覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_REGISTER_CHANGE_CALLBACK_003';
      try {
        let isCallbackTriggered = false;
        let onCallback = (changeData: photoAccessHelper.ChangeData) => {
          console.info(TAG,testName,'onCallback success, changeData: ' + JSON.stringify(changeData));
          isCallbackTriggered = true;
        }
        PhAccessHelper.registerChange("", false, onCallback);
        expect(isCallbackTriggered).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_007
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_007
     * @tc.desc   PhotoAccessHelper.showAssetsCreationDialogEx-第1个参数空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_007';
      try {
        let srcFileUris: Array<string> = [];
        let creationSettings: Array<photoAccessHelper.CreationSetting> = [
          {
            title: 'test2',
            fileNameExtension: 'jpg',
            photoType: photoAccessHelper.PhotoType.IMAGE
          }
        ];
        let desFileUris: Array<string> = await PhAccessHelper.showAssetsCreationDialogEx(srcFileUris, creationSettings);
        console.info('showAssetsCreationDialogEx success, data is ' + desFileUris);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_008
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_008
     * @tc.desc   PhotoAccessHelper.showAssetsCreationDialogEx-第2个参数空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_EX_008';
      try {
        let srcFileUris: Array<string> = ['sss'];
        let creationSettings: Array<photoAccessHelper.CreationSetting> = [];
        let desFileUris: Array<string> = await PhAccessHelper.showAssetsCreationDialogEx(srcFileUris, creationSettings);
        console.info('showAssetsCreationDialogEx success, data is ' + desFileUris);
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_002
     * @tc.name     CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_002
     * @tc.desc     createAssetWithShortTermPermission-第1个参数属性photoType枚举覆盖IMAGE
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_002", Level.LEVEL0, (done: Function) => {
      const testName = "CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_002";
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: '123456',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      try {
        let res = PhAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
        console.info(TAG, testName, 'successfully', res);
        expect(isEmpty(res)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermission', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      } finally {
        done();
      }
    });
  })
}