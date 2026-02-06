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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import Want  from '@ohos.app.ability.Want';
import { sleep, Constant } from './Common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import common from '@ohos.app.ability.common';
import { getPermission, driveFn } from '../common';

let phAccessHelper: photoAccessHelper.PhotoAccessHelper;
let predicates: dataSharePredicates.DataSharePredicates;
export default function photoAccessHelperTest() {
  describe('PhotoAccessHelperTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      console.info("getContext", testContext);
      phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      predicates = new dataSharePredicates.DataSharePredicates();
      await getPermission();
      await driveFn();
      await sleep(1000);
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0000
       * @tc.name      : test getAssets basic API by callback
       * @tc.desc      : test getAssets operation: fetchColumns is ['uri'、'media_type'、'subtype'、'display_name']，查询一个照片对象
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level2
       */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0000', Level.LEVEL0, async (done: Function) => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri', 'media_type', 'subtype', 'display_name'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOptions);
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
        done();
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0100
    * @tc.name      : test getAssets basic API by callback
    * @tc.desc      : test getAssets operation: fetchOption的fetchColumns为空情况下，查询一个已经存在的照片对象
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0100', Level.LEVEL1, async (done: Function) => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
          expect(fetchResult).not().assertUndefined();
          expect(fetchResult).not().assertNull();
          done();
        });
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0200
    * @tc.name      : test getAssets basic API by callback
    * @tc.desc      : test getAssets operation: fetchOption为undefined情况下，查询一个已经存在的照片对象
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions | undefined = undefined;
        phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
          expect(fetchResult).assertNull();
          done();
        });
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0300
    * @tc.name      : test getAssets basic API by promise
    * @tc.desc      : test getAssets operation: fetchOption的fetchColumns为空情况下，查询一个已经存在的照片对象
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0300', Level.LEVEL3, async (done: Function) => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOptions);
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
        done();
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0400
    * @tc.name      : test getAssets basic API by promise
    * @tc.desc      : test getAssets operation: fetchOption为undefined情况下，查询一个已经存在的照片对象
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0400', Level.LEVEL3, async (done: Function) => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions | undefined = undefined;
        await phAccessHelper.getAssets(fetchOptions);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0500
    * @tc.name      : test getAssets basic API by promise
    * @tc.desc      : test getAssets operation: fetchOption的displayName正常情况下，查询一个已经存在的照片对象
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0500', Level.LEVEL3, async (done: Function) => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['screenshot_20240805_124506.jpeg'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOptions);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0600
    * @tc.name      : test getAssets basic API by promise
    * @tc.desc      : test getAssets operation: fetchOption的displayName不正常情况下（displayName不带后缀），查询一个照片对象
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0600', Level.LEVEL3, async (done: Function) => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['screenshot_20240805_124506'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOptions);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0700
    * @tc.name      : test getAssets basic API by callback
    * @tc.desc      : test getAssets operation: fetchOption的displayName正常情况下，查询一个已经存在的照片对象
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0700', Level.LEVEL3, async (done: Function) => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['screenshot_20240805_124506'],
          predicates: predicates
        };
        phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0800
    * @tc.name      : test getAssets basic API by callback
    * @tc.desc      : test getAssets operation: fetchOption的displayName不正常情况下（displayName不带后缀），查询一个照片对象
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0800', Level.LEVEL3, async (done: Function) => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['screenshot_20240805_124506'],
          predicates: predicates
        };
        phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0900
    * @tc.name      : test getAssets basic API by callback
    * @tc.desc      : test getAssets operation: fetchColumns is ['uri'、'media_type'、'subtype'、'display_name']，查询一个照片对象
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0900', Level.LEVEL3, async (done: Function) => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri', 'media_type', 'subtype', 'display_name'],
          predicates: predicates
        };
        phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
          expect(fetchResult).not().assertUndefined();
          expect(fetchResult).not().assertNull();
          done();
        });
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1000
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:jpg,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1000', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        console.info('createAsset uri' + uri);
        console.info('createAsset successfully');
        expect(uri).not().assertUndefined();
        expect(uri).not().assertNull();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1100
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation: 创建照片，type:undefined,extension:jpg,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1100', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType | undefined = undefined;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1200
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:123,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1200', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = '123';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1300
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:undefined,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1300', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = '';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1400
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建照片，type:IMAGE,extension:jpg,createOptions：title为undefined, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1400', Level.LEVEL3, async (done: Function) => { //14
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: undefined
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        console.info('createAsset uri' + uri);
        expect(uri).not().assertNull();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1500
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建照片，type:IMAGE,extension:jpg,createOptions：undefined
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1500', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions | undefined = undefined;
        await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1600
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type:VIDEO,extension:mp4,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1600', Level.LEVEL3, async (done: Function) => { //16
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect(uri).not().assertNull();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1700
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type：undefined，extension：mp4，createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1700', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType | undefined = undefined;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1800
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO，extension：123，createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1800', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = '123';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1900
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type:VIDEO,extension:undefined,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1900', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = '';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2000
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO,extension:mp4,createOptions：title为undefined, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2000', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: undefined
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect(uri).not().assertNull();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2100
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO,extension:mp4,createOptions：undefined
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2100', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions | undefined = undefined;
        await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2200
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2200', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let uri: string = await phAccessHelper.createAsset(photoType, extension);
        console.info('createAsset uri' + uri);
        console.info('createAsset successfully');
        expect(uri).not().assertUndefined();
        expect(uri).not().assertNull();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2300
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2300', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let uri: string = await phAccessHelper.createAsset(photoType, extension);
        console.info('createAsset uri' + uri);
        console.info('createAsset successfully');
        expect(uri).not().assertUndefined();
        expect(uri).not().assertNull();
        done();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })


    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2400
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:jpg,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2400', Level.LEVEL3, (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          expect(uri).not().assertUndefined();
          expect(uri).not().assertNull();
          done();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2500
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation: 创建照片，type:undefined,extension:jpg,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2500', Level.LEVEL3, (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType | undefined = undefined;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2600
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:123,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2600', Level.LEVEL3, (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = '123';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
          done();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2700
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:undefined,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2700', Level.LEVEL3, (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string | undefined = undefined;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2800
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建照片，type:IMAGE,extension:jpg,createOptions：title为undefined, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2800', Level.LEVEL3, (done: Function) => { //28
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: undefined
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          expect(uri).not().assertNull();
          done();
        });
      } catch (err) {
        console.error(`createAsset1 failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2900
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建照片，type:IMAGE,extension:jpg,createOptions：undefined
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2900', Level.LEVEL3, (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions | undefined = undefined;
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3000
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建视频，type:VIDEO,extension:mp4,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3000', Level.LEVEL3, (done: Function) => { //30
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          expect(uri).not().assertNull();
          done();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3100
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建视频，type：undefined，extension：mp4，createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3100', Level.LEVEL3, (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType | undefined = undefined;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3200
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO，extension：123，createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3200', Level.LEVEL3, (done: Function) => {
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
      let extension: string = '123';
      let options: photoAccessHelper.CreateOptions = {
        title: 'testNum'
      }
      phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
        expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
        done();
      });
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3300
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建视频，type:VIDEO,extension:undefined,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3300', Level.LEVEL3, (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string | undefined = undefined;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3400
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO,extension:mp4,createOptions：title为undefined, PhotoSubtype为default
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3400', Level.LEVEL3, (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: undefined
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          expect(uri).not().assertNull();
          done();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3500
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO,extension:mp4,createOptions：undefined
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3500', Level.LEVEL3, (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions | undefined = undefined;
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          expect(uri).assertNull();
          done();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3600
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3600', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        phAccessHelper.createAsset(photoType, extension, (err, uri) => {
          expect(uri).not().assertUndefined();
          expect(uri).not().assertNull();
          done();
        });
      } catch (err) {
        console.error(`createAsset failed1, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3700
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3700', Level.LEVEL3, async (done: Function) => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        phAccessHelper.createAsset(photoType, extension, (err, uri) => {
          expect(uri).not().assertUndefined();
          expect(uri).not().assertNull();
          done();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3800
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过albumType.USER和photoAccessHelper.AlbumSubtype.USER_GENERIC获取用户相册(带album_name,fetchOptions)
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3800', Level.LEVEL3, async (done: Function) => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
        fetchOptions).then(async (fetchResult) => {
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
        done();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      });
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3900
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过albumType.USER和photoAccessHelper.AlbumSubtype.USER_GENERIC获取用户相册(不带album_name,fetchOptions)
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3900', Level.LEVEL3, async (done: Function) => {
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC)
        .then(async (fetchResult) => {
          expect(fetchResult).not().assertUndefined();
          expect(fetchResult).not().assertNull();
          done();
        })
        .catch((err: BusinessError) => {
          console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
          expect().assertFail();
          done();
        });
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4000
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过albumType.USER和photoAccessHelper.AlbumSubtype.USER_GENERIC获取用户相册(带album_name,fetchOptions)
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4000', Level.LEVEL3, async (done: Function) => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
        fetchOptions).then(async (fetchResult) => {
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
        done();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      });
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4100
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过albumType.USER和fetchOptions指定album_name获取指定的用户相册
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4100', Level.LEVEL3, async (done: Function) => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
        fetchOptions).then(async (fetchResult) => {
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
        done();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      });
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4200
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过相册类型和相册子类型查询系统相册(VIDEO,FAVORITE)
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4200', Level.LEVEL3, async (done: Function) => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
        fetchOptions).then(async (fetchResult) => {
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
        done();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      });
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4300
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过fetchOptions指定三个用户相册的albumName,并按照album_name升序的情况下，查询对应相册
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4300', Level.LEVEL3, async (done: Function) => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
        fetchOptions).then(async (fetchResult) => {
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
        done();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      });
    })

    /* *
   * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4400
   * @tc.name      : test getAlbums basic API by promise
   * @tc.desc      : test getAlbums operation: 通过fetchOptions指定三个用户相册的albumName,并按照album_name降序的情况下，查询对应相册
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4400', Level.LEVEL3, async (done: Function) => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
        fetchOptions).then(async (fetchResult) => {
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
        done();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      });
    })

  })
}






